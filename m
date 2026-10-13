Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2123.outbound.protection.partner.outlook.cn [139.219.17.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27C93AE6F3;
	Tue, 13 Oct 2026 05:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791868521; cv=fail; b=EM+n6tGQECk9E8IVsnsLvZUx/ccZTWamE1/dWJtvYdSJzdkB3gp4r8QxNr49a/l/CVU7CpLse69fQWE3WMu9/yz+KxLD2LYP/J/EZVoU7e53HhadqKUhcIH2Bo0eQoAohRK2uxexfJlrVIZENZuQrWdTcM0ptOH8++fzHt9wGyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791868521; c=relaxed/simple;
	bh=E3Vx6AVfZV2kiFIUPzYDTeF7Ao1ftjmZCxWgb1Y2t38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rqy94fIIiUinumoCkS4Jh3x6zqg0Aob/juoOVpjPbUifGYuuNYkDDi65xt2rRRooq2H/hd1CVpRv4Oeqag1NYjaA8p4RfKE6MP+QsAHN8odOpnRhbfKdsJwcfRHjl6dV4sbAF8Kl1f8ED1M+wWv2pOEcvceuNNEwbkSvo/RWRdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8i1EvEvoZqopBaEqnpM1Ge2CO/sWrk44ZIGHMgKT9PL4hc4qD2A0RwLoxzg+SObMF1IxD+Jy1l6ZJ7eD499MNFDFq23nYxiKzVrMyj22nxRkuDGiZFP1r/b8lmDtQINzwOwgh2o1n+pglCfZtYDhBgFf/4dYXeNq4zJldKssfpxJQmX16h72PnMvDPGN4fhA9oW5CUwdAPg0dw6CayOx3ax1j/ypb+/9vkDcP9sWUKSaj86W8j7hlcSgDqGDml1tf+OTeU0pBbR92//ibSIOwR9VIUtn5Qqht+e+QGbHGYGUETenynAqwYCrQ9qnObIOQB+V4SE1ucyXygvIhb2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3Vx6AVfZV2kiFIUPzYDTeF7Ao1ftjmZCxWgb1Y2t38=;
 b=X0mEXbFMCkOuE4D/gozqBmhTihiIa87Hn6ern9lAKuwU3ZY3n77vrdhmCh8sCwVcMHFCpq4yuijyAQY4GF5v/13U0F5aoEOWMFhCCNrI9y3BsqmDESjEZHDmStcdZHxcFTrKriD+AjEbpXjeja7TfCVJsebT6jP3+CrKzj+eeFyE1FQbuoTuLEANJ3m7jqPNyJL6cX5s5/pQeZVs2rpA+FcQsd/epPsHjtCWEupfG92q0oDEXR5i5gnAVW8iVFJYmavEJ6OIxvGp5MT7HL01VyAWnAm1R4BRsL9F4OxS9gavV7nBOViQkMjcmVvRvEWHQf9oMtolHFc2oCh0UgYsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1283.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 05:15:04 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 05:15:04 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor@kernel.org>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
Thread-Topic: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
Thread-Index: AQHdVyFEHALg98ybyUGSo4TiegrOibb5uLaAgACR5ICAAAN1gIAAp0mg
Date: Tue, 13 Oct 2026 05:15:04 +0000
Message-ID:
 <ZQ4PR01MB1202983FF3AB28A60516B2F5F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <179180050741.66744.3459927533880490879.b4-review@b4>
 <20261012-grass-guru-1ba876eda895@spud>
 <179183257960.266355.15581316876923702717.b4-reply@b4>
In-Reply-To: <179183257960.266355.15581316876923702717.b4-reply@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1283:EE_
x-ms-office365-filtering-correlation-id: c40c18a1-f553-4694-5ac1-08df28e8f086
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|38070700021|56012099006|5023799004|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Xde70I7xqHv+urjiOYWka2uSwHhx1MiAS3bY92Dp3IX9QGoAF4mOUPLnLqkYPPU4y9DOrR+q7l7uajIGJyhIGdkwgH8oBdiy3raTVtijrIJkePBaPW3ZkjDo5ba/b6LUZlopy+VV5h4gk1DlrDIX/5lnOxla4JDmdEQNt6sYXOmYDyTBn5lCPqQCP5O9elo0PI5fx7cq/pxFGPOyKqoRxw19mOQlbnPoyJKnj2gzs9z/rNhcdbHN1ZDzV2OmnIvJQ4wlzWD/pjpjARoVTbsVNzMokoXPh8KMg2rqYFM7uYYjZcHH/199UtaBIq679pZPvMVxz+weIYpRMonXJmDNjH7Y1hdc6gUrjAYeJn0G8gI+jK3wPeiiegA/F1F4/P2WywTfHa4fpicwbXX75bKh4mYB39ylT4T3es8YP9z662kH+F+vNYw7yZb5gI8lJo3XbKdxMNJSCfMczveGMNpOyfTsfRJKnsHo1V2N4YHjNZvLtWNpwd2WfGgTa3JmRoUOUA/cMPWQkjvZ66C270VW76cVQ0e7OrEpUbX7EPsfIUjomlfKVnqDkGRTWJayDJ/u
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(38070700021)(56012099006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkxLY2laVTZNSWUvRjFobC9vQ0lwVWFseTQrOXlSeFo4VllEanpWaXVTdXl1?=
 =?utf-8?B?TW9GV3MxallZSEVINWxWUWdFQm1ldHZER3R2Rk9LWGtONy9pS2l2WGxGcHVl?=
 =?utf-8?B?djZRaFcrWS9pM3VON2ZkQTFGSExOT0U0ckhMTXh3WUpGWFB0ZVBaRm9YV012?=
 =?utf-8?B?NC80bWowQWRrL0dUQlQ4TnhLeGhzR21jNkhUQ1cyTENTQlBvMXFPaVpGZVd0?=
 =?utf-8?B?dzFzSXZ5bXN2NnNiYmRRZXJFcWVrdGorVzd4SlBLZ05LeUxVQWlHdEZoVWY5?=
 =?utf-8?B?Y0c2L1FTMUVKSmJOaXMvVVNobWdkVWl0QU9SWktxdHRRTHMyTU5PSTIxYXhl?=
 =?utf-8?B?NHdjL3VvRitaKzFGYW5EOFVDaHdLaDV3MlRBNDZsaDk4M2dIVHZqaTl4akR2?=
 =?utf-8?B?aUhRWFZuUDgrUUE3N3BHTmh3WDl6aDZCOXlvNXRBeUhvakFUTXdzVmZZQndZ?=
 =?utf-8?B?VjZUbzBsWHZLVVllSTl0TzlJK2h4ZVMreDBNSTN2blB4VEtMd0NKQzVQRHdN?=
 =?utf-8?B?YU9yMXI2VmkzRm1lZVIvbDhYV2pGYmRTTXlYQWxmenBQK084RWN2QTlycUQ0?=
 =?utf-8?B?YURncGhyRlJPSm1hdHlGYXhOWHpLaWNta3JJZXJoUFkrZUZCajVsc01CMmd6?=
 =?utf-8?B?Yy9jdnovMk1IMm5iL0crR25nYkw4TWE0WVFvYkI1V3ltVGN6M2dLWVFMd09V?=
 =?utf-8?B?WG9PNlAvK1k3aW1MNUI1dm9MZWVpY1I0cEg2R1RES2laSlBtcUJjWHFjKzhZ?=
 =?utf-8?B?NG0zUXVYQ0FTSmNDSzQ0V29SMnlydHYzdUI5bUVrbm96U1o4anFoekNYZ2xO?=
 =?utf-8?B?c1FQMHdlRDZrbXpBdVY1UFpzU2FTMWh1Mmo1cTNQOVdWWWFzZ0Y2MmdoQlFP?=
 =?utf-8?B?bHRGblE1a1d6bnJSWDFvV1B4K1VkN1N0OEFkdXZTYXdpNjRjenFsL000ak9s?=
 =?utf-8?B?MGM3TGRJMzlLMzJyZ0ZkRUJwMGFBNW9hTUZBR2p2amNnSHZXUUh1eGRnU2Yv?=
 =?utf-8?B?Wms3WFMyRkM4M2JORTFqMmpZWUkxSmVGQTVlWG5ZNzBlTlMxUzhaUURXSVh5?=
 =?utf-8?B?VENYUXI1QTlVWUROUU83N2l0dG5lZjVTTm5VOEt6UWRUQ0NZejFMSmZ5TmFV?=
 =?utf-8?B?ZjVXQkp6YmNiazcwVzcyUW92TWxGTHpmS1RieTZISFVQa0xmeTlDRm9td3FC?=
 =?utf-8?B?TGF3aGRXZkQwNytFTlcxVlRJbUU0N3lBZW1FWmc3MmR0NUpXN2lCd0Vjc05S?=
 =?utf-8?B?ZFkwQlpSRjJMK2NoZDFNQi9xU0x6VmNKaXRMNTFadnovaXpENkhJOE50TXhk?=
 =?utf-8?B?a2VydHh1K0tqLzhXaEIyN0VQdlNlTDUyZkU3Z0t0cmNWMTlOYnNBSzRlbEpY?=
 =?utf-8?B?UCtHZnVzL2dpcWtzckdBbjZ4b0t6SjVwWjJZZGRVLzE2NmJiVjl4U2JKQ3FD?=
 =?utf-8?B?cURVMnpKbHkvVmxCd2lKM2FLbHRyQlBSL3BMeVFHcElsSHA5RmtXcW5xUE56?=
 =?utf-8?B?c25tRURMSzBibkRtT25hZWxUbGhTeTVSSXJuYm5peDlIbFpkYitkcFNyY2t3?=
 =?utf-8?B?UWJRSlRoY3NwdEtkeDZ4ajlVLzhONTdpbGFRS3Bybi9zNXQrS2Q0SGhBdHVL?=
 =?utf-8?B?L09SNWxhMzdVTzlEUkdVTDRkanp3MUphbktTMjJmV2EybFBUcHRxRXpaUmdl?=
 =?utf-8?B?RkRldFllcGtIU2VsZnlpbE5FVEU5d2J2YVNnSFRUVUh6SklOSTBMbUs0UFBi?=
 =?utf-8?B?VU5IZ0hSQVRGb282NDQ4SHVJazlKWnZ6RDluRjdTWjRJdWIyYU1RV2pFWW54?=
 =?utf-8?B?eklKQmtBajBUMHQ5YzFYSnVxcVBiQzJzQXFXKzZWbHM4TFBqeHl2dFZNM2Fr?=
 =?utf-8?B?YnNyMFRqWWcwR2lwcEEzeDFaL1Z0aUUzSS9paWU1cVZ6ZXpuN2I4SDNkK1hV?=
 =?utf-8?B?Y2x3dFdsSWc5SkQycDNwL0dsWjBzRnhhS0xaYVhqdVA5UllpZEhzUkJ6UUxQ?=
 =?utf-8?B?c3RvTGZpREQ3NlpiY2ROL2JydWZFbnl6dXRrYThuYUFFYW9xcVZLSVpXMks4?=
 =?utf-8?B?QU1LWHBtNHlnNisvb3pvKzNleXlyMzVNN0h1STNSbGpvSlVaTlVOeFhhbkdB?=
 =?utf-8?B?emZnWFBOaURwcHg5SFh2Z0poOGVhNCtyNGlzbisrckNreTNob0hUQTlzVUJV?=
 =?utf-8?B?VGs1MWU1Z0ZIVVBPdU5GeERyT3ZXaVlxYkNEUTE0dVZZZHc4RmgxSE5veWNt?=
 =?utf-8?B?cjUrZzJwbFFBY2RQOHlwOU1GVXlmTFpCV1pROFJwZU0vK2R4LzFHTHg0ZjNK?=
 =?utf-8?B?N1BxdjUzSllVM1VLckJJMTRZQUtSZmNMWjJYTE1FYStjYkdYNTRlZE5EalJs?=
 =?utf-8?Q?Gyl7G9eS2c7t8xXM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c40c18a1-f553-4694-5ac1-08df28e8f086
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 05:15:04.2666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpZ0n5GuGB14XlFKZm7ki8iF+yq0hWJ11aWmis8jTa9w/5V7thvwKM8+cjYJ5uNBnMWGpSeR+AF8lY5bo2hoM7pXUcjbdAvt5+8/JKxUnzJpEIIcdQr/K1H8tS/ufPgy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1283

SGksIEplcm9tZQ0KDQo+IE9uIDIwMjYtMTAtMTIgMjA6MDMgKzAxMDAsIENvbm9yIERvb2xleSB3
cm90ZToNCj4gPiBPbiBNb24sIE9jdCAxMiwgMjAyNiBhdCAxMjoyMTo0N1BNICswMjAwLCBKZXJv
bWUgQnJ1bmV0IHdyb3RlOg0KPiA+ID4gPiBUaGUgSkhCMTAwIFNvQyBpbmNsdWRlcyBDUkcgKENs
b2NrIGFuZCBSZXNldCBHZW5lcmF0b3IpIGZvcg0KPiA+ID4gPiBtdWx0aXBsZQ0KPiA+ID4gPiBz
dWJzeXN0ZW1zOg0KPiA+ID4NCj4gPiA+IE5vdGhpbmcgcmVhbGx5IGZvcmNlcyB5b3UgdG8gc2Vu
ZCB0aGVtIGFsbCB0b2dldGhlci4NCj4gPiA+DQo+ID4gPiBJbiB0aGUgZnV0dXJlLCBjb3VsZCB5
b3UgdHJ5IHRvIHNlbmQgb25lIENSRyBkcml2ZXIgYXQgYSB0aW1lID8NCj4gPiA+DQo+ID4gPiBJ
dCBpcyBmaW5lIHRvIHNlbmQgYmlnIFJGQyB0byBnaXZlIGNvbnRleHQgYnV0IGFmdGVyIHRoYXQs
IGlmIHlvdQ0KPiA+ID4gY2FuIG1ha2UgeW91IHNlcmllcyBzbWFsbGVyLCBpdCBpcyBnZW5lcmFs
bHkgYSBnb29kIGlkZWEgdG8gZG8gc28uDQo+ID4gPg0KPiA+ID4gVGhpcyBoZWxwcyB1cyBpdGVy
YXRlIG9uIHRoZSBzZXJpZXMgZmFzdGVyIGFuZCB0aGVuIHlvdSBjYW4gZm9sZCBvdXINCj4gPiA+
IGZlZWRiYWNrIGluIGZvbGxvd2luZyBzZXJpZXMgKGluc3RlYWQgb2YgcmVwZWF0aW5nIHRoZSBz
YW1lIGNvbW1lbnRzDQo+ID4gPiBvbiBtdWx0aXBsZSBpbnN0YW5jZXMgb2YgdGhlIHNhbWUgdGhp
bmcpIFRoYW5rcy4NCj4gPiA+DQo+ID4NCj4gPiA+IEFsc28geW91ciBzZXJpZXMgZG9lcyBub3Qg
YXBwbHkgb24gY2xrLW5leHQgb3IgLXJjMSBhbmQgbm8NCj4gPiA+IHByZS1yZXF1aXNpdGUgYXJl
IG1lbnRpb25lZCBpbiB0aGlzIGNvdmVyIGxldHRlci4gQ29uc2lkZXIgdXNpbmcgYjQNCj4gPiA+
IHRvIHBvaW50IG91dCB5b3VyIHByZS1yZXF1aXNpdGUgaWYgYW55DQo+ID4NCj4gPiBUaGUgZGVw
IHNob3VsZCBiZSB0aGUgUFIgSSBzZW50IHRvIEJyaWFuLCBidXQgSSBzdXNwZWN0IHdoYXQncw0K
PiA+IGhhcHBlbmVkIGhlcmUgaXMgdGhhdCB0aGUgTUFJTlRBSU5FUlMgcGFydHMgb2YgdGhvc2Ug
cGF0Y2hlcyAod2hpY2ggSQ0KPiA+IGhhZCBkcm9wcGVkIGJlY2F1c2UgdGhleSB3ZXJlIGFsbCBj
b25mbGljdGluZyB3aXRoIG15IHRyZWUpIGRpZG4ndCBnZXQNCj4gPiByZWFic29yYmVkIGludG8g
dGhpcyBzZXJpZXMuIFZlcnkgYW5ub3lpbmcgZm9yIHJldmlldyBvZiBjb3Vyc2UsIGV2ZW4NCj4g
PiBpZiBpdCdzIGEgbm9uLWZ1bmN0aW9uYWwgY29uZmxpY3QuIE9mIGNvdXJzZSByZWJhc2Ugb24g
dG9wIG9mIGNsay1uZXh0DQo+ID4gd291bGQndmUgaGlnaGxpZ2h0ZWQgdGhhdCB0byB0aGUgc3Vi
bWl0dGVyIQ0KPiANCj4gWWVzIGl0IHdhcyBvbmx5IHRoZSBNQUlOVEFJTkVSUyBmaWxlIHdoaWNo
IEkgZGlkIHJlYmFzZSB0byBjaGVjayBpZiB0aGUgcmVzdA0KPiBhcHBsaWVkIGNvcnJlY3RseS4N
Cg0KSW4gc3Vic2VxdWVudCB2ZXJzaW9ucywgSSB3aWxsIHBheSBhdHRlbnRpb24gdG8gY29uZmxp
Y3RzIHdpdGggdGhpcyBmaWxlLg0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQoNCg==
