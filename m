Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9953DC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 13:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350055AbiETN5Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 09:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350047AbiETN5N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 09:57:13 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5F363537
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 06:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4+yQynyWW2GaSpoSJmz+n7VYpTh6WVheJEot9336LbZV3IXrfOo48z56b5fsP4TZ5jN9vyoHSwF7H4ySuPx+Mgi1urXMleLw0CPsfpln2Qz5Dqxm/uhI1tjJKhctrcTFaVCq0oDlf7xHJVKkRqukqNuiJATJRAd+uCgKFV5MxkIq8GDsZ8KNmFwQOrE8kT8owxywKWN/IaNC6R5P8u77y8CfXuBm9gnZFABGXCAFcc6Xo52SFqA68bK4UuK7j03z90plqHoTdksCGTtKZK89vs6CK64xAJodCge2Glb7JloPC6j/vbWUKdCayZ/qjvpDKOuZU5XtFDjXrv6G1HVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yx6kFopzvGFRgFkw/yqCrMnPgSrVKtaDm1gPawMkM0=;
 b=elkSmtv1dfOKg9uFD2GtuJQgWATtMMmIhj4UySSHAXneEwe9aq6v08AOo8T3XvdIB+3hSqIk7sO9iGpY5lB3omw00bsMZ0csZXl2L23uizI0UoaD3sBErH8H5Z1a5giB0ds6AcOBJhXQyWLp7JVVqVnAHqRSOtYQPwUCh0xRcSo3DZ8MZlDUjvOYss1lh4TuIB6lfdjSxklINmdaOPlNl47fpAeJ2NZOmxX7wq5uXBuFyAeHhSr/NOqGjT5tufLbTBo68hjd+vMONEANkwc72YONS10Cb9/yycZ30Ww5Et+Nv7Z4f1Aj/QLyRba6Tjet/tqDMWCFPQZjvMC4cdgN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yx6kFopzvGFRgFkw/yqCrMnPgSrVKtaDm1gPawMkM0=;
 b=fMQVjbHkVALcScN7wd0AvVZQijHsn/UpA+n0P+lQFnCoiIv7TwoS56Tstv5lS1cNYIKfEnSsiW27Eu2fS1y/vLU3Sw1kJ4ZGXPE3jBh/LnKF3RkGHciO2qYmZevcqIYR1JUqka/Gn2tc4wrijkuxAqMszh/gSjh0pJlluqxm2Qs=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB10102.jpnprd01.prod.outlook.com (2603:1096:400:1ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Fri, 20 May
 2022 13:57:09 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%8]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 13:57:09 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Markus Elfring <Markus.Elfring@web.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "cocci@inria.fr" <cocci@inria.fr>
CC:     Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: RE: [cocci] [RFC] coccinelle: Add test for unnecessary check before
 calling clk_disable_unprepare()
Thread-Topic: [cocci] [RFC] coccinelle: Add test for unnecessary check before
 calling clk_disable_unprepare()
Thread-Index: AQHYafMQ1GqDaGPIYUKMw5zLbxeQC60mn8+AgAEtr7A=
Date:   Fri, 20 May 2022 13:57:08 +0000
Message-ID: <TYYPR01MB7086773272C8B95C344E663FF5D39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220517133556.6934-1-phil.edworthy@renesas.com>
 <c1d5d00d-d770-530b-abfa-0c1f462e5f22@web.de>
In-Reply-To: <c1d5d00d-d770-530b-abfa-0c1f462e5f22@web.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8c568e8-8b0d-41dc-f809-08da3a68a1b6
x-ms-traffictypediagnostic: TYCPR01MB10102:EE_
x-microsoft-antispam-prvs: <TYCPR01MB10102F3F9C3132EA1217D248EF5D39@TYCPR01MB10102.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xLO26TM8nq1uD6ZS19LonYGxmO6A34zA9wp+8nqVNvP8bTWx8+D16gGzTM+UL3+Xh8PTX5vVs3drAYW0lmbWhtbueC+glyLaXdRkQSG0DTEaUZPNYu/6bEvgKxjNKlOtwV7Lweh6DoHYZ9aGnIqt2bdAe36knN+pLW5f13xRlX2a0BJpaHiqiM+5HJVHIG56A9NufN2g+rB9/8/Z4i8QNP7z7J/o5yQ4g/5YMdqRpvfMYB3Bn8QJCNQQM0dPxvZKELbeS/a1OkFPfqjj3GLhKdl/KvuKZ+whCuTPebxLBBHrBjsW9JutsslQ4O052GSoTAd3G9viCxNDqDbODSpAO+h5zS04AU3zMvAXQfNRrw+TWRisr5fLRuLDlrbsqO6GLAWn3ohvdCHYaLjSe4PMyiyoyaAzXRdHZRXREJjKqWdOjplBGR8W3omGw6PzqkvZVo1yioIZ+HsmxqyA7DAzNs1UhY6PdPcnGeja1zeezLEE3HuErGXm3XZKnbDs4eJ9bGG3RUFj5a2bi9rUpxHzWmhQoPxEuYsnlExL7XBqRnX2fwVeDLjB2U8pwfH9Z3M4YeFrRXPHVtoUBzg02IOCEbbBQ49lFPr9L6zmwzlDFQEReGnAzvi4CglZOznprhDrIufxkn97CddOkhL0T3RscayPbAbSY25sxlrl4N9NtNkbVwQg3A/2QUL1QzmUOitiU9g40tzoJmnMXxkToykDWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(7696005)(508600001)(8676002)(66556008)(110136005)(4326008)(44832011)(83380400001)(66446008)(55016003)(66476007)(64756008)(66946007)(76116006)(186003)(38100700002)(2906002)(5660300002)(26005)(33656002)(38070700005)(53546011)(6506007)(8936002)(9686003)(71200400001)(52536014)(86362001)(316002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGFXbnlscW9YTHNYWTczSUpDRzVhSlJnUVlQYTl6MFpLN3UybGJ4ZS9lcGpF?=
 =?utf-8?B?U0JpWGszNThYQlQyTmROOGdjWUNTUVpOWnpmNG05d3g5MTI5T2pDelFJYkNV?=
 =?utf-8?B?RW5rWEpqczlEU2t6YTlrNm1la2RkZVExWDJKeEJaanE1a0ZsMkZCQ2JOd1Fl?=
 =?utf-8?B?NzJsamNoSm9HSFVhN0Y1cVFSOUtTQlY5U2JYNlVuaDZ6dVdrc3BHZEFHOGNZ?=
 =?utf-8?B?R0FsS1diNFYrWEh1SHk2ZHpmenRQNFVWVzlkTnZJcERoN3JOekF6cmtOUC9N?=
 =?utf-8?B?bFhEYVNHS1kyNTFNcGZtbklUb01WdDR0R0pvMGs2cUVBZ2VLVDF1VEUvamIx?=
 =?utf-8?B?VENtY0h5Zjk5bmxvbzNvM1VSKzZmWTJuZDUvdElabExrbjFHLzVsdTJYYkdR?=
 =?utf-8?B?eUlKOHl6ZmpPZGVjZk9kVGZWYy9JRjhSZ1NuZlc5NXAwOFZ5c1ZrZG40T0ll?=
 =?utf-8?B?Y0FRL2VKNmdFVTRjRzE0Yi93S2JtWmRvNm1Ic2NOU3dxVTRxSWwxM2FSQkZX?=
 =?utf-8?B?MGpvN3U2ZkpXVkVnVnFiR2FSU1E1RC9IajV5R05MODR6R1I4SWlsNml5ZFUy?=
 =?utf-8?B?aUN4aG1UbnIwcnlCdW1mM3BxTHdEY0lLUHBGN0QrVnBZU3lCWVRQZUdPODZq?=
 =?utf-8?B?b2FMZTE0MEwxWnFTc05naVZBM1ZrM0M5V2R2bzlZVHlrYktsRCs1cWNaanVj?=
 =?utf-8?B?YkpkSkhvRkhUOUJKcElxbHhqS25Nb0dhS2V2NWJERTgwaHQ3Y0ppVWwyS0ht?=
 =?utf-8?B?dmVhcnJVRUJrUmducGVYZmt5ajdEU3RJNU5Ub1Z5Uk5ITUEzSGE0WThMV2E0?=
 =?utf-8?B?cGFQL1lSVVRwbUVBaGhSakRwdjBJODNHT2NXUGQ5QUhVTklHSElNYURTcml0?=
 =?utf-8?B?a0ZsbCtuTG1YdmdKdEtvUFNwRlR6Q3dmVkplYXVSMWRSQ2hyZHYrSGU1OWlk?=
 =?utf-8?B?bFlzMy85NVNQdG14YTQxbU9YVkhkcVRNKzRHWmNsK3ZuZlJHYU1Zc0k1MGJL?=
 =?utf-8?B?RnR0T3hnMU9uRGQ2cFJKQWErZ3lVb1B4VTNRa2NBU2ZmaWtTVFhrNDVQRUYz?=
 =?utf-8?B?ME1yQ0lIVThlS09BNnlqVDE5MDZOQ2V4NEI2Q1A0ZlZELys4VzlSQ3V2R0g4?=
 =?utf-8?B?cTc5ekcrTnhubkx3MmtiT1V6S2dVT0kzNWU0QTZSRUlrZEN6dlBRbHVNUWhp?=
 =?utf-8?B?L3MraTVHaXlqbFk5dVliNmx1c0ZNL21VRll2MDZIVTZETjNGRDFuOGFHZi9S?=
 =?utf-8?B?c3N4V09rWHZpU0NiYUV0dnkya3hwWHBJRmNRajR0b25Ta3YwSGlHZFNhbmxx?=
 =?utf-8?B?dndPdnh2N1VSb3JvUXVIUUJEb0xTOUZKYkFkd1h6YmJ3b3QzQmV0MFFRMWxi?=
 =?utf-8?B?MkVIcHhvcXJYZEdYZlhPNW5Xak93VDVGdlQrOU9EYUJKMmJwbVhNdEZzQkIz?=
 =?utf-8?B?aE5FQ0RzcXIwakhic3hOakFHVjhCb21nNU5FdUUyWVF2S09CdTkxanRyWWg0?=
 =?utf-8?B?VWtDNkZiOEhyUkdCSVpJM2FxMFZDbU5mdmIxVVYyQXhVNWJPZ0ZZaXlGTWVM?=
 =?utf-8?B?TkpWVCtoTkZxdm1FT0gySSs4TURiREZIUnR6ZEJESGJkbWdNclpwWU1uT0l3?=
 =?utf-8?B?S3c3ZW1laW1nT2dOQlpjeUg0eEE1RXJOQ3dZUFVya1ZaRWJ4N3dPanl6YU5W?=
 =?utf-8?B?UjVrL09qcXN3WmtPK0JudkNjUGRrbWhNRXRLcUNHcU5WMGJWQ0cwbmpLc3lZ?=
 =?utf-8?B?MklHUWFYQ0YrK1RTQUh0U2dybS9WN3NVejZwZitpUkhTWTF1WWhDL2VhUEZv?=
 =?utf-8?B?SDBuMXpick5zS1ZmaFdpWkYvNXlWN21BVjJWcmRndVY4eHgxUzQreXlSY2d6?=
 =?utf-8?B?eXU0ZGJXMHR6b2Y1ejFVY21NenVZeldHR0p4MFpSOUxPdFpFb1FhY1BpNjc2?=
 =?utf-8?B?UTBwWW5yeHhxTjdZWklhdDlJOUcreUw0OHJBUGZGd1FZTXRsbjlSNFd2d1Bn?=
 =?utf-8?B?ZE5kTWE0RHp1NDM3KzhEdHByWnJaRHUrQit5TnVTTGNvTnB6dDBlMGtZb2ZH?=
 =?utf-8?B?c0lCYWVxRjdQNkhINTk5SVd4K0sxVm5INEU4eUFkR0FoQ3plNGtQZFN1UGtS?=
 =?utf-8?B?REhqWHY1WTBQSmVWbWIxVUFqS3k0aXM2Q0VmY1c2SlVtTFljeTF2RUtOQXpF?=
 =?utf-8?B?M1VZbmFlQVQvRitYTDRIb1dlVDlteVJ2ZVZhWHpZY0NtanVrRENwVGI4bFQ0?=
 =?utf-8?B?WCszTUxsbTVWdGtZckhqY0tLOFV3K1dkdHJZK2c0WjNsOWJBWEFvMnFJamt0?=
 =?utf-8?B?Q05EOXYraXExZ2dBOUpabEFibkw2cVI4bGNQelNFMjNrRWxWL0xmNXR4UU1F?=
 =?utf-8?Q?Ksv6boEo+kgVrUWw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c568e8-8b0d-41dc-f809-08da3a68a1b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 13:57:09.0322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3znNnPu89C0XK43ekuYg7UVfpWKSgZ4ZcIAe2m9iIxjVJKmyMgD4PtG1it5fMoE4Ny3Ovys+6YiXAdDSe6fQvacH1WTdjjZDiDmpHyj6IuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10102
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgTWFya3VzLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXchDQoNCk9uIDE5IE1heSAyMDIyIDIw
OjUyIE1hcmt1cyBFbGZyaW5nIHdyb3RlOg0KPiA+ICtAZGVwZW5kcyBvbiBwYXRjaEANCj4gPiAr
ZXhwcmVzc2lvbiBjbGs7DQo+ID4gK0BADQo+ID4gKw0KPiA+ICstIGlmICggXCggIWNsayBcfCBj
bGsgIT0gTlVMTCBcfCAhSVNfRVJSKGNsaykgIFx8DQo+ID4gKyFJU19FUlJfT1JfTlVMTChjbGsp
IFwpICkgeyBjbGtfZGlzYWJsZV91bnByZXBhcmUoY2xrKTsgfQ0KPiANCj4gDQo+IEkgZ3Vlc3Mg
dGhhdCB5b3Ugd291bGQgbGlrZSB0byBtYXJrIHRoZSBjdXJseSBicmFja2V0cyBhbHNvIGZvciBk
ZWxldGlvbi4NCj4gDQo+IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gaGFuZGxlIHNpbXBsZSBh
bmQgY29tcG91bmQgc3RhdGVtZW50cyB3aXRoIHlvdXINCj4gc291cmNlIGNvZGUgdHJhbnNmb3Jt
YXRpb24gYXBwcm9hY2g/DQoNClNpbmNlIHdlIG9ubHkgd2FudCB0byB0cmFuc2Zvcm0gY29kZSB0
aGF0IGp1c3QgY2FsbHMgY2xrX2Rpc2FibGVfdW5wcmVwYXJlDQphbmQgbm90aGluZyBlbHNlLCB3
ZSB0ZW5kIG5vdCB0byBoYXZlIG11Y2ggY29kZSBsaWtlIHRoYXQsIGJ1dCBwb2ludCB0YWtlbiEN
ClNvcnJ5LCBidXQgbXkgY29jY2luZWxsZSBza2lsbHMgYXJlIG9ubHkgYSBmZXcgZGF5cyBvbGQg
c28gSSdsbCBuZWVkIHRvDQp3b3JrIG91dCBob3cgdG8gZG8gdGhhdC4NCg0KPiA+ICtAc2NyaXB0
OnB5dGhvbiBkZXBlbmRzIG9uIHJlcG9ydEANCj4gPiArcDEgPDwgci5wMTsNCj4gPiArcDIgPDwg
ci5wMjsNCj4gPiArQEANCj4gPiArDQo+ID4gK21zZyA9ICJFUlJPUjogY2xrX2Rpc2FibGVfdW5w
cmVwYXJlIGFscmVhZHkgY2hlY2tzIGZvciB2YWxpZCBwdHIgc28NCj4gPiArY2hlY2sgb24gbGlu
ZSAlcyBpcyBub3QgbmVlZGVkIiAlIChwMVswXS5saW5lKQ0KPiANCj4gSSBpbWFnaW5lIHRoYXQg
aXQgY2FuIGJlIGEgYml0IGNsZWFyZXIgdG8gc3BsaXQgdGhlIG1lc3NhZ2UgaW50byB0d28NCj4g
c2VudGVuY2VzLg0KPiANCj4gQ2FuIGEgbGluZSBicmVhayBoZWxwIGhlcmU/DQpTb3JyeSwgSSBk
b27igJl0IGZvbGxvdyB5b3UuIFBlcmhhcHMgeW91IGNvdWxkIG1ha2UgYSBzdWdnZXN0aW9uIGZv
ciB3aGF0DQp5b3Ugd2FudD8NCg0KVGhhbmtzDQpQaGlsDQo=
