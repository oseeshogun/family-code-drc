# WorkManager / Room: WorkDatabase_Impl is created via reflection
-keep class androidx.work.impl.WorkDatabase_Impl { *; }
-keep class * extends androidx.room.RoomDatabase { *; }
-keep class androidx.work.** { *; }
