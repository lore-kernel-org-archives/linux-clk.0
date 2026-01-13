Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B69B29DB6A;
	Tue, 13 Jan 2026 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336386; cv=fail; b=DJwtQdD2bRbreoFV4dQ/iocDKrld2lAJii0Tqz98Nx1rTzt2Wkbtl4xaGHgoNu3ky9wHIyi2gyaSCejfU9nZU/oUI5Em7wtizoca29AKO6EqT5pZzaC88An3oHsJCa2cNT7JAE8tPZ4qVNLt5pwhcfolYzR9wvWrPXBEGmuZ5to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336386; c=relaxed/simple;
	bh=+7ifFpxlZQOlEtFWstJdv5Mm+UZHX31igcQ70DRIcOo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XbzF8dS5OI0wNyU2tWiCTC6N7JS1Ilc42yYKLjsquP39KuAu9ZNa/CyU97buzLoYS8USV1zIpfeYlW0yP9yp+0WAIyy9sfcW9QKASRBmAMf2Ssw/lc6RmJzxY9J/8hILd95h8e1f+rh4M2GefeftpuRxvmCaP/vxsVinEXPgj4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dp6eeWre; arc=fail smtp.client-ip=52.101.84.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dp6eeWre"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wj1fHd+geZFIlNx4J3mi+eAzLETk+bVz7Sr9bEIH06C7Yn6Fgf+5MsjsRkynCL8H5PuyCEaHEK84l8PR4dI3Y/7govi/zGZgivpH6dZTVbB95dPq+AhsJGaFa0Q5mmKgeKNMpNxUJ8V9mZkZeT7QsMZaqOIY/x6prCMHP3RpsbgntGVhH7Wr4gj30VyuimP07KYH330BtHP37mPujwRERkmGj+Q1DH2Q03lauT9OTw9XQTU5ujq84a3E4ThLpGEA0E7hxisTY8m4lY/9Tz+iFuyuRO1IQMvGGtLIuQhPKwJ6l2GRF4KULczmsYHNLdb6pIKw7By3WMU7O9JtXO07Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7ifFpxlZQOlEtFWstJdv5Mm+UZHX31igcQ70DRIcOo=;
 b=wRkPHF5RhXdCw7L58ElFV8mN87ICBFDtLngCGvz+xX34cuEavvmpoiqyJU1ZzX06EwKBPD3N62s8MdmiLVKM5LpDitl6MIgSJ0A6n6m9qh7YYYYt9zH44/CtxsMWuznWzWCV9cl1MJ1KPNaRnOIGpbwPmNtlWyxDUn/5HoR+znzYnwEtAYdZb2m8d1j+XuNpTPfs7gke3L2ELwLTW69vypuSX4+u0qinz1bRCDH1sXZx7atlvI9l02ymO6EA2056I1cP7xz6gYznm4HyEeqXMYNbpk4xl6xZRELj1DlmrGvmCji+O3jimIdfIGfnZqtjqCWJuJKm3HwLMea0jF9J6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7ifFpxlZQOlEtFWstJdv5Mm+UZHX31igcQ70DRIcOo=;
 b=Dp6eeWreTBrw0XZ1HuQK0618Log4ktY39fREZNLx9UVwhdI3zYP/TQT8yh2zVHS3k2IZF8wmrx/kXA1yGIotfyNuGfZWFaPSAf91gHiMy4k7GBU8v7oTGFAWUmaXuDKhhCdASz4zpVWReO7onswIK8+UVscn9ZgbX3MRxVUo3K0HHV3IoXsVAezW6P1n+X5dwR2xSBZ6l7cwAV20lC8kpHnNZjnEkRzTxdyceC1e5uAmJBaiW8+Fyl+LdaluSzm9jJT3bpjJlzVdBBPB9IWomEb8FkJQ1PQpx966woRTaZOQSu8X+/mXaydj6bwVBWJ69VmyZsJtANcGaoqJkQwb2A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 20:33:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9520.005; Tue, 13 Jan 2026
 20:33:00 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>, Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Primoz Fiser <primoz.fiser@norik.com>
Subject: RE: [PATCH v3 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
Thread-Topic: [PATCH v3 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
Thread-Index: AQHchJxO90bqp3z/8UK6rgiWhccWdrVQjlGw
Date: Tue, 13 Jan 2026 20:33:00 +0000
Message-ID:
 <PAXPR04MB84593F3DE672EE3BD6733F34888EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References:
 <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
In-Reply-To:
 <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA2PR04MB10088:EE_
x-ms-office365-filtering-correlation-id: 588beb26-dc0c-4257-1d0e-08de52e2f190
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|19092799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFd1eWloUHVUYU1WYlZRenl5VlNQUnZqcjRTaC9MRC8yRHBCanorNmZ5REhl?=
 =?utf-8?B?TDNQNHdmUnJCYkplRmxHVStSSDlJblp3a3FoSTc3VGVzR1ZjRE1hZE9hc2hL?=
 =?utf-8?B?WTBHVU1pZDJzQitYbE1vTXI2Ly9PS1VBcGtUNnd0T2JRcFJqVlZIWVVQMTF6?=
 =?utf-8?B?Vk5tMmpVY1B4MmlzL2lMMzFqQ2EwV3pxQS9kaHAyMlVVS24xTlZiYzNaWDdo?=
 =?utf-8?B?ajdjNzNwSUU0WnlpOHNBVkNJK3UrOEI3SWErL0JoOFovT1cyMFhsR3V1MVVF?=
 =?utf-8?B?NlVKTUxodDRZL2wwYy9neWFabmNkQW1NMUV4K01VTERaV3lDRk0wWXdlNE4v?=
 =?utf-8?B?Z1JjYXVKQXhqUnlCZSt0bDB1Nk5RcWFSL2Yzci9JVDRqUGsrZ1lmY1FUVW0v?=
 =?utf-8?B?VUJoamRDZGRaQ1BlVnpZQmNKZ2NxSG94bmVHOGVOR1Y2ZE9HdlhDQitHMEJz?=
 =?utf-8?B?b0lJclFQNXd1ckVOZHpGY2xqN2x4YzdFbFZBTTRmVGNBamVRTlV6cUU3MGR3?=
 =?utf-8?B?WjVIY3RydXdJZUlrampkQmRwSVhheFcrbVhoSlFCNkVuNGoyZEZQMnNxT1ZC?=
 =?utf-8?B?TmNMMDZvUkFOUzlIRmZvaDdQZ1JWNUhJVWdSQ0llKzQ4VC8yNjRIWnJWbk1Z?=
 =?utf-8?B?cDJYdm9CcXp4SmgrUTBtSTZ1bmlvblVjRXBOcEMrZGkyTDA5UXpmQStKY2pp?=
 =?utf-8?B?ZEhzVzBONzMzdDlXL1lxWEtrd0pUNEpNOFBTdFFnTjk5OHh6eXZVVzFYK2FY?=
 =?utf-8?B?c1dHcFpVR1BLejM2SktZVE1DS3RucG8wQU04UVIycTF5Z01ldmZHMVBJc2cv?=
 =?utf-8?B?c0xCdVozVXl3UWo0RDZ0MmovRUw0N3pzZVplL0dqMkxCQVBzeDFWQ3NFSmR5?=
 =?utf-8?B?RGNLNDRJR2MzU214bGZMb1NhdDZETG0yRnVjRit3ZFE2UWorZHEzYVcwRUsx?=
 =?utf-8?B?TUpVMm9HdHVDclJGaXMvU1A1RHJ0M3RuUWlvTEJLK25MQzdKbHFFVVdMc1dk?=
 =?utf-8?B?MGR6Z3gxenFXNWdaaU5GUGlLRTJLN2oxWHlLaHRlNmJaUGFpbFBDVEpPTmll?=
 =?utf-8?B?ODRUM2JiZDVpMFRTa1BnSWVMUGtZRmZBUmcrS3pPS1J6S0JLR2RUK0RZUnBN?=
 =?utf-8?B?U24wSi9KRG8wcTYvanJlM2tUelE1M3AyY0pBYytqSU5QelZTU3BFSXFrMlR6?=
 =?utf-8?B?QmY4bHdEelRCME9QaFZOVExEWGlsc2U0c3BOZ1ZmL2JYR2FXK0FMbDJSOVZs?=
 =?utf-8?B?N0tiTGVtb1hUN0JiUTNjeDNWOHJiUEtTRTl6RmJQNnZmZVJuTGVUNG5wSWdm?=
 =?utf-8?B?RHFJUXpOeld2Z0ZtMDZnWDV2d0tyR3B2RGhNZ3F2VEt1aE13WE9vNzVXNTll?=
 =?utf-8?B?WHRZWXNQbW0yNkVvSmVTSzQ4akd2QStpVUlrekRzMDhvY1Ftb3JGMThYMEJT?=
 =?utf-8?B?c3RpMEJoZWlhTVZ3MjFYL2pXb09UeFAzUlRZUXFZLzMwRElqZ3VoQTR4ck91?=
 =?utf-8?B?WXRPVkJYTW9tTEZtSVc2dnNVcUIxaDBVaWlmanJybzFjak5ZOUdxY294RktE?=
 =?utf-8?B?YjRTM1VKbTBTejFUUjVYblZKMklLdDNsWVBGYVFSYjJ1dHhBbmhHd1o3OWEw?=
 =?utf-8?B?czhnZ2xqRnZwOXM4ZUxocDVlVUJuNTdGNmtUYXhkZllNaXVnVUtGU0dCOWlr?=
 =?utf-8?B?SWd1MVU1TjN3ZGZXQ3pZRmpRWG53cDhaNkpqOUlSZkFoY3FKcUdwMUg1OWQx?=
 =?utf-8?B?N1ZGeHR4dEN6b3BiWVM4VlVMQm1WYnlScjYwdW5DVEs2ME1DNVpvUmJtWS9P?=
 =?utf-8?B?RUowdCtxbjh6cHAzaGVwVEJpSndXOFVnRFhtZC9Qd3Bnb2o2cmdodjlkM1J6?=
 =?utf-8?B?WmlYTzJuV013My9WcGo5eDNsRCtGZmJFdjNqdG1uZTJyc1Q5dUlyTUk1eUZM?=
 =?utf-8?B?cko3Syt5Y0tJWGN4RlpkcmhZSElsV0Rxb2JZQkxuQVZWUUtDZWhIc0cwc2Fr?=
 =?utf-8?B?WmFwRjIzQnp6VVJRVjV0QnNqVUJGNmJRMzZWa1lEeXNsMGZBTDlrdzhMRkR4?=
 =?utf-8?Q?gJspP4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGZ0YmhjaHBkUTN0S2hleTU0bHRscnRkdFhIV0J4eXF6MWdnRk9KR1BpdVFp?=
 =?utf-8?B?MVNDUTFEVmRZbUMrRVNVSTFqamFjUUFMc09Vb3kvNG5vR2hsRkduRW94Nnpl?=
 =?utf-8?B?amRpQzBRejVHV0NYaFU4Q3hRamRXZnY0WFo3TW83YkRSMW5GamZ4a2x3Vmdz?=
 =?utf-8?B?Z21YdHhnVC9EenMzMXRiblJMaHBHUFJuK2RFN0xpZFZyQUZObkNSdENLbWxl?=
 =?utf-8?B?WDhNRC9YRmIvQklzdXg5M2xDTTVxVVRrTkcxSTFYaHI0blBodzFOVExMVVdj?=
 =?utf-8?B?WVdWQmdjaG1PNVVxc25DU2xsWlBpaWlxZUNwZEpNRGlpdWlMM3RmNms2ZWN4?=
 =?utf-8?B?RVdvdkE0Q0g2MnlFS01tUmRZbjRIeUl2dWlwbFRRWW80N2FBTGxHb3VKUllP?=
 =?utf-8?B?Z2RJOXRGbi9zaDhabm9VOUp0NW9RR2J2YytLUW94OTJ1Yis0bmlJQzhLdUtY?=
 =?utf-8?B?T1F3d1l5YkhIZDZGUEFneHBZZDYzQWNIUEtHVmh5YW41SDM2M2ZTZ3lNRDJo?=
 =?utf-8?B?aC9MKzY4ZkFhRncyOTNNbHB1OFNwbUhNazVmeHhKVzZvZFBMZWxKQ2M3V1VE?=
 =?utf-8?B?VCtqbTZKNmJPbThKNDNseU5ENzdTdWY4OU94NFhTR0lNUmpSdzVqb3daVEdq?=
 =?utf-8?B?Z3paQWJZMUlCam54azVCTWl5SWt4blRCOXJGTGhNOW55R0ExQ2pQMWJVRndY?=
 =?utf-8?B?QXplR2tsNWF5R3MzV1NyS1NaZzM3RVIvSTF1VHlCSnpNNCtLWk1OMFp2bDFK?=
 =?utf-8?B?a1BZbCtyNzB2dTFrZzg0aFc2NWo2TC9YVTFHbVhmREp4Vk5BLzYzUzlSWk1x?=
 =?utf-8?B?VVd4NU9NOUUvYXpncmg5RHlGNmJBaGJEUjNEaDdNQVdHc0FaZmVpZ01OTlVI?=
 =?utf-8?B?QmczczFGcFk4b1ROTVAzQ0dIaDg2SlpTa29RWllsT2FtZVhxaHRRNU9LakFR?=
 =?utf-8?B?d0c1dTRzcDd2dDJ1ZHdReHlHYTFvRlFUR29ra2RaSmsvVUV2MGdFN0hKYkY3?=
 =?utf-8?B?NnFzSVE4dHZvN2dUSHBKWUJuQ3ZnWk1PblkrTmRRVnpTUlowWnFPRmJQL1Z0?=
 =?utf-8?B?UCtqYjZBVUw3Um5JVktwMTdFbmI0UFNFUmJnc0JLNVAzTk9zWDRzenBxK3I5?=
 =?utf-8?B?d254L0xlZ2RBZWZzZEc3SmRjcU5kamZDcW9pVGRaSThJeWVFOTlwZmxrcGdp?=
 =?utf-8?B?aDZjbzBZUGJ4czVrS1Rub3BadFlWVEFCdEM4QkRLV2V2TytpVU1IWWhhZEsr?=
 =?utf-8?B?WG9qNmZKK1JPWTI2UG11OUpDMHpHVDBueVdyaXF3SCtyTHpLV0NBNExVbjRW?=
 =?utf-8?B?Skh5OFJyTURBMXp6eHRKdHQzblNMYjJWd1hQU05jKzRaUkJtV2xlcENKeUE5?=
 =?utf-8?B?bnp5SzB2ZmMvY254b3Rmc1A4ejVDMEE4R1FWcXFSMVA5ZmtXY1JzbVJjZGl6?=
 =?utf-8?B?QzkvSFFjY0RuVU9IbCtmUWI3ZjJQTGlkeU8xdldiaHY0VFlRRFFQNitldlpF?=
 =?utf-8?B?K2dmeE95UUVHcmFNYTlPcGZvVjZqdEc2bjdETkhyajVsTEFQWTIrTUdUSWNC?=
 =?utf-8?B?cmU5RzJGUmk4OGx5QVVJM0ZXeVE4Mm5xU1VLdVZPTmNidjhLVXpHS0ZrbEpx?=
 =?utf-8?B?ZlJvdE0vaTlEc1EwRFhZalN3enowZWRIOWlhSVVraWRxcFp6dm1lZmNiQ2RL?=
 =?utf-8?B?NlNrZjQzaWtHT3JPMjlVenIvUkl4NXNuRTQrMWV1VXJtaGRsbW85TS9EUWxp?=
 =?utf-8?B?S2lYR056Q3QvMGdDWkFDT3BsZVRPbXZpdXNZQ2ExUGdzLzBNbGxHWDNTRko5?=
 =?utf-8?B?UExjbDljdXczaFJxbEYyVEU0eTUwcEY5OFMvVS8yTGlJOHZHZVJtRnhBZnl3?=
 =?utf-8?B?RHAxYzZjNFBOcHd2RFNrWVVxZmhsbExmdUpxQXY1dER4OWtva3V1UW1XVVB4?=
 =?utf-8?B?bGIvREgyRzkvVTVMbzcwODlHV3FMK1RmSlBWK2MrS1N3ZG04dFp3OGNpbVZS?=
 =?utf-8?B?Zm5xU0V4K09mWXUzRUJqNWFHVTYvcjc2U0s5Njk3VzdSK0RBaWJLeXQ2K3la?=
 =?utf-8?B?UVVWOTR6LzZIUGNaR3F6bGpjeGlqNFdCTDdOaG5GZlFXZjZONXlHOFJHRkY5?=
 =?utf-8?B?eFQraUdaalJndUdJbklUb2VIOTNvNFdzdXh4emVkT3RISmFOenIxRHN0bXhN?=
 =?utf-8?B?MTJycFR3TkIwQ2tvaVpTTG45c3ZMUnVrSmgzOTAwR0d0SVpGZFd3QmR2ZUhO?=
 =?utf-8?B?bzYrZlhwQVJpd2ZyekpBaFk2Q1k5TWFoSUkrb1RFUng0T0tLQStXMkVmVGJv?=
 =?utf-8?Q?ekr4K6sKmcIcvAyhmF?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 588beb26-dc0c-4257-1d0e-08de52e2f190
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 20:33:00.1726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6JG1d/ftfOBcJQdCZPtohxtozFsn/l5D2/Adcgo4C5wEsF8Ru2hVjR7t9ZiWSy+YB80sLJ2NmkIniwXJNw9VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMS8yXSBjbGs6IGlteDogZnJhY24tZ3BwbGw6IEFkZCAzMzIu
NjAgTUh6IFN1cHBvcnQNCj4gDQo+IFNvbWUgcGFyYWxsZWwgcGFuZWxzIGhhdmUgYSBwaXhlbGNs
ayBvZiAzMy4yNjAgTUh6LiBBZGQgc3VwcG9ydCBmb3INCj4gMzMyLjYwIE1IeiBzbyBhIGJ5IDEw
IGRpdmlkZXIgY2FuIGJlIHVzZWQgdG8gZGVyaXZlIHRoZSBleGFjdCBwaXhlbGNsay4NCj4gDQo+
IFJldmlld2VkLWJ5OiBQcmltb3ogRmlzZXIgPHByaW1vei5maXNlckBub3Jpay5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IE1hcmNvIEZlbHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+DQoNClJl
dmlld2VkLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCg==
