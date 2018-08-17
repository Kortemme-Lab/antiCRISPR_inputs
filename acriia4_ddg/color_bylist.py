from pymol import stored
from pymol import cmd

def bfactor_from_list():

    score_list =[4.1508, 1.1272, 2.7911, -0.2465, 0.1724, -0.4454, 0.898, 0.0908, -0.4257, -0.1099, -0.1843, -0.4529, 1.355, 0.2982, 1.7648, 3.4387, 0.8981, -0.0398, 2.5026, -0.4924, 1.706, -0.6755, 0.2897, -0.4759, 0.0283, 0.047, 0.3038, -4.6868, 0.1613, -0.0279, 0.0908, 0.0377, -1.3265, 0.39]
    res_list = [12, 13, 14, 15, 54, 55, 270, 764, 765, 766, 767, 768, 769, 771, 772, 976, 977, 1106, 1107, 1108, 1109, 1136, 1137, 1138, 1139, 1215, 1216, 1219, 1314, 1320, 1322, 1323, 1332, 1335]

    for i, res in enumerate(res_list):
        cmd.alter("resi " + str(res) + " and chain A ", "b=" +
                str(score_list[i]))
        print "altering resi " + str(res) + " to have b factor of " + str(score_list[i])

cmd.extend("bfactor_from_list", bfactor_from_list)
