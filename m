Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FDFC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 07:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbiB1HvV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 02:51:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbiB1HvU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 02:51:20 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EC466F87;
        Sun, 27 Feb 2022 23:50:42 -0800 (PST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S6Jl0j029559;
        Mon, 28 Feb 2022 07:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=yMS6WRUsrqCohbW2Jv6+P+KC6yM8k9TfrzfFcsw9VwE=;
 b=GWbn6Dv8SyKfrW5wbK7qwh3vJVp6Rq+3ixw4DpxmmyX/udLPNTq+JhbJHqGVBTn84SSr
 gdzmkp5XoLUqh+0iYa9qMB8J9/gXh1jC6fv8S79oUjon0B5rCfkbFQAE2qgg9yVD1OMf
 9d3ZCsUIg5BHbZTu5BlI9oLr7KK4I21FgWnxhECWeuHEGKVApQm1FgSQ1sgSY/vIhlT4
 qP3NpWOMpdcLcA8dRdrtG78GLfh2Ku+tNK6W1k0GdryKUa/VReeAy+VQG2Gl7/n6hLl7
 tmVs9HAqttIf7tglP7tOZ+qzwMN95mMkQh6afVcG0PPn3Gay1fsZtHB+RiRgWOBWmYRQ Yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3efbttbbtt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Feb 2022 07:50:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21S7kiX6151260;
        Mon, 28 Feb 2022 07:50:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
        by aserp3020.oracle.com with ESMTP id 3efc12mrrh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Feb 2022 07:50:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmqeFgnUUKVwiNJoofOC22A95DbRuzyyttDkOcH5XeLl7GVbJh5jvsi65jIzSatJl4lXOJl9ER0L0Z3yKTuq1bqrt0R5HRfSb4dLkwwFZXxL6aUr/y3oTzRtWggHhlau9WsNtcD8U6NZwO5CNGuSkevIFZXEEgGgIhNYizO5kVBuUCs+2Oh1+sgfewHYvsvxhsM9WyvqoRsnvI8F186mgJhbQcOgVmEU0eyoKM+ATeSzc/uKkZ+xX4443GzeRRB9NQQQgZM3uP1a1dJFUrMjqpLYMpYhDvTHO0+Pt/x4fe7PTmiY7wo8G6ne3Zd+ABbSLzqy3+G4Dp4QB25+TEYM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMS6WRUsrqCohbW2Jv6+P+KC6yM8k9TfrzfFcsw9VwE=;
 b=EwCeT52F0gtjbWdGEdtoZWNyw2TfAyv/J7LFoxNmXzWbN+p8f2f4GSCBuYuV5Pe+nTHOEsGYeYe5Pl8VGSN/4E/lZY6aefAk8oWE3rCS9oAjlyiSaw9iwQ/++x7bCc7fn5ey4mkHnSKCq3IlMzIZV12SZKF50fhkAnNQRVRJmuBmBR3BrVjMH0qTlLZTXLNVceyG2zlD81KNcWLcSmA+FQ3LHgjN6qJYUJfYZdBMzUGnVYvwhFM5IWnQvyTjMOz07KGz4WofSR+2smQM95gtmJHmmnRCKQ+IcTBoupFPKSS+ibln8Nl773Xe2fNv2D4nCyLfOci/pl9DQ7OVZY6W7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMS6WRUsrqCohbW2Jv6+P+KC6yM8k9TfrzfFcsw9VwE=;
 b=VLISxWvMIzU7FpytyotomOdYE0wXquashj8I/xKSqYHOoHHeIRnIHFF7OIc0qWiuZ9oHE8CFwwQKlfO2klo7e6c18SmqJaX9aN/7dSHUq4IP1BgOx5PjJLU8zQrVUBRD/tHNUnY5sqKNwI6gyL9o5XfyX6KgogtDTklGalyly4c=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2429.namprd10.prod.outlook.com
 (2603:10b6:805:50::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 07:50:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 07:50:27 +0000
Date:   Mon, 28 Feb 2022 10:50:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: imx: off by one in imx_lpcg_parse_clks_from_dt()
Message-ID: <20220228075014.GD13685@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0125.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2e61081-7179-42f3-1540-08d9fa8efc36
X-MS-TrafficTypeDiagnostic: SN6PR10MB2429:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB2429A2347C227FEECDEA6D488E019@SN6PR10MB2429.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7ad7Ss3kPGJHQRfwg1yyxSohV7oNvX5dEKH/x6Nh4zMz6OXAQB07vj6JTKMN2PH+3/Z/bQfdLoKlUlvmj4CEPKEvbKZwT8R3GVN3c5sgecTiTmGvc8QMDLwSRS4ppogmgQUlfVKXPKAWNKvJUEQ+D4VZvdJ5xYvy15l4FqTpbKAbN3mfQOQ4pHm2FzkyezGeBzQ3kehx9GhYQUL3pAPB14xmIZRmlBqBx0snKbJ4SY7xXICNYxeegafVuU1FwuiFkSwur/3YXACU9OYrlA355jyW4CFcGkJIsdFWnvvsffs7kZaS6p+HXWIkdypZ8WonlQmS1xS+ew3S/mBXvZsCubUoYy0dQFuDIdFy3XJ44dDlqCDUA0/FN3L5BTfl5ivm+gDKp7NMMGPd4zv8C96MIZMncN+SuN9FlanNorj/WhAb6GU9Uaq3TJr1cPnqdNkaL7JLh2gZKAsjvKEJKQ96Yst6MQJCsV9iaIOgi+7Seq6rGarvxiObr0+/FGBtkosj+PZ31bryqWhkoiGK5lJOx3kBwZ13Dfm6vCf62/2AK5GhUEFNdDUqZ+WugrzOcoP2+QalB6gAftGc5HG/zhRzKNTTG60kXbAYGgAAAUgRD7f0O6PaGAmqwya73ByPu8AndpEoV1qz47/ESVujK+u14onsxeVQD2oJ7qs62QZYMEIwWCXF30uleLwQ3lYNlFdrO9g6SWq6ZAZdZ9DTo4zyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(44832011)(186003)(66946007)(66556008)(66476007)(4326008)(83380400001)(8676002)(110136005)(6506007)(1076003)(33716001)(6666004)(26005)(316002)(52116002)(54906003)(9686003)(6512007)(33656002)(6486002)(8936002)(508600001)(4744005)(38100700002)(38350700002)(5660300002)(7416002)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xaw/BOz3RrEtXgejpAc9fRaISeVH15t0FvFr2zdmbalwydnWovFznknaQcGn?=
 =?us-ascii?Q?nxvMVrfUcepA7ywkV5Rng7hmNlSmECnLYfesH0bC+PBuo/a+kBxXWB+bwNTJ?=
 =?us-ascii?Q?NJBDyKeeM6mx477ZQFUAf+uRvIrRovL4AlV64ZXz3CXLFW9V340NFPhx0aVj?=
 =?us-ascii?Q?FYcjWqsLgVj8nktjIEKCdrnLiqfVXQv8LLF/nai8eig2pV0xJABvEzn2yEhU?=
 =?us-ascii?Q?MWIwqTvNokeAJHTZEEl73uJ9sSE/GrU8dRGtsBJoeXjvY7sHhgXnvjFn56Og?=
 =?us-ascii?Q?UAk6O5sBTi4ObwT6ZeLR/bSK8i3GalAkRQwPi35qqfCNO6DqMYHjjq8sOBBJ?=
 =?us-ascii?Q?P4lxp7HCIk2NC+xDaBwyIuijnwY1pD7slq+hjkZi+g246LxpY50pPbjK/U+X?=
 =?us-ascii?Q?907gmOlpWJlK00CdiVEYvgYbx8F84NaeEV75U8LhRb5FyJ8juIBYYrbllGA8?=
 =?us-ascii?Q?sxM0I9RHHgCQCAsJNLXnJW0TQHGg5RBy7v5zvp0yD1WoeDFcx2/1z58vbyEy?=
 =?us-ascii?Q?rJPtjoOXTgn64Mc0qZLD6XzQx0cclV0syoYCNMWMbPMFbHs/EmEv/HKxAZMS?=
 =?us-ascii?Q?Y8nhmqRxNU0/iM9wn6rbUwdbvFAEo0Z5WtKx1PCpaROCGgS3ZMVMRIGRJOFU?=
 =?us-ascii?Q?kVfkdFbHbeSDa/LfVnBnZt1q6zQC44qJJrAQTJ2dX4oac6Kx7xt8Z3p9HIPS?=
 =?us-ascii?Q?G0agGUJGpUp/Y6sOCGe8pTIxM66exXLRS3qQ2akdTDl4dYmRDEIjywqhNW59?=
 =?us-ascii?Q?F80IIw2B5PNgVX3miTN45QSgeQsH/BTOTONn4PZ0mU4FTLNZoPZP7C7iXIOA?=
 =?us-ascii?Q?3wpSaEcg8uQqG2PI4ycmcEWYC52sjCwIzixqaO2WbbDKoix2Pfebh8fLWojd?=
 =?us-ascii?Q?/Q03rHCQsCzxMChP1wMKngZdq2daHximXmu3Ndm4m9PovcQ8i82XqUf7UFua?=
 =?us-ascii?Q?ixDar60Pv0NU1rD9qvhwspNrcHG7serxNxnUFSZdsaWPLTah7Kuf87Q4kcLa?=
 =?us-ascii?Q?2tFmU1L1ttrVhPaZ/gTq65ILUUsxyeZmRB9YZKMOHAn0gThe6MIOPMZHOhAc?=
 =?us-ascii?Q?mc5U8VTMa2rgaGcG5RqGrYhPmh+YLmdhUJATiDBLD/9indGLreWQlqpFb7jO?=
 =?us-ascii?Q?KSwaDlwdijXrAWGPFKJysHMqmfu5BOmAHk2YPd9mR2rhxbTa/u5DsLIDbK8N?=
 =?us-ascii?Q?y5O7EPZsWpWBx9c8+5obG27+p8UzqRfNR+2ko/8eRevtaeIDLfgXybR7N0/+?=
 =?us-ascii?Q?C+1BIdZ5/HOj0OZ2LJPT7qWmbsV/P8c4xwdFFdiHxFkTTPbJO2YTxdz/bRLi?=
 =?us-ascii?Q?uWUHPtGNkfXruRjkix5J3L7pGpYmank0hjhuNtqfDwpZjRWF9NH1r2eAua0j?=
 =?us-ascii?Q?rujNh6k9P7zMj0er6A+P0wvyJ3tGH3rx2lv9gmG0ShG+QOVM1a5rI9IKTr29?=
 =?us-ascii?Q?no4AF7Z4CsVmSRV/fyYDlyhMeht5XFRNwQ2KI3eEl6UCC6YQaZCcU/MG0Jxz?=
 =?us-ascii?Q?TDqexdZOEkscCoSMzaxeO26RkHXiwZ9S6uGPANb5WOrTr/9GL41cjn5EU/EV?=
 =?us-ascii?Q?NlwRyyrelYdj+QqUG2q6wrcUQqGlo7lYOadvHYzabefYllYl8zYItVd+egLg?=
 =?us-ascii?Q?awDkw46p04Iy2oHEjqfGMEynDo35xOC7rDPhAUYZRKUGXiPFl1d/7/eUvc1p?=
 =?us-ascii?Q?gsGcLw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e61081-7179-42f3-1540-08d9fa8efc36
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 07:50:27.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBTx9rX92AkVukUbSGBWC/lv7J//e3OAMH8BYByfGvoEbw/qbQDdkvP32KMUuXF6RP95s0bYT1LUvQ9nrGRMZYN2cGNjDvKgKZGB7e9YTac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2429
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10271 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280044
X-Proofpoint-GUID: RtK6hj3V4iqLwtoiGLKWx56jtgXTjeVt
X-Proofpoint-ORIG-GUID: RtK6hj3V4iqLwtoiGLKWx56jtgXTjeVt
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The > needs to be >= to prevent an off by one access.

Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index b23758083ce5..5e31a6a24b3a 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -248,7 +248,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 
 	for (i = 0; i < count; i++) {
 		idx = bit_offset[i] / 4;
-		if (idx > IMX_LPCG_MAX_CLKS) {
+		if (idx >= IMX_LPCG_MAX_CLKS) {
 			dev_warn(&pdev->dev, "invalid bit offset of clock %d\n",
 				 i);
 			ret = -EINVAL;
-- 
2.20.1

