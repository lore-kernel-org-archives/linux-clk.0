Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63C326927;
	Fri,  7 Aug 2026 03:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786075168; cv=fail; b=sz0qOhWrobZ4xnT8DG3YTbPcXHjND4IoGtNvvlkhu+BQk+f1h8YqTO4048CEGEHo1jxnCc98Pf+fjeHDF7qTVeDeIKlGHoJ3BbpP+e/FLYWcRqJnQ9Ng6a2ZhbkLrK1NL6UORmd7P8prprltRyQTYKVGZhu0uMvsAxam1Eqw3E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786075168; c=relaxed/simple;
	bh=cj5U6tAjQ320thwVni81h4y4SYjxhQAg3SaMmscHkps=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M9JzFAqA4IL+M4JIkFyNRWlTXLt/EFZFZLX7A7VCAYqGh57eQSGHIa+cRLzvqT0cR4RJ+gywHEPaGFqzzRH78YzZw1QCvWiRnScnhBzN+2x0/BPL4zDTI91CAWALbQ8xE/qH4S7+AZ9vCcYDsThJUuEnKyXjvy9DfqKW3HT3x8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=nabr9T1h; arc=fail smtp.client-ip=52.101.52.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="nabr9T1h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVUHo/HOd8GZQvs7znvB0uN9pNx50WTarTdGaDefxGivf1nTzGpkxAiF4NEPRaSPTdEOGO7xmhYLdF8Mvdpp1mL4rCPHVntT1nid1+E0MNSXBa+NVYyZ220g0CxsAYHtRH0HRmtksw2vDJFTYRjwMXlKNbwIHAdWZimxjqabyXVw2grxWxsWEzINQlOnLACr3DNV8nAFRb3cUmv3El3ngp34t/tZcQYR5g565u11nBiwsuwmMK1AwrjJE6qECcbizavfcEUzxoyu3gR1vpIWquSho0PcInPXYfBF31kST/Hdp3rvdia769qi7Yuc1x/Yz0Vv5+5TuBXabit8LhlU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xamwpEJEYW0G6UYZWQ/bGqmezrheJbJ+hwC/RZucsxk=;
 b=TZLhlam8IN46HxqXoKPvoSvebX9vkJY7OgmFmq+oWnDo4//GQZU0/m7fh/W2u3nM0SlSv/DUQjfm1H3b6bl2Qf1i7pW5i6sPImblU1z+b5rHaqoly8g25/w3BnwZt5Q1tpS3ThqeV7wNQ16ndCOyWBvLJhJnVyc116xhrTAbq1pSMwAfzg5+SMIr5O52B1jhYaQRCgnkcs0f0f+d9UgnY9CFAiXq6TPZvT3cSJTYp8hmZ4322/vUlQ2W7SIKO108RQXLWEbm9O9ho270OitjR4yYd1KJo1EvF4wz+dZbFhK+n2fnvzFaXdSgfDoZlYul7YG3jHQApzR51HMq8LIpyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xamwpEJEYW0G6UYZWQ/bGqmezrheJbJ+hwC/RZucsxk=;
 b=nabr9T1hZ8iySm72+ZEUlupLrnotUVIEtYgAhh5nUbbWHxuecYM59w8E+h5BSSAOISLD9uZPZ+g3pMsrNfe5IQiXHbf5bx4e1xPZRvmeGff3AkgUosR6BrzaO0LXU7EF6DdWmEfAowe/vvXcYYD+oFzoTWIJLz+VBEQDeABaInLAgrNT/9hH8nOzZA6RrMRoOjYRGrT0gVqYpqiJ2fORgSxJP1LynQ93lLT6yV+i4cT6f7Sc9NyMZIq/csPcSv0r0mkI52KweF0bcBbxgrmylb3m3cpWNNjety87QwqvRqFO/Ay9gbzrRuRyLafjYZ+QPPXPNS9d+AQH+VNWDD4e9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by DM4PR03MB6207.namprd03.prod.outlook.com (2603:10b6:5:39b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 03:59:23 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 03:59:23 +0000
From: genevieve.chan@altera.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Genevieve Chan <genevieve.chan@altera.com>
Subject: [PATCH v2] dt-bindings: clock: agilex: mark mpu_l2ram_clk deprecated
Date: Fri,  7 Aug 2026 11:58:33 +0800
Message-Id: <20260807035833.16198-1-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|DM4PR03MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f262545-b58a-4020-2a36-08def4384417
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|56012099006|11063799006|10067099003|55112099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	8OaGIgO/Q1K57HOY8dNDAS6uch3jRGqRO1RBOomavT8AEyZ4m6ZwVJzT6gsDdnWrBWK8TrFKJJfmFQ0Qb+fcE+CbpsmaRf1ILE8q2FXLf/CcuCCpqr/p3PRyEqCfCpzcMZALViHkcpZ7wcAzmHWwBAqX+iVtQJTnf5/JGi46teBV0c+r+qn8ktDH0whNSxpXg1DNLLX4KGLEDYtOs3G1i7j3lupZgtARY3yTwAc357eAmRCgaai8Sk/jsHa9iErKq2q1TDNXnN1gNAns76JtVQPF/AsIKaDoUv63AlA3nFkzc65t/7gdJjCJjQDcXdcFOh4QJAfQRA42s228aIlbd2pTtaj8QVbl/jKRSsF670eQh13q/3O30YxokC3HAL3BUKBta4w8E06Hghi5XoDzWXwogdygqw55d5L6EiFZV8cY4RDVbDoypjCPfdrrJ4uon1dUFwbz7vtKcBVMdYx+CUX/IBKqwTc0EJ5s23XqqjChH53FKwzYDeBcSWNuCVluQsVGwhGg4PzO1aeYQYSw+udHqFndI8jqCgsH1J377Hm8kXxPzySa8oA5BwMYY0PPFPvOuRsofksX5LQSM3jYiPK/C52PoDS4Kf2V6o/GjXsQuxQLUa6QAYiXnVYpfZkPj7oD1o1jPHFcO374KceEOyKAYuWtAov6tLw7J59adS7d61j1uH8d6nt/Wh5F0RzRm6fgCgAwjKXiS0KeoAenRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(55112099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8HqToyrkaAusNAf6Xje/RFZcKJlOeAmjklO6c0dupISuLGMoFqxh3UQE9HxY?=
 =?us-ascii?Q?11Rg9Xo6/v6TlAh3E4+Axx28Ln7puSBy5ODl9OGVt9X2Ua+xHF/fjKTU29pl?=
 =?us-ascii?Q?KHFtzssFCB1Qz8IldaE86/llW456imoMpf6BI+05PXGGMwbCdMmQPYc8RDA3?=
 =?us-ascii?Q?+GlZX9HUwN5qg2bKonZAIuKdWC27HwvkMZdMih5gp9wXxU+J9A47mc01F63q?=
 =?us-ascii?Q?7QVORkb3GgBFUayDKDaK63bKmfvHMChW+IehBL+yS3GfhcBV+/Xs4hqlN+gP?=
 =?us-ascii?Q?sdWV87hSZGK+DViXP/El5XavllnJrofop4s4zYZajtAwb6LX60K4Zx1xxNB+?=
 =?us-ascii?Q?VgxEQGsbYRERBB2fnRb01pl/HtXicVtlCjmdbQAQXtzg3VJmTUXTLkNTNbjR?=
 =?us-ascii?Q?XvhS8zruUcyz4lloFgzdGw/04XljVrFK/eKtSJy1RvMQIDl0vdVpe2ltkAY/?=
 =?us-ascii?Q?3rgZ0QK08Stu08MdIVu48kz4O1z/xXMsL7Y3wkxtqY/Ln3qxxvUmkhVEX+Ob?=
 =?us-ascii?Q?6331/VqrGtEbcAriObL1ZVI4+WL6sX5/oCpYPgJ/yHT0K9GLv5Fda3TD5dyz?=
 =?us-ascii?Q?zXVQb6JkLvpA1aB0nWrpq/6pou6DqS1uQl7Tnp4EsA+3hac8hgWtWtbrwvwv?=
 =?us-ascii?Q?s+aHzBnXh27TN2AaFzEgkdzCWcn7O3gQQLWjL89fm6JLSSfYozjA71Y1rAAQ?=
 =?us-ascii?Q?BW9pSP8iN30BeclN336+seU6Awdm+corRkZ4Yzu37zwSd4/ZD4lgCZY5BIiY?=
 =?us-ascii?Q?AbhBiHUymz1+pt2k20STxLjm9bL02A5T65wEoaWY8lXZ+SHih2+gdGZURVeS?=
 =?us-ascii?Q?EmxXf1WoVUbJrBr4ipWdCRVzTHnXBg72ggixNQiS2B5YGBpdLkNXrctkKw6v?=
 =?us-ascii?Q?uNAyHkuTjWsKA2CTHNxm6ctR8SOP/IWyliFDQhtzwaqFJ7pxjTap27qyCvF4?=
 =?us-ascii?Q?B1DpawKClU3jnAgCK5b/bRISCrsHERJoMUwNtP/YFCaQXR+/TCAaUZMJ2XGY?=
 =?us-ascii?Q?PZS6DOsfOFAnX+HNShAecBJjyfHkGZkKSHR6jsn5rx0bxj4Lys0C5kkm/uft?=
 =?us-ascii?Q?mREGd7egK4q5CfkCrOqFcPMGIY3cqYt/IbkdsvRCz1jv7BDZrCwD09rfAnwP?=
 =?us-ascii?Q?3wNgpU7XayPUAoxTLpKOmDjCDDyZk0KcYfxTGnfAglLebkqceankdPfQ/QEK?=
 =?us-ascii?Q?5+/0SQGJ3OAGUP/AkmfqP81kVhBV3BW/rndDLJrxS1J11o3s67iiTF19shGI?=
 =?us-ascii?Q?e9AZhUOpvs6GKkfKzEkJiAiGf7NgHPeToIRnWNPjFXMlsRwMiGJtRLDwLZH6?=
 =?us-ascii?Q?mWJqGE2xlARpDM2dHQbDRI95h9Hol4C7NZLYYMYGje0puU6NvN6dfwEyAWqh?=
 =?us-ascii?Q?ORfPqHiivu38ootFJgZSC7F+4eGpuIO0qRO6Rt8d10Tt6xP/ufGG5axne3DF?=
 =?us-ascii?Q?fReOJw9o6CpAB7ZTR3jgiQ65FZztcz/KtqE1Ve3okMi+ncWrvrl1kxJks4qB?=
 =?us-ascii?Q?/DwDnqS9sU7egchgxaJSyn7Tdd6xrRQISVzY+DwJOw4bnMI5Z84+7e7NW0zA?=
 =?us-ascii?Q?CXMx0rfdY8sTojhVmhVj5r8CuxOmU4AED60LbB9S/fOGaKpU0ydKcIG2MT0m?=
 =?us-ascii?Q?beE/+fssnqCLUK6ePi74hYhq5ywcVfXFIg1mdFjXysGNpvrIfwmrh7Qqjaqr?=
 =?us-ascii?Q?8jS18+C3yItZKo0sAQyWCyNgKFubEKZ/5bCxSjZ9mbwS06f6ERAop4uE+1bN?=
 =?us-ascii?Q?mxz4tXvKspd9/nDv2hyEX20HFlJwNDE=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f262545-b58a-4020-2a36-08def4384417
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 03:59:23.4999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfDGbel7w/XQORaEejpegqYe/BtPFH8HDdjhZvIzrNHa59jyWdrTY1F5njdYncYwTHoIcHvMZJJbDevNSx83AF0nkgDp9rfb4XGE/aOOCLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6207

From: Genevieve Chan <genevieve.chan@altera.com>

Preliminary documentation referred to mpu_l2ram_clk, but that clock is
now mpu_ccu_clk and is already represented by AGILEX_MPU_CCU_CLK.
Keep AGILEX_MPU_L2RAM_CLK as a legacy ABI-preserved ID (do not use in
new DTs).

Fixes: 6b3c59780ed3 ("dt-bindings: documentation: add clock bindings information for Agilex")
Cc: stable@vger.kernel.org # 5.8+
Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
---
Changes in v2:
- Remove comment on unused clock ID 42
- Reword commit message
---
 include/dt-bindings/clock/agilex-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/agilex-clock.h b/include/dt-bindings/clock/agilex-clock.h
index 06feca07e08e..6206a45e007c 100644
--- a/include/dt-bindings/clock/agilex-clock.h
+++ b/include/dt-bindings/clock/agilex-clock.h
@@ -44,6 +44,7 @@

 /* Gate clocks */
 #define AGILEX_MPU_CLK			30
+/* Legacy ABI ID; do not use in new DTs, use AGILEX_MPU_CCU_CLK */
 #define AGILEX_MPU_L2RAM_CLK		31
 #define AGILEX_MPU_PERIPH_CLK		32
 #define AGILEX_L4_MAIN_CLK		33
--
2.32.0

