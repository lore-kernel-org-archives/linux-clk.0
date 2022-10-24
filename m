Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2324C38A2D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 07:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiJXHAA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 03:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbiJXG76 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 02:59:58 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10DA209B7
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 23:59:57 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29O6FO8K019479;
        Mon, 24 Oct 2022 06:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=f3QErWQU2ZBWpL0ORo8UxrBkcH3o9LQvjw9X9bwNu80=;
 b=fRlfmQJ4magNomtI2QUV/ZPf0xIn9+MuosT1hnwU9fNSVzS0PC0A2uJLrPGPT17dx3Dw
 mI116swtl0E88TotFtcQ7nBp9AtL7s4HMcH22jUZlogkjgml8f/wzFBIyLgWbZ6zTNUe
 AqFFBo7aB+NS/c3uieh41Asfu/HvLZNtwFZ67uZavWl38MNQH1yrr4a+qjp6g5wiBELH
 4lHZb5zruYlB+FyxccLatL2D3Jymp+fKgm5V+3/KH2diWP2TxRwYtPjn5yGiK3DigEWk
 cCl+hHLZNoZi7zrOzFhWGhNNBDCf3AkS9FFPaZj0tsDxWVXRJh26U+a9AU00gYJwq0AD 6g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc93934f5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Oct 2022 06:59:54 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29O6YPp9003588;
        Mon, 24 Oct 2022 06:59:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3kc6y9dcew-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Oct 2022 06:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ojqnp4dNfGtY2QSPQriRhCH+tt865Bw6l8XyTPoyg7XIWC7NCh3fobHBtmOy6MvuWQa1ZsaZPAih5Xdc0y25KDIoOKkzKIAa9wNrWPloC4Ql1vq8LqELJQkYsuXvZ281y0Wu4H1FmwJOeEYNJ1dpXZjQhgxMkO1I/l3ScDtf2S2I9Mx+r2jmgxPDbQedc9qFNqvun4w6uKnB6ITsD0Xn5OS3T/tXYSaOdtpmtcbgJ229/Z8YAa4zBmSdG69epkuGuUct3Ju0K8I7cmGlw8LSoiuc0iFT+DEk0xzsSFVVvdNEAS8Gq5Wvrn27jhvITfqRKwZU6qF24VCVtHPdn1cqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3QErWQU2ZBWpL0ORo8UxrBkcH3o9LQvjw9X9bwNu80=;
 b=HWJtwUcbwWFbbBWwDU/WJbjV2spSxDg3H/KVyzVuFOzNAb+2HVgohryN0kIrAh3GYb5AqfOJVaMCnzxkdqwrPndLVgEcqnfn1+t+nrk2OjsUbmLvhPPaLy6MqYgatSBU83rH7MnsZNVkpM9ucJJLN5vg0lZhNpKJoJxmuomcOnhWmCrQeFBFBbfowGugEMrkGw9tcfx42FyVnq0HKqg2RE9k1b/bFnNjZm0Jx62uYhXhjlOAVINRyE2p4NCtP6tHrUt2BN8dOByjzTC+sKs/xwCjLGvPtIinnsXu/rYIGQYsr+jyRakVDrWFcmknIbmhh+koCtk5pI8uoZJ9ENIhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3QErWQU2ZBWpL0ORo8UxrBkcH3o9LQvjw9X9bwNu80=;
 b=GhYc5D6YVsEoQvZ4Yl4dk1hL0b+WXagBMZXuCWfCa6TFBFSjwIpcSni+l0KOrBfAxcLcAzXZme7GM1iLgGjDA1ar++xopM/uknA3XShUC7SBY3waztNkT65uWBtNuDCTX3qOxzwHJnsNRjBYOULmcXUgf+IiCLCwKvNfNM8B6B4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH2PR10MB4248.namprd10.prod.outlook.com
 (2603:10b6:610:7e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 06:59:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Mon, 24 Oct 2022
 06:59:50 +0000
Date:   Mon, 24 Oct 2022 09:59:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rtanwar@maxlinear.com
Cc:     linux-clk@vger.kernel.org
Subject: [bug report] clk: mxl: Switch from direct readl/writel based IO to
 regmap based IO
Message-ID: <Y1Y31z6VqiuF/9Lp@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|CH2PR10MB4248:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a92ae96-45fe-4e4b-a3b1-08dab58d585f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eE/3tKN2K4m/UP177AzQ21yOm/1k2M0xxZSuNdMAgvn175NTA+ISdAHdbJrQb70Wiv0ur/YkTAdSqMNiiF/jhYOXFot0PeyiTJ56JMEtv8mkO4/T8J/yfJnZn7SxIxErivZfs3Tq6QC2Mrzz2WJaWRMo694QORd30R8UthAM07uchKbP4zhn0yVauXLSs8fcsMAHQf7KyWdLZtHu8/PeUcJhobablt3r+VID9AR/E0gHCr4CkWiZ2+o+nCoFWcyvmlgA//EtFM80cjTCiuTJfisVA1pvC2cu3l3LPWWhOlL/GWh8V7dA97+oOShqBKWHrWXLnMADTUMLUmDqgT+KNuMXFd2jH77BhFMNI3KFUdjy0W1CGexqKXn9KNO6ITPa6qPLlvocDyKsY+udT/9uOIN4Kf3YPVAIzAAzPBewx2sIB9jnnQM75gIZWya9NnL5XyT4EhBjVlJfJ33d9i18BPd+AXcXuUiblHZHyaiSzDUkJ4m7pOfbdLLqnx3IMh0rbJ2wSi461HYV07lP76QBtYQmbJR0fMF2HIhefJGNPCy43RPGZpvsSJ0UMW+rKlvH9AU+e2DqydIpR4tt7Uk+1ldU30vDlUIp34Mfj5uYDpDLwZcNkz++V4CzqoAHpqVxHkKIwEUyULgqroFTFTl9uKdjYmO4A6A9zwzZpKqjmtDh+DaZC2EVhT4GVYwPkEYOX2heoe423fgvtDG5NDhyTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199015)(2906002)(5660300002)(44832011)(33716001)(41300700001)(316002)(83380400001)(38100700002)(186003)(6916009)(6666004)(6486002)(478600001)(8936002)(86362001)(4326008)(66476007)(66556008)(8676002)(66946007)(26005)(9686003)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?El1CqjRLii2j4dchGK+R6R7RgVnzwiqXG9daa3dJ6ZXidBhWkmaLqTfDQdEa?=
 =?us-ascii?Q?QX3SJq3WrXrVdSrfFsfCPTB/MJ7oB657cTvJ15UqGuzxdu9Lq4qM4THTRPDy?=
 =?us-ascii?Q?CTZ34X2hswdziMGpD/5Lknqifalbs5E0olGl/frW1ka9xj675uIYw3rDrsUG?=
 =?us-ascii?Q?LiVDdHJ4UyScaujp3pXg7rI5SzwjUUaszgpCSYFOTlCT2K54o/BcphTjoxsA?=
 =?us-ascii?Q?gvPIO+OWxYFg6QVxc70ep+d24kvvdkeq+M4bULDlPEbDKRSIQYGqwJDafRCO?=
 =?us-ascii?Q?h/nod4LsbnVg9dLtin76FCcpgbxPNEqyvQjwGFprZmovqenCWF8iecQaveLO?=
 =?us-ascii?Q?E26CBmDSwfSaA/xqcQsbLJ9IdGxEm9FpqLY+Wm+1J5NeC9wRJidX5xl+qz2/?=
 =?us-ascii?Q?XlrsM8QnYOJMzLlaQry0Fac4hmiB/elzKxDvflSI0/OLZ6ygK0PiXWYTBU4M?=
 =?us-ascii?Q?cCuUANWtCY0qz3L6EfIcoWBgeu5N78ujwUKt8jlJmYzBQUPQtIK2xszJo2um?=
 =?us-ascii?Q?mBXNm0r+GynvsUaA7YnL5bGQeN0HlvBDLlhjyIyiTW+oSSCVSPkeLgprIv4C?=
 =?us-ascii?Q?cEVb5lPDTBVSjHVavP1mUmlBWrRtwwyZUbPq9Y2y/twGSNeGDQMT5CntUV+a?=
 =?us-ascii?Q?Aka3VM/sdFn3Tc93S9YO2oM9WRzRWIKaZ/J3vcgqJ+beIxEbofWuIKntPmOL?=
 =?us-ascii?Q?beX09RFzwkG2+qc26nlXJ57aW5Ud/dpEkA8XXx6DulJCSjL5dHuSdfT7vAlm?=
 =?us-ascii?Q?K9g6sbYGXVH9cw6bUXldwl0i2Pl5/6hzExBGX09EAn8+LbbgBYhpA/yOl3eR?=
 =?us-ascii?Q?PxW6XxSYzSFxCpqmo8XPrvmSoalvC2noawky2gV1hjS0AV5By75RM2k3c/Ah?=
 =?us-ascii?Q?iSmwtNBtBWZiMLIxrdpGRMw2/QwPBoiraU34RPJg4j+CSuEwG2N/EdBPaZZ9?=
 =?us-ascii?Q?BWfMexN01Qc/db1sO7vMqhPzhfczOjWJQ6hHzTNOS9LC7XbOKkV8vi93mcJm?=
 =?us-ascii?Q?1xeZiqW/MnZJrucpqlws/tS3K8QcFfGnlFB3W4gZaQ9Sqf5sl7l9Cszr3+lU?=
 =?us-ascii?Q?8Mnuu/GqM5N7zMYnSZz9OpAfIzM13DQp/anxcjPxl9jSfzycUfVDn+iscikx?=
 =?us-ascii?Q?o4bACzE53/yPWBDazkWlEpuBNFOlTjWn1F0vCSi7s1/YsGIakUbzKmJC4SvO?=
 =?us-ascii?Q?d1BzAkF4lR4QQM9n1ptdiNO18cxMbNNJUu+5MdsntAZUFDSgm+U47GIunTTd?=
 =?us-ascii?Q?xNvcrEDWnJXkJPW+bokBuJ0CeAxlOeJOaHwQ/cPRNfWZGAXx+Qk/QW2u1BWG?=
 =?us-ascii?Q?vKECQweForEp5iqTR8HQblLN8E8vdseiAv8mV0mX7Vv19s/f7KwFIq02mrsc?=
 =?us-ascii?Q?WXjbmSv0Qk58YeiHw5PQlGJSP1XibY71ZIasb7Ou9ma3qTmaQo1agicSf318?=
 =?us-ascii?Q?6CUDVTyfSH4SOYb1pfB/BcTeN7gbKz0guFFWvmdrLdSNNVYpJoq9ojTi0PPV?=
 =?us-ascii?Q?Vz2XOaA3uAlUpsIAsqJs0D0Cr0J7lSTBbtf7rxiwpogxE8czFwgLPacCypJo?=
 =?us-ascii?Q?xork70T0+FUWvb8acggV7EMCHLiBooZf7wthJ66PcCj+PQJHfFm67/gr2YiJ?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a92ae96-45fe-4e4b-a3b1-08dab58d585f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 06:59:50.5431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+yitbZbbQYOEaW5aCqcafrdlpI5GslD/ir1eEbNJe86IJs1UwE4p2iSAcKHpHzzvAB6qDJ6cA+z2Yzntya/HnShV7eWGTAtVtYG44WTZUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4248
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_01,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 mlxlogscore=369 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240044
X-Proofpoint-GUID: MpsBigOnKAI9zs320EPYC3X2-wwxxYC1
X-Proofpoint-ORIG-GUID: MpsBigOnKAI9zs320EPYC3X2-wwxxYC1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Rahul Tanwar,

The patch 036177310bac: "clk: mxl: Switch from direct readl/writel
based IO to regmap based IO" from Oct 13, 2022, leads to the
following Smatch static checker warning:

	drivers/clk/x86/clk-lgm.c:441 lgm_cgu_probe()
	warn: passing zero to 'PTR_ERR'

drivers/clk/x86/clk-lgm.c
    424 static int lgm_cgu_probe(struct platform_device *pdev)
    425 {
    426         struct lgm_clk_provider *ctx;
    427         struct device *dev = &pdev->dev;
    428         struct device_node *np = dev->of_node;
    429         int ret;
    430 
    431         ctx = devm_kzalloc(dev, struct_size(ctx, clk_data.hws, CLK_NR_CLKS),
    432                            GFP_KERNEL);
    433         if (!ctx)
    434                 return -ENOMEM;
    435 
    436         ctx->clk_data.num = CLK_NR_CLKS;
    437 
    438         ctx->membase = syscon_node_to_regmap(np);
    439         if (IS_ERR_OR_NULL(ctx->membase)) {
    440                 dev_err(dev, "Failed to get clk CGU iomem\n");
--> 441                 return PTR_ERR(ctx->membase);

Generally when a function returns NULL that is a special kind of success
path where the feature has been deliberately disabled.  If for example,
LEDs have been disabled then the ethernet driver or whatever should just
handle that and continue functioning.  (If there is an error in the LEDs
then report the error and do not ignore it).

Can this driver not continue without ctx->membase?  Is it useful to
have a no-op probe function that just sets ctx->clk_data.num and returns
success?  If it's not useful then it's better to handle it in the
Kconfig instead of waiting for the user to find it the hard way.

If CONFIG_MFD_SYSCON is turned off then syscon_node_to_regmap() does
not return NULL, it returns ERR_PTR(-ENOTSUPP).  So the IS_ERR_OR_NULL()
doesn't make sense.

    442         }
    443 
    444 
    445         ctx->np = np;
    446         ctx->dev = dev;
    447 
    448         ret = lgm_clk_register_plls(ctx, lgm_pll_clks,
    449                                     ARRAY_SIZE(lgm_pll_clks));
    450         if (ret)
    451                 return ret;
    452 
    453         ret = lgm_clk_register_branches(ctx, lgm_branch_clks,
    454                                         ARRAY_SIZE(lgm_branch_clks));
    455         if (ret)
    456                 return ret;
    457 
    458         ret = lgm_clk_register_ddiv(ctx, lgm_ddiv_clks,
    459                                     ARRAY_SIZE(lgm_ddiv_clks));
    460         if (ret)
    461                 return ret;
    462 
    463         return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
    464                                            &ctx->clk_data);
    465 }

regards,
dan carpenter
