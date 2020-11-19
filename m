Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63D7C63697
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 15:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 734A624698
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 15:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="lETDHtvQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgKSPaz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 10:30:55 -0500
Received: from mail-eopbgr80085.outbound.protection.outlook.com ([40.107.8.85]:23681
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726691AbgKSPay (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 19 Nov 2020 10:30:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmolpAck5jUBbUgfApa0ut066fFvZRo6zaQwPZZEExnJ9ox1tKw2QnyibSPUe/aHSwks6Y4VWjqPE6Hk2ZFqaD4oHY6urMNo4JodUCQ1ceL1S7Vimtysel5OZqH1oKcUhNejq63iSbp+Mz4fGx7kwgUu283E27Y+6SCBjE393A62osReHUvj2hqk5r8ZnCTA+I1UO8XOJ7ykx4BmykPpMBA8nqfhbDHiW/0hhH9Yi07utoXK50Pslcx1yAjfAyVGjKKoUmPhn68f/AoXXJ+3j10ujuYy7ADqN50enu0vRGTYJMgrAlGHGBgxk/z/N2mzdswseUCc20cZScmRtJtIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+6ZONvZqrBgFr5Q09nOU3bpoLgObsNbGWiop5CBxsg=;
 b=Y8+lmsFTFcQ9m51eogO+4bPu3lLZB+tFOYjrAd1lrb3qkqzE7js9d7gQi/QSTsnbAR0buUyK5ULvYCd4iVQ4SM9h1WtWLNAhtyXIC4a5NVGxzXuELEdKEzNNs40wXPorrJyFEcwDZ+NehIaoPR6fnar4DwUo85HBVUJqLyQcR3NHrDTuwEKe78quc0yREZ9+RHDvMARhY+VeHgUWauL5JBMSkoZjQeqfC2k00504K0AhYmYxccFSzu96QIdmPzPU4ECSaAIB95vwREAwl6v5Eb0g/juFijteClhsiPX0vZGOG1jq+N1271eS/yVN50VcEz4uXkFCeBUE9YaBUxI2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+6ZONvZqrBgFr5Q09nOU3bpoLgObsNbGWiop5CBxsg=;
 b=lETDHtvQ2YiptJNIzWxw3YNpaSpMe53l1JppwoEFQG26LSnHCtwv35U5J0sXM1mqFQp4w5BL7n8sXbJqD7Bj7W/mtCfgEYV06c25RuNVavH8lMPMtlVwkk5pf5Ha+f2E/ar2t6o1eVZNqihFd23f3rYwgvXD377q1eFyCWYuO1U=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 15:30:51 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Thu, 19 Nov 2020
 15:30:51 +0000
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
Thread-Index: AQHWvmuOPqiM3Q9w+0qUhwE0BvUIAanPbSsAgAAmfyA=
Date:   Thu, 19 Nov 2020 15:30:51 +0000
Message-ID: <AM6PR04MB49667ACF83F057E5591E676080E00@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201119114302.26263-1-aisheng.dong@nxp.com>
 <20201119130800.boyqn4rtczq4wcvn@debian>
In-Reply-To: <20201119130800.boyqn4rtczq4wcvn@debian>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.171.84.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aac37ebb-0d7e-4e28-c351-08d88ca018e3
x-ms-traffictypediagnostic: AS8PR04MB7686:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7686D5754CA134A13B8529AA80E00@AS8PR04MB7686.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c15e+1zOtoe+v89laRfpuqzMCdqGK4O6NRrI987PpJwdnSiWRr4MHqgIblON1p/HHBsxo2LkRA72cTlp2KuZvVSTjGMu969K/8tosy7jubIUQP5iWETr89kWCJHklqNP+5DKaRdNhq+dWoR7EIr+B1GrSOuX8uGyeqd3uMAOYgzYumQfPQ9ig1v0bjr4vsy0GIofBL50tDTULAn/pJOxNmS+1RRoQPatAwzHOy2JLf6kmX9lAvGRQFR3hfGFu6XxjsxDoa1oUTQJf2pnCXzmBH85TFKqSvGw95N1fCY+y9ku7ZOFrpL+DKJPumnTFHC5+CYPdVv8ZSKD0jTY2a5cmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(8936002)(26005)(6916009)(66946007)(7696005)(66476007)(52536014)(86362001)(6506007)(54906003)(9686003)(316002)(55016002)(5660300002)(4326008)(76116006)(44832011)(66556008)(66446008)(64756008)(2906002)(71200400001)(186003)(8676002)(33656002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OBAMBExpObmpFdGwwXmpk0fo0ZMoFNJNdHsHt6B0qq6/7HXvoFjzljPFgEeo0jCBLOKZ2tuMCc1NaIbOn3CGtk1RPu0MoHmPnoH/StZUz+CdYkCPMPCFRgrXali9AZnyYch02liO0q0Ca7skt03hXCXea2f+f7zv4anP3azo1RxQCiVSMxXIogX59yQV2bTkc78yFHGZCX2+XHhGQc/zZZQhd5oUAgwIZ3Qm5a81xmUpyaF9lzchFiBkWAdOlLjMMPTfTVwYAwePLWl7pb1ddlJJYmVlSWMZohER4SGHq8fE3m6Sr9ql6e1s4t/hwHoFkiAgXAe24muHbci5bX5tO3x9+9pxo4m6byLSG9P7wG7ERk0pMNDRTC12cmwc2PBSTsQW0pZAhefF9jl412rWgBsljzx0I6JUQvMAInUc53MCG6U9BahDglH5VRZkE3Go2hlWI3tLbPea2ZeEc1Vx0FKhST2giwG3zo6AUzjlel6Hm3l7ucKLyNLdF46X+5mB6p1Bbkeh8Wa+dkU+JwV+9WbGpw4gkhXqk2Dik6TbWqXW+zNZSETJaULR8e7m/K/wHMw0557rwk2d3UqcebPfGpZC9W3yIZsgjAJJJadvis1IPkCVGjPBSmwPU1Pj6Ly/zS/9ZccemCA18imfb3yegA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac37ebb-0d7e-4e28-c351-08d88ca018e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 15:30:51.2111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQQy1B9F8yeQALij1It6QG+qjhgkHIsCJL9L9OL/9inJbLXmLJOnVKsdKqOaMT5TbKOV+ELvwq99aIWa4qO95w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTdWRpcCBNdWtoZXJqZWUgPHN1ZGlwbS5tdWtoZXJqZWVAZ21haWwuY29tPg0KPiBT
ZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTksIDIwMjAgOTowOCBQTQ0KPiANCj4gSGkgRG9uZywN
Cj4gDQo+IE9uIFRodSwgTm92IDE5LCAyMDIwIGF0IDA3OjQzOjAyUE0gKzA4MDAsIERvbmcgQWlz
aGVuZyB3cm90ZToNCj4gPiBUaGUgZGV2aWNlX2lzX2JvdW5kKCkgaXMgdW52aXNhYmxlIHRvIGRy
aXZlcnMgd2hlbiBidWlsdCBhcyBtb2R1bGVzLg0KPiA+IEl0J3MgYWxzbyBub3QgYWltZWQgdG8g
YmUgdXNlZCBieSBkcml2ZXJzIGFjY29yZGluZyB0byBHcmVnIEsuSC4NCj4gPiBMZXQncyByZW1v
dmUgaXQgZnJvbSBjbGstc2N1IGRyaXZlciBhbmQgZmluZCBhbm90aGVyIHdheSB0byBkbyBwcm9w
ZXINCj4gPiBkcml2ZXIgbG9hZGluZyBzZXF1ZW5jZS4NCj4gDQo+IEdyZWcgd2FzIGFza2luZyB0
byB1c2UgZGV2aWNlX2xpbmsgZm9yIHRoaXMgaXNzdWUuIEhhdmUgeW91IHRyaWVkIHNvbWV0aGlu
ZyBsaWtlDQo+IHRoZSBmb2xsb3dpbmc6ICh1bnRlc3RlZCBhcyBJIGRvbnQgaGF2ZSB0aGUgaGFy
ZHdhcmUpLg0KDQpJdCBjYW4ndCB3b3JrIGFzIGV4cGVjdGVkIGJlY2F1c2UgaXQgcmVxdWlyZXMg
c3VwcGxpZXIgZGV2aWNlcyAoc2N1IHBkKSB0byBiZSBwcm9iZWQgZmlyc3QuDQphbmQgaWYgc2N1
IHBkIHdhcyBwcm9iZWQgZmlyc3QsIHRoZW4gdGhlcmUncmUgYWxyZWFkeSBubyBpc3N1ZXMuDQoN
ClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lteC9j
bGstaW14OHF4cC5jIGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4cXhwLmMgaW5kZXgNCj4gNWIz
ZDRlZGU3YzdjLi45YWU2Yzc2OGVhMDUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9j
bGstaW14OHF4cC5jDQo+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC5jDQo+IEBA
IC0yNSw3ICsyNSw3IEBAIHN0YXRpYyBpbnQgaW14OHF4cF9jbGtfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiAqcGRldikNCj4gIAl1MzIgY2xrX2NlbGxzOw0KPiAgCWludCByZXQsIGk7
DQo+IA0KPiAtCXJldCA9IGlteF9jbGtfc2N1X2luaXQoY2NtX25vZGUpOw0KPiArCXJldCA9IGlt
eF9jbGtfc2N1X2luaXQoY2NtX25vZGUsIHBkZXYpOw0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVy
biByZXQ7DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyBiL2Ry
aXZlcnMvY2xrL2lteC9jbGstc2N1LmMgaW5kZXgNCj4gZDEwZjYwZTQ4ZWNlLi5lODM0YmZhZGMy
YTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGstc2N1LmMNCj4gKysrIGIvZHJp
dmVycy9jbGsvaW14L2Nsay1zY3UuYw0KPiBAQCAtMTUxLDggKzE1MSw5IEBAIHN0YXRpYyBpbmxp
bmUgc3RydWN0IGNsa19zY3UgKnRvX2Nsa19zY3Uoc3RydWN0IGNsa19odw0KPiAqaHcpDQo+ICAJ
cmV0dXJuIGNvbnRhaW5lcl9vZihodywgc3RydWN0IGNsa19zY3UsIGh3KTsgIH0NCj4gDQo+IC1p
bnQgaW14X2Nsa19zY3VfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0KPiAraW50IGlteF9j
bGtfc2N1X2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZQ0KPiArKnBkZXYpDQo+ICB7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsN
Cj4gIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZF9kZXY7DQo+ICAJdTMyIGNsa19jZWxsczsN
Cj4gIAlpbnQgcmV0LCBpOw0KPiBAQCAtMTczLDEyICsxNzQsMTIgQEAgaW50IGlteF9jbGtfc2N1
X2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCkNCj4gIAkJICovDQo+ICAJCXBkX25wID0gb2Zf
ZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgImZzbCxzY3UtcGQiKTsNCj4gIAkJcGRf
ZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShwZF9ucCk7DQo+IC0JCWlmICghcGRfZGV2IHx8
ICFkZXZpY2VfaXNfYm91bmQoJnBkX2Rldi0+ZGV2KSkgew0KPiArCQlpZiAoIXBkX2RldiB8fCAh
ZGV2aWNlX2xpbmtfYWRkKGRldiwgJnBkX2Rldi0+ZGV2LA0KPiArCQkJCQkJRExfRkxBR19BVVRP
UkVNT1ZFX0NPTlNVTUVSKSkgew0KPiAgCQkJb2Zfbm9kZV9wdXQocGRfbnApOw0KPiAgCQkJcmV0
dXJuIC1FUFJPQkVfREVGRVI7DQo+ICAJCX0NCj4gIAl9DQo+IC0NCj4gIAlyZXR1cm4gcGxhdGZv
cm1fZHJpdmVyX3JlZ2lzdGVyKCZpbXhfY2xrX3NjdV9kcml2ZXIpOw0KPiAgfQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lteC9jbGstc2N1LmggYi9kcml2ZXJzL2Nsay9pbXgvY2xr
LXNjdS5oIGluZGV4DQo+IGU4MzUyMTY0OTIzZS4uMTRlMmJhZjE0NzU3IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2Nsay9pbXgvY2xrLXNjdS5oDQo+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGst
c2N1LmgNCj4gQEAgLTEzLDcgKzEzLDcgQEANCj4gIGV4dGVybiBzdHJ1Y3QgbGlzdF9oZWFkIGlt
eF9zY3VfY2xrc1tdOyAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzDQo+IGlteF9jbGtf
bHBjZ19zY3VfcG1fb3BzOw0KPiANCj4gLWludCBpbXhfY2xrX3NjdV9pbml0KHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnApOw0KPiAraW50IGlteF9jbGtfc2N1X2luaXQoc3RydWN0IGRldmljZV9ub2Rl
ICpucCwgc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiArKnBkZXYpOw0KPiAgc3RydWN0IGNsa19o
dyAqaW14X3NjdV9vZl9jbGtfc3JjX2dldChzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzICpjbGtzcGVj
LA0KPiAgCQkJCSAgICAgIHZvaWQgKmRhdGEpOw0KPiAgc3RydWN0IGNsa19odyAqaW14X2Nsa19z
Y3VfYWxsb2NfZGV2KGNvbnN0IGNoYXIgKm5hbWUsDQo+IA0KPiAtLQ0KPiBSZWdhcmRzDQo+IFN1
ZGlwDQo=
