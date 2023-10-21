3org.tribuo.classification.sgd.linear.LinearSGDModel�|
Jtype.googleapis.com/tribuo.classification.sgd.ClassificationLinearSGDProto�|
�y
linear-sgd-model�k
�linearsgdmodel-03org.tribuo.classification.sgd.linear.LinearSGDModel"%org.tribuo.provenance.ModelProvenance*
instance-values*
tribuo-version*
java-version*
trainer*
os-arch*

trained-at*
os-name*
dataset*

class-name	
�
mutabledataset-1org.tribuo.MutableDataset"'org.tribuo.provenance.DatasetProvenance*
num-features*
num-examples*
num-outputs*
tribuo-version*

datasource*
transformations*
is-sequence*
is-dense*

class-name
�logisticregressiontrainer-2>org.tribuo.classification.sgd.linear.LogisticRegressionTrainer"0org.tribuo.provenance.impl.TrainerProvenanceImpl*
seed*
tribuo-version*
minibatchSize*
train-invocation-count*
is-sequence*
shuffle*

epochs*
	optimiser*
host-short-name*

class-name*
loggingInterval*
	objective 
�!traintestsplitter-3'org.tribuo.evaluation.TrainTestSplitter"Aorg.tribuo.evaluation.TrainTestSplitter$SplitDataSourceProvenance*
train-proportion"*
seed#*
size$*

source%*

class-name&*
is-train'
�(	adagrad-4"org.tribuo.math.optimisers.AdaGrad"Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl*
epsilon)*
initialLearningRate**
initialValue+*
host-short-name,*

class-name-
�.logmulticlass-56org.tribuo.classification.sgd.objectives.LogMulticlass"Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl*
host-short-name/*

class-name0
�1csvdatasource-6!org.tribuo.data.csv.CSVDataSource"9org.tribuo.data.csv.CSVDataSource$CSVDataSourceProvenance*
resource-hash2*
headers3*
rowProcessor9*
file-modified-time:*	
quote;*
outputRequired<*
datasource-creation-time=*
outputFactory>*
	separator?*
host-short-name@*

class-nameA*
dataPathB
�Crowprocessor-7%org.tribuo.data.columnar.RowProcessor"Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl*
metadataExtractorsD*
fieldProcessorListE*
featureProcessorsJ*
responseProcessorK*
weightExtractorL*
replaceNewlinesWithSpacesM*
regexMappingProcessorsN*
host-short-nameO*

class-nameP
�Qlabelfactory-15&org.tribuo.classification.LabelFactory"=org.tribuo.classification.LabelFactory$LabelFactoryProvenance*

class-nameR
�Sdoublefieldprocessor-9>org.tribuo.data.columnar.processors.field.DoubleFieldProcessor"Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl*
	fieldNameT*
onlyFieldNameU*
throwOnInvalidV*
host-short-nameW*

class-nameX
�Ydoublefieldprocessor-10>org.tribuo.data.columnar.processors.field.DoubleFieldProcessor"Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl*
	fieldNameZ*
onlyFieldName[*
throwOnInvalid\*
host-short-name]*

class-name^
�_doublefieldprocessor-11>org.tribuo.data.columnar.processors.field.DoubleFieldProcessor"Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl*
	fieldName`*
onlyFieldNamea*
throwOnInvalidb*
host-short-namec*

class-named
�edoublefieldprocessor-12>org.tribuo.data.columnar.processors.field.DoubleFieldProcessor"Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl*
	fieldNamef*
onlyFieldNameg*
throwOnInvalidh*
host-short-namei*

class-namej
�kfieldresponseprocessor-13Corg.tribuo.data.columnar.processors.response.FieldResponseProcessor"Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl*
	uppercasel*

fieldNamesm*
defaultValueso*
displayFieldq*
outputFactoryr*
host-short-names*

class-namet
�ufieldextractor-14'org.tribuo.data.columnar.FieldExtractor"Ccom.oracle.labs.mlrg.olcut.provenance.impl.NullConfiguredProvenance*

class-namev\tribuo-version4.3.1*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance[java-version17.0.6*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance\trainerlogisticregressiontrainer-2*0org.tribuo.provenance.impl.TrainerProvenanceImpl0Uos-archamd64*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenancex
trained-at#2023-10-21T18:11:43.639825975-05:00*Ccom.oracle.labs.mlrg.olcut.provenance.primitives.DateTimeProvenanceUos-nameLinux*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceHdatasetmutabledataset-1*'org.tribuo.provenance.DatasetProvenance0�	
class-name3org.tribuo.classification.sgd.linear.LinearSGDModel*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceSnum-features4*>com.oracle.labs.mlrg.olcut.provenance.primitives.IntProvenanceUnum-examples105*>com.oracle.labs.mlrg.olcut.provenance.primitives.IntProvenanceRnum-outputs3*>com.oracle.labs.mlrg.olcut.provenance.primitives.IntProvenance\tribuo-version4.3.1*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceh
datasourcetraintestsplitter-3*Aorg.tribuo.evaluation.TrainTestSplitter$SplitDataSourceProvenance0Zis-sequencefalse*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenanceVis-densetrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenancel
class-nameorg.tribuo.MutableDataset*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenancePseed12345*?com.oracle.labs.mlrg.olcut.provenance.primitives.LongProvenance\tribuo-version4.3.1*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceTminibatchSize1*>com.oracle.labs.mlrg.olcut.provenance.primitives.IntProvenance]train-invocation-count0*>com.oracle.labs.mlrg.olcut.provenance.primitives.IntProvenanceZis-sequencefalse*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenanceUshuffletrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenanceMepochs5*>com.oracle.labs.mlrg.olcut.provenance.primitives.IntProvenancee	optimiser	adagrad-4*Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl0_host-short-nameTrainer*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance�
class-name>org.tribuo.classification.sgd.linear.LogisticRegressionTrainer*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceYloggingInterval1000*>com.oracle.labs.mlrg.olcut.provenance.primitives.IntProvenancek 	objectivelogmulticlass-5*Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl0\"train-proportion0.7*Acom.oracle.labs.mlrg.olcut.provenance.primitives.DoubleProvenanceL#seed1*?com.oracle.labs.mlrg.olcut.provenance.primitives.LongProvenanceM$size150*>com.oracle.labs.mlrg.olcut.provenance.primitives.IntProvenanceX%sourcecsvdatasource-6*9org.tribuo.data.csv.CSVDataSource$CSVDataSourceProvenance0z&
class-name'org.tribuo.evaluation.TrainTestSplitter*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceV'is-traintrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenanceS)epsilon0.1*Acom.oracle.labs.mlrg.olcut.provenance.primitives.DoubleProvenance_*initialLearningRate1.0*Acom.oracle.labs.mlrg.olcut.provenance.primitives.DoubleProvenanceX+initialValue0.0*Acom.oracle.labs.mlrg.olcut.provenance.primitives.DoubleProvenances,host-short-nameStochasticGradientOptimiser*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceu-
class-name"org.tribuo.math.optimisers.AdaGrad*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenancef/host-short-nameLabelObjective*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance�0
class-name6org.tribuo.classification.sgd.objectives.LogMulticlass*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance�2resource-hash@0FED2A99DB77EC533A62DC66894D3EC6DF3B58B6A8F3CF4A6B47E4086B7F97DC"SHA256*?com.oracle.labs.mlrg.olcut.provenance.primitives.HashProvenance[4headerssepalLength*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceZ5headers
sepalWidth*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance[6headerspetalLength*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceZ7headers
petalWidth*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceW8headersspecies*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenancem9rowProcessorrowprocessor-7*Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl0z:file-modified-time2023-10-21T13:03:17.023-05:00*Ccom.oracle.labs.mlrg.olcut.provenance.primitives.DateTimeProvenanceM;quote"*?com.oracle.labs.mlrg.olcut.provenance.primitives.CharProvenance\<outputRequiredtrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenance�=datasource-creation-time#2023-10-21T18:11:43.539977713-05:00*Ccom.oracle.labs.mlrg.olcut.provenance.primitives.DateTimeProvenancec>outputFactorylabelfactory-15*=org.tribuo.classification.LabelFactory$LabelFactoryProvenance0Q?	separator,*?com.oracle.labs.mlrg.olcut.provenance.primitives.CharProvenanceb@host-short-name
DataSource*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenancetA
class-name!org.tribuo.data.csv.CSVDataSource*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceuBdataPath&/home/alex/dev/ai-demo/bezdekIris.data*?com.oracle.labs.mlrg.olcut.provenance.primitives.FileProvenance{FfieldProcessorListdoublefieldprocessor-9*Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl0|GfieldProcessorListdoublefieldprocessor-10*Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl0|HfieldProcessorListdoublefieldprocessor-11*Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl0|IfieldProcessorListdoublefieldprocessor-12*Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl0}KresponseProcessorfieldresponseprocessor-13*Icom.oracle.labs.mlrg.olcut.provenance.impl.ConfiguredObjectProvenanceImpl0mLweightExtractorfieldextractor-14*Ccom.oracle.labs.mlrg.olcut.provenance.impl.NullConfiguredProvenance0gMreplaceNewlinesWithSpacestrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenancedOhost-short-nameRowProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenancexP
class-name%org.tribuo.data.columnar.RowProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceyR
class-name&org.tribuo.classification.LabelFactory*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance]T	fieldNamepetalLength*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance[UonlyFieldNametrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenance\VthrowOnInvalidtrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenancefWhost-short-nameFieldProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance�X
class-name>org.tribuo.data.columnar.processors.field.DoubleFieldProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance\Z	fieldName
petalWidth*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance[[onlyFieldNametrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenance\\throwOnInvalidtrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenancef]host-short-nameFieldProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance�^
class-name>org.tribuo.data.columnar.processors.field.DoubleFieldProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance\`	fieldName
sepalWidth*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance[aonlyFieldNametrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenance\bthrowOnInvalidtrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenancefchost-short-nameFieldProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance�d
class-name>org.tribuo.data.columnar.processors.field.DoubleFieldProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance]f	fieldNamesepalLength*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance[gonlyFieldNametrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenance\hthrowOnInvalidtrue*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenancefihost-short-nameFieldProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance�j
class-name>org.tribuo.data.columnar.processors.field.DoubleFieldProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceXl	uppercasefalse*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenanceZn
fieldNamesspecies*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceTpdefaultValues*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance[qdisplayFieldfalse*Bcom.oracle.labs.mlrg.olcut.provenance.primitives.BooleanProvenancecroutputFactorylabelfactory-15*=org.tribuo.classification.LabelFactory$LabelFactoryProvenance0ishost-short-nameResponseProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenance�t
class-nameCorg.tribuo.data.columnar.processors.response.FieldResponseProcessor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenancezv
class-name'org.tribuo.data.columnar.FieldExtractor*Acom.oracle.labs.mlrg.olcut.provenance.primitives.StringProvenanceN""	345678"D"EFGHI"J"mn"op"�org.tribuo.ImmutableFeatureMap�
8type.googleapis.com/tribuo.core.ImmutableFeatureMapProto�
�org.tribuo.CategoricalIDInfo�
6type.googleapis.com/tribuo.core.CategoricalIDInfoProto�
petalLengthiR�333333�?������@������@      @333333�?������@������@      @������@������@      @ffffff�?      @      @      @������@������@ffffff�?      @������@������@������@������@333333@�������?333333@ffffff@333333@ffffff
@      �?ffffff@ffffff@ffffff@ffffff@      �?�������?333333@ffffff@ffffff@Z'	a      �
�org.tribuo.CategoricalIDInfo�
6type.googleapis.com/tribuo.core.CategoricalIDInfoProto�

petalWidthiR�       @      �?333333�?333333�?�������?�������?�������?      @ffffff@333333�?�������?������ @333333�?ffffff�?      �?333333@�������?�������?ffffff�?      �?�������?������@Za      �
�org.tribuo.CategoricalIDInfo�
6type.googleapis.com/tribuo.core.CategoricalIDInfoProto�
sepalLengthiR�������@������@������@������@������@������@������@������@������@      @������@      @������@      @������@      @������@������@333333@333333@333333@333333@333333@333333@ffffff@ffffff@ffffff@ffffff@ffffff@ffffff@ffffff@Za      �
�org.tribuo.CategoricalIDInfo�
6type.googleapis.com/tribuo.core.CategoricalIDInfoProto�

sepalWidthiR�       @ffffff@������@ffffff@      @������@ffffff@      @������@������@ffffff
@      @333333@������	@333333@������@333333@������@333333@������@������@Z

a      �*�,org.tribuo.classification.ImmutableLabelInfo}
Atype.googleapis.com/tribuo.classification.ImmutableLabelInfoProto8
Iris-versicolor
Iris-virginica
Iris-setosa"#$ 24.3.1� org.tribuo.math.LinearParameters�
:type.googleapis.com/tribuo.math.impl.LinearParametersProto�
�org.tribuo.math.la.DenseMatrix�
5type.googleapis.com/tribuo.math.impl.DenseTensorProto~
x�*,�էؿln���N쿛�?��L�?_��ϕԽ����&"�?rڡ���?�=�^S� @��:
G�-�[��D�\������gA������0�
�o'�G���?N\U��?-`�ou��?$"org.tribuo.math.util.ExpNormalizer