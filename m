Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC14C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jan 2022 07:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348516AbiAKHZu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jan 2022 02:25:50 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64508 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235242AbiAKHZt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jan 2022 02:25:49 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B3TGpg006818;
        Tue, 11 Jan 2022 07:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=5aGhuj+g/ftAT6Z82e+2TGT4GsrleQu8wONz+fAVO8o=;
 b=lfO6xqx2PxFB84+9ebxx9VfuE7xPorFk0//kGzezVtot3RgeTE69AeTbT2WkR1uKnwgG
 ebpgy10mdaCgxhhvBzDBbGjVEr7AMd+NlnEdoLUmUv9tlUIQ8SaQ7OMpRZP6E4j/mWuj
 NsA6b/mp1yGzZgEmJknFStzckt88HDo8ekRQKgO0mNDuUhBFut4VEOV8z49BeJzB7GhT
 TtNbwPtgwdyeoZ7JFI2PbzyA3FJH6/DVL3itwUHt18DRVO2OYpHEFBZsxgz0Vr05zzVy
 dzOtXIa/ldAgF2ZkK0aUfymUeCZ7ndJAbJMLsDZHLdNGk1kNLR2Thi6UDEtyEeBv06RG 6w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtgakkv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jan 2022 07:25:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20B7Gd4M047402;
        Tue, 11 Jan 2022 07:25:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by aserp3030.oracle.com with ESMTP id 3df0ndp08e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Jan 2022 07:25:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4uWA4f2jwImHv5otViLb4h24FPB9/ucbeWXD7BBKApqwd9dGkLmbIaiNAIzt/Jeoykxc5PjHeFJLy3Uq61DvBcRoov3CnNyOhpOwVDMziKUBkkx+hYmh4Mu3uMRKi3Hjs8WfQhZrsE3iagFkLRk5ABbSpygLfilY4BfYgBzpTMgGn4VRwW5+DoPCZIv54hJU1VDkA1yWxlDPO/uCx1DLyLz1Ax7GKunBSmDVdTstABNTTXHyzWK4YOr0jYqEPgkyCVURJ36+q4HhE8AG7WyfqxJXX/1VXKLzK8xxkR/dgi+91Migmp2tWBzm7Jhp0NQi3t2ekvcfe+1EpIdcCdf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aGhuj+g/ftAT6Z82e+2TGT4GsrleQu8wONz+fAVO8o=;
 b=P30cA+l8X9yz+iHmqQCJoP4CBArS7+Gcrro4dQd3fbWlPGfIA60CHPmnHIFfpnnUFOw3J+vQv/qujht25JjyuWtU+HEm5mx6jcj67q5nGCXc7Cz7CDeYsNV0PP9bhO3BCfu3shkJUK7juSfCJy9kVFfWe6x0HOEyI+l9u7NX/1B8lVwZjxNuWdvjyPKlm8vnpuS3srxuJ8rpVMaL2f4PnkGFUmK9r0DumSxX/iJmhbSXKpqH5rXiesy8lOddCG2Gn08mUVyhsJyfjSLepbwbJ9CZERwfiJGCnuTsvuFGhCB+p7HdjLA8FLsfa4CNPD99VzqEdiVzDawRiCiaw7x0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aGhuj+g/ftAT6Z82e+2TGT4GsrleQu8wONz+fAVO8o=;
 b=AcBANBKVqINCWb87Pu5+vnSpctYP3vvLP9KGpCFf6nryqrf6dXV92Eqkns0QdTNN3GOpF0xzg0L19nWWXn1XybTohqoOD/5EqQeaKp3pCbXWvyOy6pyjGdSF1pXwok9A8UH793fGKVDZreEAcLGbXJTFth3WIWEx/TG9XWC458c=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1824.namprd10.prod.outlook.com
 (2603:10b6:300:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 07:25:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 07:25:40 +0000
Date:   Tue, 11 Jan 2022 10:25:29 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: visconti: Fix uninitialized variable in printk
Message-ID: <20220111072529.GJ11243@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0090.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70d08493-4fc1-4e85-89c9-08d9d4d391cf
X-MS-TrafficTypeDiagnostic: MWHPR10MB1824:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1824F2D94BE999E98F6A3F968E519@MWHPR10MB1824.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G8Co0yDrE4dVNRkvcLKaLsJzM7gLiC0RqicPxA4CNVhDkHFU13zYFCfDeiRw03Lbl414C1T+c7lBUAD2HI2YWNfhzjjhO5yaaE55+Kn48nHMy3H7AHduwmZYOaBM6it+ZZkufEBmOguN2b17NEwmwJYB64zLFcKl+XoMrWbba8xgVN5C4/pmhX4Ye8odw/9SLes5PhD09f9OPFIRmb7UZtkDiLrErVf7lSGZ3wi379yEE7tLui8KHRR1cnaGsz9sj4pv8ehH9A8F4vUJQg7Pv6insrLoxtdNh9dScc241no+MKn6/dXdiCyQuIFxndtzFuvIzy+BLdPNr9rxW0orz6JK40+CeJz/ihzZWhzLD7A+W90HRFA6kOQG989jhw4WfMZT0wi2KdSoWq63ms+P+DUBfB1yP3Qld/JAaYwdSrCB1jADh3C9KrrNCgOsDpqdqnh2SD6N8lAugLww5cUeyvlNLd/T6YC+3uP8bk8/zpglTaj6jcXjCeV3AYWp/cZjyN2b7mW28eAnws0G861IgdQCtMp18IRV0jQehPfVCCNsIDX5qVBWf9bctcoQMPAxDEuo4XSnC7eyWocD95/cJDbxhHO4Atzc+5J7XmXtyuFfphF5ofx8iVjIwU0HMkZq0QGSOr7v86hfU3TmVtRWWsDDIWXrrxaahaZUWyDPt3E/9p6W+M7sstQPfxH0L1/ty4UeNYUxdCIb9pYVD6J5mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(33656002)(8676002)(1076003)(86362001)(5660300002)(38350700002)(44832011)(38100700002)(8936002)(186003)(33716001)(26005)(316002)(110136005)(4326008)(6506007)(83380400001)(66946007)(508600001)(6666004)(66556008)(6512007)(66476007)(2906002)(52116002)(9686003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MoVR4hqxD5ja3qFtPuK1JSkqy2Y8y59mBpX+DKdeZmnTH4tZkdkeH2Fr1loA?=
 =?us-ascii?Q?LKQ4XvBC6yXHExcg++Qrlf+n1Rs+7SFxdkVpHGMZGHym4RWdjveknyivfgep?=
 =?us-ascii?Q?9b/FWFkHDICQsZmY2LQLNLQwOMvC9n+JQFLVLhlMBkZoKIvgxs99mLrtGJHO?=
 =?us-ascii?Q?+IrQSiQTXfJ/IFHp6suRxV/pOij+Ci6rO74HXSxSSC3GaAD5JsK5aOau+54m?=
 =?us-ascii?Q?HCgn/wMr9zqXosrF4rA8RGGnBak794UptlmbXdz/zgSkVH4gTu5m/195n1Nh?=
 =?us-ascii?Q?m58gxOexSWww8TL8RqKTbm7T6cNGiHy4FBAujtxdCKtC8TMsnuBm5zlIgEGy?=
 =?us-ascii?Q?0Vb4Kh0xkPfPnCMr2Fz059f8DrzyPsALmkGaanMKF72HnejPK7gZQuiKHpsf?=
 =?us-ascii?Q?yHqLCDiVIKWO/aIhr42mnWffDZ+krAaIOFCWJ0QO3A2GDEOr8Cbvuc2Uh0ul?=
 =?us-ascii?Q?IGILOqxPH6laq41nt51vvP25mHpMAC6LOxmr+8qndzYJh/AyySf85vC8Zj1y?=
 =?us-ascii?Q?VqDJlcexL2Mlp5CSlkqTAK/GLr/zCR/90KMRPbxO0gD/+c6MrBGVBKhogEVD?=
 =?us-ascii?Q?lMNwz87npKQggezrcScP4gSJ/lSAGa6XS1+x2PvWObCaZvEh4WClzDetuBw1?=
 =?us-ascii?Q?FkgtDzIQ+xs/4xRDhXqMTnLaiOSP1GAn5eFYB90w+I1Zj0O+MEdd877aXlrI?=
 =?us-ascii?Q?aOfhuxeF+SNMo4AheDcFTW90jkfogfimU1c6ZlAsxmPrNh4r6ZU6U3iiPd37?=
 =?us-ascii?Q?rd+pvAjencfLPNKfSWq23ycR5Zq7JL/gEFPn5Z1N9lGCfMMgNRjXU2HpNaEG?=
 =?us-ascii?Q?/V9GiWXJQZDL8Z/EBTDWH7nYTSYcy2Xndc3iro1wA+qbSRp8Obik+18nvpO2?=
 =?us-ascii?Q?TF+EL2NdRDYEuhJpadgFxnS8FwMfukvrkSm6hxnt2Cubv6eZm0hY1nnbtuX2?=
 =?us-ascii?Q?UKoQkoG3Or4c+3pr+6P5rdnzF0rYqRGM/tBxNh6U1pflgEbcyviMgVh1Q3H4?=
 =?us-ascii?Q?Y1sRl44xzF/CLsSdCeknEBkP7oMKc5zeKMK4j1XTidLE5bkqUtWnfSBvux38?=
 =?us-ascii?Q?uU3XsfE+0OJgpngf1wwHrJR5uJ/jIYyyu5imfbuM6NzCR5oZhyotkvQA5q8R?=
 =?us-ascii?Q?yMjJYcXOMI77HBZsD5pppD00rnsBUq/O9T5QuxGPc8f0iu7NHat0fMPNsWun?=
 =?us-ascii?Q?CPWqT9nUm9s46E31cBVFfV2TeYDO3Bl//WjmnGM3MZn25WxVht7HtxfIWm9s?=
 =?us-ascii?Q?inBejbgljYNVFR1IsTvtDKPiYjOuqQBqrH/n7AjQrhlGJeSwjPZ7miIRmNB0?=
 =?us-ascii?Q?3S90jFbFLb6sYEJ49vl1EhniLRnv7PwPLJs1r3MTz1JAHGxL3TTCESRDgl7g?=
 =?us-ascii?Q?vzSp/wZxFgfWcoEwW7GlzpEccEJS5LQk1rmFzHL1yeNxWWIv0+KDs4tKAvm9?=
 =?us-ascii?Q?OU0iusmOXmNzuz3RT5oK9KnaiYWs3vpHkbZwxJ3g2a9leryVfQzeJUd/s/k1?=
 =?us-ascii?Q?8xtM50Qi2yTwCgMRMtdLtvnXrTqK0g0OdOponz9zZbUnz90U4l+1cKCYOGyo?=
 =?us-ascii?Q?4n7rUTzcbBczoYShoXrzje8gnXno6YlCfBqYexv/n169R/cFF45n7mDM6ZBa?=
 =?us-ascii?Q?cd+kNcXgQgf5uR4MlcMkgdxYXcuEW/zhf/aZrn02YyQDhle+177uGvYIJv7e?=
 =?us-ascii?Q?Huz0GF3iE1KYNE6pERaOPMWPdR4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d08493-4fc1-4e85-89c9-08d9d4d391cf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 07:25:40.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm/OGNNWEAj4U9/EfqpkqTaQLsfyVYp8qwbxeyDCyBJ5osxGRR95bccir71iqiINelkGLfBgKQllwBaW0s/TfsC3NAF41M7Q3QtoWT86K/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1824
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110039
X-Proofpoint-GUID: 6mvwx1iuWnl_MikRIpv99T48Be8M02IP
X-Proofpoint-ORIG-GUID: 6mvwx1iuWnl_MikRIpv99T48Be8M02IP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The "pll_clck" variable is uninitialized.  The "ret" error code was
supposed to be printed instead.

Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and reset driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/visconti/pll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index a2398bc6c6e4..a484cb945d67 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -246,7 +246,6 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 {
 	struct clk_init_data init;
 	struct visconti_pll *pll;
-	struct clk *pll_clk;
 	struct clk_hw *pll_hw_clk;
 	size_t len;
 	int ret;
@@ -277,7 +276,7 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 	pll_hw_clk = &pll->hw;
 	ret = clk_hw_register(NULL, &pll->hw);
 	if (ret) {
-		pr_err("failed to register pll clock %s : %ld\n", name, PTR_ERR(pll_clk));
+		pr_err("failed to register pll clock %s : %d\n", name, ret);
 		kfree(pll);
 		pll_hw_clk = ERR_PTR(ret);
 	}
-- 
2.20.1

