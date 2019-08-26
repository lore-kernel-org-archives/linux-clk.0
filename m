Return-Path: <SRS0=daJW=WW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73A6C3A5A1
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 03:14:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6EE0A2070B
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 03:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OY2UFJl8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbfHZDOp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Aug 2019 23:14:45 -0400
Received: from mail-eopbgr20055.outbound.protection.outlook.com ([40.107.2.55]:37890
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726215AbfHZDOp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 25 Aug 2019 23:14:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNDYIGLvGAcxO93XasJmmohuWY7qmdYu02dZCD9N3K1PzyfXTQE0YiVJDZGiQnQ6UHDNwbJuw0aKAw+NjTVAfdA7SxGNe//GIUkTJcej5y7QMpkusPoBTTltgXfhxHPp+P6UvMv9rfDFGi/DCkfjj24UytWdcbhrmsVkW5DgfY+gHYz2IAHjrvQ2dRzbBqF12Q8M2L+5NS+v7OdQBtUU8YVE78fCPwuCq9PLDeOEhLUwg8oy/gjFxz48Hxs8k1rFRAPKcWkdpXa99fZ/tTVdRzJo5782TEd4pL2hr3Yr58BBT14ld5PRF6J1lMHXt+WE8CZTObdkCIt/Okumo3DHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAmHtTMgFgRd54JiOwwMqGiFq1/NA8w9S7iWCnQ616Y=;
 b=KjjzEL5gOvsuAMiDib0YrzX49x/GY7VS9CHibPLBs9YV/NMtmcJWULwC2g6cTigGPMOaeDoNG0Kc4NeXKiDvUsG4LuneQd7Uxu27ebBQ0ir629maEUToFdgmd1umEJRQI/UNujRh2FX0QushZmz/XLs/87vlsNJc31ztMU2B283Q/1jilcduB9euiw5lI5ipqJJaw0S3WOpIVHh5gcvOayGJeuHIMzItWKP2WqPOCWjO0iJT+68Y3jYkkHQLkieCVgY49H+OOUnUyW6sZWqk45XMHbBRI2AS2g3Ajq2UhTRBfA3fPRomef9OBC0a/2Hel6FBpZipAAoOx5XqUTiueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAmHtTMgFgRd54JiOwwMqGiFq1/NA8w9S7iWCnQ616Y=;
 b=OY2UFJl8z1NxXZjRKU9voJz274Ww6DVNj3K20hgKTRDIi6Sa5TE8hHu9tViZ4y7qICz+TT4Ig3a6l+veV0ZDIKj5h3gh6NrsEgMzI6Y0jsmGRKPUcMZYHcwD6Lk+ziD1lCviaikh5P5QKS07Il1xRx8EGkSPqEaygFF2KiQGS4U=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5284.eurprd04.prod.outlook.com (20.177.41.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 03:14:41 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::44b4:2932:8e73:d707]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::44b4:2932:8e73:d707%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 03:14:41 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH V4 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Topic: [PATCH V4 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Index: AQHVV0rlu0hXHSvML0qy3W+1YgLATqcKs4wAgAIWVEA=
Date:   Mon, 26 Aug 2019 03:14:41 +0000
Message-ID: <AM0PR04MB4211047E7632FD0E48D53B9F80A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
 <20190824192101.GG16308@X250.getinternet.no>
In-Reply-To: <20190824192101.GG16308@X250.getinternet.no>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf1878e0-f1a0-4dd3-49cc-08d729d38930
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5284;
x-ms-traffictypediagnostic: AM0PR04MB5284:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5284BC279C0CFA247710543F80A10@AM0PR04MB5284.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(51914003)(54906003)(53936002)(305945005)(33656002)(476003)(486006)(66066001)(5660300002)(6436002)(53546011)(316002)(14454004)(8936002)(7736002)(26005)(55016002)(3846002)(4326008)(44832011)(6506007)(76176011)(7696005)(446003)(186003)(11346002)(102836004)(86362001)(25786009)(478600001)(99286004)(256004)(71200400001)(8676002)(74316002)(6116002)(81156014)(229853002)(66946007)(2906002)(52536014)(66556008)(64756008)(66446008)(6246003)(81166006)(71190400001)(66476007)(76116006)(9686003)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5284;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qITlmuVcbvDh5pJysVayGDHkik4jNxdJHNmcQ30arEM4sKgqeqc831i4bqlMae/ezI2Gbs7Dujt7Df8u85VO/527KyDjACBW6PIpvNmu/R52NGvQEnqE4I4Aoo+RXoXFfiQgpOvrdBvRJRqHkq8xadTtWNJa6ikEcUOXTDDYPzQG6dTHocvm/R5oisb0MsShBHpZS+LwDBPEgZoQjR63LwqcbRNtA9LvaQFKBK8cya1V/8fU1P+04NHJggGW+6E+Jzc84xbp2pfysTFSjH+lUctRktjPkWrTsBwXF/IrVbfjf9qDpvtjzR2TMJApJMW5q9ciAqhzryzmILnvcIeLVpIIJifdCO610I7ughEwWkZ0jz7XdBgFAgz5sXdm2fixwW+O1G9XVqOmuvp2En+szdsthfvPCGBrJeuLeH8/a8E=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1878e0-f1a0-4dd3-49cc-08d729d38930
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 03:14:41.1706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qLSmjeM0x7+5tQHdrFxZZz7U7A0NJ5RXepF1Yp+lQR5bxeB9cmjD83OJCqIAmPUS/BrjVPcw9R/9PjAy7n8cOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5284
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU2hhd24sDQoNCj4gRnJvbTogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiBT
ZW50OiBTdW5kYXksIEF1Z3VzdCAyNSwgMjAxOSAzOjIxIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjQgMDIvMTFdIGR0LWJpbmRpbmdzOiBjbG9jazogaW14LWxwY2c6IGFkZCBzdXBwb3J0IHRv
DQo+IHBhcnNlIGNsb2NrcyBmcm9tIGRldmljZSB0cmVlDQo+IA0KPiBPbiBUdWUsIEF1ZyAyMCwg
MjAxOSBhdCAwNzoxMzoxNkFNIC0wNDAwLCBEb25nIEFpc2hlbmcgd3JvdGU6DQo+ID4gTVg4UU0g
YW5kIE1YOFFYUCBMUENHIENsb2NrcyBhcmUgbW9zdGx5IHRoZSBzYW1lIGV4Y2VwdCB0aGV5IG1h
eQ0KPiA+IHJlc2lkZSBpbiBkaWZmZXJlbnQgc3Vic3lzdGVtcyBhY3Jvc3MgQ1BVcyBhbmQgYWxz
byB2YXJ5IGEgYml0IG9uIHRoZQ0KPiBhdmFpbGFiaWxpdHkuDQo+ID4NCj4gPiBTYW1lIGFzIFND
VSBjbG9jaywgd2Ugd2FudCB0byBtb3ZlIHRoZSBjbG9jayBkZWZpbml0aW9uIGludG8gZGV2aWNl
DQo+ID4gdHJlZSB3aGljaCBjYW4gZnVsbHkgZGVjb3VwbGUgdGhlIGRlcGVuZGVuY3kgb2YgQ2xv
Y2sgSUQgZGVmaW5pdGlvbg0KPiA+IGZyb20gZGV2aWNlIHRyZWUgYW5kIG1ha2UgdXMgYmUgYWJs
ZSB0byB3cml0ZSBhIGZ1bGx5IGdlbmVyaWMgbHBjZyBjbG9jaw0KPiBkcml2ZXIuDQo+ID4NCj4g
PiBBbmQgd2UgY2FuIGFsc28gdXNlIHRoZSBleGlzdGVuY2Ugb2YgY2xvY2sgbm9kZXMgaW4gZGV2
aWNlIHRyZWUgdG8NCj4gPiBhZGRyZXNzIHRoZSBkZXZpY2UgYW5kIGNsb2NrIGF2YWlsYWJpbGl0
eSBkaWZmZXJlbmNlcyBhY3Jvc3MgZGlmZmVyZW50IFNvQ3MuDQo+ID4NCj4gPiBDYzogUm9iIEhl
cnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gPiBDYzogU3RlcGhlbiBCb3lkIDxzYm95ZEBr
ZXJuZWwub3JnPg0KPiA+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+ID4g
Q2M6IFNhc2NoYSBIYXVlciA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+IENjOiBNaWNoYWVs
IFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+DQo+ID4gQ2M6IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9mZi1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5n
LmRvbmdAbnhwLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5l
bC5vcmc+DQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCkRvIHlvdSB0aGluayBpZiB3ZSBoYXZl
IGEgY2hhbmNlIHRvIGNhdGNoIHVwIHY1LjQ/DQpXaWxsIHRoaXMgcGF0Y2ggc2V0IGdvIHRocm91
Z2ggQ2xvY2sgdHJlZSBvciB5b3VyIHRyZWU/DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg==
