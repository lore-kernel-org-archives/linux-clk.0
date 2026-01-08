Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023114.outbound.protection.outlook.com [52.101.72.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098B6319614;
	Thu,  8 Jan 2026 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767897130; cv=fail; b=OXYfPL3j2f36zFs6VpE2/qkWyRM97StEb7GEH/YOcSSStzXlALei9cQm7nUdU1DcAPPEEOe8C4B/eGsT1woo8Kos2t8KCxMGc/NQ9f1O8sR+OiVWzB7sjVnCnWsDKTOFwAYKkbnqSaJdMgXXvMM8FrtXvWDvtgr5uzorFCFyMzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767897130; c=relaxed/simple;
	bh=v8hbFO/gtZ2kEjnjOi85wb3eQ7rAzdzzKHMdg9enjIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZFKyIAj0ww7EwI6LoPp9BO6OglY1Y1sHu0TR9rdpqcw96WB//51VmuxXEIfd0Le5pZoIwtkUPd8VadBDXebokGkVkOySm86MGAvsbKVZvWLEHqvlmd+TB5AKsQYDNEJ1R0z1yVcju+uW2YCKQoQQ20dUqDC4wB6fcPsdrkqHrCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=njbwdsj3; arc=fail smtp.client-ip=52.101.72.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="njbwdsj3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgN51Uz8llSbB7dKT/mIdkfHQbYgdvHztZ6x+7RyI2EVImSRhVs/98Q5rdoYr9FIoqL67HIelpLu7XCH4y7k1GRWtYQe1Ft7IUVQJO84/NKL7QHdXYbxpui/G0f74+s051Q3O+NH1fal0MBesTbh4b3xNGDDp7HaBfaHmp+qdvEN7mnjdE2OafNKoIK5V+VEGDdOrF+HwiRVbDgdesZ5/p2pHPxER/+y7QTO+DiOf8jZ032mersJVCva7FkLTRIb4+WxKfSCm0ZFtIcZuqGa9cdighsTKJzLTOF2Kg/cs2qdx2zs0/6fGnbKSP+JS4nD2J/cWx533gDPBhEWgLf/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qp8WuzlSdbOGkALUXZ9Vm6k5rw5dr4Mlc9VqUIqSYUc=;
 b=jjb6oJh7IVISkWUzNarpPNUsrgEtMiyMXP8ggxbXHywXAxB8Zz3+KKMr999/bArKGdvemLMbK4gRrqvUegTbREANWXgTasEwUA4gT9Bs/cUtn6vMPSvRcG9As9HM9TdghKdJobRVd/e5X0xMlXfGDcrPQnGVy3K/yGnQESZrOLMQLmro7P1BgIWlY5CEnNjNnHQBTnO1ZxLFTot48HazoCi5LH5PYcXgT/FwFLk211OG2mbCvZuVnovNSxZpKoU7TCM+ZEcOYz6F3TMVCAUPBgwqj+MkjpI3xqiu26HfOq9lFIzgOr0NReyJgj+w2kjN5v4ykWX0JtBjtU6iTb8maA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp8WuzlSdbOGkALUXZ9Vm6k5rw5dr4Mlc9VqUIqSYUc=;
 b=njbwdsj33yOVjWhBeyi/x+EMsRIWmAu5gvMBhe9j+HVOFrXubNqNlS2olxa5GoepyzQPa3bb+2GTeIAXeK58KOoSHjeKrJ8XXn7riqeqbZ3K7/Z5fXTjBOOEFhlvk6xvJrq1v2D0Bh7y5m05DaFO1kNQeHijLv/aZwfOSDpwp2xrjB9EdpeZfhBa0C9e7LQXVZr1cY1wp8R6+jl8l3pUfBmX/ll3cs+Yv6VZvtXo8cFzUlGRPtS21RQi3cANe8kMYggTWfgweVOkQqQKCLmFYco46Qdfy9pHFJj24YhOctNUp1nNEnbEBQwl2tjVVxHw8zB00kOQ3UXv2Oy2lqAI1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by DB4PR08MB8126.eurprd08.prod.outlook.com (2603:10a6:10:383::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 18:32:03 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 18:32:03 +0000
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
To: b.larsson@gmx.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>
Subject: [PATCH 1/2] dt-bindings: clock: add IDs for EN7581
Date: Thu,  8 Jan 2026 19:31:53 +0100
Message-ID: <20260108183154.681958-2-benjamin.larsson@genexis.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108183154.681958-1-benjamin.larsson@genexis.eu>
References: <20260108183154.681958-1-benjamin.larsson@genexis.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00014AED.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::31c) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|DB4PR08MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 692f310b-6dbf-4e6b-6738-08de4ee43756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7elgKxRr35H6mSFS//3lPK9VxST4dSGBMkLBcMd2LoymoybvXmhXIKOijLIH?=
 =?us-ascii?Q?rO8LNqqD7FYMw/YXRHSTMY5awK8IyrdyIBVWHXMpQP6xx09nfyOpctMmC1sL?=
 =?us-ascii?Q?3lxqzovRa/MOy0ulJc4KorHCXKit13f2aPFW7iwKSJ4KZwKPclAyXleZ7pT1?=
 =?us-ascii?Q?uh03B4lDnu5gwRTQOsvucUxRlobble5zUuvw730VfWcO1UfeZKz26lHQQ6TX?=
 =?us-ascii?Q?CyUviibh+g8bCC7cxKq99kdqiThFNrxANwqcjraCK04M57lpTo/YX0Gk+EIm?=
 =?us-ascii?Q?euctRCRJOLCliE6igXpyyBOyAaKSca6iSSWTgZUUOLAZtPptEe+uhPSZmLke?=
 =?us-ascii?Q?zBdheonJxI7XtgvOtav/QXB6AotidosStDzhmaLy4TUcL+Fickd6HOMctore?=
 =?us-ascii?Q?rpilhbtFWybOc2rhp7l0p5wA1L2kmsJ8EVlZRvPBR/yv1C4qYSa5N9JtZ0RC?=
 =?us-ascii?Q?S3B5N1n0jv8h/3t9rkGsMP6NIKo7cDoz71Y9KL7mbXLemwnegcCg5phtlxN3?=
 =?us-ascii?Q?aRGFxR7j5fB3LFD4T+C7nDMGvmWlJBbakhaG7ioe2RfV9wrsSG00LgnK9zDV?=
 =?us-ascii?Q?83Nf/5a6eptwYRRRtOqHf7GCPYoJDYmIXizwgJNHIk6gK/Jlkf8fUN+YCKhz?=
 =?us-ascii?Q?WQQ4r+RvfdFA5AQBswJe9p2SXIX1luN6PBORNT7IeiqopDyYyIOqPFIv0I76?=
 =?us-ascii?Q?xVg4qowR4BXZWa7RRbU6hZjPlj9kkCTGevLu7eQeSLRdH36GSNclc8Q6W2k0?=
 =?us-ascii?Q?IDM7t3tHfwW58sKXN9xeU3ExN5Fco3ce9Pte99pPLxEiGX41nxWqFkF4LPef?=
 =?us-ascii?Q?YRypsU1ZQVDONwmfs/XAC9sUXufp5Lpek3vCHiDa5vA9SpQxPJiuN9mtNxSF?=
 =?us-ascii?Q?1vYFk/MkgTB4OvS/lxHL/1RVWRXMK9hVlbOGXQuwHtWhX7NrrYRzjbpAueOu?=
 =?us-ascii?Q?4eSjCeWqBSFw64H1drMgihlV+1zDHDb5ftHum1BEz3IKfHrJFjysEgHYffhY?=
 =?us-ascii?Q?vVSZpYJmbsewLJImKZlZzYlNXQ+sr+0O7PwjFMbAllFqylKTJert9Vl/tNCv?=
 =?us-ascii?Q?9JTHANlMEmL3AhKA5bZLRuU26Bo27QuYoXXYGY0+omNyaszSQmig8JpMmvnR?=
 =?us-ascii?Q?vBaen1BtnoFjbJrOcJF5Kuw3yYVuRlC11il9zw1sExoE9SDJg/twsiN+3IpE?=
 =?us-ascii?Q?/U8NnVJ220FUaKrfSoMZAA5lnLjhcI9wxIx/x8ddiLadoAQofmlLVm5zmRiQ?=
 =?us-ascii?Q?+xy7JmfA1TCOHg2yy8+5CM0gSOoH7zwx/Tcr/Qpv991sm4kPk10SvRTo9uDx?=
 =?us-ascii?Q?dipFMl2x+c3oAFj/5cVWf7OlNJA1KXI6mK9niCgxkVrSFPD7r2uwdKykg4a9?=
 =?us-ascii?Q?RNoqooQhr5b/IRUsWWUUfGm9/oEkhHv71OOmg6oJOoSv0T2EEDd817hV77pF?=
 =?us-ascii?Q?3CzA81iTbFymW5dAbRj10yts+O7OHGL2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WjUC/6BY04BAcmMw2CHy3HgdnHfpsK1Dsy/3C+OlIamxyneOZ97gWufg5y7S?=
 =?us-ascii?Q?0mOGPD+9Bxh/2HZznOTW3MuaByhiaQdJak/xPRpzFviM8G2nhchYwOStXiXe?=
 =?us-ascii?Q?E7mp6Gr4Rw2RpNP8P/Ypm9AngarnQN9Hc85Jh3Icvp+k1xR2X3RuunDuLSO3?=
 =?us-ascii?Q?tPLxx/5AWwIyN6w16mvuMTLjQLNikJAfwTZ+c9RfCcSYZCe++LERgNFAhq9e?=
 =?us-ascii?Q?hjVHoP6jnrSQ4l9TgoYIeq/54EybKSsrAqvc/Go80aClPhuDWWPBY30ANMyf?=
 =?us-ascii?Q?gqtLxl/etWaCE2PQlSonUHCzDyRzbWciG9iBfaSzn3+lUiFwaradpx4HD1wP?=
 =?us-ascii?Q?wTUVBGPyB8Q99AX6p3vHsdZgK65CO8p5udw/bJ39iIXAXXO1JSHev0SdRv8r?=
 =?us-ascii?Q?le6xowbxOJBvWwdpITNhQx8+A9oMauxqgSozzYj4ZNf5YBg0wxnlooUOCY9V?=
 =?us-ascii?Q?7TWQ4umtPw8iGwMx6Uu4bhLBtSZAU6ALvMhHuEX6wxh9gPoScM1yGsZoaixU?=
 =?us-ascii?Q?9qHY5gwFZ03+An3gKGpALbm6tuHeT+brhKcR5HtMo/I+KDzWEl1ROAs3ZkPS?=
 =?us-ascii?Q?qxgXDXysqaPLWsD5sOnZ9aYss93wT0ZK8Xt3Z2+7JnlNtkICwJlCD+ikkMgo?=
 =?us-ascii?Q?wJdpvnF4JbXWinyX7saDOHuQo0v04t7vPRWt24TsQivl49QgCSJN8ppCExIs?=
 =?us-ascii?Q?VvV8pekl3L5Kidp15/caXf/LeFNGZloeyGUZjN3+2hYcfyj8S1dBuoME0pf7?=
 =?us-ascii?Q?wjZ2+UCnGBYqJTKF0X5r8jMLpGy283D9uTR4j3nj6FcuoedKJF+RR3tYE5gr?=
 =?us-ascii?Q?vsJjHmsORE8P2kWiAcSE/dnvvfLuyCNbqnDZPyt5aSMh8ecOdi+p2mwiv9+h?=
 =?us-ascii?Q?gHIujA8QPgfxEqbTKi7smp1zOkSMPmxhr0CggRXQ4K3JJC7yyCpxiGIVk+d+?=
 =?us-ascii?Q?75T1C8ENwrrSMcyjAlKReve/o3/eIER61QZZEIyC777khVKKJlutXsiW6S+O?=
 =?us-ascii?Q?nI6BdUFeK2TY0KarTWqARrxPehjjGP55utfsbcdhNLbhpPk51NJVhirldgIT?=
 =?us-ascii?Q?ZtD/KVfjN+x4Gi5Ck1cbh+nBouMN2SzC6wGkVNUnfImfHz9LN8V4/bztiTMh?=
 =?us-ascii?Q?HkMZq5dopaQRI+jzrhzWmzHwt3IFnceSC04ObktyMbsVKzKUq8M9tDym0yYc?=
 =?us-ascii?Q?LhkxiO31znDbY+n/f4nO+cj3Ssm1d6FvM0gin8ddlIWmsAwhwiDiYbLP+3LI?=
 =?us-ascii?Q?RgomYiQurTPz2FTr3pL47S4SIdDI5TFldEeXI8zMhciBssZb8Kj8l2RZ3aki?=
 =?us-ascii?Q?dTtAF25YHiUbNBmqiClgX48SSpSquHFR79OSoeqvLfiRn57QvthLQxrIN96V?=
 =?us-ascii?Q?svIhoPVxpjz+vxjKWXROPgMYgT42x8DNXhhzdg3NOzwRX79HKqICjsIcz6Fm?=
 =?us-ascii?Q?65eDKkiOs7RENhLojdsrodiVg/78tBtHo6jJp0xrT2IekaBuBFN4eJgNt7vd?=
 =?us-ascii?Q?XcTEE+of4QAx9BkzKgqm9rJHi88CpomelR4t0vWyby2+6gqirlLx+7udsZow?=
 =?us-ascii?Q?cD2vnTXNO34vfLICF6OG/7G0H3viNiwBFZFC1vuZ8aD1TlgwBj1KSitX5wdP?=
 =?us-ascii?Q?mikjMgqRXr3Dlu1c+L6Si97of/kO7EUT2B3xVEaLnQSfD2HfI5pRN/HiFhQf?=
 =?us-ascii?Q?Rff602kA24tBJB7g/hS6DtJujpKOOZehcbFLJfHN8BR72zLzecLhjwcfthP4?=
 =?us-ascii?Q?Hry9HMekdcMzNz90NrMmcRjhW5z7c3TtVnvuNP8aMuGc7ZjhrprJr140evhi?=
X-MS-Exchange-AntiSpam-MessageData-1: hr7RMZUL4Y9cST0B5CYrUttno4LA5PbWCvY=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 692f310b-6dbf-4e6b-6738-08de4ee43756
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:32:02.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aStfaHxxFdKyePCnyCZ50pFw2bhhkI5VrXiv3gtmscu4IHHYugEiwnVO1bmzVBllOGIiydDkn6uAAy3t+xxC2Etwp67WNZ11bb7rNZgUmJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8126

Add ID for tod_soe, tod_gen, efuse, aes_xpon and fe.

Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
---
 include/dt-bindings/clock/en7523-clk.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index edfa64045f52..dee2490b6242 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -13,5 +13,10 @@
 #define EN7523_CLK_PCIE		7
 
 #define EN7581_CLK_EMMC		8
+#define EN7581_CLK_TOD_SOE	9
+#define EN7581_CLK_TOD_GEN	10
+#define EN7581_CLK_EFUSE	11
+#define EN7581_CLK_AES_XPON	12
+#define EN7581_CLK_FE		13
 
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
-- 
2.51.0

