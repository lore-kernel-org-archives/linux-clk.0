Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022114.outbound.protection.outlook.com [52.101.126.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1303C584A;
	Tue,  9 Jun 2026 06:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986329; cv=fail; b=D9gd0ffv3lEolbfKl4CT6I5UJwX9JFQuzpT38o1AUIL+MY+xwR/JMV7CSSR7419OA0JeencH/uRBYzK4tPe4GVx3QE8Wt3FCXnMpWCtsP0AgmXblWMOruqDVqVzIHkbxjx8LkanZ3+iXLhiFffeHRokUoKRw9FtfWCCZ0DjYd6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986329; c=relaxed/simple;
	bh=PFyZwOvbfnrJLCoMpFVmDNr94w06VNLpDLLJunbImUU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rjb8+UvWwvuu3Uf4uSbPj8OZlX0ly7y7ZJIRtKquGJh2mMVYubrkIZ9Qj0oSkelt+8O283unYCOzugDKAFqQ8oNNJoWDXInJVEblg4bZKthOroswDoXX4mlnJmwmkmVmjKNUx5/dB40VRQSGu5Ay8hGo7Evf783sXA7B9n15/+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJDekZVIfiORiKlx9hulVvLFGywLHzw7Q+SNCoBpNc+nWLAzb7fRkY8NpYdcLzJ9qev9zBAkl4UABN+1gdrZyBKL3SXrNVpP0vw7l6jPRCFahUmuuj0JBAjijUavUfnlwM4qgeJB+wt55AiyWhktbKs9OPVOfHb0ceYEM2evoxxDG7oHBmCcVkMUtv4PiyaA24fo6ZU25/x5gSIyWWM3X0NpjHhmMnd2vY+RaZm3XTLCcZSeUxzo5RT6iidUq6KEz2ED3+Gs+ONcqjam0NyktoYDz/C6K7A0jAfiNsquXgbUGlfzs65X94ec5VSbI9n//mSfBBCwnb9Y31hfmH+Oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFyZwOvbfnrJLCoMpFVmDNr94w06VNLpDLLJunbImUU=;
 b=GIDDRsQZHVNpVb2Cxa/plTbYBpSOXpROvbhFOWr+XE0rfYp4HHoc7cpkHBAd1dkerzNBSTsd0aq9c/fDrMGk7JWZMPjDt2LnY3nE0xbTXQJ9iPbUHrIuBFZ69uZw+IncMn+tjGJlbmwXiwUjWWGFQSvdUx2W4Mwtqx8AWHCjMRazxumQjRKcyZz+MSS4ucyO8MWdUySZuUpSVfzzhtwhsPVgI32GhD7BoL3Doyro0gFXrc3+9tM/x4qKyGDQCdStYzD8jctRvKaVeeb3Iebn/jL82xfyspYF6oZBM1aXKtTba96BBgLVOQ1lD2Q0PSC6dN99nzzzRsyjVtQxJlSV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TY8PR06MB9054.apcprd06.prod.outlook.com (2603:1096:405:3ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 06:25:22 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:25:21 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"bmasney@redhat.com" <bmasney@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, Gary Yang <Gary.Yang@cixtech.com>
CC: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Thread-Topic: [PATCH v2 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Thread-Index: AQHc9Jq2rirJyAP+U0uJTk4kNpzTyLYvr06AgAYYncA=
Date: Tue, 9 Jun 2026 06:25:21 +0000
Message-ID:
 <SEYPR06MB622609AFF7C23086A0D53E12821D2@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
 <20260605032225.523669-2-joakim.zhang@cixtech.com>
 <17528d9a-738c-48fe-ac24-b8d90875a74f@kernel.org>
In-Reply-To: <17528d9a-738c-48fe-ac24-b8d90875a74f@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TY8PR06MB9054:EE_
x-ms-office365-filtering-correlation-id: 03001380-3293-46ad-6785-08dec5efe248
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|3023799007|56012099006|4143699003;
x-microsoft-antispam-message-info:
 trfYOBgoV4uFOpmXdFBfXAGEpeNGx89fJURK+0yPnqVvM0dhVmhTFiutMHyzyLpz7a8H1BNjchq6JND+H7/LzygxyqMqtuUzaco8iUKJrYy8CkBLU6raKtRCZuNOTWjrR23SCbDwROutFuzwel9/vhsXQITrBbQ5lA+/XqJ0bBEureOy8C/9Zal9FVmjhC3qOjgXnaP6d6VKKtnZV6pMOCDvvxwlbQ5m0+4KNSGHaUHmgE5n05/I2D9I8Y8JNI+eoxTzaHD5QhiE1FCuj/qs6hoxaGJ08fffhAep0/HS/p6Vq+m0Q/fOkzoEy59YQxEpAZMwgjQ0vyHnSSp3Qy1vTw6b93maWup0RC7lVb0UCT0hcuG9K4J+ExaWGhO9ahp0+KQNKjmKdHWrY2jO77MVkT3Bxp+jOS1Qlmug9JiMyrfpDU0CqufHQ4Swz8cHqtUPbQUuDVZ6F4D+lcNtBbxoOiiEk4MEuD63y9V54nVdAvcu5E3N4meogbCQiPe2LV7Vl1mPag1Zsi/SDdQkqujoYEJxGIGk44fn9crnJnnCNKr8RL5Hul5PK8s9kK7MoAXCfNAIQcQ5dYdGZbp491yyLCVq5Oi0sHfxdbsSpVsykeFK+TeeJ0F/MIBHou5GZA7bDG3mqmdvOIXeV5DLnp/qi5vxinEXq0TB/I+9S/6Mhz/jOg3oMYoiLoBolBAXNfVnBzvipLLX/OnrbFWMumgeppwSX52NBiTMzTzs2DUStvJrbylQnCEf6yenOada3RKQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUp2UVo4TVpPZk9ETko4R1hsWkJTYnpaVkVNVUpNalFBV3FZOVFtRG13T3cv?=
 =?utf-8?B?Y0k2MmN1VnYyR01NcTFvZnRyZWNLQnhUZXljNUtxZldvSDN0NmtoMm9sUnB2?=
 =?utf-8?B?Z2pQVUo2VSt3cXBVcXNoYUUrTEc1WjRSeEtkM0ZaV2E0M2tqK0pBeVZ5emth?=
 =?utf-8?B?Ykp4ZVl4azVDaENYUElSY2h5clo3MmRHMnNQdTlFSUEzbjNHcjN4VGsrL1Bq?=
 =?utf-8?B?cEUvRDc3V0pab3dYV0FDNWpjYnA3ZVFJQWx0ZUJjWG9jUndTT25CNElIYWtO?=
 =?utf-8?B?WkcvMTVUZWRYbXczbU10cDIySEFUenJtelRTOCtxSmJOWGQzWDl5RktGZXFL?=
 =?utf-8?B?eU9qVFFlR1RUSkdML29GOXNydVFaeWdTS1VuOVNNRE1JbnNNeHBsaVpZTjRk?=
 =?utf-8?B?V0RhdXZmZDhpYlZhRzhNd2NsQnEwMnNqcUtGdFhzK3pUWHQrTVF6bW14L3kz?=
 =?utf-8?B?UHpxbWZyNnI5QWt5eFF3UitFMlpSakxsakRQQmc0NXFMUk00aXI4dktWbERz?=
 =?utf-8?B?akM4bWVIRS9FQU9hSDd3QkxaZ1RVMHZZaGQxbE5aU3ZqbHpmbm5laXUzRHF0?=
 =?utf-8?B?dlFhd3VWUUk4YVFVN0gxQ0JvWXY5VkpYcVZkK1RlUEppM1RmSDRmVDdPWDdi?=
 =?utf-8?B?TFFwSDRoaXdwdmtBeGxoR3o5b0pvZDhpUkFXQ1YxUzg2M01BUHUwYUkwS1dV?=
 =?utf-8?B?c25lckpUL3BOeEZWbU85T0hYZTNuOTZPajRCdVJPaDlJRmE4b0hSb0xrRWVC?=
 =?utf-8?B?MmpkSGJGeHRKaWw4dnBXcEErNnVjV0F6UGpkaHk3cTJhb09CMjJjVFQ4OFRW?=
 =?utf-8?B?UUExaS9FcE51THl1MmhVOVNEQnc0ZU44SHdpVWJlOGdUWFk0TUdVREpMK290?=
 =?utf-8?B?Yyt6OHU0bVBaKzlPelFHeTh0YUJXQmE2cWdsV0Zsakc5ejVSR2RETVdXWjh1?=
 =?utf-8?B?RWtxdTJFWFcxWnkxZ2FDVmYvbVdTNTFHcG1LdXJEYytTUHJmSFRqaGpzMVR3?=
 =?utf-8?B?OHlscFltdXZpUU03U2pFWFBtd1EyaXNRVlpaQlFYQU9YWkllWWlkZjRLRlE1?=
 =?utf-8?B?dnlNRkNsaXRpbjdoL2UyNEJ4aW9UbzFyR01EdDNoTWJiNENFKytwVThDVS9q?=
 =?utf-8?B?VFdXOXhVS1FjbHY2RDV4ZVVIclZYMFI1cjkxTThvcWpXcW8vNEVFclUwcWlr?=
 =?utf-8?B?VHgzVWw1NkdScVl0Uk1aRnhqS3NxWXpZNFUrcWdFYTR0NDZzWVF5ZGlvU09n?=
 =?utf-8?B?c3A4bGhkbEppZGdvalE2MFd0QjljeDFMcmRwNGdlb1FLOGdsTVZOZmRvK3da?=
 =?utf-8?B?dElLWXhJL3pKRlpVRnFEL1NmRnVLM2FVbEd1WnJCei9CYnVxb3E4UVpORy9U?=
 =?utf-8?B?ZkJHTTVibjlvR3ZRMFpUV1NUZ0ZCbm40ZjVBN09JZ2ZidUorMzZsV3pkV2l5?=
 =?utf-8?B?MCtZU254QmJ5eEd3bXZTcjc3NTJ2cUNTRnpCeUJOWHEweDBGODNzQWVFN2xK?=
 =?utf-8?B?UHREUjJzYUc5d0d2RTgweGdQUjFQOUl0UHUrMFJkaGdoYzhZMEtrWFNicUJa?=
 =?utf-8?B?YkgySU5OOVhWR3BkcFZOZE9pSCswK0FwWWsyQklRbEJpMEVlQWc3SVZ0N1R2?=
 =?utf-8?B?cThjU09KdjN1aEUwb213eEFoRUlHcWFOVlR5TXh0N0dYQjh5K25JeFkzWXpX?=
 =?utf-8?B?S0dkcFpUdjZqV3d4TGNCOEpISGJWTEFSWHIvVXppTEM3SUFlY0VUbU1UWkRK?=
 =?utf-8?B?OUhGYUt3TzRjRktiYTVEcThIK205bDBCR1o3eUl6MkhNd3JMVU84TkpMdDRZ?=
 =?utf-8?B?VFYreXVWRE5nRk4ybnZQbjNRRlNsNmhXTTdQeWNZTUhYSzdrcXRYSjloNFBq?=
 =?utf-8?B?cXdxc29IQ0ZGallsSXcrZ0pwYytvMC82K0d6dHBoTENlMjlaSytDRDhvaHVu?=
 =?utf-8?B?N1pWM3ZBdDZPU3cwMDBrTVRlbDFoNVRkV2JYSjFWZkNSYlpzRlo2azI0cTM0?=
 =?utf-8?B?aWh2dFdIdjdMbitsbTk4RnpBcDM0bmNZUnBoemFkWkRXZS9wMEVzMzlLQUVG?=
 =?utf-8?B?RTJ3cFRldVc2SHRaMHE2clJ4NkVXOGVVcVlSSTVNNUhrU0R3ak9kTlArWWRK?=
 =?utf-8?B?U0JWdWNlMGRobjFqZzhybi83NWlFWFU1WlV3MHFvOXBwajBIOWUrT0pGanNH?=
 =?utf-8?B?d25pOFUyQVJBQy84N0hiKzFWZTRNY3QzbzQyNVJoSmxrS2lraVc0RElaTUJs?=
 =?utf-8?B?cis4cTBYOEtUQ0xCOFZUYmIwa3VEU3NUbEV3MGl6eVFoMFhNWWh3WjZVNmor?=
 =?utf-8?B?YlJaRkRxd2U2Y1ZUZFVybjVTbkxkM1F2ekdiSnpwY1BETFdGYW9CUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 03001380-3293-46ad-6785-08dec5efe248
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 06:25:21.7207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3giKF/Q1X4zGHAzDBKbsayk5Asd/ql+KTQj+5BoeX+9KnUl1N1Bhec8JX9Z20Pe5N6TvLBh7LrqByRKbCE9nb646Mq9pOGzQHcik8LHCvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR06MB9054

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKdW5l
IDUsIDIwMjYgNToxOCBQTQ0KPiBUbzogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVj
aC5jb20+OyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsNCj4gc2JveWRAa2VybmVsLm9yZzsgYm1h
c25leUByZWRoYXQuY29tOyByb2JoQGtlcm5lbC5vcmc7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsg
Y29ub3IrZHRAa2VybmVsLm9yZzsgcC56YWJlbEBwZW5ndXRyb25peC5kZTsgR2FyeSBZYW5nDQo+
IDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+DQo+IENjOiBjaXgta2VybmVsLXVwc3RyZWFtIDxjaXgt
a2VybmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPjsgbGludXgtDQo+IGNsa0B2Z2VyLmtlcm5lbC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAxLzVdIGR0LWJpbmRpbmdzOiBzb2M6IGNpeCxza3kxLXN5c3RlbS1jb250
cm9sOiBhZGQgYXVkc3MNCj4gc3lzdGVtIGNvbnRyb2wNCj4gDQo+IEVYVEVSTkFMIEVNQUlMDQo+
IA0KPiBPbiAwNS8wNi8yMDI2IDA1OjIyLCBqb2FraW0uemhhbmdAY2l4dGVjaC5jb20gd3JvdGU6
DQo+ID4gICAgY29tcGF0aWJsZToNCj4gPiAtICAgIGl0ZW1zOg0KPiA+IC0gICAgICAtIGVudW06
DQo+ID4gLSAgICAgICAgICAtIGNpeCxza3kxLXN5c3RlbS1jb250cm9sDQo+ID4gLSAgICAgICAg
ICAtIGNpeCxza3kxLXM1LXN5c3RlbS1jb250cm9sDQo+ID4gLSAgICAgIC0gY29uc3Q6IHN5c2Nv
bg0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgICAt
IGVudW06DQo+ID4gKyAgICAgICAgICAgICAgLSBjaXgsc2t5MS1zeXN0ZW0tY29udHJvbA0KPiA+
ICsgICAgICAgICAgICAgIC0gY2l4LHNreTEtczUtc3lzdGVtLWNvbnRyb2wNCj4gPiArICAgICAg
ICAgIC0gY29uc3Q6IHN5c2Nvbg0KPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ICsgICAgICAgICAg
LSBjb25zdDogY2l4LHNreTEtYXVkc3Mtc3lzdGVtLWNvbnRyb2wNCj4gPiArICAgICAgICAgIC0g
Y29uc3Q6IHNpbXBsZS1tZmQNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHN5c2Nvbg0KPiA+DQo+
ID4gICAgcmVnOg0KPiA+ICAgICAgbWF4SXRlbXM6IDENCj4gPiBAQCAtMjcsNiArMzIsMTEgQEAg
cHJvcGVydGllczoNCj4gPiAgICAnI3Jlc2V0LWNlbGxzJzoNCj4gPiAgICAgIGNvbnN0OiAxDQo+
ID4NCj4gPiArICBjbG9jay1jb250cm9sbGVyOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvY2xv
Y2svY2l4LHNreTEtYXVkc3MtY2xvY2sueWFtbCMNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+
ICsgICAgICBBVURTUyBpbnRlcm5hbCBjbG9jayBwcm92aWRlciAoY2l4LHNreTEtYXVkc3Mtc3lz
dGVtLWNvbnRyb2wgb25seSkuDQo+IA0KPiBBcmUgeW91IHN1cmUgdGhpcyBwYXRjaCBidWlsZHM/
IFlvdXIgY292ZXIgbGV0dGVyIHNob3VsZCBleHBsYWluIG1lcmdpbmcNCj4gZGVwZW5kZW5jaWVz
L3N0cmF0ZWd5L2NvbnN0cmFpbnRzIGluIHRoZSBmaXJzdCBjaGFwdGVyLiBZb3Ugc3RhcnQgd2l0
aCBUSEUgTU9TVA0KPiBpbXBvcnRhbnQgaW5mb3JtYXRpb24uDQp5ZXMsIEkgYnVpbGQgeWFtbCB3
aXRoIGJlbG93IGNtZDoNCm1ha2UgLWo4IEFSQ0g9YXJtNjQgQ1JPU1NfQ09NUElMRT1hYXJjaDY0
LW5vbmUtbGludXgtZ251LSBkdF9iaW5kaW5nX2NoZWNrIERUX1NDSEVNQV9GSUxFUz1Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2NpeC9jaXgsc2t5MS1zeXN0ZW0tY29udHJv
bC55YW1sDQptYWtlIC1qOCBBUkNIPWFybTY0IENST1NTX0NPTVBJTEU9YWFyY2g2NC1ub25lLWxp
bnV4LWdudS0gZHRfYmluZGluZ19jaGVjayBEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2NpeCxza3kxLWF1ZHNzLWNsb2NrLnlhbWwNCm1ha2Ug
LWo4IEFSQ0g9YXJtNjQgQ1JPU1NfQ09NUElMRT1hYXJjaDY0LW5vbmUtbGludXgtZ251LSBkdF9i
aW5kaW5nX2NoZWNrIENIRUNLX0RUQlM9eSBXPTEgY2l4L3NreTEtb3Jpb24tbzYuZHRiDQoNCkl0
J3MgYWxzbyBwb3NzaWJsZSB0aGF0IEkgY29tcGlsZWQgdGhlIGVudGlyZSBwYXRjaCBzZXQgYWZ0
ZXIgaXQgd2FzIGNvbXBsZXRlZC4gVGhpcyBpcyBpbmNvcnJlY3QgYmVjYXVzZSB0aGVyZSBhcmUg
ZGVwZW5kZW5jaWVzIGludm9sdmVkLiBJIHdpbGwgY2hlY2sgaXQgYWdhaW4gY2FyZWZ1bGx5Lg0K
DQo+IFlvdSBuZWVkIHRvIGRpc2FsbG93IG5vZGUgZm9yIG90aGVyIHZhcmlhbnRzLg0KT0sNCg0K
PiANCj4gPiArDQo+ID4gIHJlcXVpcmVkOg0KPiA+ICAgIC0gY29tcGF0aWJsZQ0KPiA+ICAgIC0g
cmVnDQo+ID4gQEAgLTQwLDMgKzUwLDIyIEBAIGV4YW1wbGVzOg0KPiA+ICAgICAgICByZWcgPSA8
MHg0MTYwMDAwIDB4MTAwPjsNCj4gPiAgICAgICAgI3Jlc2V0LWNlbGxzID0gPDE+Ow0KPiA+ICAg
ICAgfTsNCj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9j
aXgsc2t5MS1hdWRzcy1zeXN0ZW0tY29udHJvbC5oPg0KPiA+ICsNCj4gPiArICAgIGF1ZHNzX3N5
c2Nvbjogc3lzdGVtLWNvbnRyb2xsZXJANzExMDAwMCB7DQo+ID4gKyAgICAgICAgY29tcGF0aWJs
ZSA9ICJjaXgsc2t5MS1hdWRzcy1zeXN0ZW0tY29udHJvbCIsICJzaW1wbGUtbWZkIiwgInN5c2Nv
biI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4NzExMDAwMCAweDEwMDAwPjsNCj4gPiArICAgICAg
ICAjcmVzZXQtY2VsbHMgPSA8MT47DQo+ID4gKw0KPiA+ICsgICAgICAgIGNsb2NrLWNvbnRyb2xs
ZXIgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImNpeCxza3kxLWF1ZHNzLWNsb2Nr
IjsNCj4gPiArICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc21jX2RldnBkIDA+Ow0KPiA+
ICsgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgIGNsb2Nr
cyA9IDwmc2NtaV9jbGsgMD4sIDwmc2NtaV9jbGsgMT4sIDwmc2NtaV9jbGsgMj4sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIDwmc2NtaV9jbGsgMz4sIDwmc2NtaV9jbGsgND4sIDwmc2NtaV9j
bGsgNT47DQo+ID4gKyAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImF1ZGlvX2NsazAiLCAiYXVk
aW9fY2xrMSIsICJhdWRpb19jbGsyIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAi
YXVkaW9fY2xrMyIsICJhdWRpb19jbGs0IiwgImF1ZGlvX2NsazUiOw0KPiA+ICsgICAgICAgICAg
ICByZXNldHMgPSA8JnNyYyAwPjsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jaXgsc2t5MS1hdWRzcy1zeXN0
ZW0tY29udHJvbC5oDQo+ID4gYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLWF1
ZHNzLXN5c3RlbS1jb250cm9sLmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMmViYzVjNGYxMGNkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2l4LHNreTEtYXVkc3Mtc3lzdGVtLWNvbnRyb2wu
aA0KPiA+IEBAIC0wLDAgKzEsMjcgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UgKi8NCj4gPiArLyoNCj4gPiArICogQ29weXJp
Z2h0IDIwMjYgQ2l4IFRlY2hub2xvZ3kgR3JvdXAgQ28uLCBMdGQuDQo+ID4gKyAqLw0KPiA+ICsj
aWZuZGVmIERUX0JJTkRJTkdfUkVTRVRfQ0lYX1NLWTFfQVVEU1NfU1lTVEVNX0NPTlRST0xfSA0K
PiA+ICsjZGVmaW5lIERUX0JJTkRJTkdfUkVTRVRfQ0lYX1NLWTFfQVVEU1NfU1lTVEVNX0NPTlRS
T0xfSA0KPiA+ICsNCj4gPiArI2RlZmluZSBBVURTU19JMlMwX1NXX1JTVF9OICAwDQo+IA0KPiBN
b3N0IGxpa2VseSBfTiBpcyByZWR1bmRhbnQgaGVyZS4gQ29uc3VtZXJzIHdpbGwgaWdub3JlIGl0
IGNvbXBsZXRlbHkgYW5kIHRoaXMgaXMNCj4gYmluZGluZyB1c2VkIGJ5IGNvbnN1bWVycywgbm90
IGJ5IHJlc2V0IGNvbnRyb2xsZXIuDQpPSw0KDQo+ID4gKyNkZWZpbmUgQVVEU1NfSTJTMV9TV19S
U1RfTiAgMQ0KPiA+ICsjZGVmaW5lIEFVRFNTX0kyUzJfU1dfUlNUX04gIDINCj4gPiArI2RlZmlu
ZSBBVURTU19JMlMzX1NXX1JTVF9OICAzDQo+ID4gKyNkZWZpbmUgQVVEU1NfSTJTNF9TV19SU1Rf
TiAgNA0KPiA+ICsjZGVmaW5lIEFVRFNTX0kyUzVfU1dfUlNUX04gIDUNCj4gPiArI2RlZmluZSBB
VURTU19JMlM2X1NXX1JTVF9OICA2DQo+ID4gKyNkZWZpbmUgQVVEU1NfSTJTN19TV19SU1RfTiAg
Nw0KPiA+ICsjZGVmaW5lIEFVRFNTX0kyUzhfU1dfUlNUX04gIDgNCj4gPiArI2RlZmluZSBBVURT
U19JMlM5X1NXX1JTVF9OICA5DQo+ID4gKyNkZWZpbmUgQVVEU1NfV0RUX1NXX1JTVF9OICAgMTAN
Cj4gPiArI2RlZmluZSBBVURTU19USU1FUl9TV19SU1RfTiAxMQ0KPiA+ICsjZGVmaW5lIEFVRFNT
X01CMF9TV19SU1RfTiAgIDEyDQo+ID4gKyNkZWZpbmUgQVVEU1NfTUIxX1NXX1JTVF9OICAgMTMN
Cj4gPiArI2RlZmluZSBBVURTU19IREFfU1dfUlNUX04gICAxNA0KPiA+ICsjZGVmaW5lIEFVRFNT
X0RNQUNfU1dfUlNUX04gIDE1DQo+ID4gKw0KPiA+ICsjZGVmaW5lIFNLWTFfQVVEU1NfU1dfUkVT
RVRfTlVNICAgICAgMTYNCj4gDQo+IERyb3AsIG5vdCBhIGJpbmRpbmcuDQpPSw0KDQpUaGFua3Ms
DQpKb2FraW0NCg==
