Return-Path: <SRS0=daJW=WW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AB8C3A5A1
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 03:21:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C1B32070B
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 03:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="CZ9Sdgi5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729355AbfHZDV2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Aug 2019 23:21:28 -0400
Received: from mail-eopbgr30053.outbound.protection.outlook.com ([40.107.3.53]:35842
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729290AbfHZDV2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 25 Aug 2019 23:21:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlAHLUkoAlYScSOVCanSt3pA+HsY1XWaLC1nQ7CWoHGj9rMfcoZhF0EuGRyZ+rtybHQ1CBKZScVi5WF+yuvoKXMvKfa+iA60luFvws1bgmJrij28zlbT6Owc4p2PeronvilwsaQJcA1wJDvQzC9YBlfxuUIw2/HjNTipxCq3k1Q4t5SnMJgFvmliNJtexZkdcbBfhL6f0emA7AdF+Zy+fzvX3sW279FLazGBfpQZo0T3mlrk1RrhURuNRYXXywdM0PkX0/rggyBOptQhQDOLS3Yfs7mGeBGE31Wy1EnPa/3VR/fC8Wq8tJ3JzBJ/3Owf8JlViLVfUlCjufbL9Kh9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4u89jsHv8wUo/iNZtXKK4PINswfjk1SmJz7W4nNNX4=;
 b=Q4+vaIyeBGVXKBG28VYWrzAiLIi4QZ05e4ryV3k+CyNmZr27f0s3nh6eyHJSAFh0PqDgW4iQaiiaD/UIoYXd827dcvYkWW2MxQ5T4qKpgBPH2rRtfnvNpGZQPu5XjZO8yG35Bs8SIj5Ws59AYKZm/AKT62nj9XpcO/4pKsSkrxXlst9bbTJ3rx7TRtEZb9kxkwMFFvr73P9ZwpDSP3Nc8hWMT2epO8IsvFhRGFZxDJ0+y3mSGjgvyR307xHpnRJrW2Urd+s3r4ogYGAHwlxLOyuydkRSXRS0AyjffkIAs4LuLIRT52fX7N+92625a6DUp80iESMYu1S1+7jZpyOR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4u89jsHv8wUo/iNZtXKK4PINswfjk1SmJz7W4nNNX4=;
 b=CZ9Sdgi5s+Rx5ErPYVMhOCBz6pHD+p8q4UXyK1aLZemBsxzNBx4pDeVNAJwBX2pZQiUpV2ToRxu6AYa4R49ilX5/RuvUyi8EmEB+Fpc/D2W5l4z0oCq+kYkuCy6cl4B1o5j858uDr3RvxSLuy9Qz1wSOiiHhp+ebWqHshRcSYYk=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.92.158) by
 AM0PR04MB5284.eurprd04.prod.outlook.com (20.177.41.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 03:21:24 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::44b4:2932:8e73:d707]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::44b4:2932:8e73:d707%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 03:21:24 +0000
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
Thread-Index: AQHVV0rlu0hXHSvML0qy3W+1YgLATqcKs4wAgAIWq6A=
Date:   Mon, 26 Aug 2019 03:21:24 +0000
Message-ID: <AM0PR04MB421181E4376070636898906F80A10@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 18f44d41-b484-4515-1e84-08d729d479ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB5284;
x-ms-traffictypediagnostic: AM0PR04MB5284:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB52841B18DB46FB569A2D80C580A10@AM0PR04MB5284.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(54906003)(53936002)(305945005)(33656002)(476003)(486006)(66066001)(5660300002)(6436002)(53546011)(316002)(14454004)(8936002)(7736002)(26005)(55016002)(3846002)(4326008)(44832011)(6506007)(76176011)(7696005)(446003)(186003)(11346002)(102836004)(86362001)(25786009)(478600001)(99286004)(256004)(71200400001)(8676002)(74316002)(6116002)(81156014)(229853002)(66946007)(2906002)(52536014)(66556008)(64756008)(66446008)(6246003)(81166006)(71190400001)(66476007)(76116006)(9686003)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5284;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aDjQYOFL8X9pMTqYmXMr/LpMPas1LnIDTG5N2lxXnZDxfIgiYwoogoKYucU8Qm0rGG0oa9hsujY4LBg7dBtmFGxBjo7EF1OET+TfR6Z3BYW9G2WvnoRsv1FDVbpfgIPgJvWDLRuB9nCkpK5rHY9gL1qs9iOEbxyYDSps7WcIanrpJCka+mECsQnsU36VElqh46yPDee69GOarjvE91KKAxjv0WUydopyYf6wQFdPEvFbtfbIo8kz7LwRtp3/8OPR4qG9QHXvBoblGawbggzK/B/7JSQ4yCH2k2Jlpl+ZkGX5d1MscCCz4IV323CBSKvAhT4/31XZaCs5ya275lx7nSneHN7bJHzftZkeiFCLbMNMkc0/30USmT92NDMdRguK+E4BTPwT0h3Q9yTURhv4RjzLj/oUirbsal+TH9eIXwg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f44d41-b484-4515-1e84-08d729d479ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 03:21:24.6143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5oArvIYZku91tmjFV6flymHdUVjkpjtysgib0978Ei3N9dZnjUgs92Tlw+SsTAE7UNF2qheMFGe5O4EPJHgBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5284
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFN1bmRheSwg
QXVndXN0IDI1LCAyMDE5IDM6MjEgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNCAwMi8xMV0g
ZHQtYmluZGluZ3M6IGNsb2NrOiBpbXgtbHBjZzogYWRkIHN1cHBvcnQgdG8NCj4gcGFyc2UgY2xv
Y2tzIGZyb20gZGV2aWNlIHRyZWUNCj4gDQo+IE9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDA3OjEz
OjE2QU0gLTA0MDAsIERvbmcgQWlzaGVuZyB3cm90ZToNCj4gPiBNWDhRTSBhbmQgTVg4UVhQIExQ
Q0cgQ2xvY2tzIGFyZSBtb3N0bHkgdGhlIHNhbWUgZXhjZXB0IHRoZXkgbWF5DQo+ID4gcmVzaWRl
IGluIGRpZmZlcmVudCBzdWJzeXN0ZW1zIGFjcm9zcyBDUFVzIGFuZCBhbHNvIHZhcnkgYSBiaXQg
b24gdGhlDQo+IGF2YWlsYWJpbGl0eS4NCj4gPg0KPiA+IFNhbWUgYXMgU0NVIGNsb2NrLCB3ZSB3
YW50IHRvIG1vdmUgdGhlIGNsb2NrIGRlZmluaXRpb24gaW50byBkZXZpY2UNCj4gPiB0cmVlIHdo
aWNoIGNhbiBmdWxseSBkZWNvdXBsZSB0aGUgZGVwZW5kZW5jeSBvZiBDbG9jayBJRCBkZWZpbml0
aW9uDQo+ID4gZnJvbSBkZXZpY2UgdHJlZSBhbmQgbWFrZSB1cyBiZSBhYmxlIHRvIHdyaXRlIGEg
ZnVsbHkgZ2VuZXJpYyBscGNnIGNsb2NrDQo+IGRyaXZlci4NCj4gPg0KPiA+IEFuZCB3ZSBjYW4g
YWxzbyB1c2UgdGhlIGV4aXN0ZW5jZSBvZiBjbG9jayBub2RlcyBpbiBkZXZpY2UgdHJlZSB0bw0K
PiA+IGFkZHJlc3MgdGhlIGRldmljZSBhbmQgY2xvY2sgYXZhaWxhYmlsaXR5IGRpZmZlcmVuY2Vz
IGFjcm9zcyBkaWZmZXJlbnQgU29Dcy4NCj4gPg0KPiA+IENjOiBSb2IgSGVycmluZyA8cm9iaCtk
dEBrZXJuZWwub3JnPg0KPiA+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+
ID4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCj4gPiBDYzogU2FzY2hhIEhh
dWVyIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+ID4gQ2M6IE1pY2hhZWwgVHVycXVldHRlIDxt
dHVycXVldHRlQGJheWxpYnJlLmNvbT4NCj4gPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29t
Pg0KPiANCj4gQWNrZWQtYnk6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCg0KVGhh
bmtzIFNoYXduLg0KDQpTdGVwaGVuICYgUm9iLA0KV291bGQgeW91IGhlbHAgcmV2aWV3IGlmIHlv
dSdyZSBhbHNvIG9rIHdpdGggdGhpcyBiaW5kaW5nPw0KV2UgbmVlZCB0aGlzIHRvIGJlIGZpbmFs
aXplZCBlYXJseSBmb3IgdGhlIGZvbGxvd2luZyB3b3JrLg0KDQpSZWdhcmRzDQpBaXNoZW5nDQo=
