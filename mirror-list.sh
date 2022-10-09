#!/bin/bash

set -e

# Comment syntax: Prepend "__" to repo dir.
printf "%s\n" {\
git@github.com:\ /\ {\
01org/{mkl-dnn,processor-trace,tbb},\
389ds/389-ds-base,\
abseil/abseil-{cpp,py},\
afq984/python-cxxfilt,\
agauniyal/{rang,termdb},\
apache/{hadoop{,-{common,mapreduce,site,thirdparty}},hbase{,-{connectors,filesystem,native-client,operator-tools,site,thirdparty}},httpd{,-{docs-build,flood,mod_fcgid,site,tests}},thrift{,-website},tomcat{,-{connectors,maven-plugin,native,training}},tvm{,-{rfcs,site,vta}}},\
apple/{apple-llvm-infrastructure-tools,coremltools,cups,darwin-{libplatform,libpthread,xnu},foundationdb,indexstore-db,ml-hypersim,openjdk,password-manager-resources,servicetalk,sourcekit-lsp,swift{,-{algorithms,atomics,argument-parser,cluster-membership,collections{,-benchmark},corelibs-{foundation,libdispatch,xctest},crypto,distributed-tracing{,-baggage{,-core}},docker,driver,evolution{,-staging},format,http-structured-headers,integration-tests,internals,llbuild{,2},log,metrics{,-extras},nio{,-{examples,extras,http2,ssh,ssl,transport-services,zlib-support}},numerics,package-{collection-generator,manager},protobuf,service-discovery,source-compat-suite,standard-library-preview,statsd-client,stress-tester,syntax,system,tools-support-{async,core},xcode-playground-support}},turicreate},\
aquynh/capstone,\
ARM-software/{arm-trusted-firmware,ComputeLibrary,lisa},\
arminc/{clair-{local-scan,scanner},k8s-platform-lcm,terraform-ecs},\
asmjit/{asm{db,jit,tk},cult},\
aws/aws-{cli,sdk-{cpp,go,java,js,net,php,ruby}},\
axel-download-accelerator/axel,\
Azure/{azure-{c-{build-tools,logging,shared-utility,testrunnerswitcher},cli{,-extensions},ctest,devops-{cli-extension,utils},sdk-{for-{android,cpp,go,ios,java,js,net,node,php,python,ruby,rust},tools},storage-cpp,utpm-c},AML-Kubernetes,AzureML-Containers,azureml-{cheatsheets,examples,previews},iotedge,macro-utils-c,umock-c},\
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
cncf/{landscape,sig-{app-delivery,contributor-strategy,network,observability,runtime,security{,-events}},cnf-testsuite,udpa,xds},\
cocodataset/{cocoapi,panopticapi},\
containerd/containerd,\
cplusplus/{draft,papers},\
cython/cython,\
DaveGamble/cJSON,\
dcleblanc/{CAdES,SafeInt},\
Delgan/loguru,\
denyhosts/denyhosts,\
dmlc/{dlpack,dmlc-core,gluon-cv,gluon-nlp,HalideIR,tvm,xgboost},\
docker/docker-ce,\
docopt/docopt,\
dotnet/{cli,core{,-setup,clr,fx},source-build,standard},\
driazati/breakpad,\
dropbox/json11,\
eigenteam/eigen-git-mirror,\
elnormous/{HTTPRequest,ouzel,OuzelShadingLanguage,SoftwareRenderer},\
emil-e/rapidcheck,\
emscripten-core/{emscripten{,-ci,-fastcomp{,-clang}},emsdk,posixtestsuite},\
envoyproxy/{data-plane-api,envoy,{go,java}-control-plane,nighthawk,protoc-gen-validate},\
esnme/ujson4c,\
facebook/{rocksdb,zstd},\
facebookincubator/{dcrpm,fbjni,gloo},\
facebookresearch/{ClassyVision,CrypTen,Detectron,detectron2,dlrm,DrQA,faiss,fastMRI,fastText,flashlight,fvcore,habitat-sim,ImageNet-Adversarial-Training,iopath,maskrcnn-benchmark,ParlAI,pycls,pytext,pythia,PyTorch-BigGraph,pytorch-dp,pytorch3d,SentEval,ResNeXt,wav2letter,XLM},\
fatedier/{fft,frp,golib},\
FFmpeg/FFmpeg,\
fmtlib/{fmt,format-benchmark},\
frerich/clcache,\
Frozenball/pytest-sugar,\
gabime/spdlog,\
gflags/gflags,\
giampaolo/psutil,\
github/{git-lfs,gitignore},\
golang/{appengine,benchmarks,dep,example,freetype,glog,go{,frontend},groupcache,leveldb,mock,oauth2,protobuf,snappy,term,winstrap},\
goldmann/docker-squash,\
google/{benchmark,bloaty,boringssl,breakpad,flatbuffers,gemmlowp,glog,googletest,gtest-parallel,jax,leveldb,libnop,libprotobuf-mutator,nsync,python-fire,protobuf,re2,sentencepiece,skia,snappy,upb,XNNPACK},\
googleapis/googleapis,\
GoogleContainerTools/{base-images-docker,container-{debug-support,diff,structure-test},distroless,jib{,-extensions},kaniko,kpt{,-functions-{catalog,sdk}},skaffold},\
googlefonts/{fontmake,noto-{cjk,emoji,fonts,sans-hebrew,source},nototools,robotoslab},\
grpc/{grpc{,.io,-{community,dart,docker-library,dotnet,experiments,go,haskell,ios,java{,-api-checker},kotlin,node,php,proto,swift,web}},proposal,test-infra},\
gsliepen/tinc,\
halide/Halide,\
harfbuzz/harfbuzz,\
horovod/{artwork,horovod,tutorials},\
houseroad/foxi,\
HowardHinnant/date,\
huggingface/{knockknock,Mongoku,neuralcoref,pytorch-{openai-transformer-lm,pretrained-BigGAN},swift-coreml-transformers,tflite-android-transformers,tokenizers,torchMoji,transformers},\
HypothesisWorks/hypothesis,\
iina/{iina{,-plugin-definition,-website},plugin-ytdl},\
intel/{ARM_NEON_2_x86_SSE,compute-runtime,ideep,mkl-dnn},\
intelxed/xed,\
ispc/ispc{,.github.com},\
IvanKobzarev/fbjni,\
jarro2783/cxxopts,\
JDAI-CV/{dabnn{,-example},DCL,DNNLibrary},\
jemalloc/jemalloc,\
jordansissel/fpm,\
joseph-henry/lwip{,-contrib},\
JuliaStrings/utf8proc,\
jupp0r/prometheus-cpp,\
keras-team/{autokeras,governance,keras{,-applications,-autodoc,-contrib,-cv,-docs-{ja,ko,zh},-io,-nlp,-preprocessing,-tuner}},\
Kitware/{CMake,VTK},\
libav/libav,\
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
micheles/{decorator,plac},\
Microsoft/{azure-pipelines-yaml,BuildXL,calculator,cascadia-code,CNTK,cppwinrt,dotnet,FeaturizersLibrary,GSL,LightGBM,mimalloc,msbuild,{,Delayed-Compensation-Asynchronous-Stochastic-Gradient-Descent-for-}Multiverso,nni,onnxconverter-common,onnxruntime{,-extensions,-tvm},STL,Terminal,TypeScript,unilm,vcpkg,VFSForGit,vscode,vstest,vswhere,wil},\
mikeando/fastjson,\
moby/{buildkit,moby},\
mono/{libgdiplus,linker,mono{,-tools,develop,torrent}},\
mreineck/{ducc,libsharp,pocketfft},\
nanopb/nanopb,\
NervanaSystems/{coach,distiller,neon,ngraph},\
networkx/networkx,\
nico/demumble,\
nicolargo/glances,\
ninja-build/ninja,\
nlohmann/{crow,fifo_map,json},\
ntop/{bro-pf_ring,docker-ntop,libebpfflow,n2disk,n2n,nDPI,nProbe,ntopng{,-grafana-datasource},packager,PF_RING,wireshark-ntop},\
numpy/{numpy{,-{newsletter,stubs,tutorials},doc},SVML},\
NVIDIA/{AMGX,apex,cccl,cnmem,cuda-{gdb,profiler,samples},cudnn-frontend,cutlass,DALI{,_extra},Dataset_Synthesizer,DeepLearningExamples,DIGITS,flownet2-pytorch,gdrcopy,hpc-container-maker,jitify,lib{cudacxx,glvnd,nvidia-container},Megatron-LM,NeMo,nccl{,-tests},nvidia-{container-runtime,docker,installer,modprobe,persistenced,settings,xconfig},NvPipe,NVTX,nvvl,open-gpu-doc,OpenSeq2Seq,pix2pixHD,tacotron2,TensorRT,tensorrt-inference-server,TRTorch,vid2vid,waveglow},\
NVlabs/{cub,ffhq-dataset,pacnet,PWC-Net,SPADE,stylegan,xmp},\
oneapi-src/{one{API-{spec,tab},CCL,DAL,DNN,MKL,TBB},level-zero{,-tests}},\
onnx/{keras-onnx,models,onnx{,-tensorrt,mltools},optimizer,sklearn-onnx,tutorials},\
open-mpi/ompi,\
open-source-parsers/jsoncpp,\
opencv/{ade,cvat,dldt,open_model_zoo,opencv{,_{3rdparty,contrib,extra}},openvino_training_extensions},\
OpenFOAM/{{OpenFOAM,ThirdParty}-{{2.{0,1,2,3,4},3.0,4,5}.x,6,7,dev},OpenFOAM-{Intel,Solidification},OpenQBMM},\
openssl/openssl,\
open-telemetry/{opentelemetry-{collector,cpp,dotnet,go,java,js,log-collection,operator,proto,python,specification},oteps},\
openucx/{shmem-opensnapi,sparkucx,torch-ucc,ucc{,_spec},ucx,xccl,xucg},\
openwrt/{luci,openwrt,packages,targets,telephony,video},\
PeachPy/enum34,\
phacility/{arcanist,javelin,phabricator,xhprof},\
protocolbuffers/{protobuf,upb},\
pybind/pybind11,\
PythonCharmers/python-future,\
python-pillow/{Pillow,pillow-perf,Sane},\
pypa/{packaging,pip,pipenv,setuptools{,_scm},virtualenv,warehouse,wheel},\
pyparsing/pyparsing,\
pytest-dev/{pluggy,py,pytest},\
python/typing,\
python-attrs/attrs,\
pytorch/{audio,botorch,captum,cppdocs,cpuinfo,elastic,examples,fairseq,FBGEMM,functorch,glow,ignite,kineto,pytorch,QNNPACK,serve,tensorpipe,text,translate,tutorials,vision,xla},\
RadeonOpenCompute/{hcc,ROCm-Device-Libs,ROCR-Runtime},\
reactos/{rapps-db,reactos{,dbg},RosBE,wine},\
redis/{redis{,-{benchmarks-specification,doc,debian,hashes,io,rb,rcp,snap,specifications}},hiredis{,-node,-py,-rb},jedis},\
RMerl/{am-toolchains,asuswrt-merlin.ng},\
ROCm-Developer-Tools/HIP,\
ryd/chaosvpn,\
SchedMD/slurm,\
scikit-learn/{enhancement_proposals,examples-data,scikit-learn{,-benchmarks}},\
scipy/{boost-headers-only,HiGHS,oldest-supported-numpy,PROPACK,scipy{,-cookbook,-mathjax,-sphinx-theme{,-v2}},unuran,weave},\
shadowsocks/{ShadowsocksX-NG,ipset,lib{QtShadowsocks,bloom,cork},shadowsocks{,-go,-libev,-manager,-windows},simple-obfs,v2ray-plugin},\
shibatch/sleef,\
simdjson/simdjson,\
sivel/{go-speedtest,speedtest-cli},\
Sysinternals/{Proc{Dump,Mon}-for-Linux,sysinternals,SysinternalsEBPF,Sysmon{Common,ForLinux}},\
Tencent/rapidjson,\
tensorflow/{agents,datasets,docs,io,models,tensorboard,tensorflow,transform},\
thrust/thrust,\
tmux/tmux,\
tmux-plugins/{tmux-{continuum,resurrect,sensible,test},tpm},\
torvalds/linux,\
tqdm/{py-make,tqdm},\
uploadcare/pillow-simd,\
USCiLab/cereal,\
v2ray/{dist,ext,geoip,homebrew-v2ray,v2ray-core,V2RayN},\
vivkin/gason,\
wjakob/clang-cindex-python3,\
xianyi/OpenBLAS,\
xkszltl/{glog,jsoncpp,hiredis,leveldb,linux-syscall-support,onnx,onnx-tensorrt,onnxruntime,protobuf,pthreadpool,pybind11,pytorch,rocksdb,simdjson,utf8proc,vision,xucg},\
yaml/pyyaml,\
Yangqing/ios-cmake,\
yixuan/{LBFGSpp,MiniDNN,recosystem,spectra},\
zeromq/{cppzmq,libzmq,pyzmq},\
zerotier/{libzt,ZeroTier{One,NAS}},\
zeux/{meshoptimizer,pugixml},\
zfsonlinux/{pkg-{spl,zfs},spl,zfs{,-auto-snapshot,-buildbot,-images}},\
zserge/jsmn,\
},\
https://gitlab.com/\ /\ {\
libeigen/eigen,\
NVIDIA/{cloud-native/{cnt-docs,go-nvlib,k8s-driver-manager,mig-parted},container-{images/{caffe,cuda{,-ppc64le,gl},digits,dockerhub-manifests,driver,l4t-base,mps,opencl,opengl,samples,video-codec-sdk,vulkan},infrastructure/{aws-kube-ci,github-app},toolkit/{container-{config,runtime,toolkit},gpu-monitoring-tools,libnvidia-container,nvidia-docker}},dlsyseng/{slurm,spank_fstab},headers/{cuda,cudnn},hpc/slurm-mig-discovery,kubernetes/{device-plugin,gpu-{feature-discovery,operator}},cuda},\
pycqa/flake8,\
},\
https://gitlab.alpinelinux.org/\ /\ {\
alpine/{abuild,alpine-{baselayout,conf},apk-tools,aports,awall,ca-certificates,dmvpn-tools,docs/{{developer,user}-handbook,docs.a.o,governance},infra/{alpine-{mksite,secdb},aports-turbo,build-server-status,compose/{algitbot,alpine-mirror-sync,appstream-generator,cgit,gitlab-{acceptance-tests,inbound-email,runner-alpine-ci},netbox,package-host,webhook},docker/{alpine-gitlab-ci,ansible,apkbuild-lint-tools,aports-{build,turbo},appstream-generator,build-base,darkhttpd,docker-{cli,compose},git-mirror-syncd,gitlab{,-runner{,-helper}},lua-turbo,mariadb,mirror-status,mlmmj,mqtt-exec,netbox,package-builder,rsyncd,secdb,turbo-paste,uacme-nsd-wildcard,unbound,webhook},gitlab-ci-templates,infra-packages,mirror-status,turbo-paste,zabbix-agent2-plugins},lua-aports,mkinitfs},\
},\
https://sourceware.org/git/\ sourceware\ {\
valgrind,\
},\
}
