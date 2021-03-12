Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9533C43142
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADE2664F71
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 18:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbhCLSR7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 13:17:59 -0500
Received: from mx0c-0054df01.pphosted.com ([67.231.159.91]:46159 "EHLO
        mx0c-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232627AbhCLSRv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 13:17:51 -0500
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CIBq93018951;
        Fri, 12 Mar 2021 13:17:46 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com (mail-qb1can01lp2058.outbound.protection.outlook.com [104.47.60.58])
        by mx0c-0054df01.pphosted.com with ESMTP id 376besa3kd-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 13:17:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIbqJCBdJiYMr0Ifce+mhepQNTPSRgjWsVCLAUwp4mwTcruAduuEpFlleGJMuZmV19rsrBN69hcLafVAH8z/xYM0K6PrhGVIZ8tkDsWoYNNqwW70DT8hFWqljglpThv5bCLEpIJc/1WoGGIQHTVd7HAirPB5kQjGien8FrvIEVOL0RSrKVvO/KN+Ejs+Z5F5c32bgmNVB1a15kc5AH5pegi+MsBQ+XJFpgpNwuaMs/qTvWypxQUykqPqgf0jRdYMdiTnXIOTT9V/GwOv6l7IN1EkFjVDIwNA9c8HI6a1IVuOFnf/WvJ68zKhh9km3GUVFfImrexY1dmeYIAnsVgVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blLvoNM8Ox52kNXwQqqZCFCIqhsWBEdzVRv5nHs+CB4=;
 b=I2wjsENzxTWVGKKjSClIBHFyIfgV8KqCsi1qYnf9mng/iJwunN0YUFrjwPxWz3NZFQI3vPIDlFum7qZfiMznreXs2y60zQQYkYVAVi6s81PkSYb/6aHXWTu3mOxhxRHNsAEmFxQbKg1cVpeu1+44czICkb5/QC9mVEHdI0Vv4VpHa+EkqoXSJxLPd3MEH5PqP1ALFDM/ePIWehmfo8wbDuOhMYfAR7ect8AoxMlNHmpsZdixP1Di6wH3b1XOm/taShbWGi8cTBZZKVlmeenPV/7YCbFcsAVMJc7X1nGuBPNBHLo0HM7o+HTkLYRdAkVCEcYeKNWaacmdvbORxJ7FRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blLvoNM8Ox52kNXwQqqZCFCIqhsWBEdzVRv5nHs+CB4=;
 b=wNMAnbc6M1p4MHkPAL4jVZTdsf4awIPWaUMoj8c7/JrmzVmojV++7P7MyEmPSREnW+O/8SnOTe5vH9EBwQUN5iPPjPUb+1ZrkvpVXb3I1RkdMvzGf5nR9EyjcLKldnmCEYyORWqAY1D9jcLfgey0Nz9k7q4JT08drBu/j2wT9Zw=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Fri, 12 Mar
 2021 18:17:45 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:17:45 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH v2 5/9] clk: si5341: Update initialization magic
Date:   Fri, 12 Mar 2021 12:17:06 -0600
Message-Id: <20210312181710.3998978-6-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312181710.3998978-1-robert.hancock@calian.com>
References: <20210312181710.3998978-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MW3PR05CA0012.namprd05.prod.outlook.com (2603:10b6:303:2b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Fri, 12 Mar 2021 18:17:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b058d807-974e-404f-dcc7-08d8e5832229
X-MS-TrafficTypeDiagnostic: YT1PR01MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YT1PR01MB443901E25C0BF340191884E3EC6F9@YT1PR01MB4439.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxjmVq+k+jc3MkjVqdHkB2xY4HAsNfdsx7jxE8su1GWRr0/e3irC1Z5I7NTQ5RSzUsVZTm1FKnH+yfw4z3qh0F6HCTX/yyW+dRq3IxTauaFlFH7LyV/tWSJzzNo3mIZJphQXKUjO+uuSWw/GflLuXsEitd2eoC0gzCdCNfjkUg9n732odM8zIWB+Dh6vzpJUaF8Tib/7Po6wmEmJdUY9DKmMpvRQ11tVDZRHp6AU2BpmWX7QTUWOaaNAgn55lzs8vzsOFDYha2PDztlW/MSIIpP5p5f+sPAdILDT0yuB18gQ5HLoIRdQHCdAEIHgehwwLd5f9HmjAbDCeeq2pwvKuRcyhIaLjCmBO0UeVZf2wBX4vxS0ifWKVENjbBXRG0+Icfh49OjTkgBIqHoJHZgRNJlgxybTJLyJrRaHS9cr40Napr0b3SHKq8Kefix5yndGMCmJilNeyf/DGENM+tlY7PXG2idyzjHrxMJPDITfL1WdVoQzQpxSEKpH5qqTSR1aRp2ZB4RSxMEFF4KJ9YC1wWZna9I5ZCBta3RZsv8lxchuBFyQj8r72ts+xQxXaJ+k91llUN31kYPA4gelIcgxeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(2616005)(8936002)(44832011)(8676002)(69590400012)(956004)(26005)(107886003)(16526019)(4326008)(36756003)(186003)(6486002)(2906002)(6666004)(83380400001)(86362001)(316002)(5660300002)(6506007)(478600001)(15650500001)(6512007)(66946007)(66556008)(66476007)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s7NvBR+mHbJM/zJkAI6uRTM7T1Wn0Y0/B/pgAgpsv29D01YzINqNugVfPbzx?=
 =?us-ascii?Q?uLCxtFZ4v3koQ3nhS7UKutOZDd3JPW2w09lLvO8OP7ocgBQXE9pYpOwC0NVZ?=
 =?us-ascii?Q?NAHeq56dlyHoZZnq2VmfqhRwloGAc2nfDgjeqwK+Q4iUt4A3TJDb0eIguLbd?=
 =?us-ascii?Q?Si2CzDEDx7iHcdWXTaoDuHn5HCofie/bioZQcZAlUc9iDgYmmqLP7+D7Cwqb?=
 =?us-ascii?Q?a5Bw+7rowG6je8bg6XHEyyZgThW9SU3namZDzeC37pIQyTVVILElqzIHoZfi?=
 =?us-ascii?Q?uyoL1L2M8+a/8S9VnylyAkuurYektM2r5NnEck4k+78yR5Z19D3FsTKhhBTm?=
 =?us-ascii?Q?ulUwTL0AcB0nnj0p1OrPYYhcHNTTlubE8CO6IvQ46nqENaalHQN+B9spmrT8?=
 =?us-ascii?Q?Os4vwA1AkjQIIphZX9S3paVTWQmrq6OpY5f2AeTOqJBxJiaSwzwzbCuktNT+?=
 =?us-ascii?Q?aiHebOc2/GIqXj55RQEHsGavosWuDsDn0+N9pviQ3u24GEYF2bbMYowDnG3a?=
 =?us-ascii?Q?A/9idcKrMG1rtM+TdALV+nm3B+wuHOY08p4EQue1AMT3RhmufnUvz/PpczHL?=
 =?us-ascii?Q?CbJ6bTAFQsRVwxqDEY4KSjF4nU24qNAaNKRaigqtQvHOn3I6OBQ6ixZP9wqj?=
 =?us-ascii?Q?/KJEa5uRinF0UyWgtf+8Uld68IKvW2q/Jle1Jemm/HDrIMUIzCBgcYj4r/bm?=
 =?us-ascii?Q?MedqJRT5Y7IoBVFhk+3PdXUw4stEZaG2iZoaKf/yWd7LjCtQ+0XccIHwpb+o?=
 =?us-ascii?Q?UVtRt81isiFdB6GOuvVRijoozPBSNuB27BOoPeoAOD0V84ID1MgXR/bykU8P?=
 =?us-ascii?Q?+nTlQYBf0AJT9mo7DBMc0enLVG8Bf7gKqnIdIGCcPR3CSz5vVPq2mPsDd9tO?=
 =?us-ascii?Q?V385ouocpJ6KkfPziNJfyoIfIehXo+3mwVAYweQH9fSYUip/ImdzFK52aCTl?=
 =?us-ascii?Q?bawRRYnzyXkdum0MgxeYZQTJhDrVcOuTl64pgRJbSUkCyDw9uGjS98MNQTsY?=
 =?us-ascii?Q?WCy0ABPjWhw34SPSOKVft+oabOY6kj+/uKkCBx/+eZ/gGeLoXKTI5xt7QUbW?=
 =?us-ascii?Q?Whz9v6HKBjSBuYJMaC5HQ7ol8JBzXJw7G068drX/exhLNpjtmO42ntGHGhah?=
 =?us-ascii?Q?phmUPXKaSqXdQvU424W2r856ZZohBJNhHLTZG433DlQvoh7ScDnP/MFoRmFW?=
 =?us-ascii?Q?AGIjgwvPzL4jA5mFIPrk8d0YainLjjajoG2VvGr2n307GFIV/eqCBd5qGGoE?=
 =?us-ascii?Q?6LLSdKpSqXvjaY/p41oX7Tix29l5DG0dntrbAF3WpJZz/zB7N06xsQqgVKyq?=
 =?us-ascii?Q?pk17DD+6etWx9scNudTK0XOC?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b058d807-974e-404f-dcc7-08d8e5832229
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:17:45.1279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz7YX+f47eYpRw3WthZYMqy2fkA2Il1mzuqeHoRYTJcxizqs5UVTCqNJ8/VhlmkaU0GLOEXZDBBvFl/PIEVD/EwTmC5tNH/hT2NrKdCxRhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB4439
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-12_09:2021-03-12,2021-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=883 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120134
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update the default register settings to include the VCO_RESET_CALCODE
settings (set by the SiLabs ClockBuilder software but not described in
the datasheet). Also update part of the initialization sequence to match
ClockBuilder and the datasheet.

Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/clk/clk-si5341.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index da40b90c2aa8..eb22f4fdbc6b 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -350,6 +350,8 @@ static const struct si5341_reg_default si5341_reg_defaults[] = {
 	{ 0x094A, 0x00 }, /* INx_TO_PFD_EN (disabled) */
 	{ 0x0A02, 0x00 }, /* Not in datasheet */
 	{ 0x0B44, 0x0F }, /* PDIV_ENB (datasheet does not mention what it is) */
+	{ 0x0B57, 0x10 }, /* VCO_RESET_CALCODE (not described in datasheet) */
+	{ 0x0B58, 0x05 }, /* VCO_RESET_CALCODE (not described in datasheet) */
 };
 
 /* Read and interpret a 44-bit followed by a 32-bit value in the regmap */
@@ -1104,7 +1106,7 @@ static const struct si5341_reg_default si5341_preamble[] = {
 	{ 0x0B25, 0x00 },
 	{ 0x0502, 0x01 },
 	{ 0x0505, 0x03 },
-	{ 0x0957, 0x1F },
+	{ 0x0957, 0x17 },
 	{ 0x0B4E, 0x1A },
 };
 
-- 
2.27.0

