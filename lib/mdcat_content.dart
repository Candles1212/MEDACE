class MdcatUnit {
  final String id;
  final String title;
  final List<String> topics;
  const MdcatUnit(this.id, this.title, this.topics);
}

class MdcatSubject {
  final String id;
  final String title;
  final String weight;
  final int mcqCount;
  final List<MdcatUnit> units;
  const MdcatSubject(this.id, this.title, this.weight, this.mcqCount, this.units);
}

class MdcatQuestion {
  final String id, subjectId, unitId, prompt;
  final List<String> options;
  final int answer;
  final String explanation, difficulty;
  const MdcatQuestion({
    required this.id, required this.subjectId, required this.unitId,
    required this.prompt, required this.options, required this.answer,
    required this.explanation, this.difficulty = 'Moderate',
  });
}

const mdcatSubjects = <MdcatSubject>[
  MdcatSubject('bio', 'Biology', '45%', 81, [
    MdcatUnit('bio-01','Acellular Life',['Virus structure and classification','DNA and RNA viruses','Viral hosts and diseases','HIV infection and AIDS: cause, transmission and symptoms']),
    MdcatUnit('bio-02','Bioenergetics',['Cellular respiration of glucose','Entry of fats and proteins into respiration','Aerobic and anaerobic respiration','ATP and energy transfer']),
    MdcatUnit('bio-03','Biological Molecules',['Water: polarity, solvent properties and cohesion','Monosaccharides, disaccharides and polysaccharides','Amino acids and protein structure','Triglycerides and phospholipids','RNA and conjugated molecules']),
    MdcatUnit('bio-04','Cell Structure and Function',['Plant and animal cells','Prokaryotic and eukaryotic cells','Nucleus and chromosomes','Endoplasmic reticulum and Golgi apparatus','Mitochondria']),
    MdcatUnit('bio-05','Coordination and Control',['Receptors and stimuli','Neuron structure and myelin sheath','Nerve impulses','Reflexes and reflex arc','Brain: cerebrum, cerebellum and brain stem']),
    MdcatUnit('bio-06','Enzymes',['Enzyme characteristics','Active site and mechanism of action','Temperature, pH and concentration','Competitive and non-competitive inhibition']),
    MdcatUnit('bio-07','Evolution',['Origin of life','Lamarckism and acquired characteristics','Darwinism and natural selection']),
    MdcatUnit('bio-08','Reproduction',['Male reproductive system','Female reproductive system','Reproductive hormones and menstrual cycle','Sexually transmitted infections']),
    MdcatUnit('bio-09','Support and Movement',['Cartilage and bone','Skeletal, smooth and cardiac muscles','Muscle ultrastructure and contraction','Joints and arthritis']),
    MdcatUnit('bio-10','Inheritance',['Mendelian laws','Monohybrid and dihybrid crosses','Independent assortment','Linkage and crossing over','Sex-linked inheritance']),
    MdcatUnit('bio-11','Circulation',['Heart structure and cardiac cycle','Blood and blood vessels','Double circulation','Lymphatic system']),
    MdcatUnit('bio-12','Immunity',['Innate and adaptive defence','Antigens and antibodies','B cells and T cells','Specific immune response']),
    MdcatUnit('bio-13','Respiration',['Human respiratory tract','Mechanism of breathing','Gas exchange and transport','Effects of smoking']),
    MdcatUnit('bio-14','Digestion',['Digestive tract and accessory organs','Digestive enzymes','Absorption of nutrients','Liver and pancreas']),
    MdcatUnit('bio-15','Homeostasis',['Kidney structure and nephron','Filtration, reabsorption and secretion','Osmoregulation and excretion','Thermoregulation','Kidney stones and kidney failure']),
    MdcatUnit('bio-16','Biotechnology',['Vaccines and immunization','Disease diagnosis','DNA/RNA probes','Monoclonal antibodies','Therapeutic products']),
  ]),
  MdcatSubject('chem','Chemistry','25%',45,[
    MdcatUnit('chem-01','Fundamental Concepts',['Mole concept and Avogadro constant','Stoichiometry','Limiting and excess reactants','Theoretical and percentage yield']),
    MdcatUnit('chem-02','Atomic Structure',['Protons, electrons and neutrons','Quantum theory and photons','Orbitals and quantum numbers','Hydrogen spectrum','Electronic configuration']),
    MdcatUnit('chem-03','Gases',['Kinetic molecular theory','Boyle and Charles laws','Ideal gas equation','STP and real gases']),
    MdcatUnit('chem-04','Liquids',['Intermolecular forces','Evaporation and vapour pressure','Boiling point','Hydrogen bonding and water']),
    MdcatUnit('chem-05','Solids',['Crystalline solids','Ionic and molecular crystals','Crystal lattice','Lattice energy']),
    MdcatUnit('chem-06','Chemical Equilibrium',['Reversible reactions','Law of mass action','Le Chatelier principle','Solubility product and common ion effect','Buffers and Haber process']),
    MdcatUnit('chem-07','Reaction Kinetics',['Rate of reaction','Factors affecting rate','Rate law and reaction order','Activation energy and rate constant']),
    MdcatUnit('chem-08','Thermochemistry and Energetics',['Exothermic and endothermic reactions','First law of thermodynamics','Internal energy and enthalpy','Hess law']),
    MdcatUnit('chem-09','Electrochemistry',['Oxidation and reduction','Oxidation numbers','Balancing redox equations','Electrodes and standard hydrogen electrode']),
    MdcatUnit('chem-10','Chemical Bonding',['Ionic and covalent bonding','VSEPR theory and molecular shapes','Sigma and pi bonds','Hybridization and polarity']),
    MdcatUnit('chem-11','S- and P-Block Elements',['Periodic trends','Group I and II properties','Group IV elements and compounds']),
    MdcatUnit('chem-12','Transition Elements',['d-block electronic configuration','Transition metal ions','Variable oxidation states and properties']),
    MdcatUnit('chem-13','Fundamental Organic Chemistry',['Classification of organic compounds','Functional groups and nomenclature','Isomerism and stereoisomerism']),
    MdcatUnit('chem-14','Hydrocarbons',['Alkanes, alkenes and alkynes','Benzene and aromaticity','Free radicals and resonance','Organic reaction types']),
    MdcatUnit('chem-15','Alkyl Halides',['Nomenclature and structure','Nucleophilic substitution','Elimination reactions']),
    MdcatUnit('chem-16','Alcohols and Phenols',['Structure and nomenclature','Preparation and reactions','Ethers and esters','Alcohols versus phenols']),
    MdcatUnit('chem-17','Aldehydes and Ketones',['Structure and nomenclature','Nucleophilic addition','Oxidation and reduction']),
    MdcatUnit('chem-18','Carboxylic Acids',['Structure and nomenclature','Preparation and reactions','Acid derivatives']),
    MdcatUnit('chem-19','Macromolecules',['Amino acids and proteins','Levels of protein structure','Enzymes as biocatalysts']),
    MdcatUnit('chem-20','Industrial Chemistry',['Adhesives','Dyes','Addition polymers','Condensation polymers']),
  ]),
  MdcatSubject('phys','Physics','20%',36,[
    MdcatUnit('phys-01','Vectors and Equilibrium',['Vector addition and components','Scalar and vector products','Conditions of equilibrium']),
    MdcatUnit('phys-02','Force and Motion',['Displacement, velocity and acceleration','Motion graphs','Projectile motion','Newton laws and momentum','Collisions']),
    MdcatUnit('phys-03','Work and Energy',['Work and power','Kinetic and potential energy','Work-energy theorem','Efficiency']),
    MdcatUnit('phys-04','Rotational and Circular Motion',['Angular displacement and radians','Angular velocity','Linear and angular quantities']),
    MdcatUnit('phys-05','Fluid Dynamics',['Viscosity and terminal velocity','Laminar and turbulent flow','Equation of continuity','Bernoulli equation']),
    MdcatUnit('phys-06','Waves',['Progressive and stationary waves','Transverse and longitudinal waves','Sound and interference','Strings and organ pipes','Simple harmonic motion']),
    MdcatUnit('phys-07','Thermodynamics',['Thermal equilibrium and heat','Specific heat capacity','First law of thermodynamics','Molar specific heat of gases']),
    MdcatUnit('phys-08','Electrostatics',['Coulomb law','Electric field and field lines','Electric potential','Capacitor charging and discharging']),
    MdcatUnit('phys-09','Current Electricity',['Electric current and Ohm law','Resistance and resistivity','Internal resistance','Maximum power transfer']),
    MdcatUnit('phys-10','Electromagnetism',['Magnetic fields and flux density','Magnetic flux','Charged particles in magnetic fields']),
    MdcatUnit('phys-11','Electromagnetic Induction',['Faraday law','Lenz law','Transformers']),
    MdcatUnit('phys-12','Alternating Current',['AC phase and phase difference','AC in resistors, capacitors and inductors','Electromagnetic spectrum']),
    MdcatUnit('phys-13','Electronics',['Diodes and rectification','PN junction','Forward and reverse bias']),
    MdcatUnit('phys-14','Dawn of Modern Physics',['Quantum theory','Photons and radiation']),
    MdcatUnit('phys-15','Atomic Spectra',['Atomic energy levels','Emission and absorption spectra','Line spectra']),
    MdcatUnit('phys-16','Nuclear Physics',['Nuclear structure and stability','Radioactive decay','Half-life','Medical and biological applications of radiation']),
  ]),
  MdcatSubject('eng','English','5%',9,[
    MdcatUnit('eng-01','Reading and Thinking Skills',['Scanning for information','Contextual meaning','Figurative language and literary expression']),
    MdcatUnit('eng-02','Formal and Lexical Aspects',['Vocabulary and synonyms','Pronoun-antecedent agreement','Tenses, infinitives and gerunds','Adverbs and prepositions','Transitions and punctuation','Sentence types, phrases and inversion','Active/passive voice and direct/indirect speech']),
    MdcatUnit('eng-03','Writing Skills',['Proofreading and editing','Sentence structure','Subject-verb agreement','Usage and spelling']),
  ]),
  MdcatSubject('logic','Logical Reasoning','5%',9,[
    MdcatUnit('logic-01','Critical Thinking',['Evaluate arguments','Distinguish facts, opinions and assumptions','Assess evidence and conclusions']),
    MdcatUnit('logic-02','Letter and Symbol Series',['Number patterns','Arithmetic and geometric sequences','Letter and symbol patterns']),
    MdcatUnit('logic-03','Logical Deductions',['Conclusions from statements','Conditional reasoning','Relationships and arrangements']),
    MdcatUnit('logic-04','Logical Problems',['Ordering and grouping puzzles','Constraint-based reasoning','Deductive problem solving']),
    MdcatUnit('logic-05','Course of Action',['Evaluate proposed actions','Choose a relevant and practical response']),
    MdcatUnit('logic-06','Cause and Effect',['Identify causes and outcomes','Distinguish correlation from causation']),
  ]),
];

const mdcatQuestions = <MdcatQuestion>[
  MdcatQuestion(id:'B001',subjectId:'bio',unitId:'bio-01',prompt:'Which feature is present in all viruses?',options:['A cellular nucleus','Genetic material enclosed in a protein coat','A mitochondrion','A complete ribosome'],answer:1,explanation:'A virus contains genetic material (DNA or RNA) protected by a protein capsid. Viruses are acellular and lack organelles such as mitochondria and ribosomes.'),
  MdcatQuestion(id:'B002',subjectId:'bio',unitId:'bio-03',prompt:'Which property of water helps organisms resist rapid temperature changes?',options:['Low specific heat capacity','High specific heat capacity','Low surface tension','Non-polarity'],answer:1,explanation:'Water has a high specific heat capacity, so it absorbs or releases substantial heat with relatively small temperature changes.'),
  MdcatQuestion(id:'B003',subjectId:'bio',unitId:'bio-04',prompt:'Which organelle is the principal site of aerobic ATP production?',options:['Golgi apparatus','Lysosome','Mitochondrion','Ribosome'],answer:2,explanation:'Most ATP generated during aerobic cellular respiration is produced by oxidative phosphorylation on the inner mitochondrial membrane.'),
  MdcatQuestion(id:'B004',subjectId:'bio',unitId:'bio-06',prompt:'An enzyme-catalysed reaction slows sharply when temperature rises far above the enzyme optimum. What is the most likely reason?',options:['The substrate becomes a catalyst','The enzyme may become denatured','The activation energy becomes infinite','The enzyme is converted into DNA'],answer:1,explanation:'Excessive heat disrupts the interactions maintaining an enzyme’s three-dimensional shape, changing its active site.'),
  MdcatQuestion(id:'B005',subjectId:'bio',unitId:'bio-10',prompt:'In a cross Aa × Aa, assuming complete dominance and independent segregation, what fraction of offspring is expected to be aa?',options:['1/2','1/4','3/4','All'],answer:1,explanation:'The genotype ratio is 1 AA : 2 Aa : 1 aa. Therefore, one quarter of offspring are expected to be homozygous recessive.'),
  MdcatQuestion(id:'C001',subjectId:'chem',unitId:'chem-01',prompt:'How many moles are present in 18 g of water? (Molar mass = 18 g mol⁻¹)',options:['0.5 mol','1 mol','2 mol','18 mol'],answer:1,explanation:'Moles = mass ÷ molar mass = 18 g ÷ 18 g mol⁻¹ = 1 mol.'),
  MdcatQuestion(id:'C002',subjectId:'chem',unitId:'chem-02',prompt:'Which quantum number describes the principal energy level of an electron?',options:['Azimuthal quantum number (l)','Magnetic quantum number (m)','Principal quantum number (n)','Spin quantum number (s)'],answer:2,explanation:'The principal quantum number n identifies the main shell and is related to the orbital’s energy and average distance from the nucleus.'),
  MdcatQuestion(id:'C003',subjectId:'chem',unitId:'chem-06',prompt:'For an exothermic forward reaction, increasing temperature generally shifts equilibrium in which direction?',options:['Forward direction','Reverse direction','No direction; equilibrium disappears','Only toward the catalyst'],answer:1,explanation:'Heat behaves like a product in an exothermic reaction. Adding heat shifts equilibrium in the endothermic, reverse direction.'),
  MdcatQuestion(id:'C004',subjectId:'chem',unitId:'chem-09',prompt:'Oxidation is best defined as:',options:['Gain of electrons','Loss of electrons','Gain of neutrons','Decrease in oxidation number'],answer:1,explanation:'Oxidation is loss of electrons and is accompanied by an increase in oxidation number.'),
  MdcatQuestion(id:'C005',subjectId:'chem',unitId:'chem-10',prompt:'What is the molecular geometry of methane (CH₄)?',options:['Linear','Trigonal planar','Tetrahedral','Bent'],answer:2,explanation:'Four bonding pairs around carbon repel equally and arrange tetrahedrally, giving an ideal bond angle of about 109.5°.'),
  MdcatQuestion(id:'P001',subjectId:'phys',unitId:'phys-01',prompt:'Two perpendicular vectors have magnitudes 3 units and 4 units. What is the magnitude of their resultant?',options:['1 unit','5 units','7 units','12 units'],answer:1,explanation:'For perpendicular vectors, R = √(3² + 4²) = √25 = 5 units.'),
  MdcatQuestion(id:'P002',subjectId:'phys',unitId:'phys-02',prompt:'The slope of a displacement-time graph represents:',options:['Acceleration','Velocity','Force','Momentum'],answer:1,explanation:'The gradient of a displacement-time graph is change in displacement divided by time, which is velocity.'),
  MdcatQuestion(id:'P003',subjectId:'phys',unitId:'phys-03',prompt:'A body’s speed doubles while its mass remains constant. Its kinetic energy becomes:',options:['Twice','Three times','Four times','Half'],answer:2,explanation:'Kinetic energy is ½mv². Doubling speed multiplies v² by four, so kinetic energy becomes four times.'),
  MdcatQuestion(id:'P004',subjectId:'phys',unitId:'phys-05',prompt:'For steady incompressible flow through a pipe, the continuity equation states that:',options:['Pressure is always constant','Area × speed is constant','Density × pressure is constant','Speed is independent of area'],answer:1,explanation:'For incompressible steady flow, A₁v₁ = A₂v₂. Fluid speed increases where the pipe’s cross-sectional area decreases.'),
  MdcatQuestion(id:'P005',subjectId:'phys',unitId:'phys-16',prompt:'A radioactive sample has a half-life of 4 hours. What fraction remains after 12 hours?',options:['1/2','1/4','1/8','1/16'],answer:2,explanation:'Twelve hours is three half-lives. Remaining fraction = (1/2)³ = 1/8.'),
  MdcatQuestion(id:'E001',subjectId:'eng',unitId:'eng-02',prompt:'Choose the grammatically correct sentence.',options:['Each of the students have a book.','Each of the students has a book.','Each students has a book.','Each of students have a book.'],answer:1,explanation:'Each is singular and takes a singular verb: “Each ... has”.'),
  MdcatQuestion(id:'E002',subjectId:'eng',unitId:'eng-02',prompt:'Choose the closest meaning of “concise”.',options:['Brief and clear','Confusing','Unnecessarily long','Uncertain'],answer:0,explanation:'Concise means expressing information clearly in few words.'),
  MdcatQuestion(id:'L001',subjectId:'logic',unitId:'logic-02',prompt:'Find the next number: 3, 6, 12, 24, ___.',options:['30','36','48','60'],answer:2,explanation:'Each term is multiplied by 2. Therefore, 24 × 2 = 48.'),
  MdcatQuestion(id:'L002',subjectId:'logic',unitId:'logic-03',prompt:'All roses are flowers. Some flowers fade quickly. Which conclusion must be true?',options:['All roses fade quickly','Some roses fade quickly','All roses are flowers','No flowers are roses'],answer:2,explanation:'The first statement directly guarantees that every rose belongs to the group of flowers. The second statement does not establish that any roses are among the flowers that fade quickly.'),
];
