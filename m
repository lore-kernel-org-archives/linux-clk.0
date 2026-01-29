Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DF337475A;
	Thu, 29 Jan 2026 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679100; cv=fail; b=ppOD9gsZLdrqBn1hZ59uRB4hP+Vq7WPAw2GiQNMsdmUYPkLtUU/toPPdZknzNFdgs1uoe6rCKVLg02jTaGxPQtk9TCUP6/0W4ujRY0onsJziJl92kGc1MSHLMAu5xXA9/LlOVEj4k+WOpmihvteEwhWxyUhy4N/rbvYZfLVwkko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679100; c=relaxed/simple;
	bh=5lkZSyNqBbZ4KQeap/dL8BlfHvGB1PyypuwblaLeidI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qU9HS3atHbN3TxYLkit0pqTmUP0kHHoxrFAR072nMuW4TVUH5+UBuQsMx7MCUi7yZYp5HMWjFzEicesQxcjDCXzVKeZmhk+dw1UgD/OJykeUCMcLkE9SckeuexvrlErD8bNYEonu2XCQZCeLuFHl+oIdJX1pQANNDI7770/0Xg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KzzCc9+w; arc=fail smtp.client-ip=52.101.66.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KzzCc9+w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr52dM7AJeE86k/hnen1P+a9GjRga8W+wfv2ZXWWe1o0OtrNhty0p+2bGXe6qajCWugjyAzM3Pf8/I0HoEEK+dd3+Q8PnEvap0VBR98cucIrSuyWvnnqme/dWauAGWLSshLSvTwWHGa5wDqH3o7yGIU0DNNDQTWpTyAHdE5mybcwSnZWbt5ywMQcKn5C6pGpvYOBBWW3szKp7TfQW/vZDZVOWBCRJPOuWf+LaYUDOvacUOkqJ7msReu54KU0R8aX2uauvUQYoS/86NVmiuVOCCCtyBPX0YHFvAfNcmjJlruxN3ANZvWsdQ/7LPJpL+3crj1m7/Stbi+5EZDWZlQLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lkZSyNqBbZ4KQeap/dL8BlfHvGB1PyypuwblaLeidI=;
 b=wGvsdaZq7dWsl9cpnhdTSuCj1HUJfQkubJBheCKQnZ2++S6C8tD0ihhwnjtq/S2lHrzFC3FmsGWG8LN3BIFWjLWIoHZCuN2XgoBXeMb9MP5h9hbFGFsP2EcTCgAf+f5l1JztduFOmJNfENCNPLVbupS5qSLpjkVcW7Et3isY5TjooF9Q6Zb74YIGiLErSVTaRjhRBARrYPwix8tD+1kSaGuapsPgjeDbxef+j12YDEdA8g1JEeE9KHaFiwfSFqC6MDUFfpfG954LbkOOTP5uxGWnQ4XTu89/rq4j1Eh9y7gQDu+/psDCWl20YUxQQbJshpLIKyzduwpQMMmOVXyGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lkZSyNqBbZ4KQeap/dL8BlfHvGB1PyypuwblaLeidI=;
 b=KzzCc9+wZk4Az73aWHNsXUUp3spA9kLHmZk4Hss8jY9KcGUNapEL9nBa/QgTigvRQ47sG5jEeju7u+gtprWi42V1CPEKDXnmFd0cWf1r9wIkIv2jR15EmbnMPc1dgu0HCVe776WKOcx8J93oGnH1SUyVhyXVc4T2JzxR4Xs+Kxu+uSx1oFG8LopoxeOxVLq1nZWcn2fBM5kBd692ECot8JdlvaNV7lNK9PUQ7G/1Gmx5fk/p2+DdpDkq9h9yZbRHGcZYc5eg63RDDOSsdyl84H7AjlPgV9OI0prFb4sIOxp9/JOI6OD1cCmainCaQjkgtmn7QfbtmPGm8JTZ7eDZXw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB9764.eurprd04.prod.outlook.com (2603:10a6:800:1d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 09:31:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 09:31:30 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>, Nicolas Frattaroli
	<nicolas.frattaroli@collabora.com>
CC: Mark Brown <broonie@kernel.org>, Alexander Stein
	<alexander.stein@ew.tq-group.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@collabora.com" <kernel@collabora.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "S.J. Wang" <shengjiu.wang@nxp.com>,
	Frank Li <frank.li@nxp.com>
Subject: RE: [PATCH 2/2] clk: imx8mp: Mark arm_a53_div as critical
Thread-Topic: [PATCH 2/2] clk: imx8mp: Mark arm_a53_div as critical
Thread-Index: AQHckIV/6YoX2YwVHUuWdH4yuAaNxLVo2GYAgAAKbPA=
Date: Thu, 29 Jan 2026 09:31:30 +0000
Message-ID:
 <PAXPR04MB8459171DC224B8CB1836613E889EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
 <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
 <CAEnQRZCSQ2o-P8ABCf257UzcYhojfg1m4d=oCmCxcCYWZ1AsGg@mail.gmail.com>
In-Reply-To:
 <CAEnQRZCSQ2o-P8ABCf257UzcYhojfg1m4d=oCmCxcCYWZ1AsGg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI1PR04MB9764:EE_
x-ms-office365-filtering-correlation-id: af382ff3-253d-4b2c-486d-08de5f192f56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWdLRVkyamd6TGF4eDZ2ZnZLc1VicWxzRVdxQXVGZGlQb05Lb2dTL3J0SzBk?=
 =?utf-8?B?ZWFiZWNNdG52Rm0wRlFQK2FRTkhNL3ZrWDdJY1BQcXlMK1VFNng0Rk16Z0hG?=
 =?utf-8?B?YWNsZWxIUjZQbDI4b2sxNXkzUmdVZnd3TGgwZU0yVUFWMUgxRlJ5b2NUUFY4?=
 =?utf-8?B?eU91T1pDVTNJZ01KaTArS3YxbUpiZmJFTVM5bG14NnNsU3RyWlYxNmhESHc4?=
 =?utf-8?B?dEZZQzZ6VXNxS0ozTXgxRE0zQUJNSUdqMGFIdk9Rb2MrZkZ0bVZZTllDZDQ4?=
 =?utf-8?B?VkRDaUN0bStQK0g4RGNyTTN1S0tzN0ZkNkRWMnNTcG9DY2tkMUlGS01yRmdm?=
 =?utf-8?B?dTdyNEFQRFA0ZzFjaDhDQ2lhcnJNeFQ5eFRMZG5neWszNWRuc2FHRFo4R2NL?=
 =?utf-8?B?UVVWSmU3Q09jK0RkaThqelNqN1FzUmZubDJkK0N2UFYvODZMbGd0eFlOSmVn?=
 =?utf-8?B?eXNTb0RLaWF2NldlL1Nhd3lJeHdPTXVwVFlzd2loTzJJdDdvdWd0WXdsd3Fw?=
 =?utf-8?B?VW4yUHd1NlZjaDVwbGoxYmhLSHpFRTIxdzh5MGRLZXVKc2xZbUJHejRMaVp3?=
 =?utf-8?B?ZXdZT21VdjgyWEV5WURlY3p3dHFoUVJMSnNjdk8yRGQ4ZStJY3l4YThUek5p?=
 =?utf-8?B?V1BZZGVWcEs2TjVwakxDT0dLOUgwU1N0TEpvZnhVa1g3VVBCYWRaOTZ1ZC90?=
 =?utf-8?B?QlROWjIwejhhSUQzNit0Ly9wZXJBdE1LbWhiN2VVcklTM2xIN2FNcFQvNVJH?=
 =?utf-8?B?ck10UldDS2dtQXRmWCtyT011eXhZWW1YS2t6OW1KeTJJVWtzdjkyVTZpOXhh?=
 =?utf-8?B?Q3EzQWwvVUhLQ2M0dmQwckprdEw5a3cvVFlXWmpyQkN2TVpPbytoUnc2NHE5?=
 =?utf-8?B?NHRPWVZNQ2dQSzBxOEVUMVgzeFdVbWw4NUx4N3ZZb1VjM0dqbnpycVcvR3F3?=
 =?utf-8?B?emJVU1JzcHo5b3ViMWRhYUYxaVduU091NFBxajRGb3BJK2h6cnhlN3daanNY?=
 =?utf-8?B?NnBObjFUdnlNR0o1V3hWQ1EzUEJyMzNzeFRKNVB1ZlRiUzhtcnd5MlROdTVC?=
 =?utf-8?B?L0trbWtSR2h6L25QSjhib3hWSTBFSkNwaUJQQ0hMOGhiTy8zT0VFazZNdDVu?=
 =?utf-8?B?a0dOblRocTRuZnljUFNJYXdxS1ZwZVdQbS8xUDlwR3M4VVA2VXVnZ3FaRGNF?=
 =?utf-8?B?S1ZKVUtzNWp5TVVDcU5zVmNKdDZlT3ptS1lZMHpwUVVtcXpwNHRmRHFnOXFX?=
 =?utf-8?B?UHhKM2JLSzN3eFd5V2o1M1lYM1VtVk1ncWUxZ1RVdHdZRjJCdVVxMnJ4bGZu?=
 =?utf-8?B?MWN0T25sRGJ5UWtBUkJ0elN1eUZwc2JDZytsbTZzZHFISkpYREdRYkFPdjlG?=
 =?utf-8?B?N0FMbDRSeUUweC8vMTJmcmJxWnR5MVF3cUUzZi92Q2c5YjVYU0ZZZmFtWUdB?=
 =?utf-8?B?VklWY1FsdVRuVGxqVm9ZOTY5ZzRDeG9VTnREclcxUSttRHN5SUR5cXJOQmdX?=
 =?utf-8?B?T2RsU1VSeVZndUs3T1U4cTRZdFBLSHcrV1R5UUJMN0Rmc2ExWXlhTlRmSjZu?=
 =?utf-8?B?bVJVYWY2WWFKNnBqdS82M1hyd0ZHREhsY1ZtWFRsTHJ1U2Y1ZmszMmw5SUZB?=
 =?utf-8?B?REEvRWhLSGg2S2pwdHZIajFGTFNkMHZ6Yi9pQm1nckNPZmZpeUY0d3lDUFF3?=
 =?utf-8?B?SnlZdCtjYTZ5ejRMK3V2MW5ROUdaMTM4MjBqNmJ1WmVMWEM3U2JMb2V3MkQ1?=
 =?utf-8?B?Q2t2dGFUQ3lKVzdiUzlKS0FwYVZWa0FybE9wU1VOR0tqVzlGaktGc1l6TDVv?=
 =?utf-8?B?MmJlWEJaUE82dzZyNnhRRmptYkwzb21TbmUvdmVJVUlId0FBYUorZ1ZRV1ZT?=
 =?utf-8?B?b3VsdERnb3RsOVZGSEZFeGdndXdtNG9OZWd0WEZPc0pTc0xTejBNTmhQTGMv?=
 =?utf-8?B?QU54TUdZUmNpUlFseUhUTWNHVzZoWUd3cnY2ZldhRlhlbS9tVTJ0T0lzdmtw?=
 =?utf-8?B?OHZLeCs4OUJiaWk3Y3RCT0VWSmplamxoMnJjZlhHZFB6UEFlNzB5QVlDYmlI?=
 =?utf-8?B?b1U1YTl0aHpNUDB3WTRmemZlZzRkaHZ4Njh2R3BTK1VjeE9kRVJ3WnBtR0g5?=
 =?utf-8?Q?pdu4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1plcFM1RER0TG41UE9QZUJ5enYwaWo4eHlkOC9XOFFCYVorZDBxQ3Vyb09E?=
 =?utf-8?B?T1NHOElsVUlkbHErMTVscDFRWWxtYlBhU2Y4YmU4bk5mcnkxUExoaFNRQzY0?=
 =?utf-8?B?VHd3Tm9xUE1tWStBSEVoemlGdmdzeU1iZ0tERkcvblJ1V1hpby90Yk1HM2l1?=
 =?utf-8?B?RW5NajREbHhGTEt4STJUVjVOUlNMQkFsNDVQdkttU3NNMnlPK1czY29BdmpG?=
 =?utf-8?B?SnFIYndRMHQxSUErU2xHbVlveUVadHhTbjZRRThiVHFvdUNibVdCcFFjNGx4?=
 =?utf-8?B?b2Ribm5nbHhRYTU0UmQ4YWtqUGd1TFB4Zlh5aS80b2plbE54VWFxT3BNS2dI?=
 =?utf-8?B?OHJqaXUxKzF1d1d6Sy9vNm9HaWFIVkV3ZHMxZzdvREdMeFhkMmluMU16L3dW?=
 =?utf-8?B?YjR0aGUrcUpUK210aFRwcFhoYStDakd6NTJEdzZHQ09XNmordm4wd0l0VFRq?=
 =?utf-8?B?TlVTVk9lcC95dEdtQTcrbzIrUjJxNzZrcFZFaWhZaGRkcGVITmx0T0VsakRE?=
 =?utf-8?B?VDhHWWtvUTJIM296NFc2U28wek00aEV2WUZyNWtOYy8rdE5oODA5ZGhLZFhm?=
 =?utf-8?B?aWQyOVhXcWtObE01QVYvRFZtRVJDMTVPWlRGWHZZdUpoRWU2NjVQV0FEZXlp?=
 =?utf-8?B?cG1XcEhjTTdKbjhHMmlhUTc2ZWFraUpJdUtYZjREcFdTMkFmYzBjS3VkRzhW?=
 =?utf-8?B?Nk10M2l2ZlpReEN1L2llVE5qcllIMGR4aHluaHpqanVYaFkyaUU0aHJWbitQ?=
 =?utf-8?B?VHZ1VDNIY3FBT1RHbmpwbmlqUmJCcWlSV0dGampjL0VnMFRXMTBwOTYxa3RH?=
 =?utf-8?B?NCtjRDZYNnZLNE9lTEEzUU5MTGtSWUhiVU9nY2NWTGZ3N2E4WnhTaldKUWJm?=
 =?utf-8?B?S0xkZVZjME1qdnRVT2JMRXZDTUhZTC85QWRzUkZFbEk3bjg1NC96aGVtc1E5?=
 =?utf-8?B?T2JFK2lmK3JFcDZnVHVtVVBzMFZGbjI2RVIxNDU4ZDBOMEJYM2x0aWlYVERs?=
 =?utf-8?B?UmJ1TEpaSHlDcjRHR1ZKV25qNFlYallnWW8yc2tIYW5TTUJNTW1MVW5pbGhi?=
 =?utf-8?B?aWcra1htNkNqSnpMeWNDRnBXQ0FiSXhlcU9Qc0JHRkNLUFgrcHJGMldPdU8z?=
 =?utf-8?B?bzZrSFc1Z0tWR2d4TFdrTVRrY0VBMGFtSWtkY2g2Z0d0ak9paXF1YkYvM0Qz?=
 =?utf-8?B?cnpHR0RuQ0JweWNrNFc4VGEyb1JkTi9CUGZ5OWtjNzVVWDhvUWJaL2hxcXFo?=
 =?utf-8?B?VE43c0d1Qkc1ZGNJL0xxdkgyK2ZINFIvM0ZEMDV1UUh5RDMvN1lMeTFzc2lh?=
 =?utf-8?B?emZ4N1FpV25RZEo3Q2IvbUpIM3E5V09WMFBNd0xZay8xZGcxR0JhMlNWMkhi?=
 =?utf-8?B?RDdnK1RJbzZvc3prZW5keVpsTlZGRVFXU2pjMERHbVJ2TENPQW5TTnhlM2Fv?=
 =?utf-8?B?amZzeEl5VCtjdmh5MFEzUjVnZWUvNTFZdkZDTlhvQ0dhYUlNc1o2Nk1Zbk5I?=
 =?utf-8?B?SlRmdlR6R21TWG9MajFJdE13R2VTV2hLa1RIK2prV05sRUZHVTlMSmhDTW02?=
 =?utf-8?B?TFFTRG9KdzROenlxTk0vNHdVa1ZUZWpRL001UDRiOUVHUDJDdE4wUzFhSm44?=
 =?utf-8?B?UkRjNDJPSXFUYURqdWRRVGFnZnIxWlRTclRhbUdSZnZIcXpWM2pQNVlIR0Js?=
 =?utf-8?B?Wis4UnY5MU45bldGRVZzR3hmL3dZU3VJVmJqdytWeHhGek82bFZZandMYnMx?=
 =?utf-8?B?UUtvZ0x3eTNacDA5QW5hRitUejRTa1VIZy9zTEhNZ1E0a3VySFZhejlGNFdQ?=
 =?utf-8?B?TmhqZWZzVXp3R015enhsbDdIK1RUQkxJTWtkNVRVRXU5NGpxeGVoM0J1TmtZ?=
 =?utf-8?B?ZDlKME40dXBLNWFOUTNWYVdwSWRPc1F4U0loeEdNeFZPaDloSWsvQUZGRFQz?=
 =?utf-8?B?VzhnaEVVOUtHN3dqclJEVUFhVmxjbmlTdk91TGoxVUJZMkhGUThFVUN4T0pt?=
 =?utf-8?B?UzVvOWFtcFFlVWhLQ1ZHTlJaby94VUlaTnVTRkExQ2xNMlZWc2Z0YVBVRm4w?=
 =?utf-8?B?dXZDdGR2YXI3Zm1aZXQvSnZiSjhhbUlndW45Y216UC9ydkUvRjBEN3d3WnBN?=
 =?utf-8?B?TGRqT2tCMkJHaVJIVmxKTzhjZkxmZzhndXRFK3FDMG1PNjY3WnpWL2xkTnJ2?=
 =?utf-8?B?UEtxb3YyT3FpeHE2SHdscENKbFk5bUtnUDY5dmFXbnQ1RkVPZERIOTZvdVlr?=
 =?utf-8?B?NHN5cU0wNWdWL1lyY25IRFR5OWxIbUZxQnI1VU5ZOUxjRmt3MWNuTGU1VVcr?=
 =?utf-8?Q?nXvyQIY9Z1GgcoR7YR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af382ff3-253d-4b2c-486d-08de5f192f56
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 09:31:30.5730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTPR4Fk0CP1Mbdht48EDpv4wbtzqmfb8n97IyIp7LR0zJ6JMkSc9mr+tAeh5Fz5HnpjY/vX8TYyp+05slc9MTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9764

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gY2xrOiBpbXg4bXA6IE1hcmsgYXJtX2E1M19kaXYg
YXMgY3JpdGljYWwNCj4gDQo+IFJldmVydGluZzoNCj4gDQo+IDY2OTkxNzY3NmU5MyAoImNsazog
UmVzcGVjdCBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgZHVyaW5nIHJlY2FsYyIpDQo+IA0KPiBNYWtl
cyBldmVyeXRoaW5nIHdvcmsgYWdhaW4uDQoNClNhbWUgcmVzdWx0IGF0IG15IHNpZGUuDQoNClJl
Z2FyZHMNClBlbmcuDQoNCj4gDQo+IHRoYW5rcywNCj4gRGFuaWVsLg0KPiANCj4gT24gV2VkLCBK
YW4gMjgsIDIwMjYgYXQgODo0MOKAr1BNIE5pY29sYXMgRnJhdHRhcm9saQ0KPiA8bmljb2xhcy5m
cmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSXQgYXBwZWFycyB0aGUg
aS5NWDhNUCBkb2VzIG5vdCBsaWtlIHdoZW4gYXJtX2E1M19kaXYsIG9yIHJhdGhlcg0KPiB0aGUN
Cj4gPiBwYXJlbnQgaXQgZGVwZW5kcyBvbiwgc3lzX3BsbDJfNTAwbSwgaXMgYnJpZWZseSB0dXJu
ZWQgb2ZmIGR1cmluZw0KPiA+IF9fY2xrX2NvcmVfaW5pdC4NCj4gPg0KPiA+IEluIHRoZSBwYXN0
LCB0aGlzIGNsb2NrIGRyaXZlciBjb3VsZCBnZXQgYXdheSB3aXRoIG5vdCBkZWNsYXJpbmcgdGhl
DQo+ID4gY2xvY2sgYXMgY3JpdGljYWwsIGFzIG5vdGhpbmcgZXZlciBmaWRkbGVkIHdpdGggaXRz
IHBhcmVudCB0aGF0IGVhcmx5DQo+ID4gb24uIEhvd2V2ZXIsIGFmdGVyIENvbW1pdCA2Njk5MTc2
NzZlOTMgKCJjbGs6IFJlc3BlY3QNCj4gPiBDTEtfT1BTX1BBUkVOVF9FTkFCTEUgZHVyaW5nIHJl
Y2FsYyIpLCB0aGlzIGNoYW5nZWQuDQo+ID4NCj4gPiBJbiBvcmRlciB0byBndWFyYW50ZWUgdGhh
dCBpdCBrZWVwcyBpdHMgcGFyZW50IGVuYWJsZWQgZHVyaW5nDQo+ID4gX19jbGtfY29yZV9pbml0
IGlmIGl0IHNldHMgdGhlIGZsYWcgQ0xLX09QU19QQVJFTlRfRU5BQkxFLCB0aGUgY2xvY2sNCj4g
PiBtdXN0IGJlIG1hcmtlZCBhcyBjcml0aWNhbC4NCj4gPg0KPiA+IEZpeGVzOiA2Njk5MTc2NzZl
OTMgKCJjbGs6IFJlc3BlY3QgQ0xLX09QU19QQVJFTlRfRU5BQkxFDQo+IGR1cmluZw0KPiA+IHJl
Y2FsYyIpDQo+ID4gUmVwb3J0ZWQtYnk6IEFsZXhhbmRlciBTdGVpbiA8YWxleGFuZGVyLnN0ZWlu
QGV3LnRxLWdyb3VwLmNvbT4NCj4gPiBDbG9zZXM6DQo+ID4NCj4gaHR0cHM6Ly9ldXIwMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGDQo+IGxvcmUN
Cj4gPiAua2VybmVsLm9yZyUyRnIlMkY2MjM5MzQzLmxPVjRXeDViRlQlNDBzdGVpbmEtDQo+IHcl
MkYmZGF0YT0wNSU3QzAyJTdDcGVuZw0KPiA+IC5mYW4lNDBueHAuY29tJTdDZDk0ZjgwNTgxMzY0
NDMwY2JhMjYwOGRlNWYxMzdhZDQlN0M2ODYNCj4gZWExZDNiYzJiNGM2ZmE5DQo+ID4NCj4gMmNk
OTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzOTA1MjczNDQzMDU2MjkyMSU3Q1Vua25vd24NCj4gJTdD
VFdGcGJHWnNiM2Q4ZXkNCj4gPg0KPiBKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1
TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWsNCj4gRk9Jam9pVFdGcA0KPiA+DQo+IGJDSXNJbGRV
SWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT14T1h1MUpDTHdwa3paaTdwMg0KPiB5WG9C
WXBTa25sV25YDQo+ID4gaVFWQ0Z5VGx1OHJ0RSUzRCZyZXNlcnZlZD0wDQo+ID4gU2lnbmVkLW9m
Zi1ieTogTmljb2xhcyBGcmF0dGFyb2xpIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNv
bT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4bXAuYyB8IDQgKysrLQ0K
PiA+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLmggICAgICAgIHwgNCArKysrDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4bXAuYw0KPiA+IGIvZHJpdmVycy9jbGsvaW14
L2Nsay1pbXg4bXAuYyBpbmRleCBmZTZkYWM3MGYxYTEuLmVlMTBmODQ1ZmFmZg0KPiAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhtcC5jDQo+ID4gKysrIGIvZHJpdmVy
cy9jbGsvaW14L2Nsay1pbXg4bXAuYw0KPiA+IEBAIC02NTUsNyArNjU1LDkgQEAgc3RhdGljIGlu
dCBpbXg4bXBfY2xvY2tzX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gICAgICAgICBod3NbSU1YOE1QX0NMS19DTEtPVVQyX0RJVl0gPQ0KPiBpbXhfY2xrX2h3X2Rp
dmlkZXIoImNsa291dDJfZGl2IiwgImNsa291dDJfc2VsIiwgYW5hdG9wX2Jhc2UgKyAweDEyOCwN
Cj4gMTYsIDQpOw0KPiA+ICAgICAgICAgaHdzW0lNWDhNUF9DTEtfQ0xLT1VUMl0gPSBpbXhfY2xr
X2h3X2dhdGUoImNsa291dDIiLA0KPiA+ICJjbGtvdXQyX2RpdiIsIGFuYXRvcF9iYXNlICsgMHgx
MjgsIDI0KTsNCj4gPg0KPiA+IC0gICAgICAgaHdzW0lNWDhNUF9DTEtfQTUzX0RJVl0gPQ0KPiBp
bXg4bV9jbGtfaHdfY29tcG9zaXRlX2NvcmUoImFybV9hNTNfZGl2IiwgaW14OG1wX2E1M19zZWxz
LA0KPiBjY21fYmFzZSArIDB4ODAwMCk7DQo+ID4gKyAgICAgICBod3NbSU1YOE1QX0NMS19BNTNf
RElWXSA9DQo+IGlteDhtX2Nsa19od19jb21wb3NpdGVfY29yZV9jcml0aWNhbCgiYXJtX2E1M19k
aXYiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW14OG1wX2E1M19zZWxzLA0KPiA+ICsNCj4gPiArIGNj
bV9iYXNlICsgMHg4MDAwKTsNCj4gPiAgICAgICAgIGh3c1tJTVg4TVBfQ0xLX0E1M19TUkNdID0g
aHdzW0lNWDhNUF9DTEtfQTUzX0RJVl07DQo+ID4gICAgICAgICBod3NbSU1YOE1QX0NMS19BNTNf
Q0ddID0gaHdzW0lNWDhNUF9DTEtfQTUzX0RJVl07DQo+ID4gICAgICAgICBod3NbSU1YOE1QX0NM
S19NN19DT1JFXSA9DQo+ID4gaW14OG1fY2xrX2h3X2NvbXBvc2l0ZV9jb3JlKCJtN19jb3JlIiwg
aW14OG1wX203X3NlbHMsDQo+IGNjbV9iYXNlICsNCj4gPiAweDgwODApOyBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbGsvaW14L2Nsay5oIGIvZHJpdmVycy9jbGsvaW14L2Nsay5oDQo+ID4gaW5kZXgg
YWE1MjAyZjI4NGYzLi45N2NhYzFkNjIzY2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsv
aW14L2Nsay5oDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvaW14L2Nsay5oDQo+ID4gQEAgLTQ1NCw2
ICs0NTQsMTAgQEAgc3RydWN0IGNsa19odw0KPiAqX19pbXg4bV9jbGtfaHdfY29tcG9zaXRlKGNv
bnN0IGNoYXIgKm5hbWUsDQo+ID4gICAgICAgICBfaW14OG1fY2xrX2h3X2NvbXBvc2l0ZShuYW1l
LCBwYXJlbnRfbmFtZXMsIHJlZywgXA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIElNWF9D
T01QT1NJVEVfQ09SRSwNCj4gPiBJTVhfQ09NUE9TSVRFX0NMS19GTEFHU19ERUZBVUxUKQ0KPiA+
DQo+ID4gKyNkZWZpbmUgaW14OG1fY2xrX2h3X2NvbXBvc2l0ZV9jb3JlX2NyaXRpY2FsKG5hbWUs
DQo+IHBhcmVudF9uYW1lcywgcmVnKSAgXA0KPiA+ICsgICAgICAgX2lteDhtX2Nsa19od19jb21w
b3NpdGUobmFtZSwgcGFyZW50X25hbWVzLCByZWcsIFwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBJTVhfQ09NUE9TSVRFX0NPUkUsDQo+ID4gK0lNWF9DT01QT1NJVEVfQ0xLX0ZMQUdTX0NS
SVRJQ0FMKQ0KPiA+ICsNCj4gPiAgI2RlZmluZSBpbXg4bV9jbGtfaHdfZndfbWFuYWdlZF9jb21w
b3NpdGUobmFtZSwNCj4gcGFyZW50X25hbWVzLCByZWcpIFwNCj4gPiAgICAgICAgIF9pbXg4bV9j
bGtfaHdfY29tcG9zaXRlKG5hbWUsIHBhcmVudF9uYW1lcywgcmVnLCBcDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgSU1YX0NPTVBPU0lURV9GV19NQU5BR0VELCBcDQo+ID4NCj4gPiAtLQ0K
PiA+IDIuNTIuMA0KPiA+DQo+ID4NCg==
