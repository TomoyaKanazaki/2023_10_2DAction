xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 215;
 0.12918;-1.36147;-0.73987;,
 0.69640;-1.36147;-0.73987;,
 0.17344;-1.90121;-0.53662;,
 0.74698;-1.90121;-0.53662;,
 0.04066;0.48360;1.21710;,
 0.59523;0.48360;1.21710;,
 0.04066;0.48360;0.64606;,
 0.59523;0.48360;0.64606;,
 0.12918;-1.36147;1.85485;,
 0.17344;-1.90121;1.99324;,
 0.69640;-1.36147;1.85485;,
 0.74698;-1.90121;1.99324;,
 -0.12464;-11.74528;1.09965;,
 -0.12464;-11.74528;1.45863;,
 -0.47917;-11.74528;1.09965;,
 -0.47917;-11.74528;1.45863;,
 1.26362;-1.36147;1.19278;,
 0.97778;-1.36147;1.70532;,
 1.32053;-1.90121;1.36360;,
 1.02070;-1.90121;1.80970;,
 -0.70969;-1.90121;1.80784;,
 -0.73352;-1.36147;1.70346;,
 -0.97365;-1.90121;1.36360;,
 -1.00526;-1.36147;1.19278;,
 0.19196;-4.68128;-0.21041;,
 0.21770;-2.44095;-0.34495;,
 0.79057;-4.68128;-0.21041;,
 0.79757;-2.44095;-0.34495;,
 1.37744;-2.44095;1.50595;,
 1.06362;-2.44095;1.87987;,
 1.38918;-4.68128;1.57668;,
 1.07248;-4.68128;1.88509;,
 0.19196;-4.68128;2.09320;,
 0.79057;-4.68128;2.09320;,
 0.21770;-2.44095;2.08629;,
 0.79757;-2.44095;2.08629;,
 -1.00526;-4.68128;1.57668;,
 -0.73352;-4.68128;1.88324;,
 -0.94205;-2.44095;1.50595;,
 -0.68584;-2.44095;1.87802;,
 -0.00182;-7.49668;-0.07686;,
 0.11402;-6.08898;-0.13248;,
 0.46710;-7.49668;-0.07686;,
 0.65726;-6.08898;-0.13248;,
 1.20050;-6.08898;1.49402;,
 0.93017;-6.08898;1.70162;,
 0.93601;-7.49668;1.31698;,
 0.73068;-7.49668;1.39261;,
 -0.00182;-7.49668;1.44025;,
 0.46710;-7.49668;1.44025;,
 0.11402;-6.08898;1.84995;,
 0.65726;-6.08898;1.84995;,
 -0.93966;-7.49668;1.31698;,
 -0.68404;-7.49668;1.39076;,
 -0.97246;-6.08898;1.49402;,
 -0.70878;-6.08898;1.69976;,
 -0.15815;-8.92284;-0.02608;,
 0.23223;-8.92284;-0.02608;,
 0.62262;-8.92284;1.31176;,
 0.49430;-8.92284;1.34643;,
 -0.15815;-8.92284;1.37903;,
 0.23223;-8.92284;1.37903;,
 -0.93892;-8.92284;1.31176;,
 -0.68348;-8.92284;1.34458;,
 -0.33388;-10.33406;-0.11288;,
 -0.00829;-10.33406;-0.11288;,
 0.31731;-10.33406;1.19505;,
 0.26402;-10.33406;1.23585;,
 -0.33388;-10.33406;1.23241;,
 -0.00829;-10.33406;1.23241;,
 -0.98507;-10.33406;1.19505;,
 -0.71830;-10.33406;1.23399;,
 -0.47917;-11.74528;-0.52991;,
 -0.12464;-11.74528;-0.52991;,
 0.22989;-11.74528;1.09965;,
 0.19809;-11.74528;1.40647;,
 -1.18822;-11.74528;1.09965;,
 -0.87152;-11.74528;1.40462;,
 0.04066;0.48360;-1.19556;,
 0.59523;0.48360;-1.19556;,
 0.04066;-0.28198;-1.08697;,
 0.59523;-0.28198;-1.08697;,
 1.14981;0.48360;0.64606;,
 0.89193;0.48360;1.22430;,
 1.14981;-0.28198;0.83835;,
 0.89193;-0.28198;1.43247;,
 0.59523;-0.28198;1.49310;,
 0.04066;-0.28198;1.49310;,
 -0.78121;-0.28198;1.43061;,
 -0.78121;0.48360;1.22244;,
 -1.06848;-0.28198;0.83835;,
 -1.06848;0.48360;0.64606;,
 0.08492;-0.82173;1.68988;,
 0.64582;-0.82173;1.68988;,
 1.20671;-0.82173;1.02352;,
 0.93485;-0.82173;1.58089;,
 0.08492;-0.82173;-0.91342;,
 0.64582;-0.82173;-0.91342;,
 -0.75736;-0.82173;1.57904;,
 -1.03687;-0.82173;1.02352;,
 1.14981;-0.28198;0.83835;,
 0.89193;-0.28198;1.43247;,
 -0.78121;-0.28198;1.43061;,
 -1.06848;-0.28198;0.83835;,
 -0.69975;-11.74528;1.09965;,
 -0.69975;-11.74528;1.45863;,
 -0.47223;-10.33406;1.23241;,
 -0.32735;-8.92284;1.37903;,
 -0.22576;-7.49668;1.44025;,
 -0.17155;-6.08898;1.84995;,
 -0.14207;-4.68128;2.09320;,
 -0.08399;-2.44095;2.08629;,
 -0.13353;-1.90121;1.99324;,
 -0.18306;-1.36147;1.85485;,
 -0.23260;-0.82173;1.68988;,
 -0.28214;-0.28198;1.49310;,
 -0.28214;0.48360;1.21710;,
 -0.28214;0.48360;0.64606;,
 -0.28214;0.48360;-1.19556;,
 -0.28214;-0.28198;-1.08697;,
 -0.23260;-0.82173;-0.91342;,
 -0.18306;-1.36147;-0.73987;,
 -0.13353;-1.90121;-0.53662;,
 -0.08399;-2.44095;-0.34495;,
 -0.14207;-4.68128;-0.21041;,
 -0.17155;-6.08898;-0.13248;,
 -0.22576;-7.49668;-0.07686;,
 -0.32735;-8.92284;-0.02608;,
 -0.47223;-10.33406;-0.11288;,
 -0.69975;-11.74528;-0.52991;,
 1.07248;-4.68128;1.88509;,
 1.06362;-2.44095;1.87987;,
 0.93017;-6.08898;1.70162;,
 0.73068;-7.49668;1.39261;,
 0.49430;-8.92284;1.34643;,
 0.26402;-10.33406;1.23585;,
 0.19809;-11.74528;1.40647;,
 0.22989;-11.74528;1.09965;,
 0.19809;-11.74528;-0.28938;,
 0.26402;-10.33406;0.02516;,
 0.49430;-8.92284;0.09063;,
 0.73068;-7.49668;0.05233;,
 0.93016;-6.08898;0.01038;,
 1.07248;-4.68128;-0.04840;,
 1.06362;-2.44095;-0.14988;,
 1.02070;-1.90121;-0.29444;,
 0.97778;-1.36147;-0.44775;,
 0.93485;-0.82173;-0.57864;,
 0.89193;-0.28198;-0.70954;,
 0.89193;0.48360;-0.79145;,
 0.93485;-0.82173;1.58089;,
 0.97778;-1.36147;1.70532;,
 1.02070;-1.90121;1.80970;,
 -0.87152;-11.74528;1.40462;,
 -1.18822;-11.74528;1.09965;,
 -0.71830;-10.33406;1.23399;,
 -0.68348;-8.92284;1.34458;,
 -0.68404;-7.49668;1.39076;,
 -0.70878;-6.08898;1.69976;,
 -0.73352;-4.68128;1.88324;,
 -0.68584;-2.44095;1.87802;,
 -0.70969;-1.90121;1.80784;,
 -0.73352;-1.36147;1.70346;,
 -0.75736;-0.82173;1.57904;,
 -0.78120;-0.28198;-0.70954;,
 -0.78120;0.48360;-0.79145;,
 -0.75736;-0.82173;-0.57864;,
 -0.73352;-1.36147;-0.44775;,
 -0.70968;-1.90121;-0.29444;,
 -0.68584;-2.44095;-0.14988;,
 -0.73352;-4.68128;-0.04840;,
 -0.70878;-6.08898;0.01038;,
 -0.68404;-7.49668;0.05233;,
 -0.68348;-8.92284;0.09063;,
 -0.71829;-10.33406;0.02516;,
 -0.87152;-11.74528;-0.28938;,
 -1.06848;-0.28198;-0.46384;,
 -1.06848;0.48360;-0.61428;,
 -0.28214;0.48360;-0.61428;,
 0.04066;0.48360;-0.61428;,
 0.59523;0.48360;-0.61428;,
 1.14981;0.48360;-0.61428;,
 1.14981;-0.28198;-0.46384;,
 1.14981;-0.28198;-0.46384;,
 1.20671;-0.82173;-0.28448;,
 1.26362;-1.36147;-0.11308;,
 1.32053;-1.90121;0.07396;,
 1.37744;-2.44095;0.24098;,
 1.38918;-4.68128;0.34361;,
 1.20050;-6.08898;0.34124;,
 0.93601;-7.49668;0.28053;,
 0.62262;-8.92284;0.30331;,
 0.31731;-10.33406;0.20155;,
 0.22989;-11.74528;-0.05466;,
 0.22989;-11.74528;-0.05466;,
 -0.12464;-11.74528;-0.05466;,
 -0.47917;-11.74528;-0.05466;,
 -0.69975;-11.74528;-0.05466;,
 -1.18822;-11.74528;-0.05466;,
 -0.98507;-10.33406;0.20155;,
 -1.18822;-11.74528;-0.05466;,
 -0.93892;-8.92284;0.30331;,
 -0.93966;-7.49668;0.28053;,
 -0.97246;-6.08898;0.34124;,
 -1.00526;-4.68128;0.34361;,
 -0.94205;-2.44095;0.24098;,
 -0.97365;-1.90121;0.07396;,
 -1.00526;-1.36147;-0.11308;,
 -1.03687;-0.82173;-0.28448;,
 -1.06848;-0.28198;-0.46384;,
 -0.12464;-11.74528;-0.52991;,
 0.19809;-11.74528;-0.28938;,
 -0.47917;-11.74528;-0.52991;,
 -0.69975;-11.74528;-0.52991;,
 -0.87152;-11.74528;-0.28938;;
 
 356;
 3;0,1,2;,
 3;1,3,2;,
 3;4,5,6;,
 3;5,7,6;,
 3;8,9,10;,
 3;9,11,10;,
 3;12,13,14;,
 3;13,15,14;,
 3;16,17,18;,
 3;17,19,18;,
 3;20,21,22;,
 3;21,23,22;,
 3;24,25,26;,
 3;25,27,26;,
 3;28,29,30;,
 3;29,31,30;,
 3;32,33,34;,
 3;33,35,34;,
 3;36,37,38;,
 3;37,39,38;,
 3;40,41,42;,
 3;41,43,42;,
 3;44,45,46;,
 3;45,47,46;,
 3;48,49,50;,
 3;49,51,50;,
 3;52,53,54;,
 3;53,55,54;,
 3;56,40,57;,
 3;40,42,57;,
 3;46,47,58;,
 3;47,59,58;,
 3;60,61,48;,
 3;61,49,48;,
 3;62,63,52;,
 3;63,53,52;,
 3;30,31,44;,
 3;31,45,44;,
 3;41,24,43;,
 3;24,26,43;,
 3;54,55,36;,
 3;55,37,36;,
 3;50,51,32;,
 3;51,33,32;,
 3;64,56,65;,
 3;56,57,65;,
 3;58,59,66;,
 3;59,67,66;,
 3;68,69,60;,
 3;69,61,60;,
 3;70,71,62;,
 3;71,63,62;,
 3;72,64,73;,
 3;64,65,73;,
 3;66,67,74;,
 3;67,75,74;,
 3;15,13,68;,
 3;13,69,68;,
 3;76,77,70;,
 3;77,71,70;,
 3;78,79,80;,
 3;79,81,80;,
 3;82,83,84;,
 3;83,85,84;,
 3;5,4,86;,
 3;4,87,86;,
 3;88,89,90;,
 3;89,91,90;,
 3;92,8,93;,
 3;8,10,93;,
 3;94,95,16;,
 3;95,17,16;,
 3;96,97,0;,
 3;97,1,0;,
 3;21,98,23;,
 3;98,99,23;,
 3;87,92,86;,
 3;92,93,86;,
 3;100,101,94;,
 3;101,95,94;,
 3;80,81,96;,
 3;81,97,96;,
 3;98,102,99;,
 3;102,103,99;,
 3;2,3,25;,
 3;3,27,25;,
 3;18,19,28;,
 3;19,29,28;,
 3;9,34,11;,
 3;34,35,11;,
 3;39,20,38;,
 3;20,22,38;,
 3;14,15,104;,
 3;15,105,104;,
 3;105,15,106;,
 3;15,68,106;,
 3;106,68,107;,
 3;68,60,107;,
 3;107,60,108;,
 3;60,48,108;,
 3;108,48,109;,
 3;48,50,109;,
 3;109,50,110;,
 3;50,32,110;,
 3;110,32,111;,
 3;32,34,111;,
 3;112,111,9;,
 3;111,34,9;,
 3;113,112,8;,
 3;112,9,8;,
 3;114,113,92;,
 3;113,8,92;,
 3;115,114,87;,
 3;114,92,87;,
 3;4,116,87;,
 3;116,115,87;,
 3;116,4,117;,
 3;4,6,117;,
 3;118,78,119;,
 3;78,80,119;,
 3;119,80,120;,
 3;80,96,120;,
 3;120,96,121;,
 3;96,0,121;,
 3;121,0,122;,
 3;0,2,122;,
 3;122,2,123;,
 3;2,25,123;,
 3;124,123,24;,
 3;123,25,24;,
 3;125,124,41;,
 3;124,24,41;,
 3;126,125,40;,
 3;125,41,40;,
 3;127,126,56;,
 3;126,40,56;,
 3;128,127,64;,
 3;127,56,64;,
 3;129,128,72;,
 3;128,64,72;,
 3;33,130,35;,
 3;130,131,35;,
 3;51,132,33;,
 3;132,130,33;,
 3;49,133,51;,
 3;133,132,51;,
 3;61,134,49;,
 3;134,133,49;,
 3;69,135,61;,
 3;135,134,61;,
 3;13,136,69;,
 3;136,135,69;,
 3;137,136,12;,
 3;136,13,12;,
 3;73,65,138;,
 3;65,139,138;,
 3;65,57,139;,
 3;57,140,139;,
 3;57,42,140;,
 3;42,141,140;,
 3;42,43,141;,
 3;43,142,141;,
 3;43,26,142;,
 3;26,143,142;,
 3;27,144,26;,
 3;144,143,26;,
 3;3,145,27;,
 3;145,144,27;,
 3;1,146,3;,
 3;146,145,3;,
 3;97,147,1;,
 3;147,146,1;,
 3;81,148,97;,
 3;148,147,97;,
 3;79,149,81;,
 3;149,148,81;,
 3;5,83,7;,
 3;83,82,7;,
 3;86,85,5;,
 3;85,83,5;,
 3;93,150,86;,
 3;150,85,86;,
 3;10,151,93;,
 3;151,150,93;,
 3;11,152,10;,
 3;152,151,10;,
 3;35,131,11;,
 3;131,152,11;,
 3;105,153,104;,
 3;153,154,104;,
 3;106,155,105;,
 3;155,153,105;,
 3;107,156,106;,
 3;156,155,106;,
 3;108,157,107;,
 3;157,156,107;,
 3;109,158,108;,
 3;158,157,108;,
 3;110,159,109;,
 3;159,158,109;,
 3;111,160,110;,
 3;160,159,110;,
 3;161,160,112;,
 3;160,111,112;,
 3;162,161,113;,
 3;161,112,113;,
 3;163,162,114;,
 3;162,113,114;,
 3;88,163,115;,
 3;163,114,115;,
 3;115,116,88;,
 3;116,89,88;,
 3;91,89,117;,
 3;89,116,117;,
 3;164,165,119;,
 3;165,118,119;,
 3;166,164,120;,
 3;164,119,120;,
 3;167,166,121;,
 3;166,120,121;,
 3;168,167,122;,
 3;167,121,122;,
 3;169,168,123;,
 3;168,122,123;,
 3;170,169,124;,
 3;169,123,124;,
 3;171,170,125;,
 3;170,124,125;,
 3;172,171,126;,
 3;171,125,126;,
 3;173,172,127;,
 3;172,126,127;,
 3;174,173,128;,
 3;173,127,128;,
 3;129,175,128;,
 3;175,174,128;,
 3;90,91,176;,
 3;91,177,176;,
 3;177,91,178;,
 3;91,117,178;,
 3;6,179,117;,
 3;179,178,117;,
 3;7,180,6;,
 3;180,179,6;,
 3;82,181,7;,
 3;181,180,7;,
 3;181,82,182;,
 3;82,84,182;,
 3;183,100,184;,
 3;100,94,184;,
 3;184,94,185;,
 3;94,16,185;,
 3;185,16,186;,
 3;16,18,186;,
 3;186,18,187;,
 3;18,28,187;,
 3;187,28,188;,
 3;28,30,188;,
 3;189,188,44;,
 3;188,30,44;,
 3;190,189,46;,
 3;189,44,46;,
 3;190,46,191;,
 3;46,58,191;,
 3;192,191,66;,
 3;191,58,66;,
 3;193,192,74;,
 3;192,66,74;,
 3;194,137,195;,
 3;137,12,195;,
 3;195,12,196;,
 3;12,14,196;,
 3;196,14,197;,
 3;14,104,197;,
 3;154,198,104;,
 3;198,197,104;,
 3;70,199,76;,
 3;199,200,76;,
 3;62,201,70;,
 3;201,199,70;,
 3;62,52,201;,
 3;52,202,201;,
 3;54,203,52;,
 3;203,202,52;,
 3;36,204,54;,
 3;204,203,54;,
 3;36,38,204;,
 3;38,205,204;,
 3;38,22,205;,
 3;22,206,205;,
 3;22,23,206;,
 3;23,207,206;,
 3;23,99,207;,
 3;99,208,207;,
 3;99,103,208;,
 3;103,209,208;,
 3;176,177,164;,
 3;177,165,164;,
 3;118,165,178;,
 3;165,177,178;,
 3;179,78,178;,
 3;78,118,178;,
 3;180,79,179;,
 3;79,78,179;,
 3;181,149,180;,
 3;149,79,180;,
 3;182,148,181;,
 3;148,149,181;,
 3;184,147,183;,
 3;147,148,183;,
 3;185,146,184;,
 3;146,147,184;,
 3;186,145,185;,
 3;145,146,185;,
 3;187,144,186;,
 3;144,145,186;,
 3;188,143,187;,
 3;143,144,187;,
 3;142,143,189;,
 3;143,188,189;,
 3;141,142,190;,
 3;142,189,190;,
 3;140,141,191;,
 3;141,190,191;,
 3;139,140,192;,
 3;140,191,192;,
 3;138,139,193;,
 3;139,192,193;,
 3;210,211,195;,
 3;211,194,195;,
 3;212,210,196;,
 3;210,195,196;,
 3;213,212,197;,
 3;212,196,197;,
 3;198,214,197;,
 3;214,213,197;,
 3;199,174,200;,
 3;174,175,200;,
 3;201,173,199;,
 3;173,174,199;,
 3;201,202,173;,
 3;202,172,173;,
 3;203,171,202;,
 3;171,172,202;,
 3;203,204,171;,
 3;204,170,171;,
 3;204,205,170;,
 3;205,169,170;,
 3;205,206,169;,
 3;206,168,169;,
 3;206,207,168;,
 3;207,167,168;,
 3;207,208,167;,
 3;208,166,167;,
 3;208,209,166;,
 3;209,164,166;;
 
 MeshMaterialList {
  1;
  356;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0;;
  Material {
   1.000000;1.000000;1.000000;1.000000;;
   0.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  178;
  -0.620757;0.259843;-0.739691;,
  0.741128;0.125646;-0.659502;,
  -0.586545;-0.176159;-0.790527;,
  0.712464;-0.106696;-0.693549;,
  -0.557204;0.221614;0.800257;,
  0.579997;0.265284;0.770213;,
  -0.391213;0.114508;0.913149;,
  0.994097;-0.033986;0.103032;,
  -0.589466;-0.134065;-0.796591;,
  0.674835;-0.083904;-0.733183;,
  0.670415;0.086879;0.736882;,
  -0.512960;0.055581;0.856611;,
  -0.580091;-0.031780;-0.813931;,
  0.693402;-0.064390;-0.717668;,
  0.633582;-0.075449;0.769988;,
  -0.566160;-0.054403;0.822498;,
  -0.447446;-0.026253;-0.893925;,
  0.625142;-0.125326;-0.770384;,
  0.294754;-0.170257;0.940283;,
  -0.249766;-0.105749;0.962514;,
  0.511346;-0.205908;0.834342;,
  0.627173;-0.104572;-0.771828;,
  -0.574975;-0.028058;-0.817690;,
  -0.448979;-0.163510;0.878454;,
  -0.522322;0.030768;-0.852193;,
  0.690275;-0.117343;-0.713968;,
  0.261439;-0.100035;0.960022;,
  -0.120056;-0.052369;0.991385;,
  -0.528794;0.162176;-0.833112;,
  0.777844;-0.006626;-0.628423;,
  0.441670;-0.069660;0.894469;,
  -0.117755;0.035107;0.992422;,
  -0.583979;-0.095239;-0.806163;,
  0.725483;-0.080065;-0.683567;,
  0.910283;0.104705;0.400527;,
  -0.891473;0.114593;0.438343;,
  -0.606813;0.158406;0.778900;,
  0.657395;0.231486;0.717110;,
  0.720536;-0.135582;-0.680033;,
  -0.594751;-0.253986;-0.762733;,
  -0.591691;0.191937;0.782983;,
  0.627944;0.262358;0.732704;,
  0.727250;-0.119740;-0.675847;,
  -0.594702;-0.238909;-0.767627;,
  -0.585930;-0.261337;-0.767065;,
  0.700437;-0.149094;-0.697967;,
  0.668697;0.196126;0.717202;,
  -0.606290;0.120256;0.786099;,
  0.000000;0.283395;-0.959003;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.027709;0.999616;,
  0.000000;-0.073147;0.997321;,
  0.000000;-0.162338;0.986735;,
  0.000000;-0.225215;0.974309;,
  0.000000;-0.083914;0.996473;,
  0.000000;0.086793;0.996226;,
  0.000000;0.209298;0.977852;,
  0.000000;0.270403;0.962747;,
  0.000000;0.317522;0.948251;,
  0.000000;0.340834;0.940123;,
  0.000000;1.000000;0.000000;,
  0.000000;-0.140435;-0.990090;,
  0.000000;-0.224080;-0.974571;,
  0.000000;-0.306106;-0.951997;,
  0.000000;-0.329359;-0.944205;,
  0.000000;-0.343542;-0.939137;,
  0.000000;-0.199260;-0.979947;,
  0.000000;-0.057611;-0.998339;,
  0.000000;-0.047379;-0.998877;,
  0.000000;-0.037532;-0.999295;,
  0.000000;0.012919;-0.999916;,
  0.000000;0.173499;-0.984834;,
  0.382340;0.077790;0.920741;,
  0.288519;-0.090928;0.953147;,
  0.188082;-0.232761;0.954174;,
  0.079232;-0.172119;0.981885;,
  0.038998;-0.075255;0.996401;,
  0.022342;0.019277;0.999565;,
  0.204705;0.261834;-0.943154;,
  0.257833;0.129108;-0.957525;,
  0.215956;-0.026492;-0.976044;,
  0.218947;-0.069169;-0.973282;,
  0.233503;-0.073533;-0.969572;,
  0.303399;-0.065445;-0.950613;,
  0.386391;-0.171940;-0.906167;,
  0.359639;-0.280760;-0.889850;,
  0.394948;-0.263458;-0.880117;,
  0.419864;-0.235038;-0.876625;,
  0.440608;-0.190983;-0.877149;,
  0.295626;-0.134158;-0.945837;,
  0.102541;0.334410;0.936832;,
  0.190634;0.308469;0.931937;,
  0.249053;0.266806;0.931014;,
  0.295348;0.207023;0.932690;,
  -0.433283;0.318950;-0.842933;,
  -0.013973;0.033469;0.999342;,
  -0.049989;-0.068446;0.996402;,
  -0.079522;-0.147525;0.985856;,
  -0.144747;-0.214877;0.965855;,
  -0.168363;-0.079889;0.982482;,
  -0.110200;0.082770;0.990457;,
  -0.156830;0.189104;0.969352;,
  -0.137539;0.248799;0.958740;,
  -0.109764;0.297147;0.948502;,
  -0.086861;0.320460;0.943271;,
  -0.026718;0.320003;0.947040;,
  -0.331501;-0.132494;-0.934105;,
  -0.318176;-0.190520;-0.928690;,
  -0.280171;-0.302977;-0.910884;,
  -0.242046;-0.318199;-0.916604;,
  -0.200275;-0.340677;-0.918602;,
  -0.141806;-0.210319;-0.967294;,
  -0.140726;-0.051421;-0.988712;,
  -0.130710;-0.042893;-0.990492;,
  -0.134453;-0.031504;-0.990419;,
  -0.150714;0.023073;-0.988308;,
  -0.310994;0.197106;-0.929748;,
  -0.973712;0.035830;0.224947;,
  -0.987719;0.038061;0.151536;,
  0.989841;0.034635;0.137895;,
  0.972987;0.110265;0.202825;,
  0.963297;0.163523;0.212884;,
  0.957362;0.164893;0.237210;,
  0.947952;0.165613;0.271955;,
  0.942297;0.090415;0.322337;,
  0.893634;-0.050271;0.445971;,
  0.891831;-0.175847;0.416792;,
  0.430346;-0.180786;0.884375;,
  0.288063;-0.096269;0.952760;,
  0.855231;-0.168470;0.490100;,
  0.968293;-0.066946;0.240682;,
  -0.958583;0.120547;0.258046;,
  -0.342410;0.037848;0.938788;,
  -0.132924;-0.051683;0.989778;,
  -0.227475;-0.053940;0.972289;,
  -0.869441;-0.084657;0.486729;,
  -0.889175;-0.024410;0.456916;,
  -0.937827;0.027053;0.346046;,
  -0.966335;0.011407;0.257036;,
  -0.971142;0.013513;0.238119;,
  -0.973454;0.016017;0.228320;,
  -0.910290;-0.123724;-0.395050;,
  -0.801287;-0.088205;-0.591743;,
  0.922545;-0.054822;-0.381975;,
  0.933723;-0.011261;-0.357818;,
  0.939653;-0.012371;-0.341906;,
  0.942669;-0.006891;-0.333658;,
  0.943041;0.009598;-0.332537;,
  0.973087;-0.067276;-0.220400;,
  0.931598;-0.146086;-0.332841;,
  0.893219;-0.172843;-0.415072;,
  0.947413;-0.198043;-0.251372;,
  0.976781;-0.107420;-0.185366;,
  0.989426;-0.028543;-0.142205;,
  -0.882806;0.125881;-0.452558;,
  -0.959952;0.023258;-0.279196;,
  -0.854908;-0.014744;-0.518570;,
  -0.964530;-0.016571;-0.263452;,
  -0.964347;-0.007276;-0.264539;,
  -0.955819;-0.054539;-0.288853;,
  -0.945322;-0.143479;-0.292883;,
  -0.936039;-0.152795;-0.316992;,
  -0.923823;-0.155968;-0.349608;,
  0.000000;0.158280;0.987394;,
  0.052781;0.153816;0.986689;,
  0.055416;0.313153;0.948085;,
  0.000000;0.339145;0.940734;,
  -0.097800;0.155558;0.982974;,
  0.072951;0.132588;0.988483;,
  -0.023410;0.262313;0.964699;,
  0.010324;0.262371;0.964912;,
  0.822344;-0.083696;-0.562802;,
  0.979865;-0.199663;-0.000000;,
  0.977044;-0.213038;-0.000000;,
  -0.997590;0.069378;0.000000;,
  -0.777347;0.223047;-0.588202;,
  -0.999871;0.016085;0.000000;,
  -0.999929;-0.011907;0.000000;;
  356;
  3;64,86,65;,
  3;86,85,65;,
  3;60,60,60;,
  3;60,60,60;,
  3;57,56,92;,
  3;56,93,92;,
  3;49,49,49;,
  3;49,49,49;,
  3;122,37,123;,
  3;37,46,123;,
  3;47,36,138;,
  3;36,139,138;,
  3;67,66,83;,
  3;66,84,83;,
  3;124,10,125;,
  3;10,14,125;,
  3;54,73,55;,
  3;73,72,55;,
  3;136,15,137;,
  3;15,11,137;,
  3;69,68,81;,
  3;68,82,81;,
  3;126,20,127;,
  3;20,18,127;,
  3;52,75,53;,
  3;75,74,53;,
  3;134,19,135;,
  3;19,23,135;,
  3;70,69,80;,
  3;69,81,80;,
  3;127,18,128;,
  3;18,26,128;,
  3;51,76,52;,
  3;76,75,52;,
  3;133,27,134;,
  3;27,19,134;,
  3;125,14,126;,
  3;14,20,126;,
  3;68,67,82;,
  3;67,83,82;,
  3;135,23,136;,
  3;23,15,136;,
  3;53,74,54;,
  3;74,73,54;,
  3;71,70,79;,
  3;70,80,79;,
  3;128,26,129;,
  3;26,30,129;,
  3;50,77,51;,
  3;77,76,51;,
  3;132,31,133;,
  3;31,27,133;,
  3;48,71,78;,
  3;71,79,78;,
  3;129,30,130;,
  3;30,7,130;,
  3;163,164,50;,
  3;164,77,50;,
  3;131,6,132;,
  3;6,31,132;,
  3;61,89,62;,
  3;89,88,62;,
  3;119,34,120;,
  3;34,5,120;,
  3;165,166,90;,
  3;166,59,90;,
  3;4,35,117;,
  3;35,118,117;,
  3;58,57,91;,
  3;57,92,91;,
  3;121,41,122;,
  3;41,37,122;,
  3;63,87,64;,
  3;87,86,64;,
  3;36,40,139;,
  3;40,140,139;,
  3;59,58,90;,
  3;58,91,90;,
  3;120,5,121;,
  3;5,41,121;,
  3;62,88,63;,
  3;88,87,63;,
  3;40,4,140;,
  3;4,117,140;,
  3;65,85,66;,
  3;85,84,66;,
  3;123,46,124;,
  3;46,10,124;,
  3;56,55,93;,
  3;55,72,93;,
  3;11,47,137;,
  3;47,138,137;,
  3;49,49,49;,
  3;49,49,49;,
  3;167,163,95;,
  3;163,50,95;,
  3;95,50,96;,
  3;50,51,96;,
  3;96,51,97;,
  3;51,52,97;,
  3;97,52,98;,
  3;52,53,98;,
  3;98,53,99;,
  3;53,54,99;,
  3;99,54,100;,
  3;54,55,100;,
  3;101,100,56;,
  3;100,55,56;,
  3;102,101,57;,
  3;101,56,57;,
  3;103,102,58;,
  3;102,57,58;,
  3;104,103,59;,
  3;103,58,59;,
  3;166,105,59;,
  3;105,104,59;,
  3;60,60,60;,
  3;60,60,60;,
  3;106,61,107;,
  3;61,62,107;,
  3;107,62,108;,
  3;62,63,108;,
  3;108,63,109;,
  3;63,64,109;,
  3;109,64,110;,
  3;64,65,110;,
  3;110,65,111;,
  3;65,66,111;,
  3;112,111,67;,
  3;111,66,67;,
  3;113,112,68;,
  3;112,67,68;,
  3;114,113,69;,
  3;113,68,69;,
  3;115,114,70;,
  3;114,69,70;,
  3;116,115,71;,
  3;115,70,71;,
  3;94,116,48;,
  3;116,71,48;,
  3;73,14,72;,
  3;14,10,72;,
  3;74,20,73;,
  3;20,14,73;,
  3;75,18,74;,
  3;18,20,74;,
  3;76,26,75;,
  3;26,18,75;,
  3;77,30,76;,
  3;30,26,76;,
  3;164,168,77;,
  3;168,30,77;,
  3;49,49,49;,
  3;49,49,49;,
  3;78,79,1;,
  3;79,29,1;,
  3;79,80,29;,
  3;80,25,29;,
  3;80,81,25;,
  3;81,17,25;,
  3;81,82,17;,
  3;82,21,17;,
  3;82,83,21;,
  3;83,13,21;,
  3;84,9,83;,
  3;9,13,83;,
  3;85,45,84;,
  3;45,9,84;,
  3;86,38,85;,
  3;38,45,85;,
  3;87,42,86;,
  3;42,38,86;,
  3;88,3,87;,
  3;3,42,87;,
  3;89,33,88;,
  3;33,3,88;,
  3;60,60,60;,
  3;60,60,60;,
  3;90,5,165;,
  3;5,169,165;,
  3;91,41,90;,
  3;41,5,90;,
  3;92,37,91;,
  3;37,41,91;,
  3;93,46,92;,
  3;46,37,92;,
  3;72,10,93;,
  3;10,46,93;,
  3;49,49,49;,
  3;49,49,49;,
  3;95,31,167;,
  3;31,6,167;,
  3;96,27,95;,
  3;27,31,95;,
  3;97,19,96;,
  3;19,27,96;,
  3;98,23,97;,
  3;23,19,97;,
  3;99,15,98;,
  3;15,23,98;,
  3;100,11,99;,
  3;11,15,99;,
  3;47,11,101;,
  3;11,100,101;,
  3;36,47,102;,
  3;47,101,102;,
  3;40,36,103;,
  3;36,102,103;,
  3;4,40,104;,
  3;40,103,104;,
  3;104,105,4;,
  3;105,170,4;,
  3;60,60,60;,
  3;60,60,60;,
  3;2,32,107;,
  3;32,106,107;,
  3;43,2,108;,
  3;2,107,108;,
  3;39,43,109;,
  3;43,108,109;,
  3;44,39,110;,
  3;39,109,110;,
  3;8,44,111;,
  3;44,110,111;,
  3;12,8,112;,
  3;8,111,112;,
  3;22,12,113;,
  3;12,112,113;,
  3;16,22,114;,
  3;22,113,114;,
  3;24,16,115;,
  3;16,114,115;,
  3;28,24,116;,
  3;24,115,116;,
  3;94,0,116;,
  3;0,28,116;,
  3;117,118,141;,
  3;118,142,141;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;171,119,143;,
  3;119,120,143;,
  3;143,120,144;,
  3;120,121,144;,
  3;144,121,145;,
  3;121,122,145;,
  3;145,122,146;,
  3;122,123,146;,
  3;146,123,147;,
  3;123,124,147;,
  3;147,124,148;,
  3;124,125,148;,
  3;149,148,126;,
  3;148,125,126;,
  3;150,149,172;,
  3;149,126,172;,
  3;150,172,151;,
  3;172,173,151;,
  3;152,151,129;,
  3;151,173,129;,
  3;153,152,130;,
  3;152,129,130;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;174,154,131;,
  3;154,175,131;,
  3;176,155,174;,
  3;155,154,174;,
  3;176,177,155;,
  3;177,156,155;,
  3;135,157,177;,
  3;157,156,177;,
  3;136,158,135;,
  3;158,157,135;,
  3;136,137,158;,
  3;137,159,158;,
  3;137,138,159;,
  3;138,160,159;,
  3;138,139,160;,
  3;139,161,160;,
  3;139,140,161;,
  3;140,162,161;,
  3;140,117,162;,
  3;117,141,162;,
  3;141,142,2;,
  3;142,32,2;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;60,60,60;,
  3;143,3,171;,
  3;3,33,171;,
  3;144,42,143;,
  3;42,3,143;,
  3;145,38,144;,
  3;38,42,144;,
  3;146,45,145;,
  3;45,38,145;,
  3;147,9,146;,
  3;9,45,146;,
  3;148,13,147;,
  3;13,9,147;,
  3;21,13,149;,
  3;13,148,149;,
  3;17,21,150;,
  3;21,149,150;,
  3;25,17,151;,
  3;17,150,151;,
  3;29,25,152;,
  3;25,151,152;,
  3;1,29,153;,
  3;29,152,153;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;49,49,49;,
  3;154,28,175;,
  3;28,0,175;,
  3;155,24,154;,
  3;24,28,154;,
  3;155,156,24;,
  3;156,16,24;,
  3;157,22,156;,
  3;22,16,156;,
  3;157,158,22;,
  3;158,12,22;,
  3;158,159,12;,
  3;159,8,12;,
  3;159,160,8;,
  3;160,44,8;,
  3;160,161,44;,
  3;161,39,44;,
  3;161,162,39;,
  3;162,43,39;,
  3;162,141,43;,
  3;141,2,43;;
 }
 MeshTextureCoords {
  215;
  0.500000;0.812500;,
  0.562500;0.812500;,
  0.500000;0.843750;,
  0.562500;0.843750;,
  0.500000;0.500000;,
  0.562500;0.500000;,
  0.500000;0.625000;,
  0.562500;0.625000;,
  0.500000;0.437500;,
  0.500000;0.406250;,
  0.562500;0.437500;,
  0.562500;0.406250;,
  0.562500;0.125000;,
  0.562500;0.250000;,
  0.500000;0.125000;,
  0.500000;0.250000;,
  0.750000;0.812500;,
  0.875000;0.812500;,
  0.750000;0.843750;,
  0.875000;0.843750;,
  0.125000;0.843750;,
  0.125000;0.812500;,
  0.250000;0.843750;,
  0.250000;0.812500;,
  0.500000;0.937500;,
  0.500000;0.875000;,
  0.562500;0.937500;,
  0.562500;0.875000;,
  0.750000;0.875000;,
  0.875000;0.875000;,
  0.750000;0.937500;,
  0.875000;0.937500;,
  0.500000;0.312500;,
  0.562500;0.312500;,
  0.500000;0.375000;,
  0.562500;0.375000;,
  0.250000;0.937500;,
  0.125000;0.937500;,
  0.250000;0.875000;,
  0.125000;0.875000;,
  0.500000;0.968750;,
  0.500000;0.953125;,
  0.562500;0.968750;,
  0.562500;0.953125;,
  0.750000;0.953125;,
  0.875000;0.953125;,
  0.750000;0.968750;,
  0.875000;0.968750;,
  0.500000;0.281250;,
  0.562500;0.281250;,
  0.500000;0.296875;,
  0.562500;0.296875;,
  0.250000;0.968750;,
  0.125000;0.968750;,
  0.250000;0.953125;,
  0.125000;0.953125;,
  0.500000;0.984375;,
  0.562500;0.984375;,
  0.750000;0.984375;,
  0.875000;0.984375;,
  0.500000;0.265625;,
  0.562500;0.265625;,
  0.250000;0.984375;,
  0.125000;0.984375;,
  0.500000;0.992187;,
  0.562500;0.992187;,
  0.750000;0.992187;,
  0.875000;0.992187;,
  0.500000;0.257812;,
  0.562500;0.257812;,
  0.250000;0.992187;,
  0.125000;0.992187;,
  0.500000;1.000000;,
  0.562500;1.000000;,
  0.750000;1.000000;,
  0.875000;1.000000;,
  0.250000;1.000000;,
  0.125000;1.000000;,
  0.500000;0.750000;,
  0.562500;0.750000;,
  0.500000;0.750000;,
  0.562500;0.750000;,
  0.625000;0.625000;,
  0.625000;0.500000;,
  0.625000;0.625000;,
  0.625000;0.500000;,
  0.562500;0.500000;,
  0.500000;0.500000;,
  0.375000;0.500000;,
  0.375000;0.500000;,
  0.375000;0.625000;,
  0.375000;0.625000;,
  0.500000;0.468750;,
  0.562500;0.468750;,
  0.750000;0.781250;,
  0.875000;0.781250;,
  0.500000;0.781250;,
  0.562500;0.781250;,
  0.125000;0.781250;,
  0.250000;0.781250;,
  0.750000;0.750000;,
  0.875000;0.750000;,
  0.125000;0.750000;,
  0.250000;0.750000;,
  0.437500;0.125000;,
  0.437500;0.250000;,
  0.437500;0.257812;,
  0.437500;0.265625;,
  0.437500;0.281250;,
  0.437500;0.296875;,
  0.437500;0.312500;,
  0.437500;0.375000;,
  0.437500;0.406250;,
  0.437500;0.437500;,
  0.437500;0.468750;,
  0.437500;0.500000;,
  0.437500;0.500000;,
  0.437500;0.625000;,
  0.437500;0.750000;,
  0.437500;0.750000;,
  0.437500;0.781250;,
  0.437500;0.812500;,
  0.437500;0.843750;,
  0.437500;0.875000;,
  0.437500;0.937500;,
  0.437500;0.953125;,
  0.437500;0.968750;,
  0.437500;0.984375;,
  0.437500;0.992187;,
  0.437500;1.000000;,
  0.625000;0.312500;,
  0.625000;0.375000;,
  0.625000;0.296875;,
  0.625000;0.281250;,
  0.625000;0.265625;,
  0.625000;0.257812;,
  0.625000;0.250000;,
  0.625000;0.125000;,
  0.625000;1.000000;,
  0.625000;0.992187;,
  0.625000;0.984375;,
  0.625000;0.968750;,
  0.625000;0.953125;,
  0.625000;0.937500;,
  0.625000;0.875000;,
  0.625000;0.843750;,
  0.625000;0.812500;,
  0.625000;0.781250;,
  0.625000;0.750000;,
  0.625000;0.750000;,
  0.625000;0.468750;,
  0.625000;0.437500;,
  0.625000;0.406250;,
  0.375000;0.250000;,
  0.375000;0.125000;,
  0.375000;0.257812;,
  0.375000;0.265625;,
  0.375000;0.281250;,
  0.375000;0.296875;,
  0.375000;0.312500;,
  0.375000;0.375000;,
  0.375000;0.406250;,
  0.375000;0.437500;,
  0.375000;0.468750;,
  0.375000;0.750000;,
  0.375000;0.750000;,
  0.375000;0.781250;,
  0.375000;0.812500;,
  0.375000;0.843750;,
  0.375000;0.875000;,
  0.375000;0.937500;,
  0.375000;0.953125;,
  0.375000;0.968750;,
  0.375000;0.984375;,
  0.375000;0.992187;,
  0.375000;1.000000;,
  0.375000;0.687500;,
  0.375000;0.687500;,
  0.437500;0.687500;,
  0.500000;0.687500;,
  0.562500;0.687500;,
  0.625000;0.687500;,
  0.625000;0.687500;,
  0.687500;0.750000;,
  0.687500;0.781250;,
  0.687500;0.812500;,
  0.687500;0.843750;,
  0.687500;0.875000;,
  0.687500;0.937500;,
  0.687500;0.953125;,
  0.687500;0.968750;,
  0.687500;0.984375;,
  0.687500;0.992187;,
  0.687500;1.000000;,
  0.625000;0.062500;,
  0.562500;0.062500;,
  0.500000;0.062500;,
  0.437500;0.062500;,
  0.375000;0.062500;,
  0.312500;0.992187;,
  0.312500;1.000000;,
  0.312500;0.984375;,
  0.312500;0.968750;,
  0.312500;0.953125;,
  0.312500;0.937500;,
  0.312500;0.875000;,
  0.312500;0.843750;,
  0.312500;0.812500;,
  0.312500;0.781250;,
  0.312500;0.750000;,
  0.562500;0.000000;,
  0.625000;0.000000;,
  0.500000;0.000000;,
  0.437500;0.000000;,
  0.375000;0.000000;;
 }
}