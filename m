Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162BDC56201
	for <linux-clk@archiver.kernel.org>; Tue, 24 Nov 2020 10:28:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A098F206FA
	for <linux-clk@archiver.kernel.org>; Tue, 24 Nov 2020 10:28:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AcR4whMC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgKXK2F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Nov 2020 05:28:05 -0500
Received: from mail-eopbgr80072.outbound.protection.outlook.com ([40.107.8.72]:48007
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726000AbgKXK2E (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Nov 2020 05:28:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOQTuikOsFYIIDQB+yr4Y8zI48C4EJDcCiBmiFx9YZb37y7rPZvYP9YN1eS3/RR+5e++VTia8C1TWeXHV8f245pID5H8p516w+FEqhenJ70V4szGg9MiWYDw9tPxqIofNpNyTbZobZCEG9xbYg+7R+ZcI/Lu0zlJ/pABdGOP2/QPvaAsyI2IZ32g8P4tv+48M7MjojPmVQfkJKW2Dj8Hq8gKU0Rdkka/9mpGhfdI9TIcsUl2XI7mCYCL4DO/yvcJBXBRg5UJNQSC06K7kuQNwjfvSWRPSYIN14o7ptS+s24IxaGtHXUzB1i/yivl12f8FzWW6T2UfH183zsTmxyXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj+/fVKskagjL8teRJyiYjqIuyARR4iWxgtS2eF9eGk=;
 b=elPAQer4GGIi+YQAj4aDKhEDBNxPy7I+WEOSTWh+nmRlI19CX5JWHQjua9YSwf+ukZY9+mI4KH502x7yv7NhEEWYvN1IPKoOsYatYczWDScCoNiGH+vJBnZU+ot4+Vrpv6meGxELLLDICdvuf7ogRXP/pNtI6GTTT8Bop0XmGJPgTKf67lk1vE6gOoIiSJrI/rUrbN/0LEpIJBWJAvkNCRUuNMcSQkiuzRtf5wXDEASRK+neV+93YKmCMSlqyyh8oUv1lyoDK1EXRNTT+Q3ncjs6iMh6SAMxXFvdaxubSBdCkdTzWmqQQhev4PcW+rQ3lytTk/2qZqkL5gGV5SzjMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj+/fVKskagjL8teRJyiYjqIuyARR4iWxgtS2eF9eGk=;
 b=AcR4whMCkU8mVq7jCrEokuuA3vSZvK1X1ahqCX0gv2oweW0u0ZcFfjVelKyoed9MpfioqHMfjZJx/MIJs3VCqLDSUbe0FobIouT+MwT/yBa/9Adz5b4nkFH+CE4jfeML1dnjvo4VAbijpNTzaj09gpHnMVHRXJtrEgG6Sa/65LU=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR0402MB3671.eurprd04.prod.outlook.com (2603:10a6:209:19::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Tue, 24 Nov
 2020 10:28:00 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Tue, 24 Nov 2020
 10:28:00 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH 1/1] clk: imx: scu: remove the calling of device_is_bound
Thread-Topic: [PATCH 1/1] clk: imx: scu: remove the calling of device_is_bound
Thread-Index: AQHWvmuOPqiM3Q9w+0qUhwE0BvUIAanPbSsAgAAmfyCAACbYAIAHYPHA
Date:   Tue, 24 Nov 2020 10:28:00 +0000
Message-ID: <AM6PR04MB4966E899EF374A71FB1C885C80FB0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201119114302.26263-1-aisheng.dong@nxp.com>
 <20201119130800.boyqn4rtczq4wcvn@debian>
 <AM6PR04MB49667ACF83F057E5591E676080E00@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <CADVatmNW6L4xH99DVDK_T2y-DcDZQ0YtdpyQvTEK5kGRPOV9Pw@mail.gmail.com>
In-Reply-To: <CADVatmNW6L4xH99DVDK_T2y-DcDZQ0YtdpyQvTEK5kGRPOV9Pw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 809e092a-edc1-41f4-ae9a-08d890639e74
x-ms-traffictypediagnostic: AM6PR0402MB3671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB36715C1053A8CEC25B2B8F9F80FB0@AM6PR0402MB3671.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EFWqCfslTC1kcWsnVs3kj9n82xmSG4NRtHKJSnBsur1Di3Fdb4Ef3dWClOxFaEeNL8evABrwM7uqqYakm3uDJXscAKerrcTC9NGNmAc+fYauYDxa/0hm6JCWaxvmIZhPP3mizDjrCgWVnfzwxqmt0WAGeqTfEDEMrahRhfcMXNZy8UPU+FSZd6P7XUAYGBtXIFeoJaNSecoqW8DyqnUeYQ3qWN3pyxCmt4OzfnGcSNgPYDxY8w+Ia7/Tr90E7g7oebJ86KXAMDEaJtu5pPYz0SaolmGcsueDIoqOTknrbGZLkAE80RBVNcOveDos2+FIsRNQsSeybfSE9l347woOHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(316002)(8676002)(7696005)(54906003)(44832011)(33656002)(86362001)(53546011)(26005)(6506007)(6916009)(64756008)(5660300002)(66556008)(76116006)(4326008)(66446008)(66946007)(66476007)(83380400001)(2906002)(55016002)(478600001)(186003)(9686003)(8936002)(71200400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: UftyPsyLyvjncHx1my7zS6S9Dam5+NHLuZXi3spr0+1Abn3FRkLBcsljQbU767ynRbX0ytTY7XHqjlpL1mLdYRMHAoZvsUWtd2WCXschmVm+Ar4p2ZFo0bV9WlCbg92TtL+PqzO6Q/8iXvOoiyTt0z2cT6Kf2I77hCdfIT6ZKpKdAb1v95Vh/VL3xOLJKx1hYu86bgsK80jHgDKk8XGsuEYKQbJ9QmGXzBONo8Xni7woEAMy2tPbNqeBxuekydhFUaNlzgwgzuo2ykJ/tCSca+EzIIatIKH7QB2uQvw2V5oEw/iOS0JmN3iK9+XSE4syFyEFBwBJn2RPPchpC12CrTCrs3AIDlZuY00AZUvcTuNRG14Pnr7vR1mD484A3m3kOeNcQkWuvYzGfiSPS/8ab8qE3W5NxcZTkFRSsmoogn8rzp7O4bwIBye34UcMVIk18oowjhmRRbM2d4PtsrrIe/r1tDuDIwpzd9BwCayCkLU3symypPLhruIKCHmQ4zOBG/1h2QAuk11jnGF6ypfHC2lMNh7+TTLZV2+zGE2dym3MyaD8CP8aq76PUoeUucwq8WQ5w8R8+ZxUMMwkmwQTscFfYc89/sYbeGh/uwq9509S8Thk7JfZiAhbVvNaIFRMAKChWKuHW5orUgZtHDkIYhSVqMSvdO80Dt+qK9W9XuqsIpNDODjDckfZTQRYWFqk/0JMwRG4SmqerpYep7zEDAc4LicXxAjr19hI8bg+NyO/BO5VPg8BYODUnd485kR2z0Omg3Pd+SPBRaXueT33vpHx0TdeqAy81BAu8fzST6B3HkyF9+XNGmTU3ZarYHQM+508byXUTumya9nDzQj8IVMtnieLa9l8xdojArFQGTOVO7v6V1zUb2FDrFe1MZQJQIZ4DlByR54a4DUHHYT2EQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 809e092a-edc1-41f4-ae9a-08d890639e74
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 10:28:00.6195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fiLjRRHym+QloeDMSwrMcJbdyYAHagHIXPswqhDGWKHP5nBousl9xgcevaiRnJpGJP2xglNC9B5FUZKvrrwP5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3671
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTdWRpcCBNdWtoZXJqZWUgPHN1ZGlwbS5tdWtoZXJqZWVAZ21haWwuY29tPg0KPiBT
ZW50OiBGcmlkYXksIE5vdmVtYmVyIDIwLCAyMDIwIDE6NDUgQU0NCj4gT24gVGh1LCBOb3YgMTks
IDIwMjAgYXQgMzozMCBQTSBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiB3
cm90ZToNCj4gPg0KPiA+ID4gRnJvbTogU3VkaXAgTXVraGVyamVlIDxzdWRpcG0ubXVraGVyamVl
QGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxOSwgMjAyMCA5OjA4
IFBNDQo+ID4gPg0KPiA+ID4gSGkgRG9uZywNCj4gPiA+DQo+ID4gPiBPbiBUaHUsIE5vdiAxOSwg
MjAyMCBhdCAwNzo0MzowMlBNICswODAwLCBEb25nIEFpc2hlbmcgd3JvdGU6DQo+ID4gPiA+IFRo
ZSBkZXZpY2VfaXNfYm91bmQoKSBpcyB1bnZpc2FibGUgdG8gZHJpdmVycyB3aGVuIGJ1aWx0IGFz
IG1vZHVsZXMuDQo+ID4gPiA+IEl0J3MgYWxzbyBub3QgYWltZWQgdG8gYmUgdXNlZCBieSBkcml2
ZXJzIGFjY29yZGluZyB0byBHcmVnIEsuSC4NCj4gPiA+ID4gTGV0J3MgcmVtb3ZlIGl0IGZyb20g
Y2xrLXNjdSBkcml2ZXIgYW5kIGZpbmQgYW5vdGhlciB3YXkgdG8gZG8NCj4gPiA+ID4gcHJvcGVy
IGRyaXZlciBsb2FkaW5nIHNlcXVlbmNlLg0KPiA+ID4NCj4gPiA+IEdyZWcgd2FzIGFza2luZyB0
byB1c2UgZGV2aWNlX2xpbmsgZm9yIHRoaXMgaXNzdWUuIEhhdmUgeW91IHRyaWVkDQo+ID4gPiBz
b21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nOiAodW50ZXN0ZWQgYXMgSSBkb250IGhhdmUgdGhl
IGhhcmR3YXJlKS4NCj4gPg0KPiA+IEl0IGNhbid0IHdvcmsgYXMgZXhwZWN0ZWQgYmVjYXVzZSBp
dCByZXF1aXJlcyBzdXBwbGllciBkZXZpY2VzIChzY3UgcGQpIHRvIGJlDQo+IHByb2JlZCBmaXJz
dC4NCj4gPiBhbmQgaWYgc2N1IHBkIHdhcyBwcm9iZWQgZmlyc3QsIHRoZW4gdGhlcmUncmUgYWxy
ZWFkeSBubyBpc3N1ZXMuDQo+IA0KPiBobW0uLiB0aGF0cyBvZGQuIEkgd2FzIGV4cGVjdGluZyB0
aGF0IGlmICJzY3UtcGQiIGhhcyBub3QgcmVnaXN0ZXJlZCB0aGVuDQo+IGRldmljZV9saW5rX2Fk
ZCgpIHdpbGwgcmV0dXJuIE5VTEwgYW5kIHRoZW4gaW14X2Nsa19zY3VfaW5pdCgpIHdpbGwgcmV0
dXJuDQo+IC1FUFJPQkVfREVGRVIuDQoNClRoZSBwcm9ibGVtIGlzIHdoYXQgaWYgc2N1LXBkIGhh
cyByZWdpc3RlcmVkIGJ1dCBub3QgcHJvYmVkLiBUaGUgZGV2aWNlIF9saW5rX2FkZA0Kd29uJ3Qg
YmxvY2sgdGhlIHNjdSBjbGsgdG8gY29udGludWUgdG8gcnVuIHdoaWxlIHNjdV9wZCBkcml2ZXIg
aXMgc3RpbGwgbm90IHJlYWR5Lg0KVGhpcyBpcyBub3QgYXMgZXhwZWN0ZWQuDQoNClJlZ2FyZHMN
CkFpc2hlbmcNCg0KDQo+IA0KPiANCj4gLS0NCj4gUmVnYXJkcw0KPiBTdWRpcA0K
