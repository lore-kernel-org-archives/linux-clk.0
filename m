Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022133.outbound.protection.outlook.com [52.101.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118B9399001;
	Tue, 23 Jun 2026 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198433; cv=fail; b=cf1OYj4av7iKhNM1QEwKawtrhkzGqh+XjesAX6Rg+M2znkBh+tlJoWhhdMiW3/mN1JMbrkgmTaU4xC1KTAJc6hehSVR9rLIYspc87RgY4Llg95NHs+vpbK0e8IbIkPMVX/TkTWX+i+V1Elw5i+YcnhG9lJF/SBsGU0jRM134JSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198433; c=relaxed/simple;
	bh=HzFpJSqZgeTBWcf8DV7ilEa0Cr7yOnSxvFdF2gLIuiY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KEJ8Hri8P4oKavLgFCdIsxd3tpDP928777I9FONNhHsDo0sjXJNEmNwRM156ACSeBhceQ1b8lGAQDi4VMQcZTZVXa6ZPz3QVbo79JJrsCxM4SU2HziUKrruis/2brKUWVgAi+J7PmX4MahQW/mx+5pgrfqqJ0JOxHVEc9eKPN9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVmoXLOgkAI8Zur7gkFVdsRA0qq3HJ/DcgxZZHokIpEKJeLxZ0P60dUD7lnznre8jBSl5R7Izso7VdZm05D/XXsUY9AewY6oMMGBlrbHee7zmnu6sO4vpJq6BO/E7xcvsM0+9EuUsAcEmRYdXQZDbPPfqActs+oE4k5e21BTz6Pgbk6FYhV+8L1tIHW6lqugb9zhCT7Rsq6EY2979ffK2kljQkfhpS96EW5GTFpvZn3YPpW3faw+TLxEgAsMA4A761zFmfOCbbyRq7OQWN63uo/aHiFKEFU4QnagTGeyXDRex7NA3Dw/GmROYiRPnNLuVkRwvfo/RGxrcZi3nwRxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzFpJSqZgeTBWcf8DV7ilEa0Cr7yOnSxvFdF2gLIuiY=;
 b=kHAkSd79+cR2UJ0Fja8g1zpv43zP41u9uhMrKRMRjq+3mJ28EuOH7KihqZJOo0Xw0wcZuYkhbyNy5X/4W9ooVXy/R+lS9+Bciv/925nlc+//mkdLPrEfbIigHghP+uCn2fGvmS51bex+pCHXYoYGqFoZ2V6HpB3z5DJvjQByZyn2ge6by7lHrlW3dBai8LXPuf/EcxjmjaNama7mZWHZXqGPiMS5rjS9VVU3aWQ66gy/2YvVBUGOua+HqwdnOhEgIndDVOhg9cOhOR50DkAE2C+3uvJRm9D9hSrQ3+kOv4Jh/HaUg9Tn3EskJSMlYkBn6c9Zu0UdPGWx3caPG7T5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by JH0PR06MB7150.apcprd06.prod.outlook.com (2603:1096:990:90::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 07:07:05 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 07:07:04 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "bmasney@redhat.com" <bmasney@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Gary Yang
	<Gary.Yang@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v5 1/4] dt-bindings: soc: cix: add sky1 audss cru
 controller
Thread-Topic: [PATCH v5 1/4] dt-bindings: soc: cix: add sky1 audss cru
 controller
Thread-Index: AQHdAe5nf44EnSteRkuPqfUHQ51vJLZKR56AgAFyLFA=
Date: Tue, 23 Jun 2026 07:07:04 +0000
Message-ID:
 <SEYPR06MB6226CF9305184393E1E3282A82EE2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
 <20260622022520.3127103-2-joakim.zhang@cixtech.com>
 <20260622-handsome-kagu-from-jupiter-8ebe05@quoll>
In-Reply-To: <20260622-handsome-kagu-from-jupiter-8ebe05@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|JH0PR06MB7150:EE_
x-ms-office365-filtering-correlation-id: d288410d-a4ba-4c47-619b-08ded0f607df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|4143699003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 wmG8Dm1/LRKTxVYQGi6mJRivgAeIHbabYirj7wEAo6/ys3bC2lg+7xNLq6n65YWXXxze/Md/xOZmXOCqB/3bB63oZY7FTCN6mSbo6k0KrsHgUaDak89l97RihhM2prDVsJk3T4QH4teMLkPsKnxuIc4KKKmGsAqIIxqK499BrdtfUnzXxAED0O8j2P6MpUU5wPpofRY0EewE73511iYK0R5c4JcjRmz+xX3YBF1vZXsVY7u4KNnZ6dkwkeoGzyHJuiL2VbKhN0B5xQrJzePYO8xeh8mrDT6o3seQHLs93D8AmmVgFZumX+kZPm07gcxad6jR/nGMP8tAy4icZhWiAQ2INCdiEcSHIBtNMH/RWyK1x/QlyYs847ldLNfWkbuEZsuU/Ngs/fF54j/gsq/yI7wYb+85i+sQJUUF4hPsPJgwNXv249/DKqv1HjJelc2CucvAdYlhESYaffqbvjx1b7J5+yynAvW+sY2PDPP1dnss8Qi97x1YNhAiORwnds1PS8Xp7zokHr3O/B4xpB2IwmPi6k7UEkoLJGe/WJmfMqLRPa+W2s0RMgyDFX/1wQoJJOee37fNZrQADEkqTrZzLjoxQIFi+nrbCfYaP6UFmA15w7NSmEAcECbyqkLQ8Gi7HUj79KfN71MmCRlqRQ24JO9BTedgX+TCCr9ZLP1qKAtnSJrBYXw0LH55IrgZ3FGdeo/j2AeE7GzD1tB/uDZpfuzAPY57/7y46X84Cg7svIw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akpQNHVZQ1hTS28rOHViVDl1MVp3ZEdkVnVHV3c0SklDWHltMUZGWFRrekR1?=
 =?utf-8?B?NUl0WnBMdm1CYnVxRTBCdUV5OThydk4zQkNPZjFIV1luRzhuN2MrcEF1ZzRE?=
 =?utf-8?B?eHBDRGFTNmY0MmtIRGRkY2hybmZkNnF0TmtuOE00ajkrWnhyNW5pb1FxOUtX?=
 =?utf-8?B?MTZkWWtsVW45Q0RYUUVLNFViVk5WK0kzZkEwZ2xqS0pKTjVFOGFaczBIREt2?=
 =?utf-8?B?eU9UeEVtTVlMZE5pb2dnMUU5bW96U0FUcFg0SGs5dENkTUh0dXR2QmhwL2Fk?=
 =?utf-8?B?NWhuOUVleG1WeTR4Z3N5MUp2bzVZU2MyS1ROd1VvVngwbG5XZDJnd1lHUHdH?=
 =?utf-8?B?enlKWWt4Y2h6RjFWZWQ5QmoxVHVEU3VEelpIMmpGaDZYRSt2S2MxYUx3NDI4?=
 =?utf-8?B?WkY2OUZ0cUludGE5WldSYVE4QlVpU1FwNUh6YmYzWm4wVWRGMXJOejA4NlBE?=
 =?utf-8?B?SEZOZFVlQW5LNkdadS9LZWJJWmhCVldYcFpiMWp2YUpsaExjak1KZzVYQVJU?=
 =?utf-8?B?eHpiUWYwNjJWMWgwS1BZcngrbm16eis0dnNMV05UM0lLWVpwMkM4OEd1dk9Q?=
 =?utf-8?B?L2xZUm5MenIyS0ZvdFNaOFlnU0ZUWFhRdXZVbldmM3daNDNkTGxFMzYwVlJp?=
 =?utf-8?B?WE9SSWV2SmhoMVV0U1hZeldKdHMwU25ueDRwek5CUkYwS01DN3Y5ZDFpdXJ3?=
 =?utf-8?B?UFc4b2d2aUpwdVNxMTEyaklWU2xEb29ROWc3YTlDZjB6SkxEcDR5VHRHSDNP?=
 =?utf-8?B?bmZ0MnNDT1VrSFFGbGtTSEo4QTc4L2FNem1PWXlPQ2FxVkVZelh2c0R6V3hs?=
 =?utf-8?B?OVBYU3VmS081TTFWUDVReTZXeGQ4aDgyZFB6Z1hNRFVvWi9rUWJ4a2Y2cVNw?=
 =?utf-8?B?bC9SZzlEVmpqUmo2TmVkOTdPSkt4bk8vUVBPVHBKY2xBWkdXa3haUDNYdzhv?=
 =?utf-8?B?U3NScjM3U3lBSlFHQmVPb3BIM1pPeXppNlpEZlRtSkFteUtwWnowMzRCaEcx?=
 =?utf-8?B?NldvTHVxL1hIZVpnRkZJakRpaW5GbHFJWU1neThyVzZRUWFlNlQ5RUtMTXRC?=
 =?utf-8?B?OFNWeHFDem9PNjZLUmQ1U0JrZmZxQmRCaHVKd3l6UnFRQ212MWtIbktsaUhY?=
 =?utf-8?B?RWFYcmNoQU9pMlh1a3pWcWpub292Ync5U1BMSVo3bVdBZ3IzekhZczcwT29Q?=
 =?utf-8?B?THJmU2U1QkZncllGNjBLTmdyWXhrZm03QUxOcFRPWHEwVFk1YXVGQVJzcHFV?=
 =?utf-8?B?QTBaMUREdkF0VkNKd2x0Y0E2aHd5aU52SUtUaEZTbU8zUzZpYnlJckw4cGJi?=
 =?utf-8?B?eno0VlhzR2NUdHU1a2pMTlNtenh1OEVmVG9uNnNLZFhwcENmeFo2NENHalhv?=
 =?utf-8?B?bWRxSjgvVUprSGRtTWYzQUpZODlmeG50ZzZuZ1dNRFZGOFdiOHprMG81OFk1?=
 =?utf-8?B?SVdCNENNcW1ScXdrTGhCZWJCNTNqSk9KSG85VTg0VHlIM1k1MDRyNmgyUDA5?=
 =?utf-8?B?Mm5Va2twTUZhMlhyenBIQmR2SEc3NVBRdFh0WFdPQ0l2RUQxcU5jMzM0YTNL?=
 =?utf-8?B?ZVNlSUpZTlZjcHA0cFJaYm1RdUlXVGl2VkJGYUZSNlQrTjRBQ1lCME1CYWFK?=
 =?utf-8?B?Zm5OWG5Ta2xnWlpKcEUxOCtIUkN2UzdIV0xaMFFDSXQwZ1phWm1HSWFqZjly?=
 =?utf-8?B?YVZJYndUSUFGYlFRUTFLVHBaSHlGdVdwSU4xU3ZUUlhBeU5XS2FyWEY1UEFj?=
 =?utf-8?B?ZW5pS1F6NG13d2ovc0I4ekR0YlUwekEzVXdBMzNmTERwNjNJYlhqS1o4T2ll?=
 =?utf-8?B?T2hWeU9mbEIwdmFiYTc1TUtwTnpQc2hwRkYxdjNNRncwWi9lRHVTR0hMNEFl?=
 =?utf-8?B?bjNSYldNM2l3bzRmandIR2dFVHlQLzRVU3I3ckh4UlBwbXJNSDM1NEQrWTRF?=
 =?utf-8?B?MGtkdUZWQ2pzQnNnU0o4MVJDZEJTeitKNm10NUFyc1VuTi8vTkhoeXFMTHhB?=
 =?utf-8?B?ajc2ejlBL2dzVUY2cWttR2dQaXJQVlpsa1pQcWVCL0x3TWUvcUt4aWtpVEV1?=
 =?utf-8?B?b0Y3d1FMNllhby9FTTFMTVU4TnVaZFZYTS9LeUNoRDd4SGVKUjJuU0hFWnNu?=
 =?utf-8?B?ekZBMHBvZDFEWWs5QklLZk1KUEVRVG1QTW9OczJ4QlE4VDVsVzgxc0R3WFRS?=
 =?utf-8?B?L0I1elN2YnZiR2dkVVp5bHQ4RDRaMGhXUUdVc2dIUUJxbExWdzZNdUUwZVFv?=
 =?utf-8?B?dk9udFdvMkRoVjkyaFE0NUhKWTdrNGFyRWJZako1OHpPY1ZyM090M0NwWDJ5?=
 =?utf-8?B?R2ttY09kTk1HYWtvSE9ud3BCb0N5em0zaFd5YWF3QlZSL1FKN3FpQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d288410d-a4ba-4c47-619b-08ded0f607df
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2026 07:07:04.5317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpUxKuMgm81KMM0cIqiHWUbYk+vN8EYLsSt/r2JxKUJcT5t0IEkHf1rUd+xk6+wHPGqWPqemvBlQCgAeHiFKW02ee54UnsQJmjQUyKYdZRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7150

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bmUgMjIsIDIwMjYg
NTowMiBQTQ0KPiBUbzogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+
IENjOiBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgc2JveWRAa2VybmVsLm9yZzsgYm1hc25leUBy
ZWRoYXQuY29tOw0KPiByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3Ir
ZHRAa2VybmVsLm9yZzsNCj4gcC56YWJlbEBwZW5ndXRyb25peC5kZTsgR2FyeSBZYW5nIDxnYXJ5
LnlhbmdAY2l4dGVjaC5jb20+OyBjaXgta2VybmVsLQ0KPiB1cHN0cmVhbSA8Y2l4LWtlcm5lbC11
cHN0cmVhbUBjaXh0ZWNoLmNvbT47IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgMS80XSBkdC1iaW5kaW5nczogc29jOiBjaXg6IGFkZCBza3kxIGF1ZHNzIGNydSBjb250
cm9sbGVyDQo+IA0KPiBFWFRFUk5BTCBFTUFJTA0KPiANCj4gT24gTW9uLCBKdW4gMjIsIDIwMjYg
YXQgMTA6MjU6MTdBTSArMDgwMCwgam9ha2ltLnpoYW5nQGNpeHRlY2guY29tIHdyb3RlOg0KPiA+
IEZyb206IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiA+DQo+ID4g
VGhlIENpeCBTa3kxIEF1ZGlvIFN1YnN5c3RlbSAoQVVEU1MpIENsb2NrIGFuZCBSZXNldCBVbml0
IChDUlUpIGdyb3Vwcw0KPiA+IGNsb2NrIG11eGluZywgZ2F0aW5nIGFuZCBibG9jay1sZXZlbCBz
b2Z0d2FyZSByZXNldCBjb250cm9sIGluIGENCj4gPiBzaW5nbGUgcmVnaXN0ZXIgYmxvY2suDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNo
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3NvYy9jaXgvY2l4LHNreTEtYXVkc3Mt
Y3J1LnlhbWwgIHwgOTINCj4gPiArKysrKysrKysrKysrKysrKysrICAuLi4vZHQtYmluZGluZ3Mv
Y2xvY2svY2l4LHNreTEtYXVkc3MtY2xvY2suaCAgfA0KPiA+IDYwICsrKysrKysrKysrKyAgLi4u
L2R0LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLWF1ZHNzLXJlc2V0LmggIHwgMjUNCj4gPiArKysr
Kw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE3NyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvY2l4
L2NpeCxza3kxLWF1ZHNzLWNydS55YW1sDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL2NpeCxza3kxLWF1ZHNzLWNsb2NrLmgNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtYXVkc3MtcmVzZXQu
aA0KPiANCj4gQm90aCBoZWFkZXJzIHNob3VsZCBoYXZlIHRoZSBzYW1lIG5hbWUgYXMgdGhlIGNv
bXBhdGlibGUuIEkgYWxyZWFkeQ0KPiByZXF1ZXN0ZWQgdGhpcyBzb21lIHRpbWUgYWdvLCBJIHRo
aW5rLg0KDQpTb3JyeSwgd2lsbCB1cGRhdGUuDQoNCkpvYWtpbQ0K
