Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DB3955F6;
	Wed, 19 Aug 2026 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126316; cv=fail; b=TIq9rJY/1EsD3GzsVDtA+AV4L6GVB9er8iApYNCoKWVenpZeXzZ+vKAaVdCNXP+NIr0rE2vlawQScwO5W85vwUfJfbNRLVEA9OFofOoS28N3X5USlLd7tNbBakI5/KehxCiUHyQUk4Kar5As9xCRpbNNjwUl5CPWL6D6walXw6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126316; c=relaxed/simple;
	bh=cnNOXOdkV3Qs85tl7u3SBQh7MZqemlWCn7DJ4y4LW4o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QGPEobs5XKnUJXGL1cxXgmV0SPUTZqc7IXdwQGCZkM8YmzzVSFmxaK9bDzqXZdABu4ZuMCOl4ACxlEgrga/enHBGSogQlvjk1dJCYFSF23KpnY61NCG288oRMGfgVe5joyF84w2CspmVXVroSM3q4I+AV9Zpncfma+5rye7SY3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LfYIJo6R; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LfYIJo6R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3gye/DHFqAtHnST3zpYqcBv5n7A2wuIpqEvcdzE3Nq1rgrqHnwuwLjZCu1O6/5Bved23RPua2loMt7ywzfXJhdyI34EhlqnzY3OsVXYFA0L7hMa/Z2sQRBXR5Mpx7/T9jeWbppDnUO0J8b2qUUpIjbciitWJnRviKQsSLltne5uUHGXHM4V1McL3NKQcAQ9CI8iY4E8UbVU1MRWB0tyqFtHs/nfQKyNqcfBXVTaRlkM2GamieVJ2qi+cnoGsBJ611WERHlr3tTlkEBVvf1ayUx4rs/GEliPqg/jsbAttXMQwZmqujiz5DfbWqayM5Hv8JGt7K90YCb0tmUPOrCC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnNOXOdkV3Qs85tl7u3SBQh7MZqemlWCn7DJ4y4LW4o=;
 b=zFTmoS9NdS72+u/ixR6YApSHTTJCpkAYbeJLyBbq5PVH3Y372O1ZG04cW21fJUN24GnentRJMHzgKojIgqsPAXmoeV0tvLY4gmZnm+tuWeqfqQXgVh+Yw/Dqsmhp7TIWtn0ojDyE8StrbJLSJVjl25ng0JmYQrRTriJ4QuYQfs/XP+A41usa1263kKNjpsd4jBycQnCyseWl/Iw7MYXrEjH1Fo+gHt6BQop+4A/8KcATuzDKcmFeOvfuCT4OgRCRglKxpCKhS8A2RDP7azRMSrIWb7IcmgBDNbCLgAe+PnVV8bu1YvBDrIoZ8nkBs7wPZfZWHDfR7PtGiQtD2H2M0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnNOXOdkV3Qs85tl7u3SBQh7MZqemlWCn7DJ4y4LW4o=;
 b=LfYIJo6RsW/3p8dEl6U4XE64Rma5FZSAN7apFMgosi0Tglfr+Bf/JkFKORHPYpbza/PaLKkA/U0t6JE4QmdfbWb1rxi/cKu14qh3/NGmbSaANCZAcwg+NhtD1n2a7t90zilIf1WG/GKVbhfHxiCa0C/RABGtbeJB01vTTlkOHOc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13095.jpnprd01.prod.outlook.com (2603:1096:405:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 07:58:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 07:58:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/9] clk: renesas: rzg2l: Add support for divider flags
Thread-Topic: [PATCH v2 4/9] clk: renesas: rzg2l: Add support for divider
 flags
Thread-Index: AQHdKb8YX0M41pI7YEqD2EIpi8tzE7adfuEAgAeOSHA=
Date: Wed, 19 Aug 2026 07:58:31 +0000
Message-ID:
 <TY3PR01MB11346182516BEFA440C6DEC6486A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
 <20260811182729.360959-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdWu5AQM_x+0JviyhHpA_8GrvOs4cjtMtavUz+JVuYvE-g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWu5AQM_x+0JviyhHpA_8GrvOs4cjtMtavUz+JVuYvE-g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13095:EE_
x-ms-office365-filtering-correlation-id: ff814ea8-acfe-498a-6ada-08defdc7a989
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 fTdeDOmGGT8K0QowBwdPwbVftK3US+TWFmyYjsLZPW3lILHc50YOjcY2sI0AY0PI/3IuZPHTNTGPZBm1oChCi/8OZJFFGBnSaMQsictPy+rVYiHz5EtRmq5XIgS+OXwC5UW+WATwd1l7awa1sZtnFNQpC+zYu+ACv0eQGfOqoQNdnvknsi17O3tb9ZH7k8yDOAc+2WHPiMq32/jssSqcw9KWdNxSq2y4MhBL4ngvTHv4BhwYSvl5EMJ0tHIvDcgaGmrBHCbEWMvzJFV1RKrmxDoroIhGKbq3x5HJLiuDpGaHADixpn10T+yv4rKUuMQjIecGxI9nWJPkEcqzsDYHVtlAVxd8eBzOU46SQzcLJw8ZC/vgAICi5IJQDF9jFq6kF1AKQi6EpLkTXdnpJn9FYFutxj5rCScJzRK9eIpEVHBN99aB3uVOBut6Z/3ozHe/NRm/6enb1GoUiNkYZ6/O4BHvzqgTq4TpjXKwvh7f6iiJ3/g4hy+n0doAIIYp9wBn2pJbrRdVaMKfQUVPhN9AHiiyp/rXPRSgy4/7B/KpDO1zOt97Didu3d7Je0J9dIoE7GD7kfgxb8n1IGkpT+oYpKy2H00gLokfocK8tl//HcLeFiP18xmEuuYKMg1+2LaRRZOWmVCuoVYoB/9wm2mZrKJn6rvPtkhNZ4t2hqgkEXzEuSR4dRm6iej5durUkmbxVtTf4Qw17JMdT768GWksoRg2D/7pJP9XOlqFrDTEmqg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bzFkbnVtQ1luVGNjM1k4ZEN5d3p2dm9pU0txL0FXT0tIQWV4em5VUy9lTFo1?=
 =?utf-8?B?eXZKTVJ4Q3ErYWV0RW83VzQ2T3JYdlpNN1RLZ0RjUTBtVVRhNGRwMU8xekh1?=
 =?utf-8?B?NHh5ekd2TkxSWjNHc0djMFlsdysrblN3dEdOT1o2UUM4TmtvQzZKWnVNbkYy?=
 =?utf-8?B?bVlGTUFyRlJVOG1rM2h3Y0lpYkFPODAyV1lLWFNweUpuYkRUNXM5VXA3NXp5?=
 =?utf-8?B?bW10V0NnQktjL3BNUXBhTklYbkFYbFNyaEdkRWRjblJwbUFUc1NxUEtJZmV2?=
 =?utf-8?B?R1dyWlJmVjhCMUF6N1NRTUdyWkRTTjdWV2Jwb2pLQkRpdllicTl6UFUvem93?=
 =?utf-8?B?SzNjTHhTc1AzQTladnpTOTNsQWlrdUlEbm1SRlEzam0rVHllVysvK1BKTCtx?=
 =?utf-8?B?VDRjWTVUd243SHZWWjREak9GWDg3a0FXY1E0akpoa3J3aDNNMlRpU1BaMGgv?=
 =?utf-8?B?OFNVZzlZbkhFMHYzUE12NHFVVVdFVDQyV1BWQXQxVVJ1SlMrYkdqYlNGREMw?=
 =?utf-8?B?NTJyMFVoV091bFArVnlUdk5qL1lKOC9pWitGVk5jbGVJWHIxNElYNVBHbDBq?=
 =?utf-8?B?OXo2UGhzbXFqZG91bEZuRTM2bDR5WWJUY1pwMFVJL3UybVljNlIrT1hoYUJ4?=
 =?utf-8?B?eS9MQXY4a3UzdnMrcGpxNCtJUytWbitwL1k3SXJEejRtWnFFSmJQcXlMenFF?=
 =?utf-8?B?djNpUkRBM255TmtjeHpkUGpQWXR3NURkR1FReFExZTU4L0dFUjBxK1MxNTk2?=
 =?utf-8?B?MzZxeW5SOEZCaldBNG9kNTVEL29qWXVJVWhKNlJjMnVHdVZDVitIcnNxd3ly?=
 =?utf-8?B?ZEZNdE0rWktSUHZsRk5qWkEvU1pYM25aY1YxSFB4WnJoK1ljMVRqVlMzNXc1?=
 =?utf-8?B?dldoOHBnT3kxdVhBeXFzTS93R1JUU0pGN0JnUFY4SWFWQkRYTHI3Y1BxRVBh?=
 =?utf-8?B?TXdaa29EYm1HRkV5Y3pEZnVIWFNHZEJZbHZwRXhIeVZHWi8zQWFUcEhSdlBC?=
 =?utf-8?B?eitKbWRndkk3bnZMb1ZuU0p6TEdzeS91WnZvcGhCN25tWXNVV3BEMkgwS3Nl?=
 =?utf-8?B?czlJc2duQXR3cFExdUV1ajFHN3BGTHh1S2tiUmxXQkEwbkQxTVZJREsyV0E1?=
 =?utf-8?B?Y0wrUUdYTEx2R3JhV2dIbDlidDR6UEg2V2w0NWtoVzlLQXNPTlpBSlJCN0V2?=
 =?utf-8?B?SmZGRkhCVHN3QmtnRnQzbWxUYnBtQmZPcGdTcm9ia1l1U3drS0VoM2NyYXd0?=
 =?utf-8?B?WHE5bElyUlNBRUJsWXhaekRWUWVjNzBhd0NJT3F3eEtzcldsZHVwM09yYlNZ?=
 =?utf-8?B?RUxld3IwOGtaTkNGSno1MHBKZlZoVms3U3h2T0hQRGxqcUV4L1JFZ2NJU3pT?=
 =?utf-8?B?VjM3QXJobW5zeFpTMmVWZnNyWDVqWVZwRXMrZzdSdzFXK3luWHpxVDRKbEcz?=
 =?utf-8?B?TEJZRW5YbW95blI1YnJKRTNOUVVDSnozN2J4SzJ5QjkxVVo3YTdUVitvdnd4?=
 =?utf-8?B?eTZBdng3aEdhMy9Fb1VPWkVNVFl1QlV0QWpRd25uUXN4UzFGZHRmbWcrUC9k?=
 =?utf-8?B?aStScFU4QnN4MHcyeDR0RlRMNmlCbXluYVR6T1JjbTQxVlJJeTZoMURhZjNL?=
 =?utf-8?B?VGpKaHdxcFgyc0Y5S0FUT1BvVm5SVzZCWnI0dE9sSG1lckM5Ukg5ZWNGR0ZD?=
 =?utf-8?B?U2pRdEpUcTB4aGNZdjdhTFJ6ZVBHcWVtRVBnakdGT3VzZXUrckdHa0w5VHFU?=
 =?utf-8?B?MzhoWXFSNzB6L0JKUVhWcURyNnkzTkE3Z2hNVzFRYVA0UXBtdm8yTDVKbzJa?=
 =?utf-8?B?cGc1eHdLTVVqYkNhd09CZ0Z3VGxBVjIxUit3TitYQkNhblZzcGcvb2ZSVnJN?=
 =?utf-8?B?Tk9STWNFbnpybTdJbll6MkV4ZjI3VWQwQWhSSzR5Q2RqQjk4M3FOMVJGQTlY?=
 =?utf-8?B?UWY0RGNORXZhNGppb01wb293UmhmL3VySEFPTFNjQXhRM0g0Z2JSL1VwVXI0?=
 =?utf-8?B?R0Y3aWVnVEhVb2NOU25hVGg1NUJQYlZLZndTVitLNmRVVEEyQThicCthaVZE?=
 =?utf-8?B?dFBUcXR2Y2RYQld4YmR4YXpNWWlvQ1QrMmxuVHU0bmZ5M1kvWGJ6dXB1TC9s?=
 =?utf-8?B?b3p2cmNyMHRENkdmcmRZQ09BbXNuOEdUR3hLSWM4Ty85TThWSXlZVkNsZUhq?=
 =?utf-8?B?U3hHRmhBVzVXNXhCdTRmbVQ5aTVtaGhubXlEekp6OXVjYTF0R2ludXFzSWp2?=
 =?utf-8?B?TitHUjh3SkxBY2tKbzMyREhnNTZvbUpVcDdnRGVrY2hyMWVKbzJORi9zKzFo?=
 =?utf-8?B?bkRVR2dSa2g1bmpON1F2bFM2ZkJYSXZwQnVDdmFTUG1yeGpjaFVQQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ff814ea8-acfe-498a-6ada-08defdc7a989
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 07:58:31.7452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4wQVf8IJmoC1MYYmws9m8v0c8XGDojs6q+3YABTo0Gr67fvbGoxyCWqnAqQeJF93V5EETv0bRT2xvqZaIiH151dGsrx22XVO8wFirTCxBtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13095

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IEF1Z3VzdCAyMDI2IDEzOjM0DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgNC85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCBmb3IgZGl2aWRlciBm
bGFncw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMTEgQXVnIDIwMjYgYXQgMjA6Mjcs
IEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHBh
c3NpbmcgZGl2aWRlciBmbGFncyBhcGFydCBmcm9tIGNsb2NrIGZsYWdzIGZyb20gc29jDQo+ID4g
c3BlY2lmaWMgY2xvY2sgZHJpdmVycy4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6
DQo+ID4gICogQ29sbGVjdGVkIHRhZy4NCj4gPiAgKiBGaXhlZCBhIGNoZWNrIHBhdGNoIHdhcm5p
bmcgYnkgdXNpbmcgKF9kaXZfZmxhZ3MpIGluIERFRl9ESVZfRkxBR1MNCj4gPiAgICBtYWNyby4N
Cj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsv
cmVuZXNhcy9yemcybC1jcGcuaA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwt
Y3BnLmgNCj4gPiBAQCAtMTEyLDYgKzExMiw3IEBAIHN0cnVjdCBjcGdfY29yZV9jbGsgew0KPiA+
ICAgICAgICAgbm90aWZpZXJfZm5fdCBub3RpZmllcjsNCj4gPiAgICAgICAgIHUzMiBjb3JlX2Zs
YWdzOw0KPiA+ICAgICAgICAgdTMyIG11eF9mbGFnczsNCj4gPiArICAgICAgIHUzMiBkaXZfZmxh
Z3M7DQo+ID4gICAgICAgICBpbnQgbnVtX3BhcmVudHM7DQo+ID4gIH07DQo+ID4NCj4gPiBAQCAt
MTY4LDExICsxNjksMTggQEAgZW51bSBjbGtfdHlwZXMgeyAgI2RlZmluZSBERUZfRElWKF9uYW1l
LCBfaWQsDQo+ID4gX3BhcmVudCwgX2NvbmYsIF9kdGFibGUpIFwNCj4gPiAgICAgICAgIERFRl9U
WVBFKF9uYW1lLCBfaWQsIENMS19UWVBFX0RJViwgLmNvbmYgPSBfY29uZiwgXA0KPiA+ICAgICAg
ICAgICAgICAgICAgLnBhcmVudCA9IF9wYXJlbnQsIC5kdGFibGUgPSBfZHRhYmxlLCBcDQo+ID4g
LSAgICAgICAgICAgICAgICAuY29yZV9mbGFncyA9IENMS19ESVZJREVSX0hJV09SRF9NQVNLKQ0K
PiA+ICsgICAgICAgICAgICAgICAgLmNvcmVfZmxhZ3MgPSAwLCBcDQo+ID4gKyAgICAgICAgICAg
ICAgICAuZGl2X2ZsYWdzID0gQ0xLX0RJVklERVJfSElXT1JEX01BU0spDQo+IA0KPiBUaGlzIGNh
biBiZSBzaW1wbGlmaWVkIHRvOg0KPiANCj4gICAgIERFRl9ESVZfRkxBR1MoX25hbWUsIF9pZCwg
X3BhcmVudCwgX2NvbmYsIF9kdGFibGUsIDAsIDApDQo+IA0KPiBJIHdpbGwgZG8gdGhhdCB3aGls
ZSBxdWV1aW5nIGluIHJlbmVzYXMtY2xrIGZvciB2Ny40Lg0KDQpUaGFua3MgZm9yIHRha2luZyBj
YXJlIHRoaXMuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgI2RlZmluZSBERUZfRElWX1JP
KF9uYW1lLCBfaWQsIF9wYXJlbnQsIF9jb25mLCBfZHRhYmxlKSBcDQo+ID4gICAgICAgICBERUZf
VFlQRShfbmFtZSwgX2lkLCBDTEtfVFlQRV9ESVYsIC5jb25mID0gX2NvbmYsIFwNCj4gPiAgICAg
ICAgICAgICAgICAgIC5wYXJlbnQgPSBfcGFyZW50LCAuZHRhYmxlID0gX2R0YWJsZSwgXA0KPiA+
IC0gICAgICAgICAgICAgICAgLmNvcmVfZmxhZ3MgPSBDTEtfRElWSURFUl9SRUFEX09OTFkpDQo+
ID4gKyAgICAgICAgICAgICAgICAuY29yZV9mbGFncyA9IDAsIFwNCj4gPiArICAgICAgICAgICAg
ICAgIC5kaXZfZmxhZ3MgPSBDTEtfRElWSURFUl9SRUFEX09OTFkpICNkZWZpbmUNCj4gPiArREVG
X0RJVl9GTEFHUyhfbmFtZSwgX2lkLCBfcGFyZW50LCBfY29uZiwgX2R0YWJsZSwgX2ZsYWdzLCBf
ZGl2X2ZsYWdzKSBcDQo+ID4gKyAgICAgICBERUZfVFlQRShfbmFtZSwgX2lkLCBDTEtfVFlQRV9E
SVYsIC5jb25mID0gX2NvbmYsIFwNCj4gPiArICAgICAgICAgICAgICAgIC5wYXJlbnQgPSBfcGFy
ZW50LCAuZHRhYmxlID0gX2R0YWJsZSwgXA0KPiA+ICsgICAgICAgICAgICAgICAgLmNvcmVfZmxh
Z3MgPSBfZmxhZ3MsIFwNCj4gPiArICAgICAgICAgICAgICAgIC5kaXZfZmxhZ3MgPSBDTEtfRElW
SURFUl9ISVdPUkRfTUFTSyB8IChfZGl2X2ZsYWdzKSkNCj4gPiAgI2RlZmluZSBERUZfRzNTX0RJ
VihfbmFtZSwgX2lkLCBfcGFyZW50LCBfY29uZiwgX3Njb25mLCBfZHRhYmxlLCBfaW52YWxpZF9y
YXRlLCBcDQo+ID4gICAgICAgICAgICAgICAgICAgICBfbWF4X3JhdGUsIF9jbGtfZmxhZ3MsIF9u
b3RpZikgXA0KPiA+ICAgICAgICAgREVGX1RZUEUoX25hbWUsIF9pZCwgQ0xLX1RZUEVfRzNTX0RJ
ViwgLmNvbmYgPSBfY29uZiwgLnNjb25mID0NCj4gPiBfc2NvbmYsIFwNCj4gDQo+IEdye29ldGpl
LGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0t
DQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hl
biBJJ20gdGFsa2luZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzDQo=
