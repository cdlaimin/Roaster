#!/bin/bash

set -e

# Comment syntax: Prepend "__" to repo dir.
printf "%s\n" {\
git@github.com:\ /\ {\
01org/{mkl-dnn,processor-trace,tbb},\
389ds/389-ds-base,\
aappleby/{MetroBoy,Metron,smhasher},\
ablattmann/pose_estimation_hrnet,\
abseil/abseil-{cpp,py},\
AcademySoftwareFoundation/{Imath,MaterialX,OpenColorIO,openexr,OpenShadingLanguage,OpenTimelineIO,openvdb},\
afq984/python-cxxfilt,\
agauniyal/{rang,termdb},\
apache/{hadoop{,-{common,mapreduce,site,thirdparty}},hbase{,-{connectors,filesystem,native-client,operator-tools,site,thirdparty}},httpd{,-{docs-build,flood,mod_fcgid,site,tests}},thrift{,-website},tomcat{,-{connectors,maven-plugin,native,training}},tvm{,-{rfcs,site,vta}}},\
apple/{apple-llvm-infrastructure-tools,coremltools,cups,darwin-{libplatform,libpthread,xnu},foundationdb,indexstore-db,ml-hypersim,openjdk,password-manager-resources,servicetalk,sourcekit-lsp,swift{,-{algorithms,atomics,argument-parser,cluster-membership,collections{,-benchmark},corelibs-{foundation,libdispatch,xctest},crypto,distributed-tracing{,-baggage{,-core}},docker,driver,evolution{,-staging},format,http-structured-headers,integration-tests,internals,llbuild{,2},log,metrics{,-extras},nio{,-{examples,extras,http2,ssh,ssl,transport-services,zlib-support}},numerics,package-{collection-generator,manager},protobuf,service-discovery,source-compat-suite,standard-library-preview,statsd-client,stress-tester,syntax,system,tools-support-{async,core},xcode-playground-support}},turicreate},\
aquynh/capstone,\
ArashPartow/{bitmap,bloom,exprtk{,-{custom-types,extras,fuzzer,perftest}},fastgeo,filter,galois,hash,lexertk,math-parser-benchmark-project,nanocalc,proxy,registry,schifra,strtk,sumtk,tcpproxy-variations,wykobi},\
aravindr93/{dmc2gym,mjrl,mujoco-py,trajopt},\
ARM-software/{arm-trusted-firmware,astc-encoder,ComputeLibrary,HWCPipe,lisa},\
arminc/{clair-{local-scan,scanner},k8s-platform-lcm,terraform-ecs},\
asmjit/{asm{db,jit,tk},cult},\
AUTOMATIC1111/{Autocleaner,Autolinks,GradientHair,Rimlaser,stable-diffusion-webui{,-{aesthetic-gradients,extensions,feature-showcase,nsfw-censor,old-localizations,pixelization,promptgen,rembg,tokenizer,wildcards}}},\
aws/aws-{cli,sdk-{cpp,go,java,js,net,php,ruby}},\
axel-download-accelerator/axel,\
Azure/{azure-{c-{build-tools,logging,shared-utility,testrunnerswitcher},cli{,-extensions},ctest,devops-{cli-extension,utils},sdk-{for-{android,cpp,go,ios,java,js,net,node,php,python,ruby,rust},tools},storage-cpp,utpm-c},AML-Kubernetes,AzureML-Containers,azureml-{assets,cheatsheets,examples},iotedge,macro-utils-c,umock-c},\
Bash-it/bash-it{,-docker},\
bats-core/bats-{assert,backports,core,detik,docs,file,support},\
bazelbuild/{apple_support,bazel{,-{bench,blog,buildfarm,central-registry,gazelle,skylib,toolchains,website}},buildtools,emacs-bazel-mode,examples,intellij,java_tools,platforms,proposals,remote-apis,rules_{android{,_ndk},appengine,apple,cc,closure,d,docker,dotnet,foreign_cc,fuzzing,go,groovy,gwt,java,jvm_external,k8s,kotlin,nodejs,license,perl,pkg,postcss,proto,python,rust,sass,scala,swift,testing,webtesting},sandboxfs,setup-bazelisk,stardoc,starlark,tools_{android,remote},vim-bazel,vscode-bazel},\
benjaminp/six,\
berlin-open-wireless-lab/{DAWN,sdwn-controller},\
BLAKE3-team/BLAKE3{,-specs},\
boostorg/{accumulators,algorithm,align,any,array,asio,assert,assign,atomic,auto_index,beast,bimap,bind,boost{,_install,-ci,book,dep},bcp,bpm,build,callable_traits,check_build,chrono,circular_buffer,cmake,compatibility,compute,concept_check,config,container{,_hash},context,contract,conversion,convert,core,coroutine{,2},crc,date_time,describe,detail,disjoint_sets,dll,docca,dynamic_bitset,endian,exception,fiber,filesystem,flyweight,foreach,format,function{,_types},functional,fusion,geometry,gil,graph{,_parallel},hana,headers,heap,histogram,hof,icl,inspect,integer,interprocess,interval,intrusive,io,iostreams,iterator,json,lambda{,2},leaf,lexical_cast,litre,local_function,locale,lockfree,log,logic,math,metaparse,mincmake,more,move,mp11,mpi,mpl,msm,multi_array,multi_index,multiprecision,nowide,numeric_conversion,odeint,optional,outcome,parameter{,_python},pfr,phoenix,poly_collection,polygon,pool,predef,preprocessor,process,program_options,proto,property_{map{,_parallel},tree},ptr_container,python,quickbook,qvm,random,range,ratio,rational,regex,regression,release-tools,safe_numerics,scope_exit,serialization,signals{,2},smart_ptr,sort,spirit,stacktrace,statechart,static_assert,static_string,stl_interfaces,sync,system,test,thread,throw_exception,timer,tokenizer,tti,tr1,tuple,type_{erasure,index,traits},typeof,ublas,units,unordered,utility,uuid,variant{,2},vmd,wave,website,winapi,xpressive,yap},\
BVLC/caffe,\
c-ares/c-ares,\
caffe2/{caffe2,models},\
catchorg/{Catch2,Clara},\
ccache/ccache,\
census-instrumentation/opencensus-{cpp,csharp,erlang,go,java,js-core,node,php,proto,python,ruby,service,specs,web,website},\
chadaustin/sajson,\
chromium/{ballista,chromium,gyp,pdfium,vs-chromium},\
Cisco-Talos/clamav{,-{bytecode-compiler,documentation,mussels-cookbook,safebrowsing}},\
civetweb/civetweb,\
CLIUtils/{CLI11,cmake,modern_cmake},\
cncf/{landscape,sig-{app-delivery,contributor-strategy,network,observability,runtime,security{,-events}},cnf-testsuite,udpa,xds},\
cocodataset/{cocoapi,panopticapi},\
CompVis/{adaptive-style-transfer,AutomaticBehaviorAnalysis_NatureComm,behavior-driven-video-synthesis,brushstroke-parameterized-style-transfer,Characterizing_Generalization_in_DML,content-style-disentangled-ST,cuneiform-sign-detection-{code,dataset,webapp},geometry-free-view-synthesis,iin,image2video-synthesis-using-cINNs,imagebart,interactive-image2video-synthesis,invariances,ipoke,latent-diffusion,metric-learning-divide-and-conquer{,-improved},net2net,stable-diffusion,taming-transformers,unsupervised-{disentangling,part-segmentation},vunet},\
containerd/containerd,\
cplusplus/{draft,papers},\
cpp-taskflow/cpp-taskflow,\
cr-marcstevens/{dblpbibtex,hashclash,m4gb,sha1_gpu_nearcollisionattacks,sha1collisiondetection{,-tools},snippets},\
cython/cython,\
Dav1dde/glad,\
DaveGamble/cJSON,\
dcleblanc/{CAdES,SafeInt},\
Delgan/loguru,\
denyhosts/denyhosts,\
divamgupta/{deep-clustering-kingdra,diffusionbee-stable-diffusion-ui,image-segmentation-keras,keras-vggish,ladder_network_keras,mtl_girnet,mttdsc,pytorch-propane,sbevnet-stereo-layout-estimation,stable-diffusion-tensorflow},\
dlfcn-win32/dlfcn-win32,\
dmlc/{dlpack,dmlc-core,gluon-cv,gluon-nlp,HalideIR,tvm,xgboost},\
docker/docker-ce,\
docopt/docopt,\
dotnet/{cli,core{,-setup,clr,fx},source-build,standard},\
driazati/breakpad,\
dropbox/json11,\
dtrugman/{dotfiles,modernposix,pfs,rci,shplug},\
eigenteam/eigen-git-mirror,\
ElectronVector/{fake_function_framework,ravioli},\
elnormous/{HTTPRequest,ouzel,OuzelShadingLanguage,SoftwareRenderer},\
emil-e/rapidcheck,\
emscripten-core/{emscripten{,-ci,-fastcomp{,-clang}},emsdk,posixtestsuite},\
EnterpriseDB/{AlertifyJS,barman{,-tutorial},bdr-benchmark-kit,benchmark-framework,benchmarking-postgres,blogpostings,cloud-utilities,cnp-bench,cto-tproc-results,docker-pgbouncer,docs,edb-{ansible{,-tower},cnpg-gke-autopilot-deployer,installers,partner-docs,patroni,postgres-for-kubernetes-charts,ref-archs,terraform},edb_foreignkeyconstraintmanager,efm-api-node-state,{hdfs,mongo,mysql}_fdw,k8s-api-docgen,kubectl-cnp,pg-backup-api,pgldapsync,pgworkload,pg_catcheck,pg_failover_slots,pg_nosql_benchmark,postgres-deployment,pldebugger,sslutils,stackbuilder,system_stats,repmgr,terraform-provider-{biganimal,toolbox},tpa,zheap},\
envoyproxy/{data-plane-api,envoy,{go,java}-control-plane,nighthawk,protoc-gen-validate},\
erenon/{bazel_clang_tidy,binlog,cueue},\
esnme/ujson4c,\
Exiv2/exiv2,\
facebook/{rocksdb,zstd},\
facebookincubator/{dcrpm,fbjni,gloo},\
facebookresearch/{aepsych,AnimatedDrawings,balance,ClassyVision,CrypTen,d2go,demucs,Detectron,detectron2,Detic,dlrm,DrQA,eai-vc,Ego4d,encodec,esm,faiss,fastMRI,fastText,fbpcs,flashlight,fvcore,habitat-{challenge,lab,matterport3d-dataset,sim},HolisticTraceAnalysis,home-robot,ImageNet-Adversarial-Training,image-goal-nav-dataset,iopath,labgraph,luckmatters,maskrcnn-benchmark,metaseq,omni3d,optimizers,ParlAI,pycls,pytext,pythia,PyTorch-BigGraph,pytorch-dp,pytorch3d,pyvrs,SentEval,rcpm,ReAgent,ResNeXt,svg,symbolicregression,theseus,ToMe,vrs,wav2letter,xformers,XLM},\
fatedier/{fft,frp,golib},\
FFmpeg/FFmpeg,\
fmtlib/{fmt,format-benchmark},\
frerich/clcache,\
Frozenball/pytest-sugar,\
fundamentalvision/{Auto-Seg-Loss,BEVFormer,Deformable-DETR,Parameterized-AP-Loss,Siamese-Image-Modeling,Uni-Perceiver,UniGrad},\
g-truc/{gli,glm},\
gabime/spdlog,\
gflags/gflags,\
ggerganov/{gg{img,ml,sock,term,wave{,-spm},web,words},imgui{,-ws},imtui,incppect,llama.cpp,whisper.{cpp,spm}},\
giampaolo/psutil,\
git/{git{,-{reference,scm.com}},htmldocs},\
github/{git-lfs,gitignore},\
glfw/{gleq,glfw},\
golang/{appengine,benchmarks,dep,example,freetype,glog,go{,frontend},groupcache,leveldb,mock,oauth2,protobuf,snappy,term,winstrap},\
goldmann/docker-squash,\
google/{benchmark,bloaty,boringssl,breakpad,flatbuffers,gemmlowp,glog,googletest,gtest-parallel,jax,leveldb,libnop,libprotobuf-mutator,nsync,python-fire,protobuf,re2,sentencepiece,skia,snappy,upb,XNNPACK},\
googleapis/googleapis,\
GoogleContainerTools/{base-images-docker,container-{debug-support,diff,structure-test},distroless,jib{,-extensions},kaniko,kpt{,-functions-{catalog,sdk}},skaffold},\
googlefonts/{fontmake,noto-{cjk,emoji,fonts,sans-hebrew,source},nototools,robotoslab},\
GPUOpen-LibrariesAndSDKs/{AMF,BlenderUSDHydraAddon,Cauldron,D3D12MemoryAllocator,Orochi,Radeon{ImageFilter,ProRender{BlenderAddon,MayaPlugin,SDK,SharedComponents,USD},Rays_SDK},VulkanMemoryAllocator},\
grpc/{grpc{,.io,-{community,dart,docker-library,dotnet,experiments,go,haskell,ios,java{,-api-checker},kotlin,node,php,proto,swift,web}},proposal,test-infra},\
gsliepen/tinc,\
gulrak/filesystem,\
haad/proxychains,\
halide/Halide,\
harfbuzz/harfbuzz,\
HazyResearch/{ama_prompting,anchor-stability,babble,bootleg,butterfly,correct-n-contrast,data-centric-ai,deepdive,domino,EmptyHeaded,epoxy,fairseq-fork,flash-attention,fly,fm_data_tasks,fonduer,H3,hgcn,hippo-code,HoroPCA,hyperbolics,KGEmb,legalbench,liger,manifest,meerkat{,-website},metal,observational,pdftotree,safari,spacetime,state-spaces,structured-nets,tabi,tanda,thanos-code},\
horovod/{artwork,horovod,tutorials},\
houseroad/foxi,\
HowardHinnant/date,\
huggingface/{accelerate,datasets{,-server},diffusers,knockknock,Mongoku,neuralcoref,optimum{,-{amd,benchmark,furiosa,graphcore,habana,intel,neuron,nvidia}},peft,pytorch-{openai-transformer-lm,pretrained-BigGAN},safetensors,swift-coreml-transformers,tflite-android-transformers,tokenizers,torchMoji,transformers,trl},\
HypothesisWorks/hypothesis,\
ianlancetaylor/{aestest,cgosymbolizer,demangle,libbacktrace},\
iina/{iina{,-plugin-definition,-website},plugin-ytdl},\
Immediate-Mode-UI/Nuklear,\
intel/{ARM_NEON_2_x86_SSE,compute-runtime,ideep,ittapi,mkl-dnn},\
intelxed/xed,\
ispc/ispc{,.github.com},\
IvanKobzarev/fbjni,\
jarro2783/cxxopts,\
JDAI-CV/{dabnn{,-example},DCL,DNNLibrary},\
jemalloc/jemalloc,\
jina-ai/{agentchain,annlite,api,auto-gpt-web,benchmark,clip-as-service,dalle-flow,discoart,finetuner,glid-3-xl,gptdeploy,inference-client,jcloud,jina,jina-ai.github.io,langchain-serve,now,SwinIR},\
jmorganca/ollama{,js},\
jordansissel/fpm,\
joseph-henry/lwip{,-contrib},\
JuliaStrings/utf8proc,\
jupp0r/prometheus-cpp,\
keras-team/{autokeras,governance,keras{,-applications,-autodoc,-contrib,-cv,-docs-{ja,ko,zh},-io,-nlp,-preprocessing,-tuner}},\
KhronosGroup/{EGL-Registry,GLSL,glslang,glTF{,-{Blender-IO,Project-Explorer,Registry,Sample-{Environments,Models,Viewer},Tutorials,Validator}},KTX-{Registry,Software,Specification},LLVM-SPIRV-Backend,OpenCL-{CLHPP,CTS,Docs,Guide,Headers,ICD-Loader,Layers,Registry,SDK},SPIRV-{Cross,Guide,Headers,LLVM-Translator,Reflect,Registry,Tools,Visualizer},SYCL-{CTS,Docs,Registry},Vulkan-{Docs,ExtensionLayer,Guide,Headers,Hpp,Loader,MemoryModel,Portability,Profiles,Samples{,-Assets},Tools,ValidationLayers},WebGL{,DeveloperTools}},\
Kitware/{CMake,VTK},\
Kkevsterrr/{backdoorme,geneva,koth},\
leethomason/tinyxml2,\
LeoHsiao1/pyexiv2,\
libav/libav,\
libcpr/{cpr,docs,example-cmake-{conan,fetch-content}},\
LibRaw/{DOFCalc,LibRaw{,-{cmake,contrib,demosaic-pack-GPL{2,3}}}},\
libsdl-org/{SDL,sdl12-compat},\
libuv/libuv,\
llvm/llvm-{archive,project,test-suite,www{,-pubs}},\
llvm-mirror/{ll{vm,d,db,go},clang{,-tools-extra},polly,compiler-rt,openmp,lib{unwind,cxx{,abi}},test-suite},\
lm-sensors/lm-sensors,\
LMDB/lmdb,\
lutzroeder/netron,\
lz4/lz4{,-java},\
madler/zlib,\
malfet/PeachPy,\
martinmoene/{{active,any,atomic,bit,boolean,byte,expected,invoke,jthread,nonstd,optional{,-fun},ring-span,scope,span,status-value,string{,-view},type,{observer,value}-ptr,variant}-lite,clue,hamlest,kalman-estimator{,-ada},lest,nonstd-lite-project,optional-bare,PhysUnits-{CT{,-Cpp11},RT}},\
matplotlib/{jupyter-matplotlib,matplotlib,mplcairo,pytest-mpl},\
Maratyszcza/{confu,cpuinfo,FP16,FXdiv,NNPACK,PeachPy,psimd,pthreadpool},\
meekrosoft/fff,\
mesonbuild/meson{,-python},\
micheles/{decorator,plac},\
Microsoft/{artifacts-credprovider,azure-pipelines-yaml,BuildXL,calculator,cascadia-code,CNTK,cppwinrt,dotnet,FeaturizersLibrary,GSL,LightGBM,mimalloc,msbuild,{,Delayed-Compensation-Asynchronous-Stochastic-Gradient-Descent-for-}Multiverso,nni,onnxconverter-common,onnxruntime{,-extensions,-tvm},STL,Terminal,TypeScript,unilm,vcpkg,VFSForGit,vscode,vstest,vswhere,wil},\
mikeando/fastjson,\
mirrorz-org/{mirrorz{,-{302,config,d-extension,docs,help,i18n,json-site,monitor,parser,publish,schema,scripts,search}},org},\
moby/{buildkit,moby},\
mono/{libgdiplus,linker,mono{,-tools,develop,torrent}},\
mreineck/{ducc,libsharp,pocketfft},\
nanopb/nanopb,\
NervanaSystems/{coach,distiller,neon,ngraph},\
netwide-assembler/{nasm,www},\
networkx/networkx,\
nico/demumble,\
nicolargo/glances,\
ninja-build/ninja,\
nlohmann/{crow,fifo_map,json},\
nothings/{single_file_libs,stb},\
ntop/{bro-pf_ring,docker-ntop,libebpfflow,n2disk,n2n,nDPI,nProbe,ntopng{,-grafana-datasource},packager,PF_RING,wireshark-ntop},\
numpy/{numpy{,-{newsletter,stubs,tutorials},doc},SVML},\
NVIDIA/{AMGX,apex,cccl,cnmem,cuda-{gdb,profiler,quantum,samples},cudnn-frontend,cutlass,DALI{,_extra},Dataset_Synthesizer,DCGM,DeepLearningExamples,DIGITS,flownet2-pytorch,Fuser,gdrcopy,hpc-container-maker,jitify,lib{cudacxx,glvnd,nvidia-container},MatX,Megatron-LM,modulus,NeMo{,-{Aligner,Guardrails,Megatron-Launcher,speech-data-processor,text-processing}},nccl{,-tests},nvidia-{container-runtime,docker,installer,modprobe,persistenced,settings,xconfig},NVFlare,NvPipe,NVTX,nvvl,open-gpu-doc,OpenSeq2Seq,pix2pixHD,stdexec,tacotron2,TensorRT{,-LLM},tensorrt-inference-server,TRTorch,vid2vid,waveglow},\
NVlabs/{cub,ffhq-dataset,pacnet,PWC-Net,SPADE,stylegan,xmp},\
ocornut/{imgui{,_{club,test_engine}},meka},\
oneapi-src/{one{API-{spec,tab},CCL,DAL,DNN,MKL,TBB},level-zero{,-tests}},\
onnx/{keras-onnx,models,onnx{,-tensorrt,mltools},optimizer,sklearn-onnx,tutorials},\
open-mpi/ompi,\
open-source-parsers/jsoncpp,\
open-telemetry/{opentelemetry-{collector,cpp,dotnet,go,java,js,log-collection,operator,proto,python,specification},oteps},\
openai/{chatgpt-retrieval-plugin,CLIP,evals,gpt-2-output-dataset,gpt-discord-bot,guided-diffusion,gym,human-eval,lm-human-preferences,maddpg,mujoco-py,multi-agent-emergence-environments,multiagent-particle-envs,neural-mmo,openai-{cookbook,{,quickstart-}{node,python},openapi},orrb,pixel,point-e,safety-gym,spinningup,tiktoken,triton,whisper},\
opencv/{ade,cvat,dldt,open_model_zoo,opencv{,_{3rdparty,contrib,extra}},openvino_training_extensions},\
OpenFOAM/{{OpenFOAM,ThirdParty}-{{2.{0,1,2,3,4},3.0,4,5}.x,6,7,dev},OpenFOAM-{Intel,Solidification},OpenQBMM},\
openssl/openssl,\
openucx/{shmem-opensnapi,sparkucx,torch-ucc,ucc{,_spec},ucx,xccl,xucg},\
openwrt/{luci,openwrt,packages,targets,telephony,video},\
pallets/{click,flask,itsdangerous,jinja,markupsafe,pallets-sphinx-themes,quart,website,werkzeug},\
patrick-kidger/{Deep-Signature-Transforms,diffrax,equinox,exvoker,FasterNeuralDiffEq,generalised_shapelets,mkposters,NeuralCDE,signatory,sympytorch,torchcde,torchcubicspline,torchtyping},\
PeachPy/enum34,\
phacility/{arcanist,javelin,phabricator,xhprof},\
PixarAnimationStudios/{OpenSubdiv,USD},\
protocolbuffers/{protobuf,upb},\
pybind/pybind11{,_bazel},\
pypa/{packaging,pip,pipenv,setuptools{,_scm},virtualenv,warehouse,wheel},\
pyparsing/pyparsing,\
pytest-dev/{pluggy,py,pytest},\
python/{cpython{,-{bin,source}-deps},devguide,importlib_{metadata,resources},mypy{,_extensions},peps,pyperformance,python-docs-{es,fr,hu,id,it,ja,ko,tr,pl,pt-br,theme,uk,zh-{cn,tw}},pythoncapi-compat,pythondotorg,release-tools,typeshed,typing{,_extensions},tzdata},\
python-attrs/attrs,\
python-pillow/{Pillow,pillow-perf,Sane},\
PythonCharmers/python-future,\
pyTooling/{Actions,pyAttributes,pyTooling{,.{CLIAbstraction,GenericPath,github.io,TerminalUI}},sphinx-reports},\
pytorch/{audio,botorch,captum,cppdocs,cpuinfo,elastic,examples,fairseq,FBGEMM,functorch,glow,ignite,kineto,pytorch,QNNPACK,serve,tensorpipe,text,translate,tutorials,vision,xla},\
RadeonOpenCompute/{hcc,ROCm-Device-Libs,ROCR-Runtime},\
rapidsai/{benchmark,cloud-ml-examples,clx,cu{cim,df,graph,hornet,ml,signal,spatial,xfilter},dask-{build-environment,cuda{,-benchmarks}},deployment,docs,frigate,gputreeshap,node,ptxcompiler,raft,rapids{.ai,-{cmake,examples,triton}},rmm,scikit-learn-nv,wholegraph,xgboost-conda},\
reactos/{rapps-db,reactos{,dbg},RosBE,wine},\
redis/{redis{,-{benchmarks-specification,doc,debian,hashes,io,rb,rcp,snap,specifications}},hiredis{,-node,-py,-rb},jedis},\
RMerl/{am-toolchains,asuswrt-merlin.ng},\
ROCm-Developer-Tools/HIP,\
ROCmSoftwarePlatform/{AMDMIGraphX,composable_kernel,cub-hip,gpufort,hip{-rdma-perftest,BLAS{,Lt},Caffe,CUB,DNN,FFT,fort,OMB,RAND,SOLVER,SPARSE},hipify_torch,MI{Fin,Open{,Examples,GEMM,Tensile},SA,Tuna},rccl,roc{ALUTION,BLAS{,-Examples},FFT,GemmDriver,HPCG,HPL,MLIR,PRIM,RAND,SOLVER,SPARSE,Thrust,WMMA},rocm-papi-component,Tensile,Thrust},\
rofl0r/{agsutils,chaos-pp,hardcore-utils,jobflow,libulz,microsocks,nat-tunnel,ncdu,order-pp,proxychains-ng,rocksock},\
ryd/chaosvpn,\
SchedMD/slurm,\
scikit-learn/{enhancement_proposals,examples-data,scikit-learn{,-benchmarks}},\
scipy/{boost-headers-only,HiGHS,oldest-supported-numpy,PROPACK,scipy{,-cookbook,-mathjax,-sphinx-theme{,-v2}},unuran,weave},\
shadowsocks/{badvpn,ChinaDNS{,-Python},crypto2,ipset,kcptun,lib{ancillary,bloom,cork,event,QtShadowsocks},luci-app-shadowsocks,openwrt-shadowsocks,papers,qtun,redsocks,ShadowsocksX-NG,shadowsocks{,-{android,crypto,dotcloud,go,iOS,libev,manager,qt5,rust,windows}},simple-obfs,v2ray-plugin{,-android}},\
shibatch/sleef,\
simdjson/simdjson,\
sivel/{go-speedtest,speedtest-cli},\
Stellarium/stellarium{,-{addons,data,dynamic-plugin,ppa,skycultures,unity,web-engine}},\
Sygil-Dev/{abo,dalle-flow,INE-dataset,sygil-webui},\
syoyo/tiny{dng,exr,gltf,objloader-c,usdz,vdbio},\
Sysinternals/{Proc{Dump,Mon}-for-Linux,sysinternals,SysinternalsEBPF,Sysmon{Common,ForLinux}},\
taskflow/{awesome-parallel-computing,taskflow,taskflow.github.io,tfprof,work-stealing-queue},\
Teemu/pytest-sugar,\
Tencent/rapidjson,\
tensorflow/{agents,datasets,docs,io,models,tensorboard,tensorflow,transform},\
termcolor/termcolor,\
thisistherk/fast_obj,\
ThrowTheSwitch/{Ceedling,CException,CMock,MadScienceLabDocker,Unity},\
thrust/thrust,\
timojl/{clipseg,drawCNN,tralo},\
tmux/tmux,\
tmux-plugins/{tmux-{continuum,resurrect,sensible,test},tpm},\
torvalds/linux,\
tqdm/{py-make,tqdm},\
tree-sitter/tree-sitter{,-{agda,bash,c,c-sharp,cpp,css,fluent,go,graph,haskell,html,java,javascript,jsdoc,json,julia,ocaml,php,python,ql,regex,ruby,rust,scala,swift,tsq,typescript,verilog}},\
trojan-gfw/{{homebrew,openwrt}-trojan,igniter{,-{go-libs,libs}},logo,trojan{,-{manager,panel,quickstart,url}}},\
uNetworking/{Containerize,lib{EpollFuzzer,vc},pubsub-{example,benchmark},seed-corpus,SuperCereal,u{Sockets,WebSockets{,.js}}},\
uploadcare/pillow-simd,\
USCiLab/cereal,\
v2fly/{docker,domain-list-community,fhs-install-v2ray,geoip,gray,v2ray-{core,examples,step-by-step},vmessping},\
v2ray/{dist,ext,geoip,homebrew-v2ray,manual,v2ray-core,V2RayN},\
vit-vit/CTPL,\
vivkin/gason,\
wjakob/clang-cindex-python3,\
xianyi/OpenBLAS,\
xkszltl/{glog,jsoncpp,hiredis,leveldb,linux-syscall-support,onnx,onnx-tensorrt,onnxruntime,protobuf,pthreadpool,pybind11,pytorch,roaster,rocksdb,simdjson,utf8proc,vision,xucg},\
yaml/pyyaml,\
Yangqing/ios-cmake,\
yixuan/{LBFGSpp,MiniDNN,recosystem,spectra},\
yuqinie98/PatchTST,\
zeromq/{cppzmq,libzmq,pyzmq},\
zerotier/{libzt,ZeroTier{One,NAS}},\
zeux/{meshoptimizer,microprofile,niagara,pugixml,qgrep,volk},\
zfsonlinux/{pkg-{spl,zfs},spl,zfs{,-auto-snapshot,-buildbot,-images}},\
zserge/jsmn,\
},\
git@gitlab.com:\ /\ {\
freepascal.org/{fpc/{docker,documentation,binaries,build,merging,pas2js,projects,source,website},lazarus/{binaries,lazarus,website},mantis_to_gitlab},\
libeigen/eigen,\
NVIDIA/{cloud-native/{cnt-docs,go-nvlib,k8s-driver-manager,mig-parted},container-{images/{caffe,cuda{,-ppc64le,gl},digits,dockerhub-manifests,driver,l4t-base,mps,opencl,opengl,samples,video-codec-sdk,vulkan},infrastructure/{aws-kube-ci,github-app},toolkit/{container-{config,runtime,toolkit},gpu-monitoring-tools,libnvidia-container,nvidia-docker}},dlsyseng/{slurm,spank_fstab},headers/{cuda,cudnn},hpc/slurm-mig-discovery,kubernetes/{device-plugin,gpu-{feature-discovery,operator}},cuda},\
OldManProgrammer/unix-tree,\
pycqa/flake8,\
},\
git@gitlab.alpinelinux.org:\ /\ {\
alpine/{abuild,alpine-{baselayout,conf},apk-tools,aports,awall,ca-certificates,dmvpn-tools,docs/{{developer,user}-handbook,docs.a.o,governance},infra/{alpine-{mksite,secdb},aports-turbo,build-server-status,compose/{algitbot,alpine-mirror-sync,appstream-generator,cgit,gitlab-{acceptance-tests,inbound-email,runner-alpine-ci},netbox,package-host,webhook},docker/{alpine-gitlab-ci,ansible,apkbuild-lint-tools,aports-{build,turbo},appstream-generator,build-base,darkhttpd,docker-{cli,compose},git-mirror-syncd,gitlab{,-runner{,-helper}},lua-turbo,mariadb,mirror-status,mlmmj,mqtt-exec,netbox,package-builder,rsyncd,secdb,turbo-paste,uacme-nsd-wildcard,unbound,webhook},gitlab-ci-templates,infra-packages,mirror-status,turbo-paste,zabbix-agent2-plugins},lua-aports,mkinitfs},\
},\
git@bitbucket.org:\ /\ {\
multicoreware/x265_git,\
},\
https://sourceware.org/git/\ sourceware\ {\
valgrind,\
},\
https://code.videolan.org/\ /\ {\
videolan/{aribb25,bitstream,dav1d,dvblast,lib{aacs,dvbpsi,dvd{css,nav,read},bluray,placebo,udfread,vlcpp},npapi-vlc,vlc{,-{android,winrt}},vlma,vlmc,x264},\
},\
https://git.videolan.org/git/\ videolan\ {\
ffmpeg,\
libpostproc,\
x262,\
},\
https://git.videolan.org/git/ffmpeg/\ videolan\ {\
nv-codec-headers,\
},\
}
