Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9275DC43381
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 04:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54EF4207E0
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 04:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BXbr8ZD1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfBVEnx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 23:43:53 -0500
Received: from mail-eopbgr10058.outbound.protection.outlook.com ([40.107.1.58]:50093
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726213AbfBVEnx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 23:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDF/DvSdTKCtNrBqiIhqKfI+HMfYLBdsbqUtlAjIcN4=;
 b=BXbr8ZD1ygeXxucUwC3AHGAjPK6txnoaDI4CN02azkP5pyLmwQViwiYxic6mscR6yqCRV/PFKoAU3Vkx/INB6/PJqQb+B/DrgVR4o8JlYU7HQuvLSfH3vsOAvw4adIcpxy8TALpj3HPfvlxcf9o7wqk9RYHd6fb/3TXlGLQDfUk=
Received: from DB7PR04MB4218.eurprd04.prod.outlook.com (52.135.131.15) by
 DB7PR04MB5355.eurprd04.prod.outlook.com (20.178.85.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Fri, 22 Feb 2019 04:43:05 +0000
Received: from DB7PR04MB4218.eurprd04.prod.outlook.com
 ([fe80::4dbf:e531:d53e:9b51]) by DB7PR04MB4218.eurprd04.prod.outlook.com
 ([fe80::4dbf:e531:d53e:9b51%3]) with mapi id 15.20.1643.014; Fri, 22 Feb 2019
 04:43:05 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Fabio Estevam <festevam@gmail.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abel.vesa@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: RE: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
Thread-Topic: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
Thread-Index: AQHUuPregGiZIr9DTU6Nn4rL+VOFK6Xq2FoAgACC9uA=
Date:   Fri, 22 Feb 2019 04:43:05 +0000
Message-ID: <DB7PR04MB4218C623E27118064F9A46F6807F0@DB7PR04MB4218.eurprd04.prod.outlook.com>
References: <20190131002056.12024-1-festevam@gmail.com>
 <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com>
In-Reply-To: <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e708df68-530a-4081-4710-08d698803c96
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:DB7PR04MB5355;
x-ms-traffictypediagnostic: DB7PR04MB5355:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtEQjdQUjA0TUI1MzU1OzIzOm5NVDZLRnNSOWhhL1ZhYi82Z2pEUnZ4VDRG?=
 =?utf-8?B?QmRreXNKRUs4NlJOTktOZDZFbENCUHRleE5TSldXNmdYdVBic2ZpRnlIakNz?=
 =?utf-8?B?WTJ6ODRCR2pudjA3Z09uMFAyM1d0VFo1dnkwcU9GNGVYd1JUWUtma2h0SFlD?=
 =?utf-8?B?SDJtMmdQOVNZcEJ3WmpnSk5TM0VwZXFhWmNBV2tpNGlpVFZkbnNqQzNFQk1a?=
 =?utf-8?B?c1FSSUMwendmYXpoVDNIT2dtek5QdFd6MUhnK2hYUXZmY1ZxY3NubFdpM0FW?=
 =?utf-8?B?dTR3SnFnYk90VFZ3elZaOC9ody82ODZPeGY5TXBlZUVpTDczZ1RyLyt2cktv?=
 =?utf-8?B?RmI5NlRnaTJHOEp3UEJLUTRDcm1qeEtMZ0dqYWJhTzZqWVpHQWM3VmZETHFF?=
 =?utf-8?B?enJHWlBaZnhkbkVxSXQ1eEJ0WHhKbTZrbnVTci9aR3ZOTnNnU0ZPS2liV2Fs?=
 =?utf-8?B?Z0I4bmJRNTN6NnRyU0pqb2tpTkdib0pVNWp3cktRNW9SZGg1TWNUQU1WYmNx?=
 =?utf-8?B?K24xemNEajVwNFNaOW96SzFBUDJadG1XVmQxWjZtdzNHUXp1RW1XY2lrZ1NH?=
 =?utf-8?B?L2ZyWFcwUThnNzJWRHpKdzlhVGIzMXFST0VmUFl1Z0pXdXF1eE5hdjFMS2xy?=
 =?utf-8?B?K29hRG5lZ1BvV2xtQnI2dnpGVXA1Yk5pSkdtY1NmTXVzelVaNEhFcXVsZ0JZ?=
 =?utf-8?B?TzBLSzFHRGFZeWU0RGxXdmFqUHEzRVEvOWZ6enVXN0d5WHF2S01sN0tOUUR2?=
 =?utf-8?B?MlhBd1BoUGJRYnVjenUyejhEakZZUHVvcFIwcWtHQTFuTGUxU3FFZW03dUI0?=
 =?utf-8?B?N3B2Q1p2cXdDR2RWNzJ2UlRSRnZBWnZQZ2VVZXFrSXR0aXFmR0J4eUxDaEdQ?=
 =?utf-8?B?aEYrSU5hZk0wUFZwQ0s0cG5DdThnRHo3Ynp1dHZyS0JFaE1selpRdURZOWJy?=
 =?utf-8?B?aXVISTNDaVV3TDM3UDg5NDJIeVhzZnpFQzlmKzEvYUdtUG9oWnA4VkxydUhS?=
 =?utf-8?B?VzMyKzM0V1R4aWNwQU1WWFB4UDdTbE1CaEF3cUhKeVZOM3F3aWJzbTh4bFhQ?=
 =?utf-8?B?bk9Ody84WW1oSm1HVjIyUWNnNkFWOW4veDhoQ1ZwWWMxdXFvVWhXZUUwRGRj?=
 =?utf-8?B?YTZaR0p6REFuYTdXajhVTHBnWjdpSVkvL3M1L3VOSGVUS0Y2MkdJa2kyUlBw?=
 =?utf-8?B?bys1bTV6UjdaRUJVRU1MNVJPVmJJVFM5KzVjamNxenVrVE5MeEhGR3FlRlIr?=
 =?utf-8?B?MUVYbkhtS0lpZDlvOHpHaVZiSjVYbkhqajhybFp5M1dBREp6Z3cybmU0R1pH?=
 =?utf-8?B?WW9FOFBXWXczT2xZMkFiQWJEdVFPSTdDZlBsV0Z3c2Z2Yi9oWVl2a2lvVXMy?=
 =?utf-8?B?MVkreVMxTWtEcXhpQ3llM2doZlgySWVueWRIT05BcmN2MmhDeXJEaUs5ZStF?=
 =?utf-8?B?YW9IaU5kazdOTXNjajZobnFnMUxMaHZsWXdvb3BUNHJFMG93WHA3UERDSDZG?=
 =?utf-8?B?VlJVTnljMEF2WVBBRDFKU0lEcTlPUU0vWEF5alNhUGVmeHREbVJvZ0t1YTJx?=
 =?utf-8?B?SUhFWHk2aWVoNkhqSmw4ak1YY1pKS21zbytmNWtodk1kTHdTRSs4UVc2cE9S?=
 =?utf-8?B?MzgrSzcydUJESDZJL05LQUtuYmUyem9UVzRlelNGSkZKcjU1cHRhU1JLOWMx?=
 =?utf-8?Q?HVQyFKhRQDn5nNvP1w=3D?=
x-microsoft-antispam-prvs: <DB7PR04MB5355229F6FEAAC290F4FF9A0807F0@DB7PR04MB5355.eurprd04.prod.outlook.com>
x-forefront-prvs: 09565527D6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(376002)(396003)(346002)(136003)(366004)(189003)(199004)(7696005)(25786009)(97736004)(76176011)(14454004)(486006)(44832011)(478600001)(316002)(110136005)(186003)(55016002)(105586002)(3846002)(53936002)(9686003)(4326008)(74316002)(6116002)(68736007)(7736002)(66066001)(305945005)(54906003)(99286004)(26005)(33656002)(81166006)(86362001)(71200400001)(71190400001)(81156014)(229853002)(446003)(11346002)(6246003)(8676002)(2906002)(8936002)(6436002)(106356001)(476003)(102836004)(256004)(14444005)(6506007)(5660300002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR04MB5355;H:DB7PR04MB4218.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6NjnuOtVgPZJjmbEHV7oyUtSFq52MD3+uQmAEG+Kr7cRvrsX2/KMMBl33HyaJTRlobyj1SvfBDDQld5T/9nLLP+NEJ5qul0qFxl63ZuFZXqm3bDrAMgn8rAiCK0QM574KYLMnmq2UihFwp3TSPq6h2WOmFWbFZZ2tacoFkBUqRCjA3YeRsgtBGGBmCgrZSLWMMM3YkyD2/8BphD1nLRFAdAoOQo+LgVn98+jgj2Q+icXWl28CkN7w9bMHG731H5eDTzZe/JNGAfvEvFuLvDsl5Iu3gUJz/L31AwaMww41q9Fl6c9dKlznDBS60/GBqdDFkcVpTv7nczGagNAKaTZtamy1BujMsMQNwHxNqqA5Ren9lSbejEaT98RojhL/8KYu0++slEvPlxc5LUR7mBa4VcisE8CiWMbMcZyiZvy48I=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e708df68-530a-4081-4710-08d698803c96
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2019 04:43:05.8130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5355
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBGcm9tOiBTdGVwaGVuIEJveWQgW21haWx0bzpzYm95ZEBrZXJuZWwub3JnXQ0KPiBTZW50OiBG
cmlkYXksIEZlYnJ1YXJ5IDIyLCAyMDE5IDQ6MzcgQU0NCj4gUXVvdGluZyBGYWJpbyBFc3RldmFt
ICgyMDE5LTAxLTMwIDE2OjIwOjU2KQ0KPiA+IEFkZCB0aGUgZW50cnkgZm9yIHRoZSBDTEtPMSBj
bG9jay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdt
YWlsLmNvbT4NCj4gPiAtLS0NCj4gDQo+IEFwcGxpZWQgdG8gY2xrLW5leHQgYnV0IEkgaGFkIHRv
IGZpeCB0aGUgd2hvbGUgRFQgYmluZGluZyBudW1iZXIgYmVjYXVzZSBJDQo+IGRvbid0IGtub3cg
d2hhdCB0aGlzIHBhdGNoIGlzIGJhc2VkIG9uLiBJbiBmYWN0LCBwbGVhc2UgZ2V0IGV2ZXJ5b25l
IGludm9sdmVkIGF0DQo+IE5YUCBhbmQgd2hvZXZlciBlbHNlIGlzIHdvcmtpbmcgb24gaS5NWCBj
bGsgZHJpdmVycyB0byBjb29yZGluYXRlIHNvbWVob3cuIEkNCj4ganVzdCBzcGVudCAyMCBtaW51
dGVzIHdvcmtpbmcgdGhyb3VnaCB0aGUgc2V0IG9mIGlteCBwYXRjaGVzIGluIG15IGluYm94IGFu
ZA0KPiBJIHNlZSBhcHByb3hpbWF0ZWx5IDYgZGlmZmVyZW50IGF1dGhvcnMgYWxsIHNlbmRpbmcg
b3V0IGEgZmV3IGNsa3MgYXQgYSB0aW1lIGZvcg0KPiB0aGUgc2FtZSBkcml2ZXJzIHdpdGggemVy
byBpbmZvcm1hdGlvbiBhYm91dCB3aGF0IHRoZSBwYXRjaGVzIGFyZSBiYXNlZCBvbg0KPiBvciB3
aGF0IG9yZGVyIHRoZXkncmUgc3VwcG9zZWQgdG8gYmUgYXBwbGllZCBpbi4NCj4gDQo+IElmIHNv
bWVvbmUgd2FudHMgdG8gY29sbGVjdCBhbGwgdGhlIHBhdGNoZXMgYW5kIGluZGljYXRlIG9uIHRo
ZSBsaXN0IHRoZXkndmUNCj4gcGlja2VkIHRoZW0gdXAgYW5kIHdpbGwgYmUgc2VuZGluZyB0aGVt
IGFzIGEgcHVsbCByZXF1ZXN0IHRoYXQncyBmaW5lLg0KDQpXZSBrbm93IHRoYXQgdGhlcmUgd2Vy
ZSBhIGxvdCBvZiBJTVggY2xvY2tzIHBhdGNoZXMgc2VudCBpbiB0aGUgbGlzdCByZWNlbnRseQ0K
YW5kIGl0IHdhcyBhIGJpdCBvdmVybG9hZGluZyBhcyB5b3Ugc3RpbGwgbmVlZCB0byBtYWludGFp
biBhbGwgb3RoZXIgcGxhdGZvcm1zLg0KU28gd2UgZG8gYXBwcmVjaWF0ZSBmb3IgeW91ciBiaWcg
ZWZmb3J0IQ0KDQpXZSdyZSBzcGVlZGluZyB1cCB0aGUgSU1YIHVwc3RyZWFtaW5nLCB0aGVyZSBt
aWdodCBiZSBtb3JlIHBhdGNoZXMgc2VudCBvdXQNCmluIHRoZSBmb2xsb3dpbmcgbW9udGhzIGZv
ciBuZXcgU29DcyBzdXBwb3J0Lg0KDQpJJ20gTlhQIGludGVybmFsIHVwc3RyZWFtaW5nIGxlYWRl
ciwgY3VycmVudGx5IEknbSBidXN5IHdpdGggdXBzdHJlYW1pbmcgTVg4DQpBcmNoIGFuZCBhc3N1
bWUgSSB3aWxsIGJlIGEgYml0IGZyZWUgbGF0ZXIuIElmIHlvdSBhbmQgU2hhd24gYXJlIG9rYXks
DQpJIHdvdWxkIGxpa2UgdG8gc3BlbmQgbW9yZSB0aW1lIHRvIGhlbHAgcmV2aWV3IGFuZCBjb2xs
ZWN0IGkuTVggQ2xvY2sgcGF0Y2hlcy4NCkhvcGUgdGhpcyB3b3VsZCBoZWxwIHJlbGllZiB5b3Ug
YSBiaXQuDQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0K
