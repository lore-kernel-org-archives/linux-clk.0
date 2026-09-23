Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3024D37B6;
	Wed, 23 Sep 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160140; cv=fail; b=Ab8m6T+kFPi6ZG5o1e+LAnr2aiPqgCIvFlKP7CvO6lTo1akYJ/LbvbgyCalAFsQnH3WOSUAOh3uby59vyJsOxk7H0lThMqyYVeixo2v+8Jf15q51MJo/fhr1vtnZfT/xf08G/fm/uES2RibWZsun0A+5QP3NTEtdbHeCjyb/H9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160140; c=relaxed/simple;
	bh=SLSPFUuodtc/FG+KffI+nvwp2j4tw2yTpSn9/FZ4r6U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q1G87/YP+LuKNgxAjqroz/3ZhPM9Iu6Ip4wsKCixyelXZceapR0R7aETAzaJx7vO/HyVR2UD6jh3UFqf8XJgGERrM+PJqi5kJANsgxhECVzj5Wms9bSMwz9D2P7r4v1dMMo6uoLuInYN9hqFZ5UKo7Qg8+ibI4lcVYtu2DZ952I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZnXPCVPQ; arc=fail smtp.client-ip=40.107.74.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZnXPCVPQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u13WiIIX2dS9cPmSHr7DyKecJO8YSSun01YzBDJZ6lHlSCQizWkkOO3llVeN27tyL1XYBmf+mS+Asm+dADQ+a2udtkPb0JJIVltGjab21PsVxqMyqMenMAjm55TIDWUt1OQPvMiuSTtXzcPXqy7zW42837thCD4+vEcu+h2eWumJhJq3Zwt4k8hX0XfY8hzgHgIcjjhsqi6PH7Zty84aSAclc9gXG92MT408AayjveDWSkvhddRJmfbSo8Idreafljztt8CbsITiv7zfmI1cf4wgWaH/U6SLttDIXIIg0aaQTUjqZoOBfdXXDY/cwoFB8gC2ses/3FaqV15v735CJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLSPFUuodtc/FG+KffI+nvwp2j4tw2yTpSn9/FZ4r6U=;
 b=a/MUuwVP8lqgqrXTGhTNsCFKucqRc+c0B0OA1IPEPCwWP8aOdiXDh5xS3yJix+Kqxk1PHbczK7GxbWKrSu86fqiC8D/Ee2O5YwmlSKbIVKNolv66Ye9ZXiDYIXkDi1RPh1tUybop0Gf2zWevbZd4cAHV8IAQ+mK5FIjwAbL1NFJQHeMdmIpFLzXbd/HXdSDS2IuwFBiyocBn8L2MiLqYe84cwXUY+Ea2ULFaVtklur96/6SkDfuSY8javaNXnP3u20lQrjAXlgA5GoLaaumWNP6s53DrXkWkaB+a2anm5lUAjt+HxBON94C70mReqSpwPn50ppjPm7Q8//IGQ/n1ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLSPFUuodtc/FG+KffI+nvwp2j4tw2yTpSn9/FZ4r6U=;
 b=ZnXPCVPQU6ujhnyzw89scgwAmm/7EO4uqBKRgqRH44sSzOxGBeKCMdN1Bjuc6sETt+bLFdslECGCl/e2Zw0dWzKOUcQMJD84gEGv2pa9bdIkN1jVWi4C4Zg49kEJxTYBCSX4wwPijVFbXK2oiWupXUE0Gwz78e4bi/rBhxhnHkA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13085.jpnprd01.prod.outlook.com (2603:1096:604:332::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 10:42:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:42:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/5] clk: renesas: r9a08g046: Add CANFD clocks and resets
Thread-Topic: [PATCH 1/5] clk: renesas: r9a08g046: Add CANFD clocks and resets
Thread-Index: AQHdScvuv8G2SL5JH0e/WI0TCnz407bb4O4AgAAbiRA=
Date: Wed, 23 Sep 2026 10:42:04 +0000
Message-ID:
 <TY3PR01MB113464CFCBED6FD0BEF10B71486822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com>
 <20260921131951.187981-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXe9kmC7Y6nwXhamvEVwiw7SkWamsSYxgJHoVz-XtfPFA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXe9kmC7Y6nwXhamvEVwiw7SkWamsSYxgJHoVz-XtfPFA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13085:EE_
x-ms-office365-filtering-correlation-id: d35e39f3-6f77-42d8-a027-08df195f4ef1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 EavHsIdXLwVt6jaS3WoBCoJoMJJ5nP5y7ddE1kQc0mT7pcgXwvAxTSHmtuWj9Uv5O9htdKIaR+qBpKtxEq0k4gIQxWIlzSiHNNleMg0eQbnodBBLYqIzkrUjY2JDJvYoTbcauzH8TFYYEfvIHBdrv4DsoBgQUNSZJIxsYzT7Pe+NXbHJd9ESaa7MCxWOV60+uB9krM+DmDysV0SLZheQxKlrOTyx0I6+BlBpkpBTjEPzLlFi3CbqOotcbaCcdTSX1+k+yTpThJFaz+JLVtvcc4xcwTEqKi6WHvSbornR328u4rAyoFZrni/fta5PCldFv4neyuY2r9HLjmIUGY+98GcY+yoCjinRTTRPxsw0vZy48ZFgtKu9VcMXTGtSkIH2grWAntPaCxJCioPQuAOb8lguMKgdbJpudej8lK4VX8WbOtZZBeZLTUqok+jrrO4KLjpDyRkNRSFek7aMJ4aSKQj7PpjNLDJqeGE4mr0kCiox9JyMGALP/36LG9F9MZcoiv/gQhvO9eBZF3wniPrZiT3XaM+PNaQa6HUAzVTdVKHTf1bR9laZzhDhkguC1bCeXTprtR+OOjYmgX4ZEHlzH2EKhJ7rioSnzVAg8NLoq5q5JpRcpbaEsuyv/KA6I0MEmwP3GL0K2TWk67M6ig0DZlYWFJ9lr/8WruJ1K5k/fp8s3Xi7aWNmtfVp4aPZKJO0Fwdt/9FWtEBYpRp8JirkMI2UBZNIxSt7zvp8e/jTi/E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RGowcCtNWWIvcmlCdWJNaW5hQ2UwckJubWlhcXdZeUx2d1hvM2I0VVpMcFhZ?=
 =?utf-8?B?ZU00cGFVR2NlaCtvTi92cGFvR0pwZ3BlRnVmSlFKcTd6a2xUNm5RVGRkdzFk?=
 =?utf-8?B?TVpjSXRyQU4xdVV3a2tQTjJLVEZMVjhJRC9zNUhrRFVVNmJOYU1EUklWcmVG?=
 =?utf-8?B?akVIa09VTDZHUlF4L2NHZ1lDMUhXc3A2OFk0ZzlQVU1pcXU0RGdHM3BLMmt0?=
 =?utf-8?B?eEorL3UzWWJwVVpIMGJRNUZNcmNoSVczMHc4V1VTUU9VaXpET3pNU2o2Z1Mz?=
 =?utf-8?B?ZHVyWGl3b1lpWTdhQS9Oc2o5cG1ZUlBGa0dhZ0MvVkhOd2xHK0VnVFJ6aURD?=
 =?utf-8?B?akNoN0NhN1JhZDBEbEkrUllsMVBLbHIwWXNRVjZBNW01aTk3Wno2ZDdTZGdz?=
 =?utf-8?B?UkJkQkNMZmt1cDdJQmc5VFZZNmZPK2pDNGJFcVZzZSt0WGZjalE1dmFRTmJE?=
 =?utf-8?B?QjRvdTI4NHBZWGQ1WkVlTlgvMEpnOVBrMUYvQ2s0Y09JaWtiZ2YvcGx0bmpy?=
 =?utf-8?B?dkZXWkliRGFYcW5Lcmk0ZVBrOUJNNUZ0V3FUVWJsbDh1dWprZTRsb1ZKY2lD?=
 =?utf-8?B?SlNSak5NZlg2YXBsOU0yRFZzaEV1emF5Z1kxdXlqU2RYSnNUTXhaNEd0My9m?=
 =?utf-8?B?bFZFN3RVYjdWSTJISmxqQzlrc2kwUFQ4QUlvU2Q5b1FBRitQNjVMbjFyVHRw?=
 =?utf-8?B?V1p2ZnoxNmQ4NlU5bVdXb0FBcXBINnI5RFR2K3BDcmNSOGZjQUc5by93aG5U?=
 =?utf-8?B?dTc0eFRBNkgzbFh2R0JMN1ZmNDd1L2hGZENIdDBuRk9XMk1vWjNHQzlNaEV6?=
 =?utf-8?B?RHZUSGxCYkZuL1lBUUx1bm82Yzk4cU5yVEVrOFNmLzlwTlIwdlJrNDdDbmUx?=
 =?utf-8?B?Q2NURmNDbDEzUEthUGFEOFNYQWF3VStkWGJQZTFJQ3Z5ZmxlRGt5cFJWY3RS?=
 =?utf-8?B?a3JTQVlEbkFSbFZ5WGNyeTkyaGVPQ2tCYnp0OHd4NlBFc3M5SmlmN2pCd2pY?=
 =?utf-8?B?OUhWZjJpNjlQaGhpY08wNUI4d00zakhCMTBkNEJUK0Z6SGgyNmE3SlRweWsy?=
 =?utf-8?B?L1Q3ZCtmZGs2OTdPMlQrWm1uVnFoVjFpbGtJNVFSbUVQcWVtZTNOZkZLLzly?=
 =?utf-8?B?ZEwrUURibnNIYWpYMW9CSTdEVnFQL3NNYlAzWHQ5dStOWGY5Q2NSU0JEblRC?=
 =?utf-8?B?UElCd05LREI4Zm9qVWZMZzdSYVpHanJjT0VQZFVqdzVEeHJNdUNaSmZRMC9r?=
 =?utf-8?B?eUdGRkFQalJNRXBSWkNlaDhyaU5rWWZjOENmc05yVyszU1pxMVlvNW9CUmhj?=
 =?utf-8?B?NjRjdGN2NzBuNGMzRHZlZ2JTbXF6U0h5YW1aL043MWU3b1RuZTJjNEthWTBM?=
 =?utf-8?B?Q1h5Q0llbFZoQ0pRUjcxRUFYOVZFL01RRVZiaFZJMUxhVklpaUVhd0xwa20r?=
 =?utf-8?B?V05jVFAvR0U0Y2Q3Y1pGaldPbkQ4ZnpJazlFMkdxNk4yTmkrQlRpYWZ3Z1Fr?=
 =?utf-8?B?RGVNOXMraStBNEl2dElBdkxVZWkvWlJaV2lJanFYSnVlRFBVUnVKWWh3N3hz?=
 =?utf-8?B?UTRaT1JqbHA3eW0ybDI5dVFNV2EyNjhrbm1tYUtjUWJxZ1VZWTJXWjBrUHZY?=
 =?utf-8?B?YndGUWI1ZnRmV1p0ZW9SaFBzbDJOOEpTdmF2R1hzVk5wVlVpNVZobXRBc1B6?=
 =?utf-8?B?ZlREek1DWVQzTlgrTm1SUS9oNEZ4Tk9leGtXU2Y4Zk9oMWprRWtkd21HbTJ3?=
 =?utf-8?B?eGl6N2dXa2lzR0o5L0dqNVUvM2ZncEpQRzNML1dRZVo5VmtvcHE5WEVwaTdo?=
 =?utf-8?B?ZHVWQWZLQUdjK2IrZ1dLc0J1dTFVdllBQ25jckh1bW56QzA0OFZKTy8xTkNU?=
 =?utf-8?B?WVpZdzhDS2dQUjJYbzdLMDVQdzNaR0tnS1VKUy81T3V0Z21vMHFJS0VnUVgx?=
 =?utf-8?B?Q0RNZkFrTFFBdkhCc053YTNpRkswVlV6REdWS2g5VEFUdHdFcFFHM25uNWZH?=
 =?utf-8?B?WThRWmt1VVNCZUhad0hjam1xV3g1VmFCZitncjhaV1A2SlhwZUdsdWRqUnh2?=
 =?utf-8?B?YmdTT3h5VzNsVS9ONDNLUVlBNXdGQjRBRmpzeGN5Vm9UUzRsOWxrOXordGJm?=
 =?utf-8?B?S09sMWc5ekhxVUFML0RvY3lML1IxbEF3SHRtRnV0eFpQVHVQYjdMVmZGd2Ra?=
 =?utf-8?B?RldYM2xqSHdBZUZkNDMxMG9ScDhjUm5SVkRlVmRpUUc4T3JHb25YTlFsamta?=
 =?utf-8?B?TG9MOTVpSlhVNFM0YzNGRXR1SEtoOUVZN2JwWExuZXhVOEQ0VG1ObGdpSjRX?=
 =?utf-8?B?YUp4TDVtTys2MW5vRWV6ZmM2TFF3bmV4aGRyVkdMbFdHYVJuWjhIUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35e39f3-6f77-42d8-a027-08df195f4ef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 10:42:04.6865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMzhclnnwbBa4FaY9STfkPfVeOPy3jdoPoPX/OdKHzWsi6hJonvqYzz26sYkKuHmypeQDt9MrKzhfPD7/nORmx5eqbCuvjixkl35WMtsLOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13085

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjMgU2VwdGVtYmVy
IDIwMjYgMTA6MDMNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzVdIGNsazogcmVuZXNhczogcjlh
MDhnMDQ2OiBBZGQgQ0FORkQgY2xvY2tzIGFuZCByZXNldHMNCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBNb24sIDIxIFNlcHQgMjAyNiBhdCAxNToyMCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgdGhlIFA0IGFuZCBQNF9ESVYyIGNvcmUgY2xv
Y2tzLCBDQU5GRCBtb2R1bGUgY2xvY2tzIChjYW5mZF9wY2xrLA0KPiA+IGNhbmZkX2Nsa19yYW0p
LCBhbmQgQ0FORkQgcmVzZXRzIChSU1RQX04sIFJTVENfTikgZm9yIHRoZSBSWi9HM0wNCj4gPiAo
UjlBMDhHMDQ2KSBTb0MsIG5lZWRlZCB0byBlbmFibGUgdGhlIENBTkZEIGRyaXZlciBvbiB0aGlz
IFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEv
ZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwOGcwNDYtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Ns
ay9yZW5lc2FzL3I5YTA4ZzA0Ni1jcGcuYw0KPiA+IEBAIC0xNjIsNiArMTYyLDcgQEAgZW51bSBj
bGtfaWRzIHsNCj4gPiAgICAgICAgIENMS19FVEgxX1RSLA0KPiA+ICAgICAgICAgQ0xLX0VUSDFf
Uk0sDQo+ID4gICAgICAgICBDTEtfTTJfRElWNywNCj4gPiArICAgICAgIENMS19QNF9ESVYyLA0K
PiA+ICAgICAgICAgQ0xLX1NEMF9ESVYyLA0KPiA+ICAgICAgICAgQ0xLX1NEMV9ESVYyLA0KPiA+
ICAgICAgICAgQ0xLX1NEMl9ESVYyLA0KPiA+IEBAIC0zMzcsNiArMzM4LDggQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBjcGdfY29yZV9jbGsgcjlhMDhnMDQ2X2NvcmVfY2xrc1tdIF9faW5pdGNvbnN0
ID0gew0KPiA+ICAgICAgICAgICAgICAgICAgICAgZHRhYmxlXzhfMjU2LCAwLCAwLCAwLCBOVUxM
KSwNCj4gPiAgICAgICAgIERFRl9HM1NfRElWKCJQMyIsIFI5QTA4RzA0Nl9DTEtfUDMsIENMS19Q
TEwyX0RJVjIsIEczTF9ESVZQTDJBLCBHM0xfRElWUEwyQV9TVFMsDQo+ID4gICAgICAgICAgICAg
ICAgICAgICBkdGFibGVfNF8xMjgsIDAsIDAsIDAsIE5VTEwpLA0KPiA+ICsgICAgICAgREVGX0ZJ
WEVEKCJQNCIsIFI5QTA4RzA0Nl9DTEtfUDQsIENMS19QTEwyX0RJVjIsIDEsIDUpLA0KPiA+ICsg
ICAgICAgREVGX0ZJWEVEKCJQNF9ESVYyIiwgQ0xLX1A0X0RJVjIsIFI5QTA4RzA0Nl9DTEtfUDQs
IDEsIDIpLA0KPiANCj4gIi5wNF9kaXYyIiwgYXMgdGhpcyBpcyBhbiBpbnRlcm5hbCBjbG9jay4N
Cg0KVGhhbmsgeW91IGZvciB0YWtpbmcgY2FyZSBvZiB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQoN
Cg==
