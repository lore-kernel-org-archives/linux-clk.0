Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9940C3A5A2
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 12:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AFB22085A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 12:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BfRrqhgi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfHSMnE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 08:43:04 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:26341
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727301AbfHSMnE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Aug 2019 08:43:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVY8ODTNbx4S7zzsf5zFkmBhfTJPG0S5XBlC+8KXeT8z+Bie7Sl1EOgcRPDUdBUvTlOgLdVLRjSZIBBuA3iIdh51ejcjSWhKtz0PnKBUQ+NhA6ydrnpU2oOpo9ur0DB/ofGMZaNZYKnDX+dQyLYBMjRj1QUHZ9MHnecuuo57aM1p1L+NklLjtnuuPZ6mFnrXS6iz71heAtH1U0FJooJca5SYHFVZqXWxlxNixveEHaHS99XTYcDv1XixXkpd/+c+t1QBFPbcg7nY8coXKFfO/kAaQnt1ceL5StqrUCD739DU6FZmVVpMXEkc97H8hJaoonHnDQA70dbEdtdTdDFWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TIQKApwY5DR7zhg8nMkLdOKTIlLOKbvYTZ3CI5d6ow=;
 b=i52GwjWiZ31H9hgEDXSw9wsI/RK6GKlfUK53qBBo1UowceGT+0u3VgA8cvOnZGWGj4rhJcJtzcan6EW4S2xmYZb+xwnoPRrNrN0L3r7LduhNwDSbGrjlB94QiKwMFDSuq77LWkJp2ICxDKmD6x0qXWz6zdOWqdRzdpm0SF8aFXiohy+wVirG2bxUndq241WZO5OgO01vfFxckE8s5tM/JPBpNx163J4vXbcM0nqOKnmaRHspQHAEMyviTR+hQ2T2G/ww3OnJuOVPsk+24orpnuRspBkPXNsPLh9pcS7xfxaQ6kvDR4BJAxZVxqsGhL63LslwtBq/AtuFoj/uG/3fMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TIQKApwY5DR7zhg8nMkLdOKTIlLOKbvYTZ3CI5d6ow=;
 b=BfRrqhgijeVVzORnmVvJw4+PHe5cOwIhdu7Vm2aShCg4KehTJT0tU18iz5jUKhFLejTk2OyPZ3Z0nhlRtGfkHcMZjNoKhBmb+z3HieGK2RDtRBwdMA0ZhWYJBHbTA35thoMXL4sUvSyUahctdKliIdns4tWu3l7gH6WND4KHo70=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB4542.eurprd04.prod.outlook.com (20.177.55.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 12:42:57 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c%7]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 12:42:57 +0000
From:   Daniel Baluta <daniel.baluta@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "daniel.baluta@gmail.com" <daniel.baluta@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Topic: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Index: AQHVO+pjaalMbukSV0m/uPLkqZx8HqcCn2yA
Date:   Mon, 19 Aug 2019 12:42:57 +0000
Message-ID: <e5214ff9ae6d431052bc871d4b7c22dc0c2c2829.camel@nxp.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
         <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99447afa-8aa3-4141-018f-08d724a2c375
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4542;
x-ms-traffictypediagnostic: VI1PR04MB4542:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB454243C2FBD8767B72245FDDF9A80@VI1PR04MB4542.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(189003)(199004)(54534003)(53936002)(2906002)(44832011)(99286004)(76176011)(6512007)(25786009)(76116006)(36756003)(118296001)(66446008)(66946007)(66476007)(229853002)(6116002)(3846002)(486006)(446003)(66066001)(6486002)(2616005)(2501003)(476003)(6436002)(5660300002)(6246003)(4326008)(14454004)(50226002)(6506007)(316002)(11346002)(8936002)(7736002)(81166006)(8676002)(81156014)(26005)(305945005)(186003)(71190400001)(71200400001)(256004)(14444005)(478600001)(54906003)(91956017)(110136005)(86362001)(102836004)(64756008)(66556008)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4542;H:VI1PR04MB4094.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0qI3Clqr5tolWxYJiT1Myfw7icVOQj2gG2BDTbm3Y0KmIuZoNiR0wVzHlAUPifmlJeqMbZ4iyMfLTmt0AVNzX3x1SscXereqO+i91nlO7cHNEhkUtxzmFXgvIJg113Umi9R0uESoosdFVWHZxSeppfPjCmPMQIyIvW21MGz23lEJEHPAhb9NWrkvnf/PP1zHk8KPpIbW++J8e5mvbA9HECa3V6mTd8+vdqbP4LawW3OICTULd+01eOTbzajLbmIHF69huY8yURU/ozAwMKgCBxmL4ExNAwrQUvgxNxtwOUEFxg2OpWKGyPECwvtK+A+fJlUBsy1fA3P6L6J7OO7W1xllUVXviSRefon2s7ZlY8Pc2GQZdL439FhmcUEufLyaMnj1otZ3vEyYHM53xHaRwnHSjXUVRDAvHueFV4S2StU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAC9B6185F4BA148960D556F73713281@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99447afa-8aa3-4141-018f-08d724a2c375
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 12:42:57.7112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXZhMonm6xaHsu+LdzpBObj9GD5QttMIRXOYKC4Omj9rnaLfNLV7IvFleoBRDNd/9ZVAAlzI0j/XrOD1xmZ8bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4542
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gVHVlLCAyMDE5LTA3LTE2IGF0IDIzOjAwICswODAwLCBEb25nIEFpc2hlbmcgd3JvdGU6DQo+
IE1YOFFNIGFuZCBNWDhRWFAgTFBDRyBDbG9ja3MgYXJlIG1vc3RseSB0aGUgc2FtZSBleGNlcHQg
dGhleSBtYXkNCj4gcmVzaWRlDQo+IGluIGRpZmZlcmVudCBzdWJzeXN0ZW1zIGFjcm9zcyBDUFVz
IGFuZCBhbHNvIHZhcnkgYSBiaXQgb24gdGhlDQo+IGF2YWlsYWJpbGl0eS4NCj4gDQo+IFNhbWUg
YXMgU0NVIGNsb2NrLCB3ZSB3YW50IHRvIG1vdmUgdGhlIGNsb2NrIGRlZmluaXRpb24gaW50byBk
ZXZpY2UNCj4gdHJlZQ0KPiB3aGljaCBjYW4gZnVsbHkgZGVjb3VwbGUgdGhlIGRlcGVuZGVuY3kg
b2YgQ2xvY2sgSUQgZGVmaW5pdGlvbiBmcm9tDQo+IGRldmljZQ0KPiB0cmVlIGFuZCBtYWtlIHVz
IGJlIGFibGUgdG8gd3JpdGUgYSBmdWxseSBnZW5lcmljIGxwY2cgY2xvY2sgZHJpdmVyLg0KPiAN
Cj4gQW5kIHdlIGNhbiBhbHNvIHVzZSB0aGUgZXhpc3RlbmNlIG9mIGNsb2NrIG5vZGVzIGluIGRl
dmljZSB0cmVlIHRvDQo+IGFkZHJlc3MNCj4gdGhlIGRldmljZSBhbmQgY2xvY2sgYXZhaWxhYmls
aXR5IGRpZmZlcmVuY2VzIGFjcm9zcyBkaWZmZXJlbnQgU29Dcy4NCj4gDQo+IENjOiBSb2IgSGVy
cmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KPiBDYzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJu
ZWwub3JnPg0KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiBDYzogU2Fz
Y2hhIEhhdWVyIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBNaWNoYWVsIFR1cnF1ZXR0
ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+DQo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29t
Pg0KPiAtLS0NCj4gQ2hhbmdlTG9nOg0KPiB2Mi0+djM6DQo+ICAqIG5vIGNoYW5nZXMNCj4gdjEt
PnYyOg0KPiAgKiBVcGRhdGUgZXhhbXBsZQ0KPiAgKiBBZGQgcG93ZXIgZG9tYWluIHByb3BlcnR5
DQo+IC0tLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OHF4cC1scGNnLnR4
dCAgICAgfCAzNA0KPiArKysrKysrKysrKysrKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MjggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OHF4cC1scGNnLnR4dCANCj4g
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OHF4cC1scGNnLnR4
dA0KPiBpbmRleCA5NjVjZmE0Li42ZmMyZmQ4IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OHF4cC1scGNnLnR4dA0KPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svaW14OHF4cC1scGNnLnR4dA0KPiBA
QCAtMTEsNiArMTEsMjEgQEAgZW5hYmxlZCBieSB0aGVzZSBjb250cm9sIGJpdHMsIGl0IG1pZ2h0
IHN0aWxsIG5vdA0KPiBiZSBydW5uaW5nIGJhc2VkDQo+ICBvbiB0aGUgYmFzZSByZXNvdXJjZS4N
Cj4gIA0KPiAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gKy0gY29tcGF0aWJsZToJCVNob3VsZCBi
ZSBvbmUgb2Y6DQo+ICsJCQkgICJmc2wsaW14OHF4cC1scGNnIg0KPiArCQkJICAiZnNsLGlteDhx
bS1scGNnIiBmb2xsb3dlZCBieSAiZnNsLGlteDhxeHAtDQo+IGxwY2ciLg0KPiArLSByZWc6CQkJ
QWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlciBzZXQuDQo+ICstICNjbG9jay1jZWxs
czoJCVNob3VsZCBiZSAxLiBPbmUgTFBDRyBzdXBwb3J0cyBtdWx0aXBsZQ0KPiBjbG9ja3MuDQo+
ICstIGNsb2NrczoJCUlucHV0IHBhcmVudCBjbG9ja3MgcGhhbmRsZSBhcnJheSBmb3IgZWFjaA0K
PiBjbG9jay4NCj4gKy0gYml0LW9mZnNldDoJCUFuIGludGVnZXIgYXJyYXkgaW5kaWNhdGluZyB0
aGUgYml0DQo+IG9mZnNldCBmb3IgZWFjaCBjbG9jay4NCj4gKy0gaHctYXV0b2dhdGU6CQlCb29s
ZWFuIGFycmF5IGluZGljYXRpbmcgd2hldGhlcg0KPiBzdXBwb3J0cyBIVyBhdXRvZ2F0ZSBmb3IN
Cj4gKwkJCWVhY2ggY2xvY2suDQo+ICstIGNsb2NrLW91dHB1dC1uYW1lczoJU2hhbGwgYmUgdGhl
IGNvcnJlc3BvbmRpbmcgbmFtZXMgb2YgdGhlDQo+IG91dHB1dHMuDQo+ICsJCQlOT1RFIHRoaXMg
cHJvcGVydHkgbXVzdCBiZSBzcGVjaWZpZWQgaW4gdGhlDQo+IHNhbWUgb3JkZXINCj4gKwkJCWFz
IHRoZSBjbG9jayBiaXQtb2Zmc2V0IGFuZCBody1hdXRvZ2F0ZQ0KPiBwcm9wZXJ0eS4NCj4gKy0g
cG93ZXItZG9tYWluczoJU2hvdWxkIGNvbnRhaW4gdGhlIHBvd2VyIGRvbWFpbiB1c2VkIGJ5IHRo
aXMNCj4gY2xvY2suDQo+ICsNCj4gK0xlZ2FjeSBiaW5kaW5nIChERVBSRUNBVEVEKToNCj4gIC0g
Y29tcGF0aWJsZToJU2hvdWxkIGJlIG9uZSBvZjoNCj4gIAkJICAiZnNsLGlteDhxeHAtbHBjZy1h
ZG1hIiwNCj4gIAkJICAiZnNsLGlteDhxeHAtbHBjZy1jb25uIiwNCj4gQEAgLTMzLDEwICs0OCwx
NyBAQCBFeGFtcGxlczoNCj4gIA0KPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2lteDhx
eHAtY2xvY2suaD4NCj4gIA0KPiAtY29ubl9scGNnOiBjbG9jay1jb250cm9sbGVyQDViMjAwMDAw
IHsNCj4gLQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ctY29ubiI7DQo+IC0JcmVnID0g
PDB4NWIyMDAwMDAgMHhiMDAwMD47DQo+ICtzZGhjMF9scGNnOiBjbG9jay1jb250cm9sbGVyQDVi
MjAwMDAwIHsNCj4gKwljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KPiArCXJlZyA9
IDwweDViMjAwMDAwIDB4MTAwMDA+Ow0KPiAgCSNjbG9jay1jZWxscyA9IDwxPjsNCj4gKwljbG9j
a3MgPSA8JnNkaGMwX2NsayBJTVhfU0NfUE1fQ0xLX1BFUj4sDQo+ICsJCSA8JmNvbm5faXBnX2Ns
az4sIDwmY29ubl9heGlfY2xrPjsNCj4gKwliaXQtb2Zmc2V0ID0gPDAgMTYgMjA+Ow0KPiArCWNs
b2NrLW91dHB1dC1uYW1lcyA9ICJzZGhjMF9scGNnX3Blcl9jbGsiLA0KPiArCQkJICAgICAic2Ro
YzBfbHBjZ19pcGdfY2xrIiwNCj4gKwkJCSAgICAgInNkaGMwX2xwY2dfYWhiX2NsayI7DQo+ICsJ
cG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfU0RIQ18wPjsNCj4gIH07DQo+ICANCj4gIHVz
ZGhjMTogbW1jQDViMDEwMDAwIHsNCj4gQEAgLTQ0LDggKzY2LDggQEAgdXNkaGMxOiBtbWNANWIw
MTAwMDAgew0KPiAgCWludGVycnVwdC1wYXJlbnQgPSA8JmdpYz47DQo+ICAJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDIzMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gIAlyZWcgPSA8MHg1YjAxMDAw
MCAweDEwMDAwPjsNCj4gLQljbG9ja3MgPSA8JmNvbm5fbHBjZyBJTVg4UVhQX0NPTk5fTFBDR19T
REhDMF9JUEdfQ0xLPiwNCj4gLQkJIDwmY29ubl9scGNnIElNWDhRWFBfQ09OTl9MUENHX1NESEMw
X1BFUl9DTEs+LA0KPiAtCQkgPCZjb25uX2xwY2cgSU1YOFFYUF9DT05OX0xQQ0dfU0RIQzBfSENM
Sz47DQo+ICsJY2xvY2tzID0gPCZzZGhjMF9scGNnIDE+LA0KPiArCQkgPCZzZGhjMF9scGNnIDA+
LA0KPiArCQkgPCZzZGhjMF9scGNnIDI+Ow0KDQpJcyBpdCBwb3NzaWJsZSB0byByZXBsYWNlIG1h
Z2ljIGNvbnN0YW50cyAxLCAwLCAyIHdpdGggc29tZSBtZWFuaW5nZnVsDQpjb25zdGFudHM/DQoN
CkFyZSB0aGV5IHRoZSBzYW1lIHdpdGg6IElNWF9TQ19QTV9DTEtfUEVSLCBldGM/DQoNCj4gIAlj
bG9jay1uYW1lcyA9ICJpcGciLCAicGVyIiwgImFoYiI7DQo+ICB9Ow0K
