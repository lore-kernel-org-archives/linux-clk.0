Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794231643;
	b=iHmBmjbQbJmuLLKtIJ6ERunszTN+UGQYM02Snk5GtlOj5Qf9IaL+t2fblkZKeWS0f2cq
	 o58uPklpKRFnRzNoQj3DfZF59emjMHh2QidgP5slYz3XJdVqWT3FeIM2PwPrnqzfpY7np
	 rWFrq8MQwrgmgQxv1ZzeRq/W6QIYELykCPB6m3MMgHHQL24inTeRo20k/vu0PnXF/xJDL
	 Kj67ssEd84g2VjJ5h/49xFNAXOjzqFLcmHFec6hI0/KJiPxBKEe/X5+WntTsa87TsPzL2
	 z1EcRWRgvNqYkfd3KplFtN+WHT7h+1di1kQA1WYW/6wc1VkQBYw700HLfqUPbkZBTdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231643;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
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
	b=ptGZh0huOcU3aGsQW+stS4tCNbfta08JfqvfFZls3Z3QqGHNidY9dLBaXW1D5lMANp98
	 QN1OZ0eWSiAeL/UdcChMOuzTj7Kbj7U6g16uBQhohPmT+vlWuIPhdFqiGcSx519QlIroV
	 +TbfaLIyVFiDX6f4knJZzpC59f6WYqqlfRZdToJWQJIXH59WMUQ+YxEt5GkLJ1vpabvu4
	 W5fxBbO+abAsYjBCrBFrINTuTjlSBdSKl6ynuiuyaM7stacCOkSkR2oAy9aXDafmPl2NF
	 uNNwOzml5CZdUCoV54eoNMYhw4/wMR812//ZNa4hsWX5YBRPUB3bZzzxKcmhfe7bszw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZbCkqb7t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.37
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624C3606A321;
	Mon,  9 Nov 2026 13:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 624C3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ZbCkqb7t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhWe19HcAzgESQhZynCX0ZueJpn/TLyXRhlzNf8oF8LjjRDSixvYiZsLeNCa4sx8TWDvPx8ViJKA2+MiXTrsXdnoET4pnLX7ELTjZEpwncmXeBfecLTLh0SKVDpjgZKKT6qSkB9sT5I2Sbyh6DRYZbsdMuFt2xrAGXlgXW2iogw+ivj+JnI17dvlsRkv0a83A77BcgAYik1ufpykhep0FVRfbUlRkgW661T9nMptfdk1GJxacoCK5aOUV6ex6E9LLc8wwlGlNvJ4XCCzcYYVIn5UL9/nOtqySkyM66Nnzjtj/Qc/9+DMDSBbJgFQCCeGveknaxttvKkXMMyv4UjfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn9NHdS/CTmoOGgHj55goULyo4+mxF6oHjiua5hxtq0=;
 b=I0imiUKe7BpJGqa94cHMCiCeGpyeXAVp41bqWVlH01IRXnnxPEYbIDPGilQ9aZYZczcxz2/zQYNO0iRwHrEriC6zKPFWC7QeIBMtpeDD0PG3LBilS11a40KDNOx4XabS6ZtjNIUxiM+GlLQpb1/fr6OIC/0Vd6nkUnGwCZGQugcalTIbstY0tYc2JURyr3dch0Vs7bYM104RYpGZ43OzMtffbo9kTkArj/J9XsEbG3fKWxWFrxpXLkfiL4k8qb7vcCEwxBFlf2J93nYD6oaCAuj5LcpuZvAmqoRfL3RhMtzwCOQ5liDvlkwas3l3Jnkm6WfonRxnwyA49GKV6vsizA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn9NHdS/CTmoOGgHj55goULyo4+mxF6oHjiua5hxtq0=;
 b=ZbCkqb7tsiQb0fb6dhKidp7YvPTq8Qzdej9n39T2WEUQWuqtCfD/yGBKvuaiOOpqBny9XxFHaKEOlNbSBQmpWFz7hOEn+w0LP0KTSauWU9kTFLNYmTeemG8ugQRAdBspa7cHRgozpaup30XkCT8QpBcsdFPA392oj7FmFpgC4lk0a6PwH54/p5mCplNBluYCMXCmHHDC5++muuF3tOGIxIAW0/dHKJ+qguPAuRon7KFE2Edxt6uQmoMYzqBz3Z6jhbAdIHUcMd9XXOnTVS9Xp+jm2HKGKTS6oh3eidtQrErjGsSOZft++uGQrzdWiretBGrCrB4WNgHFhG9tBq5tnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 13:40:39 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:39 +0000
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
Subject: [PATCH v3] clk: imx: pll14xx: Fix potential integer overflow
Date: Mon,  9 Nov 2026 15:40:32 +0200
Message-Id: <20261109134032.139050-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::11) To AM6PR04MB4472.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: c7499b1b-71ba-41e1-229b-08df3e670a8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|18002099003|11063799006|56012099006|10067099003|261026121527099003|261102123227099003|261022075727099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	p93w/amD+vfMBLIgw5vd8GAyjJdqtkWw/xZ050+gSm8eEj3l0M40bFJ64pfQdv4bmet/sivmxrDQlUa9+1V/cwTzg71zkSc5HBu4XLS5pfzM2G/NF22I6Ixi/n4qgSRMcfacz7LgCAgWXx3XPQGFFr9Zwm+OZg85PWD21Ur2B+WZpRvU8AAHRpbA3GfjWw+q0ORucjAn4vvlqElEQzMuhn3XMawX3x4TUk7II/mLOF9gZ2RvhQRTk/aDe9unTRN2oDANytUb3YzXdcqL2tuvNatb8ITJ9VbXNOXYbamo4H7KoMl18gbFTsbs1P6X3Ok3iDUx8iBEpvTDjNLwmGVTQtcN8+0NCthRfzc6CAfFXkSVlR3HwP4QgKUJKK/7fyZN9bm9q4dm0oCU3GTEfYMq7TlR+uBsMu/UQ0iUvZB24xxVK3Sf0O0nJr+iBY5zHshE6c1QtcyMsr+T7T0q8fUNkJvxp6mFRIMrdMWVtZwBLiMjmgHSPbIIAplWaqryakWUe2b4l+wDJcWU72jLXoCCX15qFg0prizO3iBjPgcnI8UPvfa3pbCr15N26lejaf6QTgvYumxeGY0EegrhZqOaUac6QnePw9LihJhjw47rsvSSQlK4UX1ImRA0m2Zkpt/hV3PhTA2PL4XTsunpFHnumddGfDaxpiPYJb0sQha0Cg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(18002099003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261102123227099003)(261022075727099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NDsvpyuWOaivuZMXU4xKkKUF6ACIxDD1/eweJ+1r42UhvEcKJ+i4UtJkAxAI?=
 =?us-ascii?Q?UYYiVLZQHzxxL1whFPap/4mFknREC+GiyG7MfZDHs8sGPMAE7EZNoBGZW/ly?=
 =?us-ascii?Q?jRsRSoL4dX+/Vd7UaCExurhQhSXUB7OS/n6fOoYsFEXYozdDpxQatP9eVSpe?=
 =?us-ascii?Q?h/rRXef7UHuPalfxtSZCk4jnSK2s6xX+0CGt7f/dgzp8m5DzgS0pV6MAr77+?=
 =?us-ascii?Q?xc3VmgJJ+bqYIOOUGl1cBIpXHgsoaDg8O4ddjRLBcwVmkorfd5fui6uG8c6r?=
 =?us-ascii?Q?1iLF58uNlPxKg3+eyW79lqQBsqgr6AwS6cHFtBBnX1Xh6HdWT73kCAnEgjxc?=
 =?us-ascii?Q?Yy0xlnq9fg+IAvSCZHCi57FUalxgysnVruQGwZmiFOgEVKnYOIlrb8QOUWX3?=
 =?us-ascii?Q?xJJh58fW7JRINgiEE5NVOSujk6pq8mOJOrue1D3sW4B+r1oR9BQG9Wa2pL/y?=
 =?us-ascii?Q?QG8pdpQbciYg+VoGkdSQKRPbjNvCgsNNh+hkdV7F6Dlr7eqLnLYKr8XixSJ+?=
 =?us-ascii?Q?akK4gvEoOgCH9sSDkhpTGrF/qEgd4HHeUDmi5z/LZK51iNhzzyNupO2KUV0x?=
 =?us-ascii?Q?ynrJIsQZHktxtBosAzWHzh5fKZiT5A2/OBTHvoDKYO237wMtJn+2dt06sTAq?=
 =?us-ascii?Q?gd9aLyQKG9saC2O7AuZ6YreOYysuTx9A7DhJiP5RyUk8UJsvhr8SyxSBOS2L?=
 =?us-ascii?Q?hKqvcRFOcorqUtSj06Ts/dUZY5kYlJg0T3GoVvh04gKpWQKFa9BV/2Hj2Nbu?=
 =?us-ascii?Q?OrWnNIqe9pXEQcqJNefehWGPfxgxJLlDdEa9465H9cR5bj2sr0Zyh6UOsnJq?=
 =?us-ascii?Q?BauhSBXBwoX3jFtiJHoKO7fn+PvmPF4WMInNs3oBQpEVdJhlvwcrpGOHZdCn?=
 =?us-ascii?Q?4ltnvBGjxmJ+XAbkaiEriJW9hTk/Si93Z0c+Uu3CGPuyVUgd0b7pcFAc5TMa?=
 =?us-ascii?Q?t9tCamEIur/9TXIKgUVoBuIeLOqWwKXBN5z0zR5yF5H38USbtHWuyit1HMC+?=
 =?us-ascii?Q?ofGP77NRoovw6bIpIaH40wl+++/bggWuITRSN1PQGRDULB9x0ehSWoxrkktX?=
 =?us-ascii?Q?Kjw46jW+7EZo6yUWt4SUGMeOMB0Zj+BGjSUuxfNr9MYsVjL8XH25FEPtB0SB?=
 =?us-ascii?Q?wXh/s4wxOr7NMeVyM1GtbfCZVWDfdjqTn4+Sga8fLbBy08ZKOfMI63tmtVGh?=
 =?us-ascii?Q?QIxkyx8mFvF/rZJ2i8vYvvi4if7Wf1y6W1pY7JOw7SvS/h46dOP0GhVR3ORO?=
 =?us-ascii?Q?gbVS1DMmy5X0CCrX1Eg41+GLR6vJZ4x3sNQVslkdIQzBJaY+cj1sxxgrkw67?=
 =?us-ascii?Q?1TAb9F5oO347z7Nsm4yZkFGE7OUVPiD/wPfbk2B4CSxtvYVT0e5ixYHYTw2H?=
 =?us-ascii?Q?8gNVLnM9wEuoVBTAomMPv2IemFq/0LIPgj29huGx91DBkIKeByWzNTVWfD/X?=
 =?us-ascii?Q?sCJQ5J3FhD+c2puHUSvBEweIyb4HC4n17Vx6C3nrDAwwW+ia7RCzUc2bHzo+?=
 =?us-ascii?Q?KNIcliss5KTXAGphcc6XByKr/+J5uVbTfM09l8DFpmd0j19BDx0G21zaWEjm?=
 =?us-ascii?Q?bMSv3RaBZlCUabCfwDj/iiMCn0gV/SVrHiSspF6M0J8mbhDppVsCV1XbTkCl?=
 =?us-ascii?Q?cNdLbjOdxyvCS0Uhk6TYvUaez83FYoO3d9u1P8d0rNYQtpupPs0hechjFfn9?=
 =?us-ascii?Q?EZx7lkPhwHGlI/8s7okUWJoeGURDKjkyb9nHYqUVSFYLXW4hZYcxfDVGaeg5?=
 =?us-ascii?Q?RQTRH9DGOA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7499b1b-71ba-41e1-229b-08df3e670a8a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:39.1301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zy560qHlBkhIpKR2siniFzjR2Qu9pWPvToJduJe/kIMN+JMFrDzpB5IkIfyBlG/Z/ztfKnmVGUu9oCvuXDFDhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

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

