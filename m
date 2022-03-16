Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C8FC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 08:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244552AbiCPIhJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 04:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237832AbiCPIhJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 04:37:09 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EC043EFC;
        Wed, 16 Mar 2022 01:35:55 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22G88uxt011457;
        Wed, 16 Mar 2022 08:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=CFBbPuKdxB90x1kSR5h9mbm8HsiC+dTBnrF5LD2xi0Y=;
 b=AXWcgHkJVaRamksntWPVbp6gptKvLXpzL/ZLkwClVwrARc+BU5bvDNh29KWNTofR/0b9
 306vQJVnubdvLheQUiLPaWd+IZ/N84OddwfjYKrzFihMoFC8knI6nVtTCfaWVgg7RtLX
 PQkp6Y+kCUfD2RZTLSK7il9ZqhHNOn66Ocqrb0AcwOV0rLG9kxR/CBlWID9djP82BNyo
 sCi694qv8+ANvLICIGSarzydri1WiuMLkR6lauVqyp4d7eZMwjqi89EdmyUDC8yhDq9q
 jantida7sMTAUwe1/uxd6SM6S7Qnw07q1YESq1zd6vSCGix01LMFQKonBArTlJyfqJwr nw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may be forged))
        by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6nfd2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Mar 2022 08:35:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22G8Uu61029472;
        Wed, 16 Mar 2022 08:35:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        by userp3030.oracle.com with ESMTP id 3et65pvgwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Mar 2022 08:35:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0e7rt9wdJXzCIf+6xh6t+RRXHWJJUlhRYVm2JRHIN4f5megda1iIQwwQ8g9H5OAKsy9GVtREQn+m7dM3GB5oUQD9RCwIluv97ufbypkUzNpAQkI7oWpE/2vouZXgzTTu3hAzmXr4SMZq0XehB/e47eYBR5ZhB4K5Umh/9ND7kgicr/3f1zwGIi+LGAFL3E74+WUFYC0KYo+E+3eIoRHiDHyNmXM6OELZjK8UTRH2HqcRY+VnyykjYaMI+LhI9IDCV1k4cvO7YmsqIrRFiUiW+RQ1Rl1cQr0Jq2TirREmR+akGXlYXpXcAf/aE/SU+zfVnP+xqp/nMb6GQDrwfGgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFBbPuKdxB90x1kSR5h9mbm8HsiC+dTBnrF5LD2xi0Y=;
 b=DTPn8pRKLKiYczFCDeHHMkFpu/a/nixcYcWa4raJKVErvgTwATnUsjnID7s+zJ5/WiDFCOIXAPU/MaKIdFd5KHmQFpQw3EE6/mGvrijDXiOp3pVxa6r45XFOMcb0r7jmxH3kUYkaY34evPoQGXgpDyJ6ZqiXACRS1tqUOk1jLP2DWJShAwCnBjMBmro/JTh2Oj3TfP2GW2FM94RiByEkXDjj0nMJTaDvrMvPU7ieHqhJmM9AIyUU3MEXNkKQU1umzyb/4QPzuNV9T4Lu0mKyH6dgVYLAGdzMdMJ68oUzStrS4p4LV9KU+CzCytB/kFL3lyTimOawjMYC4LFotmgoxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFBbPuKdxB90x1kSR5h9mbm8HsiC+dTBnrF5LD2xi0Y=;
 b=vUXBhYg/YK7c4lTFuUQswrcB6uAG7P8LYhgrSe4N9LEZDo3o+96JXOKYBOIS8snXeMiDt99NrlUZZoZqtXU7PjMNwmZUPr4gRp6CcAEHGP9ZZe1Jy34e0Nnl6gnkej1AL71Ivl+x1eGH96KfBNouW5esFPK6VIO3yUhoWqks0RU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4736.namprd10.prod.outlook.com
 (2603:10b6:a03:2d6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 08:35:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 08:35:45 +0000
Date:   Wed, 16 Mar 2022 11:35:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: visconti: prevent array overflow in
 visconti_clk_register_gates()
Message-ID: <20220316083533.GA30941@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0028.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4e11d81-dae3-444d-ff92-08da0727f67d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4736:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB473655033FC89940752985038E119@SJ0PR10MB4736.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvhuK9TsiWTHtvDxqn1Fm+UZawXKlH1bki9emG6007aHXpjcDW8wB5CH1oPdgoicPmHcIYDQILJOOegRvt+KiHR3330wSM8kNca/08DXWKE0KaUtQTOWzW85JabG6jjxBh2wG+QOBm7xtNS2fADguVbyx6z+lwkhr+T3wxh5Ct8ZOwHgQOn78Wzaa8JutPBVAzXkpOgeSW9DPJvIS5gMRo08Zzk7fKREQQkT+pXgIDr/b22/ZzDiUjB0Vdvmbax793yuklL6pc8rBXY8OjsmDETWE1c4I4E9FR9MOr+i9uI0i5C8Q3mHvBj5b7h0GpBgRzd630Q1Y8LjBAsungOaKXBKat6sKBC/cVHerElXO7h3lEn07CM9ar2tcUnEFWWzKCLFvMJafSZNTFxJ0ZTus1pqlOHul9uIW+gDE+3ER0s/PAAW0rg8TZUCQz5HoFIZ9GiPhp9+RDOKQXCTbJWy1mOQ3N7d2HOYIJKLDuwxlE5ijkT1Qe5jHii2EUjiWhYJKuW/o+oQ32j3z7MjEdrp4O6c5ITkujT0t99A6V/gUXfLD07pPflOtvUnzwCpTeHdNNp2zn/MIs2NMXCnrtaEtXTjs1w8gdRJyf5bBC34cDOD2ejk38BWJxgwJfXooGgb/cohg+RFrbP+c/UWqfVpvG5oZQyIcUPERxSlMej40RmD7t89LmfyMQ8vZTVlMfbBebd/ZTi+taVqSzxvql1O4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(110136005)(508600001)(6486002)(4326008)(38350700002)(38100700002)(33716001)(86362001)(5660300002)(8936002)(66556008)(66476007)(8676002)(316002)(66946007)(83380400001)(52116002)(6506007)(9686003)(6512007)(6666004)(186003)(26005)(1076003)(2906002)(33656002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nKXGbqUqUyHOr4heEOjShkOLdO4erD/6ZhfLSbE1JUIQrHEkttmMXEwBJR1?=
 =?us-ascii?Q?Nl9pOm6Ew1kjbea5S/mK78i0+ho1df8HrBcS1daBzWPXTuzIfq735wTcMi+L?=
 =?us-ascii?Q?k+Gx9bBnBpxD/U9b/6IiXrWRr9WX26q3L50VdnTykSxJxLiuFuKZMCcBPTNV?=
 =?us-ascii?Q?jgffvZaw2yr2htR4wHmH7klA3sAtwRrfaNhA0EdCbjyjLVeRAOUUVTvoOcy5?=
 =?us-ascii?Q?PV6gigZzWQx7f3fGC8FCIJkAa8ijmkfsZma3gJlX5eFlDHiiQRGGkeof+q3y?=
 =?us-ascii?Q?qSI+DrV7dflUTczv6T7oC0q9eA6Z3dZUCsIsu+5hBj7Rr2vL1qkIoIvrzJf4?=
 =?us-ascii?Q?kg6HKwuUDiINznuoUjs2N2vVGkollwL00J25VXgEPwHkUw8Hn+ZOPukfSanr?=
 =?us-ascii?Q?r4tR0GAbOSkpSPND9zwnyJwuqFZ1TGCCyYuvYKaRVCku88hAiVv4FdKEPqTV?=
 =?us-ascii?Q?iHxQkvv3jxxkSPEWpiYPQYhAXJftcSCLrDBcGGmaLJ/U6wKfY0eRTi06qRGw?=
 =?us-ascii?Q?iPlfCqVx08uXz+NzSIC1VZMhpDfyNQLPWcTl5PpePaeynkO7QvcqE9Dc3X+V?=
 =?us-ascii?Q?IyY0KBj5P3g1tXU9AGf21pbY4v6QLCjj5W2BgRix1v+fGoLfGv0xpG1vVqaD?=
 =?us-ascii?Q?5Ac/U5eiNK4/MS/uOI5z4z1enun+vdzRApf78qPNDpMN2QeluKiQffkBjiQp?=
 =?us-ascii?Q?c7Zz2TnmpL21IobP2Q5X/763PcFkPlQiiRaftn/hXE4ZL0SgsAu1cO2kRFYH?=
 =?us-ascii?Q?FprzKOVZUe0BagId6q7/KsyuDLlmgjR3Fxzqh2rVzFYSTupJiosk5kFQR8UV?=
 =?us-ascii?Q?YHF0fovlhJXNrpoYu4SzXlokDMPlgByczgn2kM0ynWlxrvt4Tm+nr/ZS/3qL?=
 =?us-ascii?Q?wixBITTV1JONsXSf0ZPJAdd3XmZBfW9rmlbxCpXfke+rGxV8xnmkR4HeqCeG?=
 =?us-ascii?Q?QbuhfTya8qY/71L6TUs5JHj3ACLv1V7faeRLHlJ+SZNKXgsBcdsvd59PhP/t?=
 =?us-ascii?Q?WjRYfExPN4Yj+aNPin0hO+WlK4klI+JcfUBwDiFotB8Pjl7aHLhXpMhnLq6r?=
 =?us-ascii?Q?/Ve+JE1BaNBRbNb1odEnsNJdOgymnUQylmS16wy9sIt9QsPYu4ZX4PpMDMjp?=
 =?us-ascii?Q?IkKzjfaGQWsSdDOdNUsp6Ex4LuRjJ0lyPHOk76nfE4c9lvRLVgY6KN2aA3k6?=
 =?us-ascii?Q?il6EOQrnPw9wPzTiIv1yGBZksu5N2qkgIUr+U3DejEJt8SXVwalJKUzpvvy/?=
 =?us-ascii?Q?aWTKBMXpmUZPOhaocPuf0Vp9Vv0DGSqshImWOQ04CcDHwHioWsXpoZM5wFs5?=
 =?us-ascii?Q?ukdxco9uukzp3DP0g7J5riLb00y7o1SiEdSdV35E8+vGvk/7tKXhrPPCBknn?=
 =?us-ascii?Q?LL8c/Y5l8ZXYYFYk929e+cNUEotCIhngCB21Q14luowntm2VxQVdA5g5w8yF?=
 =?us-ascii?Q?KthzCPvqQn5heb8gcZ+9/wD1LB6zx1mJyjonsexzOvDqjpXRxgLL1w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e11d81-dae3-444d-ff92-08da0727f67d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 08:35:45.0980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvmwmlGjWNjdAlS6wlFRBE89ItY5FFhVXxB4G4C1UZvSF/A4KKgMWXQjzaHMdFnLZp6n8ewZkVlWSWnMkrqERLV7Hn7/5TnQ9irf/dFrnL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4736
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10287 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160052
X-Proofpoint-GUID: xmP2QscQyUHCEF6l2b__IX71hj4bR3M7
X-Proofpoint-ORIG-GUID: xmP2QscQyUHCEF6l2b__IX71hj4bR3M7
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This code was using -1 to represent that there was no reset function.
Unfortunately, the -1 was stored in u8 so the if (clks[i].rs_id >= 0)
condition was always true.  This lead to an out of bounds access in
visconti_clk_register_gates().

Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and reset driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/visconti/clkc.h          | 3 +++
 drivers/clk/visconti/clkc-tmpv770x.c | 2 +-
 drivers/clk/visconti/clkc.c          | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/visconti/clkc.h b/drivers/clk/visconti/clkc.h
index 09ed82ff64e4..8756a1ec42ef 100644
--- a/drivers/clk/visconti/clkc.h
+++ b/drivers/clk/visconti/clkc.h
@@ -73,4 +73,7 @@ int visconti_clk_register_gates(struct visconti_clk_provider *data,
 				 int num_gate,
 				 const struct visconti_reset_data *reset,
 				 spinlock_t *lock);
+
+#define NO_RESET 0xFF
+
 #endif /* _VISCONTI_CLKC_H_ */
diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/clkc-tmpv770x.c
index c2b2f41a85a4..6c753b2cb558 100644
--- a/drivers/clk/visconti/clkc-tmpv770x.c
+++ b/drivers/clk/visconti/clkc-tmpv770x.c
@@ -176,7 +176,7 @@ static const struct visconti_clk_gate_table clk_gate_tables[] = {
 	{ TMPV770X_CLK_WRCK, "wrck",
 		clks_parent_data, ARRAY_SIZE(clks_parent_data),
 		0, 0x68, 0x168, 9, 32,
-		-1, }, /* No reset */
+		NO_RESET, },
 	{ TMPV770X_CLK_PICKMON, "pickmon",
 		clks_parent_data, ARRAY_SIZE(clks_parent_data),
 		0, 0x10, 0x110, 8, 4,
diff --git a/drivers/clk/visconti/clkc.c b/drivers/clk/visconti/clkc.c
index 56a8a4ffebca..d0b193b5d0b3 100644
--- a/drivers/clk/visconti/clkc.c
+++ b/drivers/clk/visconti/clkc.c
@@ -147,7 +147,7 @@ int visconti_clk_register_gates(struct visconti_clk_provider *ctx,
 		if (!dev_name)
 			return -ENOMEM;
 
-		if (clks[i].rs_id >= 0) {
+		if (clks[i].rs_id != NO_RESET) {
 			rson_offset = reset[clks[i].rs_id].rson_offset;
 			rsoff_offset = reset[clks[i].rs_id].rsoff_offset;
 			rs_idx = reset[clks[i].rs_id].rs_idx;
-- 
2.20.1

