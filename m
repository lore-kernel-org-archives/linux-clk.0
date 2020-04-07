Return-Path: <SRS0=wIso=5X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87772C2BA1A
	for <linux-clk@archiver.kernel.org>; Tue,  7 Apr 2020 02:25:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 427E82078A
	for <linux-clk@archiver.kernel.org>; Tue,  7 Apr 2020 02:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Clf8XNvY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgDGCZX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Apr 2020 22:25:23 -0400
Received: from mail-vi1eur05on2084.outbound.protection.outlook.com ([40.107.21.84]:34657
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726310AbgDGCZX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 6 Apr 2020 22:25:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJxVq4IeAahj3/x7a8BW5x1G5Gf5klyFcS9R2bWBHD1CEUgO3XIQTx5RQLThpcgxzFy3l11COzCvp4c6axfs/S76Pt3KIPUX/UTvQPMXZyIep+uJ3FOjUctbcodWuBAC7rdEOZBgQfI3jHZ18QWFXJqH+rsgMP/NFVCFTcBa81p/spk3Ui3Agjz0MBoZ0MH/WQTSnx3GPGCFbbUvGb5VX2alcfa6cBoQAhLoldeu7P3WqloHhhS57f+cthxy4u2Jl3aJAJRpxJZOdM4MNRxdpzdJholInsZouHN6QAZFxl0aybGUpqbkPmfwVjphFp7qzOukzrao2jQGxOzygy3odQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScxOowEfTiyiGsFkDrqFYl36+e5ewe0rAGQ+mmc3X+I=;
 b=S9EnTNoZDy9krvaUUmGzp546UFZ+d+dE8yH7dLbCZWOBomMJcdk3uqnZMK34pRmbQq/qCFKwCCu7AmbS1QmLmWWlkPlIpwfNYC8kE6xWqScQLKgQX7Z3euxbkDzkOqXhvvWhQEVDIcIUcG8Bs8n3+c703OGd/igGLZmxPPTurApZpjgcjmJsuyRHERv2uo4DVa/FVynm1KnFevOny+wmJiOqufoP+WefX7IUhr1mTVDULdY9iwovhfUV/HbQWog3SbUafczXfwCcEq+3kKLBZnYyp67mXOCQwgCWCPmh+ELQMA4uYXfkd2HO7AoInlCA1mAAzb3Q0QmUsQMD1D1O+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScxOowEfTiyiGsFkDrqFYl36+e5ewe0rAGQ+mmc3X+I=;
 b=Clf8XNvYfUUnf60aBZAYpbKsOoOTCx3KNConU+hB7Clt7sTWhk1ZlWP+XgoyagRE3++hgJQgSJbeGw6bzak3NxKGJizuDKtC9tqxfUnl65bMfssDlc6kOPTJ18kUbuFnDI8DkpsIk8eDYeAndcdnmT4NOMVjcHdWJE/cPlsqI8M=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB4504.eurprd04.prod.outlook.com (2603:10a6:20b:19::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Tue, 7 Apr
 2020 02:25:17 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::d9f7:5527:e89d:1ae3%7]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 02:25:17 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH RESEND v3 00/15] arm64: dts: imx8: architecture
 improvement and adding imx8qm support
Thread-Topic: [PATCH RESEND v3 00/15] arm64: dts: imx8: architecture
 improvement and adding imx8qm support
Thread-Index: AQHVnUT3q35gy5JegUu6TsJJk6i5iahtzKDA
Date:   Tue, 7 Apr 2020 02:25:17 +0000
Message-ID: <AM6PR04MB4966440BB0F9D56977A9699180C30@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [218.82.155.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98f883c6-2614-4d3f-05eb-08d7da9ae994
x-ms-traffictypediagnostic: AM6PR04MB4504:|AM6PR04MB4504:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4504D78E3E26B5A501C8293480C30@AM6PR04MB4504.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(346002)(136003)(39850400004)(396003)(376002)(64756008)(76116006)(8676002)(7696005)(66476007)(54906003)(6506007)(66946007)(316002)(53546011)(81166006)(52536014)(66446008)(478600001)(81156014)(33656002)(4326008)(44832011)(26005)(186003)(55016002)(110136005)(9686003)(8936002)(66556008)(86362001)(2906002)(71200400001)(5660300002)(32563001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aljGc7kL8LgRcRDn5dbzDnvFRpilRpq2DgxQ3o4MRHfrp37+wUEaZLhSDF+51EZPBKl+SSa/AfMQcRw6WEggt+SzBtx4oOW8M8X3xZ0Ztv4OOgiGDad5dQSNLBTq595r1r7hunKKDYp/eiH70fFOuBbVVW+OjrRf4cOyNYfa3hxwJOVTQO7hgLPzYZyIiJFBWxmOHKQHLpn9KZj2Ib3600PdH6Yi0SXHWBqM0RG0FNG+wW/dOu3Qv1mC5NpVkEpaUot0gnIAiHaNpyTAznVqrM+UB5ETFrYiGrkaHgB3qYgLifTxRmTf2VJcS0c7vUClc+jY1RYG+dVZOtFGIW6vip6d4vOaXB6a4ol8OGwdPwECB98UTiUF6pUYrSHPoWZvNwWpeKq87xSVw2mhahTvGwbe6cFKu16omrqDswv4bs/5+sHlYSPPKmVnfPT4hrh0rkMKPtK2h3aLpGsXHT/OlVRH34t4DD0Dg2jnnXFsB2tnTOZ7yZYew42GAsiJqcqq
x-ms-exchange-antispam-messagedata: wJ0k1P7s5yXTEXVoyj62aT2sHmDpeAxYKQRBWnr5MFUwT10j7u7tXuz288gOE7L1Nk8nCgd6init3miP/ijKiyV8hilQLoa3Z5XFMgLkUgSJ2qGemK32+WKR0KJFx75hjcsvDj4ZZKnaxJhMwDGzdA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f883c6-2614-4d3f-05eb-08d7da9ae994
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:25:17.3646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJmEiGww02HoQTr3pbUhukKB4Knw5ebUJzjPkvpf7DMD03LFb1HVHdf7evCfs/vHaSf23g4KoDn8XAAroR30JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4504
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU2hhd24sDQoNCkRvIHlvdSBoYXZlIGFueSBjb21tZW50cyBhYm91dCB0aGlzIHBhdGNoc2V0
Pw0KQlRXLCBpdCBkZXBlbmRzIG9uIHRoZSBsYXRlc3QgY2xvY2sgcGF0Y2hzZXQgd2hpY2ggaXMg
cGVuZGluZyBmb3IgcXVpdGUgYSBsb25nIHRpbWUuDQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiBG
cm9tOiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiBTZW50OiBTdW5kYXks
IE5vdmVtYmVyIDE3LCAyMDE5IDg6NDQgUE0NCj4gU3ViamVjdDogW1BBVENIIFJFU0VORCB2MyAw
MC8xNV0gYXJtNjQ6IGR0czogaW14ODogYXJjaGl0ZWN0dXJlIGltcHJvdmVtZW50DQo+IGFuZCBh
ZGRpbmcgaW14OHFtIHN1cHBvcnQNCj4gDQo+IElNWCBTQ1UgYmFzZWQgcGxhdGZvcm1zIChlLmcu
IE1YOFFNL01YOFFYUCkgYXJlIGNvbXByaXNlZCBvZiBhIG51bWJlcg0KPiBvZiBTUyAoU3Vic3lz
dGVtcyksIHRob3NlIFNTIG1heSBiZSBzaGFyZWQgYmV0d2VlbiBkaWZmZXJlbnQgU29DcyB3aGls
ZSBtb3N0DQo+IG9mIHRoZW0gY2FuIGJlIHJldXNlZCBsaWtlIERldmljZXMgUmVzb3VyY2VzLCBD
bG9ja3MsIFBvd2VyIGRvbWFpbnMgYW5kIGV0Yy4NCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFp
bXMgdG8gaW1wcm92ZSB0aGUgTVg4IGFyY2hpdGVjdHVyZSB0byBjb21wbHkgd2l0aCB0aGUgSFcN
Cj4gZGVzaWduIHRvIHNhdmUgYSBsb3Qgb2YgZHVwbGljYXRlZCBjb2RlcyBhbmQgYmVuZWZpdHMg
dXMgYSBiZXR0ZXIgbWFpbnRhaW5hYmlsaXR5DQo+IGFuZCBzY2FsYWJpbGl0eSBpbiB0aGUgZnV0
dXJlLg0KPiANCj4gVGhpcyBwYXRjaCBzZXJpZXMgZGVwZW5kcyBvbiBhbm90aGVyIGNsayBuZXcg
YmluZGluZyBzZXJpZXM6DQo+IA0KPiBOT1RFOiBmb3IgdGhlIG1pc3NpbmcgdW5kb2N1bWVudGVk
IGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgdGhlIG5ldyBTb0MNCj4gSU1YOFFNIGluIHRoaXMgcGF0
Y2ggc2VyaWVzLiBJdCB3aWxsIGJlIHNlbnQgaW4gYW5vdGhlciBwYXRjaCBzZXJpZXMgbGF0ZXIu
DQo+IA0KPiBDaGFuZ2VMb2c6DQo+IHYyLT52MzoNCj4gICogdXNlIGNsb2NrLWluZGljZXMgcHJv
cGVydHkgaW5zdGVhZCBvZiBiaXQtb2Zmc2V0IHByb3BlcnR5IHN1Z2dlc3RlZCBieSBTaGF3bg0K
PiBHdW8NCj4gICogcmViYXNlIHRvIGxhdGVzdCBzaGF3bi9mb3ItbmV4dA0KPiB2MS0+djI6DQo+
ICAqIGNoYW5nZSB0byB0aGUgbmV3IHR3byBjZWxscyBzY3UgY2xvY2sgYmluZGluZywgc28gb3Jp
Z2luYWwgYWRkaW5nIHNjdSBjbG9ja3MNCj4gICAgcGF0Y2hlcyB3ZXJlIHJlbW92ZWQuDQo+ICAq
IE1vdmUgc2N1IHBkIG5vZGUgYWJvdmUgY2xrIG5vZGUNCj4gDQo+IERvbmcgQWlzaGVuZyAoMTUp
Og0KPiAgIGFybTY0OiBkdHM6IGlteDhxeHA6IGFkZCBmYWxsYmFjayBjb21wYXRpYmxlIHN0cmlu
ZyBmb3Igc2N1IHBkDQo+ICAgYXJtNjQ6IGR0czogaW14OHF4cDogbW92ZSBzY3UgcGQgbm9kZSBi
ZWZvcmUgc2N1IGNsb2NrIG5vZGUNCj4gICBhcm02NDogZHRzOiBpbXg4cXhwOiBvcmdpbml6ZSBk
dHMgaW4gc3Vic3lzdGVtcw0KPiAgIGFybTY0OiBkdHM6IGlteDg6IGFkZCBsc2lvIGxwY2cgY2xv
Y2tzDQo+ICAgYXJtNjQ6IGR0czogaW14ODogYWRkIGNvbm4gbHBjZyBjbG9ja3MNCj4gICBhcm02
NDogZHRzOiBpbXg4OiBhZGQgYWRtYSBscGNnIGNsb2Nrcw0KPiAgIGFybTY0OiBkdHM6IGlteDg6
IHN3aXRjaCB0byB0d28gY2VsbCBzY3UgY2xvY2sgYmluZGluZw0KPiAgIGFybTY0OiBkdHM6IGlt
eDg6IHN3aXRjaCB0byBuZXcgbHBjZyBjbG9jayBiaW5kaW5nDQo+ICAgYXJtNjQ6IGR0czogaW14
OHFtOiBhZGQgbHNpbyBzcyBzdXBwb3J0DQo+ICAgYXJtNjQ6IGR0czogaW14OHFtOiBhZGQgY29u
biBzcyBzdXBwb3J0DQo+ICAgYXJtNjQ6IGR0czogaW14ODogc3BsaXQgYWRtYSBzcyBpbnRvIGRt
YSBhbmQgYXVkaW8gc3MNCj4gICBhcm02NDogZHRzOiBpbXg4cW06IGFkZCBkbWEgc3Mgc3VwcG9y
dA0KPiAgIGFybTY0OiBkdHM6IGlteDogYWRkIGlteDhxbSBjb21tb24gZHRzIGZpbGUNCj4gICBh
cm02NDogZHRzOiBpbXg6IGFkZCBpbXg4cW0gbWVrIHN1cHBvcnQNCj4gICBhcm02NDogZGVmY29u
ZmlnOiBhZGQgaW14OHFtIG1layBzdXBwb3J0DQo+IA0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvTWFrZWZpbGUgICAgICAgIHwgICAxICsNCj4gIC4uLi9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OC1zcy1hZG1hLmR0c2kgICAgICB8ICAgOCArDQo+ICAuLi4vYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDgtc3MtYXVkaW8uZHRzaSAgICAgfCAgNjggKysrDQo+ICAuLi4vYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDgtc3MtY29ubi5kdHNpICAgICAgfCAxODcgKysrKysrKysNCj4gIC4uLi9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1kZHIuZHRzaSB8ICAxOQ0KPiArICAuLi4vYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtZG1hLmR0c2kgfCAyMTAgKysrKysrKysrDQo+
ICAuLi4vYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtbHNpby5kdHNpICAgICAgfCAzMTEgKysr
KysrKysrKysrKw0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLW1lay5k
dHMgIHwgMTQ0ICsrKysrKw0KPiAgLi4uL2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0tc3MtY29u
bi5kdHNpICAgIHwgIDIxICsNCj4gIC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWRt
YS5kdHNpICAgICB8ICA1MSArKysNCj4gIC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNz
LWxzaW8uZHRzaSAgICB8ICA2MSArKysNCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDhxbS5kdHNpICAgICB8IDE4MCArKysrKysrKw0KPiAgLi4uL2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4cXhwLWFpX21sLmR0cyAgICAgIHwgIDIwICstDQo+ICAuLi4vZnJlZXNjYWxlL2lteDhx
eHAtY29saWJyaS1ldmFsLXYzLmR0c2kgICAgfCAgIDggKy0NCj4gIC4uLi9ib290L2R0cy9mcmVl
c2NhbGUvaW14OHF4cC1jb2xpYnJpLmR0c2kgICB8ICAxMiArLQ0KPiAgYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1tZWsuZHRzIHwgIDEyICstDQo+ICAuLi4vYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhxeHAtc3MtYWRtYS5kdHNpICAgfCAgMzcgKysNCj4gIC4uLi9ib290L2R0
cy9mcmVlc2NhbGUvaW14OHF4cC1zcy1jb25uLmR0c2kgICB8ICAyMSArDQo+ICAuLi4vYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhxeHAtc3MtbHNpby5kdHNpICAgfCAgNjEgKysrDQo+ICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgICAgfCA0MjUgKystLS0tLS0tLS0t
LS0tLS0tDQo+ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAgICAgICAgICAgICAg
fCAgIDEgKw0KPiAgMjEgZmlsZXMgY2hhbmdlZCwgMTQzMiBpbnNlcnRpb25zKCspLCA0MjYgZGVs
ZXRpb25zKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OC1zcy1hZG1hLmR0c2kNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWF1ZGlvLmR0c2kNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWNvbm4uZHRzaQ0KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3Mt
ZGRyLmR0c2kNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVz
Y2FsZS9pbXg4LXNzLWRtYS5kdHNpDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1sc2lvLmR0c2kNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0tbWVrLmR0cw0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS1zcy1jb25u
LmR0c2kNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4cW0tc3MtZG1hLmR0c2kNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0tc3MtbHNpby5kdHNpDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLXNzLWFkbWEu
ZHRzaQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDhxeHAtc3MtY29ubi5kdHNpDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1zcy1sc2lvLmR0c2kNCj4gDQo+IC0tDQo+IDIuMjMu
MA0KDQo=
