Return-Path: <SRS0=qW/6=5A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300D4C10DCE
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 14:10:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D621E20674
	for <linux-clk@archiver.kernel.org>; Sun, 15 Mar 2020 14:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="KR48iTYM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgCOOKo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Mar 2020 10:10:44 -0400
Received: from mail-eopbgr140075.outbound.protection.outlook.com ([40.107.14.75]:29582
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727778AbgCOOKo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 15 Mar 2020 10:10:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi++fl8r3bqAAL828k0CPpr71t/nwaSGKQRS4n4v4OJwK9r0m3lFe8PcKj8wUUI1bPcmMt84oIvd4uR9VANFwRmdK3OeutXuNnuQRp5KarIt9XtDvuvkaYmx6VuGS4etPlHUbnHIG0mR6LQqvKKPykDzdIjctiSZIIQa4FfAM05FPGMAXzBkj3tGJxfTChNgHohvSF8lJ9jykk7QlILYgEqjLDFD9M5lfYSDbpKRByPhdch8QVhFHYLJPE0fCQIa0NkZ1DVtIo2f0x6Bo/f8uEVs4MmCmnHOlrHgdqOrD/K6mi2xwVPKpIF+dhIaD/QijDjEbT+Kc+uc2VonwH3FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2EO4HknYgLt17MtUj/YEDOIKP1mlVfNFunxOKxfpjI=;
 b=QRqDFUrIbqyz4r+sxKXUPFgnH56tWId5uTtwNNfUjb7fhtk/po8sg3eXfITwkMppXJw59C2AIwhrdCxkspFo++OjJ4BkR2TSXD6sPoXZzenHk1RsBSeCp01mH/A+v7vltGkos/4MM+QftU4yBrHlLT4uiNG404zRL6QSkGuxbaJFKM+O/5OR75uxHE9Xui9yooy3+JcwtTPPeqYgafavRtBDGzn+pEWYSFDi2+UW1rc6h3UOuUT05gPM1/YtVBiaXKepu2aP1WswtnZyJ18hfbpPmDfZ8LydrC8KkC1tzuQlScD8Z+aqi43phvLucvaDVAW6WAAv5eKt78lK5Wz+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2EO4HknYgLt17MtUj/YEDOIKP1mlVfNFunxOKxfpjI=;
 b=KR48iTYMTenLjBZ2Ln34VaoST89iBMFuCOqCATpKukb+hce98sKCHBFdBtl7XSXRft9U4TNosC8VHt1sq1P00jSftuTWDoKOAhonehmj9rGTgelPjWeUijHlHpc3p7bb7HUZ61Mim3hK1rIJuPT+DxGeF5PsgCqklrPMFuGr8Kg=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB6066.eurprd04.prod.outlook.com (20.179.33.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Sun, 15 Mar 2020 14:10:40 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cb2:6bfa:b5bc:2ae3]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::8cb2:6bfa:b5bc:2ae3%7]) with mapi id 15.20.2814.021; Sun, 15 Mar 2020
 14:10:40 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "dongas86@hotmail.com" <dongas86@hotmail.com>,
        Oliver Graute <oliver.graute@gmail.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V6 00/12] clk: imx8: add new clock binding for better pm
 support
Thread-Topic: [PATCH V6 00/12] clk: imx8: add new clock binding for better pm
 support
Thread-Index: AQHV+tC4KM3qOryI0kukDYglzXuSqahJsFvw
Date:   Sun, 15 Mar 2020 14:10:39 +0000
Message-ID: <AM0PR04MB42117B51ACA7E84CDB7995F380F80@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 479f2d35-47b4-4504-f980-08d7c8eaa44c
x-ms-traffictypediagnostic: AM0PR04MB6066:|AM0PR04MB6066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB6066F2141A6D46D9EE140C4280F80@AM0PR04MB6066.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0343AC1D30
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(199004)(7696005)(2906002)(52536014)(6506007)(5660300002)(45080400002)(44832011)(186003)(26005)(316002)(33656002)(966005)(110136005)(54906003)(478600001)(4326008)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(8936002)(8676002)(81156014)(81166006)(9686003)(86362001)(71200400001)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6066;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qfl11QlFhXcBUifEu5/MdktWVTRZOoYe619R9W8Q6xSZJ4d0t84RQCA1kx8n2cgE3IiJZtRSD2R0kKCp1mnYAeH1Xs0SDrSUYb0wAtYKcXTjyjocmkEl+56gaKoReibOTedmSHUCizkfJbTDWEZyzqMxfR7OWoZfC1qT8Qu3w+6q2/0bYhoNmb3ZPHQUMHYn7dbyaYYbT3qXFLvYuSP8Wz2+N6k737odQ9HXG9G0JLUub9mTlpsqkHltpi7mjFUZuMjMx83dK9+1PNQl36t2tt44yV1wBPP5gopQyaKnjxhr9yCwZI6iPaVrHCl+tBm8KkLnQrQC9PiV/Fl6+vXrw8IyD5EpO91BOUEVR5NYN4WA1G769PHS6Bf1neKqQ6CcpzgOXhcXmA9TxCMOA3DjI/95n2ss5p0nq6oVyskqFzfCiVwMDexsMcggs8L580vbo25Yi33OMLK3sPJlrlyRa9amMmie6x3JApnLs7ltfTwFQfdHLcDurD65xs+xK77lwEtKb2k+m4cTLjFKYVL9BA==
x-ms-exchange-antispam-messagedata: NPnEnNRyiTVFneNWyc5XJu/8DF1iK1K47XH8/6DPXMEnXht4H/e0A2Ue3INZNuztb1YmQYhfmeIecVVf7NP4XnFdVW7FkQmJD8Qm54eBE7XjAK23fv+dO8UvofrSPqSbdgKqFd2lMNurn/3WvTmJ1g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479f2d35-47b4-4504-f980-08d7c8eaa44c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2020 14:10:39.9015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbrBfcjFsFbjqt49eL/E9P5h7u5rvBjYZC3SAksi0ugacBZsr9pqlqq/zXvawI8EKEXZWeU+Fuoyoa5QhT317w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6066
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KPiBGcm9tOiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29t
Pg0KPiBTZW50OiBTdW5kYXksIE1hcmNoIDE1LCAyMDIwIDk6NDQgUE0NCj4gDQo+IFRoaXMgcGF0
Y2ggc2VyaWVzIGlzIGEgcHJlcGFyYXRpb24gZm9yIHRoZSBNWDggQXJjaGl0ZWN0dXJlIGltcHJv
dmVtZW50Lg0KPiBBcyBmb3IgSU1YIFNDVSBiYXNlZCBwbGF0Zm9ybXMgbGlrZSBNWDhRTSBhbmQg
TVg4UVhQLCB0aGV5IGFyZSBjb21wcmlzZWQNCj4gb2YgYSBjb3VwbGUgb2YgU1MoU3Vic3lzdGVt
cykgd2hpbGUgbW9zdCBvZiB0aGVtIHdpdGhpbiB0aGUgc2FtZSBTUyBjYW4gYmUNCj4gc2hhcmVk
LiBlLmcuIENsb2NrcywgRGV2aWNlcyBhbmQgZXRjLg0KPiANCj4gSG93ZXZlciwgY3VycmVudCBj
bG9jayBiaW5kaW5nIGlzIHVzaW5nIFNXIElEcyBmb3IgZGV2aWNlIHRyZWUgdG8gdXNlIHdoaWNo
IGNhbg0KPiBjYXVzZSB0cm91YmxlcyBpbiB3cml0aW5nIHRoZSBjb21tb24gPHNvYz4tc3MteHgu
ZHRzaSBmaWxlIGZvciBkaWZmZXJlbnQgU29Dcy4NCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFp
bXMgdG8gaW50cm9kdWNlIGEgbmV3IGJpbmRpbmcgd2hpY2ggaXMgbW9yZSBjbG9zZSB0bw0KPiBo
YXJkd2FyZSBhbmQgcGxhdGZvcm0gaW5kZXBlbmRlbnQgYW5kIGNhbiBtYWtlcyB1cyB3cml0ZSBh
IG1vcmUgZ2VuZXJhbA0KPiBkcml2ZXJzIGZvciBkaWZmZXJlbnQgU0NVIGJhc2VkIFNvQ3MuDQo+
IA0KPiBBbm90aGVyIGltcG9ydGFudCB0aGluZyBpcyB0aGF0IG9uIE1YOCwgZWFjaCBDbG9jayBy
ZXNvdXJjZSBpcyBhc3NvY2lhdGVkIHdpdGgNCj4gYSBwb3dlciBkb21haW4uIFNvIHdlIGhhdmUg
dG8gYXR0YWNoIHRoYXQgY2xvY2sgZGV2aWNlIHRvIHRoZSBwb3dlciBkb21haW4gaW4NCj4gb3Jk
ZXIgdG8gbWFrZSBpdCB3b3JrIHByb3Blcmx5LiBGdXJ0aGVyIG1vcmUsIHRoZSBjbG9jayBzdGF0
ZSB3aWxsIGJlIGxvc3Qgd2hlbg0KPiBpdHMgcG93ZXIgZG9tYWluIGlzIGNvbXBsZXRlbHkgb2Zm
IGR1cmluZyBzdXNwZW5kL3Jlc3VtZSwgc28gd2UgYWxzbyBpbnRyb2R1Y2UNCj4gdGhlIGNsb2Nr
IHN0YXRlIHNhdmUmcmVzdG9yZSBtZWNoYW5pc20uDQo+IA0KPiBJdCdzIGJhc2VkIG9uIGxhdGVz
dCBzaGFudy9mb3ItbmV4dCBicmFuY2guDQo+IA0KPiBUaGUgdG9wIGNvbW1pdCBpczoNCj4gNDU1
OWExMWU0OGQ1IE1lcmdlIGJyYW5jaCAnaW14L2RlZmNvbmZpZycgaW50byBmb3ItbmV4dA0KPiAN
Cg0KSSBjYXJlZnVsbHkgd2VudCB0aHJvdWdoIGFsbCB5b3VyIHJldmlldyBjb21tZW50cyBvbiBW
NCBbMV0gYW5kIGknbSBzdXJlIGFsbCBvZiB0aGVtIGhhdmUgYmVlbiBhZGRyZXNzZWQuDQpBbmQg
Zm9yIHRoZSBWNS1SZXNlbmQgdmVyc2lvbiBbMl0gLCB3ZSBkaWRuJ3QgcmVjZWl2ZSB5b3VyIGNv
bW1lbnQuDQpJdCBzZWVtcyBTaGF3biBpcyBhbHNvIHdhaXRpbmcgZm9yIHlvdXIgZmVlZGJhY2sg
Zm9yIHRoZSBuZXh0IHN0ZXAuDQpDb3VsZCB5b3UgaGVscCBjaGVjayBWNj8NCg0KRm9yIFY2LCBv
bmx5IGEgbWlub3IgdXBkYXRlIHRoYXQgYWRkZWQgc2N1IGNsayB1bnJlZ2lzdGVyIGlmIG1ldCBl
cnJvci4gQXMgdGhlIG9yaWdpbmFsIGNvZGUgZG9lcyBub3Qgc3VwcG9ydCBpdCwNCnNvIGkgYWRk
ZWQgYW4gZXh0cmEgcGF0Y2ggdG8gaGFuZGxlIGl0Lg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtY2xrL0FNMFBSMDRNQjQyMTE4MUU0Mzc2MDcwNjM2ODk4OTA2RjgwQTEwQEFN
MFBSMDRNQjQyMTEuZXVycHJkMDQucHJvZC5vdXRsb29rLmNvbS90Lw0KWzJdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTEyNDgyNDkvDQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0K
PiBDaGFuZ2VMb2c6DQo+IHY1LT52NjoNCj4gICogYWRkIHNjdSBjbGsgdW5yZWdpc3RlciBpZiBh
ZGQgcHJvdmlkZXIgZmFpbGVkDQo+IHY0LT52NToNCj4gICogQWRkcmVzcyBhbGwgY29tbWVudHMg
ZnJvbSBTdGVwaGVuDQo+IHYzLT52NDoNCj4gICogdXNlIGNsay1pbmRpY2VzIGZvciBMUENHIHRv
IGZldGNoIGVhY2ggY2xrcyBvZmZzZXQgZnJvbSBkdA0KPiB2Mi0+djM6DQo+ICAqIGNoYW5nZSBz
Y3UgY2xrIGludG8gdHdvIGNlbGxzIGJpbmRpbmcNCj4gICogYWRkIGNsayBwbSBwYXRjaGVzIHRv
IGVhc2UgdGhlIHVuZGVyc3RhbmQgb2YgdGhlIGNoYW5nZXMNCj4gdjEtPnYyOg0KPiAgKiBTQ1Ug
Y2xvY2sgY2hhbmdlZCB0byBvbmUgY2VsbCBjbG9jayBiaW5kaW5nIGluc3BpcmVkIGJ5IGFybSxz
Y3BpLnR4dA0KPiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxz
Y3BpLnR4dA0KPiAgKiBBZGQgcmVxdWlyZWQgcG93ZXIgZG9tYWluIHByb3BlcnR5DQo+ICAqIERy
b3BwZWQgUEFUQ0ggMyY0IGZpcnN0LCB3aWxsIHNlbmQgdGhlIHVwZGF0ZWQgdmVyc2lvbiBhY2Nv
cmRpbmdseQ0KPiAgICBhZnRlciB0aGUgYmluZGluZyBpcyBmaW5hbGx5IGRldGVybWluZWQsDQo+
IA0KPiANCj4gRG9uZyBBaXNoZW5nICgxMik6DQo+ICAgZHQtYmluZGluZ3M6IGZpcm13YXJlOiBp
bXgtc2N1OiBuZXcgYmluZGluZyB0byBwYXJzZSBjbG9ja3MgZnJvbQ0KPiAgICAgZGV2aWNlIHRy
ZWUNCj4gICBkdC1iaW5kaW5nczogY2xvY2s6IGlteC1scGNnOiBhZGQgc3VwcG9ydCB0byBwYXJz
ZSBjbG9ja3MgZnJvbSBkZXZpY2UNCj4gICAgIHRyZWUNCj4gICBjbGs6IGlteDogc2N1OiBhZGQg
dHdvIGNlbGxzIGJpbmRpbmcgc3VwcG9ydA0KPiAgIGNsazogaW14OiBzY3U6IGJ5cGFzcyBjcHUg
cG93ZXIgZG9tYWlucw0KPiAgIGNsazogaW14OiBzY3U6IGFsbG93IHNjdSBjbGsgdG8gdGFrZSBk
ZXZpY2UgcG9pbnRlcg0KPiAgIGNsazogaW14OiBzY3U6IGFkZCBydW50aW1lIHBtIHN1cHBvcnQN
Cj4gICBjbGs6IGlteDogc2N1OiBhZGQgc3VzcGVuZC9yZXN1bWUgc3VwcG9ydA0KPiAgIGNsazog
aW14OiBpbXg4cXhwLWxwY2c6IGFkZCBwYXJzaW5nIGNsb2NrcyBmcm9tIGRldmljZSB0cmVlDQo+
ICAgY2xrOiBpbXg6IGxwY2c6IGFsbG93IGxwY2cgY2xrIHRvIHRha2UgZGV2aWNlIHBvaW50ZXIN
Cj4gICBjbGs6IGlteDogY2xrLWlteDhxeHAtbHBjZzogYWRkIHJ1bnRpbWUgcG0gc3VwcG9ydA0K
PiAgIGNsazogaW14OiBscGNnOiBhZGQgc3VzcGVuZC9yZXN1bWUgc3VwcG9ydA0KPiAgIGNsazog
aW14OiBzY3U6IHVucmVnaXN0ZXIgY2xvY2tzIGlmIGFkZCBwcm92aWRlciBmYWlsZWQNCj4gDQo+
ICAuLi4vYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dCAgICAgICAgfCAgMTIgKy0N
Cj4gIC4uLi9iaW5kaW5ncy9jbG9jay9pbXg4cXhwLWxwY2cudHh0ICAgICAgICAgICB8ICAzNiAr
Ky0NCj4gIGRyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC1scGNnLmMgICAgICAgICAgICB8IDEz
OSArKysrKysrKysrKw0KPiAgZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4cXhwLmMgICAgICAgICAg
ICAgICAgIHwgMTM2ICsrKysrKy0tLS0tDQo+ICBkcml2ZXJzL2Nsay9pbXgvY2xrLWxwY2ctc2N1
LmMgICAgICAgICAgICAgICAgfCAgNTMgKysrLQ0KPiAgZHJpdmVycy9jbGsvaW14L2Nsay1zY3Uu
YyAgICAgICAgICAgICAgICAgICAgIHwgMjMxICsrKysrKysrKysrKysrKysrLQ0KPiAgZHJpdmVy
cy9jbGsvaW14L2Nsay1zY3UuaCAgICAgICAgICAgICAgICAgICAgIHwgIDU2ICsrKystDQo+ICBp
bmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2lteDgtbHBjZy5oICAgICAgICAgfCAgMTQgKysNCj4g
IGluY2x1ZGUvZHQtYmluZGluZ3MvZmlybXdhcmUvaW14L3JzcmMuaCAgICAgICB8ICAyMyArKw0K
PiAgOSBmaWxlcyBjaGFuZ2VkLCA2MTAgaW5zZXJ0aW9ucygrKSwgOTAgZGVsZXRpb25zKC0pICBj
cmVhdGUgbW9kZSAxMDA2NDQNCj4gaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9pbXg4LWxwY2cu
aA0KPiANCj4gLS0NCj4gMi4yMy4wDQoNCg==
