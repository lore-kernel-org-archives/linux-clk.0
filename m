Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C74C5519F
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 08:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A68072074A
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 08:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="avtXQOfq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgK3ItL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Nov 2020 03:49:11 -0500
Received: from mail-eopbgr30075.outbound.protection.outlook.com ([40.107.3.75]:55748
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726596AbgK3ItJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 30 Nov 2020 03:49:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuuU9+GJnCBFhjflktyfTNLET91xay9OQ+dcyBC2sSsQQDHh8DEX+WdL6/ABo2CmfX9qpEvN3dk4yr4UR0AYqplIiwJkn79oOPHxcHJF9Fu652szZehey4W1RR8ZXCvgXjKq03sK+bAe3rCy999SUow34WeGedwN5tHA9p725LVUNJJdkXkcJs+vSL2Ecgc7+5YibTId1lgYvfyrx1BgAkkKWMeNEuPp0wiSKmTu5zYq9afwYERHtHHAOe1agH6GdCkBP3vr1SvKYQ5aVG7oF3Wf0Qc/BF9DQDGjnLnA7h8NLe8J0ajHv+V6VwacYjNRW41OoKJpupEvKzI3jMVDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD6YDe+qF914+DLGMP43HMqctyzNHh22CMZQpCRblVA=;
 b=DOHX5iVKmNK0SdgQYXjz4zb/YiMhwatuGufYJxtzmKWbp37zzm9M38uGFbgOIbTMlfFAamu7uQ+tqAfTa2zh66zosPmsQmfn01NCfuFcIu8J9vZuCHKAVBam+KnUGuRdal24wRDURJ8nRJjVBR/M2zvtms468qVre5UjngW9q4XSdmO/rUwhKC9NYInQtsHmjxJCsJ7c9n4rD8JKFbL8Gyb6ewwpBSKm9ryZYFNIEtd0I9LMD2CVxGNrmIRAhdo9f4N8IhAkac3ExX6labcbWPi9IL2iinmA8WJouBqLHvL1qjsQy+pyWA9zX2ckR/nk4H3Daxfc4ZESM2ndUxADOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD6YDe+qF914+DLGMP43HMqctyzNHh22CMZQpCRblVA=;
 b=avtXQOfqGI1H6sDqZPy5ScrQOVVUOqOPz/4XkGgJmOlxeQpFvxsXZ6MvY7UqKdyG7+enMWR8+vxrllK4xmImxWF7a84UpnH/auYbOueaPhN/d/yN2fwoPadW9pbISrGo5Dbk4jU9xtcMriHPGmzo0iPCxm1ttKHxnpQB42MCFTY=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB6871.eurprd04.prod.outlook.com (2603:10a6:20b:109::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 08:48:19 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 08:48:19 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "sudipm.mukherjee@gmail.com" <sudipm.mukherjee@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: RE: [PATCH 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Thread-Topic: [PATCH 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Thread-Index: AQHWwxtcOBAOcl2P/02xv3xvhsQLMqncbiiAgAP0gwA=
Date:   Mon, 30 Nov 2020 08:48:19 +0000
Message-ID: <AM6PR04MB496641731EE5A480889CA49A80F50@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201125105037.22079-1-aisheng.dong@nxp.com>
 <160650818748.2717324.6222265265679775690@swboyd.mtv.corp.google.com>
In-Reply-To: <160650818748.2717324.6222265265679775690@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d5ef8dc6-6339-4c4a-cb52-08d8950cafbf
x-ms-traffictypediagnostic: AM7PR04MB6871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6871E7D9ECEE416816CABDED80F50@AM7PR04MB6871.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U3N9uZcNcLHNaWHdmMQQTaTOsqiy+8KE+ZHVOdwVhomTjwos4ohelwz9pNJZcX7C3iDBjv9NHBOtbiWjiJSPqWLtO1NQp/1qWlly82UFH/+CUmiztsdNd/Pu1d75CIG6cxM8UwuhRao7d18NB1mKsL+iAOKORHikSsxRxPD66Su8xywQzaz2g4P8pvCnXsn41ygsfIH93expufS+FFYq7ZGJr+RNUa1/K1ZBNH0qhqorFU3yfNOCbpgnzN0A2AJAi/QYgcXodshWNsdHtFBHVpq8xT3eG4PRHopj0VncI0LrBniomJaXiIPZj6nHn6vV2c94xmrnflYGMZ5sU4wfXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(64756008)(53546011)(186003)(52536014)(26005)(478600001)(8676002)(4001150100001)(66476007)(6506007)(66556008)(33656002)(66946007)(66446008)(44832011)(76116006)(8936002)(7696005)(71200400001)(9686003)(5660300002)(316002)(4326008)(55016002)(110136005)(2906002)(86362001)(54906003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SmRSQUhEZ1g5ZitjLy9mTDNIbm1KMElUcnZGcDg1ZUJ2SXlkc2gwQXUyRDR1?=
 =?utf-8?B?VHg0QWJxR0piWTNjWFM3YVMzUE4wcXdYbWFuRFRrYmptdDZPSzZ4RnFwMDQ5?=
 =?utf-8?B?b0pLVWJSMU13ZkdzL01kMmh4WkZranlURGVnc096WHBvNGQ5SzU3eWFpYUNK?=
 =?utf-8?B?Z0ZMMHBhMjg5MlFoVmhNYVVrakRhWkc0dXc1OWRCOCt5clAyQVJuNzFObHJv?=
 =?utf-8?B?MWlOY0lTUlhvRElmTkhvUUNFWTF2eHVtZXhYWXllb0N5dkIvSUozY0NRUHVN?=
 =?utf-8?B?SkN1c09iTURTUlU4MnB4UzgvZ3B1M3NyMWxpSHNQT3ZKQlo4WmY2SStubGpj?=
 =?utf-8?B?L0Q2N3dnN1N0Nzc3UGNtMm1FM1E4cktIMlI2ZFA4ZDVqT2NONUFnS0hZaVdC?=
 =?utf-8?B?bzVRdnFodW95akZvcHR5SWxRdmRWU2FZQlZvd0pZdXJRWmZ5SGgyQlg0RlJV?=
 =?utf-8?B?RkMzM1I2bzJaQURrT01aSmdVOFJLUEhMc3htbTlmL2hVby9ob1BqVlUxR21Q?=
 =?utf-8?B?blVGek52dHBWeG9wWVp3bFpRZ3U5VjdVVGJ1cVhuVGtpczhaU0poZGNPVnlQ?=
 =?utf-8?B?bzhOR3dyNEhWVDdha2RVbmluNk5pd3hkaW5RcytvS1pJYWVLTmN0ZHhlL1M1?=
 =?utf-8?B?dWp2ZHVHSnpycVg3dkxuM0FSaTd2S2lTeTJtanNFSFFRZHYxM01ObzFCWE9Z?=
 =?utf-8?B?R25sMmhlUWV5b1B3RmFvdGtqVG1rVnNoWXBKSkV0eVJRSkI5djRWVnp3RlZn?=
 =?utf-8?B?Ry83TnVlajkxakhVYlNrZGc0MUoySHhIQWlIVGVMbmJMY3FURit5cWFwOXFS?=
 =?utf-8?B?a3ZodjdxOFNTRnJ0OVVWM1FYNDczNVpqQUdPRFJMek1ub0JzR2dYTUVXZFlT?=
 =?utf-8?B?YitCdEx4eG9aSXJ4Ym5aMTFZSnI3dWNqWEtwWmJNNjQzZ0RydjlnREFtSlkr?=
 =?utf-8?B?ZDdjNml4R041T1Y3S3lEMHdqc0NaRW1IUjBvU21CNmxORGJVbWNWa3JXMFU0?=
 =?utf-8?B?U0NyZFBjbC9EM1cvd05jdG9McWtSdXJkTHRNQ1BXQWQrUUdkUFFTTkl4aUo4?=
 =?utf-8?B?bjRtWnkrNG5oKzVUL1JYZDlsZ200SkozNERtMVpCODNndkpUT0xkSjVqQXF4?=
 =?utf-8?B?NjRTZkJqSE45MEdMejRpQ1ErM2YwMTFBOFNWVGNvZ3RrK0lzZGdBalFBbXVp?=
 =?utf-8?B?TkN2VWFTckxJQWQ0aDFOTkY3bXhsY2dHcmVFNkttYXp5dDhHK043ZGRNYzYw?=
 =?utf-8?B?SFpVREtpWkdsVkJ4VklCK1NIb2RLZ2hOOThoeXVONXhaRmh1ZE5TbUM5dWlw?=
 =?utf-8?Q?oPlKVXkUJF8/A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ef8dc6-6339-4c4a-cb52-08d8950cafbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 08:48:19.2374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FKwkd4SMvFDqnLtRuUoQdc2I3VgJSpmhPVeBvbU5quVXnKQycP+z0WgXoJAksH5InBsFmZwmS9D0qPrxSwXSLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6871
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFNhdHVyZGF5
LCBOb3ZlbWJlciAyOCwgMjAyMCA0OjE2IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8xXSBj
bGs6IGlteDogc2N1OiBmaXggTVhDX0NMS19TQ1UgbW9kdWxlIGJ1aWxkIGJyZWFrDQo+IA0KPiBR
dW90aW5nIERvbmcgQWlzaGVuZyAoMjAyMC0xMS0yNSAwMjo1MDozNykNCj4gPiBUaGlzIGlzc3Vl
IGNhbiBiZSByZXByb2R1Y2VkIGJ5IENPTkZJR19JTVhfTUJPWD1tIGFuZA0KPiBDT05GSUdfTVhD
X0NMS19TQ1U9bS4NCj4gPiBJdCdzIGNhdXNlZCBieSBjdXJyZW50IE1ha2VmaWxlIGNhbid0IHN1
cHBvcnQgYnVpbGQgY2xrLXNjdS5vIGFuZA0KPiANCj4gV2hhdCBpcyB0aGUgaXNzdWU/IENhbiB5
b3UgaW5jbHVkZSB0aGUgZXJyb3IgbWVzc2FnZT8NCj4gDQoNCkl0J3MgdW5hYmxlIHRvIGxvY2F0
ZSB0aGUgaW5wdXQgZmlsZXMgZHVyaW5nIGxpbmtpbmcgYmVjYXVzZSBDT05GSUdfQ0xLX0lNWDhR
WFAgDQpub3QgZW5hYmxlZC4gVGhhdCdzIHdoeSB3ZSBjYW4ndCBvbmx5IGVuYWJsZSBNWENfQ0xL
X1NDVS4NCg0KICBMRCBbTV0gIGRyaXZlcnMvY2xrL2lteC9jbGstaW14LXNjdS5vDQphcm0tcG9r
eS1saW51eC1nbnVlYWJpLWxkOiBubyBpbnB1dCBmaWxlcw0KLi4vc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDo0MzQ6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzL2Nsay9pbXgvY2xrLWlteC1zY3Uu
bycgZmFpbGVkDQptYWtlWzRdOiAqKiogW2RyaXZlcnMvY2xrL2lteC9jbGstaW14LXNjdS5vXSBF
cnJvciAxDQouLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUwMDogcmVjaXBlIGZvciB0YXJnZXQg
J2RyaXZlcnMvY2xrL2lteCcgZmFpbGVkDQptYWtlWzNdOiAqKiogW2RyaXZlcnMvY2xrL2lteF0g
RXJyb3IgMg0KLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1MDA6IHJlY2lwZSBmb3IgdGFyZ2V0
ICdkcml2ZXJzL2NsaycgZmFpbGVkDQptYWtlWzJdOiAqKiogW2RyaXZlcnMvY2xrXSBFcnJvciAy
DQptYWtlWzJdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uDQoNCj4gPiBjbGst
aW14OHF4cC5vIHNlcGFyYXRlbHkuDQo+ID4gIm9iai0kKENPTkZJR19NWENfQ0xLX1NDVSkgKz0g
Y2xrLWlteC1zY3UubyBjbGstaW14LWxwY2ctc2N1Lm8NCj4gPiBjbGstaW14LXNjdS0kKENPTkZJ
R19DTEtfSU1YOFFYUCkgKz0gY2xrLXNjdS5vIGNsay1pbXg4cXhwLm8iDQo+ID4gT25seSBlbmFi
bGUgTVhDX0NMS19TQ1Ugd2hpbGUgQ0xLX0lNWDhRWFAgbm90IGlzIG1lYW5pbmdsZXNzIGFuZA0K
PiBidWdneS4NCj4gDQo+IE9rLiBTbyBDTEtfSU1YOFFYUCBzZWxlY3RzIE1YQ19DTEtfU0NVPw0K
DQpZZXMNCg0KPiANCj4gPg0KPiA+IFRoaXMgcGF0Y2ggbWFrZXMgTVhDX0NMS19TQ1UgdG8gYmUg
aW52aXNpYmxlIHRvIHVzZXJzIGFuZCBjYW4gb25seSBiZQ0KPiA+IHNlbGVjdGVkIGJ5IENMS19J
TVg4UVhQIG9wdGlvbiB0byBlbnN1cmUgdGhleSdyZSBidWlsdCB0b2dldGhlci4NCj4gPg0KPiA+
IEZpeGVzOiBlMGQwZDRkODZjNzY2ICgiY2xrOiBpbXg4cXhwOiBTdXBwb3J0IGJ1aWxkaW5nIGku
TVg4UVhQIGNsb2NrDQo+ID4gZHJpdmVyIGFzIG1vZHVsZSIpDQo+ID4gUmVwb3J0ZWQtYnk6IFNl
YmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2Nsay9pbXgvS2NvbmZpZyB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbGsvaW14L0tjb25maWcgYi9kcml2ZXJzL2Nsay9pbXgvS2NvbmZpZyBpbmRleA0KPiA+
IDNiMzkzY2IwNzI5NS4uZGJhY2RkNzBhZjJlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xr
L2lteC9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvaW14L0tjb25maWcNCj4gPiBAQCAt
NSw3ICs1LDcgQEAgY29uZmlnIE1YQ19DTEsNCj4gPiAgICAgICAgIGRlcGVuZHMgb24gQVJDSF9N
WEMgfHwgQ09NUElMRV9URVNUDQo+ID4NCj4gPiAgY29uZmlnIE1YQ19DTEtfU0NVDQo+ID4gLSAg
ICAgICB0cmlzdGF0ZSAiSU1YIFNDVSBjbG9jayINCj4gPiArICAgICAgIHRyaXN0YXRlDQo+ID4g
ICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTVhDIHx8IENPTVBJTEVfVEVTVA0KPiANCj4gSXMgaXQg
YSB0ZW1wb3Jhcnkgd29ya2Fyb3VuZD8gQmVjYXVzZSBDT01QSUxFX1RFU1Qgb24gYW4gb3B0aW9u
IHRoYXQgaXNuJ3QNCj4gc2VsZWN0YWJsZSBpcyBtZWFuaW5nbGVzcy4NCj4gDQoNCkdvb2QgY2F0
Y2gsIHlvdSdyZSByaWdodC4NCkkgd2lsbCByZW1vdmUgdGhpcyBDT01QSUxFX1RFU1QgYXMgQ0xL
X0lNWDhRWFAgYWxyZWFkeSBoYXMgaXQgYW5kIHdpbGwgc2VsZWN0DQpNWENfQ0xLX1NDVS4NCldp
bGwgc2VuZCB2Mi4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+ID4gICAgICAgICBkZXBlbmRzIG9u
IElNWF9TQ1UgJiYgSEFWRV9BUk1fU01DQ0MNCj4gPg0K
