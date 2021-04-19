Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBDFC433ED
	for <linux-clk@archiver.kernel.org>; Mon, 19 Apr 2021 02:24:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B65D6024A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Apr 2021 02:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbhDSCZV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Apr 2021 22:25:21 -0400
Received: from mail-eopbgr00060.outbound.protection.outlook.com ([40.107.0.60]:29855
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232038AbhDSCZU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 18 Apr 2021 22:25:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPEZ6qIG3/WCyehLUXkJBSd1YJdWKGHgNXdkFX9X3nj19NyPEmkYpYKGLH/ufwKERdwQUTddIZdTawTakyqgIbvVDhv8lDcRp6pWprhtzZa2RC7lYs5LBgcwUNkv2FG9nOQRN8zluaKKLZ8n4dIHHyFwcDQgzQkND0Xr8o6LjFGNV3EyJXZrNGmYa9BGoJ1HSLMKTkQfLQeWHBH+3WwxrhDHCynUhjOPAG8CpFSCzbYDFMdPK/d5NIHFuDOiJyyI5mVtsiD9QMchRQbignR0nYkEbgSmBPKbxpFS2rsUu1jVhvlH7M0Zhfmzr+UOAHmIVE6W1MfV4eGqSicGaraW+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOAyo8gG9+jtERLGCpyUk14rQOVIBUab7gOJdwN3fk0=;
 b=MfcprJCu8bmCx0/J5hw7aKrCWnYok5U8w1ciA46Cm8bIGLJSF0oTm1CcYHSwcuenf7gCjjRdxZn2eiErT1EiffYtzOl8NiyPslO+GGfEHneOf16h+HjtWh6myLg7KKUA9zlvbxSs/LPD4mkYO5ik52IrPExHa4TfqZc1PxQO7daUqsOWyz5GgpB1VH7690iQ+Oz5wkTA0J5RVl3I+3nCID+B603zA/NTyNqf33Q7lFuNXdkRIr72LH8JxJubEcbcHXyaBmUKXHwciyh/b4Hk+5UyykIjhg0O8xE0O362L8RFLz4ANePfcRe5YxQIQacokh+SePbKkKa6xds7gZ3tIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOAyo8gG9+jtERLGCpyUk14rQOVIBUab7gOJdwN3fk0=;
 b=Eu7OK6y+kZcslUmoPW5G3ZVxw6nHlrNoY7ZVe+Avk7S56qFMmImBlmsPw85Uq0nmYNPHNQ7a4Dwp/gQP3Ul8hJLduCIwWM2sPfPqinIPVb1FS0NcV2pzoZsmTfHq6w8YyoyDnLhHoKuFvV7NzWr6N3TA0NBz9Ad9E/RHLc5lAVw=
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 02:24:49 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::ddbd:8680:c613:2274%5]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 02:24:49 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/2] clk: imx: Remove the audio ipg clock from imx8mp
Thread-Topic: [PATCH 2/2] clk: imx: Remove the audio ipg clock from imx8mp
Thread-Index: AQHXMpITkC36jFb0q0iRH4Y1wPq1m6q300CAgANMzQA=
Date:   Mon, 19 Apr 2021 02:24:49 +0000
Message-ID: <DBBPR04MB79305165186FB9BEE4273F6987499@DBBPR04MB7930.eurprd04.prod.outlook.com>
References: <20210416073703.1037718-1-ping.bai@nxp.com>
 <20210416073703.1037718-2-ping.bai@nxp.com>
 <161861742323.46595.18103968329383725805@swboyd.mtv.corp.google.com>
In-Reply-To: <161861742323.46595.18103968329383725805@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58ea80b2-f80e-4011-f948-08d902da4e8a
x-ms-traffictypediagnostic: DB8PR04MB7051:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB7051B6D38D5FACF8C698C94587499@DB8PR04MB7051.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sV4R/n1F5U3rhDYW5jKVGsweP3m5kqxdfYmqtBlnu8TINmFbaWrv6fVdMG2C0oNloAhhGQFsGxlct3xGniYKddra2Q/bd0nkC6/O/dwPe9/8gY5Qo8B556zZE5QsyZUGU8/49jn9VXjPHHxWdQmwYNP8DFbpnDSwrT30G8WAlkAWe9hQx3YOYClIqGGCm3SVWlApKylCUzftp9sqPC1iCxZp2Bloo3zg4b+c1MYri8FXqxYIlIhW+qmfDil7YRNgJPSKY0euC7EhCsguxbPk3XFiiPN7vG0PUKpqC/wsgqd4Ec+I2h3/MkAusH6eCHZ2OCu/oz9u6sN/mlc+oswNF9MVbyefROUaTkx7kJdZPZUExSVTzyqeFJMTj292cF57BC1EORqZIfkQwUN7eeYjNjM7KAhY3QX05k1AO2aMqdJk+ZMrWBeUQ4xlFs+GwpD/dXldq08Via6SwMElGOvBJum0IoGZ/fE8dnkiXkMdlwkUfkY+s3iMsgrReC9DNa05W9gM/wy67GvdphWPoEdAo3QGyoMDlRzynV5MyTqZo/dTPZlTKBsbS0cwuJ2pjqzP3GfMF0jC1cSyRglq/ML/51sOHiKhXj3ZLha/WU36cHmR5jr2SYkop8uQQbeu1N73YU5N0xrhBU6RM9r0G0RhzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(53546011)(4326008)(83380400001)(71200400001)(6506007)(5660300002)(316002)(54906003)(7696005)(8936002)(66476007)(33656002)(76116006)(26005)(66446008)(110136005)(66556008)(64756008)(52536014)(66946007)(122000001)(55016002)(186003)(86362001)(9686003)(8676002)(38100700002)(478600001)(2906002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SzR0VzFjRWtXUWRoZWkzTmRNZmlhUThOajlFOHVuY3JTNEtIc2hvaElBOUl4?=
 =?utf-8?B?Y0JwejBGeVFDR2NJQWNyWnA5KzA4cHU4QzRYcm8yVzNnbEhDTkxWTEJuRjhh?=
 =?utf-8?B?dzA4Nk5UaitrM1F0VG9JUW5ucTlMSUROQjBDbkdsak53NUY1UVpJbUNZMUhp?=
 =?utf-8?B?MEhGY01aQTJsQWo0V014Yy95bURTcEJJNkVSTW8xVUMzVkZRYjFFQ3BLQm5h?=
 =?utf-8?B?MTBUV01EckpzVWI2MTQvaTBMYXNSSTJqSGNQcklQR0ZSWmpIb3F3ZThycnZp?=
 =?utf-8?B?eHpsUmk4Z3ZlVGJiRUdYcWhkckxIQ1FDcklSYUdUUTY1VG1oTy9CL0Y2VVFP?=
 =?utf-8?B?MVlHbER2bkswWFVoY1ZJTGhnUUN2ZjljQmZZeXduT0pqdUd2blFaaldaNVRn?=
 =?utf-8?B?bHBSVzlsQ29VWUd1VkhHT2hJNTM5aks4a0t6TlF6NjlqemNnbVFEQVJNNkgz?=
 =?utf-8?B?cVp1M0JqTjFhV0NKK1NhZmM5eUplRnNoaUI0b0tFZVVkL2MzWEpLcDhvU3R2?=
 =?utf-8?B?bnRMVUo0Y2JFc3g2ZmIzTmUyQWRtMWlOenNiaEhQUUZrNmZBT0RLU3JGUndU?=
 =?utf-8?B?dHFkV1pnaExYUmE5SXJDUHV1YnlqSHVSOUhDQUcxaFRDVk03RXZmenEzKzE0?=
 =?utf-8?B?T0dYbzJtblZxVkxuc2JRWjBOS2pxT1lySDluaTRFbE9OZWxGRXd4ckhRK0hy?=
 =?utf-8?B?emhkMDk5ZUhFTmFnc3plaEpESXgwdDJsak5leUZzalQ5bUI4M09FcGVRTDhh?=
 =?utf-8?B?R2JKRlByL2d1SkU0Ty9Mb2lnUWdSWEZ2Ty9KSVZhYzVZbWd4djJwYlgwcWNC?=
 =?utf-8?B?b0FjSlFYbzhiTjUrWWd0TlpWaUkya2lZTStoY0NCdTdxZUlkRklPTFQrTWpP?=
 =?utf-8?B?eTRjZTVGNkJoMmltN3QxeGptUTRnQm05ODJUWGFaR3ZNNGFuOTZwNkJWbjRp?=
 =?utf-8?B?QlVPK0RhWWpmUWw1WU5ZanZWamhjVitkNTZqQzFMaE5MUXpYWElyMTM5U3NE?=
 =?utf-8?B?RGlHNkN3b29ITTI2aVN2TktlaDNsbHVQQ3lGL0FRYXlabXhoeTN0U0ZkU2dZ?=
 =?utf-8?B?SjBUaVN5M2kxZlQ0VG5sYk4yajNERHRCRjArUlN0RjFrRTNSTXEzaWhkdUY4?=
 =?utf-8?B?VmdMa2F4cXBWNENVSzZTUUFaTHZmejNwMmxTQ1VEWTFqeEtXdldQYkxBeWY2?=
 =?utf-8?B?ZXNqbkFOWWNkOXY5VDVPbFlJZmFlcGJaL3lSNm8zcnhHaHJoV0k0TitrZDlj?=
 =?utf-8?B?c0N1ZjkvbWVONyt0Ti9VQmNuUDNJOFo3YVZNVWd0WWhMenBjU3p3M3hoZmEw?=
 =?utf-8?B?RnJjK2xhaVZBY2tkakxmQnZrY05SeFh6NkRTcE54WUVrU1M3cXErbERjTElB?=
 =?utf-8?B?RmEyOXJaY3IyWFdtN3ZhejdlS1dhNEFoMWlqQzVtci9LS3htNThtMUNPOFhZ?=
 =?utf-8?B?bWRnREZCWXVqTmpETTA0c3hiekJ1OWVDNTY2akFwVXpnd0NpMVZSWFhqNEEw?=
 =?utf-8?B?UUpRSmJwVGVNT1U0OUpxcDB2dDdOQjVJUmpsOUR4QmtzMzlOSDg4L3doRnhv?=
 =?utf-8?B?VzdoK3hNUlJ3bWEzbkhvcUNiaWlNYnVTdTJtMzVjNUoxZ2ExdzZtTUQrZDFE?=
 =?utf-8?B?dEFNUTlmakt4UUtwY2ppYXVsek1jRDRrSUtEK3F3ZHp4WkpTSDRYeXdQY01L?=
 =?utf-8?B?RmdFenNYQlBwR3hCcUxJZ0lxZCttT2JJRlNLSnhhMnFQS3NZQ1lPeWNhNWJ5?=
 =?utf-8?Q?JUqAcSBuGByUMVktHCUl9J3JWwJbpmFgg0a5k1X?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ea80b2-f80e-4011-f948-08d902da4e8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 02:24:49.2287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 38BoWB8NWoaIioHK02dJPRWIKliC3cL9ZKFnMGDqQZM4/PZ9S5V2ajmOQzr7dkNoHxQ1R94WrtknJ2uclr1bJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0
bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBTYXR1cmRheSwgQXByaWwgMTcsIDIwMjEgNzo1
NyBBTQ0KPiBUbzogSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPjsgQWJlbCBWZXNhIDxhYmVs
LnZlc2FAbnhwLmNvbT47DQo+IHJvYmgrZHRAa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25p
eC5kZTsgc2hhd25ndW9Aa2VybmVsLm9yZw0KPiBDYzogZmVzdGV2YW1AZ21haWwuY29tOyBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgZGwt
bGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJd
IGNsazogaW14OiBSZW1vdmUgdGhlIGF1ZGlvIGlwZyBjbG9jayBmcm9tIGlteDhtcA0KPiANCj4g
UXVvdGluZyBKYWNreSBCYWkgKDIwMjEtMDQtMTYgMDA6Mzc6MDMpDQo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svaW14OG1wLWNsb2NrLmgNCj4gPiBiL2luY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svaW14OG1wLWNsb2NrLmgNCj4gPiBpbmRleCA0MzkyN2ExYjllOTQu
LjIzNWM3YTAwZDM3OSAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2Nr
L2lteDhtcC1jbG9jay5oDQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9pbXg4
bXAtY2xvY2suaA0KPiA+IEBAIC0xMTcsNyArMTE3LDYgQEANCj4gPiAgI2RlZmluZSBJTVg4TVBf
Q0xLX0FVRElPX0FIQiAgICAgICAgICAgICAgICAgICAxMDgNCj4gPiAgI2RlZmluZSBJTVg4TVBf
Q0xLX01JUElfRFNJX0VTQ19SWCAgICAgICAgICAgICAxMDkNCj4gPiAgI2RlZmluZSBJTVg4TVBf
Q0xLX0lQR19ST09UICAgICAgICAgICAgICAgICAgICAxMTANCj4gPiAtI2RlZmluZSBJTVg4TVBf
Q0xLX0lQR19BVURJT19ST09UICAgICAgICAgICAgICAxMTENCj4gDQo+IE1heWJlIGp1c3QgYWRk
IGEgY29tbWVudCBzYXlpbmcgaXQgaXNuJ3QgdGhlcmU/IE9yIHJlbW92ZSBpdCBpbiB0aHJlZSBt
b250aHMNCj4gdGltZSBvbmNlIERUUyBubyBsb25nZXIgcmVmZXJlbmNlcyBpdD8NCj4gDQoNCk9r
LCB3aWxsIHJlc29sdmUgdGhpcyBjb21tZW50cyBpbiBWMi4gSSBjYW4gYWRkIHNvbWUgY29tbWVu
dHMgYW5kIGtlZXAgaXQgaGVyZSBmb3IgYSB3aGlsZS4NCg0KPiBSZW1vdmluZyB0aGlzIGhlcmUg
bWVhbnMgdGhhdCBpdCBoYXMgdG8gbWVyZ2Ugd2hlbmV2ZXIgdGhlIERUUyBkb2Vzbid0DQo+IHJl
ZmVyZW5jZSBpdCBhbnltb3JlIHdoaWNoIGNhdXNlcyBhIGNyb3NzIHRyZWUgZGVwZW5kZW5jeS4N
Cg0KUmlnaHQsIHRoaXMgZGVsZXRlIHdpbGwgbGVhZCB0byB0aGUgZGVwZW5kZW5jeSB3aXRoIHRo
ZSBkdHMgdHJlZSBmb3Igbm93Lg0KDQpCUg0KSmFja3kgQmFpDQoNCj4gDQo+ID4gICNkZWZpbmUg
SU1YOE1QX0NMS19EUkFNX0FMVCAgICAgICAgICAgICAgICAgICAgMTEyDQo+ID4gICNkZWZpbmUg
SU1YOE1QX0NMS19EUkFNX0FQQiAgICAgICAgICAgICAgICAgICAgMTEzDQo+ID4gICNkZWZpbmUg
SU1YOE1QX0NMS19WUFVfRzEgICAgICAgICAgICAgICAgICAgICAgMTE0DQo=
