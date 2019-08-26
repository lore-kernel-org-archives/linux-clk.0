Return-Path: <SRS0=daJW=WW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE934C3A5A1
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 03:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8601620815
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 03:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ARZ+J8cm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbfHZDYy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Aug 2019 23:24:54 -0400
Received: from mail-eopbgr20061.outbound.protection.outlook.com ([40.107.2.61]:5637
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729290AbfHZDYy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 25 Aug 2019 23:24:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkiKPttgbyjsH0OMrbZGeZRmjwmnbTt2qVaY3QwMgkHf3UsLLt+YK+mI8sZEV32QG1QgtTpTZQ+gpl+RZanxJeElrWxGfSdolax+f445bot5+TFo8czLrnytueMyzr38qvbKOUeJAK+h9r3kKmxaUr/Xsn2uFigS6EHrBmHTfKbbAjbpNMjoy6gXSWvW4rDe3vqZONHdf0HuzUyxKyKPPIgqKoZ+kYwugduXZd7SY7MEsDH/ECZ7Pv7iYnepOaPVUjp2wlpf8a1ZrrJrtpzZ4Q9ulBMQNaKAlsi4BFBd4cPycXGoWsgGnm2wu8HUq4/MSs3S804vF5YyD8rbrTS2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7H08g3LYldEgslkDwY9ERc9nL/RQgUu4EY7Cbs4ZIM=;
 b=Ay5RUhhQD+cRw74ofVBbcKvqTJf6opOEFJVw3aDvpc5BfLRcB5xd+dZJfoVBW3KwEa1Ea2Fk1U0m6fhk/O+sH9WOFzKQAWkeJDjxuoyHqSnAI/MWjXZOFD1HmQC+XM4ubFYd27VruR44InK6EzH6MxV3yMEN2LG5m+sHwo6TyBnad7zBHecntVOH038BAmHPbla72wCfCg0eK2JcCVKbXnX6axN4eZQ0LjwsIJKaSn7tnfl1KRfBJ+h3T14XlL1VgKAWcs5KmdGfZKcaHdPpwKJHT3aLrlMAbVHfMx5H6819tsSEDBBbBmjRDZzzp4HZcyUGw28BUqJAreNta/X8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7H08g3LYldEgslkDwY9ERc9nL/RQgUu4EY7Cbs4ZIM=;
 b=ARZ+J8cmjmWyRoI27vHbn+PIvvSZ+eyMIlGFlBIwzR6+KxtNvgOHYegg0dTWEE1Eb47bi13m2TJR3zuGFyvokmThbLej3pIRxFbLpH7+HfSa4U8vTBQ4am6LocB/zgtC4+GIXdFiI6zt5eS16oSxIv/5zHbUR++F5sfaDNA7Ml8=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4962.eurprd04.prod.outlook.com (20.177.41.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 03:24:45 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::44b4:2932:8e73:d707]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::44b4:2932:8e73:d707%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 03:24:45 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Rob Herring <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: RE: [PATCH V4 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Thread-Topic: [PATCH V4 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Thread-Index: AQHVV0rkvU9QEOBnMEyGPLioXcHHlqcKs0GAgAIY3cA=
Date:   Mon, 26 Aug 2019 03:24:45 +0000
Message-ID: <AM0PR04MB42117031C494202F24A7439980A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
 <20190824191957.GF16308@X250.getinternet.no>
In-Reply-To: <20190824191957.GF16308@X250.getinternet.no>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0632995-9ca6-4264-7aab-08d729d4f17e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4962;
x-ms-traffictypediagnostic: AM0PR04MB4962:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB496242314E79E98C9102950A80A10@AM0PR04MB4962.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(54534003)(186003)(71190400001)(6436002)(71200400001)(55016002)(66066001)(86362001)(81156014)(81166006)(9686003)(8676002)(5660300002)(76116006)(33656002)(8936002)(3846002)(6116002)(66946007)(66556008)(64756008)(66446008)(7696005)(2501003)(2906002)(76176011)(66476007)(486006)(6246003)(476003)(26005)(25786009)(110136005)(446003)(102836004)(4326008)(99286004)(54906003)(74316002)(305945005)(14444005)(14454004)(52536014)(11346002)(229853002)(256004)(7736002)(316002)(53936002)(478600001)(44832011)(53546011)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4962;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xOzdqcCu3/PLxUUrbC0/uCbB77VGL2+41/7lcHCUQgLgv5NC1H3hg66v0iuK3zODPDpQ5pKny6Iz1eyBTO8ZcSUD1WRx78DCTf5AOsNaRurzb6uVY7lZyrNL+JVx4x2tN8QidwQs1zGwK+GcZZqmZJuV5Kk1xbFfhSou/4bq0zsfvK/hCH09HJDKLU6zPrRl+FgIJNgjPQjEkyCUEtRR9EtxeBBQ6vmq3w7pjjQKwPe+CyF7zcO96y0Apnx6qL8CDi8dT5ITxLKrksxEA7TIVMmbzsqtNW24DOl2LFA5UxVqvZ9No37lyOAH71QDlYjkEfeAtScS9oAR5kUsOQY79XDCFhVz1wVmDNm5STigxiusFepXINk1DN8Ghw3Iy3NMvHoM3XQmg3TXvqzgTANUpQ17nv2ybBfFQRiSHkNu5Kc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0632995-9ca6-4264-7aab-08d729d4f17e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 03:24:45.6928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgMtr4lJwIMDJREYfB5KxDDUXYKUCtdzF87JrqLcMKTDprp2kVtgSx36nv3IZlFIQ8n668lgKCsR4iCI/0ELCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4962
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFN1bmRheSwg
QXVndXN0IDI1LCAyMDE5IDM6MjAgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNCAwMS8xMV0g
ZHQtYmluZGluZ3M6IGZpcm13YXJlOiBpbXgtc2N1OiBuZXcgYmluZGluZyB0bw0KPiBwYXJzZSBj
bG9ja3MgZnJvbSBkZXZpY2UgdHJlZQ0KPiANCj4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDc6
MTM6MTVBTSAtMDQwMCwgRG9uZyBBaXNoZW5nIHdyb3RlOg0KPiA+IFRoZXJlJ3MgYSBmZXcgbGlt
aXRhdGlvbnMgb24gdGhlIG9yaWdpbmFsIG9uZSBjZWxsIGNsb2NrIGJpbmRpbmcNCj4gPiAoI2Ns
b2NrLWNlbGxzID0gPDE+KSB0aGF0IHdlIGhhdmUgdG8gZGVmaW5lIHNvbWUgU1cgY2xvY2sgSURz
IGZvcg0KPiA+IGRldmljZSB0cmVlIHRvIHJlZmVyZW5jZS4gVGhpcyBtYXkgY2F1c2UgdHJvdWJs
ZXMgaWYgd2Ugd2FudCB0byB1c2UNCj4gPiBjb21tb24gY2xvY2sgSURzIGZvciBtdWx0aSBwbGF0
Zm9ybXMgc3VwcG9ydCB3aGVuIHRoZSBjbG9jayBvZiB0aG9zZQ0KPiA+IHBsYXRmb3JtcyBhcmUg
bW9zdGx5IHRoZSBzYW1lLg0KPiA+IGUuZy4gQ3VycmVudCBjbG9jayBJRHMgbmFtZSBhcmUgZGVm
aW5lZCB3aXRoIFNTIHByZWZpeC4NCj4gPg0KPiA+IEhvd2V2ZXIgdGhlIGRldmljZSBtYXkgcmVz
aWRlIGluIGRpZmZlcmVudCBTUyBhY3Jvc3MgQ1BVcywgdGhhdCBtZWFucw0KPiA+IHRoZSBTUyBw
cmVmaXggbWF5IG5vdCB2YWxpZCBhbnltb3JlIGZvciBhIG5ldyBTb0MuIEZ1cnRoZXJtb3JlLCB0
aGUNCj4gPiBkZXZpY2UgYXZhaWxhYmlsaXR5IG9mIHRob3NlIGNsb2NrcyBtYXkgYWxzbyB2YXJ5
IGEgYml0Lg0KPiA+DQo+ID4gRm9yIHN1Y2ggc2l0dWF0aW9uLCB3ZSB3YW50IHRvIGVsaW1pbmF0
ZSB0aGUgdXNpbmcgb2YgU1cgQ2xvY2sgSURzIGFuZA0KPiA+IGNoYW5nZSB0byB1c2UgYSBtb3Jl
IGNsb3NlIHRvIEhXIG9uZSBpbnN0ZWFkLg0KPiA+IEZvciBTQ1UgY2xvY2tzIHVzYWdlLCBvbmx5
IHR3byBwYXJhbXMgcmVxdWlyZWQ6IFJlc291cmNlIGlkICsgQ2xvY2sgVHlwZS4NCj4gPiBCb3Ro
IHBhcmFtZXRlcnMgYXJlIHBsYXRmb3JtIGluZGVwZW5kZW50LiBTbyB3ZSBjb3VsZCB1c2UgdHdv
IGNlbGxzDQo+ID4gYmluZGluZyB0byBwYXNzIHRob3NlIHBhcmFtZXRlcnMsDQo+ID4NCj4gPiBD
YzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gPiBDYzogU3RlcGhlbiBCb3lk
IDxzYm95ZEBrZXJuZWwub3JnPg0KPiA+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5v
cmc+DQo+ID4gQ2M6IFNhc2NoYSBIYXVlciA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+IENj
OiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+DQo+ID4gQ2M6IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9mZi1ieTogRG9uZyBBaXNoZW5n
IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCj4gDQo+IEknbSBmaW5lIHdpdGggaXQuDQo+IA0KPiBB
Y2tlZC1ieTogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiANCg0KQW5kIHRoaXMg
b25lLg0KDQpTdGVwaGVuICYgUm9iLA0KRG8geW91IGhhdmUgY2hhbmdlIHRvIGxvb2sgYXQgaXQ/
DQoNCldlIG5lZWQgdGhpcyB0byBiZSBmaW5hbGl6ZWQgZWFybHkgZm9yIHRoZSBmb2xsb3dpbmcg
d29yay4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQoNCj4gU2hhd24NCj4gDQo+ID4gLS0tDQo+ID4g
Q2hhbmdlTG9nOg0KPiA+IHYzLT52NDoNCj4gPiAgKiBhZGQgc29tZSBjb21tZW50cyBmb3IgdmFy
aW91cyBjbG9jayB0eXBlcw0KPiA+IHYyLT52MzoNCj4gPiAgKiBDaGFuZ2VkIHRvIHR3byBjZWxs
cyBiaW5kaW5nIGFuZCByZWdpc3RlciBhbGwgY2xvY2tzIGluIGRyaXZlcg0KPiA+ICAgIGluc3Rl
YWQgb2YgcGFyc2UgZnJvbSBkZXZpY2UgdHJlZS4NCj4gPiB2MS0+djI6DQo+ID4gICogY2hhbmdl
ZCB0byBvbmUgY2VsbCBiaW5kaW5nIGluc3BpcmVkIGJ5IGFybSxzY3BpLnR4dA0KPiA+ICAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLHNjcGkudHh0DQo+ID4gICAg
UmVzb3VyY2UgSUQgaXMgZW5jb2RlZCBpbiAncmVnJyBwcm9wZXJ0eS4NCj4gPiAgICBDbG9jayB0
eXBlIGlzIGVuY29kZWQgaW4gZ2VuZXJpYyBjbG9jay1pbmRpY2VzIHByb3BlcnR5Lg0KPiA+ICAg
IFRoZW4gd2UgZG9uJ3QgaGF2ZSB0byBzZWFyY2ggYWxsIHRoZSBEVCBub2RlcyB0byBmZXRjaA0K
PiA+ICAgIHRob3NlIHR3byB2YWx1ZSB0byBjb25zdHJ1Y3QgY2xvY2tzIHdoaWNoIGlzIHJlbGF0
aXZlbHkNCj4gPiAgICBsb3cgZWZmaWNpZW5jeS4NCj4gPiAgKiBBZGQgcmVxdWlyZWQgcG93ZXIt
ZG9tYWluIHByb3BlcnR5IGFzIHdlbGwuDQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQgIHwgMTIgKysrKysrLS0tLS0NCj4gPiAg
aW5jbHVkZS9kdC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oICAgICAgICAgICAgfCAyMw0K
PiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQo+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2ws
c2N1LnR4dA0KPiA+IGluZGV4IGE1NzVlNDIuLjhjZWU1YmYgMTAwNjQ0DQo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQN
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2Fs
ZS9mc2wsc2N1LnR4dA0KPiA+IEBAIC04OSw3ICs4OSwxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
Og0KPiA+ICAJCQkgICJmc2wsaW14OHFtLWNsb2NrIg0KPiA+ICAJCQkgICJmc2wsaW14OHF4cC1j
bG9jayINCj4gPiAgCQkJZm9sbG93ZWQgYnkgImZzbCxzY3UtY2xrIg0KPiA+IC0tICNjbG9jay1j
ZWxsczoJCVNob3VsZCBiZSAxLiBDb250YWlucyB0aGUgQ2xvY2sgSUQgdmFsdWUuDQo+ID4gKy0g
I2Nsb2NrLWNlbGxzOgkJU2hvdWxkIGJlIGVpdGhlcg0KPiA+ICsJCQkyOiBDb250YWlucyB0aGUg
UmVzb3VyY2UgYW5kIENsb2NrIElEIHZhbHVlLg0KPiA+ICsJCQlvcg0KPiA+ICsJCQkxOiBDb250
YWlucyB0aGUgQ2xvY2sgSUQgdmFsdWUuIChERVBSRUNBVEVEKQ0KPiA+ICAtIGNsb2NrczoJCUxp
c3Qgb2YgY2xvY2sgc3BlY2lmaWVycywgbXVzdCBjb250YWluIGFuIGVudHJ5IGZvcg0KPiA+ICAJ
CQllYWNoIHJlcXVpcmVkIGVudHJ5IGluIGNsb2NrLW5hbWVzDQo+ID4gIC0gY2xvY2stbmFtZXM6
CQlTaG91bGQgaW5jbHVkZSBlbnRyaWVzICJ4dGFsXzMyS0h6IiwgInh0YWxfMjRNSHoiDQo+ID4g
QEAgLTE4NCw3ICsxODcsNyBAQCBmaXJtd2FyZSB7DQo+ID4NCj4gPiAgCQljbGs6IGNsayB7DQo+
ID4gIAkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtY2xrIiwgImZzbCxzY3UtY2xrIjsNCj4g
PiAtCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiA+ICsJCQkjY2xvY2stY2VsbHMgPSA8Mj47DQo+
ID4gIAkJfTsNCj4gPg0KPiA+ICAJCWlvbXV4YyB7DQo+ID4gQEAgLTIyOSw4ICsyMzIsNyBAQCBz
ZXJpYWxANWEwNjAwMDAgew0KPiA+ICAJLi4uDQo+ID4gIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOw0KPiA+ICAJcGluY3RybC0wID0gPCZwaW5jdHJsX2xwdWFydDA+Ow0KPiA+IC0JY2xvY2tz
ID0gPCZjbGsgSU1YOFFYUF9VQVJUMF9DTEs+LA0KPiA+IC0JCSA8JmNsayBJTVg4UVhQX1VBUlQw
X0lQR19DTEs+Ow0KPiA+IC0JY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ID4gKwljbG9j
a3MgPSA8JnVhcnQwX2NsayBJTVhfU0NfUl9VQVJUXzAgSU1YX1NDX1BNX0NMS19QRVI+Ow0KPiA+
ICsJY2xvY2stbmFtZXMgPSAiaXBnIjsNCj4gPiAgCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9T
Q19SX1VBUlRfMD47ICB9OyBkaWZmIC0tZ2l0DQo+ID4gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Zp
cm13YXJlL2lteC9yc3JjLmgNCj4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvZmlybXdhcmUvaW14
L3JzcmMuaA0KPiA+IGluZGV4IDRlNjFmNjQuLjI0YzE1M2QgMTAwNjQ0DQo+ID4gLS0tIGEvaW5j
bHVkZS9kdC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oDQo+ID4gKysrIGIvaW5jbHVkZS9k
dC1iaW5kaW5ncy9maXJtd2FyZS9pbXgvcnNyYy5oDQo+ID4gQEAgLTU0Nyw0ICs1NDcsMjcgQEAN
Cj4gPiAgI2RlZmluZSBJTVhfU0NfUl9BVFRFU1RBVElPTgkJNTQ1DQo+ID4gICNkZWZpbmUgSU1Y
X1NDX1JfTEFTVAkJCTU0Ng0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIERlZmluZXMgZm9yIFNDIFBN
IENMSw0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKy8qIE5vcm1hbCBkZXZpY2UgcmVzb3VyY2UgY2xv
Y2sgKi8NCj4gPiArI2RlZmluZSBJTVhfU0NfUE1fQ0xLX1NMVl9CVVMJCTAJLyogU2xhdmUgYnVz
IGNsb2NrICovDQo+ID4gKyNkZWZpbmUgSU1YX1NDX1BNX0NMS19NU1RfQlVTCQkxCS8qIE1hc3Rl
ciBidXMgY2xvY2sgKi8NCj4gPiArI2RlZmluZSBJTVhfU0NfUE1fQ0xLX1BFUgkJMgkvKiBQZXJp
cGhlcmFsIGNsb2NrICovDQo+ID4gKyNkZWZpbmUgSU1YX1NDX1BNX0NMS19QSFkJCTMJLyogUGh5
IGNsb2NrICovDQo+ID4gKyNkZWZpbmUgSU1YX1NDX1BNX0NMS19NSVNDCQk0CS8qIE1pc2MgY2xv
Y2sgKi8NCj4gPiArDQo+ID4gKy8qIFNwZWNpYWwgY2xvY2sgdHlwZXMgd2hpY2ggZG8gbm90IGJl
bG9uZyB0byBhYm92ZSBub3JtYWwgY2xvY2sgdHlwZXMgKi8NCj4gPiArI2RlZmluZSBJTVhfU0Nf
UE1fQ0xLX01JU0MwCQkwCS8qIE1pc2MgMCBjbG9jayAqLw0KPiA+ICsjZGVmaW5lIElNWF9TQ19Q
TV9DTEtfTUlTQzEJCTEJLyogTWlzYyAxIGNsb2NrICovDQo+ID4gKyNkZWZpbmUgSU1YX1NDX1BN
X0NMS19NSVNDMgkJMgkvKiBNaXNjIDIgY2xvY2sgKi8NCj4gPiArI2RlZmluZSBJTVhfU0NfUE1f
Q0xLX01JU0MzCQkzCS8qIE1pc2MgMyBjbG9jayAqLw0KPiA+ICsjZGVmaW5lIElNWF9TQ19QTV9D
TEtfTUlTQzQJCTQJLyogTWlzYyA0IGNsb2NrICovDQo+ID4gKw0KPiA+ICsvKiBTcGVjaWFsIGNs
b2NrIHR5cGVzIGZvciBDUFUvUExML0JZUEFTUyBvbmx5ICovDQo+ID4gKyNkZWZpbmUgSU1YX1ND
X1BNX0NMS19DUFUJCTIJLyogQ1BVIGNsb2NrICovDQo+ID4gKyNkZWZpbmUgSU1YX1NDX1BNX0NM
S19QTEwJCTQJLyogUExMICovDQo+ID4gKyNkZWZpbmUgSU1YX1NDX1BNX0NMS19CWVBBU1MJCTQJ
LyogQnlwYXNzIGNsb2NrICovDQo+ID4gKw0KPiA+ICAjZW5kaWYgLyogX19EVF9CSU5ESU5HU19S
U0NSQ19JTVhfSCAqLw0KPiA+IC0tDQo+ID4gMi43LjQNCj4gPg0K
