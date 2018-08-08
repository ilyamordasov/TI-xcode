//
//  ECG_DataSet.swift
//  TI
//
//  Created by Ilya Mordasov on 08/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Swift

class ECG_DataSet
{
    
    public let ecg_dataset:Array<Int> = [
            806, 802, 799, 802, 798, 804, 803, 805, 812, 802, 798, 802, 799, 805, 801, 804, 806, 803, 802, 803, 799, 804, 803, 805, 807, 802, 802, 802, 799, 805, 808, 804, 812, 802, 798, 802, 798, 804, 808, 804, 807, 802, 799, 802, 798, 804, 797, 807, 802, 798, 803, 798, 804, 801, 805, 812, 802, 798, 802, 802, 805, 801, 806, 812, 807, 803, 806, 802, 807, 808, 804, 804, 802, 795, 802, 799, 804, 808, 804, 806, 807, 818, 830, 831, 837, 825, 830, 820, 790, 795, 806, 802, 807, 809, 804, 806, 806, 799, 806, 806, 807, 809, 812, 812, 806, 811, 806, 813, 813, 815, 820, 818, 818, 822, 818, 828, 825, 829, 831, 826, 826, 823, 828, 825, 820, 823, 818, 806, 810, 803, 807, 809, 804, 804, 806, 798, 802, 798, 804, 808, 804, 805, 806, 798, 806, 799, 812, 808, 804, 806, 802, 802, 806, 803, 804, 801, 806, 807, 802, 802, 806, 805, 809, 804, 806, 806, 799, 802, 799, 806, 801, 804, 807, 802, 799, 802, 805, 808, 805, 806, 806, 799, 802, 799, 804, 808, 804, 806, 802, 799, 806, 802, 807, 801, 812, 812, 803, 806, 806, 803, 806, 809, 805, 803, 798, 802, 802, 804, 801, 804, 804, 802, 806, 819, 830, 838, 841, 828, 831, 819, 786, 799, 806, 812, 809, 812, 814, 806, 802, 806, 803, 812, 809, 812, 820, 807, 802, 810, 810, 815, 811, 815, 822, 819, 810, 818, 818, 820, 825, 829, 830, 834, 822, 830, 822, 828, 825, 828, 822, 818, 806, 810, 812, 801, 812, 812, 798, 806, 802, 795, 805, 809, 812, 812, 802, 803, 806, 803, 812, 809, 804, 804, 810, 806, 802, 799, 805, 813, 804, 810, 802, 803, 799, 804, 809, 806, 807, 802, 803, 802, 799, 804, 799, 806, 807, 802, 794, 806, 799, 804, 809, 806, 806, 802, 799, 806, 798, 806, 808, 804, 804, 802, 806, 802, 803, 805, 799, 805, 812, 811, 802, 806, 812, 803, 805, 796, 795, 795, 806, 798, 804, 809, 804, 804, 818, 818, 834, 830, 833, 836, 812, 790, 791, 802, 803, 812, 808, 812, 815, 806, 798, 806, 798, 807, 801, 813, 820, 810, 810, 818, 806, 815, 813, 820, 820, 822, 818, 822, 819, 823, 827, 831, 836, 826, 826, 826, 827, 828, 825, 814, 811, 810, 803, 795, 812, 809, 800, 812, 802, 798, 802, 798, 805, 801, 800, 800, 806, 799, 799, 798, 804, 799, 804, 807, 802, 795, 807, 802, 804, 803, 806, 807, 802, 799, 803, 802, 804, 801, 812, 804, 806, 795, 803, 794, 804, 793, 804, 804, 802, 799, 794, 795, 800, 809, 804, 806, 802, 802, 802, 804, 811, 812, 812, 802, 795, 802, 798, 806, 797, 804, 804, 806, 790, 799, 790, 804, 809, 804, 830, 834, 826, 838, 811, 828, 813, 796, 796, 816, 798, 798, 802, 804, 797, 800, 812, 802, 795, 806, 794, 812, 805, 812, 818, 810, 810, 794, 815, 815, 828, 812, 818, 818, 816, 823, 813, 821, 823, 822, 819, 822, 802, 812, 809, 812, 812, 802, 798, 802, 799, 813, 793, 800, 804, 795, 799, 798, 795, 791, 797, 804, 800, 803, 795, 799, 790, 804, 792, 800, 800, 794, 787, 818, 799, 812, 799, 804, 805, 798, 795, 798, 791, 796, 796, 804, 790, 794, 811, 802, 804, 803, 804, 804, 798, 798, 799, 798, 800, 797, 804, 805, 802, 802, 802, 799, 805, 808, 804, 804, 798, 794, 799, 787, 796, 797, 800, 804, 794, 790, 807, 803, 813, 819, 820, 812, 818, 798, 786, 787, 788, 815, 800, 804, 802, 802, 803, 794, 796, 811, 800, 804, 802, 786, 786, 816, 806, 799, 828, 820, 816, 819, 802, 822, 796, 811, 813, 812, 826, 816, 822, 835, 800, 795, 804, 804, 806, 791, 806, 810, 804, 812, 812, 802, 778, 799, 763, 788, 793, 812, 806, 810, 806, 786, 771, 812, 803, 804, 812, 784, 771, 802, 794, 772, 801, 812, 800, 803, 786, 790, 798, 796, 776, 800, 804, 770, 816, 818, 786, 788, 809, 773, 774, 802, 786, 779, 818, 781, 793, 791, 796, 786, 784, 794, 795, 800, 793, 791, 780, 786, 778, 786, 775, 800, 793, 788, 796, 787, 790, 791, 803, 823, 815, 790, 790, 771, 786, 774, 789, 799, 804, 773, 798, 774, 791, 774, 783, 777, 788, 788, 775, 762, 802, 784, 788, 793, 782, 790, 786, 784, 775, 786, 791, 793, 788, 796, 775, 787, 794, 795, 804, 781, 780, 791, 786, 778, 774, 772, 767, 781, 780, 770, 763, 778, 770, 780, 777, 772, 775, 770, 774, 763, 774, 767, 768, 768, 770, 763, 762, 754, 772, 761, 768, 780, 758, 762, 754, 750, 749, 748, 748, 759, 754, 758, 755, 756, 761, 764, 756, 758, 754, 762, 754, 772, 753, 757, 756, 766, 762, 762, 759, 764, 761, 764, 758, 758, 754, 762, 759, 768, 767, 768, 768, 763, 758, 758, 762, 756, 761, 772, 764, 754, 766, 762, 770, 768, 761, 764, 772, 762, 759, 762, 754, 758, 765, 764, 764, 766, 778, 786, 789, 776, 768, 768, 754, 754, 758, 755, 764, 769, 772, 770, 763, 770, 767, 788, 767, 768, 764, 771, 766, 774, 762, 772, 767, 772, 775, 770, 763, 766, 762, 773, 777, 775, 774, 778, 774, 774, 774, 788, 777, 772, 770, 767, 770, 762, 772, 767, 772, 772, 770, 758, 766, 762, 768, 761, 768, 768, 766, 754, 770, 758, 772, 767, 768, 780, 770, 758, 762, 767, 772, 768, 772, 758, 758, 758, 752, 758, 761, 756, 768, 754, 747, 759, 755, 759, 768, 764, 759, 759, 758, 762, 780, 765, 772, 780, 770, 771, 774, 774, 780, 780, 772, 774, 771, 770, 770, 780, 771, 772, 772, 762, 766, 766, 758, 768, 765, 759, 764, 762, 754, 758, 762, 764, 761, 768, 768, 762, 763, 771, 796, 783, 768, 772, 766, 746, 754, 754, 764, 761, 772, 768, 762, 759, 758, 772, 761, 772, 774, 766, 766, 771, 766, 773, 769, 772, 772, 766, 770, 766, 774, 775, 776, 775, 780, 774, 774, 778, 767, 774, 777, 773, 780, 771, 766, 766, 766, 768, 767, 772, 772, 762, 762, 762, 759, 768, 763, 764, 774, 763, 758, 762, 762, 764, 761, 768, 768, 758, 762, 755, 758, 764, 761, 764, 772, 758, 755, 766, 759, 764, 765, 758, 768, 763, 762, 762, 758, 772, 761, 768, 768, 758, 762, 762, 755, 764, 761, 758, 772, 763, 755, 762, 759, 768, 761, 772, 768, 766, 763, 762, 772, 767, 768, 772, 762, 755, 762, 754, 756, 761, 768, 764, 762, 758, 763, 766, 788, 785, 788, 780, 766, 767, 754, 754, 764, 769, 768, 768, 770, 763, 766, 763, 768, 765, 772, 768, 766, 762, 766, 762, 772, 767, 768, 772, 771, 766, 766, 771, 777, 781, 782, 775, 778, 778, 778, 788, 781, 780, 788, 775, 763, 774, 766, 765, 768, 772, 763, 759, 759, 758, 764, 761, 768, 772, 759, 762, 766, 754, 767, 768, 772, 766, 755, 763, 762, 772, 761, 768, 772, 758, 758, 762, 758, 764, 765, 758, 764, 762, 755, 758, 762, 764, 763, 768, 768, 762, 762, 762, 759, 772, 761, 764, 772, 766, 762, 766, 764, 765, 768, 772, 766, 762, 766, 758, 768, 761, 764, 768, 763, 758, 766, 758, 764, 765, 768, 780, 786, 790, 794, 778, 772, 769, 756, 758, 754, 762, 763, 755, 772, 765, 768, 772, 770, 758, 766, 763, 772, 769, 780, 780, 774, 771, 771, 766, 780, 777, 772, 788, 778, 771, 784, 778, 781, 779, 782, 788, 778, 779, 784, 783, 777, 774, 774, 762, 763, 770, 762, 772, 767, 764, 772, 770, 762, 762, 763, 772, 761, 772, 768, 766, 759, 766, 758, 768, 765, 772, 766, 755, 762, 766, 764, 765, 772, 772, 766, 763, 762, 758, 772, 765, 768, 772, 763, 759, 770, 762, 764, 765, 768, 768, 762, 762, 766, 762, 764, 761, 768, 774, 763, 762, 766, 755, 764, 765, 772, 768, 762, 758, 762, 758, 764, 767, 781, 790, 787, 787, 778, 763, 772, 745, 751, 768, 766, 759, 762, 762, 764, 765, 772, 772, 766, 767, 766, 763, 768, 771, 772, 780, 770, 774, 771, 773, 777, 772, 780, 778, 775, 778, 774, 782, 777, 780, 788, 774, 779, 771, 775, 777, 772, 774, 770, 762, 762, 762, 772, 761, 772, 772, 759, 762, 762, 759, 768, 761, 768, 768, 762, 758, 763, 763, 764, 761, 768, 768, 763, 766, 766, 759, 772, 765, 768, 772, 766, 759, 766, 762, 768, 765, 764, 768, 763, 762, 763, 762, 764, 765, 768, 772, 762, 762, 763, 772, 765, 764, 768, 762, 758, 758, 763, 768, 761, 768, 772, 766, 774, 790, 786, 796, 777, 775, 768, 752, 754, 766, 763, 768, 765, 772, 772, 766, 766, 774, 762, 772, 767, 772, 775, 771, 763, 770, 767, 773, 777, 780, 772, 774, 774, 774, 774, 783, 777, 780, 788, 782, 778, 782, 774, 780, 781, 780, 774, 763, 770, 763, 772, 761, 768, 772, 762, 763, 762, 758, 772, 763, 768, 772, 766, 762, 758, 763, 768, 761, 768, 768, 762, 763, 762, 772, 761, 764, 772, 763, 758, 763, 762, 768, 765, 768, 768, 762, 759, 762, 762, 772, 763, 768, 772, 762, 763, 771, 759, 768, 769, 768, 768, 762, 759, 762, 768, 761, 768, 772, 770, 778, 790, 786, 788, 777, 773, 768, 754, 754, 758, 762, 768, 761, 768, 768, 766, 766, 766, 762, 775, 769, 772, 774, 774, 766, 774, 767, 772, 777, 780, 774, 774, 771, 774, 775, 788, 777, 781, 788, 784, 774, 784, 774, 780, 777, 780, 780, 774, 763, 774, 770, 772, 765, 772, 774, 763, 767, 762, 762, 768, 761, 768, 772, 766, 762, 766, 762, 764, 765, 772, 768, 763, 762, 766, 766, 772, 765, 764, 772, 763, 770, 762, 768, 769, 772, 772, 766, 766, 762, 766, 772, 765, 772, 766, 762, 762, 758, 764, 765, 772, 772, 770, 762, 767, 767, 775, 783, 800, 804, 778, 770, 771, 739, 759, 761, 768, 774, 770, 763, 770, 766, 768, 767, 773, 772, 763, 774, 771, 766, 780, 776, 774, 782, 778, 770, 784, 778, 780, 783, 783, 788, 786, 784, 778, 778, 796, 781, 788, 790, 778, 774, 770, 774, 777, 772, 772, 774, 763, 767, 763, 772, 767, 773, 775, 766, 770, 763, 772, 769, 768, 772, 766, 763, 767, 763, 768, 765, 772, 772, 766, 766, 763, 763, 772, 767, 772, 780, 770, 766, 771, 766, 772, 777, 773, 767, 762, 762, 763, 768, 769, 772, 772, 766, 758, 774, 771, 788, 797, 788, 780, 770, 763, 752, 754, 768, 769, 774, 774, 770, 770, 770, 763, 777, 768, 774, 770, 767, 774, 771, 773, 777, 780, 780, 774, 774, 774, 775, 783, 781, 781, 788, 786, 778, 786, 786, 783, 785, 788, 788, 786, 771, 770, 770, 772, 767, 772, 772, 762, 759, 766, 762, 772, 767, 768, 772, 770, 763, 770, 766, 772, 765, 772, 774, 762, 766, 770, 762, 772, 767, 768, 772, 766, 758, 766, 763, 768, 767, 772, 768, 766, 763, 766, 763, 780, 771, 772, 772, 766, 763, 766, 763, 768, 767, 772, 772, 770, 763, 762, 766, 780, 783, 790, 796, 766, 766, 770, 746, 764, 765, 772, 772, 770, 767, 767, 766, 772, 776, 773, 780, 770, 770, 770, 766, 780, 777, 772, 780, 774, 766, 774, 774, 773, 777, 781, 780, 778, 779, 778, 778, 788, 781, 782, 788, 778, 771, 778, 766, 773, 771, 772, 772, 770, 762, 762, 763, 772, 761, 772, 772, 766, 758, 766, 762, 768, 765, 772, 766, 762, 770, 766, 768, 765, 772, 772, 766, 763, 770, 762, 772, 771, 768, 772, 763, 763, 770, 763, 764, 761, 768, 768, 763, 762, 759, 762, 772, 765, 768, 775, 778, 786, 794, 784, 772, 777, 772, 756, 762, 762, 762, 772, 761, 772, 772, 766, 763, 770, 762, 772, 769, 768, 774, 767, 774, 770, 773, 777, 780, 780, 774, 775, 778, 774, 788, 781, 780, 788, 779, 771, 778, 775, 780, 777, 780, 772, 767, 766, 762, 762, 772, 765, 774, 766, 759, 770, 762, 768, 769, 772, 772, 770, 762, 763, 763, 768, 765, 768, 772, 763, 762, 762, 758, 772, 769, 768, 772, 766, 763, 766, 766, 772, 769, 772, 772, 762, 763, 766, 762, 772, 765, 768, 772, 763, 755, 774, 781, 792, 791, 780, 762, 767, 754, 752, 764, 767, 772, 780, 770, 763, 770, 766, 772, 776, 772, 772, 774, 770, 770, 770, 772, 765, 775, 780, 770, 770, 774, 767, 780, 781, 780, 780, 784, 774, 782, 784, 781, 781, 783, 780, 774, 774, 771, 767, 780, 771, 768, 772, 766, 762, 766, 762, 768, 772, 768, 766, 762, 762, 762, 772, 763, 768, 772, 766, 762, 766, 763, 764, 767, 772, 772, 770, 766, 762, 763, 772, 761, 768, 772, 766, 762, 770, 763, 764, 765, 768, 768, 766, 758, 762, 766, 768, 761, 772, 780, 779, 790, 791, 775, 772, 777, 750, 764, 763, 762, 766, 762, 768, 767, 772, 772, 762, 766, 766, 766, 773, 767, 772, 780, 770, 766, 775, 770, 773, 777, 780, 784, 774, 774, 778, 781, 777, 780, 788, 779, 775, 778, 771, 780, 777, 772, 774, 770, 766, 770, 766, 768, 765, 773, 772, 763, 763, 762, 772, 769, 768, 772, 766, 759, 766, 762, 764, 765, 772, 772, 763, 762, 762, 759, 772, 761, 772, 774, 766, 763, 767, 762, 772, 777, 772, 772, 770, 766, 759, 759, 768, 761, 768, 768, 763, 759, 763, 762, 780, 793, 788, 788, 770, 763, 762, 752, 764, 769, 772, 772, 767, 763, 766, 763, 772, 768, 775, 770, 763, 770, 766, 772, 777, 772, 774, 771, 774, 774, 770, 780, 777, 780, 788, 778, 778, 786, 778, 783, 783, 783, 780, 784, 771, 770, 771, 772, 765, 772, 780, 766, 762, 766, 762, 772, 769, 768, 772, 766, 762, 770, 763, 772, 767, 772, 774, 770, 766, 766, 762, 773, 769, 768, 772, 766, 763, 770, 766, 768, 769, 772, 774, 766, 767, 766, 759, 772, 765, 768, 772, 763, 763, 766, 762, 768, 769, 775, 782, 791, 790, 786, 771, 773, 763, 757, 768, 758, 767, 770, 766, 772, 769, 773, 772, 774, 766, 774, 774, 773, 777, 781, 780, 774, 775, 775, 774, 788, 777, 780, 790, 784, 778, 784, 781, 787, 788, 788, 784, 786, 779, 784, 780, 776, 775, 780, 771, 767, 775, 775, 768, 777, 772, 774, 775, 766, 766, 770, 772, 767, 780, 772, 770, 766, 770, 763, 773, 777, 768, 772, 774, 766, 774, 770, 772, 773, 774, 780, 770, 771, 775, 770, 775, 769, 772, 774, 767, 762, 770, 758, 772, 772, 780, 778, 786, 790, 786, 780, 769, 768, 768, 762, 766, 778, 770, 772, 777, 775, 775, 779, 771, 774, 770, 780, 777, 775, 781, 774, 778, 775, 774, 781, 781, 775, 788, 786, 778, 786, 786, 783, 783, 796, 791, 786, 790, 786, 784, 789, 781, 780, 788, 778, 770, 784, 771, 773, 777, 780, 772, 774, 771, 770, 770, 780, 771, 780, 788, 770, 770, 774, 770, 780, 769, 780, 780, 774, 767, 771, 775, 780, 780, 780, 763, 770, 775, 774, 780, 777, 774, 775, 774, 770, 771, 770, 775, 777, 780, 773, 774, 784, 786, 794, 796, 781, 768, 780, 770, 754, 770, 770, 772, 781, 781, 780, 774, 774, 774, 767, 780, 781, 788, 788, 778, 774, 786, 778, 783, 781, 782, 788, 795, 784, 786, 786, 790, 783, 796, 790, 786, 790, 786, 788, 785, 782, 782, 778, 774, 775, 770, 782, 777, 780, 781, 774, 775, 774, 770, 781, 777, 775, 788, 778, 767, 778, 775, 780, 769, 775, 780, 774, 771, 770, 771, 780, 777, 775, 780, 774, 771, 778, 774, 780, 779, 781, 782, 778, 774, 774, 775, 772, 771, 773, 780, 763, 771, 774, 763, 781, 783, 789, 790, 784, 763, 774, 770, 768, 769, 780, 783, 778, 778, 775, 771, 788, 777, 780, 788, 774, 778, 786, 774, 780, 781, 780, 782, 784, 784, 774, 774, 783, 781, 788, 791, 786, 786, 790, 786, 789, 787, 788, 790, 786, 784, 784, 778, 780, 777, 780, 782, 771, 770, 774, 774, 775, 777, 780, 778, 771, 778, 774, 775, 777, 780, 780, 778, 771, 778, 770, 776, 775, 780, 771, 763, 774, 770, 772, 777, 775, 775, 771, 771, 771, 773, 776, 773, 783, 774, 767, 775, 774, 780, 777, 773, 780, 775, 771, 770, 770, 773, 769, 772, 780, 766, 771, 786, 786, 791, 785, 772, 774, 774, 754, 766, 771, 780, 777, 780, 780, 774, 774, 778, 767, 780, 777, 780, 788, 775, 771, 774, 774, 774, 777, 781, 781, 778, 779, 775, 783, 777, 788, 788, 784, 779, 786, 778, 788, 792, 782, 780, 771, 774, 774, 773, 769, 772, 775, 770, 766, 770, 767, 780, 777, 780, 774, 766, 770, 770, 772, 773, 780, 772, 766, 774, 774, 775, 777, 772, 775, 770, 762, 770, 762, 772, 777, 772, 774, 766, 770, 766, 763, 772, 767, 772, 774, 774, 770, 774, 767, 772, 776, 780, 780, 774, 770, 767, 774, 773, 769, 772, 775, 766, 766, 766, 762, 780, 785, 788, 800, 786, 766, 774, 770, 757, 767, 772, 775, 770, 770, 774, 763, 777, 775, 782, 775, 766, 774, 771, 775, 777, 774, 780, 775, 774, 774, 771, 781, 777, 783, 788, 784, 778, 786, 779, 788, 785, 788, 788, 786, 784, 778, 778, 780, 777, 772, 780, 766, 766, 770, 763, 772, 769, 772, 774, 770, 763, 770, 770, 773, 777, 773, 775, 770, 771, 770, 770, 773, 771, 772, 780, 770, 763, 770, 770, 772, 771, 772, 772, 770, 770, 766, 775, 765, 772, 774, 774, 770, 771, 767, 774, 777, 772, 772, 770, 770, 770, 772, 765, 772, 775, 766, 767, 775, 762, 772, 769, 768, 770, 762, 766, 766, 772, 777, 788, 796, 791, 786, 770, 771, 760, 768, 780, 771, 762, 770, 766, 772, 777, 774, 774, 774, 767, 774, 766, 780, 776, 780, 788, 774, 778, 778, 774, 780, 779, 780, 782, 786, 775, 778, 779, 788, 779, 788, 788, 774, 778, 782, 771, 780, 772, 780, 770, 763, 770, 770, 772, 777, 774, 772, 770, 767, 770, 773, 776, 772, 780, 770, 763, 770, 763, 772, 769, 773, 774, 770, 766, 763, 772, 767, 772, 774, 766, 766, 770, 767, 772, 776, 772, 771, 763, 766, 766, 772, 765, 772, 772, 762, 766, 770, 759, 772, 768, 772, 774, 762, 774, 770, 768, 767, 773, 768, 766, 763, 767, 772, 769, 773, 791, 794, 787, 790, 774, 772, 765, 756, 768, 770, 771, 763, 763, 772, 769, 768, 780, 770, 763, 775, 767, 780, 777, 775, 774, 778, 774, 775, 771, 774, 777, 780, 782, 774, 775, 778, 774, 780, 781, 780, 788, 786, 774, 778, 778, 780, 777, 780, 780, 770, 770, 766, 766, 780, 769, 772, 772, 770, 763, 767, 767, 768, 771, 772, 772, 770, 767, 766, 762, 772, 765, 768, 774, 767, 762, 774, 767, 772, 769, 772, 772, 770, 766, 766, 766, 772, 769, 772, 772, 762, 763, 766, 762, 772, 769, 768, 772, 770, 759, 763, 766, 768, 767, 780, 775, 770, 770, 774, 763, 772, 777, 772, 775, 762, 762, 767, 762, 764, 765, 768, 772, 774, 778, 786, 786, 780, 767, 772, 768, 754, 759, 770, 766, 772, 769, 772, 772, 774, 770, 767, 770, 774, 771, 780, 774, 770, 767, 770, 771, 774, 777, 780, 780, 778, 774, 778, 778, 783, 779, 788, 788, 786, 779, 784, 774, 788, 783, 774, 782, 770, 767, 774, 766, 772, 765, 772, 772, 767, 767, 767, 762, 772, 767, 773, 780, 771, 763, 770, 766, 772, 776, 772, 772, 774, 770, 770, 770, 772, 767, 774, 774, 762, 763, 771, 762, 772, 769, 772, 772, 770, 766, 763, 772, 771, 772, 773, 770, 767, 774, 766, 774, 776, 768, 778, 766, 770, 762, 772, 765, 768, 772, 766, 762, 762, 762, 772, 780, 788, 787, 786, 786, 759, 768, 763, 756, 764, 770, 771, 766, 771, 780, 769, 772, 780, 766, 771, 774, 771, 772, 777, 773, 774, 784, 770, 778, 780, 781, 783, 783, 779, 784, 774, 778, 788, 785, 780, 790, 779, 774, 786, 775, 781, 777, 780, 774, 774, 767, 770, 766, 772, 765, 772, 780, 766, 763, 778, 767, 772, 776, 772, 772, 774, 770, 770, 771, 772, 769, 773, 775, 762, 766, 770, 763, 772, 769, 772, 772, 770, 763, 770, 768, 777, 772, 774, 766, 767, 770, 763, 772, 769, 772, 780, 770, 766, 771, 767, 764, 776, 780, 772, 774, 767, 763, 762, 772, 765, 772, 780, 767, 762, 770, 766, 780, 783, 791, 796, 778, 759, 762, 763, 764, 772, 780, 766, 767, 770, 766, 774, 777, 772, 780, 774, 767, 774, 774, 780, 777, 782, 780, 778, 778, 774, 771, 788, 781, 782, 788, 778, 784, 778, 782, 781, 783, 782, 784, 778, 771, 770, 780, 777, 780, 771, 771, 774, 766, 772, 776, 772, 772, 774, 766, 774, 770, 769, 773, 775, 766, 767, 770, 766, 772, 776, 772, 772, 767, 762, 767, 773, 769, 774, 774, 766, 767, 770, 766, 773, 777, 772, 780, 762, 766, 763, 768, 769, 772, 772, 766, 766, 771, 766, 774, 772, 775, 770, 766, 774, 767, 772, 771, 773, 772, 766, 763, 766, 766, 773, 765, 772, 772, 770, 778, 784, 778, 775, 769, 772, 772, 755, 755, 770, 773, 771, 780, 774, 771, 770, 774, 766, 774, 777, 780, 780, 766, 770, 770, 780, 777, 780, 780, 774, 774, 774, 770, 781, 777, 788, 778, 784, 779, 775, 780, 779, 780, 780, 778, 770, 770, 770, 772, 767, 772, 773, 762, 767, 766, 763, 772, 771, 772, 772, 767, 762, 770, 772, 765, 773, 774, 770, 766, 771, 763, 773, 771, 768, 780, 770, 762, 770, 766, 772, 767, 772, 772, 763, 763, 762, 762, 772, 765, 772, 775, 766, 763, 770, 766, 772, 771, 772, 774, 770, 767, 766, 767, 780, 768, 774, 766, 767, 770, 762, 768, 769, 768, 772, 766, 759, 766, 772, 777, 788, 790, 786, 778, 774, 770, 772, 761, 764, 780, 766, 770, 767, 772, 769, 772, 772, 770, 767, 770, 766, 780, 776, 782, 774, 770, 774, 771, 775, 777, 780, 788, 778, 778, 778, 778, 782, 777, 781, 780, 775, 775, 778, 770, 774, 777, 772, 772, 774, 763, 766, 771, 772, 771, 773, 773, 766, 771, 770, 766, 773, 769, 768, 780, 767, 762, 766, 762, 768, 769, 772, 772, 766, 763, 763, 762, 772, 765, 772, 774, 766, 763, 770, 762, 772, 771, 772, 772, 770, 766, 766, 763, 772, 765, 772, 772, 762, 763, 766, 762, 772, 769, 768, 772, 770, 766, 770, 771, 773, 777, 780, 772, 762, 762, 766, 762, 773, 769, 772, 773, 766, 770, 782, 786, 788, 785, 774, 762, 754, 755, 763, 775, 765, 768, 774, 770, 766, 770, 766, 777, 774, 774, 775, 770, 770, 771, 780, 777, 780, 780, 774, 775, 778, 771, 780, 779, 780, 782, 779, 774, 778, 778, 782, 779, 783, 781, 774, 774, 766, 775, 777, 768, 774, 766, 762, 770, 767, 768, 767, 772, 766, 766, 766, 762, 772, 765, 772, 775, 766, 763, 774, 766, 769, 772, 772, 770, 766, 766, 766, 772, 765, 774, 772, 766, 766, 762, 768, 769, 768, 772, 770, 759, 766, 766, 772, 765, 774, 772, 766, 766, 762, 774, 777, 768, 774, 767, 759, 766, 762, 764, 761, 772, 766, 762, 763, 770, 788, 787, 796, 790, 770, 771, 758, 754, 764, 769, 772, 774, 774, 770, 770, 766, 773, 767, 772, 772, 770, 767, 771, 767, 772, 777, 772, 774, 775, 770, 778, 774, 774, 777, 780, 788, 778, 779, 784, 774, 788, 781, 780, 788, 778, 770, 775, 767, 772, 769, 772, 772, 770, 763, 762, 762, 772, 765, 768, 774, 770, 766, 770, 766, 772, 771, 772, 775, 774, 763, 770, 770, 772, 763, 772, 772, 763, 763, 766, 762, 768, 769, 764, 768, 770, 758, 766, 766, 772, 765, 773, 774, 766, 770, 762, 773, 769, 768, 774, 767, 759, 770, 767, 772, 769, 772, 763, 762, 762, 762, 768, 765, 768, 772, 763, 774, 790, 790, 796, 781, 772, 774, 755, 755, 758, 770, 772, 765, 773, 772, 763, 763, 766, 763, 772, 777, 772, 772, 778, 766, 774, 771, 780, 777, 780, 780, 775, 774, 778, 771, 781, 781, 780, 788, 786, 774, 786, 778, 782, 783, 783, 788, 774, 771, 770, 767, 774, 769, 772, 774, 766, 763, 771, 766, 772, 777, 772, 772, 771, 770, 766, 766, 773, 767, 772, 775, 766, 766, 766, 759, 772, 776, 768, 775, 770, 762, 766, 771, 772, 769, 772, 772, 766, 767, 770, 763, 775, 769, 768, 774, 770, 763, 770, 766, 772, 771, 775, 768, 763, 762, 770, 772, 765, 768, 772, 763, 763, 779, 771, 781, 793, 789, 780, 766, 766, 754, 755, 772, 771, 772, 774, 770, 767, 770, 766, 772, 771, 772, 774, 774, 767, 770, 778, 780, 777, 780, 782, 778, 774, 784, 774, 780, 785, 783, 789, 786, 778, 786, 778, 780, 787, 782, 782, 775, 770, 771, 774, 769, 773, 775, 771, 767, 778, 767, 772, 777, 772, 774, 774, 770, 770, 775, 775, 763, 772, 780, 770, 766, 771, 763, 772, 776, 772, 775, 774, 767, 766, 766, 780, 769, 773, 772, 770, 770, 770, 780, 777, 772, 780, 774, 763, 774, 763, 772, 777, 773, 773, 770, 770, 766, 762, 772, 769, 768, 774, 770, 770, 774, 770, 783, 793, 796, 782, 770, 770, 759, 759, 772, 767, 772, 772, 771, 767, 774, 763, 773, 772, 780, 774, 763, 778, 778, 780, 777, 782, 780, 775, 778, 779, 788, 783, 780, 788, 786, 778, 778, 779, 780, 783, 788, 788, 786, 771, 774, 770, 780, 765, 768, 780, 770, 766, 770, 767, 772, 767, 772, 772, 770, 766, 763, 763, 772, 769, 768, 772, 762, 762, 770, 762, 768, 769, 768, 768, 767, 766, 766, 763, 772, 765, 772, 772, 763, 763, 766, 772, 769, 768, 775, 766, 763, 770, 762, 764, 765, 772, 773, 766, 763, 762, 758, 772, 761, 764, 772, 762, 762, 770, 763, 780, 785, 789, 783, 766, 758, 762, 754, 764, 761, 772, 772, 763, 763, 770, 766, 772, 771, 772, 772, 771, 763, 771, 773, 776, 780, 780, 778, 771, 774, 770, 780, 781, 780, 788, 770, 786, 778, 780, 779, 780, 774, 778, 771, 770, 766, 773, 767, 780, 767, 763, 774, 763, 772, 769, 772, 774, 774, 767, 766, 766, 772, 769, 772, 774, 766, 766, 770, 763, 772, 767, 768, 772, 770, 763, 766, 768, 769, 772, 773, 770, 762, 770, 762, 772, 769, 772, 774, 759, 770, 766, 768, 765, 772, 772, 766, 762, 762, 762, 772, 769, 780, 770, 770, 774, 766, 772, 767, 768, 772, 770, 763, 766, 767, 763, 772, 780, 775, 778, 778, 766, 764, 776, 758, 758, 766, 762, 767, 772, 769, 775, 774, 770, 767, 766, 766, 775, 777, 775, 780, 767, 774, 767, 772, 777, 774, 780, 778, 774, 774, 775, 781, 781, 780, 788, 778, 775, 784, 771, 781, 779, 780, 780, 775, 770, 770, 766, 772, 765, 772, 774, 766, 763, 766, 763, 772, 771, 768, 772, 770, 762, 766, 768, 767, 775, 772, 770, 766, 767, 762, 772, 776, 772, 774, 766, 762, 766, 762, 772, 765, 772, 772, 770, 766, 762, 762, 772, 769, 772, 772, 766, 763, 774, 762, 772, 769, 772, 772, 770, 762, 770, 766, 772, 772, 774, 766, 762, 770, 766, 780, 769, 768, 772, 766, 759, 766, 764, 765, 772, 772, 766, 770, 778, 784, 791, 783, 772, 772, 766, 747, 762, 763, 768, 769, 768, 772, 770, 770, 770, 763, 774, 769, 772, 780, 774, 770, 774, 770, 780, 777, 775, 780, 775, 767, 778, 775, 781, 777, 780, 788, 774, 775, 784, 770, 780, 779, 773, 780, 778, 767, 774, 770, 772, 769, 772, 774, 766, 763, 767, 766, 773, 769, 772, 780, 766, 763, 770, 766, 772, 769, 772, 772, 770, 766, 766, 762, 772, 765, 768, 766, 758, 770, 762, 772, 769, 772, 772, 770, 766, 766, 763, 765, 772, 772, 763, 763, 763, 758, 768, 769, 764, 772, 766, 762, 766, 768, 767, 772, 772, 770, 770, 766, 762, 772, 771, 772, 774, 770, 766, 770, 767, 772, 777, 772, 772, 770, 762, 762, 758, 772, 765, 768, 766, 762, 766, 771, 783, 793, 796, 788, 766, 770, 762, 755, 768, 765, 772, 772, 766, 766, 770, 766, 772, 777, 772, 772, 774, 763, 771, 774, 772, 769, 780, 780, 778, 774, 774, 778, 788, 777, 788, 788, 786, 794, 778, 774, 775, 777, 783, 772, 786, 775, 778, 775, 772, 765, 768, 780, 770, 759, 770, 770, 772, 769, 773, 780, 775, 770, 771, 770, 788, 765, 772, 780, 775, 771, 770, 766, 773, 787, 788, 772, 767, 778, 775, 778, 780, 779, 788, 780, 784, 774, 778, 771, 780, 783, 788, 790, 774, 771, 786, 779, 788, 769, 788, 774, 791, 786, 786, 788, 769, 780, 782, 758, 778, 779, 786, 774, 777, 764, 799, 767, 778, 790, 772, 785, 788, 823, 784, 786, 784, 642, 774, 783, 804, 703, 811, 784, 790, 806, 804, 795, 823, 504, 806, 834, 799, 816, 760, 608, 780, 798, 794, 802, 798, 804, 809, 814, 820, 786, 810, 806, 794, 836, 801, 820, 844, 798, 803, 830, 803, 823, 851, 812, 828, 818, 835, 818, 819, 852, 844, 844, 831, 826, 811, 806, 829, 825, 820, 828, 818, 811, 810, 812, 809, 813, 806, 816, 826, 798, 784, 815, 825, 805, 820, 830, 819, 826, 827, 812, 801, 800, 823, 802, 835, 978, 1019, 1023, 1019, 1011, 1023, 1019, 1023, 990, 879, 939, 812, 852, 818, 802, 854, 818, 820, 806, 852, 806, 822, 795, 798, 823, 809, 800, 807, 818, 811, 794, 802, 800, 808, 812, 812, 816, 827, 850, 831, 812, 819, 820, 780, 810
    ]
    
    init()
    {
        print("ECG_DataSet init")
    }
}