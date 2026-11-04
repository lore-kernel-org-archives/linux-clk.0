Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792217;
	b=yEyat0bcVKQAxsb2XpTmfYqYt0vn81aDyhzTddO0ACSEYlNqdl00FkwnOSZCaE1MlVwP
	 diJhKKFkgSrTe2pGSD51kUQJCFjoDjuizBSuQzDKG7DwY+EME+BkQC5eEiCX3B+/44JlD
	 LvSj9e0DwyyySSXbl/Sk6xDNjy0ntI0fUcMvCmnQ7SSXCNqrCwka1wGUyzV4Vsew8bwkz
	 opc60LYtzjEWSvOFOtt8sXKLk4i7/VC0i/Hvulr2wX8wrz9YviG8hXXkHZBL8AFr/Dl92
	 neKe82tXcvRypgMWTs4AtRrJcEBeKjluwhTLKIAysY+802FsgSclvqKmk5EblLjoVNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792217;
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
	bh=PkVnBNhCxWat3fgMtj9fGj2ycNyYHkSh+M3pE/QYpKk=;
	b=s1ipIlH+f8wSzVtOpJbOV7ALYSzGicP0Jd3Gu0sV08h9S9aFFcEqfioXwDV7Us0fwjE2
	 DvUw3glCMR+S2APYQXlRRR92F+/pn1M0JlCcly4IFYUWJL/OOj3KWqSER5wX3iOlHVnN7
	 glImAziUc4UPpUhnUtYWni2KQ2BsjnEzxe99yVyuPfbzV3MRhiGdC1KGefBwn53KPhsFJ
	 SJhFzZio6aQDKMrRQxhEWukQNmoYbYa70qKHb03qiv2LFUHHJUkocDTsVmKFEE1jlS+/q
	 X72UOk8Z4O4nQjGOz0gHZjeH0qprtpqejk53UDIP9mCLeQX4+mnTDgt9xDqCud+xW/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rDoUTJIT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.55
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9E7606A326;
	Wed,  4 Nov 2026 11:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC9E7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rDoUTJIT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xn+Uy45UWPX8J4+VKcYRplDJcjsFBw2sihDhrssl5VOTzCWdxwlG8dBwFLLKGQideKsMvWGKRzzU4GShRsUumrmf3WRaBm9wm3HupnGKTPPAKu7u2qNTF2yh+YzhqFtB5W0Qg/CTa/vP9AcpRnt6/QrailVn+96jeiKPlxWPhpG2E/fLuLk1uR1QeLHVUuV8yVc0menkcfaMS4CaBTVf+4pOCcDOCK9AQVazYMByOD3U8HRavJmlar5j03YRjkY1KDR3aiYnG2KlSm5ybcSdpM69rMbzQbK3cQi4Bv/7FPH12xJaaJpge8fjxBxTs5e1N7GHDwDa5S3VJtTfKTDkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkVnBNhCxWat3fgMtj9fGj2ycNyYHkSh+M3pE/QYpKk=;
 b=qSPsJMks/gisF3j4c1K2kMdMpcxSexO15uYZDYrK+r8uG2cRkJkvsqAhelL7Gt0A64d55yOTgdvQQNXTrpkh8cNT2m/CbmehHKu1HmO/AyEojcuffU9fR4SdfJiZcAsV9jBy1vAP95LefKfks5iTLPgkjhSD60MZx8tAvOMRSIUOQc7dGmigjgDtVJSJvg2Aq1EcQHcQS+DR7y11xPuwkeRzkwxP7YUbuw1RVjIRUaMg7R6bjI0Vim6PMhxglqUqeyWMNwJBfIPgv35kSIWRy8LKMh/JQSiKzVs8D3JYWsyb5o58Bm55OA+b+AURd8Zp8XQDBGi/SVqNSG5A7wP0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkVnBNhCxWat3fgMtj9fGj2ycNyYHkSh+M3pE/QYpKk=;
 b=rDoUTJITEAX/327HjRbZZ2oCpDaJ2LaodD3m96BcEgSMwni3bFJNGYj3JugrzSqqAsW0YRjg2UFGS9xL29m6/QeO0kgxGdybSadvhV3mUOjJI+a4vpRJHrkunxNC+stDQPorUiS33u0E2vx7uXkZIiwHDGTrnDD7+zy0ajkIJ6E4XIt8IlDuiKFp2v1R2b6afyMW9mKxv5GTvtP3cBdh4DS+UkZwzaRcGS7AD1Zsk2AZPcGwZq0dFl3bn8nPvbWcWxmCAVdslVsDMOTgXhXNYojJ/RdbTCnptuGqatXk5PEuoiMPhD26h/xKk6fEBf2EPytgnTLKUKUq2Ch0br7H1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:36:49 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:36:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: tps68470: Convert to subsys_platform_driver()
Date: Wed,  4 Nov 2026 19:32:49 +0800
Message-ID: <20261104113249.1634063-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 780a965e-d6e4-4081-31cc-08df3a67d09f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|10067099003|18002099003|56012099006|11063799006|261009223027099003|261022075727099003|261021123027099003|261009221727099003|261009220027099003|261009221227099003|261009223327099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	mU3afk9KC4ZtH6Yz3nv0K1Pnle7jZsWxFINzCk6A3JB3/ZdxvUR4kMoDelyQdZbpcv5qQOkgPZdhfdZwnt2FIKy+adf1aWamhdRwTj1nu0eK0zxR53AEzLUa+L3hEenidMJXBmWUnysvNcfLJMX6LGhx1IO1ZGDqz+/l47PzkZk9jZRDCnOaAb874rc0Vp5Mgxr2uRBKIEIYaQEg+Hjx0d0FRe1j163yYh1ZdNMOekcgFXsvbcsQrNoe76DAFdQaV3DJqx3HgxTEWwIAve49zfM7J1UVPPLBmb+6CMUvjPuMRiYHUupdOid2/h5mzlexYUYN8imrm0K5f8vDhVRdEl9f52w2RXW156+zJ4L2jUOLxubPHamNSQXDsFI0cRadQ3j239IvmZPN0MmAYIueQoPHWkzinY0Ban7pqVuHOlzospcg463dQZoW59d7Tgxnyaq6mJaKmtZT9WPDNiPCo3LswSo6NWjksAK73OiveNg33WPntZ932JdUAh2Fpr6e1oSDhCqOAcLfXefYUIOwNyu/nPhtAa3G0o3HZ2S8esDgzsgSOqEapGb/d9UzNrJCq2OvWpamD9hmdDBIvLhfiW/ArH/VRa2LVgg2CrieJKYqLX2rZnCezuvXm5VBQKfoqLAbRPwswBUVwP/EpLg04sdtp3aNJQZ+YXlLiDRFuYU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021123027099003)(261009221727099003)(261009220027099003)(261009221227099003)(261009223327099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vVg0DdL2fFV2dwUket+ZIfKnmXIgXYG+2RwhCnJWFQYL4JXRYmSjrkyoItJj?=
 =?us-ascii?Q?BQISw91zWEFqz4fEyG7aJfPCBRgjZVDKsEchPOeRb15rVRnqDH/+txz4qbiC?=
 =?us-ascii?Q?COoBjpSCCSc+DQjqQZaUONWSKJ2gtL274KBwvuGkvm7AoTQi0EEZndF6ulAq?=
 =?us-ascii?Q?xBS1Ry4OAPFaftpIShdohjIun5CxLrdClIIbM7mTJ7LK9w1wUCVTen3NbyKG?=
 =?us-ascii?Q?Nj8WM0aGYIf8GGwD49c5kqtkVLg1L35sii1DBCqloiT1IiCLP/Mx419wWxOw?=
 =?us-ascii?Q?5bTtxzZwoKfwhWUg2eBI0Mun7bgsUYQND4qhTqD2JDQv0hCXitd1sj2Gj50+?=
 =?us-ascii?Q?IZyWYsABfLX6dkhGfeUIe1AStVuMzcHq8kLpXeUCz+LXEhkTy5v0aPr9nLO+?=
 =?us-ascii?Q?yRxNi+Yy8Wn4qksxaa7M6hx7xqdAzi1yfuPpxgmlS4vrs4vlLXH3RNYq9n1X?=
 =?us-ascii?Q?lfH7lKEL928KVx79WGtlOIgrvNd+SaLgzUrTgVO9IcWI1hHWFP9o56m7pDXB?=
 =?us-ascii?Q?eExFum5C3aDuTjyCltegbKYeXw1BbwxG3iinYTH3n1/QiCVipS1EGONqvhKL?=
 =?us-ascii?Q?dUBT2rdaydPswM5xb/M82f3/zyj+HsnR/05sG2/x8uUX1g2CB1u0mJgJ8WC1?=
 =?us-ascii?Q?sjlFz9xezft9wlzaFlfkogvymU/hGY9dKByf2NTWe8Ngy85vv6/ncWrs42jm?=
 =?us-ascii?Q?oo+X6rjplx39PJ4u79NSOp4RGMsk0nUOvjRYOyEz1lZ6F3qz2iUTzpgXaHlM?=
 =?us-ascii?Q?6IrXTDaai5549fwisqjH36WOGJ8aZjWv9J7BJeOuTe09lIDQLT8z5i6jchbz?=
 =?us-ascii?Q?N+tRfZWRmiNAK56fdRKWHSOa2WVG30+eAwg3EmCzHehrWNnchEx/ku+T6CjF?=
 =?us-ascii?Q?KeDykkwB1JGIsC7NjK/r2uqbP5flMLs4mVHoaRjDG3SCukdy0v6efrE159Sg?=
 =?us-ascii?Q?A5gsIV7e+Lr6PfKO87ltpFqWDspScN2mtecMgOGlBl5HgH0XMQnLFUkjUaBO?=
 =?us-ascii?Q?vAXvU3zGb+MDDutdF7Sv5KUCI8vOQWzbSztMfTYN0gdAdK1uYphPduz2g3Ly?=
 =?us-ascii?Q?ekQASBppfp56dSSok5ZUEXnMGyBpKCMr4e1VSSrGDP3d+4gvmqV+nnh/eSO+?=
 =?us-ascii?Q?f7Y8xGPBho2uRk0DZyQDERWtyLovz2fRk3V70cIV/hcUHr5ReXOIBtN9JFd8?=
 =?us-ascii?Q?HogDj5Zt+gIVCuV+ewA0rJLLrOPCf8X83uI02ReD/zLqAlkFqyYqgvZP4BtC?=
 =?us-ascii?Q?7pjfkQUs4zTfyQEvNJtWqoAMPHtEroLs4pmivrlSllKSAbcw3/NrVXTuuQa4?=
 =?us-ascii?Q?WVE+pAyZ+Tb5h9IoGwgJJbWt7Yf4WtTbnA+9UfBQwieD40dTKFw4ZixvDEVt?=
 =?us-ascii?Q?LOMtIzZ9hlXbkwWybutJw67rJNTTZqChacaoKDDy+HC/RqtTnxdfBvRnoQ0X?=
 =?us-ascii?Q?y6jmtpMDQ+yp0r4Bk57i2BfPDrqZcYRqdsZLGk9/mE7aVVt/yjFI4lcq18pu?=
 =?us-ascii?Q?E9ESjyOMZ5//a+TLhMY8psBb6bibI7apiy+2hrGoWMP/CrHE+kiF8Dbmyidc?=
 =?us-ascii?Q?E2vdxvzdfVVi8vWeUL/yt1cmvAaP7OwXcsmGR1JHotcvhcOvvQzndrn/MgpG?=
 =?us-ascii?Q?7FMrXPcbSYWS2yS2PYcZVNNOQE6xdHfrpDRR0Nt8IS7sMGXAce0oBemFviTF?=
 =?us-ascii?Q?+KWnIgtToxqIFeret22W3LNyaO8hmeGWv4Zsq8zelAHqqkTJ8X6/kB9Q7RFK?=
 =?us-ascii?Q?m5Itft7tlbnn9Pe/gZEHwR5uF8qABCdbd/3XixkSDw715dPd/t0k?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780a965e-d6e4-4081-31cc-08df3a67d09f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:36:06.8745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSO2K4R5Cl7t85Fo8CGVbNuB1Oze5y6Cvs7nuqCYCOqBMTXQyPdXR1LqTGsaust172JPqHxQtBsbJDZkOj4pfMFQcCglXyiA57/C9+EkIYSKlILP4Eq5bAhM7j5d6kVA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

From: Peng Fan <peng.fan@nxp.com>

Replace the open-coded subsys_initcall()/module_exit() platform driver
registration with subsys_platform_driver().

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-tps68470.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/clk/clk-tps68470.c b/drivers/clk/clk-tps68470.c
index 9511248c6bc9..bbf0da63fbf8 100644
--- a/drivers/clk/clk-tps68470.c
+++ b/drivers/clk/clk-tps68470.c
@@ -251,17 +251,7 @@ static struct platform_driver tps68470_clk_driver = {
  * registering before the drivers for the camera-sensors which use them bind.
  * subsys_initcall() ensures this when the drivers are builtin.
  */
-static int __init tps68470_clk_init(void)
-{
-	return platform_driver_register(&tps68470_clk_driver);
-}
-subsys_initcall(tps68470_clk_init);
-
-static void __exit tps68470_clk_exit(void)
-{
-	platform_driver_unregister(&tps68470_clk_driver);
-}
-module_exit(tps68470_clk_exit);
+subsys_platform_driver(tps68470_clk_driver);
 
 MODULE_ALIAS("platform:tps68470-clk");
 MODULE_DESCRIPTION("clock driver for TPS68470 pmic");
-- 
2.51.0

