Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021075.outbound.protection.outlook.com [52.101.70.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87084D8BB;
	Fri, 13 Sep 2024 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.75
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726245703; cv=fail; b=rbfPG84m78lqL7de/xTp/RZl6/V4RfCT8uZTBKiYdYxxTLSvZj0llIZH1GakZUsRdD1nJe8kFlKkss1lgupBM6Az2Oa4cu/nCs8Td4ZXBuhXft9szkLfDRexMmeNPRNGTip5f1eh+7xKTLoP8iuPgeynWVczwdywFEV3Ay+7+P4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726245703; c=relaxed/simple;
	bh=cywHfvcnX8Yy7J/rJC7a9rKyhrTSLeplq6NsJez0OrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ME1dl+cSraZNcQfTnI8zrprDnYi5Vkm4Y/0gQPMezQLrxluX/GcExNElE52WOMSGFWZ8VhtQQBeljQK3M1KTQKECpVH78eclE0Ncf75wotMDDCkxtPwQGLCMUQkOsfngJ4xtRVWJx9+O3R9n1tVpg6IZ3TRBFK7TjboOCUtUJJE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=RPSudbSJ; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=RPSudbSJ; arc=fail smtp.client-ip=52.101.70.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="RPSudbSJ";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="RPSudbSJ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qEKqZTGOW7Z3AWuFLcAa9K1KUAomkp03hXNzSB0fvhkDoyonc1QMfvaOst8q2WuNM43dFDo8Jht46BTDD7g7E/xfu8zzfnuclNeCUgyBomMDz/+97qkEzIEbA6FoE9CsRDwxH2C1QCjVQDvNNxg/s0c4uI0VSh/nsRwEhs+7grCYax92OZv0TupiDioPq1qBLtZ9lzbckj/oipf3omGLnDW572DpZj9mDA4L+uHqbmC8QSD+urxBmSSK55WuSs9e6GjFYIso+7t/Pu56ZwWqDYvsxBl5F//adnJEznOJ0+gqz5CEVA5taK5R9wRp1/ZT/FAoV/jamb5yH3WTA0M/8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVEDYHyoJsO79luNg3AybP1X8qyN22fHmVvLGPAb5iw=;
 b=kKhv9iNwtVR17VOkBrpaWjxty6CK4OFYkHNHYnez0cX8peo5gjoX6w+9RTtclnhBuShDJ58SUysNXgsUm0+2xzTnwMAakqFMEgm6bnPGglxArHYcISb3vylkbOhKLserS2Ne9vq4O0qBco5MkaLBnTbpc7Z6bYA2ElqLKRZk54uGfTO+Okm1SZiyPiKQMjOvRja3EfrJc17F7xfrmunD5l7ayjN0p4C6ckpuXriK4XyxFmubK0H2SVbJgla5B0P5csh77+k7HsxSdJwmef2I4MhowOgxun/bH5krTcZtq4k7nNs8vSTOJPsIqmgrctToWAnmKaWz77VlsQQs2aucbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.87) smtp.rcpttodomain=baylibre.com smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVEDYHyoJsO79luNg3AybP1X8qyN22fHmVvLGPAb5iw=;
 b=RPSudbSJ4MbwdXSSgconX8EpL2ItOIBOUwDtYZ65KDkYtoaJ2G5/HhmSP70liO4HKObhfsi0bbYvqpWvEbpX4VUZenzJ37V8GNcY+kwnC/Usz2+QHCAq5G65qEcf3HOp51shCroEyPbVpxsswlgtEUW1de8p+LT72PeYtUddfRl0izU87b9XjFUQ+8QvzApIpGiNyiQtz43RkzJYBwkdTCez6fbweUriqMr7DQElHsgLKbdVwZq8X9kVg7VOBjQUjPjHmhQ/aKzeSU6qDAgaR+U+ABONh1Ut4Mdk0E691YmpEPkZb0NKGb1gGJhu/JbqBN0Ax3f1ee/llYHr/T9pHA==
Received: from DU2PR04CA0173.eurprd04.prod.outlook.com (2603:10a6:10:2b0::28)
 by AM9PR03MB6881.eurprd03.prod.outlook.com (2603:10a6:20b:286::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 16:41:35 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::8a) by DU2PR04CA0173.outlook.office365.com
 (2603:10a6:10:2b0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Fri, 13 Sep 2024 16:41:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.87) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Fri, 13 Sep 2024 16:41:33 +0000
Received: from outmta (unknown [192.168.82.136])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 7518320080F8A;
	Fri, 13 Sep 2024 16:41:33 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (unknown [104.47.30.105])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 7FA922008006F;
	Fri, 13 Sep 2024 16:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGbfTh763hD2CP0CYIPGdE0kLlgktY/Bb2vOG3kVyBSNTpuq3tYosfXu7567Q/wJqpBNQEh2BA/QaGgQjHGIPQ4fVY16s1NU+TYVE9kwPiPWrL21/enwzJBdPF7clh10lp5Ve7f7ygmvhRtNVvroP+3Mu4u58wCJN0kSzOHiVivOxfT/Ghp1WaBZnskG9f8Jty7VeANptjZ1G4KJPZK7zh/INCmTpem1Qs6NuJPJOSdSq8KV+/uvddPFZNj4U6t3qSy9tX/sorw7lOMS8fj6wfMGHFK7TRS4rsb7ZtllJ1JWT1LJdy3ETiLcnIG+oITwn1VFPe1VjOKQo6SkwHWNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVEDYHyoJsO79luNg3AybP1X8qyN22fHmVvLGPAb5iw=;
 b=WpC34SZlXKCecnk293PQiPRB2FhvRrxkZ4uOEN00rwFEx7f00CBIxTMXP5jeCwJIZS7p0hPIz/tjikfnuphsK4bcDTmNek49TgDk2UtK11MErClQ8fxebNh5TbCdvLiE32Knxv1ME/Bm/VIP1IqTzVZNpBXCzelTcFZBWynBP0q2hAcEfkTvM1kPhSbSBfkp+Am3224/QVtr3yGXAJ/p9MF+fjxDt+3DGNb1hbdMK+kyvhdmQQRvlIHH5ElKAplrssMK74TGNCLP0ONweFhO6V1RfMMFt+MmRj17NPtjvhmd+UbQ3ofnl8PH/0nNn1zqJkaB3+Qp1CpGCV93bJGlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVEDYHyoJsO79luNg3AybP1X8qyN22fHmVvLGPAb5iw=;
 b=RPSudbSJ4MbwdXSSgconX8EpL2ItOIBOUwDtYZ65KDkYtoaJ2G5/HhmSP70liO4HKObhfsi0bbYvqpWvEbpX4VUZenzJ37V8GNcY+kwnC/Usz2+QHCAq5G65qEcf3HOp51shCroEyPbVpxsswlgtEUW1de8p+LT72PeYtUddfRl0izU87b9XjFUQ+8QvzApIpGiNyiQtz43RkzJYBwkdTCez6fbweUriqMr7DQElHsgLKbdVwZq8X9kVg7VOBjQUjPjHmhQ/aKzeSU6qDAgaR+U+ABONh1Ut4Mdk0E691YmpEPkZb0NKGb1gGJhu/JbqBN0Ax3f1ee/llYHr/T9pHA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by GVXPR03MB10707.eurprd03.prod.outlook.com (2603:10a6:150:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Fri, 13 Sep
 2024 16:41:27 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::2174:a61d:5493:2ce%4]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 16:41:27 +0000
Message-ID: <663b1735-5346-4fe7-b269-9d958b090a38@seco.com>
Date: Fri, 13 Sep 2024 12:41:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-reneas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Takeshi Kihara <takeshi.kihara.df@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 Adam Ford <aford173@gmail.com>
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
 <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com>
 <20230124091236.1bf8c6da@booty>
 <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
 <232f59aa-704b-a374-6a78-469156ccdbea@seco.com>
 <83f4f33ebd3706ec7d35acd807b1e44b.sboyd@kernel.org>
 <20230322093918.33690db3@booty>
 <CAL_JsqKj6A=GvgaZCd9jiF71YPGuQSKJ9Ob6erHT45q8vRR13w@mail.gmail.com>
 <20240913170701.156d8e82@booty>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20240913170701.156d8e82@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:208:256::10) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR03MB9020:EE_|GVXPR03MB10707:EE_|DB1PEPF000509E6:EE_|AM9PR03MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 4568743c-7462-4ce0-f700-08dcd412ed7e
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?U2s0RkE5YndWTWx6VHdrTzRVVFVrV3JFaXkxQ3lZZDBiVFpaZ3BUeHFBYmRX?=
 =?utf-8?B?QWJqRVRDWVUwUnFrb0hBa2lXdE4zSHNrUnJyS2swQWhQcTBWY3ZzbUJFZkJq?=
 =?utf-8?B?QVE3c3kwMlN4ME9YS2d1bXpHWllrdzR5L2M2MFZPMTdBeGZlVUN6V083U0Qv?=
 =?utf-8?B?R1dWQ0Yza1A2aTlhRDZmbnllZGFyRzV1S3lLZlYyNk9wS3ZUckRyTlZsU2xs?=
 =?utf-8?B?dm9HLzhCTm9YUi9Dd1R4eTZUWEdJdExtWkZhSGpLSU9Celh2TGUyWEFJYk9Y?=
 =?utf-8?B?V3owd1ZBTkxTU3J2c2sxL3kvemF2bithbmlJVU5OVW5NbVFtOXFxcU5aakdX?=
 =?utf-8?B?NzRjblhqUmQvSXdtdzRoZXR0b1M4NXRUWWs2dy8vTlhya3YzNDV0VDhFVkpB?=
 =?utf-8?B?SnowcDJ1RmI5ZDlDSzJza3p1bHdTRUFNT2U1aVhDTGF0dURObk9Sc09wazJD?=
 =?utf-8?B?eWhkcHlVMitBWFJyZlpKRmlVNWp6UVFPTHcxSXVvd3RlQmkwbXF6NUpFQlNh?=
 =?utf-8?B?K2J1YitFQ1duUjB2d1BnTk9YemUwcDRnOU1YSnpLMCtLWHd0bEZGSytoK3RF?=
 =?utf-8?B?SlkzUnBEZmhCRlJ4SUZIbG5qejdINTBnS3Vad0o0ZFlUNWxIdHJ4TFBWLzdP?=
 =?utf-8?B?V3hVMm5BazNXMjA3aTVZVXhuckhvSHVEeDAwNWNYT2xaNElhaCtQOTVXVzht?=
 =?utf-8?B?TjBTOHVJeThjVEdUTlZWVHlFR050Z0RYV3ovVzZGMHhYMUhBVGtLM2dBck5p?=
 =?utf-8?B?Rnd2MHJUVXVwWVM5RXlJa1JkVTVGcEQ3ZWJXMitIVG8yR1Ayb0tnNnpUeC9M?=
 =?utf-8?B?K2xsQWgyZzB4RzFBRVJPNHV1cUdPbUdZdlBYTituMG5qTDJFc0F0Zkw0RmlJ?=
 =?utf-8?B?L3g2N3dhTmxldmF2dG5ic2xSQjhUb2NpSFhtTDdEKzBLU1gvNlpXV00zYm0v?=
 =?utf-8?B?QzFBYjV0N2ZCTmZaRVpNaGVZZWxhSExBWklBVDhITmV0bDArOXpOYzEyQVhS?=
 =?utf-8?B?T1ZsL3hMeERDYkVpOURadnFOTHpGZXhKMVAwVU5QR0xQS3kzZmlkdGRRL3p4?=
 =?utf-8?B?RnBFUjNtbnVUc0VpQ3dCazIrTDA3OXlxQWtaOCtvWWpGVUwrQldXOW5oS1No?=
 =?utf-8?B?bDB5akhJWUxzcElQTGYzU1lVanBGN2VCbVNHdDBRKzhIbHM4NllDZkNSVkpO?=
 =?utf-8?B?eElpOWlLUDBWVkJPRWJrUWNwbmQzU1F4bnZBV0xraVhvSDhRdXRHZnJIWTAr?=
 =?utf-8?B?VWJHZHIwU1prb2pSSmd3OVFhUUZrMEhTRUtDblZsYnZCbEF4WVB6UWpac0du?=
 =?utf-8?B?dXhoNUMxRGcvQmQ3SU4vaHBCUk5ZZmIzN1lpNEY5QlBpb3MyemRJSDBKcDdx?=
 =?utf-8?B?UkVRUnhBK0tkTTdrc2hIQ0F3YnYvWFQ0WlNyK1hyWXdETU5XRGp5b1ZUUzlv?=
 =?utf-8?B?QU8yNCszSmpjSzc4M25zbkNtWTdzOW1ubDl2bTNHYmd2ajNlYjdBM1hibDRn?=
 =?utf-8?B?dURWVUNyTnc4UnBTdWxJVHRiL2xNdC9QRG9NZTZFZ3lXWkV0N29oejlKOFN5?=
 =?utf-8?B?UDVTWDdwM0FXNW5FRENHdTRTTXg5TGpIeEhaaHZmYzhtaXErNklnT0lNRmc0?=
 =?utf-8?B?VmMrWU5ubmpPVkVmMFRsMWFPajNraGFrU016eU1uTDBGZm9DNm1xWCtDVi93?=
 =?utf-8?B?Snk5NmtScVhuK1N4WkgxbS9mdHRiZEtkVFo5UmQ2NVltM0x5aFE4bHpWUEdE?=
 =?utf-8?B?STdqR3B2eURiRkdaSm1oNStvNGRIa3hPMVl5c3VIeVlXeTlnS1lkZGdYRUw3?=
 =?utf-8?B?d1FEbGhsaEZYSXcrMzJ4K0E0Z1BPSkdhd0l4QWFsOWNlZ0k4S0tCSExzcmFN?=
 =?utf-8?B?NURaZ0lvamE5UGx3N3lCVWNnYXNvZVBkS1NyZlkwOTAvWlE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10707
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d3c15e9-c66f-4a2c-f220-08dcd412e993
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dS9Td2VkZHJ0YWJJVXo5bmZpczVIaG95SksrZ2tmRTYzVENramx5V0l3bDY1?=
 =?utf-8?B?VHpNUnpReUxtOFlOa0FjS2VWK3g5M09EMk13OGtnbm5ZVUJsM0ExWmExSytU?=
 =?utf-8?B?NVNkUXdVQVc4SkpQUlhzczlJMW5YS2JrU2tNZTc4TWZESEhwNmF6Q3MvcjUw?=
 =?utf-8?B?YW02TlRwYlpmRUdGQ0h5dlNpSE1ZNGU1QzZRa2ttS3gwdTV3L2c0SmV4cHEy?=
 =?utf-8?B?US9kck92VGx4SjF3L1NVcVpyUU5TVWwzTEQvUFpzRFVKL0dkTWhyMTh2bW1o?=
 =?utf-8?B?Z1dQSG1BOUcrVXI5N3JjcjhZOUhqemNZUXhsNndjdnliaXpKVXlEVUlKUnl3?=
 =?utf-8?B?RTFtSFJrd0EvTTY2NGhwWVM3eVVhZ1JTUXBFMDRpR2ZVTlhobDd6cmZyTllY?=
 =?utf-8?B?QVlacHk2a1hHN1p0ZHpTM1hWYVZpYVRLaS92bVQ2RkZ6L3lvRTFyUG9hL3hK?=
 =?utf-8?B?aHNuTUlhd1d4Zjc2cUN5V0Vod1NmZW5CSk91TzhyN1lFNzFsYnhOM0F5ZUVl?=
 =?utf-8?B?QkgyNXgydFY3WTNOUWZUb2FXcjFTOENQS3hlQTFTUjJWZmJmZFhqL1YvRG5u?=
 =?utf-8?B?czRNOGxzNDBWcGJIRDNMK0ZDL29EWFJhN2ZTbUFrcEZydmxod0ZIdnI4VFc5?=
 =?utf-8?B?UzlLQ25uV29sRkZWYlh5eU93NkxXUUIzYUs2ZXJVZmZDQmxyVmdlMmtpb2dF?=
 =?utf-8?B?QVpNNERiL1lZbjB0M2wwamx5ODZtWkErem5VN1BJTFk3WnJ4eFhpRjh4OWMv?=
 =?utf-8?B?TlY1eTR6eUVBd1pUM01Gd3RWVDduMzFkM3ZvcGMzV0diSis5TWhDcjZjZzV5?=
 =?utf-8?B?VkF6SEZreC9KSnVKcGFjTUg1S0kyREhQRHZqUjhVM3NsK3crVk1ZV2ptNXhs?=
 =?utf-8?B?ZVkxRzRYeUk5YW1vbHR2TXJUZnBGaFkwQjVsdytuZWNGTTBxN3ZKNDBjSXlp?=
 =?utf-8?B?Y3Nrb0k3djF0NkRwNzRYVWFzYVZnU2N3eHdwM1dWekxzMmV6K2tWSDkyYkt2?=
 =?utf-8?B?THdXV3FCYm5hTDRubXdoc212Qk9qUGFMZHgzZVFEYkhjenFYbmpTZmliSlcx?=
 =?utf-8?B?M2FwMW9XZURKSzFCaDdZQUh6b3YyNjl3UkVQR3R4NVJXMTY5Umtka3YvL1k3?=
 =?utf-8?B?Nnd0RnBVVGJpTWF3TjB5L1hjdEZ6aUtQWVBqZERod1pkdTUvK3g3N3FoVUhQ?=
 =?utf-8?B?ZjJkWS83cU9kN1BzQzBWQkRkOStqRmdaMXdNdkRhN2J2L2NZdEl4UGZQUWJj?=
 =?utf-8?B?dFhTWkp2NWZDamhqVHhoSElGSGYvbGdwV3BuRDhkQWgvREZEbHVINW1rZUtD?=
 =?utf-8?B?aUlPV2dYTzN3SE1pUkkraUNWaGU1dnhaUldhMy8wL0tQem02MGV1U3VtRGg1?=
 =?utf-8?B?M3M3a0xvRGM1TGRNdDZ6c3NUbng3L0lVVW5OZVVucHZMU05CclovQ0NmNm9Z?=
 =?utf-8?B?NDlQOWw3dlRKMXczSEU1MWdIY1VzMHhvNUx2Smt4bFBKTElIbTlPczAxVXRw?=
 =?utf-8?B?RjZmeUExbCs4OFBDYTRqNWpYVDZBb1dIMTJSejUxVXBTSWNMeE4vaW1VM3pt?=
 =?utf-8?B?QWN2QTJFWlR4SFZFbUsva0dwcUYrb3JidDRHTVRmU1g2T3hwNjY5aWFHTVJF?=
 =?utf-8?B?ZzJHbFpUMGJCd2RsZDhXcnJCZnEvK3RGaHU3Q1pRQ1ovdXFGNGRkN1RyRkxH?=
 =?utf-8?B?aTZ3UXBHLy84OHlUTlpyamZaZlp5dXF6aTdCdXAxZStsNnd5NWNUYXR4S0t2?=
 =?utf-8?B?UVhLOUtsem8vVE9zWXU4emUzNktGektVbEh5d0NyN2VqRFd3d1A2NGJONkxN?=
 =?utf-8?B?ZlpkUWlURmMra0x4MVlZakZlNGFVMXllZXVlSjduYnBRWjMxRStlWE1zeDZ4?=
 =?utf-8?B?VFNWd2xpMkljK3hGMi9ISS9uaDlpcGVmMnBzSzNBWTRBNXpxSS9rVVhvVDd5?=
 =?utf-8?Q?I49WKtPFX5VTZgIUQ3GQTEMOedtjzvLX?=
X-Forefront-Antispam-Report:
	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(35042699022)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 16:41:33.8007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4568743c-7462-4ce0-f700-08dcd412ed7e
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6881

On 9/13/24 11:07, Luca Ceresoli wrote:
> Hello Sean, Geert,
> 
> On Tue, 10 Sep 2024 17:13:55 -0500
> Rob Herring <robh+dt@kernel.org> wrote:
> 
>> On Wed, Mar 22, 2023 at 3:39 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>> >
>> > Hello Stephen,
>> >
>> > On Mon, 20 Mar 2023 14:27:56 -0700
>> > Stephen Boyd <sboyd@kernel.org> wrote:
>> >  
>> > > Quoting Sean Anderson (2023-01-24 08:23:45)  
>> > > > On 1/24/23 03:28, Geert Uytterhoeven wrote:  
>> > > > > Hi Luca,
>> > > > >
>> > > > > On Tue, Jan 24, 2023 at 9:12 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:  
>> > > > >> On Thu, 19 Jan 2023 14:27:43 -0500
>> > > > >> Sean Anderson <sean.anderson@seco.com> wrote:  
>> > > > >> > On 1/11/23 10:55, Geert Uytterhoeven wrote:  
>> > > > >  
>> > > > >> I'm wondering whether Geert has a practical example of a situation
>> > > > >> where it is better to have these properties optional.  
>> > > > >
>> > > > > My issue was that these properties were introduced long after the
>> > > > > initial bindings, hence pre-existing DTS does not have them.
>> > > > > Yes, we can add them, but then we have to read out the OTP-programmed
>> > > > > settings first. If that's the way to go, I can look into that, though...  
>> > > >
>> > > > FWIW I think there's no need to update existing bindings which don't
>> > > > have this property. The required aspect is mainly a reminder for new
>> > > > device trees.
>> > > >  
>> > >
>> > > Is there any resolution on this thread? I'm dropping this patch from my
>> > > queue.  
>> >
>> > IIRC Geert kind of accepted the idea that these properties should stay
>> > required. Which is a bit annoying but it's the safest option, so unless
>> > there are new complaints with solid use cases for making them optionalm,
>> > I think it's OK to drop the patch.  
>> 
>> The warnings related to this are now at the top of the list (by number
>> of occurrences):
>> 
>>      50 clock-generator@6a: 'idt,shutdown' is a required property
>>      50 clock-generator@6a: 'idt,output-enable-active' is a required property
>> 
>> IMO, if these properties haven't been needed for years, then they
>> obviously aren't really required.
> 
> I think Rob's point adds to Geert's observation that there are other
> "idt,*" properties in the output nodes that may also be important to
> have correctly set, and are optional.
> 
> So, Sean, I understand when you state it's safer to have these set.
> However this is valid for lots of other optional properties in any
> binding. Optional properties _can_ be set if that's important, just
> it's not mandatory to set them in all cases.
> 
> As a matter of fact, we have been having for a long time some in-tree
> device trees which don't set these properties, which I believe implies
> it's OK for those cases to not set them, and to let them be set for the
> device trees where it is important.
> 
> Finally, there is a maintenance/legacy issue: if we wanted to keep these
> properties optional, who would chase all the boards defined in existing
> device trees to discover the correct values?
> 
> Bottom line, my Reviewed-by tag is still valid.
> 
> What is your opinion given these last few discussion point Sean?

I am willing to send patches adding these properties for the appropriate
boards. There are only 6 in tree (all Renesas):

$ git grep -l idt,5p49 '**.dts*'
arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
arch/arm64/boot/dts/renesas/hihope-common.dtsi
arch/arm64/boot/dts/renesas/salvator-x.dtsi
arch/arm64/boot/dts/renesas/salvator-xs.dtsi
arch/arm64/boot/dts/renesas/ulcb.dtsi

I was able to find schematics for ULCB. Salvator-X seems to be gone from
Renesas's website (in favor of the -XS). I have requested access to the
-XS schematics.  The HiHope board doesn't seem to have schematics
anywhere I could find (which is pretty unusual for a reference
design...). The Beacon schematics are behind a support portal (or so I
assume).

That said, this info should be pretty easy to find for anyone with
physical access to a board. Just boot it up and probe the voltage on the
SD/OE pin. I've added some people who may have the hardware to CC.

--Sean
