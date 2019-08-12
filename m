Return-Path: <SRS0=0MvX=WI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD595C31E40
	for <linux-clk@archiver.kernel.org>; Mon, 12 Aug 2019 14:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6724D206DF
	for <linux-clk@archiver.kernel.org>; Mon, 12 Aug 2019 14:42:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RrrcPQ7r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfHLOmB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Aug 2019 10:42:01 -0400
Received: from mail-eopbgr30084.outbound.protection.outlook.com ([40.107.3.84]:41966
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726585AbfHLOmB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Aug 2019 10:42:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGNoF37X2NXQZPCCcvVxyka+tS1272v1veQgNrQ0sNEqqATiYWgGtZQhdJXpRMNAETq87LqqHBZTtUSPJfArgcS5SQTlmj+FzXREKAQOEAQFf9bJ3rU75MNhz5W/kqaE5jsP6wQq82gzFQCXPT1ioBVKdm2nfbAQvUfEx+rBTeKd5G3b2XrLPeXC5+bGXufzDF0H6YVegcgM5Oa1oRUk9n1hSuynKmxk1PcPe4Tq9ilx+1dvISn58TWkg5VfwkBqyJvwqltyovZqcgrwdh95hVBJ9JNpQR8f+Xp4xsXd8ijoJ17IZApQqM/Cd9rx1o5HHzW5AnmYvTd+LujWTUtiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZP2kPCD1+SM0GHLseZPDw8qEkLIyLc/G/bwpaKURuA=;
 b=lT+SMk/He8gwpFVlAUJ+xlV/bT3wQvVo0QHZIC/lUvFyuDPIbF/S+n68nk0b+iMNCSvwsfkqSVNG/gLwDNijH885zHyKhHDcFT/DCZNxi/eYUtkjgfh1O3R7cmRBMdJpcxm3poUYoXwFgxApDmItuPxFyXPwEwfDo0XEZywuv8CdPhjsL8HOUh1KEluxNDbIQ7P5iThR3E4PdV1nbC5SUEEeS4BJZdQSzW3AKKSylf2w1yMbC27j1+yDVWwvBb5w0T1f+BH+IDqcBLiAjjx03NIQKK6jSK+puiNFatcnZu7kT29hHZ2bPG31js7N+sYcqh06/3lBMFnNFQgMOAjogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZP2kPCD1+SM0GHLseZPDw8qEkLIyLc/G/bwpaKURuA=;
 b=RrrcPQ7riNlCQYZBtrKEXDIHq8JYPPzRChvWeG6TtyTH2EoPYLw3NkZzEm4gxHzY/Ldgz4kK6RJm1/IWMl7prD8djwlNH7YyrYaux+aV9/VEwiqfbuxserR71/MlIF6YY/lasVhlONm9Xoj6ome+YjggF5fVXdJAf1fBkzKNXoQ=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB4388.eurprd04.prod.outlook.com (52.135.148.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Mon, 12 Aug 2019 14:41:55 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::5553:29b6:d66c:6afe]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::5553:29b6:d66c:6afe%5]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 14:41:55 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <dongas86@gmail.com>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Topic: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Index: AQHVO+pjXb1rvBqoLkqQaLlgvuAacqbpjRgAgAJ2cwCAC6CGgIAAFqig
Date:   Mon, 12 Aug 2019 14:41:55 +0000
Message-ID: <AM0PR04MB42117575E82B4B762FE2143880D30@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
 <20190803135048.GL8870@X250.getinternet.no>
 <CAA+hA=TVv8m2GZr0W-u+S6XzJUCYrFDF95iyUGyAsbYMwatyZg@mail.gmail.com>
 <20190812130041.GD27041@X250>
In-Reply-To: <20190812130041.GD27041@X250>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [180.172.160.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3894a9d8-8d7c-431f-19c0-08d71f333916
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4388;
x-ms-traffictypediagnostic: AM0PR04MB4388:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4388146A6F9E88439FACC8D280D30@AM0PR04MB4388.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(189003)(199004)(7696005)(4326008)(14454004)(6506007)(44832011)(6246003)(81156014)(66946007)(478600001)(102836004)(9686003)(66446008)(99286004)(86362001)(76116006)(55016002)(229853002)(476003)(53936002)(486006)(6436002)(256004)(11346002)(81166006)(446003)(25786009)(14444005)(8936002)(66476007)(66556008)(64756008)(76176011)(110136005)(26005)(5660300002)(6116002)(3846002)(66066001)(316002)(52536014)(8676002)(54906003)(186003)(2906002)(74316002)(305945005)(71200400001)(71190400001)(33656002)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4388;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qi43ADw/k8HLsr6Rz9yBgBLMgJigIDMy4y0/oPFijgRgH5DZEsAvL6j0az9TNMf1u9DrcuEUeFeqx/sH7VoNnx9J8j/nrxLtqXC5uxjO7wsXeGS7MY/0KGLJt0XW60xQFftksajIqw/qIybYvAlxS+VI+V7ApmmrhlHkKmuY6L3vJOOnJ7+znCFwAiipcEt+Fm+HywB1KUYXNi/GAaABlgt7dAno17r+PISCsdo9MDNUQYv73u7U6Z3ZSFZO8aJSYAd/0msFi/d0ne/ImzM+hlZVUhzch0+qSTnpfaq/Afe4mYUg2WPPkIhtwW8nO/aLEVyirBzypgUrTvhYl6sKDtCWLevwSNBnEnGQ/0646sBlBEWkv+2lfN6gRr38TrKmNqt1CzrMdCpME4JJe1wELeOQwA9yiTo2Civci0JOSg0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3894a9d8-8d7c-431f-19c0-08d71f333916
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 14:41:55.6907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7u6NudIpcx7axDzbL0LHYF+C/tFwZWuLkyPOVmF8FQyIQpXUnptj8lTUCrxDmqkZLS9GqnhRWgLtr8lzjD1J7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4388
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwg
QXVndXN0IDEyLCAyMDE5IDk6MDEgUE0gDQo+IE9uIE1vbiwgQXVnIDA1LCAyMDE5IGF0IDExOjI3
OjIwQU0gKzA4MDAsIERvbmcgQWlzaGVuZyB3cm90ZToNCj4gPiA+ID4gKy0gY29tcGF0aWJsZTog
ICAgICAgICAgICAgICAgU2hvdWxkIGJlIG9uZSBvZjoNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgImZzbCxpbXg4cXhwLWxwY2ciDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICJmc2wsaW14OHFtLWxwY2ciIGZvbGxvd2VkIGJ5DQo+ICJmc2wsaW14OHF4cC1scGNnIi4N
Cj4gPiA+ID4gKy0gcmVnOiAgICAgICAgICAgICAgICAgICAgICAgQWRkcmVzcyBhbmQgbGVuZ3Ro
IG9mIHRoZSByZWdpc3RlciBzZXQuDQo+ID4gPiA+ICstICNjbG9jay1jZWxsczogICAgICAgICAg
ICAgIFNob3VsZCBiZSAxLiBPbmUgTFBDRyBzdXBwb3J0cyBtdWx0aXBsZQ0KPiBjbG9ja3MuDQo+
ID4gPiA+ICstIGNsb2NrczogICAgICAgICAgICBJbnB1dCBwYXJlbnQgY2xvY2tzIHBoYW5kbGUg
YXJyYXkgZm9yIGVhY2ggY2xvY2suDQo+ID4gPiA+ICstIGJpdC1vZmZzZXQ6ICAgICAgICAgICAg
ICAgIEFuIGludGVnZXIgYXJyYXkgaW5kaWNhdGluZyB0aGUgYml0IG9mZnNldA0KPiBmb3IgZWFj
aCBjbG9jay4NCj4gPiA+DQo+ID4gPiBJIGd1ZXNzIHRoYXQgdGhlIGRyaXZlciBzaG91bGQgYmUg
YWJsZSB0byBmaWd1cmUgYml0IG9mZnNldCBmcm9tDQo+ID4gPiAnY2xvY2staW5kaWNlcycgcHJv
cGVydHkuDQo+ID4gPg0KPiA+DQo+ID4gWWVzLCBpdCBjYW4gYmUgZG9uZSBpbiB0aGVvcnkuDQo+
ID4gVGhlbiB0aGUgYmluZGluZyBtYXkgbG9vayBsaWtlOg0KPiA+IHNkaGMwX2xwY2c6IGNsb2Nr
LWNvbnRyb2xsZXJANWIyMDAwMDAgew0KPiA+ICAgICAgICAgLi4uDQo+ID4gICAgICAgICAjY2xv
Y2stY2VsbHMgPSA8MT47DQo+ID4gICAgICAgICBjbG9ja3MgPSA8JnNkaGMwX2NsayBJTVhfU0Nf
UE1fQ0xLX1BFUj4sDQo+ID4gICAgICAgICAgICAgICAgICA8JmNvbm5faXBnX2Nsaz4sIDwmY29u
bl9heGlfY2xrPjsNCj4gPiAgICAgICAgIGNsb2NrLWluZGljZXMgPSA8MD4sIDwxNj4sIDwyMD47
DQo+ID4gICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAic2RoYzBfbHBjZ19wZXJfY2xrIiwN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzZGhjMF9scGNnX2lwZ19jbGsiLA0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNkaGMwX2xwY2dfYWhiX2NsayI7DQo+
ID4gICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9TREhDXzA+OyB9Ow0KPiA+
DQo+ID4gdXNkaGMxOiBtbWNANWIwMTAwMDAgew0KPiA+ICAgICAgICAgLi4uDQo+ID4gICAgICAg
ICBjbG9ja3MgPSA8JnNkaGMwX2xwY2cgMTY+LA0KPiA+ICAgICAgICAgICAgICAgICAgPCZzZGhj
MF9scGNnIDA+LA0KPiA+ICAgICAgICAgICAgICAgICAgPCZzZGhjMF9scGNnIDIwPjsNCj4gPiAg
ICAgICAgIGNsb2NrLW5hbWVzID0gImlwZyIsICJwZXIiLCAiYWhiIjsgfTsNCj4gPg0KPiA+IEhv
d2V2ZXIsIGFmdGVyIHRyeWluZywgaSBmb3VuZCAgb25lIGxpbWl0YXRpb24gaWYgdXNpbmcgY2xv
Y2staW5kaWNlcw0KPiA+IHRoYXQgdXNlcnMgaGF2ZSB0byBkbyBhIHNlY29uZGFyeSBzZWFyY2gg
Zm9yIHRoZSBpbmRpY2VzIHZhbHVlIGZyb20NCj4gPiBjbG9jayBuYW1lcyB3aGljaCBpcyBub3Qg
dmVyeSBmcmllbmRseS4NCj4gPg0KPiA+IEZvcm1lcmx5IGZyb20gdGhlIGNsb2NrIG91dHB1dCBu
YW1lcywgdXNlciBjYW4gZWFzaWx5IGdldCB0aGUgY2xvY2sNCj4gPiBpbmRleCBhcyB0aGV5J3Jl
IGluIGZpeGVkIG9yZGVycyBhcyBvdXRwdXQgbmFtZXMsIHNvIHZlcnkgZWFzaWx5IHRvDQo+ID4g
dXNlLg0KPiA+IGUuZy4NCj4gPiBjbG9ja3MgPSA8JnNkaGMwX2xwY2cgMT4sDQo+ID4gICAgICAg
ICAgPCZzZGhjMF9scGNnIDA+LA0KPiA+ICAgICAgICAgIDwmc2RoYzBfbHBjZyAyPjsNCj4gPg0K
PiA+IElmIHVzaW5nIGNsb2NrLWluZGljZXMsIHVzZXJzIGhhdmUgbm8gd2F5IHRvIGtub3cgaXQn
cyBjbG9jayBpbmRleA0KPiA+IGZyb20gY2xvY2sgb3V0cHV0IG5hbWVzIG9yZGVyIHVubGVzcyB0
aGV5IGRvIGEgc2Vjb25kYXJ5IHNlYXJjaCBmcm9tDQo+ID4gdGhlIGNsb2NrLWluZGljZSBhcnJh
eSBhY2NvcmRpbmdseS4NCj4gPiBGb3IgZXhhbXBsZSwgZm9yICJzZGhjMF9scGNnX2FoYl9jbGsi
LCB1c2VyIGNhbiBlYXNpbHkga25vdyBpdHMNCj4gPiByZWZlcmVuY2UgaXMgPCZzZGhjMF9scGNn
IDI+Lg0KPiA+IEJ1dCBpZiB1c2luZyBjbG9jay1pbmRpY2UsIHdlIG5lZWQgc2VhcmNoIGNsb2Nr
LWluZGljZXMgYXJyYXkgdG8gZmluZA0KPiA+IGl0cyByZWZlcmVuY2UgYmVjb21lcyA8JnNkaGMw
X2xwY2cgMjA+LiBTbyB0aGlzIHNlZW1zIGxpa2UgYSBkcmF3YmFjaw0KPiA+IGlmIHVzaW5nIGNs
b2NrLWluZGljZXMuDQo+IA0KPiBTaG91bGRuJ3Qgd2UgaGF2ZSBjb25zdGFudCBtYWNybyBkZWZp
bmVkIGZvciB0aG9zZSBudW1iZXJzLCBzbyB0aGF0IGJvdGgNCj4gJ2Nsb2NrLWluZGljZXMnIGFu
ZCAnY2xvY2tzJyBvZiBjbGllbnQgZGV2aWNlIGNhbiB1c2U/DQo+IA0KDQpJIHRoaW5rIHdlIGNh
biBkbyBpdC4NCkRvZXMgYmVsb3cgb25lIGxvb2sgb2sgdG8geW91Pw0KI2RlZmluZSBJTVhfTFBD
R18gQ0xLXzAJMA0KI2RlZmluZSBJTVhfTFBDR18gQ0xLXzEJNA0KI2RlZmluZSBJTVhfTFBDR18g
Q0xLXzIJOA0KI2RlZmluZSBJTVhfTFBDR18gQ0xLXzMJMTINCiNkZWZpbmUgSU1YX0xQQ0dfIENM
S180CTE2DQojZGVmaW5lIElNWF9MUENHXyBDTEtfNQkyMA0KI2RlZmluZSBJTVhfTFBDR18gQ0xL
XzYJMjQNCiNkZWZpbmUgSU1YX0xQQ0dfIENMS183CTI4DQoNClRoZSB1c2FnZSB3aWxsIGxvb2sg
bGlrZToNCjwmc2RoYzBfbHBjZyBJTVhfTFBDR19DTEtfNT4NCg0KPiA+DQo+ID4gVGhlcmVmb3Jl
LCBwZXJzb25hbGx5IGknbSBzdGlsbCBhIGJpdCBpbnRlbmQgdG8gdGhlIG9yaWdpbmFsIHdheSB3
aGljaA0KPiA+IGlzIG1vcmUgc2ltcGxlIGFuZCBzdHJhaWdodGZvcndhcmQgZnJvbSB1c2VyIHBv
aW50IG9mIHZpZXcsIHVubGVzcw0KPiA+IHRoZXJlJ3MgYSBzdHJvbmcgb2JqZWN0aW9ucyBvbiBk
ZWZpbmUgYW5vdGhlciB2ZW5kb3IgcHJpdmF0ZSBwcm9wZXJ0eS4NCj4gPg0KPiA+IFNoYXduLA0K
PiA+IEhvdyBkbyB5b3UgdGhpbms/DQo+ID4gU2hvdWxkIHdlIGVuZm9yY2UgdGhlIGNvbXBsZXhp
dHkgdG8gdXNlcnM/DQo+ID4NCj4gPiA+ID4gKy0gaHctYXV0b2dhdGU6ICAgICAgICAgICAgICAg
Qm9vbGVhbiBhcnJheSBpbmRpY2F0aW5nIHdoZXRoZXINCj4gc3VwcG9ydHMgSFcgYXV0b2dhdGUg
Zm9yDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBlYWNoIGNsb2NrLg0KPiA+ID4NCj4g
PiA+IE5vdCBzdXJlIHdoeSBpdCBuZWVkcyB0byBiZSBhIHByb3BlcnR5IGluIERULiAgT3IgYXNr
aW5nIGl0DQo+ID4gPiBkaWZmZXJlbnQgd2F5LCB3aGVuIGl0IHNob3VsZCBiZSB0cnVlIGFuZCB3
aGVuIGZhbHNlPw0KPiA+ID4NCj4gPg0KPiA+IEl0IGlzIG9uZSBMUENHIGZlYXR1cmUuDQo+ID4g
Rm9yIHNvbWUgc3BlY2lmaWMgZGV2aWNlIExQQ0dzLCBpdCBtYXkgc3VwcG9ydCBjbG9jayBhdXRv
IGdhdGluZy4NCj4gPiAoZGVwZW5kcyBvbiBJUCdzIGNhcGFiaWxpdHkuIGUuZy4gdVNESEMpLg0K
PiA+IFNvIHdlIGRlZmluZSB0aGlzIGZlYXR1cmUgaW4gRFQgYXMgd2VsbCBpbiBjYXNlIGlmIHVz
ZXIgbWF5IHdhbnQgdG8NCj4gPiB1c2UgaXQgaW4gdGhlIGZ1dHVyZS4NCj4gPg0KPiA+IEJ1dCBB
RkFJSywgdGhlcmUncyBzdGlsbCBubyBvbmUgdXNpbmcgaXQuIE1vc3QgZHJpdmVycyByZXBseSBv
bg0KPiA+IHJ1bnRpbWUgUE0gdG8gZG8gY2xvY2sgbWFuYWdlbWVudC4gRGlkIG5vdCB1c2UgTFBD
RyBhdXRvIGdhdGUgb2ZmDQo+IGZlYXR1cmUuDQo+ID4gQnV0IHRoZSBjdXJyZW50IExQQ0cgZHJp
dmVyIEFQSSBkb2VzIHN1cHBvcnQgdGhpcyBwYXJhbWV0ZXIuDQo+ID4NCj4gPiBJZiB5b3UgdGhp
bmsgaXQncyB1bm5lY2Vzc2FyeSB0byBkZWZpbmUgaXQgaW4gRFQgYXMgdGhlcmUncmUgc3RpbGwg
bm8NCj4gPiB1c2VycywgaSBjYW4gcmVtb3ZlIGl0IGFuZCBkaXNhYmxpbmcgYXV0b2dhdGUgaW4g
ZHJpdmVyIGJ5IGRlZmF1bHQuDQo+IA0KPiBJIHdvdWxkIHN1Z2dlc3QgdG8gZHJvcCBpdCB0aGVu
Lg0KPiANCg0KR290IGl0Lg0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gU2hhd24NCg==
