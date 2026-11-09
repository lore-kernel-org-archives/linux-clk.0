Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794223914;
	b=4F7ClqtN/d4bEpI/nZaV3TkEJ0HSGqddWQnL2WCebhM9jWL1cG76Zu5OYBpeeYOFCpqo
	 C/ElmR73XkeFsVDxQqCpHTYRIpaPxUtftyliz+BTqqta+slYeHMk4hwx1374gfpCI1f5V
	 5yKA3B1c3QNKH4ej9nrZiXi0vdo7uSUMRO2Ph99rsUCz7udTLJu1r1O4c2zIeZ2KTblvj
	 Nu+VDifbZeMVkxE+NFrKQqTb9l3zYUHxcQh9iKjsyppOMqpxONmopwSvl7QX8fjNIYmCX
	 YXUo4qYg0feVCaFrFNR7K/8NEIBdmf8HQKu67FDVHoKn/bCBFpgWvhMtovnZVWTUdJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223914;
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
	bh=zx9nBsm3vl4/11ecHOgKP9fQmlf4UBxjC4vWblmEF3c=;
	b=2MIATptwqjy08rSDVLld9a4bUwjMasM0RXVeuqwlDMaUdJuOtBqmqD1ms0jMLTciLf7d
	 9S4WOt0ueX9S2zSBuGqMNFfU3N11fE2jfxIg+CkJg8QdCLmtwANALnjxztiNr9ZCDXcX5
	 FUTeRdleV6JHG3PYlkCYAy5OjjKXSmopQpEi728M7FjWBVqkUMwa9cehGlBMVZMlqG0aU
	 L4wSeSFdhzUO3F6dG/B9GUMGqAGty6EewSdYxiJ7nRqAyWpkiErF4yXDYt3Qny4rhbsN0
	 KAKxrYOPbjUr6S2fVRYs/FgpgDqrDsk9/K68C2NV0T9b2A/1+dDKBxWNtCWyPb/3Ebw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=W6CF4JLU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.30
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013030.outbound.protection.outlook.com [40.107.162.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFFC606A31C;
	Mon,  9 Nov 2026 11:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=W6CF4JLU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOn28d59FEE8AuFMQQChyGVkScSQKT9zD1um/6yrgy1He+04ZsYUQaU1lSpHrWiKH5OycnlGnvp+LJojKSAXu7S5qO057DV3Mf2Jp8El+V7FUa9eSgXbMk/TCUHpu09LtgRDayMBzf/F0DQWc6nPGeCJZak7Z94fFphIeBF0TPWFeamPOwVIpUM3+TZLJtr58DRb0dE8RQEoxmx5OCs94TodOPvV2rqbqXITwRuTIG2yz35xSV1sv8ZD9f3Q/alTuuVAGy1wWVmZxoDTsANO+8z9inyQCAM07izamHwfyRPJr49oEyo2dmUhbxfynELYy7zsYJXgLTgtIoedcqP55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zx9nBsm3vl4/11ecHOgKP9fQmlf4UBxjC4vWblmEF3c=;
 b=CeENtuu5uqfpGK93huCTc889EJKhiM6SNOWACNLKKn8mTzJFBE32OFKraLwN7hebfo1AMpnhvU7Pvfjth0WYyn64Y2zVN1kpodO9PxHY4MneEvfKWsiuPR/vF2CMqq8Yu2JaMuB3ruEmXu4P/zPXejTTzza5RnObNHkWosoglwpCEElPX0AC/tULClOIvA0mVr/MNirCE2T5LZ/ws4LjW7qacR4H1ajcCt3HE1MjPPKZUwSVWFm9S/n+fgx0o6eBiTevpQxib4YZpb5Z1P+kAU5HhedK02e42qtid+9aBogN+VA6N+3HuS+9PYDeIDJk6mckkZjKxJ637vLdaJE8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx9nBsm3vl4/11ecHOgKP9fQmlf4UBxjC4vWblmEF3c=;
 b=W6CF4JLUozIKddodkQKk1h4M39EMOu8nVEpvxEgzZnPRVxPwUrQT3jt3BIHiP/AjfwMy9inlLvvXJpxj3btQ0aLGzpuaXPAdkTewnmdKKSX2tARfziAXYEkziSQ29FgpEfkoq4FGbrT4Q5RrPKK1VvbOi/3p7FClZCGKHmLrseAgDPhP6AGr/4xbvwZp+i70seYfm/JfMIU2yPsYXT7I5tElzflVEGCwdJTK0v0sOGcwCNAXGaauzVgMHsteR1dmsqg847OOw8r96V5Z4U0xqzQqEqtOARlFDu0tcGjxZb5LUCakY3HQCU4dAImH5s2yFfpD3jtyYzGxZlFYSFamWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by DU0PR04MB9670.eurprd04.prod.outlook.com (2603:10a6:10:31e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:31:44 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 11:31:44 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	sboyd@kernel.org
Cc: bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Florin Pavelescu <florin.pavelescu@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH v2] clk: imx: pll14xx: Fix potential integer overflow
Date: Mon,  9 Nov 2026 13:31:38 +0200
Message-Id: <20261109113138.10845-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0416.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::19) To AM6PR04MB4472.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|DU0PR04MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c47ad66-aeb9-4432-a77e-08df3e550804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261026121527099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z9v5oBCYWLfYolDy6+0Z/vEz8mUNefJJwqNZuPTRalpbzyRt4PDKjU5nj+CLdm47ENvnGnG01K7LvXAX7jsuTS1eZxBT9dHr5vPTrQ5wGYqXszCTQWFzUli6JAIJ0R8lP3uLPnmwJkJC3HkpSeFk8wzxR/xZosy+P6PcValckN9W+Nz9nVW0ODQOCI/j5V+1XP/bvDXb23jIh/4iusuottZrvnX7j/VVDMoHfLDgVzrbi9Pq6OPq1hvAR3yQ4YHSM9n40XhIEBhV61VzmncEBBzW/Khf/mNswxbGILY/jgAzO3ry5rr4jDNv8z6aa0q867VRDvAdeVRE4RFlngyG3awmqRm0sSXd6f5uKGuXsOjBP0e41EjVQhpOxZtDa0aps2P0H/Ff+7+xbxoy6MsqL7Vwd97xFCbSITN/POOBD5ipBAA9e6zQWE1Wv2bRhFNytrMlMCiVBKIZyIGUcEIQBqdNEEe77DY6X6Ks4tfy1C9RAjcC7y9DWB4+LaOiccfwPXJHpBepCGPJVE82+eA8DbhfCbpB1JAZQ8yNFUtMsjqLAHYNgRe3CLdCOt9wuvITNRV9SsY5VNqdGgXGxRS9HOlHdEUzUfRH3ax2y+VT7VQ3sQdxRBvdOemOliEzX7BGbYdXxMkYJUdOROO5eRbVvRLaPsb59e2OEQKuMZN7wtk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026121527099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sTGefgqH1PCBH2+6V7b3RtSKIESHSpLVVzMEK/+LqZ/fWSVYY53epy0pF2VF?=
 =?us-ascii?Q?eblxmRLIuVz29+XE8EcRooTiKdy+KxcufLWTx6SZ14N+BvH3U1F6k/C4UMZn?=
 =?us-ascii?Q?8HZvAseYNvgYVeQ5gwoUs7lfObAFGk50kNNexXAjpP9YXIxcOAJZdkx1tWPb?=
 =?us-ascii?Q?JzXr0JeWO/YtfOH7YuwEOryGe7ptj47aLuxxgnuVmJ2b5wMkDHGe+/xtNUOj?=
 =?us-ascii?Q?blR8XlcL83sjTa8M1MBihnHkG0yrb45NtwnF5fgMmoB6M2wiiShBiXk0pMMN?=
 =?us-ascii?Q?F1vapBCn0lGdmL1lqrq23RYm8Khg5z3barV8z8TpaF1FS+Ulcb6tvaOiit5H?=
 =?us-ascii?Q?oi3Zg4Y/YZlaL0DsY4wZYDReSBNRaFeTzEIY64wgQNv5Jo8OxYZQ74Qw+ioZ?=
 =?us-ascii?Q?BmkyZVlLuW2ZzqySrZ+ctxPWsEkd6j0W+TPDIeFxdao18n4RndFNoZZn/7cP?=
 =?us-ascii?Q?xFgqHnzpdt3rmIniqTleuZapKSIva+ALr3uZaCHRN3WRiIFS5DbxJLGvKu+2?=
 =?us-ascii?Q?5eBOSIA353avL7fsNw0pGGNKeO1Kqin59XiEMfiJqhOusfsl/vfbO2WeAjr6?=
 =?us-ascii?Q?seCDuLCUX27ualRZd6w4kyOWnMdo5KrxzAsOu9yERv1KgANr6J0zd5X+PqB1?=
 =?us-ascii?Q?K6tQmWKzB4dfn0FmrvPuTfXWfQ+KXY8ofoE8Bvn7xI04/SkLvhDTMnwqBrJp?=
 =?us-ascii?Q?uZHl+470cWR1zYLPBuK1yZq5tBMk8lZG545Ordz1uGoVEoFoQMXHxpNgDex9?=
 =?us-ascii?Q?8gAHz0NNZ/E5o8cPjdpyeMeAvGhmbD2ifSCsl/LOaMKQ9TKDxY8LAbc3sxD/?=
 =?us-ascii?Q?5DWTvHYNjAZb1tB1TmdSP4KLI7WwVrvXgWbzAIt44ZGMBSQf22H+pzaGCCmy?=
 =?us-ascii?Q?Svy7Bd0TB+Ef6Ok0F5OPdKiaMJk4XYDLCTI8F081ekj1NIfuuYoT4bPx7q6K?=
 =?us-ascii?Q?Iqhj0lYlWh67O4BO5B34AO5Vc3F0WVfrrqkqdovs9GJ7oQsoVXhh3AqhmmOp?=
 =?us-ascii?Q?LWbI8Pmyjk9K/yAp+yYIgFgKYdOVtAWQXi4Mn1W5vVs9hd5y7xJKPuO/dRuq?=
 =?us-ascii?Q?R9iDRPxbAO/mNu7OWJQ6wMAlelKiF4eKQfpQ5nuJW4Z6kpEGobSlgoRPY0XR?=
 =?us-ascii?Q?77k87Ex4+csktebs6L0scawXSsKgy8s+6+B+GmcuxpZIU258o7cL4rGzFfmw?=
 =?us-ascii?Q?Unh0hdvX+yzIP50JZNbU9WDtdU+iZNB3OBCNn134zXCQAf8hCjf8pd8/tlAs?=
 =?us-ascii?Q?THijoy3F2VsNFU+X8JL7M+29yz9ghPFgjvcl13V2PdaO33gr/1+m8KZHbiSt?=
 =?us-ascii?Q?GfSWL+EdKkbxqQ1UijbWdkzbQnpJ3SPluNpHhFV9qh/D0B4QPvv0OrCVGXMa?=
 =?us-ascii?Q?yVyCGAUDC9OcyBf5Woi3hjQjvcC/oHlmaiH40JiwAOeQt0VlYbzhkOSjzqKr?=
 =?us-ascii?Q?bl7mC3NH47XDDVqpujcjxo/k2BBQHA8ttmD5SdT/Ttdd4/ex0jJeJ+A2i8Dm?=
 =?us-ascii?Q?JxoYwontI/OAkePpGV2pjJ9xfzgQjo4d/j5NI9TyE2xZwMWDuaIGzwPNHP73?=
 =?us-ascii?Q?AwijKTjGDQYb7AuP8V3w7ckljHBggdpHUhzAi1zAJ1gUk+FMdiHwLZJdLxUn?=
 =?us-ascii?Q?Hymsi9W7nJSnI8pNuPKXsP+P57YaY/6p8odO7oZrDQ1vxRpPHnFbS89SbHxg?=
 =?us-ascii?Q?u6/XZpoHAcH2fWpCu+9DCwYbQQXbYa69ElnK25x3Oad9iXocsDhSxJk/L5tE?=
 =?us-ascii?Q?7eFExUHZlg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c47ad66-aeb9-4432-a77e-08df3e550804
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 11:31:43.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkLQ1rIRtiXsqXB8I4H/GUcGeTdCFTIb2YVgHZ8XHCVIuf2C6hd65weYLPeekmwYPL0CcxBU4M6zs+EIUqN0oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9670

From: Florin Pavelescu <florin.pavelescu@nxp.com>

Cast to u64, so that multiplications and additions will be done
in 64-bit arithmetic and the possibility of integer overflow is eliminated.

Fixes: 53990cf9d5b48 ("clk: imx: pll14xx: consolidate rate calculation")
Signed-off-by: Florin Pavelescu <florin.pavelescu@nxp.com>
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
Changes in v2:
- Drop the redundant (u64) cast on kdiv, as suggested by Frank Li.
  Adding a 32-bit value to a u64 already promotes it to u64.

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

