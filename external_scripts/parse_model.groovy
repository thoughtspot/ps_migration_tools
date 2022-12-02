#!/usr/bin/env groovy
import com.wisecoders.dbs.schema.Layout
import com.wisecoders.dbs.schema.Project
import com.wisecoders.dbs.schema.ProjectStore
import com.wisecoders.dbs.sql.parser.DDLParser
import groovy.io.FileType
import org.apache.commons.io.FilenameUtils

def env = System.getenv()
String MIGRATION_TOOLS_PATH = env['MIGRATION_TOOLS_PATH']
String PROJECT = env['PROJECT_NAME']
String SOURCE_PLATFORM = env['SOURCE_PLATFORM']
String TARGET_PLATFORM = env['TARGET_PLATFORM']

def convert_sql_2_model = { sql_path, model_path, source_db -> 
    switch (source_db.toUpperCase()) {
        case "FALCON" : {source_db = 'ThoughtSpot'; break;}
    }
    println "Converting sql files in folder "+sql_path+" to target path "+model_path+" for data platform "+source_db
    // Identify all sql files in folder
    def sql_list = []
    new File(sql_path).eachFileRecurse(FileType.FILES) { 
        if (it.name.endsWith('.sql')) {
            sql_list << it
        }
    }

    // Process each sql file
    sql_list.each {
        Project proj = new Project(source_db, source_db);
        StringBuilder sb = new StringBuilder();
        DDLParser parser = new DDLParser(proj, System.out);

        def parse = { buf ->
            if ( buf.length() > 0 ){
                try {
                    // println buf
                    parser.parse( buf )
                    // println "\nDone"
                } catch ( Throwable ex ){
                    println ex.getCause()
                }
            }
        }

        println "Processing SQL file:" + it.path

        def sql_file = new File(it.path)
        def model_file = model_path + sql_file.getName().replaceFirst(~/\.[^\.]+$/, '') + '.dbs'

        boolean ignore_till_end = false;
        sql_file.eachLine { line ->
            line = line.trim();
            boolean apply = false;

            if ( line.startsWith("#") || line.startsWith("/*") || line.startsWith("--") ){
                // ommit comments
            } else if (line.startsWith("ALTER")) {
                // ignore complete statement until ;
                ignore_till_end = !line.endsWith(";")
            } else if ( line.endsWith(";")) {
                if (!ignore_till_end) {  
                    sb.append("\n").append(line.substring(0, line.length()-1));
                    apply = true;
                } else {
                    ignore_till_end = false
                }
            } else if ( line.length() == 0 && (!ignore_till_end)) {
                apply = true;
            } else if (!ignore_till_end) {
                sb.append("\n").append(line);
            }

            if ( apply ) {
                parse( sb.toString() );
                sb.delete(0, sb.length());
            }
        }
        Layout layout = proj.createLayoutIncludeAllTables( PROJECT, true );
        new ProjectStore( proj, new FileWriter(model_file), true, false );

    }
}

println("Executing script parse_model.groovy")
println("MIGRATION_TOOLS_PATH="+MIGRATION_TOOLS_PATH)
println("PROJECT="+PROJECT)
println("SOURCE_PLATFORM="+SOURCE_PLATFORM)
println("TARGET_PLATFORM="+TARGET_PLATFORM)

// Make sure that the name of the target platform matches the name of the platform in DBSchema
convert_sql_2_model(MIGRATION_TOOLS_PATH + "/projects/" +PROJECT.toLowerCase() +"/input/ddl/falcon/",MIGRATION_TOOLS_PATH + "/projects/" +PROJECT.toLowerCase() +"/input/models/falcon/",SOURCE_PLATFORM)
convert_sql_2_model(MIGRATION_TOOLS_PATH + "/projects/" +PROJECT.toLowerCase() +"/input/ddl/target/",MIGRATION_TOOLS_PATH + "/projects/" +PROJECT.toLowerCase() +"/input/models/target/",TARGET_PLATFORM)
