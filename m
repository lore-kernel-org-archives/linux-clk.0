Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526928;
	b=bmM58TWFdZeVQuIqbX+pcuPfobHrsx+1gDREvS5SipVUcyWNnE6V+aF3A/gvIFxLdilg
	 gOPc4izVNE9yLenj3ZXi39HAp9q7xjvuEU/DSVe5EAXLfobKxYND2FGWAVzmTMVh3P59n
	 GhSpxF4soyyNpkiMAuaQEnGswWdvGE2QLYn2lxJHZY/ZWzPXJsknlxROA6P1mrnCKdp+N
	 uPpdXVR3LL8935JfUi2g6tLlJlk95ZPHAMJv4FHNTNKB1b3CgkGwDoI4ZbNCwriU9IVLj
	 Xsajm+e1Qb+kJyt9Cas9RCbIN/8kHwKRN/bPcwNGe70pimujaDxmjNRWXwve6Ul6k4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526928;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bn9NHdS/CTmoOGgHj55goULyo4+mxF6oHjiua5hxtq0=;
	b=hjYarGPA0noRvHUUrxJATZz10U741YGXR468ZK5OLR5A45AmkPlCDgo/SCE6Zj2thl+t
	 r6Inxc2u20falRfRQgH3+J4OwUKGdInyne02GYh7duSil0IJVkR5YpZ4sEeYv60XHVtjQ
	 lhdhXRIgnZRcXf5p40bsEuAFO/pjEIRZjnC31F5++vMEyeaAKxOYOA6SGOCOiMr/va7Mx
	 gTlLBVbcqNxb/x5DdN/Y4ud3yu7Ag3YvogsA89AUsiRvJOoEC5awT3EeS2pJ/Sqef7ARa
	 MDMZOKmFtHBMbkRLi1g/ZhytcHJ3NTqUK4vBB1qdyOoP18B9/jfMETG66pGWSEukRrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b="n/D+kN1k";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.37
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F20B606A31E;
	Tue, 24 Nov 2026 13:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F20B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=n/D+kN1k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeT7TgE9NQqRPGSFJChgr+vSzC9mCZW6dNN284uSTx0zc1Eiu53uHYKtoXel14uIBAvOtcHStfqV7yw1yyrzp4zSptHCSm0b6DBLjECXEuHKVJncTGLt2E2jdE6jkOfusR+ST4PnHgDPdjl23/xNyp1zv0ttAFWJVnCUq3yXqO5B0XUaafyxSjtO76ZkrEiT/gfSQSvDjl+6qGUtdwB1ouRAiBuJXHIeACgay4QN2yW8tlJotA4aANEyw9bZp7SQwUixdC9+iWwwH0jsK/tm05iBcGPzzp/xv9b71IABkSlf6dBY0W3sgmdYXwwrvzkQu0Smk0VNibtT1n9rdKuW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn9NHdS/CTmoOGgHj55goULyo4+mxF6oHjiua5hxtq0=;
 b=GTJr1ajSUpooZ50nqEDrs7AQDq1WCnyl+ypXWexXkz0Rkp/ti13egRfsc7XgnOryyoKUhMUZ2CGqd2E73p2gfr9FARP+HCRgA5ESzFUQTzOwEMpUb3uBNYLrdZit+cluBMDtVubmISG/We/h1Yl/q21fbnfltd059uqKJvb80QNJ3O5sVWQb9q9ZS8Sd8pe8cgteBlJwtwAhOUlXCtSVK9b3uh8ThD0pd0R9c3UHTKbbWCxuRSIGHUMzFxH238m1/QMLlquRwvDpcZlstpGhhjp02MKwYvLCG0GJ3YVfOa+OS0PaLgL3Z73l8/HO2Odsd09GFgAHk9Y8/+/9vRVhxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn9NHdS/CTmoOGgHj55goULyo4+mxF6oHjiua5hxtq0=;
 b=n/D+kN1kLLDn2qg8bOmxBFcmrd/muzxNHjUwbfLojQem6veNwG5S226CKz15CyDBdRS/L0+I8KG/CzU1/7XKzlo1pcm0HKRtvGM0ZEkQ5Y/6iixCYL4z06nofSyeIyDHpS4Qpm6EYaDdobe3bHDxs3Q+7Cc9wXSCjXciDifwoXkKYIetaVqrMM2v75lUxA3YK5W1N3po64vNaWCZ6wx1I0eZoHNYkwxBLeTxdEV9vkT9xyv+/rWzcX05fHiAEaOyoJLb5cKdHKbz4RqyGDqBvlG9ndPsJFa+C88VBOUl38NUGIkr/a/2h79arqnEJPG6Ntpg1dzF+UPtpNjBoS8CKw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by GVXPR04MB10588.eurprd04.prod.outlook.com (2603:10a6:150:21a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 13:28:41 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0639.010; Tue, 24 Nov 2026
 13:28:39 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	daniel.baluta@nxp.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Florin Pavelescu <florin.pavelescu@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [RESEND PATCH v3] clk: imx: pll14xx: Fix potential integer overflow
Date: Tue, 24 Nov 2026 15:28:31 +0200
Message-ID: <20261124132831.698017-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0039.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::16) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|GVXPR04MB10588:EE_
X-MS-Office365-Filtering-Correlation-Id: 689206d5-4dea-40e3-20dd-08df4a2ed9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|1800799024|376014|19092799006|10067099003|11063799006|56012099006|261026121527099003|261021121427099003|261022075727099003|261021123027099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VnF0XDpZZJ9VUAPHoalgvXbAfSUJw8g8FXBbjMmmrPIAaX4RmfVHDQqQDd/nLqqDDiVDy+MxGTbqIqG+I5Fmt82tajucubS4gexKgFE7/ZdYtjpVITB9+fyDRLstn1QHrbcWkdcg/+PJ8eFqZOrP6yXU0nOhPSLMqeFEt4mqdmURBnkgCskpVY1TtBXbsawKEc5bjIaBhYaDvFKm2snZEOlfU5QzUxzNzESST0FsOGN34MF98vwHX+65kF7BRAHnx2ojDSiB3uFK6B8o0/oIYkK6ub7K3V/AlMsgvzQHGXZnOf4dXqG1peLECWqWCtzO4ce6NcvjP+4zD8wxwGx7vzQ3WULQAu3TW1C2d77ZiSb9IJgbXFUwYonhp/0x+4D8Q1DltUA/xFnGMGOK48KSJqlIh5LpgltJCiNtBN8ZpPc6JZcU7Fi+3deZ9I0nGcywnTLYRU+y1iEV6UMNTTFL4kbcipgW0wU+Svz+fK0mKAztRmK8o1XRhTZ+XiGQ79KhTb+SbI6IrdTy76eYT39D6yVkM9tUnzTKgey8octQ+QxuUlX1zc4+xQjSGGjZ6TyxbD94DgAJdw6s2xk61eQxyXvK2ZUzIb24LB3k16MyW5S1NzdT/AvrzJKq5/duOq1XXXYvmCSaXR2AtmXXc60HwFFDwSV8Kn1iNyZkmxux6nA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(1800799024)(376014)(19092799006)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iujww9Ix/a4w5bpMxYGYAshQLjTuTkZcnknK+b7o+rMXEj4F9EMt7d3wbwVL?=
 =?us-ascii?Q?yqb3YgDMafzaNS6QiiTTAaDqwElvrSBz0yIhljzw/TtL2vZcZf+AXuoFt3Iq?=
 =?us-ascii?Q?BygIAeIMnJn4VKFTuCjQAFjjrxXAHR5wfZH+/yTxx6OT7pTMPZiRS3Kicf/w?=
 =?us-ascii?Q?CBAdrpEPESrZJWJ4poq6u0dLZNH2NKBv1lkgxzW4MLG4hE3tVKwOZgB4zoOJ?=
 =?us-ascii?Q?9uRAZUfrV/U7nTC4UQY1TR99YlVxvBOqmlojnkhalh8KiW9QnhxnfsIzwgHx?=
 =?us-ascii?Q?MMu47VlfFCXXWPGaOeJAsPTufXfpcLWDRihcrwC55n0TaWemKD8q2HV2Q9QX?=
 =?us-ascii?Q?HncbS0voQ+BFdiYfz8feAERycrWlOhYCQOmlF8D5hFcog0pdbOqBuLBXVFla?=
 =?us-ascii?Q?+9diFS1QYUKbj4P6+RIaysMxvFT0RKpMaE62Rmjf8lRU4mYjsa8v2mwMP4X9?=
 =?us-ascii?Q?k4FBilrSMNte18PTMy3Bbg+Cx2mIfo0Sw0oYdyeScdtYgX75KmPYGNUoSG/4?=
 =?us-ascii?Q?/Q1BJK145ez0eyyBu/eBs0Y2BKP2xLhMOMVFIUGtI22YW3KoxNUt063FDkIQ?=
 =?us-ascii?Q?0wEllOo0Yswb4CwL26JcJrdY6muCYJXRPeV86PJ5aAsijVecNx37gra7lFBq?=
 =?us-ascii?Q?sqsIHAlwzESO2nI6qMsISnicp7eV36JbH783wO3ZM037Zo9dDQv22Ni6A7Wf?=
 =?us-ascii?Q?lLRZNv0+Tj24cPpL1UgXPmwBYwCBsHDtCQrP8zqKZxwBY2ZLsEE2bqM5A1+j?=
 =?us-ascii?Q?/FhfTAkgDH+zXkCVwh03+zFGjiR64Ouk5FyRwGcNaoZbJxEfwgfii6brJeS/?=
 =?us-ascii?Q?Z/hihsbN0J7xCO401QVOYENJ5hZRvbq3YYSKERN0saCWQe7nWbMuvII3h6/j?=
 =?us-ascii?Q?FReS54nNHAH7cu1K4rUqcoVcl2uEfB/kwkDwO+gq1xy4ls1SwK8NR2nzXHKj?=
 =?us-ascii?Q?WAdGjlV3W2EJ8PW0jmmxzSgFrZqXj/o/JvtWRsEXou0RPGmtVUcuU+ngUDCs?=
 =?us-ascii?Q?cbFXYqF9IhugckAq2GbZpv+OWakLZAwXp5y2vI5GclT/mwm8Be9icMl7EbQC?=
 =?us-ascii?Q?t7vSy80f6vHpsCX7RCohEB6ZP7Zq9F83kZ4xvadjVwGkE248XkcYQ2zr65/7?=
 =?us-ascii?Q?tEvebpQR/FSf0goruu9UytBfiA65t5TqcAB0Fl3JeJpq/ZKDBrorhHVgg5Va?=
 =?us-ascii?Q?1mVIIDzSEAMEWLlEcGzK75Gw61+Dci04TOh1xetPOXCSDVoISpw8s1ARIKyV?=
 =?us-ascii?Q?fnxtOFPGSnxVtQMc4kcl0l5khz1fim93LLHKE5vFM4rrdd8YTfJQdq3WI3kh?=
 =?us-ascii?Q?8BstErZdv4CPrw4zP6rNRjf5SekBeHgNMg8oW4JGzie6dZUeHoFoQcIDCrld?=
 =?us-ascii?Q?1jt+cXbilgF4WOGcsI3bqmo4jnyZH8hC7k2Zleta+maaQS69kMVNZ72ycIyv?=
 =?us-ascii?Q?2TsMzAoxv2WXN35bDvtpRA51jcwdv+rth5KiSgNvj2ebOhqshvR2S4GXM2zF?=
 =?us-ascii?Q?4qEu9XmhTeUBswuvdeNpE1X2yKI4u+Cze2VF3ZGcluzQDIJbxdr127hBu7Rg?=
 =?us-ascii?Q?38l+QQtFY4CIt1Vr7zY/53ojfXh/IBkch69ytIa6hiYFZrBmiH0I+2K0PHxj?=
 =?us-ascii?Q?I2x3Rszu2cz1ZAVBjuZyIGlthNv4aCEhAD+VugYkkVMuhWkgp1Jd2orbch5Y?=
 =?us-ascii?Q?zkZ74j74Qtbi6hc3TqoiEeB0fSUb4yhDqjPG+6ygllR30E8t4pxuSGYcDFbY?=
 =?us-ascii?Q?W0dLihgCGA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689206d5-4dea-40e3-20dd-08df4a2ed9ef
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:28:39.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6r2/7D0AIzIP+Tx9rCujMBCjty8IxucZux5Ms78xkjMKtoesWzv+pBZg3RdGPIMIoBnbLB1iwSy3NgMp+rnDWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10588

From: Florin Pavelescu <florin.pavelescu@nxp.com>

Cast to u64, so that multiplications and additions will be done
in 64-bit arithmetic and the possibility of integer overflow is eliminated.

To silence the Coverity warning.

Signed-off-by: Florin Pavelescu <florin.pavelescu@nxp.com>
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
Changes in v2:
- Drop the redundant (u64) cast on kdiv, as suggested by Frank Li.
  Adding a 32-bit value to a u64 already promotes it to u64.
Changes in v3:
- Drop the Fixes tag

 drivers/clk/imx/clk-pll14xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index c6438144e507..ee9a9e4c392a 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -124,7 +124,7 @@ static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
 	u64 fout = prate;
 
 	/* fout = (m * 65536 + k) * Fin / (p * 65536) / (1 << sdiv) */
-	fout *= (mdiv * 65536 + kdiv);
+	fout *= ((u64)mdiv * 65536 + kdiv);
 	pdiv *= 65536;
 
 	do_div(fout, pdiv << sdiv);
-- 
2.34.1

