Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A2E388366;
	Tue,  7 Apr 2026 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775547273; cv=fail; b=UKwXHlo/2QG9ai5drNVcM3N2qnMaPTiTb/1JriOEnJ6EJ5A/kg1FaDl4+Xku3Bn5vuU2Kr7nQzmT8xWYijNIlqc/FaatcBEypIQGHlfbgsaj/tjw7KffGlQatCz003Nq2QcFAck8SR5n0WGONzYTblJxuNG+HPVJT+KEU7Z8674=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775547273; c=relaxed/simple;
	bh=g9u/uJQobiKdOdlNLJiL0OPBqxxsyD7/fRIA4tozgT4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QiZ/jZAkNKLS+eGDEGvSTmU/1bTWVAnjBt+AYuszpCtWGlU+j04XdryNSVNkxGwwqyJORgQZQGkmAWg0Yzfq1SVZ0uqBMajfrvdt6hQYEzFUKzRb+CpFO0TYVwqqJDWCXXlBwUxBtMIvNNuGGEIij0eDDeTj4eWeXOE6LijFT+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I49HjQTtDljkzgPYcXK6TTlzjJozN9zaI+N+orvBIYqa24mlbrm2DEK2UowQqiRXZ1YdAljcTnW8snFQopfZ9xJRbNTjTxE5otjaxZQf4S/z2S5w108flvXr76XXymc8FNWW2m5Q8MI6GqFiW0HLT2xVS+JC+eKteUi0VficIYAuzCI8RPY7LbdDoIwHt3sOsaF5HWQBoP99Wdkz7sjRI8DXM38aK6pKGnm5LNfzeShX9qufrwbcTgdxRerTq6BXD1K9N8UL38pEKoftLRMH39t3bv+C48x04kvaASHCOlg/eEyJkR9ItXa0Qr3azXqel4G5dNtH9zdkR8gZH5AIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9u/uJQobiKdOdlNLJiL0OPBqxxsyD7/fRIA4tozgT4=;
 b=oCSc+F0jvree4ZzP0YI9V30urdteJlIzvdVsi+bv92HkHSyyomhdcVPDSPtqCThKIhrz3UDwgo4maYzQnlIwxrrpvKHgXGmgwWzegX0jdmgz7YOupS3jAXlLQqjT5LQdZNlWgJyMlk77REuQMTUjcKLAUuV/sR8t9C6YOvdzrn1IadRda3xq9QKM5k2xV2R3492p7KcruOTSrGhqeDOCi1zhCa3XVAIlCXLU3rkmCkv3BUyeILRLUM9RiWj1rh17VoJGuPc88kfyFWDOjBHoCZt3xO6oXRF72DZ67/JtqQFcXJ08WD/7IbnIMG40lKJaBDYGbvipGnN1hOOikRU/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1284.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 07:34:18 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Tue, 7 Apr 2026 07:34:18 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Alexey
 Charkov <alchark@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 01/13] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
Thread-Topic: [PATCH v1 01/13] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
Thread-Index: AQHcwy21E77TJ7ExbU+1fthlcwh/D7XQEiIAgAMpY/A=
Date: Tue, 7 Apr 2026 07:34:18 +0000
Message-ID:
 <ZQ4PR01MB1202F9AC0B854D3341EB2CAFF25A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-2-changhuang.liang@starfivetech.com>
 <20260405-nocturnal-mighty-pegasus-eff399@quoll>
In-Reply-To: <20260405-nocturnal-mighty-pegasus-eff399@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1284:EE_
x-ms-office365-filtering-correlation-id: 98f08677-a2b5-4baf-a37d-08de94781417
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 5JWKiplxE4yXUYZD1FTxD86zDfpQfi0aZiSDk4L42jQbosG1Rw6ufdqfzluJWF6kl/B+4f6KOrC6v2DBn6jIfUIJA8mKqovEYPz4RltD+B+bNJlTrWNwYZRMnJksOCXr3qeA8OhHWu22G5ypA+NP/u7nziUSCSov/8Cv3ch7ZMS6sOvzX3y0sJRDphsA0FovyCp3wdAKFg0i3wP8mDLJqGMTaggwhLGlVicy8lWsxmJZpAafjxsY387M2FO/xY+yK4lkhnBbYV2TkQKK4wQJe4FHR6OrI3JxmzD9w3GtJov5toAhV+EDCvEMnUcsIIVfocpqJpXpG4lvJwYlJgu0sv40Q6ijSj7zWFYecwnaxUJ3x7o96pt6iAWR2S4whz8OpuZhvvGLQEusc4oces02g7/332esYjkLpYcdCR1HMAj6O/m7rE1d0tKFoiORvqrf5FQKqKc+4MwRLcHp8eCOWAtrY8XscxVXtPXggt1IMwdAjxvZmAUFzxXCJAaAfa+1dPdyF6vIuetDaHwLMCkYm2s5Exc4tUlN70mcnPVepP0a/9N3RbCrVIEWGoFBZKHIScwxa2G3j/XZEQDPGO3vTQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U1hGMmJaQ1dNZzB2RjhodGgzOGJkdlNXK3QramVneHROMXRNYUxxQVVmL2s2?=
 =?utf-8?B?UGRPTUwxVEgwOTNWZUFFK0xiNFZBUmdBY043T1psWlNmRmxkeTVGK2JzZk1q?=
 =?utf-8?B?bzBEd2tvbFprd2Q5QUVkSzRJcEVyWjNhL3VuQ25NcHdQblZIb3gxNkJWKzJB?=
 =?utf-8?B?OXFtNU83OWFhWHJ4QUU0THJZVjJ3bWR0R3Byakw0UmRYb21Hd0NoMy9SZGVY?=
 =?utf-8?B?K2ZFWGhBMXJzK1VPemFhZ1F0eVk2Q0VUWE00d1N6a0V0MmszYmQyM2tXTEhI?=
 =?utf-8?B?Mm1rdlpGdTF3YUNjK2FUMStOSGx5SzhVK3ZYWXNSZjlVVHpHTVJ3dlZITG5w?=
 =?utf-8?B?YlEweWJGRXREaVR3dXcyN0trRkUrTWlyWkRXMUNKdExwVzF3QXNlSXcvQkhx?=
 =?utf-8?B?ZFpYUXdERGpmNi9URnNxT3dYMFZQamdzMmZlRk90U2JLL0FBWXVnUWlBYzhT?=
 =?utf-8?B?L1JGMlIrUzI4am9mSTQ2ODJJTW1IeWQweTV6R1gxcWg4cWRFWXVHclBQMmV1?=
 =?utf-8?B?Z1V1VjFUQ3dNL2d4aWQ1ekg1NFFKdlE0SEhnMUNhd1B1MXZwQkN3cEZmQlBS?=
 =?utf-8?B?bWdmOHRvRGlkZ2JRQmJQc2d1a2NqSFR1aDdhekJJVUlBSjlScnYrUnEzTHo3?=
 =?utf-8?B?a20rcHIwK1FCTFR2QWhkRHp2V0EvanJlOENWcFBVS3ZIQlpuMnFHNU1vdG5j?=
 =?utf-8?B?OXBCMHdWVDZxaVl4S0luWDV3eEFQNzRDb1RxMUZwbGd0YUFWK3JmYW1abVl4?=
 =?utf-8?B?OE5pZTc2YWhGSlV3cjVGM21XYURzMDE4TFdudkZackdhV2hBVG1GbHl1MGVp?=
 =?utf-8?B?TVltNm5PZTBpTkVrN0RPUlNMT3JlWVRaZ3YxY1lvTTgrOWlxRklrQjN6NmlS?=
 =?utf-8?B?d3NacDVEN1BJVnhZZndoMlEvMkpvOWF4Q1FHLzJoRy9JTHBJR2xMUUplRnN4?=
 =?utf-8?B?dW5qREtoR1g3ZU9iRE9kSGZCZDVua0pxd1VDbXBFR3VjV0xKZlU5YnY0bTRi?=
 =?utf-8?B?MytBdkRSOVZUckFPMHZ0N3RkOXpPdTZWWHo5L3JNek5qWkxKendHZGI1c1M3?=
 =?utf-8?B?VWJlV1Jsc2NWRWQ4R3d1OCtvZzdKaFl0ZVNlMXJGYnJuSEtRQjB3VkZjbEty?=
 =?utf-8?B?QzJvZW14Z1BkZWo3eW9oYi9nZXBQanc0S0JtOG5tcFp5Q21DRFlncDM5dUk4?=
 =?utf-8?B?RU8wTHFUcURCZjdiKzZCRWM2c3YyVlVhWFZiOUt0Nit6QVdTYUdZZnFTenF5?=
 =?utf-8?B?NGpCWVlZTDErL3JRQWU4SU1FR05oMnJ1UzNDQnhwTW5xNUhTSnJBWnV3c1hr?=
 =?utf-8?B?Q0hnZ2RqTnlMTmdhWmNJeC9uSDdsZFprRHIzNEdOMG5POU85bkpYY1k3TFow?=
 =?utf-8?B?eVVqTDE0ZDR4VXhicS9uWDZ3ZUE5ZWNlOXdoU2hOQUU3TzBIeStZWHkvOFZx?=
 =?utf-8?B?c1lZK2M2MUM4UUU5SU5Hd1FabmwzTUYxOER5YnMvVVQydFZ5SWx0em44cm1s?=
 =?utf-8?B?V05jWUtKVzIrL2F0ZVJ5YXBEaDdDTEZJR3RXYkxWSFBESWhRbnYvOUtITnVU?=
 =?utf-8?B?S2Q0T1J2ejBubTZOUGJxc2srWEtta0NoRjFNQjVPeGE0cjUrcGlTMTlYa2Y5?=
 =?utf-8?B?OHQyZWhkWkdMUDd6N0YyTk5VVmtzS2x0TE9nbVVONk54R2xLTzkvazNJUERL?=
 =?utf-8?B?bmcwTkl5Wnk4ZWdRYTVQYURFeHMvWW9MaENzVFpia3NXSTJZRWdRZk5HdVhS?=
 =?utf-8?B?Qmc2OUovUlpRakJRb3llTHdlZ0lZNGUwV0NxRUZHbm1QUUwzeGp6K2crTmJr?=
 =?utf-8?B?OU8vZWw5S0MrL2srZ1dDZjFkNFd6NzB5aC9tZStxNkltRVpOUWVPOXc0N2hQ?=
 =?utf-8?B?Ym5jZ1FRQlpIUUd6U0MwZW5FSlpwLy9RQzUyL0QwMFNkQXduNTNHVzZKdlBB?=
 =?utf-8?B?Ni9yWmJybExwVUU0eXk0bXRDY0RjNGN3d05ETHg1SzYrMU12MVhDeCtLK21F?=
 =?utf-8?B?eXR5cGp2OE9pNGNFenpqdHpJblNsbnI3Q0lUOGM0emMwZjYzbGVMaVFMNjJ2?=
 =?utf-8?B?Uk9WMnI5WnB3c01KRmRrdzQwWFo2YkI5N0FwcmtlQjhlcHFTNHB2cFVkRW5h?=
 =?utf-8?B?R3I5dEVHUXBhQWN2Wk84ZHFjUTRHMkVaZ0NUN3BQZndTalZrT2xNaDUwZmsy?=
 =?utf-8?B?R3Nkd3lhbDdEcTcrTTh1ZUpwZDV5T3c3QlFIcDN6T0FtWUlzVDZLU1FjQy9z?=
 =?utf-8?B?L0gxa25JVjlzVlVlZVl3RE5ONGRPalJGSzNSdjdHOVdYdG9hb3lkV2R1TFZs?=
 =?utf-8?B?RlEvL1poMXB0cDNKSmlpR05EL2NhMzJER2luZE1mNmNVQ0RmN3BhSzg0RGFH?=
 =?utf-8?Q?rUH8Ha8qsjMSN5lY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f08677-a2b5-4baf-a37d-08de94781417
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 07:34:18.6613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gluaaybtk05h3Y8Q23pf2kRDJMi8aQphW1lNKdV8nn7ve35BI/ZIAca8unE516rjyuqQO7m/36scNJ+oMvHkm97LsrJnbpaORK9il74J4TU2NzlNdyN6SxJ4lHANacV6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1284

SGksIEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gVGh1LCBBcHIg
MDIsIDIwMjYgYXQgMTA6NDk6MzNQTSAtMDcwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4g
PiBBZGQgZG9jdW1lbnRhdGlvbiB0byBkZXNjcmliZSBTdGFyRml2ZSBKSEIxMDAgU29DIFN5c3Rl
bSBDb250cm9sbGVyDQo+ID4gUmVnaXN0ZXJzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hh
bmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPg0KPiA+IC0t
LQ0KPiA+ICAuLi4vc29jL3N0YXJmaXZlL3N0YXJmaXZlLGpoYjEwMC1zeXNjb24ueWFtbCAgfCAx
NDANCj4gKysrKysrKysrKysrKysrKysrDQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTQ1IGlu
c2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9zdGFyZml2ZS9zdGFyZml2ZSxqaGIxMDAtc3lzY29uLg0K
PiA+IHlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb2Mvc3RhcmZpdmUvc3RhcmZpdmUsamhiMTAwLXN5c2NvDQo+ID4gbi55
YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3N0YXJmaXZl
L3N0YXJmaXZlLGpoYjEwMC1zeXNjbw0KPiA+IG4ueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jMGUxZjZmNjhmYTINCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9zdGFy
Zml2ZS9zdGFyZml2ZSxqaGIxMDAtcw0KPiA+ICsrKyB5c2Nvbi55YW1sDQo+ID4gQEAgLTAsMCAr
MSwxNDAgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNE
LTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAraHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvc29jL3N0YXJmaXZlL3N0YXJmaXZlLGpoYjEwMC1zeXNjb24u
eWFtDQo+ID4gK2wjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IFN0YXJGaXZlIEpIQjEwMCBTb0Mg
c3lzdGVtIGNvbnRyb2xsZXINCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gS2V2
aW4gWGllIDxrZXZpbi54aWVAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiArICAtIENoYW5naHVhbmcg
TGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiArDQo+ID4gK2Rl
c2NyaXB0aW9uOg0KPiA+ICsgIFRoZSBTdGFyRml2ZSBKSEIxMDAgU29DIHN5c3RlbSBjb250cm9s
bGVyIHByb3ZpZGVzIHJlZ2lzdGVyDQo+ID4gK2luZm9ybWF0aW9uIHN1Y2gNCj4gPiArICBhcyBv
ZmZzZXQsIG1hc2sgYW5kIHNoaWZ0IHRvIGNvbmZpZ3VyZSByZWxhdGVkIG1vZHVsZXMgc3VjaCBh
cyBQTEwgYW5kDQo+IFBDSWUuDQo+IA0KPiBIb3cgYSBNTUlPIGJhc2VkIGRldmljZSBjYW4gcHJv
dmlkZSBhIE1NSU8gaW5mb3JtYXRpb24/IFdoYXQgZXhhY3RseQ0KPiBkb2VzIGl0IHByb3ZpZGU/
IFJlZ2lzdGVyIHdoZXJlIHRoZSB2YWx1ZSBpcyB0aGUgb2Zmc2V0IG9mIG90aGVyIHJlZ2lzdGVy
Pw0KDQpGb3IgZXhhbXBsZToNCmluIHBlcjEgc3lzY29uOg0Kb2Zmc2V0IDB4NCBpcyB0aGUgcmVn
aXN0ZXIgY29uZmlndXJhdGlvbiBmb3IgaW1wbGVtZW50aW5nIGVNTUMgZXh0ZW5kZWQgZnVuY3Rp
b25zLCANCmFuZCBvZmZzZXRzIDB4NDDigJMweDRjIGFyZSB1c2VkIGZvciBQTEw3IHJlZ2lzdGVy
IGNvbmZpZ3VyYXRpb24uDQoNCkluIHN5czAgc3lzY29uOg0Kb2Zmc2V0cyAweDDigJMweDJjIGFy
ZSB1c2VkIGZvciByZWdpc3RlciBjb25maWd1cmF0aW9uIG9mIFBMTDIgdG8gUExMNSwgDQphbmQg
b2Zmc2V0IDB4MzggaXMgdXNlZCBmb3IgcmVnaXN0ZXIgY29uZmlndXJhdGlvbiB0byBwcm92aWRl
IHRoZSBwcm9kdWN0IElELg0KDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBh
dGlibGU6DQo+ID4gKyAgICBvbmVPZjoNCj4gPiArICAgICAgLSBpdGVtczoNCj4gPiArICAgICAg
ICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoYjEwMC1wY2llcnAt
c3lzY29uDQo+ID4gKyAgICAgICAgICAgICAgLSBzdGFyZml2ZSxqaGIxMDAtcGVyMC1zeXNjb24N
Cj4gPiArICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoYjEwMC1wZXIxLXN5c2Nvbg0KPiA+ICsg
ICAgICAgICAgICAgIC0gc3RhcmZpdmUsamhiMTAwLXN5czAtc3lzY29uDQo+ID4gKyAgICAgICAg
ICAtIGNvbnN0OiBzeXNjb24NCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHNpbXBsZS1tZmQNCj4g
PiArICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAg
ICAgICAtIHN0YXJmaXZlLGpoYjEwMC1iMmgtc3lzY29uDQo+ID4gKyAgICAgICAgICAgICAgLSBz
dGFyZml2ZSxqaGIxMDAtZ3B1LXN5c2Nvbg0KPiA+ICsgICAgICAgICAgICAgIC0gc3RhcmZpdmUs
amhiMTAwLWgyYi1zeXNjb24NCj4gPiArICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoYjEwMC1o
b3N0LXN5c2Nvbg0KPiA+ICsgICAgICAgICAgICAgIC0gc3RhcmZpdmUsamhiMTAwLWh1c2Itc3lz
Y29uDQo+ID4gKyAgICAgICAgICAgICAgLSBzdGFyZml2ZSxqaGIxMDAtaHVzYmNtbi1zeXNjb24N
Cj4gPiArICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoYjEwMC1odXNiZC1zeXNjb24NCj4gPiAr
ICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoYjEwMC1ucHUtc3lzY29uDQo+ID4gKyAgICAgICAg
ICAgICAgLSBzdGFyZml2ZSxqaGIxMDAtcGNpZWVwLWVjc3Itc3lzY29uDQo+ID4gKyAgICAgICAg
ICAgICAgLSBzdGFyZml2ZSxqaGIxMDAtcGNpZXJwLWVjc3Itc3lzY29uDQo+ID4gKyAgICAgICAg
ICAgICAgLSBzdGFyZml2ZSxqaGIxMDAtcGVyMi1zeXNjb24NCj4gPiArICAgICAgICAgICAgICAt
IHN0YXJmaXZlLGpoYjEwMC1wZXIzLXN5c2Nvbg0KPiANCj4gSG0/IHBlcjIgYXMgc3RhcmZpdmUs
amhiMTAwLXBlcjJjcmcgaXMgYSBzZXBhcmF0ZSBkZXZpY2UsIHNvIGhvdyBjYW4gaXQgYmUNCj4g
YWxzbyBhIHN5c2Nvbj8NCg0KVGhlIEpIQjEwMCBTb0MgaXMgZGl2aWRlZCBpbnRvIG1hbnkgZG9t
YWlucywgaW5jbHVkaW5nIHRoZSBwZXIyIGRvbWFpbi4gDQpFYWNoIGRvbWFpbiBoYXMgaXRzIG93
biBDUkcgYW5kIHN5c2Nvbi4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hhbmdodWFuZw0K
