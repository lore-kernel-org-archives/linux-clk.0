Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D4CC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 21 Oct 2022 13:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbiJUNaW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Oct 2022 09:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbiJUNaR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Oct 2022 09:30:17 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638161366BB
        for <linux-clk@vger.kernel.org>; Fri, 21 Oct 2022 06:30:13 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LD4CFU030771;
        Fri, 21 Oct 2022 13:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=ovhq6Dejizswi9s7wiggZCX3FYk9QYUTCXfSbDBXLPI=;
 b=Rtg0CrIrWWSNDbKI6/GfkFDzbM8BrCMLYGYBMafRUvZaoUTdho3p2OcC/IwGFUhUFirm
 u9k8AkIJF8gGy/huW51oi0FL1dAPy/oNkjYpOv6pyDf7yrHBT6lwUR2DrZYjx8axNNTD
 oBR6PaD8KQEt0buztS+5rb+ZvAHMXQivKO80VlWOpytoSBnMhwwEtBqWcJVDOZsXsFIU
 pi/ytzQARRbguZiykgG1PyaD0y43DGynAcyooF4XgqbyOuBddNFOJvTc6BZg6l4x6CbG
 R9ogfapkVk2hYSaf7LkuXeDo16JLdkXR2AhJzLLkevLU/h5GM8TIKZaBOqQfzX3m7STZ BQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k7mu08fcg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Oct 2022 13:30:09 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29LCiw8j018227;
        Fri, 21 Oct 2022 13:30:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3k8j0tyve1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Oct 2022 13:30:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEXtx2srrsRBkWEclxDSwxRk5z8/qykY8OiNeyN1kXT7YVgOvyA/h0N94j6PZYgsFSE9ysfZL5m/zXtbkx15gOuV91UuWdRQEo6j5M4mZNUoTN+/p/dknxrcqj9n/U0EK3PoWkdQGwrEI/15NyGkY4SYSsHzjboqkq2yxCQUUBxL/ai7aXJB2/QO0ORioXOTogOxvGYZjf9uZ0b41p3jpyzOcqDkXzj8CPvDKgnls1ZOa6EZKVXzFlvFQ9TWWYUFChpDcPwFbbNEHnPZDgZHAJKxc0U+v/vOyxVHxA2yHQzSHPaEUYTwwAzwAvc61vADsiA3nCnBBhtF3YcwIymY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovhq6Dejizswi9s7wiggZCX3FYk9QYUTCXfSbDBXLPI=;
 b=P55eOndwQN43LiCXwBke/sTDoW7HPku8Aw7gZGPXVdWCjC9fUWL71Ty1h4B/32P73Xj/iqwySjPU2hjNF1b95TPwPIM9sVP5SQ+tW8Iy/grhp8kxDP3mLb4XzaqRGiRY99ty19BzVgLEx4x1iq4HR93Dzx6ZjsfUSLbl+/A5lqkxTBlOjS8azCp5UpTvPmX7YMz+3arPgkB3ADgAa4RMfv5ng2QShz9soRXhzw3ool0ueUozMEkZX8/0qCLUC5yTf+3vJBgMh3iPBkBgHlxjnVLjqMaEs0nvUHw+K46+tTVKoLxe+O6woHM2Ffo7VLq1ahIkNeB6IRG/L/K+4GzWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovhq6Dejizswi9s7wiggZCX3FYk9QYUTCXfSbDBXLPI=;
 b=LRSMi6x/7xvpPKFJxf4fc25JeeGVbyFv/PZUkHymsmDASIVa3y6EkkVGvZxNClsZg/PMx+64l8W9gc2OSres7ti7wLBiBfRrr2+XUF+hW2SlQd3ghq3H86jRmreboCJldVWV488o3A/ra3xP8nce+XnmGfvz40ijCMpd+C9IUfU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5215.namprd10.prod.outlook.com
 (2603:10b6:5:3a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 13:30:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Fri, 21 Oct 2022
 13:30:04 +0000
Date:   Fri, 21 Oct 2022 16:29:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     peng.fan@nxp.com
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clk: imx: add i.MX93 clk
Message-ID: <Y1Ke0kWvJD6AUHVR@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0185.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|DS7PR10MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e569dd-f4ea-4fe4-487a-08dab3685ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fbihlRQeL1a0LmBxnpPpRjRl8j9RjLKbrj2G/4MTNfK5JjMekgY71zgD0BYUxvzImMznA8BkmstBIUqnvKAps0BEY0qs0X0aCoIC8kvxbI0q/8IJkhTB2t5ZKdYK2EvKeoscSql1zZmAuFSIKGjNxXT0YhRhnYH0NeJQqALQghDpu75f+z7CYwBK/bJdU5KunrK2dxbG8G1RQwjdzkdfevYKlO0N5Q/fJU9v95uuW84AIjCk7VrQi9jNxvrVyeJCvfT2oMTKTanIHBBfYR2vcmWXOcZ+3GyuwQyKWbNxNrXIcARJaCpBiy3vHGwPumaNtF+co/u+3AkABR+AxJX4QAdAUYoMi7gvzgdhbMREeKVHr0qw8TrjXEemGFjWtktGDZf68lWXi7RW1MzcZDyC48PiCEVAcp+4kc6xWOH6wdB8XpdK6VGhl/xkz/x9rYN96az6+rUflvba0n5KiSVNQdXZ5YvZwmSRwptRmswpVUPB9NSc+pd+zniuNGg8XBX6vHT4mbuGIhb88Ka0FOz+OSLpPdoCC08yHpNnl1Nmxei+QDSPa8zqozARKym2jrP1Zqo8MWfvb3FlrNLJZS62BmYaJnhI+Tk8DuE9Qsl0S6fWdVRc24IciwVlPVGf7Z+Jp84HZhHTZF+4RvUXiW7quA0coaT0+4snZH3N/JpOZ9PH97jkVZfINqJlc+bAjCYw5AL9vZ8lhHrs6HDxDmCzhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199015)(66476007)(66946007)(6506007)(66556008)(8676002)(4326008)(6512007)(8936002)(26005)(9686003)(41300700001)(5660300002)(6916009)(6666004)(33716001)(316002)(2906002)(86362001)(83380400001)(38100700002)(186003)(44832011)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Ag3ESNUp1uKYGMKtwI5kY7hliQ2M316ij9Q4KzjEn/bbX04iAepO48DoPTl?=
 =?us-ascii?Q?0lZHXUO8tGC6yaibbL+ivOamssc7d9C3wOjE1qz3YrM3hH56Uczn2rF58RjN?=
 =?us-ascii?Q?AWd0niVSKDwm15qRWbTe4HX/e2JHv10Bz9xm9ebsAwszQp1jInGNPf68yoeL?=
 =?us-ascii?Q?/psNPpvZoRrudO07x/hrGz5d7MGV6fjXyhvAcc1NP3q5VGI0/XLhjbo0V9Ve?=
 =?us-ascii?Q?N2mwwWD/++CdI4DDcwrsrmDokLTsql6fbWg7vbhq7QY993LwRzVcURl9dvaB?=
 =?us-ascii?Q?Umy2u7MEz3HrVAfvphHtGjRe0Kihb1WTig3tdS96fZ1lLIftehu1cfPL/trY?=
 =?us-ascii?Q?uVkySDS/BEGToXp9cIMDGw5IPd+or6KDZ8ezAq6GcmbDFaGGXl1DBBmwaee6?=
 =?us-ascii?Q?iobUmB++7JyLTOYkdYeLnU2/rPmcYwKhSa+vztfvBjl7gvXL/T9d6ZVG3vH3?=
 =?us-ascii?Q?B61wOKwRah7EAW+x5hW+tRr4A06BhygGD13Y+xIM/L4/gqdKX22KAd7h0jMb?=
 =?us-ascii?Q?HpiywGBDgy5NmjkRAMUGMED6C2p8P1mCSQe5CvUsNYxFo4suJobaOQXdOP6i?=
 =?us-ascii?Q?IES0WeZ0pZhRBvDq0JztseUK+aiuTQmeFUrJ6zMAtR0t5ucGfqtSuOQVVzo3?=
 =?us-ascii?Q?6+iXnFJKiKXwEoeNUf+i95If43VRbP8uhV7Lch06ZLK9iS7ZDNrK56IpKren?=
 =?us-ascii?Q?ILKzJwbDJhdZc4rJzLEz6y1vfWUce7yGQwhddFp/xmCbHGX0U1u93xh1dcrU?=
 =?us-ascii?Q?660PdOoMBDGpjV3cTuuJp4aVBqkx2rMuP1cf4R+3Y2rbA64Tanlfz9K8f/Zu?=
 =?us-ascii?Q?1uQoYhKBgrNt8drPrmytNzDmbI36AmUSQOD3n1C2bmq+lPV5YlkU7JDNjLHz?=
 =?us-ascii?Q?baeb8HzDCPqrwcx8QaAPSbft9zFNopIqKdT8ixQCBUHagBPx/u1EnvVAH50u?=
 =?us-ascii?Q?QkfDISbedgVr3GMo2K4J2uBfAmTZUA45qMwaSTg5GHHIGKJBz9nsTSvzxy+u?=
 =?us-ascii?Q?9VjX/vmIPJ/JCNCEJTGxUUEd2eXzGVqy9b8SLHWcdPZ+4LFaaQM8PDGl6YgY?=
 =?us-ascii?Q?rf1OjyxM1H8BQI6QQsMrA3DL3A822BKd4APTvGbPQPXAFvPpUcLSuX/rpbB+?=
 =?us-ascii?Q?msJMCNMSV3va4B90YYnNwjQXyWsdPrPtHSQ78Wx1qI1Lir0PZogw5LK1eN2j?=
 =?us-ascii?Q?RLy8rsxvUnao9oxWyK5huq3ud5BuDGxjfmpnDhp/3QU4CGyRJyGPf3YXAVZY?=
 =?us-ascii?Q?0xK7umEcBekar92zHMcEIyyEyPGl2waCExyd7eFxXsd5Nf9kuMjDlCKdIofh?=
 =?us-ascii?Q?KvFafJhgFd41/fB+WlEB3U+kM3tQiPFUBLTwEDf3ZQ2yLCYqmVTVMIUNn9Xz?=
 =?us-ascii?Q?NN50iSPuq2NvS87MP++Vxf4T4ynMfmYe76gRgPTzPViJsUMgafmH/QKoAMKt?=
 =?us-ascii?Q?4OTlJtlvdxGJaWR0rpGzScumrz7HFOKURntvBvFrvJAM1+x4/YNzMVwqUKz2?=
 =?us-ascii?Q?Bf7kzXIuXW+bIfWD0Fk58mZy0xZscUtSP/0fnors0jX904brJ0xlDVmyIKaW?=
 =?us-ascii?Q?AG+EWTpsS+r2hqYdkSTJfd2JepejVM3E0jdYCsf4hqs7xD6kSXONn/RXTd7k?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e569dd-f4ea-4fe4-487a-08dab3685ce9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 13:30:04.5140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8oCgRmREa4pNaiC4DywTzO4Rp3yXYO0NpBYFxNP0J+aD3xvu43ueSCKdTD1C0LvCaLwGiBqG7xKRA1kgImXTmmgL/hWbXFDMBm8iS081ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5215
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=328 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210210081
X-Proofpoint-ORIG-GUID: DpTr7JhID5Sgdg64PJDL_IQQjjLRqV1v
X-Proofpoint-GUID: DpTr7JhID5Sgdg64PJDL_IQQjjLRqV1v
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Peng Fan,

The patch 24defbe194b6: "clk: imx: add i.MX93 clk" from Feb 28, 2022,
leads to the following Smatch static checker warning:

	drivers/clk/imx/clk-imx93.c:331 imx93_clocks_probe()
	warn: 'base' from of_iomap() not released on lines: 301,331.

drivers/clk/imx/clk-imx93.c
    255 static int imx93_clocks_probe(struct platform_device *pdev)
    256 {
    257         struct device *dev = &pdev->dev;
    258         struct device_node *np = dev->of_node;
    259         const struct imx93_clk_root *root;
    260         const struct imx93_clk_ccgr *ccgr;
    261         void __iomem *base = NULL;
    262         int i, ret;
    263 
    264         clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
    265                                           IMX93_CLK_END), GFP_KERNEL);
    266         if (!clk_hw_data)
    267                 return -ENOMEM;
    268 
    269         clk_hw_data->num = IMX93_CLK_END;
    270         clks = clk_hw_data->hws;
    271 
    272         clks[IMX93_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
    273         clks[IMX93_CLK_24M] = imx_obtain_fixed_clk_hw(np, "osc_24m");
    274         clks[IMX93_CLK_32K] = imx_obtain_fixed_clk_hw(np, "osc_32k");
    275         clks[IMX93_CLK_EXT1] = imx_obtain_fixed_clk_hw(np, "clk_ext1");
    276 
    277         clks[IMX93_CLK_SYS_PLL_PFD0] = imx_clk_hw_fixed("sys_pll_pfd0", 1000000000);
    278         clks[IMX93_CLK_SYS_PLL_PFD0_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd0_div2",
    279                                                                     "sys_pll_pfd0", 1, 2);
    280         clks[IMX93_CLK_SYS_PLL_PFD1] = imx_clk_hw_fixed("sys_pll_pfd1", 800000000);
    281         clks[IMX93_CLK_SYS_PLL_PFD1_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd1_div2",
    282                                                                     "sys_pll_pfd1", 1, 2);
    283         clks[IMX93_CLK_SYS_PLL_PFD2] = imx_clk_hw_fixed("sys_pll_pfd2", 625000000);
    284         clks[IMX93_CLK_SYS_PLL_PFD2_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd2_div2",
    285                                                                     "sys_pll_pfd2", 1, 2);
    286 
    287         np = of_find_compatible_node(NULL, NULL, "fsl,imx93-anatop");
    288         base = of_iomap(np, 0);
                ^^^^^^^^^^^^^^^^^^^^^^^
Smatch thinks that this iomap() needs to be unmaped on error paths.

    289         of_node_put(np);
    290         if (WARN_ON(!base))
    291                 return -ENOMEM;
    292 
    293         clks[IMX93_CLK_AUDIO_PLL] = imx_clk_fracn_gppll("audio_pll", "osc_24m", base + 0x1200,
    294                                                         &imx_fracn_gppll);
    295         clks[IMX93_CLK_VIDEO_PLL] = imx_clk_fracn_gppll("video_pll", "osc_24m", base + 0x1400,
    296                                                         &imx_fracn_gppll);
    297 
    298         np = dev->of_node;
    299         base = devm_platform_ioremap_resource(pdev, 0);
                ^^^^^^^^
"base" is re-assigned here.  Smatch is correct, no?

    300         if (WARN_ON(IS_ERR(base)))
    301                 return PTR_ERR(base);
    302 
    303         for (i = 0; i < ARRAY_SIZE(root_array); i++) {
    304                 root = &root_array[i];
    305                 clks[root->clk] = imx93_clk_composite_flags(root->name,
    306                                                             parent_names[root->sel],
    307                                                             4, base + root->off, 3,
    308                                                             root->flags);
    309         }
    310 
    311         for (i = 0; i < ARRAY_SIZE(ccgr_array); i++) {
    312                 ccgr = &ccgr_array[i];
    313                 clks[ccgr->clk] = imx93_clk_gate(NULL, ccgr->name, ccgr->parent_name,
    314                                                  ccgr->flags, base + ccgr->off, 0, 1, 1, 3,
    315                                                  ccgr->shared_count);
    316         }
    317 
    318         imx_check_clk_hws(clks, IMX93_CLK_END);
    319 
    320         ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
    321         if (ret < 0) {
    322                 dev_err(dev, "failed to register clks for i.MX93\n");
    323                 goto unregister_hws;
    324         }
    325 
    326         return 0;
    327 
    328 unregister_hws:
    329         imx_unregister_hw_clocks(clks, IMX93_CLK_END);
    330 
--> 331         return ret;
    332 }

regards,
dan carpenter
