Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8919CC2D0E4
	for <linux-clk@archiver.kernel.org>; Tue, 24 Nov 2020 10:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1ACDE206F9
	for <linux-clk@archiver.kernel.org>; Tue, 24 Nov 2020 10:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="l51j59CS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731487AbgKXKdg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Nov 2020 05:33:36 -0500
Received: from mail-db8eur05on2074.outbound.protection.outlook.com ([40.107.20.74]:40128
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731415AbgKXKdg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Nov 2020 05:33:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf9pRTS+neO3kb9GrHPsXfj0zke/rDKVmuDmFNu+zmXMNMeTa4Nvpqv+SAFMC5sjkZv9ROK4SUJa9RQDgmyJCmKriFNG+FnYbpBIhI9hn1KRe8OiQP6newp1Cs48X2eMmdCs7hz5fLyOVLTrhdQ6EQxE83Caloid0G9TK1RENvgb9PTLu+l255rRuhF1iK9TF12ttmG8dJZSCK6oz4DC3e9GBpDRouO0B864vfx7hEAhlgajNv4xRyexBe4U2bLmAZOLyE/sYlZrAoyQLCz7Dn/VS45alZstT5drGfvMnR+dsNZzMB2aV1ZeVxIPn4uQ08h39FDEEcv2iYIT7Trqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu8k+T55Qf7dhi6yXwqD1X2U9HwjK1cTF13J5AbSt+Q=;
 b=FzMGRlawwF+si4WZ0BPk8KO0jCRVwQ9jcJ3miwO5VWKuqu5y0OMi+uhswCzgWgq8jCVzHRyf8qP/ukm9sCTfJSdPkonwyakOGYdbSiBhc9e3Eb7wvCnXNrLvYMdYMqnrURNytm6KX48GxIZHA+Gjs4sXbbyzI8b6zoacd/HnJ65genVW10SexosPYG9ERyPPpbVDgWshmh294upYx4AGB34plw0HVGHaKjw7IuLWqqYoQws04VR1oVGlsul837wcb5hMjbQJLjE+b6gRbNbYy4V3eqZXPqtuTzJe8V7x1IHaLsNTj/9F/jfbdhkMZvJXmdqKnMHgbh8WD9zbzu/01w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu8k+T55Qf7dhi6yXwqD1X2U9HwjK1cTF13J5AbSt+Q=;
 b=l51j59CScDoTFDcsvTWEK+rBY5ATZLWqVyMNhC5SjF5yNPDKC7aTlPXd9zPJb43EPPojYq+iPBdST3gjIpvg9jDg5bN2qJTtl5Pf8TInGpnKc7KKyYqZdSYpkOm+IaXG9Zl/3XFgQSYHRsW1kZQ63XlygEuGKtkpVsT3Zg/CAjc=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR0402MB3560.eurprd04.prod.outlook.com (2603:10a6:209:8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 10:33:30 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3564.029; Tue, 24 Nov 2020
 10:33:30 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: RE: [PATCH 1/1] clk: imx: scu: remove the calling of device_is_bound
Thread-Topic: [PATCH 1/1] clk: imx: scu: remove the calling of device_is_bound
Thread-Index: AQHWvmuOPqiM3Q9w+0qUhwE0BvUIAanXHCTQ
Date:   Tue, 24 Nov 2020 10:33:30 +0000
Message-ID: <AM6PR04MB4966BCF5B48936CD42B06A0480FB0@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201119114302.26263-1-aisheng.dong@nxp.com>
In-Reply-To: <20201119114302.26263-1-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8a3abfb2-5c34-4da3-cfae-08d8906462f4
x-ms-traffictypediagnostic: AM6PR0402MB3560:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB3560ABE268B217AFEDE36DF480FB0@AM6PR0402MB3560.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g41pIT1Yezcr237XWbj8Hjj1lRX2pYKIrA3fhT+NhDJ4NapXazVGQ5T2jSbptd/3wLPxrN5E/sX2HTsZBrbOPzSmkMWun0WQP8BN6nsh/zrqR/UT39SHRjdWVfmW/s68/htqERwDfP/kkAD4GdfuesErGuU2zzb8mj+r5IWBjw3v7bGV0vn7LxGjABjXJVpgyYhoA0CLmovPthbMfuAxXcJmJ2i+1/tpAcL7rFJ9gt/e/lCyNRu/MOje9mU7h6xIWnA3YwmVsGSuO7VeWiO07ep+7fMXlDzv2L9hJgaw7kkEBH7N1QjSw2bHiaV1IPSMqZX7mBCCouGFNnqOFIdYZqwiYXCr24uYMjXvGfyOa/xU9IBU2hJ8DBfmgJSvbZIEMteJn1mg36k4dcEflhXLvw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(54906003)(83380400001)(966005)(76116006)(478600001)(186003)(9686003)(55016002)(66946007)(66476007)(26005)(5660300002)(44832011)(52536014)(66556008)(66446008)(64756008)(316002)(110136005)(8936002)(4326008)(8676002)(33656002)(6506007)(7696005)(71200400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: XzzZQIL5TN1Mzp+ICgGZQ1FiwjQcSq9KShEpvnkf7RLIz1AE+/9zfSxe97rMibTiofi49sK54hDvGzYDa9w2es6CvceP1iHyEPzK3lPJtY/8tRB6KiT5qOow3cHsSZeVRkOO134RsGJvFaKfJWn11N8qKc5yZWruE0loy/tYvn2RyXmcDMk9Dg1UB4jjYFyaunV664+nPXXko9lk1Irwp9U8aBr73qlWNYJTLLmLxuYznP+CLFRKZ4sOU+SpBHuLwgYUYVq5sDTn+tH2yWTthriyEDAQ31mZ4i2M+MtouQRTTfZW3g8SrumwkQ38OixftCL9AIUkX40t3sFoH5XdY8ZG/L/d5dV31W4aVjC0oHT3RSWKc05Bxeu6fE8Yr8YLIEXmi5D4Xcka/zHm15kc4qc/UB9uJTfiW4FH+WgrG3a0DbUkeME8y2TYnBjx3qpBrIfgaLhrdYVwLe+zWlSVss5tviTIjS/jU9dWdeiWVA5wNWjMGAXPpt62JQJv87A0yTYWVVsHV5x7JYzJXIINjc5Z535gHza3a2mOOgFfuEMfCsu2f+L+EWJTlK5XZBB7nLKzudNZKKWot0QVSPtGs9SuK21H7pPu/42yiWqhm8SMshud6ha7Rdj+y7AUNrH1sT3WkpfO/pwmilYDwX4h9A9r97gKqJ/mGTaoiT0YfPvq9TQxdmIw+8p4CLBmlrbk++UcdfuLqINDi3mlYO4gsbBeYf2lR1lOw7Y1yMsUrZJPc/vS3pB6xpZk5+VdsDTgA9EZ5yOdpzu42b7fPIQ3TM7miq7/Sjt8k0ltUatV2SxLpLDzYgYMYEFZ+wruG3occWzLhWj6nfVvbegknMacNIuo/wa8tvfGzsm3cocc+g6Sx/h5bLa3mD8rXUv8EL03BTaUmespFlpAnX0mXAcBuw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3abfb2-5c34-4da3-cfae-08d8906462f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 10:33:30.2366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w26cn2XiA0DMT9kPpBsEmCL44yoEcS+GfGiIip4pGyBFKSpl9bte6BsYTzL9V/Txzxr0uIe3YsIVRyByfLawtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3560
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU2hhd24sDQoNCj4gRnJvbTogQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4N
Cj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE5LCAyMDIwIDc6NDMgUE0NCj4gDQo+IFRoZSBk
ZXZpY2VfaXNfYm91bmQoKSBpcyB1bnZpc2FibGUgdG8gZHJpdmVycyB3aGVuIGJ1aWx0IGFzIG1v
ZHVsZXMuDQo+IEl0J3MgYWxzbyBub3QgYWltZWQgdG8gYmUgdXNlZCBieSBkcml2ZXJzIGFjY29y
ZGluZyB0byBHcmVnIEsuSC4NCj4gTGV0J3MgcmVtb3ZlIGl0IGZyb20gY2xrLXNjdSBkcml2ZXIg
YW5kIGZpbmQgYW5vdGhlciB3YXkgdG8gZG8gcHJvcGVyIGRyaXZlcg0KPiBsb2FkaW5nIHNlcXVl
bmNlLg0KPiANCj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCj4gQ2M6IFNh
c2NoYSBIYXVlciA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPg0KPiBGaXhlczogNzdkOGYzMDY4YzYzICgiY2xrOiBpbXg6IHNjdTog
YWRkIHR3byBjZWxscyBiaW5kaW5nIHN1cHBvcnQiKQ0KPiBSZXBvcnRlZC1ieTogU3VkaXAgTXVr
aGVyamVlIDxzdWRpcG0ubXVraGVyamVlQGdtYWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRG9u
ZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KQ291bGQgeW91IGFwcGx5IHRoaXMg
Zml4IGZpcnN0IGFzIGNsay1zY3UgaGFzIENPTVBJTEVfVEVTVCBlbmFibGVkIGFuZCBtYXkgYWZm
ZWN0IG90aGVyDQpwbGF0Zm9ybXMgYnVpbGQgdGVzdD8NCg0KY29uZmlnIE1YQ19DTEtfU0NVDQog
ICAgICAgIHRyaXN0YXRlICJJTVggU0NVIGNsb2NrIg0KICAgICAgICBkZXBlbmRzIG9uIEFSQ0hf
TVhDIHx8IENPTVBJTEVfVEVTVA0KICAgICAgICBkZXBlbmRzIG9uIElNWF9TQ1UgJiYgSEFWRV9B
Uk1fU01DQ0MNCg0KQlRXLCBJJ3ZlIHNlbnQgYW5vdGhlciBwYXRjaCBzZXJpZXMgWzFdIHRvIHN1
cHBvcnQgZGVmZXIgcHJvYmUgd2l0aG91dCBjYWxsaW5nIGRldmljZV9pc19ib3VuZA0KcGVyIHRo
ZSBsYXN0IGRpc2N1c3Npb24gd2l0aCBHcmVnIEsuSC4gWzJdLg0KDQoxLiBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtY2xrL2NvdmVyLzIwMjAxMTI0MTAwODAyLjIy
Nzc1LTEtYWlzaGVuZy5kb25nQG54cC5jb20vDQoyLiBodHRwczovL2xvcmUua2VybmVsLm9yZy9w
YXRjaHdvcmsvcGF0Y2gvMTMzNDY3MC8NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IC0tLQ0KPiAg
ZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyB8IDE1ICsrKystLS0tLS0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvaW14L2Nsay1zY3UuYyBiL2RyaXZlcnMvY2xrL2lteC9jbGstc2N1
LmMgaW5kZXgNCj4gZDEwZjYwZTQ4ZWNlLi4xZjU1MThiN2FiMzkgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvY2xrL2lteC9jbGstc2N1LmMNCj4gKysrIGIvZHJpdmVycy9jbGsvaW14L2Nsay1zY3Uu
Yw0KPiBAQCAtMTUzLDcgKzE1Myw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGNsa19zY3UgKnRv
X2Nsa19zY3Uoc3RydWN0IGNsa19odw0KPiAqaHcpDQo+IA0KPiAgaW50IGlteF9jbGtfc2N1X2lu
aXQoc3RydWN0IGRldmljZV9ub2RlICpucCkgIHsNCj4gLQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZF9kZXY7DQo+ICAJdTMyIGNsa19jZWxsczsNCj4gIAlpbnQgcmV0LCBpOw0KPiANCj4gQEAg
LTE2NiwxNyArMTY1LDExIEBAIGludCBpbXhfY2xrX3NjdV9pbml0KHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnApDQo+ICAJaWYgKGNsa19jZWxscyA9PSAyKSB7DQo+ICAJCWZvciAoaSA9IDA7IGkgPCBJ
TVhfU0NfUl9MQVNUOyBpKyspDQo+ICAJCQlJTklUX0xJU1RfSEVBRCgmaW14X3NjdV9jbGtzW2ld
KTsNCj4gLQkJLyoNCj4gLQkJICogTm90ZTogU0NVIGNsb2NrIGRyaXZlciBkZXBlbmRzIG9uIFND
VSBwb3dlciBkb21haW4gdG8gYmUgcmVhZHkNCj4gLQkJICogZmlyc3QuIEFzIHRoZXJlJ3JlIG5v
IHBvd2VyIGRvbWFpbnMgdW5kZXIgc2N1IGNsb2NrIG5vZGUgaW4gZHRzLA0KPiAtCQkgKiB3ZSBj
YW4ndCB1c2UgUFJPQkVfREVGRVIgYXV0b21hdGljYWxseS4NCj4gLQkJICovDQo+ICsNCj4gKwkJ
LyogcGRfbnAgd2lsbCBiZSB1c2VkIHRvIGF0dGFjaCBwb3dlciBkb21haW5zIGxhdGVyICovDQo+
ICAJCXBkX25wID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgImZzbCxzY3Ut
cGQiKTsNCj4gLQkJcGRfZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShwZF9ucCk7DQo+IC0J
CWlmICghcGRfZGV2IHx8ICFkZXZpY2VfaXNfYm91bmQoJnBkX2Rldi0+ZGV2KSkgew0KPiAtCQkJ
b2Zfbm9kZV9wdXQocGRfbnApOw0KPiAtCQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7DQo+IC0JCX0N
Cj4gKwkJaWYgKCFwZF9ucCkNCj4gKwkJCXJldHVybiAtRUlOVkFMOw0KPiAgCX0NCj4gDQo+ICAJ
cmV0dXJuIHBsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmaW14X2Nsa19zY3VfZHJpdmVyKTsNCj4g
LS0NCj4gMi4yMy4wDQoNCg==
