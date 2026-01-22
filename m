Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D3E32D44F;
	Thu, 22 Jan 2026 02:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048252; cv=fail; b=ufG4bLJBaQF78ujAVNc1yXLtT6Q7ISFHPby4a3MBqv7elA5FyoWH0Z14RGRbe7hsBv2Qxw2YkvgeHix7P5+6CxO03CamRRPY2ePRM9p625Stgd1JsWlI00kdT6fDSdu1PMhRHLrG5JAK6RRL3ZHVYIW6YgQTpoNGNbBO35SGszY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048252; c=relaxed/simple;
	bh=7QtQKZAEC+cSH5ejQKAbr/QU7aXnW1AaVRYBkN360+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H2w26Knmvh1FwZCnp5tmJv1fxfCDMQVfnOxL5GNypKVYSrfsPpwqXYrYTep9NXmo0zS6qvI0zSQ1TUQAHT3QarezdKHyywA52Ij4OolKcmcyWITurj76eyitCNFB7n8kP6tmprBzNOBPUbHjPaXTBSTJwjv40lEXh553J4P4s6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GWtA5w3y; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GWtA5w3y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMOhy4Xb08veieAL+6STvp7nmmBKVqUtujbbhPyzJmUH7AN0bY0tTPshzkwHlxeEoWNLslr4VrQ7lWhHxEKn2JgBK5Fmz5xPZNQCGpbXDHYkFO8LRxkB5ZPhdaU0hp8i5g6LrG3+0BkpCCEOjRYpTDuIMERIKFTAn0EZ7PfcaTB2Lp9dMgE0TuojNSQ6KHUkDsSglW1KPCcImiQuuPFwk+wOhCT9SpPKiC/x21MCoYFIwx7CBebbJsnfONlUJs7Eo0KD6j7z3oabsOOO6n5uQQm/MqYMzLT3b8MzxL8JbjsbojrEstYcK1Ea+7KdoMhWQKgNuU6A7Ggxbdz6kjHveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QtQKZAEC+cSH5ejQKAbr/QU7aXnW1AaVRYBkN360+E=;
 b=WcHvVFgU+x8FSrGc0Pyccj9FF8+lumf1gURsKBW/MPtaIsea/ODTn1nP3feJGyEpJr6ypiWD0vd1+9COcUQRmMZ8ddgUWSfSch6yjkgzc7CfwgW7TIniCW64M16TnpDIHko4GBvCgg2Prp1Q17Yizy7GNRLUYatHsPYJ9hzOd4ZvbLC8K+JKk9G3kmNzk5EnMTEBOhsGV98RGNgtMTKcDxW7kVTUw/9fG+004oR99e5A0Sboh1Shh2lOWQj8Q+5Cr+ma1slNpHwgGjYL+v1m/vXHln3l91cxPcm2cSr7h/vWTDwDW0RixkE+l7SAAQVnm44GRQT7eRWlVpskCS4Pzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QtQKZAEC+cSH5ejQKAbr/QU7aXnW1AaVRYBkN360+E=;
 b=GWtA5w3y75QKeqbJIeXCrWNQ0TNoquZVgKMHRXj38wfevgdVT9cjSbAUl7b8lWV2U/8YC4Re5Gf7djVcLkgY6DTH3fJ8aedKl6F647qgpfCbsRLbB7hmDx5odnqtUTfnvHCdI63Jd2erPexA/wKN2wPqWRTZzyuzpGp13fs9LONI4rQk5xDpiMHjukakMCcuu9xIPRgt2orT4hZskc75/GZBGhoZrFU2sybg+Q4FzV4qEAaCjbOXTWiX10IepkWGWY2AkYhtWXpQHsCRF1PS2s3dJh1FG1TLpjcn6JDCj8mCS1zbEQexovaMVsnGG31WoJD+P8NTt5WQQobG1zZBig==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10700.eurprd04.prod.outlook.com (2603:10a6:102:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 02:17:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 02:17:26 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related
 CHECK_DTBS warnings
Thread-Topic: [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related
 CHECK_DTBS warnings
Thread-Index: AQHciwBjhbWnT8yRKU6uo04BzB4HRrVddF7w
Date: Thu, 22 Jan 2026 02:17:26 +0000
Message-ID:
 <PAXPR04MB84591E8D22EF14C1BE480CA98897A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
In-Reply-To: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA1PR04MB10700:EE_
x-ms-office365-filtering-correlation-id: 91005059-20d7-482f-2695-08de595c62d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U3d1bkJQS1VqOHBpR3hvVmNoeTF0ejY3cTN0b3V4QTNKRkE0LzZHdUdYZGlI?=
 =?utf-8?B?dE9RcSttbWhuWDFRNmk4d3JiMHVVUEdqN2psQ010ZjNUTE01dkdMOEZRZ1la?=
 =?utf-8?B?YVFOL1JtV0ZKZXgxOGNiajdqZkk5a1NNTC9QYmlNTFpudERsOExCa3hacW9i?=
 =?utf-8?B?bUw2a3ZKd2JLTlZOZlIza1JjSmxsVDBaUHFNWVpOQ2tRci9BUG5BMXhjWlYw?=
 =?utf-8?B?VE00ZktPQ2JzQUtnUUFLZkc1MWRLSTBYYUIxK0FVNmZLcnZOM1ZZclpXMTJE?=
 =?utf-8?B?NXFIZzdhckhtbVcxWXRIRUR4ZG02OHlscU9BcmVoWDNKTlRQV3Y2T0ZneHpC?=
 =?utf-8?B?VXc4Y1QwN1dZb2FETDBBMkoySmg3STJqUC9wQ0g5UlYyRDRqQzAzNWpPNWxX?=
 =?utf-8?B?MjQ5dlEwMUx4N0VKU2RZM1d1QUZiL3VMNDFwN0lLMUZSRUxWbWVuS1ZvRUNv?=
 =?utf-8?B?Umd5ZVdjOVF4RW5JQXBNQzdTb2dDUlNTUjNsMnpJZDlKS3pRT1VsTHdWR1Uw?=
 =?utf-8?B?TWdud25KZnRscE9oeS9VcVY3YU1nUHJJY2xLYTh0ejRXYjRMUEpQN3VIMXFN?=
 =?utf-8?B?Mnd6RnZDRVZqY1VITy9CQ0c2QUhTczl1Qkh3Y1FSUjhCelVJalFWaUgxM25B?=
 =?utf-8?B?VUE2dTdFdlZHeDRRZ1dVSyt5aWpDUHl2SlE5dVcrTFAvYWwzTzdTcEkxN1pl?=
 =?utf-8?B?RjJQSDVlOWZsZnA0VjhldW1ENzlYb0JzN3VYMldMZUN2TTVvalZCcXhpY0pI?=
 =?utf-8?B?YUU0SXBKVEx3Tnp3SHgwbFgrOEtZVklFMGpwb0ZmdW9XR2RaTHFiL2c3b3Jh?=
 =?utf-8?B?Zy9DbzM1UDFYNFQ1TVZuSlJGRHV5SGtFbVR4cUQwMG5WeHV1Q3ppRzdKMUh6?=
 =?utf-8?B?OVYvM1FMR3VXZzFnS2VraEVUdzFXNXlGN3pHaWp4NURIaEVXT0xrVURaSmMx?=
 =?utf-8?B?SlBsYk4zdUFUcUhSclE0Z2JJb2NDMnBjc0E1ZlhwZ2pVM0tMM3NrYlRiOWZk?=
 =?utf-8?B?WHphMkpOSWFrNDlpc1dIVG9UL1dHRW1YZjlOQk55b1RoK3N5czdvQ1RacXV2?=
 =?utf-8?B?MDV4c25xdTdJVEMxUXpwUWdJdW5aMTBuQllDWEUydEF5ZmpKcjJ2S0Flc1hl?=
 =?utf-8?B?WWNpRWpKZGdFSDZrWk9qT0hLMHkzMWIvS2hIV1ZsZkRhNEZBcktjbHAycGZT?=
 =?utf-8?B?eVdkRDh3VWg1bnBMVk9QNzBMMHByZFFRSXd1aVpxTVpDL2g4TkU3RXNkV2x5?=
 =?utf-8?B?Z3BRMGROcWY4RUZmaUY0d3E0YmJIdHVyYldyQnhKZkZGaWE2a3FDWUtEdHhD?=
 =?utf-8?B?WHlaOXE3ZlB6ckpDUithL2JNcWJKUDVvY3BlRW5NZEUxTklpVlJSSnFjTU5y?=
 =?utf-8?B?L09tZmcxc3Y2Wm03Qkx3Yzg3R1pUL1o2NnZsVmZiNi9kQmw0ME84a0JnQTNW?=
 =?utf-8?B?VStVOVFlWGppcjFTc0xwL0wvNFh1cXY0UVF6cUJYaDRsS0RYNlgzVVVpZGp1?=
 =?utf-8?B?ZnlqeFVCbndaWEl1UGN6aUxtSEtnZnplb1BWWjRYL1dxWE83MkNkVzFYcDNZ?=
 =?utf-8?B?dEdOdjhyVWQvWUVIYlNPSXpmOS9GR2VuUVNqZkx1ZGF5ZFA5T3FEa1VSZlZp?=
 =?utf-8?B?bWxmWE5BbklnUWdEWE5XaTdWNnRSM2RGeno3SW5xVmtoWG1LV3FNVWhsZ2hr?=
 =?utf-8?B?dWRTS3VyenY3SlBHTmxWQUdXRERhSTdCWVZzNFJiNXhCQ253WVB5MjJmN1hY?=
 =?utf-8?B?bnFPTVZqSUJlT3l2RkJoSXB2aWVDbXBqNzlEZUhPcXlxT1VWWHlUY2hhVkNB?=
 =?utf-8?B?ZE5kdDBySVRRTkIyMktLWHBlMC9sVENDRlNPVlJKOEdnelAvTk9XQWRhSWpW?=
 =?utf-8?B?eEJMOEJUUzJ6bk9PcnNUUndVOEdiYm54MWs1SnRoUjBCNDY3TnNHZUhPc054?=
 =?utf-8?B?Sk1VU3VnMmZqTHlDNlpzTHI4dS9yUlVwL3ZyUTdLbnlGTnJxcFdZUjhxT3pi?=
 =?utf-8?B?MHJpWk5Yblp0QnR6WTNzdk14bzdVT3YxOFM1UlhWWmszYXh1dlFxL1FwTzh3?=
 =?utf-8?B?SXp0MHpFMHRZbWhDYXhkOTRhbTQ5aVptSFhNSi9zMU9LMVROUGV5eW9WY3Nu?=
 =?utf-8?B?SzlDbXNFaFFleFBVU2FXSlZBS1l3ZnhQVVljN0Zjc3F0VEYycklONDhBQ2pP?=
 =?utf-8?Q?rLOcWn3rtB5WYqAp5haK4BHJyKtXvxcemrC1VTJAJ51T?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFpJbUR4TGhLdjVJSDhmNDdzZ1podVdma3IwUzB1SG5TbFNlQ1Z5elBUUTRG?=
 =?utf-8?B?L1Njc1NvMU92NlUxMTF1L0NsY1hUUWUreklvdk5ld21qRk03UkdKQk53RDVB?=
 =?utf-8?B?dGltMFkyNXVLRW9URWh1N3EyOE5lWjFNbEt4SEV1OE1hTUhkZXlZbFA1b2VB?=
 =?utf-8?B?Qk1ERVJieHNFcjgwM05vTTFmcTdpNGpiSVVDUDVMY3JkUUVlL2xuaGphV3lI?=
 =?utf-8?B?ZitCNndyNDhLVmNhYXFxM3JZM0xqeEtnbGVhSzNva3FMZnFKeTd6SWFaekp1?=
 =?utf-8?B?R3ZBWExHYXBNY2FXU1U2TU9DNitJTnAvaXpOai85QU00OUdNTjhXckNDMEVO?=
 =?utf-8?B?ZERFZkszVTRvMWZqb296K09kcEJZby9pd2NEYndWbzRGcFM3NkFHM2ZPcFFT?=
 =?utf-8?B?aXdYYmNwem4zV2JFUUF5dVFuWU1YMHVyYm4yZ0VmbnpzcmtOam1TN1ZaM1R1?=
 =?utf-8?B?OHdLTjVqNnAweGJsc2FsMnA0QTJUdVJuK2VNZXlEWGswRk05dkJSNHpKNG1o?=
 =?utf-8?B?Y0Q4V2lnUzNsUkM2cWoxN3ltbU5QbU5QTlZJRnNKR0pNOGtWOHhsWVFKRDRZ?=
 =?utf-8?B?TFVsU0xqbFkwQXk4VUcwdmF4SElUOVR3QktRTzR4bDU5WHpiTHhKM05ZMHBt?=
 =?utf-8?B?dnAwVUM5cUl3ZE1TTTBqc3k5aU9tRllpbmJMZGhzcFpMZVo2QzFSS3F0alRq?=
 =?utf-8?B?d0cxYmJ6ajVENUZuVWFmY0p3Wks2eEdGaWxxR3RBM2xTczZBSjNwZlhxdytG?=
 =?utf-8?B?bDZnMjU3MWFvdjg2Z0YrWVpYWGRQeDdkaDQ4NFZqUk9RMDFqbVFkZzN3cmNq?=
 =?utf-8?B?ZGNKTkMyK01EVkxSS1QvcFJmTmpXdjVzYi9CY1Qvb0YxUkRPQ296dVBVcEFN?=
 =?utf-8?B?YjZDTU4zOUxuTUVNZGc4SFdCVzRLWWJ5TGJKek5VTXpIRURZdCtianY5Y1Qw?=
 =?utf-8?B?a3ovS0JSUHRvWlBvc25lU0crMDdHRkw3Q05Pd0oweXZRaXp4WTdaRHNBME1P?=
 =?utf-8?B?ZHBmc2FUS1RNMlJLSnZCTEhxVm0wZG9nV0dzK1BzZHlrdWxVZlJVZDRvWEdG?=
 =?utf-8?B?MEh4Z2ZycHZCeTRUUUNzSU9iRDFEME94elQ2UHluVWdNcGJIaVpUVk9QOGJO?=
 =?utf-8?B?UUFmZ3k5K09uN09wcTRqQWZkbno5RGpxSDRIOGdhcXNrdEtHT1g2dkxrbmF6?=
 =?utf-8?B?UlJlK3hxa2hvN0lLaUIxZjRWdFpIclNWK0dXWWRqQm4rVWl3OG5pNmlpNnBL?=
 =?utf-8?B?R3VFUjM4NkJFZWhELzduL0VqN3pJbHMzTmdsM0hUZGpQQitleTQvTzlaQ29V?=
 =?utf-8?B?c25hc254MDU5UUw2aTBTelV6OUNkOW5BRDV4WXJ3MXpZbjVoYTFZc1p1N3RX?=
 =?utf-8?B?Y3pYK0IwYm4rOUhZY2lsbUNYbTgyZXV0ZCtkS0Vwb3d6M0hXUEhQeHhwa2hz?=
 =?utf-8?B?bmtwUUlHK216am1tNkxqTU90MmxVRm5leEJWRmE2cC9iSzR0OWZQQ3Q1dlZt?=
 =?utf-8?B?TkVTaUZzemhNbHkrNExoclZ3dWZpeDA0MCtMTDFOeW40cjZjOWZrbmpCeEQy?=
 =?utf-8?B?bkhqelcxTzZDV1JMZkRXeE4wc01id0xTRG9IcXgyUnQwbTZ6NkNYMjhtVFUr?=
 =?utf-8?B?djVRZVpHQm5Ucmt2QlFYdm96QXhuU2d4dlEwdWFTYkE3K2xiaU9xamJUbUlZ?=
 =?utf-8?B?VjdKcmlUcGxmQWhRbkU4SXMrT0lBY05OVEJ1NFhtRzZmOXpRMlRaeFN5L3hS?=
 =?utf-8?B?MVJib0luYVo4OXA3Z3M0dXJMTEorRjJsOWttK2NxWXR2aHBxYWp0bkdKSEIz?=
 =?utf-8?B?WFo5OU9hWFQwTnRIQkM0SFZlTmVzVzdnQ2NwWUtLSTdkZGF5WCs1RXErTTBu?=
 =?utf-8?B?S3cxYW1SbEZqRmV1L1RWNy9acXZldzN3eUhidEcyV1JlakR6ZUg0c2lNcmhE?=
 =?utf-8?B?bC9Wc1ZtQjJtTXBKelJLcFdFTU41aG1RZ2gyelZjN3M0N1lmaEpiSDZDMFJ5?=
 =?utf-8?B?VjVTWFZCMlZiaFJBQ1crRkNzbVhqYnJSaktWeVV1TlBlMmxEdDNDdkdpTXhx?=
 =?utf-8?B?dGhRRHNza014d0cwb0ljVXRDdG9Fc3NIVDZVdTRYZFl5NUJ5UG9rdE5Fc2hK?=
 =?utf-8?B?RWNEd1RLVjZHNnQ4c3RTcjlyYWphNTdrUFdycjFQYzdZWmVPcERtaTJJTFNu?=
 =?utf-8?B?aDljdEt6bnh6MlhPTzNiNzQ1b05neEd6T1UwWnIrek5waUxaVGpGUGxDSHVh?=
 =?utf-8?B?MFFkNSt4b2Z5aVhLdWlTSEJZUjNINGhzYXd1TmwxZ3FjMDNCOGJYN0hwYzZK?=
 =?utf-8?Q?1WOzeKw+kqiJVwTg6j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91005059-20d7-482f-2695-08de595c62d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 02:17:26.2963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7W6Q0p+WmutIKRgFhh4I48hX+4T0TzrS2Ewvf6sPp6HKmc6dHK9iQIRkHwLxMCC1zTdmeSAOXZa0aGa83+qbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10700

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMC8zXSBBUk06IGR0czogaW14NjogY2xlYW51cCBpbXg2Lzcg
Q0NNIHJlbGF0ZWQNCj4gQ0hFQ0tfRFRCUyB3YXJuaW5ncw0KPiANCj4gY2xlYW51cCBpbXg2Lzcg
Q0NNIHJlbGF0ZWQgQ0hFQ0tfRFRCUyB3YXJuaW5ncw0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYzOg0KPiAtIGZp
eCB3cm9uZyBzZXQgbWluSXRlbSB0byA0IGF0IGJpbmRpbmcgZG9jLg0KPiAtIExpbmsgdG8gdjI6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTExMDYtY2NtX2R0cy12Mi0wLQ0KPiAxMmZh
NGM1MWZkZTdAbnhwLmNvbQ0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSByZW5hbWUgZW5ldF9y
ZWZfcGFkIGZyb20gZW5ldDFfcmVmX3BhZCAob25seSA2dWwgdXNlIHRoaXMgbmFtZSkuDQo+IC0g
TGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTEwNS1jY21fZHRzLXYx
LTAtDQo+IDZhYWRjZGY5N2NiOEBueHAuY29tDQo+IA0KPiAtLS0NCj4gRnJhbmsgTGkgKDMpOg0K
PiAgICAgICBkdC1iaW5kaW5nczogY2xvY2s6IGlteDZxW3VsXS1jbG9jazogYWRkIG9wdGlvbmFs
IGNsb2NrDQo+IGVuZXRbMV1fcmVmX3BhZA0KPiAgICAgICBBUk06IGR0czogaW14NnFkbDogYWRk
IGxhYmVsIGZvciBzeXN0ZW0gY2xvY2tzDQo+ICAgICAgIEFSTTogZHRzOiBpbXg6IGFkZCByZXF1
aXJlZCBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIGZvciBjY20NCj4gDQo+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jbG9jay9pbXg2cS1jbG9jay55YW1sICAgICAgICAgfCAgNCArKysrDQo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9pbXg2dWwtY2xvY2sueWFtbCAgICAgICAgfCAg
NCArKysrDQo+ICBhcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZkbC1hbHRpNnAuZHRzICAg
ICAgICAgICAgfCAgNCArKy0tDQo+ICBhcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZkbC1l
Y2tlbG1hbm4tY2k0eDEwLmR0cyAgfCAgNCArKy0tDQo+ICBhcmNoL2FybS9ib290L2R0cy9ueHAv
aW14L2lteDZkbC1sYW5tY3UuZHRzICAgICAgICAgICAgfCAgNCArKy0tDQo+ICBhcmNoL2FybS9i
b290L2R0cy9ueHAvaW14L2lteDZkbC1wbHliYXMuZHRzICAgICAgICAgICAgfCAgNCArKy0tDQo+
ICBhcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZkbC1wbHltMm0uZHRzICAgICAgICAgICAg
fCAgNCArKy0tDQo+ICBhcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZkbC1wcnRtdnQuZHRz
ICAgICAgICAgICAgfCAgNCArKy0tDQo+ICBhcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZk
bC1xbXg2LmR0c2kgICAgICAgICAgICAgfCAgNSArKystLQ0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
bnhwL2lteC9pbXg2ZGwtdmljdGdvLmR0cyAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgYXJjaC9h
cm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2cS1wcnR3ZDIuZHRzICAgICAgICAgICAgIHwgIDQgKyst
LQ0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2cWRsLXNrb3YtY3B1LmR0c2kgICAg
ICAgIHwgIDQgKystLQ0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2cWRsLmR0c2kg
ICAgICAgICAgICAgICAgIHwgMTgNCj4gKysrKysrKysrKysrKysrLS0tDQoNClJldmlld2VkLWJ5
OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCg==
