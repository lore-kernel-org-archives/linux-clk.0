Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1673822B4;
	Wed, 19 Aug 2026 07:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125180; cv=fail; b=nmO6gYUQl8FCkfkGnbHh++cNhT8FTPC1L6IMRppU5TEcKjQjeTMqS50CfNrHDSf+hGKQ8evs9U1bT+6i7+pLeiEOqrk1js8Vaa878b6b6x8lAp01+BUyMLMYeKFUmVpbeopgUA2HxKOo6hFXSozB87uHAeNKsTV/S0Q+2ZnQGKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125180; c=relaxed/simple;
	bh=BBOjJlAT9JpYNGiA2CdbuqZRF1ECY4k7JFYc5TDzmSo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MHIoRY0Wva2STUjpq+UytnOfmPEbW/ng7M/jPawGl/x4Pl+Ir85JpZHMAnfrEH6yiCs/M4FDfnmSDFHrZeRIAGLAFe80qW1tY8VPZ6yS/08LlpUlPnQRDaPq1PGaQSR8H/suy27b60t4i342YYW7bb1+7mwHFAcUwBWrP17m4hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oRsPFMsp; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oRsPFMsp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3DqD2NOoDaoizX7Wjawzn6JHFc7aD/99jwxIcmLrqc2+GSwvDneC4tBX6Gu18x2e6W9Jc63WHid6UmJWBW0+zhcUtED/w5nPuiiO+x40nyIMzKHnwx++q0Bsf46TOoiKWI34Ves5n8yezO/gcK6c0J6ZT6BbaARWVe9jV+mbyjJiDsA7dYm8YgzUTsbrEoJThm+XnYIui/FsbUawDPlH8TACSBufPuV483J9kdneM08NXsbXZPkZyNLDW6+qxOx9DzoBjYkdNb6RrqwSjm0d+8piZ6yOFbJQ0rwiUBcWIp/TtDQRv0WZX9Ujf0c8sBdMnYK4YKWzoBCkfHWuWIfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBOjJlAT9JpYNGiA2CdbuqZRF1ECY4k7JFYc5TDzmSo=;
 b=L5jMK/89t9wWGBXOZQUxsrztL0GXqub+qwc4V+qWNoQRKkj/Xk38lDF09PXLujab3y9oAr42AkseC11kk7wHL+Ev35UQhh+L/ychDw4fiUefQFP2Jz91zkkU9f4llQ1bocHw5+X2hzCdQczmDrgTO8iE1ALo7TiLH7XDTMDTXcFmH+XrR9Vmn2nDNWWTFnHGjMY/3CCHei2R4rQNfzBeAM0E/JPFmNa2jea3QCBpVx4T20NsZ3X3vXVsTUH5gWRQTZOjH5jRNEOLrT0iIoZIl4Y8sVXjTz8+LNtgIwzWwxUXQmZceMMIv7yek+KVnes95qp88ErlViLGJzKgGMVxGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBOjJlAT9JpYNGiA2CdbuqZRF1ECY4k7JFYc5TDzmSo=;
 b=oRsPFMspkHGQS3ofWhEgNzS7KyFUxPn5wRFzUgd7UA+M8EKmL+EU1GYOJ7rsOP9LsvhIntUOcTJ27Nsioqd8/f4aUf0jQZQJ04FvODZXC5/5B47Vd93niKddjcs1RsytAZ95q/XgCZNpUbvK1XXnTqpWCOrOJY4DTv26Y9bSFLk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7964.jpnprd01.prod.outlook.com (2603:1096:604:1bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:39:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 07:39:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/9] clk: renesas: rzg2l: Add DSI divider clock support
 for RZ/G3L
Thread-Topic: [PATCH v2 1/9] clk: renesas: rzg2l: Add DSI divider clock
 support for RZ/G3L
Thread-Index: AQHdKb8XmvRuVVFxiE+XvUi3Fov9sbadfk8AgAeJTJA=
Date: Wed, 19 Aug 2026 07:39:28 +0000
Message-ID:
 <TY3PR01MB11346C2CD381B4096B77ED8B086A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
 <20260811182729.360959-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdViJB2qvzbOkX7exqpq7gF4tbBcNYMHmCmEXHSh6AYfew@mail.gmail.com>
In-Reply-To:
 <CAMuHMdViJB2qvzbOkX7exqpq7gF4tbBcNYMHmCmEXHSh6AYfew@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7964:EE_
x-ms-office365-filtering-correlation-id: 7f297a17-7603-4dff-af08-08defdc4ffe7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|38070700021|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 ycgYLgkfkxZe/8M+b8jNdRIALHrJ2a7gVeA4X2vhpLph2ME1mHtRqHF6/noucpSGsLQOthhakju2brNJco3b0kc3Q2R7jQs6+s/8t0rsydML7xF2FPh3l5dRGiUCeoHCclfD5blflgF0qW2keMT+yaGPSm8a+hnQLPLzVnf/hGDolx42T5McDBPeP6MHGRFPxGa8SZ5rG2FTakA0J2YO+pAkGlH9n6Arysfqq2ciuZek2Np2W0c7hWmO1xjwklRyTZGc5iiR1tVz1laB97jRm+c4wthSZs4Ovh3wCBGVhtkGPbFcyHfcINDfaM1mOFCSTIq0ioKPNWHPnG7ZxuTYtXHTdGnYNT6FVIuQDDSEy72SZ00FBQfYySZKqAj5spCffvdpaK0YkAPs0QOvKKoBDi+68C+Ltd5kP8yDK/u7ZATozwuwsQQBY4sCtlFowFdEJw9R7S8zh+N/GjRAJdVjkLCz+vMAV5qDXWk2bbzxfum6rdFmdnY126hi1WvF5IvCcmqtj5IiRQK1xENefdawhzLt0Supb1N/rKyFJJL6BsTji0sK3XQUQdMgSlwTBDsUAir38qYtJLjK/OOpTDGL5bwgJ4vE1Bvb2SW3LpeJaxMEPiYbOUwJD8nTczXXQcwafcDtDlsg7X1fHcVM1j8NNHroQNuJIY6lkFaAnxTiI3/04Rng+KH0IIk8CjTk7EFMF+j1PjI4ShCOih+C2BXkTYUYClNBxEK40vR9S8rpaAA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHBNcTQxMUh5RmxOWDNCTVRZdHJvQkRnQWNyd3JROVh5SVJEYm43b3AyUWpZ?=
 =?utf-8?B?UEt6L0d5NlVtME5NcVVBQVlUVjBZZUxBcm1QOWZKeFNNd1BXLzdsY2Z5KzVt?=
 =?utf-8?B?eHg0MURKY0kyanBnWnFGY3E3ZzUyR01mdTdtc1VvTE5DZk1DakU4cE04VGpT?=
 =?utf-8?B?aEtza2F5NEcrWFgxWFFnYnZSUkhPUTl3NmRZc2F4NEJVSG1ycUtKNk1rck1E?=
 =?utf-8?B?Y2FHMzQwVkp0TkxoMmd4a05uTkMyVnBuY3cvNE9tNEJxcVNkWW4vN2hTSjFB?=
 =?utf-8?B?OXZjNFc1OEVGVnBld0RWSWZnMTRwVTNkV2dEREdIaHMyWWtJMmNpNHA4Qkp3?=
 =?utf-8?B?WHdVNzNhVWVPQnlCcTBtMnFrSVNTLy81OG5jNi81azB2UTVzanc5KzdwSklm?=
 =?utf-8?B?MDRvTHVUenNrQ3dVWGtPeEVTNUFzb0JMTEFqSE9qa3BNdUo0VXVPZktJQlRk?=
 =?utf-8?B?NjdpT0xvTWRHalhMWWRNdWtza0ZCcE40OU5SVTdYbWtQNHRWYnVTKzFYMSsw?=
 =?utf-8?B?WEh1WVRjUWtQZUNRUFFsNHVGNjdvQzE5QThQR1REYUNVQ29rR3Mzdm5NRGc0?=
 =?utf-8?B?SWNYNkxJcXR4RGUzRlJlYUZRZkRaR0V0NU1QQnhRUmJwS2VrQXlnMzQvakRr?=
 =?utf-8?B?dFBnaytRTDhFNFhhUXgxYk5rS3pTekwyaHZmbks3ek1yNVdBMGJRdnlQUWlN?=
 =?utf-8?B?RUZ0NXZNRUZkb1RQay9vUm5URHkwNS9FQWJEbWF1MERNTHduTXVTT05sSkd2?=
 =?utf-8?B?eTRDWFE2Yi9vbTViS08yOWVadEIyUHVKN1NnSnMzRmQ3akZpbjFTWWhDR3dK?=
 =?utf-8?B?bmZWNHBIZm1xYXQ0NVJWeU9INXhGclhpOVhzcWI0dDN6QTUwVXZqMHI5ZzNT?=
 =?utf-8?B?NUhZNExVaFZBUDM4bnBxTkwrNjh3K2lsS2l6NkR2dVNReTFrczZoM1RwSDFt?=
 =?utf-8?B?Sk1hb2FHV0hleU5ySk5TNUxiTU0rbm9kNjdBS2ZZOXovb2Fra080Ulhkb2Zs?=
 =?utf-8?B?STlDeFNQN0UxUzlVdDBBZ1FkQnMyZEFBakR0enZLMFFUeDF5ekxkSmljMlRN?=
 =?utf-8?B?SHhwRzhsK3lhcHFOVnJMbE5mbmFZb0dkb1kvdFlLNG5RYWJMTEFuYmdJYjhk?=
 =?utf-8?B?Uk9FZ2h0V05CNlZaQjBYVmpzQ2NSTHZyZFJnWXlJMjJWeTdvL256YUQ0WFJn?=
 =?utf-8?B?SDc5MTZwSjlnanBTRU1Rc0hTelVaMmI2K29PMml2V3k5ZlUxS3dwaVB3OHdT?=
 =?utf-8?B?aVpCMHBxWWlxdlUzZ0xTTlliVERiQWtBclFPNlg3R1BlNGx6TFJhOWs1R01P?=
 =?utf-8?B?d042TC9KbEpCMU1IYnpOTGw5SmdkSStPd2dzcTZXZ3FvWStSN3EzUG03Mk9X?=
 =?utf-8?B?SFZCSlVUOGo0U0dnMWpHZUh5cWZBY1FiZzY0Wk1rdithQTBxdGJGUTJ2UXR6?=
 =?utf-8?B?ZGV0WWt1UDZRNzN1K1lIdTNxR1BaSE5MY0hpZVVzUG9MaG81VmtrY2d5bXNH?=
 =?utf-8?B?bkJBUERWK3pnN1k5SnR4Z3NwaGd0cmFYNE04T1pXMzF5OVZmRFBVVnJnbnJJ?=
 =?utf-8?B?WSt0bzJPMmVzK3ZWMEJCNmUxc0xGamtFUlp3N2xRTEFQRDk0My9FZHpjVVFQ?=
 =?utf-8?B?SVRpZkdNbGRNUE05M1Fzc2szU0VNT1Q1REJRb3pMKzlyK0tjMkQycXFIZVho?=
 =?utf-8?B?N2piNXhPK24rMGZHSTlKSzduc0d0RVBUOTdXZkVUVjducHFsR3I5SCszMnNr?=
 =?utf-8?B?Qk50Y1BkVWZGMngrMWZFUmZhTFhnQkQ5MkQ3SHQvMVlVRUdyMWJGYUdRVnBK?=
 =?utf-8?B?Z0dLcTJLVFFhZGpPWDZsNGpQNzMvWStnamE4N1l3YVlsZGtVQjlPbzBUQ2JC?=
 =?utf-8?B?TE92eWJMckFkNUpscjlWcGtwN1FlVTA4MkRhRENVd0NoSkZFamlNWldVam16?=
 =?utf-8?B?Mmx5T2FFRHlhODhKbHY0NE9peFpUZThPbk56RHlmVTR3QmxRZ0ZFMlFKNnhr?=
 =?utf-8?B?UXpLaGlzY1Erb3Q1YVQ4U0swY3lyc1ZuSUNacFhmMVI1REswNitRL256RWs3?=
 =?utf-8?B?c0M2WXVSRjJuTVY5QUJaMnh6Mml2OXhuNVJyVGhNWm8zLy9ZcGZFR2R6eDVP?=
 =?utf-8?B?OW50bEtsVkg0bXVZbFJnZHlXRkRxR3R5eE9vVER6djlrMlA2UmNTS0tLSjZx?=
 =?utf-8?B?dEx4aGR5eGsvVk91UkRxalo0aHcyRFpiWnhmMmpUQko4SVFsSVBZZDVWMEl1?=
 =?utf-8?B?TzZaSU9pQ2pMN0pydzU4TjN3TkphT3ZVRWpOR05kUEFvTDBvUDRFRzlNZE9O?=
 =?utf-8?B?NlFGSWhERFVxSTFRMjF5QU9aNExIOFA0TzZSMFJwbzhrRlhtRkJXZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f297a17-7603-4dff-af08-08defdc4ffe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 07:39:28.1388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XK7rKw8iEMymwXODpw+lU90xe6eTOwNLdXJUm6izctMT4OAt7869TTwwqJz/fmlu+uyFFA5ntgVl4X+NL8x7I+g9BcEfbIeuN7r1tCKZbmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7964

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IEF1Z3VzdCAyMDI2IDEzOjMyDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMS85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgRFNJIGRpdmlkZXIgY2xvY2sgc3Vw
cG9ydCBmb3IgUlovRzNMDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAxMSBBdWcgMjAy
NiBhdCAyMDoyNywgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9t
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgYSBu
ZXcgRFNJIGRpdmlkZXIgY2xvY2sgdHlwZSAoQ0xLX1RZUEVfRzNMX1BMTERTSV9ESVYpIGZvciB0
aGUNCj4gPiBSWi9HM0wgU29DLCB3aGljaCByZXF1aXJlcyBhIGRpZmZlcmVudCBkaXZpZGVyIGlt
cGxlbWVudGF0aW9uIHRoYW4gdGhlDQo+ID4gZXhpc3RpbmcgUlovRzJMIERTSSBkaXZpZGVyIGNs
b2NrLg0KPiA+DQo+ID4gVGhlIFJaL0czTCBEU0kgZGl2aWRlciB1c2VzIHR3byBjYXNjYWRlZCBk
aXZpZGVycywgRElWX0RTSV9BIGFuZA0KPiA+IERJVl9EU0lfQiwgd2hlcmUgdGhlIGVmZmVjdGl2
ZSBkaXZpZGVyIGlzOg0KPiA+DQo+ID4gICByYXRlID0gcGFyZW50X3JhdGUgLyAoKDEgPDwgZGl2
X2EpICogKGRpdl9iICsgMSkpDQo+ID4NCj4gPiBESVZfRFNJX0EgaXMgYSBwb3dlci1vZi10d28g
ZGl2aWRlciB3aXRoIHZhbHVlcyBpbiB0aGUgcmFuZ2UgWzAsIDVdLA0KPiA+IGFuZCBESVZfRFNJ
X0IgaXMgYSBsaW5lYXIgZGl2aWRlciB3aXRoIHZhbHVlcyBpbiB0aGUgcmFuZ2UgWzEsIDE2XS4N
Cj4gPg0KPiA+IEludHJvZHVjZSB0aGUgZzNsX2RzaV9kaXZfaHdfZGF0YSBzdHJ1Y3R1cmUsIHJ6
ZzNsX2NwZ19kc2lfZGl2X29wcywNCj4gPiBhbmQNCj4gPiByemczbF9jcGdfZHNpX2Rpdl9jbGtf
cmVnaXN0ZXIoKSB0byBpbXBsZW1lbnQgdGhlIG5ldyBjbG9jayB0eXBlLCBhbmQNCj4gPiBhZGQg
dGhlIERFRl9HM0xfUExMRFNJX0RJVigpIG1hY3JvIGZvciB1c2UgaW4gY2xvY2sgdGFibGUgZGVm
aW5pdGlvbnMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIEludHJvZHVjZWQg
dGhlIG1hY3JvIERJVl9EU0lfe0EsQn1fU0VUIGFuZCB1c2VkIGluc2lkZQ0KPiA+ICAgIHJ6ZzNs
X2NwZ19kc2lfZGl2X3JlY2FsY19yYXRlKCkgYW5kIHJ6ZzNsX2NwZ19kc2lfZGl2X3NldF9yYXRl
KCkNCj4gPiAgKiBTaW1wbGlmaWVkIHRoZSBkaXZpZGVyIHRvICIoZGl2X2IgKyAxKSA8PCBkaXZf
YSIgaW4NCj4gPiAgICByemczbF9jcGdfZHNpX2Rpdl9yZWNhbGNfcmF0ZSgpLg0KPiA+ICAqIFJl
cGxhY2VkIHRoZSBkYXRhIHR5cGUgdTMyLT51bnNpZ25lZCBpbnQgZm9yIHRoZSB2YXJpYWJsZSBk
aXZpZGVyIGluDQo+ID4gICAgcnpnM2xfY3BnX2RzaV9kaXZfZGV0ZXJtaW5lX3JhdGUoKQ0KPiA+
ICAqIE1vdmVkIHRoZSBkZWNsYXJhdGlvbnMgb2YgdGhlIGxvb3AgY291bnRlcnMgaW5zaWRlIHRo
ZQ0KPiA+IGZvcigpLXN0YXRlbWVudHMNCj4gPiAgKiBVcGRhdGVkIHRoZSBjb21tZW50IHNlY3Rp
b25zIGluIHJ6ZzNsX2NwZ19kc2lfZGl2X2RldGVybWluZV9yYXRlKCkuDQo+ID4gICogVXBkYXRl
ZCBsb29wIGxvZ2ljIGluIHJ6ZzNsX2NwZ19kc2lfZGl2X2RldGVybWluZV9yYXRlKCkuDQo+IA0K
PiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVz
YXMvcnpnMmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5j
DQo+IA0KPiA+ICtzdGF0aWMgaW50IHJ6ZzNsX2NwZ19kc2lfZGl2X2RldGVybWluZV9yYXRlKHN0
cnVjdCBjbGtfaHcgKmh3LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QNCj4gPiArKnJlcSkgew0KPiA+ICsgICAg
ICAgc3RydWN0IGczbF9kc2lfZGl2X2h3X2RhdGEgKmRzaV9kaXYgPSB0b19nM2xfZHNpX2Rpdl9o
d19kYXRhKGh3KTsNCj4gPiArICAgICAgIHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdiA9IGRz
aV9kaXYtPnByaXY7DQo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgZGl2aWRlciA9IGRzaV9kaXZf
YWJfZGVzaXJlZDsNCj4gPiArICAgICAgIGJvb2wgZGl2aWRlcl9mb3VuZCA9IGZhbHNlOw0KPiA+
ICsNCj4gPiArICAgICAgIGlmIChkc2lfZGl2X3RhcmdldCkgew0KPiA+ICsgICAgICAgICAgICAg
ICAvKiBDYWxjdWxhdGUgRElWX0RTSV9BIGFuZCBESVZfRFNJX0IgKi8NCj4gPiArICAgICAgICAg
ICAgICAgZm9yICh1bnNpZ25lZCBpbnQgZGl2X2EgPSAwOyBkaXZfYSA8PSA1ICYmICFkaXZpZGVy
X2ZvdW5kOyBkaXZfYSsrKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IGRpdl9hX3RtcCA9IDUgLSBkaXZfYTsNCj4gDQo+IFNvIGRpdl9hX3RtcCBpcyB0aGUgYWN0
dWFsIHZhbHVlIG9mIGRpdl9hLi4uIFRoYXQgaXMgY29uZnVzaW5nLCBzbyBJJ2xsIGRvIHMvZGl2
X2EvaS8gYW5kDQo+IHMvZGl2X2FfdG1wL2Rpdl9hLyB3aGlsZSBhcHBseWluZy4NCg0KT0suDQoN
Cj4gDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZvciAodW5zaWduZWQgaW50
IGRpdl9iID0gMDsgZGl2X2IgPCAxNjsgZGl2X2IrKykgew0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZGl2aWRlciA9IChkaXZfYiArIDEpIDw8IGRpdl9hX3RtcDsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChkaXZpZGVyID09IGRzaV9kaXZfYWJf
ZGVzaXJlZCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
c2lfZGl2LT5kaXZfYSA9IGRpdl9hX3RtcDsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZHNpX2Rpdi0+ZGl2X2IgPSBkaXZfYjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGl2aWRlcl9mb3VuZCA9IHRydWU7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH0N
Cj4gPiArICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAg
ICAgICAgICAgZHNpX2Rpdi0+ZGl2X2IgPSAwOw0KPiA+ICsgICAgICAgICAgICAgICAvKiBDYWxj
dWxhdGUgRElWX0RTSV9BICovDQo+ID4gKyAgICAgICAgICAgICAgIGZvciAodW5zaWduZWQgaW50
IGRpdl9hID0gMDsgZGl2X2EgPD0gNSAmJiAhZGl2aWRlcl9mb3VuZDsgZGl2X2ErKykgew0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBkaXZfYV90bXAgPSA1IC0gZGl2
X2E7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRpdmlkZXIgPSAxIDw8IGRp
dl9hX3RtcDsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZGl2aWRlciA9PSBkc2lf
ZGl2X2FiX2Rlc2lyZWQpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRz
aV9kaXYtPmRpdl9hID0gZGl2X2FfdG1wOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZGl2aWRlcl9mb3VuZCA9IHRydWU7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAg
ICAgICAgICAgIH0NCj4gDQo+IFRoaXMgaXMgYmFzaWNhbGx5IHRoZSBzYW1lIGNvZGUgYXMgaW4g
dGhlIG90aGVyIGJyYW5jaCwganVzdCBsb29waW5nIG92ZXIgYSBzaW5nbGUgdmFsdWUgb2YgZGl2
X2I6DQo+IA0KPiAgICAgdW5zaWduZWQgaW50IGRpdl9iX21heCA9IGRzaV9kaXZfdGFyZ2V0ID8g
MTUgOiAwOw0KDQpZZXMsIHlvdSBhcmUgY29ycmVjdC4NCg0KPiANCj4gICAgIGZvciAodW5zaWdu
ZWQgaW50IGRpdl9iID0gMDsgZGl2X2IgPD0gZGl2X2JfbWF4OyBkaXZfYisrKQ0KPiANCj4gPiAr
ICAgICAgIH0NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1jbGsgZm9yIHY3LjQs
IHdpdGgNCj4gdGhlIGFib3ZlIGZpeGVkLg0KDQpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIHRo
aXMuDQoNCkNoZWVycywNCkJpanUNCg==
