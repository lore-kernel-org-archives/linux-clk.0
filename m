Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0334137F8C1
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745673; cv=fail; b=aJhBJ4g3iWgImB8+v38hG+zZOsSy9CbeMrz+hee2v2cJwJjZwvihFNI1z7iw4mVl/S8WyKGQWhGi8ybvitYxaCP9Jb40bBg02Na2nWHmkgC67K3GP5IdvAFWwsFfw0xq0R3PlQpwHanG/OaX4pV3VqZ73vN2xFgT4aJfuI0W2+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745673; c=relaxed/simple;
	bh=bc6EmDwM8kHQo/pWlzkMiplTYvVT1lp8EL6NOVqAwpY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZHdPnxO6BT69PakbAT+GcmR6X/IGt8OImVNO2afjOU2w7kLOBgEnehSFs/D5FVuuMiPeuYAPzfcEzIleKU7+h+LcyyDF4Qenng3lLaaZkAeGzdfUpTCcPSubzQorv0OBseQ8LboDbwP+StOLwAaeOdK0/c+Ycemlp0FNNZVx0B4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=a2+PGHfk; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a2+PGHfk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCUY0UT3YlQ27h5F0h5JNEKbuMZtdJsW1Kc6oE7ftpe3UqgafIb1VJvynZtAuHfEymLpChbIA//UB3GYsBt4BANRBadFGNUNLNCmTkksxjKFYco62P9pzz5TlqcuerbC5xyaM6Q40v8TcJCP2p3ziYUWM9gbbHm+hfrB8V3OI1fME7d6pypmQ85fA5b3pW8QYoaV+RsjfkwePTQkSdDAjtxZ5ba2zR39jWo4yEolWKR9RxcOBttgSaIA06KnleW3SqBskcLVsmsfCjoynEC8VnVZQ7UMSTcG6Tw0OIkJj7/VRIrIVXFXtLzNDjUEF9m/xb05Pf6Ve6pcHn/rsuIMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc6EmDwM8kHQo/pWlzkMiplTYvVT1lp8EL6NOVqAwpY=;
 b=wX/5dk9AsO6Qq8OycDCnH5SY1d6HOPLXvi/USiNPI+85upmRvymiFUV6qZVySXqseZtvP3QIEH8h9KWvv7tIADP2eVzp1pGlQIWao2rzXQutNCv4vUHiX/7yTJz5TpcgE8I5Jdn//pXZaNhkfCDEqvXyJF7tuqfzhUG1GXOVcKCi4urXzDKYH/jeZWH46/9BMIIjPC1bvWW4njJaqIn8rtMalmJns2nPH6UiDFblgFaEsreQR/W/SVsgcoZ5qtyrn+ysRvjFGVXu/DnQfAxE5WXSLkLI1ED6N3CtOn9ym6WQDUidKX9/f9afNBdXbtsAo7GA/1KXUHSsFOA3v/UGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bc6EmDwM8kHQo/pWlzkMiplTYvVT1lp8EL6NOVqAwpY=;
 b=a2+PGHfkXcmB8GJLrk6J8aV/PRwnr2fhwlVl/Ccwt64Q3KiS/xdhp4mq3wAHRGUQELQuSyjUtJ7MzAuZ27nAKOe/7EWpcohwN1ecPX0mAL7drgfaGdLAPsYkdGTbz/ShMlLV5y5fLyFTuTFa3ZzIBrToToLk50tk0Ket7LIq0bo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14694.jpnprd01.prod.outlook.com (2603:1096:604:3af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 15:34:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 15:34:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and
 reset
Thread-Topic: [PATCH v2 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and
 reset
Thread-Index: AQHdR3+GgCilfDFKwU+ANFh6UHLer7bUdGaAgAACpeA=
Date: Fri, 18 Sep 2026 15:34:28 +0000
Message-ID:
 <TY3PR01MB1134635D2C73B96D9BBD6914686872@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260918150730.122056-1-biju.das.jz@bp.renesas.com>
 <20260918150730.122056-2-biju.das.jz@bp.renesas.com>
 <20260918152347.D7F881F0089A@smtp.kernel.org>
In-Reply-To: <20260918152347.D7F881F0089A@smtp.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14694:EE_
x-ms-office365-filtering-correlation-id: 4621d627-8909-434c-ef73-08df159a53fa
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 phE1bNdww1AruOMkmI6i40GhbrKaLCgg/dmm0i5kH0kniCX/JULuWRpkhTCX+Q2XP5BAKXyT3dDL1E5+ucV20eer10EyYTfh++df0v+sgGlgaMYfcmqQCQl7H5MJbcyqjkpRBmJDpCpaG9GbRdcWu8Rf5vbe0AbhhQXFI38UXa++RPyly/t3uv4RjAV1v5dvcbwoCEFOV079wgB6GNiEkRsDBJfEHNP77VUMINVC/a1nomdOYa6JGBYzYaEJDHNOd5LOgp4Ow2ez9SwZkmhpbb1p0Es3LBw8ZPCjpzzWvWlmhVFFmgJcJosP9+EPMziXBiajBGGQJsG1d2CUN08fwA6Vb0qNlEnFqMTkff2woMs6gs/1m6S5HiLpN/CVKyMDaHmM85fliXOl1Jd4V8pnlQOTnARuEZTJaYEjUvuHtM1mhEq0SzB1oDChE0E7Nu/ln8YEik34hWFyg4in7YGNHEK5jXCAIei5Vu528QxetkJ1hvbCF/XfQY0cDdsQLzjnCfS8bGt+YM9o3X+lmqq/Eg8v6QnFZvoBKbBoOFU5VszMoY4nO1lr13nA3hrVNJBZ9hopI4IoNQZbvZKkVvu/mtTLbkzmS7tBEHXcWAxEtBSAkWeFQKT1H7d0hu7Xz+HprNIM+NtGmdEOkfLWBrwU2OZh1/4iybWLwswfXeIGvoAvUcQ4IP7c8JRJlZmqabPfZfIl27m9yH5D+duFSs74qIekAymTDC7Ks3pg9ge3Dk0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tjg5ZmplVzErRHBMMkVMRjYxeGtxeitMUXRZcUlFd0wyRGd2alJYWmxBd1JJ?=
 =?utf-8?B?MFlJcHAwNHA2NnpJd2o3OEtzVE4xa1lVMmlHR3pQbDFJZktPakp5VWNsWlFy?=
 =?utf-8?B?VGkrK3ExcFQvRWZMNGRBZWVrOFVYc2QyQ3hnOEt3YjJtNkc3dW00d0tUTS9L?=
 =?utf-8?B?c2s1NHJCNkFtUmZkR3lIOUt6MjlFQ2p4M2Rvc0NHMDF4Qm5lbldMRnE0eHdy?=
 =?utf-8?B?SU03VWp1dmk5cGRjbURrL2JvS3hJSlZaNVRtNlN1ZnN2aWRHZkMrUXVjY3hY?=
 =?utf-8?B?U0dxQVVNYXBvUVVGYjNzQzNISkN1cFJVRGY3U29hS3RjQmU3SGF5VEZyYkZE?=
 =?utf-8?B?MUEvS2E4QkVwWVRrRnpjeHZCZXVySnFERDRzdVN0WEM4TzAwcHZDNWFaVTFz?=
 =?utf-8?B?a0xFdDBxSVN2L0crUGVzS0VvMjVUSEpuMDJxN0RndXYrUmZ2SFJMYWc5RFlF?=
 =?utf-8?B?bUxNY2lqdEpxeHBlVW1ZSDdGaHdZN2Zkc0s0bTh5aC82SUJDTnZXZTJLbkRU?=
 =?utf-8?B?Q25PMFlCWlE0N0NXVG81QldjYVFpRW1nZVpiQlZVSE9hcnhwQ3JXTHJqWXFB?=
 =?utf-8?B?eStJdVJSMHlOWFgvZ05wakNtUVRGTEl3MExaWFg2TnpoRXk0N0haZFpZTXdU?=
 =?utf-8?B?bzNjQVd3d3A4dHIwMUVPRGJsL2UrU0pjeVJwdDFjVVFtblJBeFpsSGpWM3dw?=
 =?utf-8?B?TFlVRXdMdi9lRnduYkNwS3FVcVV0ekkzZzZlVlJTbEs3aTdPc2pRd091RGhK?=
 =?utf-8?B?RmdnQzlUaEtzUnFWYkhNZm9EQkdXRTRqK2VjbWM1WU5QTnREL1AxTkhRK21u?=
 =?utf-8?B?dGtDR3lYWkxUVkM1NWppL25ybk56Vk1ueU5sTGdUU29xTmJsNFgrQkJqQVVp?=
 =?utf-8?B?MXVDOGYwZ2h5dndlNjNobm1TUEpMQm9ISnVQZ1JiOGVDYU56eVVUOEFGeG5P?=
 =?utf-8?B?MS9EVytiMitCeUZFd21pRDJBTGtPNGZ5Q3NuUTc0QlhEZFI4OG9ZeThYMGRh?=
 =?utf-8?B?WkFrdzQ4SmM2RGx2U25MT3FLVmVPcTlpRkdZRHhJM3VucFc5eWpuZHhwS1Zx?=
 =?utf-8?B?M1BXVW9Sdk9HcklYUnYwQU1FeW9oZ2M4QWVXZnp2bkRCLzRVTXM2M1FIM2lk?=
 =?utf-8?B?bWFwTWk4RnB5S294clM4RlcyZUU2d2lxMTQ3bUJnUTFIZDlKSk45Tjh1R1Fv?=
 =?utf-8?B?WHRUckVTSlFja3lnNTQvc0h5bzBrVXhBU3AwUk12WnArbDAzN2h0a1JaVG9H?=
 =?utf-8?B?cEFmVFFjVDhja1VKa2dwSmdaa2ZvNnZEbzNuTFcwVjFIMjBFcHozb2ZQTmxi?=
 =?utf-8?B?UE5NSU5rZnVYU3B6VGtzck9yTkhNc2pEa3NXY1Y2OFMzZUZtL3VIQ2gvREJh?=
 =?utf-8?B?ZjU4TjdKWDE4TDZCQlhvV0Z3R24xY3RRQkkyRno5S2NiZDg1bmxNMmRBeEx3?=
 =?utf-8?B?TTdzOVErblV5ZTdwczhkTGVXd1luanRNc296L1QwdjhlZ0JIR2hmdWpmUE5i?=
 =?utf-8?B?RklNM1huTGJEcktsT2pCa25kK0N1eUVReGJPalA5VXVMcTR3T1FCcmFmZWRm?=
 =?utf-8?B?dGJjaFFyRHpyNGNpQnMxRkJRcldaODc1MGlhY1FTVmk4VkFPd3VPUVJMTGVM?=
 =?utf-8?B?NlY1YXlMTWdQRlRNSndnR2RjMUpiYjh2eTV2Q24rOVRpK21GRjkxUXRlaDF4?=
 =?utf-8?B?eG5hbzBXTDE2cVI1WEd1MUwvSG9Eb2svOHAxd1lqU0loL3R4QU9jOWtCUzRw?=
 =?utf-8?B?OE5halF0WnhYV3ZTVkp2WldrNkZwM3FnVjdRWlF6TXFkWkowY29kNWFXZ0d2?=
 =?utf-8?B?cCtmRWxUbEVBTWQzUGZiMTFLQUxlR0NNTnltcVpSNzh3NDBlZjZkZ0pxNjJv?=
 =?utf-8?B?ekdVLzhpYXAvbjZNOTRwTnFQQ1dWdlRwYy95c1JGVnArdHI3UGxoL1BkT0N1?=
 =?utf-8?B?THdmaWFTdjhTNGMrN3czdllNUHFJS0VBcFd3ZjIzcldTRm1mMDdyVXd6TmpR?=
 =?utf-8?B?YWEyZi9JZ1N1VmRhbENHL0NnZStWVmZkdzZhWlo5RVFIMUpSQ0ZNOWdMMVRZ?=
 =?utf-8?B?U1hNQkZ2K0xoS0tvdkZoNy9nb2ZuV3lZSFA3bHVsTVZhZ2tLbmkvRWNkaDBQ?=
 =?utf-8?B?eUl3Z2hjTUJjLzR5MFJwdVl2d0xUc1RyUkZ0bnZ5bUNYZndRMnNEaTFmUXAr?=
 =?utf-8?B?R0d6aFlCWFp1S3hqT2ErbU1qbVZ4QU0rZWhDVXVhM1M0UklocTAxL2tmckFC?=
 =?utf-8?B?eU1wVFZQSXZMT3k4Zk40ak5veDhQYzNLRk5vdWVmYXg5K2xQVU9FMTg1K3A3?=
 =?utf-8?B?ODZrVlFHNEh1VVFBdE9Na1M4L2cvaERDQ0tEQS9mUkJGRHFoWSsvZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4621d627-8909-434c-ef73-08df159a53fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 15:34:28.7440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +nDmzcqPgrpFB0HER9R2iMFsGxQCom4f4ac4eFt9z5WqxLuekAZnbs7NZmgUB11A7YfTddUgUxzjKnKr4cAKE6zbRaCOZasWNqYDDuDepvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14694

SGkgU2FzaGlrbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNo
aWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiAxOCBT
ZXB0ZW1iZXIgMjAyNiAxNjoyNA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS84XSBjbGs6
IHJlbmVzYXM6IHI5YTA4ZzA0NjogQWRkIFRTVSxBREMxIGNsb2NrcyBhbmQgcmVzZXQNCj4gDQo+
IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtNZWRpdW1dIGNsazogcmVu
ZXNhczogaW5jb3JyZWN0IE1TVE9QIGJ1cyBmb3IgQURDMSBhbmQgVFNVIGNsb2Nrcw0KPiAtLQ0K
PiANCj4gY29tbWl0IGUxN2E3ZjhmYzM5NDdmNmNhYjcwYTQzNWIzYmJkYzI0YWY2MDU3Y2UNCj4g
QXV0aG9yOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBjbGs6
IHJlbmVzYXM6IHI5YTA4ZzA0NjogQWRkIFRTVSxBREMxIGNsb2NrcyBhbmQgcmVzZXQNCj4gDQo+
IFRoaXMgY29tbWl0IGFkZHMgY2xvY2sgUDIwLCBtb2R1bGUgY2xvY2tzIGZvciBBREMxIGFuZCBU
U1UsIGFuZCB0aGUgY29ycmVzcG9uZGluZyByZXNldHMgZm9yIHRoZSBSWi9HM1MNCj4gKFI5QTA4
RzA0NikgU29DLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEw
OGcwNDYtY3BnLmMNCj4gPiBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDhnMDQ2LWNwZy5jDQo+
ID4gaW5kZXggMjI4MjEzMjFhMWQzNy4uMmM1Y2E1YWI1ZjU3OCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA4ZzA0Ni1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xr
L3JlbmVzYXMvcjlhMDhnMDQ2LWNwZy5jDQo+IFsgLi4uIF0NCj4gPiBAQCAtNTU5LDYgKzU2MCwx
MiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX21vZF9jbGsgcjlhMDhnMDQ2X21vZF9jbGtz
W10gPSB7DQo+ID4gIAkJCQkJTVNUT1AoQlVTX01DUFUyLCBCSVQoMCkpKSwNCj4gPiAgCURFRl9N
T0QoImdwaW9faGNsayIsCQlSOUEwOEcwNDZfR1BJT19IQ0xLLCBSOUEwOEcwNDZfT1NDQ0xLLCAw
eDU5OCwgMCwNCj4gPiAgCQkJCQlNU1RPUChCVVNfUEVSSV9DUFUsIEJJVCg2KSkpLA0KPiA+ICsJ
REVGX01PRCgiYWRjMV9hZGNsayIsCQlSOUEwOEcwNDZfQURDMV9BRENMSywgUjlBMDhHMDQ2X0NM
S19QMjAsIDB4NWE4LCAyLA0KPiA+ICsJCQkJCU1TVE9QKEJVU19QRVJJX1ZJREVPLCBCSVQoMTQp
KSksDQo+ID4gKwlERUZfTU9EKCJhZGMxX3BjbGsiLAkJUjlBMDhHMDQ2X0FEQzFfUENMSywgUjlB
MDhHMDQ2X0NMS19QMjAsIDB4NWE4LCAzLA0KPiA+ICsJCQkJCU1TVE9QKEJVU19QRVJJX1ZJREVP
LCBCSVQoMTQpKSksDQo+ID4gKwlERUZfTU9EKCJ0c3VfcGNsayIsCQlSOUEwOEcwNDZfVFNVX1BD
TEssIFI5QTA4RzA0Nl9DTEtfUDIwLCAweDVhYywgMCwNCj4gPiArCQkJCQlNU1RPUChCVVNfUEVS
SV9WSURFTywgQklUKDE1KSkpLA0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IExvb2tpbmcg
YXQgcjlhMDhnMDQ2X21vZF9jbGtzIGluIGRyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDhnMDQ2LWNw
Zy5jLCBhcmUgdGhlIE1TVE9QIGJ1cyBhc3NpZ25tZW50cyBmb3INCj4gdGhlc2UgQURDMSBhbmQg
VFNVIGNsb2NrcyBjb3JyZWN0Pw0KDQpJdCBpcyBjb3JyZWN0IGFzIHBlciBSWi9HM0wgaGFyZHdh
cmUgbWFudWFsLg0KDQpDaGVlcnMsDQpCaWp1DQo=
