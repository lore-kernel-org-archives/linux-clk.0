Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2106.outbound.protection.partner.outlook.cn [139.219.146.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892037267A;
	Tue, 13 Oct 2026 05:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869399; cv=fail; b=A2xbqogPnDlZgAQzL90G3lRNfhOGHwoyBqXAY0MFn+oagfEKsyJ6mFKPv9Ga7EIqlphDYcO1GmhCoJTKvX70w/vJpXL/poZUnqMDs7uFF4WpHWSsraSUbvkXDPgQ4apJhdHBvLhzlLfI/cngqKJeJj+6d+iWEk1Yntp1yg3q7R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869399; c=relaxed/simple;
	bh=j/Tcqq+Q1dy5TsFndErGVwLS8DLLHx1/q0GNJt/upgw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CnTTePu/Ux4aanMni37dlvJuH3UJYG/dumMerdf5RaoBLzDK05aptavYy5stDUKIAefx4uZPUAc91aCEqJTV0FReme642NszSEtpg9is5xuWEYe4uKPDK3F+ogTFS2+vY7utuBt52svTsOxJ+BTLbME8AtSzv+d1ASe4BOP1+7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OavkdwEQ8O2iSG+SO9XrCB+QHNoT3MmLfbyTXYV2Xjbzi8UWSUJRSwbYgp8QVz0lzo4IxuB7scgaTY8LNfZBSzCpQ3UMsDqpl8mo4/eFpIU1SfOhyrVLl2UATVrgwvj66Pabh8GENY8xw+42+ZOZCAOzObaHbzuYsCUk42fYclQck9gs1XCt4+S3c5e02DbYdjb1golLC692LITApZE9ePd03UuoGVkriRNsSAjCNdtu4UIf2f9dYdvuSrsoih8RN4VGhv3phQgBT1CQ0dbKdPImnx9+Mr4rA8QZ2ZAvoJy8C0FLdFNkzURJe05VC0ZQr9gddpA9inbJss39OzfnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/Tcqq+Q1dy5TsFndErGVwLS8DLLHx1/q0GNJt/upgw=;
 b=VWyogXUiWYwOiIYwYCjdOSQNGBaoqYiqdXpQpjlgUVRH2TNkKs00xbkXR4CygS2rORGw3vUzvOYsgIkdNtkshjKxNITGL60Oo8f/TvUATwkj8wWH1iiTUjuAMG6Wr+uCX7+Ausl0DWl+4+kUZsWxkbRXBMtjB+tLBAd+xozApu9GGyIKu9l/5ZL/A5H3OWGl+i5sOq1a1s2RXDmoLbUKeC4V17Q3ixUtvp9dFtTGVFYlaQMbyTi+KXwvjozUQqUiUC0tjbEpXnbOJt7zIXSXxYbyQzMzvKpiWDkhbRKVlpbSug2DYpsxrNfE3hi3J0V4RNivkc8Jli7rQuUIClxQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1300.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 05:29:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 05:29:44 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Topic: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Index: AQHdVyFHfUH4Tl4BA0S8azUC8I19Q7b5uLaAgAFAu0A=
Date: Tue, 13 Oct 2026 05:29:44 +0000
Message-ID:
 <ZQ4PR01MB1202DE124DED06ECEC948B89F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-6-changhuang.liang@starfivetech.com>
 <179180050742.66744.1321848308971146208.b4-review@b4>
In-Reply-To: <179180050742.66744.1321848308971146208.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1300:EE_
x-ms-office365-filtering-correlation-id: 16767fb2-fe0a-4877-9b27-08df28eafcfd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|10067099003|3023799007|261009223027099003|38070700021|4143699003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 rYD2K2GumGRYBghKpMLxxavlwuk5cHwtYna/3aMgFwd/uBMEi84oqOa3PqVbAvyDym8stRXYbGEdm/IrA96rrqmsCdjrZNpVdRyjsWXi4hQGDYEMi51vlqL28syBINPEF4OcRg/m2GR6aLa2ansomPEFft+FPwSSc9IKIxf3EAHveddZ7jgyUBnEutQszkffR8HWPqsMdpUUMfNd7GYQ/qpLZ07sQuUk25Vfc5TwWjWHqcJSiekDDgWWfskZqXRKqvhHwjtejF2fBsXKr9k7SIFKeC8w+tv5gMPEb2XJlUOkqCeOxHcaA2NFJch7Xbrm4l3kEPHSpsHx0PjbtYHx6s6L424YLy4ELV+Hrdrb7vkudD8+ePVtXNp7gyib8ipZmglcTJdLbdoxJee3ke8IohSQ/VLC8K8f4+gdz+DeIVdLH9eMp9WU5ubm/ArjKONNFbFbcl9AJtL5QbIajvTU4PdEh0/+QeRDvw1CfyOrygbcVYKGm+BxgopTMC6keEMejPEg74K0nzU3TBOovWdkKyjkgx/i4WmB0y/v5tafrW0C+fNUzh4bqCrL2Dntutps
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(10067099003)(3023799007)(261009223027099003)(38070700021)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVhMbVEyQWNjL2VETUcrMVloU1UvQ0ozejYvek1EK3JwUWVGNFJRQnNoMVVF?=
 =?utf-8?B?aDByRSt3VVl2b3VUS1pwU1pVaXZKUmMxOHl3UXZma0hiYVZ5a09PL0RqOTAx?=
 =?utf-8?B?SWIzeFdaTFJ2cEhIS0NoV2pOUkhnM1Y0OUNialRjM0wvZGEyWU50R3NaRnd1?=
 =?utf-8?B?K0V0clRKRUVMOGlVYXRNdnBPUzJPUDAyc2drTXZwNjZyeFljNFhBeFpUaE1S?=
 =?utf-8?B?eExObUlLbHZlWTJnY0tXdnFWT3J5SjFydy9TS2o1aFB3eXZ1YXhDNW5IcmRW?=
 =?utf-8?B?b00wOXBwQzhmQVBveWF5dlBWcndVanRMUzdEdVVrZjh5eEZOMVdGU1crWGFv?=
 =?utf-8?B?T3NqWUJaZk1TTmcyeW5jeTJ2dm10dFM2QWgzbEJ3eGhUL1c5ZkhJUFJ1WlN0?=
 =?utf-8?B?ajZqUDhOQU45Y203a1Rpb3RjYzFBWmt0OWZPYlMrdWZ4V2ZVZmZUNmUvQk5B?=
 =?utf-8?B?RlB1Tzk4M2Mvd1BxMjJzUVpxL1NkNVF3TFhsYzlHQm5HK2ErZlF4R2FBNHVs?=
 =?utf-8?B?NHRETmM3TERCdXcvMVQ4d3BGUTZFVCtwSnZVTmJpeTkvR29sN1dZc2lMQ3RE?=
 =?utf-8?B?WUJ0bklkRWZDS1UxZ1dqc3ZjRWRUZzBsdEVETzcvSFRmMHBGaWdVa2pvRlR5?=
 =?utf-8?B?QmFzZ1dkZ05ZWEtBTG5mcEpaTVdndjYwcStoZDBIU25XVUt4bDRsa1QwOUpF?=
 =?utf-8?B?VWJ0SkRNeTZzM0Ftb2xFaDZTUEYwY3ZoSWlQRFpOL2NYOHlibURsdnlSM3pN?=
 =?utf-8?B?K0l6Z3Q0Zjc1TmdhS25HM1lUQ1g1NVo1VHRVNVdSVVBEemNiNGVNRnN0eVJU?=
 =?utf-8?B?a01LTk9BQnNQekVwUDMyU0FtUitSa3pINCtXSm9tOXBKM05ub2VBSzhBZEpw?=
 =?utf-8?B?dUNhSFBNbEx3bVRrcTdVVDNqVTZqUHBuQUVZa0pMdU4wRW1uQXlmcEtUU2Js?=
 =?utf-8?B?aEdldXdmS3pleDhrZkplMWtiNTRuTXZmamFqQ2RuUG5lKy9zQTFPMXl1UUt4?=
 =?utf-8?B?bnZEcG8xOVduWWxkdGR3aXJBKytnbmhwTzNtU1FZYlN6VWN3bm9RYngwVlc5?=
 =?utf-8?B?bzlITjExQTVrSzRiMFRhcUZEck9VcXFuem9OV2dUKzVmRXNRclR3cmRiTVFx?=
 =?utf-8?B?MmtQazdmWVI4MFIwSHQwaU1CaXZxbUFRalBvSE5EOENFNllpUmlFb1N3SVVn?=
 =?utf-8?B?UDIxcVZqT2FucndLRHFzTTRWYmFzbktaV083eWpvWUZtRG9MRnVSbCs2ekpv?=
 =?utf-8?B?SjYyQkZQU3luMEhRZlFPYWNTM05WbENrU3FPVE5TT1hJN2lOUitDL0FiVlFj?=
 =?utf-8?B?cGJKTEwrS0VqcUZWd3cvUk5FQmU0MnVTeGNBb0Y4ZW1uaWcveVhYSndlQk51?=
 =?utf-8?B?UWJ1Mk5JdGtvTFpKamdxWHFubXFWUEM3TkRzenJ4MUYyS2cyMnU4a29JZFhp?=
 =?utf-8?B?OGYrRXFULzJVbldlQ0VSRGZYQVlTTWdxMHdRYmVtT05KK2YyVW9Edmk1Z01B?=
 =?utf-8?B?RU5EL1cwMDFyK25qcnlGdEtOY2RjYVNkbFhSV0dodW5GK3FHVVloaytDTmI0?=
 =?utf-8?B?RHlJRHU2RHAvTnZvS3k1aUJ0bHl0ZEkxc05hUTVBQzFDRkF6QjBUcTR4V1JY?=
 =?utf-8?B?cHlIdjMyNzlIUDFQbkpyT1dwQ3hCa1RnOFcyeGJKaFlFeXRBdjdBdythMkNM?=
 =?utf-8?B?OXVnZVZSSFVzOUhIT2U4TWNZNi9HVDNnK2luUUpOOG10T3Y1Q0pRNjBnWTk4?=
 =?utf-8?B?N3czZjBUK3F2MlVuNXdWYmw2L0JPQWRlT2ZrSHBMUlUwN2RPYW52NGpscHl2?=
 =?utf-8?B?WDFFTHcyai95K1RYVVZ0OERCUEZsZmNicDZTczZlZnNBMzEyK0dZYk8rbjZO?=
 =?utf-8?B?UW51WHg0S1J1cnFmTjRXTDV6d1MweFhGaGdvZGExWDBHdGNJejZFczdMaG1P?=
 =?utf-8?B?dFNZMmN6NkxZYTZwNUtxQ2lhUVloMXdNQk5LUGZFcWsvdFpXZ2dPdS8yMldw?=
 =?utf-8?B?M1MzcEZOYm13WUljUHQ5MXJqbWZxbm5mallLTXRITXBGMHBaWWhRdVhJUkFH?=
 =?utf-8?B?YTQreXBMZzhGbXFoSmNhYlVFdHVhOC9xZHU1cC9aekljbXlJN3BSWkhpNm85?=
 =?utf-8?B?ZUMvY3JOQXNOZGZPVDVrOUJaam8xNlBXaGlsbGx0L3YxM29CMVRpelVBbkJD?=
 =?utf-8?B?Q0FnYjNxdm1FbzZMdnFxYm91Qmo2WjNzclIzcndtZXlPMS9TMEczUUFYN2dv?=
 =?utf-8?B?Q3FuMGlEUS9LVTdXTTg5ZDNoODA0UEtYUXowcElVc0JubzRMSWpkQ3ZRejJp?=
 =?utf-8?B?c1ovdVJwOFJYbnpzRnUxZWxGbTIzOTVqVkhZTlNwUUVMaTY3VGRwa0dIODN3?=
 =?utf-8?Q?d+R1tTZYIQ7JNGh4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 16767fb2-fe0a-4877-9b27-08df28eafcfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 05:29:44.1250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eTfJjRMcai2ooMc7yOLxhXtHfzeAZuYZkR1nq925WSct2nT2tJgTgIxS2k0Qn2NrgM3WpcaDlX3L/aYpuAl06J18MDZL3OuvGkIKAX0QTkkW9JZeUI8sOF+02wENuK7Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1300

SGksIEplcm9tZQ0KDQo+ID4gQWRkIHN1cHBvcnQgZm9yIEpIQjEwMCBTeXN0ZW0tMCBjbG9jayBn
ZW5lcmF0b3IgKFNZUzBDUkcpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBM
aWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKw0KPiA+
ICBkcml2ZXJzL2Nsay9zdGFyZml2ZS9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMTAgKysN
Cj4gPiAgZHJpdmVycy9jbGsvc3RhcmZpdmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAy
ICsNCj4gPiAgLi4uL2Nsay9zdGFyZml2ZS9jbGstc3RhcmZpdmUtamhiMTAwLXN5czAuYyAgIHwg
MTU2ICsrKysrKysrKysrKysrKysrKw0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE3NSBpbnNlcnRp
b25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9zdGFyZml2ZS9jbGst
c3RhcmZpdmUtamhiMTAwLXN5czAuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMgaW5kZXgNCj4gPiA2NmQ2YzE1ZjFkZDIuLmRmZjhiODE5ZjgzZSAxMDA2
NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gQEAg
LTI2MjE3LDYgKzI2MjE3LDEzIEBAIEY6DQo+IAlEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L3N0YXJmaXZlLGpoNzExMC11c2ItcGh5LnlhbWwNCj4gPiAgRjoJZHJpdmVycy9w
aHkvc3RhcmZpdmUvcGh5LWpoNzExMC1wY2llLmMNCj4gPiAgRjoJZHJpdmVycy9waHkvc3RhcmZp
dmUvcGh5LWpoNzExMC11c2IuYw0KPiA+DQo+ID4gK1NUQVJGSVZFIEpIQjEwMCBDTE9DSyBEUklW
RVJTDQo+ID4gK006CUNoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0
ZWNoLmNvbT4NCj4gPiArUzoJU3VwcG9ydGVkDQo+ID4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9jbG9jay9zdGFyZml2ZSxqaGIxKi55YW1sDQo+ID4gK0Y6CWRyaXZlcnMv
Y2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaGIxKg0KPiA+ICtGOglpbmNsdWRlL2R0LWJpbmRp
bmdzL2Nsb2NrL3N0YXJmaXZlLGpoYjEqLmgNCj4gPiArDQo+ID4gIFNUQVJGSVZFIEpIQjEwMCBF
WFRFUk5BTCBJTlRFUlJVUFQgQ09OVFJPTExFUiBEUklWRVINCj4gPiAgTToJQ2hhbmdodWFuZyBM
aWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiA+ICBTOglTdXBwb3J0
ZWQNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3RhcmZpdmUvS2NvbmZpZw0KPiA+IGIv
ZHJpdmVycy9jbGsvc3RhcmZpdmUvS2NvbmZpZyBpbmRleCA1MTcxNjY1NTU1NGYuLmNkNWI3NzU0
NDAzZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9zdGFyZml2ZS9LY29uZmlnDQo+ID4g
KysrIGIvZHJpdmVycy9jbGsvc3RhcmZpdmUvS2NvbmZpZw0KPiA+IEBAIC03MiwzICs3MiwxMyBA
QCBjb25maWcgQ0xLX1NUQVJGSVZFX0pINzExMF9WT1VUDQo+ID4gIAloZWxwDQo+ID4gIAkgIFNh
eSB5ZXMgaGVyZSB0byBzdXBwb3J0IHRoZSBWaWRlby1PdXRwdXQgY2xvY2sgY29udHJvbGxlcg0K
PiA+ICAJICBvbiB0aGUgU3RhckZpdmUgSkg3MTEwIFNvQy4NCj4gPiArDQo+ID4gK2NvbmZpZyBD
TEtfU1RBUkZJVkVfSkhCMTAwX1NZUzANCj4gPiArCWJvb2wgIlN0YXJGaXZlIEpIQjEwMCBzeXN0
ZW0tMCBjbG9jayBzdXBwb3J0Ig0KPiA+ICsJZGVwZW5kcyBvbiBBUkNIX1NUQVJGSVZFIHx8IENP
TVBJTEVfVEVTVA0KPiA+ICsJc2VsZWN0IENMS19TVEFSRklWRV9KSDcxWDANCj4gPiArCXNlbGVj
dCBSRVNFVF9TVEFSRklWRV9KSEIxMDAgaWYgUkVTRVRfQ09OVFJPTExFUg0KPiANCj4ganVzdCBp
bXBseSBSRVNFVF9TVEFSRklWRV9KSEIxMDAgPw0KPiANCj4gSXQgY2FuIGJlIGRpc2FibGVkIGlm
IFJFU0VUX0NPTlRST0xMRVIgaXMgbm90IHNldCwgc28gaXQgaXMga2luZCBvZiB3ZWFrDQo+IGFs
cmVhZHkuDQo+IA0KPiA+ICsJZGVmYXVsdCBBUkNIX1NUQVJGSVZFDQo+ID4gKwloZWxwDQo+ID4g
KwkgIFNheSB5ZXMgaGVyZSB0byBzdXBwb3J0IHRoZSBzeXN0ZW0tMCBjbG9jayBjb250cm9sbGVy
IG9uIHRoZQ0KPiA+ICsJICBTdGFyRml2ZSBKSEIxMDAgU29DLg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9zdGFyZml2ZS9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9jbGsvc3RhcmZpdmUv
TWFrZWZpbGUgaW5kZXggMTk5YWMwZjM3YTJmLi5kMmJhODNkN2QwMmMNCj4gPiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2Nsay9zdGFyZml2ZS9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMv
Y2xrL3N0YXJmaXZlL01ha2VmaWxlDQo+ID4gQEAgLTEwLDMgKzEwLDUgQEAgb2JqLSQoQ09ORklH
X0NMS19TVEFSRklWRV9KSDcxMTBfQU9OKQkrPQ0KPiBjbGstc3RhcmZpdmUtamg3MTEwLWFvbi5v
DQo+ID4gIG9iai0kKENPTkZJR19DTEtfU1RBUkZJVkVfSkg3MTEwX1NURykJKz0gY2xrLXN0YXJm
aXZlLWpoNzExMC1zdGcubw0KPiA+ICBvYmotJChDT05GSUdfQ0xLX1NUQVJGSVZFX0pINzExMF9J
U1ApCSs9IGNsay1zdGFyZml2ZS1qaDcxMTAtaXNwLm8NCj4gPiAgb2JqLSQoQ09ORklHX0NMS19T
VEFSRklWRV9KSDcxMTBfVk9VVCkJKz0NCj4gY2xrLXN0YXJmaXZlLWpoNzExMC12b3V0Lm8NCj4g
PiArDQo+ID4gK29iai0kKENPTkZJR19DTEtfU1RBUkZJVkVfSkhCMTAwX1NZUzApCQkrPQ0KPiBj
bGstc3RhcmZpdmUtamhiMTAwLXN5czAubw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9z
dGFyZml2ZS9jbGstc3RhcmZpdmUtamhiMTAwLXN5czAuYw0KPiA+IGIvZHJpdmVycy9jbGsvc3Rh
cmZpdmUvY2xrLXN0YXJmaXZlLWpoYjEwMC1zeXMwLmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWRhYjU0ZjIyOGFkDQo+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaGIxMDAtc3lz
MC5jDQo+ID4gQEAgLTAsMCArMSwxNTYgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogU3RhckZpdmUgSkhCMTAwIFN5c3RlbS0wIENs
b2NrIERyaXZlcg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQgU3RhckZpdmUg
VGVjaG5vbG9neSBDby4sIEx0ZC4NCj4gPiArICoNCj4gPiArICogQXV0aG9yOiBDaGFuZ2h1YW5n
IExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gKyAqDQo+ID4g
KyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0YXJmaXZlLGpo
YjEwMC1jcmcuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCj4gPiArI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgImNsay1zdGFy
Zml2ZS1qaDcxeDAuaCINCj4gPiArDQo+ID4gKyNkZWZpbmUgSkhCMTAwX1NZUzBDTEtfTlVNX0NM
S1MNCj4gCShKSEIxMDBfU1lTMENMS19HUFUxX05DTk9DX0lOSVQgKyAxKQ0KPiA+ICsNCj4gPiAr
LyogZXh0ZXJuYWwgY2xvY2tzICovDQo+ID4gKyNkZWZpbmUgSkhCMTAwX1NZUzBDTEtfT1NDDQo+
IAkoSkhCMTAwX1NZUzBDTEtfTlVNX0NMS1MgKyAwKQ0KPiA+ICsjZGVmaW5lIEpIQjEwMF9TWVMw
Q0xLX1BMTDANCj4gCShKSEIxMDBfU1lTMENMS19OVU1fQ0xLUyArIDEpDQo+ID4gKyNkZWZpbmUg
SkhCMTAwX1NZUzBDTEtfUExMMQ0KPiAJKEpIQjEwMF9TWVMwQ0xLX05VTV9DTEtTICsgMikNCj4g
PiArI2RlZmluZSBKSEIxMDBfU1lTMENMS19QTEwyDQo+IAkoSkhCMTAwX1NZUzBDTEtfTlVNX0NM
S1MgKyAzKQ0KPiANCj4gRG9lcyB0aGlzIG1lYW4gdGhhdCBpZiB0aGUgeW91IGV2ZXIgZmluZCBv
dXQgeW91J3ZlIGZvcmdvdCBhbiBpbnRlcm5hbCBjbG9jaw0KPiAod2hpY2ggZG9lcyBoYXBwZW4g
ZmFpcmx5IG9mdGVuKSB0aGUgd2hvbGUgZXh0ZXJuYWwgYmxvY2sgd2lsbCBzaGlmdCA/DQo+IA0K
DQpMYXRlciwgSSB3aWxsIGludHJvZHVjZSB0aGUgZm9sbG93aW5nIG1hY3JvcyB0byBkZWZpbmUg
dGhlIGV4dGVybmFsIGNsb2NrLCB3aGljaCBjYW4gYXZvaWQgdGhpcyBwcm9ibGVtLg0KDQojZGVm
aW5lIEpINzFYMF9FWFRfQ0xLX0ZMQUcJQklUKDE1KQ0KI2RlZmluZSBKSDcxWDBfRVhUX0NMSyhf
bikgCShKSDcxWDBfRVhUX0NMS19GTEFHIHwgKF9uKSkNCg0KPiA+ICsNCj4gPiArc3RhdGljIGNv
bnN0IGNoYXIgKiBjb25zdCBqaGIxMDBfc3lzMF9leHRfY2xrW10gPSB7DQo+ID4gKwkib3NjIiwN
Cj4gPiArCSJwbGwwIiwNCj4gPiArCSJwbGwxIiwNCj4gPiArCSJwbGwyIiwNCj4gPiArfTsNCj4g
PiArDQo+ID4gKy8qDQo+ID4gKyAqIFJlZ2FyZGluZyB0aGUgQ0xLX0lTX0NSSVRJQ0FMIGZsYWc6
DQo+ID4gKyAqICAgQ2xvY2tzIGZsYWdnZWQgQ0xLX0lTX0NSSVRJQ0FMIGZlZWQgbG9naWMgdGhh
dCBoYXMgdG8ga2VlcCBydW5uaW5nDQo+IHdoZXRoZXINCj4gPiArICogICBvciBub3QgYSBjb25z
dW1lciBob2xkcyB0aGVtLCBzdWNoIGFzIHRoZSBidXMgaW50ZXJjb25uZWN0IGFuZA0KPiBhbHdh
eXMtb24NCj4gPiArICogICBibG9ja3MuIEdhdGluZyB0aGVtIGhhbmdzIHRoZSBzeXN0ZW0sIHNv
IHRoZXkgbXVzdCBuZXZlciBiZQ0KPiBkaXNhYmxlZC4NCj4gDQo+IFBDSUUgYW5kIFVTQiBhcmUg
Y3JpdGljYWwgYmVsb3cgYW5kIGRvIG5vdCBhcHBlYXIgdG8gbWVhbnQgdGhpcyBjcml0ZXJpYSwg
eWV0DQo+IHRoZXkgYXJlIGNyaXRpY2FsIHRvby4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFu
Zw0KDQo=
