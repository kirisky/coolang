; ModuleID = 'gc.cpp'
source_filename = "gc.cpp"
target datalayout = "e-m:x-p:32:32-i64:64-f80:32-n8:16:32-a:0:32-S32"
target triple = "i386-pc-windows-msvc19.16.27024"

%class.GcList = type { %struct.GcObj* }
%struct.GcObj = type { %struct.GcObj*, %struct.GcObj*, %struct.GcObj*, %struct.GcObj*, i8, i8*, i8*, i32, i8*, i8*, %struct.GcPtrsInfo }
%struct.GcPtrsInfo = type { i32, %struct.GcPtrsInfo*, %struct.GcObj* }
%struct.GcRootStack = type { %struct.GcObj***, i32, i32 }
%struct._iobuf = type { i8* }
%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque

$printf = comdat any

$"??0GcList@@QAE@XZ" = comdat any

$"??0GcRootStack@@QAE@XZ" = comdat any

$"??1GcRootStack@@QAE@XZ" = comdat any

$"?UnmarkList@GcList@@QBEXXZ" = comdat any

$"?MarkReachable@GcRootStack@@QBEXXZ" = comdat any

$"?Sweep@GcList@@QAEXXZ" = comdat any

$"?PushFront@GcList@@QAEXPAUGcObj@@@Z" = comdat any

$"?PushRoot@GcRootStack@@QAEXPAPAUGcObj@@@Z" = comdat any

$"?PopRoot@GcRootStack@@QAEXPAPAUGcObj@@@Z" = comdat any

$_vfprintf_l = comdat any

$__local_stdio_printf_options = comdat any

$"?Remove@GcList@@QAEXPAUGcObj@@@Z" = comdat any

$"??_C@_04MDPHBIK@obj?6?$AA@" = comdat any

$"??_C@_0BD@HGGAKDEI@?5?5is_reachable?$DN?$CFd?6?$AA@" = comdat any

$"??_C@_0P@DPHCNOIJ@?5?5typename?$DN?$CFs?6?$AA@" = comdat any

$"??_C@_07DGBOGBKN@gc?5objs?$AA@" = comdat any

$"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" = comdat any

$"??_C@_0BP@CCCNBLIM@Freeing?5an?5object?5of?5type?3?5?$CFs?6?$AA@" = comdat any

$"??_C@_0CP@HIJCJBBI@Tried?5to?5remove?5an?5obj?5that?8s?5no@" = comdat any

$"??_C@_0BN@DLIALJMC@BADBADBADBADBADBADBADBADBAD?6?$AA@" = comdat any

$"??_C@_0CB@NGCPCCJL@Root?5at?5top?5of?5stack?5points?5to?3?6@" = comdat any

$"??_C@_0BL@PDCIMNAE@Root?5to?5remove?5points?5to?3?6?$AA@" = comdat any

@"?gc_is_verbose@@3_NA" = dso_local global i8 0, align 1
@"??_C@_04MDPHBIK@obj?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [5 x i8] c"obj\0A\00", comdat, align 1
@"??_C@_0BD@HGGAKDEI@?5?5is_reachable?$DN?$CFd?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [19 x i8] c"  is_reachable=%d\0A\00", comdat, align 1
@"??_C@_0P@DPHCNOIJ@?5?5typename?$DN?$CFs?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [15 x i8] c"  typename=%s\0A\00", comdat, align 1
@"??_C@_07DGBOGBKN@gc?5objs?$AA@" = linkonce_odr dso_local unnamed_addr constant [8 x i8] c"gc objs\00", comdat, align 1
@"?gc_obj_list@@3PAVGcList@@A" = dso_local global %class.GcList* null, align 4
@"?gc_roots@@3PAUGcRootStack@@A" = dso_local global %struct.GcRootStack* null, align 4
@"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA" = linkonce_odr dso_local global i64 0, comdat, align 8
@"??_C@_0BP@CCCNBLIM@Freeing?5an?5object?5of?5type?3?5?$CFs?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [31 x i8] c"Freeing an object of type: %s\0A\00", comdat, align 1
@"??_C@_0CP@HIJCJBBI@Tried?5to?5remove?5an?5obj?5that?8s?5no@" = linkonce_odr dso_local unnamed_addr constant [47 x i8] c"Tried to remove an obj that's not in list: %s\0A\00", comdat, align 1
@"??_C@_0BN@DLIALJMC@BADBADBADBADBADBADBADBADBAD?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [29 x i8] c"BADBADBADBADBADBADBADBADBAD\0A\00", comdat, align 1
@"??_C@_0CB@NGCPCCJL@Root?5at?5top?5of?5stack?5points?5to?3?6@" = linkonce_odr dso_local unnamed_addr constant [33 x i8] c"Root at top of stack points to:\0A\00", comdat, align 1
@"??_C@_0BL@PDCIMNAE@Root?5to?5remove?5points?5to?3?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [27 x i8] c"Root to remove points to:\0A\00", comdat, align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @"?PrintObj@@YAXPBUGcObj@@@Z"(%struct.GcObj*) #0 {
  %2 = alloca %struct.GcObj*, align 4
  store %struct.GcObj* %0, %struct.GcObj** %2, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @"??_C@_04MDPHBIK@obj?6?$AA@", i32 0, i32 0))
  %4 = load %struct.GcObj*, %struct.GcObj** %2, align 4
  %5 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %4, i32 0, i32 4
  %6 = load i8, i8* %5, align 4
  %7 = trunc i8 %6 to i1
  %8 = zext i1 %7 to i32
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @"??_C@_0BD@HGGAKDEI@?5?5is_reachable?$DN?$CFd?6?$AA@", i32 0, i32 0), i32 %8)
  %10 = load %struct.GcObj*, %struct.GcObj** %2, align 4
  %11 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %10, i32 0, i32 5
  %12 = load i8*, i8** %11, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @"??_C@_0P@DPHCNOIJ@?5?5typename?$DN?$CFs?6?$AA@", i32 0, i32 0), i8* %12)
  ret void
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local i32 @printf(i8*, ...) #0 comdat {
  %2 = alloca i8*, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 4
  store i8* %0, i8** %2, align 4
  %5 = bitcast i8** %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = load i8*, i8** %4, align 4
  %7 = load i8*, i8** %2, align 4
  %8 = call %struct._iobuf* @__acrt_iob_func(i32 1)
  %9 = call i32 @_vfprintf_l(%struct._iobuf* %8, i8* %7, %struct.__crt_locale_pointers* null, i8* %6)
  store i32 %9, i32* %3, align 4
  %10 = bitcast i8** %4 to i8*
  call void @llvm.va_end(i8* %10)
  %11 = load i32, i32* %3, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone
define dso_local void @"?SetNext@@YAXPAUGcObj@@0@Z"(%struct.GcObj*, %struct.GcObj*) #0 {
  %3 = alloca %struct.GcObj*, align 4
  %4 = alloca %struct.GcObj*, align 4
  store %struct.GcObj* %1, %struct.GcObj** %3, align 4
  store %struct.GcObj* %0, %struct.GcObj** %4, align 4
  %5 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %6 = load %struct.GcObj*, %struct.GcObj** %4, align 4
  %7 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %6, i32 0, i32 0
  store %struct.GcObj* %5, %struct.GcObj** %7, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @"?SetPrev@@YAXPAUGcObj@@0@Z"(%struct.GcObj*, %struct.GcObj*) #0 {
  %3 = alloca %struct.GcObj*, align 4
  %4 = alloca %struct.GcObj*, align 4
  store %struct.GcObj* %1, %struct.GcObj** %3, align 4
  store %struct.GcObj* %0, %struct.GcObj** %4, align 4
  %5 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %6 = load %struct.GcObj*, %struct.GcObj** %4, align 4
  %7 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %6, i32 0, i32 1
  store %struct.GcObj* %5, %struct.GcObj** %7, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local %struct.GcObj* @"?GetNext@@YAPAUGcObj@@PAU1@@Z"(%struct.GcObj*) #0 {
  %2 = alloca %struct.GcObj*, align 4
  store %struct.GcObj* %0, %struct.GcObj** %2, align 4
  %3 = load %struct.GcObj*, %struct.GcObj** %2, align 4
  %4 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %3, i32 0, i32 0
  %5 = load %struct.GcObj*, %struct.GcObj** %4, align 4
  ret %struct.GcObj* %5
}

; Function Attrs: noinline nounwind optnone
define dso_local %struct.GcObj* @"?GetPrev@@YAPAUGcObj@@PAU1@@Z"(%struct.GcObj*) #0 {
  %2 = alloca %struct.GcObj*, align 4
  store %struct.GcObj* %0, %struct.GcObj** %2, align 4
  %3 = load %struct.GcObj*, %struct.GcObj** %2, align 4
  %4 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %3, i32 0, i32 1
  %5 = load %struct.GcObj*, %struct.GcObj** %4, align 4
  ret %struct.GcObj* %5
}

; Function Attrs: noinline nounwind optnone
define dso_local i8* @"?ListName@@YAPBDXZ"() #0 {
  ret i8* getelementptr inbounds ([8 x i8], [8 x i8]* @"??_C@_07DGBOGBKN@gc?5objs?$AA@", i32 0, i32 0)
}

; Function Attrs: noinline nounwind optnone
define dso_local void @"?MarkObj@@YAXPAUGcObj@@@Z"(%struct.GcObj*) #0 {
  %2 = alloca %struct.GcObj*, align 4
  %3 = alloca %struct.GcPtrsInfo*, align 4
  %4 = alloca %struct.GcObj**, align 4
  %5 = alloca i32, align 4
  store %struct.GcObj* %0, %struct.GcObj** %2, align 4
  %6 = load %struct.GcObj*, %struct.GcObj** %2, align 4
  %7 = icmp eq %struct.GcObj* %6, null
  br i1 %7, label %13, label %8

; <label>:8:                                      ; preds = %1
  %9 = load %struct.GcObj*, %struct.GcObj** %2, align 4
  %10 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %9, i32 0, i32 4
  %11 = load i8, i8* %10, align 4
  %12 = trunc i8 %11 to i1
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %8, %1
  br label %43

; <label>:14:                                     ; preds = %8
  %15 = load %struct.GcObj*, %struct.GcObj** %2, align 4
  %16 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %15, i32 0, i32 4
  store i8 1, i8* %16, align 4
  %17 = load %struct.GcObj*, %struct.GcObj** %2, align 4
  %18 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %17, i32 0, i32 10
  store %struct.GcPtrsInfo* %18, %struct.GcPtrsInfo** %3, align 4
  br label %19

; <label>:19:                                     ; preds = %39, %14
  %20 = load %struct.GcPtrsInfo*, %struct.GcPtrsInfo** %3, align 4
  %21 = icmp ne %struct.GcPtrsInfo* %20, null
  br i1 %21, label %22, label %43

; <label>:22:                                     ; preds = %19
  %23 = load %struct.GcPtrsInfo*, %struct.GcPtrsInfo** %3, align 4
  %24 = getelementptr inbounds %struct.GcPtrsInfo, %struct.GcPtrsInfo* %23, i32 0, i32 2
  store %struct.GcObj** %24, %struct.GcObj*** %4, align 4
  store i32 0, i32* %5, align 4
  br label %25

; <label>:25:                                     ; preds = %36, %22
  %26 = load i32, i32* %5, align 4
  %27 = load %struct.GcPtrsInfo*, %struct.GcPtrsInfo** %3, align 4
  %28 = getelementptr inbounds %struct.GcPtrsInfo, %struct.GcPtrsInfo* %27, i32 0, i32 0
  %29 = load i32, i32* %28, align 4
  %30 = icmp slt i32 %26, %29
  br i1 %30, label %31, label %39

; <label>:31:                                     ; preds = %25
  %32 = load %struct.GcObj**, %struct.GcObj*** %4, align 4
  %33 = load i32, i32* %5, align 4
  %34 = getelementptr inbounds %struct.GcObj*, %struct.GcObj** %32, i32 %33
  %35 = load %struct.GcObj*, %struct.GcObj** %34, align 4
  call void @"?MarkObj@@YAXPAUGcObj@@@Z"(%struct.GcObj* %35)
  br label %36

; <label>:36:                                     ; preds = %31
  %37 = load i32, i32* %5, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %5, align 4
  br label %25

; <label>:39:                                     ; preds = %25
  %40 = load %struct.GcPtrsInfo*, %struct.GcPtrsInfo** %3, align 4
  %41 = getelementptr inbounds %struct.GcPtrsInfo, %struct.GcPtrsInfo* %40, i32 0, i32 1
  %42 = load %struct.GcPtrsInfo*, %struct.GcPtrsInfo** %41, align 4
  store %struct.GcPtrsInfo* %42, %struct.GcPtrsInfo** %3, align 4
  br label %19

; <label>:43:                                     ; preds = %13, %19
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @gc_system_init(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = call i8* @"??2@YAPAXI@Z"(i32 4) #5
  %4 = bitcast i8* %3 to %class.GcList*
  %5 = call x86_thiscallcc %class.GcList* @"??0GcList@@QAE@XZ"(%class.GcList* %4) #4
  store %class.GcList* %4, %class.GcList** @"?gc_obj_list@@3PAVGcList@@A", align 4
  %6 = call i8* @"??2@YAPAXI@Z"(i32 12) #5
  %7 = bitcast i8* %6 to %struct.GcRootStack*
  %8 = call x86_thiscallcc %struct.GcRootStack* @"??0GcRootStack@@QAE@XZ"(%struct.GcRootStack* %7)
  store %struct.GcRootStack* %7, %struct.GcRootStack** @"?gc_roots@@3PAUGcRootStack@@A", align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i8
  store i8 %11, i8* @"?gc_is_verbose@@3_NA", align 1
  ret void
}

; Function Attrs: nobuiltin
declare dso_local noalias i8* @"??2@YAPAXI@Z"(i32) #1

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc %class.GcList* @"??0GcList@@QAE@XZ"(%class.GcList* returned) unnamed_addr #0 comdat align 2 {
  %2 = alloca %class.GcList*, align 4
  store %class.GcList* %0, %class.GcList** %2, align 4
  %3 = load %class.GcList*, %class.GcList** %2, align 4
  %4 = getelementptr inbounds %class.GcList, %class.GcList* %3, i32 0, i32 0
  store %struct.GcObj* null, %struct.GcObj** %4, align 4
  ret %class.GcList* %3
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc %struct.GcRootStack* @"??0GcRootStack@@QAE@XZ"(%struct.GcRootStack* returned) unnamed_addr #0 comdat align 2 {
  %2 = alloca %struct.GcRootStack*, align 4
  store %struct.GcRootStack* %0, %struct.GcRootStack** %2, align 4
  %3 = load %struct.GcRootStack*, %struct.GcRootStack** %2, align 4
  %4 = call noalias i8* @malloc(i32 8)
  %5 = bitcast i8* %4 to %struct.GcObj***
  %6 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %3, i32 0, i32 0
  store %struct.GcObj*** %5, %struct.GcObj**** %6, align 4
  %7 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %3, i32 0, i32 1
  store i32 2, i32* %7, align 4
  %8 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %3, i32 0, i32 2
  store i32 0, i32* %8, align 4
  ret %struct.GcRootStack* %3
}

; Function Attrs: noinline nounwind optnone
define dso_local void @gc_system_destroy() #0 {
  %1 = load %struct.GcRootStack*, %struct.GcRootStack** @"?gc_roots@@3PAUGcRootStack@@A", align 4
  %2 = icmp eq %struct.GcRootStack* %1, null
  br i1 %2, label %5, label %3

; <label>:3:                                      ; preds = %0
  call x86_thiscallcc void @"??1GcRootStack@@QAE@XZ"(%struct.GcRootStack* %1) #4
  %4 = bitcast %struct.GcRootStack* %1 to i8*
  call void @"??3@YAXPAX@Z"(i8* %4) #6
  br label %5

; <label>:5:                                      ; preds = %3, %0
  %6 = load %class.GcList*, %class.GcList** @"?gc_obj_list@@3PAVGcList@@A", align 4
  %7 = icmp eq %class.GcList* %6, null
  br i1 %7, label %10, label %8

; <label>:8:                                      ; preds = %5
  %9 = bitcast %class.GcList* %6 to i8*
  call void @"??3@YAXPAX@Z"(i8* %9) #6
  br label %10

; <label>:10:                                     ; preds = %8, %5
  ret void
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc void @"??1GcRootStack@@QAE@XZ"(%struct.GcRootStack*) unnamed_addr #0 comdat align 2 {
  %2 = alloca %struct.GcRootStack*, align 4
  store %struct.GcRootStack* %0, %struct.GcRootStack** %2, align 4
  %3 = load %struct.GcRootStack*, %struct.GcRootStack** %2, align 4
  %4 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %3, i32 0, i32 0
  %5 = load %struct.GcObj***, %struct.GcObj**** %4, align 4
  %6 = bitcast %struct.GcObj*** %5 to i8*
  call void @free(i8* %6)
  ret void
}

; Function Attrs: nobuiltin nounwind
declare dso_local void @"??3@YAXPAX@Z"(i8*) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @"?Collect@@YAXXZ"() #0 {
  %1 = load %class.GcList*, %class.GcList** @"?gc_obj_list@@3PAVGcList@@A", align 4
  call x86_thiscallcc void @"?UnmarkList@GcList@@QBEXXZ"(%class.GcList* %1)
  %2 = load %struct.GcRootStack*, %struct.GcRootStack** @"?gc_roots@@3PAUGcRootStack@@A", align 4
  call x86_thiscallcc void @"?MarkReachable@GcRootStack@@QBEXXZ"(%struct.GcRootStack* %2)
  %3 = load %class.GcList*, %class.GcList** @"?gc_obj_list@@3PAVGcList@@A", align 4
  call x86_thiscallcc void @"?Sweep@GcList@@QAEXXZ"(%class.GcList* %3)
  ret void
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc void @"?UnmarkList@GcList@@QBEXXZ"(%class.GcList*) #0 comdat align 2 {
  %2 = alloca %class.GcList*, align 4
  %3 = alloca %struct.GcObj*, align 4
  store %class.GcList* %0, %class.GcList** %2, align 4
  %4 = load %class.GcList*, %class.GcList** %2, align 4
  %5 = getelementptr inbounds %class.GcList, %class.GcList* %4, i32 0, i32 0
  %6 = load %struct.GcObj*, %struct.GcObj** %5, align 4
  store %struct.GcObj* %6, %struct.GcObj** %3, align 4
  br label %7

; <label>:7:                                      ; preds = %10, %1
  %8 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %9 = icmp ne %struct.GcObj* %8, null
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %7
  %11 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %12 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %11, i32 0, i32 4
  store i8 0, i8* %12, align 4
  %13 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %14 = call %struct.GcObj* @"?GetNext@@YAPAUGcObj@@PAU1@@Z"(%struct.GcObj* %13)
  store %struct.GcObj* %14, %struct.GcObj** %3, align 4
  br label %7

; <label>:15:                                     ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc void @"?MarkReachable@GcRootStack@@QBEXXZ"(%struct.GcRootStack*) #0 comdat align 2 {
  %2 = alloca %struct.GcRootStack*, align 4
  %3 = alloca i32, align 4
  store %struct.GcRootStack* %0, %struct.GcRootStack** %2, align 4
  %4 = load %struct.GcRootStack*, %struct.GcRootStack** %2, align 4
  store i32 0, i32* %3, align 4
  br label %5

; <label>:5:                                      ; preds = %17, %1
  %6 = load i32, i32* %3, align 4
  %7 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %4, i32 0, i32 2
  %8 = load i32, i32* %7, align 4
  %9 = icmp slt i32 %6, %8
  br i1 %9, label %10, label %20

; <label>:10:                                     ; preds = %5
  %11 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %4, i32 0, i32 0
  %12 = load %struct.GcObj***, %struct.GcObj**** %11, align 4
  %13 = load i32, i32* %3, align 4
  %14 = getelementptr inbounds %struct.GcObj**, %struct.GcObj*** %12, i32 %13
  %15 = load %struct.GcObj**, %struct.GcObj*** %14, align 4
  %16 = load %struct.GcObj*, %struct.GcObj** %15, align 4
  call void @"?MarkObj@@YAXPAUGcObj@@@Z"(%struct.GcObj* %16)
  br label %17

; <label>:17:                                     ; preds = %10
  %18 = load i32, i32* %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %3, align 4
  br label %5

; <label>:20:                                     ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc void @"?Sweep@GcList@@QAEXXZ"(%class.GcList*) #0 comdat align 2 {
  %2 = alloca %class.GcList*, align 4
  %3 = alloca %struct.GcObj*, align 4
  %4 = alloca %struct.GcObj*, align 4
  store %class.GcList* %0, %class.GcList** %2, align 4
  %5 = load %class.GcList*, %class.GcList** %2, align 4
  %6 = getelementptr inbounds %class.GcList, %class.GcList* %5, i32 0, i32 0
  %7 = load %struct.GcObj*, %struct.GcObj** %6, align 4
  store %struct.GcObj* %7, %struct.GcObj** %3, align 4
  br label %8

; <label>:8:                                      ; preds = %30, %1
  %9 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %10 = icmp ne %struct.GcObj* %9, null
  br i1 %10, label %11, label %32

; <label>:11:                                     ; preds = %8
  %12 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %13 = call %struct.GcObj* @"?GetNext@@YAPAUGcObj@@PAU1@@Z"(%struct.GcObj* %12)
  store %struct.GcObj* %13, %struct.GcObj** %4, align 4
  %14 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %15 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %14, i32 0, i32 4
  %16 = load i8, i8* %15, align 4
  %17 = trunc i8 %16 to i1
  br i1 %17, label %30, label %18

; <label>:18:                                     ; preds = %11
  %19 = load i8, i8* @"?gc_is_verbose@@3_NA", align 1
  %20 = trunc i8 %19 to i1
  br i1 %20, label %21, label %26

; <label>:21:                                     ; preds = %18
  %22 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %23 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %22, i32 0, i32 5
  %24 = load i8*, i8** %23, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @"??_C@_0BP@CCCNBLIM@Freeing?5an?5object?5of?5type?3?5?$CFs?6?$AA@", i32 0, i32 0), i8* %24)
  br label %26

; <label>:26:                                     ; preds = %21, %18
  %27 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  call x86_thiscallcc void @"?Remove@GcList@@QAEXPAUGcObj@@@Z"(%class.GcList* %5, %struct.GcObj* %27)
  %28 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %29 = bitcast %struct.GcObj* %28 to i8*
  call void @free(i8* %29)
  br label %30

; <label>:30:                                     ; preds = %26, %11
  %31 = load %struct.GcObj*, %struct.GcObj** %4, align 4
  store %struct.GcObj* %31, %struct.GcObj** %3, align 4
  br label %8

; <label>:32:                                     ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i8* @gc_malloc(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.GcObj*, align 4
  store i32 %0, i32* %2, align 4
  call void @"?Collect@@YAXXZ"()
  %4 = load i32, i32* %2, align 4
  %5 = call noalias i8* @malloc(i32 %4)
  %6 = bitcast i8* %5 to %struct.GcObj*
  store %struct.GcObj* %6, %struct.GcObj** %3, align 4
  %7 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %8 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %7, i32 0, i32 0
  store %struct.GcObj* null, %struct.GcObj** %8, align 4
  %9 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %10 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %9, i32 0, i32 1
  store %struct.GcObj* null, %struct.GcObj** %10, align 4
  %11 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %12 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %11, i32 0, i32 2
  store %struct.GcObj* null, %struct.GcObj** %12, align 4
  %13 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %14 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %13, i32 0, i32 3
  store %struct.GcObj* null, %struct.GcObj** %14, align 4
  %15 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %16 = getelementptr inbounds %struct.GcObj, %struct.GcObj* %15, i32 0, i32 4
  store i8 0, i8* %16, align 4
  %17 = load %class.GcList*, %class.GcList** @"?gc_obj_list@@3PAVGcList@@A", align 4
  %18 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  call x86_thiscallcc void @"?PushFront@GcList@@QAEXPAUGcObj@@@Z"(%class.GcList* %17, %struct.GcObj* %18)
  %19 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %20 = bitcast %struct.GcObj* %19 to i8*
  ret i8* %20
}

declare dso_local noalias i8* @malloc(i32) #3

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc void @"?PushFront@GcList@@QAEXPAUGcObj@@@Z"(%class.GcList*, %struct.GcObj*) #0 comdat align 2 {
  %3 = alloca %struct.GcObj*, align 4
  %4 = alloca %class.GcList*, align 4
  store %struct.GcObj* %1, %struct.GcObj** %3, align 4
  store %class.GcList* %0, %class.GcList** %4, align 4
  %5 = load %class.GcList*, %class.GcList** %4, align 4
  %6 = getelementptr inbounds %class.GcList, %class.GcList* %5, i32 0, i32 0
  %7 = load %struct.GcObj*, %struct.GcObj** %6, align 4
  %8 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  call void @"?SetNext@@YAXPAUGcObj@@0@Z"(%struct.GcObj* %8, %struct.GcObj* %7)
  %9 = getelementptr inbounds %class.GcList, %class.GcList* %5, i32 0, i32 0
  %10 = load %struct.GcObj*, %struct.GcObj** %9, align 4
  %11 = icmp ne %struct.GcObj* %10, null
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %14 = getelementptr inbounds %class.GcList, %class.GcList* %5, i32 0, i32 0
  %15 = load %struct.GcObj*, %struct.GcObj** %14, align 4
  call void @"?SetPrev@@YAXPAUGcObj@@0@Z"(%struct.GcObj* %15, %struct.GcObj* %13)
  br label %16

; <label>:16:                                     ; preds = %12, %2
  %17 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %18 = getelementptr inbounds %class.GcList, %class.GcList* %5, i32 0, i32 0
  store %struct.GcObj* %17, %struct.GcObj** %18, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @gc_add_root(%struct.GcObj**) #0 {
  %2 = alloca %struct.GcObj**, align 4
  store %struct.GcObj** %0, %struct.GcObj*** %2, align 4
  %3 = load %struct.GcRootStack*, %struct.GcRootStack** @"?gc_roots@@3PAUGcRootStack@@A", align 4
  %4 = load %struct.GcObj**, %struct.GcObj*** %2, align 4
  call x86_thiscallcc void @"?PushRoot@GcRootStack@@QAEXPAPAUGcObj@@@Z"(%struct.GcRootStack* %3, %struct.GcObj** %4)
  ret void
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc void @"?PushRoot@GcRootStack@@QAEXPAPAUGcObj@@@Z"(%struct.GcRootStack*, %struct.GcObj**) #0 comdat align 2 {
  %3 = alloca %struct.GcObj**, align 4
  %4 = alloca %struct.GcRootStack*, align 4
  store %struct.GcObj** %1, %struct.GcObj*** %3, align 4
  store %struct.GcRootStack* %0, %struct.GcRootStack** %4, align 4
  %5 = load %struct.GcRootStack*, %struct.GcRootStack** %4, align 4
  %6 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 2
  %7 = load i32, i32* %6, align 4
  %8 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = icmp eq i32 %7, %9
  br i1 %10, label %11, label %24

; <label>:11:                                     ; preds = %2
  %12 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 1
  %13 = load i32, i32* %12, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, i32* %12, align 4
  %15 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 1
  %16 = load i32, i32* %15, align 4
  %17 = mul i32 %16, 4
  %18 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 0
  %19 = load %struct.GcObj***, %struct.GcObj**** %18, align 4
  %20 = bitcast %struct.GcObj*** %19 to i8*
  %21 = call noalias i8* @realloc(i8* %20, i32 %17)
  %22 = bitcast i8* %21 to %struct.GcObj***
  %23 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 0
  store %struct.GcObj*** %22, %struct.GcObj**** %23, align 4
  br label %24

; <label>:24:                                     ; preds = %11, %2
  %25 = load %struct.GcObj**, %struct.GcObj*** %3, align 4
  %26 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 0
  %27 = load %struct.GcObj***, %struct.GcObj**** %26, align 4
  %28 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 2
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %struct.GcObj**, %struct.GcObj*** %27, i32 %29
  store %struct.GcObj** %25, %struct.GcObj*** %30, align 4
  %31 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 2
  %32 = load i32, i32* %31, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %31, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @gc_remove_root(%struct.GcObj**) #0 {
  %2 = alloca %struct.GcObj**, align 4
  store %struct.GcObj** %0, %struct.GcObj*** %2, align 4
  %3 = load %struct.GcRootStack*, %struct.GcRootStack** @"?gc_roots@@3PAUGcRootStack@@A", align 4
  %4 = load %struct.GcObj**, %struct.GcObj*** %2, align 4
  call x86_thiscallcc void @"?PopRoot@GcRootStack@@QAEXPAPAUGcObj@@@Z"(%struct.GcRootStack* %3, %struct.GcObj** %4)
  ret void
}

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc void @"?PopRoot@GcRootStack@@QAEXPAPAUGcObj@@@Z"(%struct.GcRootStack*, %struct.GcObj**) #0 comdat align 2 {
  %3 = alloca %struct.GcObj**, align 4
  %4 = alloca %struct.GcRootStack*, align 4
  store %struct.GcObj** %1, %struct.GcObj*** %3, align 4
  store %struct.GcRootStack* %0, %struct.GcRootStack** %4, align 4
  %5 = load %struct.GcRootStack*, %struct.GcRootStack** %4, align 4
  %6 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 0
  %7 = load %struct.GcObj***, %struct.GcObj**** %6, align 4
  %8 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 2
  %9 = load i32, i32* %8, align 4
  %10 = sub nsw i32 %9, 1
  %11 = getelementptr inbounds %struct.GcObj**, %struct.GcObj*** %7, i32 %10
  %12 = load %struct.GcObj**, %struct.GcObj*** %11, align 4
  %13 = load %struct.GcObj**, %struct.GcObj*** %3, align 4
  %14 = icmp ne %struct.GcObj** %12, %13
  br i1 %14, label %15, label %28

; <label>:15:                                     ; preds = %2
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @"??_C@_0BN@DLIALJMC@BADBADBADBADBADBADBADBADBAD?6?$AA@", i32 0, i32 0))
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @"??_C@_0CB@NGCPCCJL@Root?5at?5top?5of?5stack?5points?5to?3?6@", i32 0, i32 0))
  %18 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 0
  %19 = load %struct.GcObj***, %struct.GcObj**** %18, align 4
  %20 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 2
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.GcObj**, %struct.GcObj*** %19, i32 %21
  %23 = load %struct.GcObj**, %struct.GcObj*** %22, align 4
  %24 = load %struct.GcObj*, %struct.GcObj** %23, align 4
  call void @"?PrintObj@@YAXPBUGcObj@@@Z"(%struct.GcObj* %24)
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @"??_C@_0BL@PDCIMNAE@Root?5to?5remove?5points?5to?3?6?$AA@", i32 0, i32 0))
  %26 = load %struct.GcObj**, %struct.GcObj*** %3, align 4
  %27 = load %struct.GcObj*, %struct.GcObj** %26, align 4
  call void @"?PrintObj@@YAXPBUGcObj@@@Z"(%struct.GcObj* %27)
  br label %28

; <label>:28:                                     ; preds = %15, %2
  %29 = getelementptr inbounds %struct.GcRootStack, %struct.GcRootStack* %5, i32 0, i32 2
  %30 = load i32, i32* %29, align 4
  %31 = add nsw i32 %30, -1
  store i32 %31, i32* %29, align 4
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local i32 @_vfprintf_l(%struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) #0 comdat {
  %5 = alloca i8*, align 4
  %6 = alloca %struct.__crt_locale_pointers*, align 4
  %7 = alloca i8*, align 4
  %8 = alloca %struct._iobuf*, align 4
  store i8* %3, i8** %5, align 4
  store %struct.__crt_locale_pointers* %2, %struct.__crt_locale_pointers** %6, align 4
  store i8* %1, i8** %7, align 4
  store %struct._iobuf* %0, %struct._iobuf** %8, align 4
  %9 = load i8*, i8** %5, align 4
  %10 = load %struct.__crt_locale_pointers*, %struct.__crt_locale_pointers** %6, align 4
  %11 = load i8*, i8** %7, align 4
  %12 = load %struct._iobuf*, %struct._iobuf** %8, align 4
  %13 = call i64* @__local_stdio_printf_options()
  %14 = load i64, i64* %13, align 8
  %15 = call i32 @__stdio_common_vfprintf(i64 %14, %struct._iobuf* %12, i8* %11, %struct.__crt_locale_pointers* %10, i8* %9)
  ret i32 %15
}

declare dso_local %struct._iobuf* @__acrt_iob_func(i32) #3

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

declare dso_local i32 @__stdio_common_vfprintf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) #3

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local i64* @__local_stdio_printf_options() #0 comdat {
  ret i64* @"?_OptionsStorage@?1??__local_stdio_printf_options@@9@4_KA"
}

declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind optnone
define linkonce_odr dso_local x86_thiscallcc void @"?Remove@GcList@@QAEXPAUGcObj@@@Z"(%class.GcList*, %struct.GcObj*) #0 comdat align 2 {
  %3 = alloca %struct.GcObj*, align 4
  %4 = alloca %class.GcList*, align 4
  %5 = alloca %struct.GcObj*, align 4
  %6 = alloca %struct.GcObj*, align 4
  store %struct.GcObj* %1, %struct.GcObj** %3, align 4
  store %class.GcList* %0, %class.GcList** %4, align 4
  %7 = load %class.GcList*, %class.GcList** %4, align 4
  %8 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %9 = call %struct.GcObj* @"?GetPrev@@YAPAUGcObj@@PAU1@@Z"(%struct.GcObj* %8)
  store %struct.GcObj* %9, %struct.GcObj** %5, align 4
  %10 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %11 = call %struct.GcObj* @"?GetNext@@YAPAUGcObj@@PAU1@@Z"(%struct.GcObj* %10)
  store %struct.GcObj* %11, %struct.GcObj** %6, align 4
  %12 = load %struct.GcObj*, %struct.GcObj** %5, align 4
  %13 = icmp eq %struct.GcObj* %12, null
  br i1 %13, label %14, label %22

; <label>:14:                                     ; preds = %2
  %15 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %16 = getelementptr inbounds %class.GcList, %class.GcList* %7, i32 0, i32 0
  %17 = load %struct.GcObj*, %struct.GcObj** %16, align 4
  %18 = icmp ne %struct.GcObj* %15, %17
  br i1 %18, label %19, label %22

; <label>:19:                                     ; preds = %14
  %20 = call i8* @"?ListName@@YAPBDXZ"()
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @"??_C@_0CP@HIJCJBBI@Tried?5to?5remove?5an?5obj?5that?8s?5no@", i32 0, i32 0), i8* %20)
  br label %43

; <label>:22:                                     ; preds = %14, %2
  %23 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %24 = getelementptr inbounds %class.GcList, %class.GcList* %7, i32 0, i32 0
  %25 = load %struct.GcObj*, %struct.GcObj** %24, align 4
  %26 = icmp eq %struct.GcObj* %23, %25
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %22
  %28 = load %struct.GcObj*, %struct.GcObj** %3, align 4
  %29 = call %struct.GcObj* @"?GetNext@@YAPAUGcObj@@PAU1@@Z"(%struct.GcObj* %28)
  %30 = getelementptr inbounds %class.GcList, %class.GcList* %7, i32 0, i32 0
  store %struct.GcObj* %29, %struct.GcObj** %30, align 4
  br label %31

; <label>:31:                                     ; preds = %27, %22
  %32 = load %struct.GcObj*, %struct.GcObj** %5, align 4
  %33 = icmp ne %struct.GcObj* %32, null
  br i1 %33, label %34, label %37

; <label>:34:                                     ; preds = %31
  %35 = load %struct.GcObj*, %struct.GcObj** %6, align 4
  %36 = load %struct.GcObj*, %struct.GcObj** %5, align 4
  call void @"?SetNext@@YAXPAUGcObj@@0@Z"(%struct.GcObj* %36, %struct.GcObj* %35)
  br label %37

; <label>:37:                                     ; preds = %34, %31
  %38 = load %struct.GcObj*, %struct.GcObj** %6, align 4
  %39 = icmp ne %struct.GcObj* %38, null
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %37
  %41 = load %struct.GcObj*, %struct.GcObj** %5, align 4
  %42 = load %struct.GcObj*, %struct.GcObj** %6, align 4
  call void @"?SetPrev@@YAXPAUGcObj@@0@Z"(%struct.GcObj* %42, %struct.GcObj* %41)
  br label %43

; <label>:43:                                     ; preds = %19, %40, %37
  ret void
}

declare dso_local noalias i8* @realloc(i8*, i32) #3

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { builtin }
attributes #6 = { builtin nounwind }

!llvm.linker.options = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"/FAILIFMISMATCH:\22_CRT_STDIO_ISO_WIDE_SPECIFIERS=0\22"}
!1 = !{i32 1, !"NumRegisterParameters", i32 0}
!2 = !{i32 1, !"wchar_size", i32 2}
!3 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
