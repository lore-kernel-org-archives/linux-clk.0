Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C58FC19F2B
	for <linux-clk@archiver.kernel.org>; Thu,  4 Aug 2022 09:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238815AbiHDJN7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Aug 2022 05:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbiHDJN4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Aug 2022 05:13:56 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C142265574
        for <linux-clk@vger.kernel.org>; Thu,  4 Aug 2022 02:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2BeOHe+0036gMviXSOm/zwycs8li/80TX0NbdK2LMRgoCTHL9af58boyh+5kftPKjTt4nii2dN6d4L2zcW+JPvBgS1cgyKxnAvEyIfvRauZqgMA2jYAc4qxHiiMLpveyJdb7voISe37PKUm8Y1LtRJnCAK4tnkFYyv3r/nTeqYYXxeNM41X7N1zkNpThWSY2q0rlT+jzRzR3Z47YYyrduLGbuDzU5Gi3cMloKNJaO7Y6B01mZfEkS286m8MYO9Nrx1rcW8J/G0AZDNGZdScEfoRw8Q77O4/znyL6aWKjfwxvEda7WWTOmwuz18evcUP0JVzpiCQTG2kH31vcwjQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNqrqDX5/CtJGH2kVmKeCcSzU62iAyPkW9Ai/TWPOuY=;
 b=GNMU2+gHdXd1r0kplKCpPt5PhzFctLLYWcaglAr3JmChrVc7VRGQdbSuIlChZmzPmwvhejSMM5Fpej5t5oBIK8ndxE1DnFMZss6wgUIGNuvVdBYwSG6M8htqgRQqRr8KghkjEprUjwVauw/XWyEyAUKWsOmmK/plnb/wKKwKSv5LUD1Dq0E9KlUWYnexGXfKBODLYBD7Y73n3gHsMbo6/xCD3SXF4xB7/LoujDeM8CH9PcJjAzGficRnJt3Xziux/rJInJDEljbJGw9hLV8YfhT+Yj24bJ5x/MRNWRxak0ypktKsgQmuITZC+2NkwBsBMKZJYmhZGVDF/Sp0glykmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNqrqDX5/CtJGH2kVmKeCcSzU62iAyPkW9Ai/TWPOuY=;
 b=KoIR7jE9U7IczJsnMcCbtnTOIUz/syfFh+BlMW9JTu7T+2vPDyoxsIalXWV3PJCHVfq8ru3VyYEcQp6szVoOjKDB71/3N4j3bMGHphnFnSIW2S/ePqKceMLGmw8sXI5CGzpAY1AqCj5hlDehgUsCnAVdEwvfL95+wLnK0n+8jQc=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM6PR04MB5013.eurprd04.prod.outlook.com (2603:10a6:20b:3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 09:13:53 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 09:13:53 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@linaro.org>
CC:     Lucas Stach <l.stach@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Thread-Topic: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Thread-Index: AQHYiDN8f1kxqGxeCUmTVTOP99axvq1jZraAgAANYICAAQFWAIAAnQmAgDmhqgA=
Date:   Thu, 4 Aug 2022 09:13:52 +0000
Message-ID: <DU0PR04MB9417D9CE71ED2A72C5515D91889F9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de> <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de> <YrqxZFvKen7QybA9@linaro.org>
 <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
In-Reply-To: <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 096e14fe-637f-46b8-84dc-08da75f9a6ba
x-ms-traffictypediagnostic: AM6PR04MB5013:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fo62ldXkdwBSCNmMvBjLc3Gc5Wcsud1TjvDy//TseirayTLB8aXzcwbz79isjv83SplXnwnjxYtTFefNiepbzv2Zyl5FikqPBDVWQizE0yWH6bRuYRvu8oz7fwnkbtvN5V8wD3KU6QE64FDdu7Q3zrF4d5IhRbKIHJP1/CEvQracpDrcaoMcKWON4cQzkqCqrlyNEcs7L/O748QLWImrrzhm/YFDsl4ygn5e5X0p1BR/IWxilDCkeMOWmvgmchsxehXyFcN4Qgg2Dh3Xfj6BgZezm/tyFbG5TdvU9hWsPQoqdew42DUaQgfE0AEcRu7/EF9esJJsh05XSgYOW6aAnOHA9F6u24NPiJUH1y8LPIICF4QDSf6fF2i3smaBVHWrT6dcuiz6hiJ+C8+mwABAkk+x/rUISlfsfwPLUgCTGmfB8I/tSwd41CtNwaNDQ8paps3nGfrT221FV4N5WwPq9l31XLcIp5TK+fH5ObEKrG6vMj+SbHhy8Cyt5WWuECEATD7pdp+voKh0vt3qgcDQn/ELa3TZ3eKw+AoOwpCEuGkvVZ0CZGstavr69mp8MScvGjGuYSgDtGwUbBIWFOrxhsvsgobLM/SpZs3tQBjtxUbqKwI8GmmHljCX9mnA3zYXHCeDXE0H/l+n9UDNvnEDCC6yixOfyGqU6v/I1yLaSpQ9lzeY0LvejcDosDZdTDl4INg+qky95aFWcr9nJA6cqtgdlFjTcRJpxa55CmMufDpbUe92rngd+KUSTMnft4/4eAAy9VKtvL1IMuNq8swHhMq6GLM8UhJiowVUaZOaxYDAi55+eDgsB8omkRoqnohqmVXwHnM2HToM60t14pZ+vw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(186003)(55016003)(83380400001)(41300700001)(38100700002)(33656002)(2906002)(44832011)(53546011)(6506007)(7696005)(9686003)(5660300002)(7416002)(26005)(316002)(8936002)(52536014)(86362001)(66476007)(64756008)(8676002)(66946007)(66446008)(110136005)(4326008)(66556008)(122000001)(71200400001)(76116006)(478600001)(38070700005)(54906003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWdDQWtaeTdLWFZ4T1YyN0F3R3JjWHRDNlV2ZGJtcENhVG13cTN0bnUyYVBJ?=
 =?utf-8?B?NlpDVTNQM2NHTkpFZmxNR3lzM1JYWnFBb3ZFUWRsS0Y5UFBYUUE3eDhKMjRt?=
 =?utf-8?B?cUxTS3BsQ2Zpb0tlM3JNSkpCYTNTV0tWZGxwdFhGZ2VTZHpGTVI2WEl3UWY3?=
 =?utf-8?B?bG05bE5lYkFYdWt6eWZLTDcyN3R4a0hwa0V1U1NkRTY2VytMZG05bnVPKzlQ?=
 =?utf-8?B?eGI0d0lxUW54bWVBb2g1YzloQ3JBOVJHdmtoVFZidFltcDdwQ1NvREtBMTZY?=
 =?utf-8?B?Ui9PT0M3dGF3TE00ZFVibXl6NVlnZndlNkhqZ01wM2U4Q2MxTEdZd3FrenRO?=
 =?utf-8?B?c2RZcTRVYmsxdm1QelJPdHl2ZzAxT0NZMURUbWFleTJBYUNlamlGdWs5RS9w?=
 =?utf-8?B?K1oyRzZmSEZIYy9qMzdjai9wOGQ4aVFaamdQd0hzZGZkZzdZSXBXYk1TdG9Z?=
 =?utf-8?B?ZTRGelJsTlEzdWl2WVB2TnhPTmg0bWhWVXVnaHEwR2l2RmlFL3pZSS9KUmsy?=
 =?utf-8?B?bUlpSW9RZTVSL3lwckNURzVwMit2dFlOc1kyWE5kcTV6S25NWS8wRzVOTEZV?=
 =?utf-8?B?YzBDcWhiRHZnRkRGU0pnak1qQS9lYmtVc1pVQlRxM0ZJbi9NRzRwbmczKzl6?=
 =?utf-8?B?TmNmTk4zWHp4NnpUeWRNTkpRZk9XNGwyR0hTbVZBeVN5d2NLeFJCZFFIZldF?=
 =?utf-8?B?N3cveXlZMlVkNFRXN0hpTUZ1ZThYbm5pZjR5Q2NkZk9IRFhWRkF4ell4N09i?=
 =?utf-8?B?Sm83VTdqb1hoN281aWl3K2ZKcTB6ZU5vQUgxUmxvQ2tiTmVWYWFXeEZQd21C?=
 =?utf-8?B?OFRmNU9ybWg2SlNKcFMxQ1gwTEJSSDFpeEZKbXNSOXBWQzBWZ2JVZDRiaG5r?=
 =?utf-8?B?ai9CdW5nZTJZUklvQ2ZrcU1RTXRhUXB0allQQTJPQWtmd2ZGTGNHdmY4Tzdh?=
 =?utf-8?B?VDB5YjFtVEVQdkI4aUMzUmtIUndMbks3MW4yMnFrVFd0MDNoVDNudllwZmlL?=
 =?utf-8?B?R0k0Tzh4YnptZXI0ZEhZYzRMYlVrQXdxYXNheHZaMk5VUWVkNHMzUVRFN0Vw?=
 =?utf-8?B?bTA3R0RncVAwenlDdnEvelN0NmhWS01NSEl0OW42STQyd3hpajJ5b1FjSTlC?=
 =?utf-8?B?T2ZlVkxpeUFEWHFrbTVvRzJ3SjBnU1lzeHhDV0ZpSXlGalFLS29RVFZaWjVY?=
 =?utf-8?B?d0hRckJjNUkzTWxsbVBRTUJsUkkyOHREZWlzWFJKNnJjZUxIdnZ1d2drdU1v?=
 =?utf-8?B?QnNma051VmxWUmFNSXdTdE1iSTdTZ2xiM2MwWVJVR1ZRWUptT0JBZDRJQVMv?=
 =?utf-8?B?Qll3aFEzaktvY3pmM043dUt1cnl1RUdqaExyYkI2N2Uwb2VpVGhzTFhObExt?=
 =?utf-8?B?NjlzOVlYczNFVkxOcWNJdVl4VjcvL3lXcnJJTjN2NTNienQxYTl5TjNRMXhM?=
 =?utf-8?B?U0VTYVJTdW5VZ2laaytkUkx2Y0VZZFloVnhET3VZckU5aWFlMkZDdm5qTzZ3?=
 =?utf-8?B?SmcxQk82dVRwUXR4V1gwRkhOT1lCdXJobkpIYnY5S1liWTNaVEhDVExncjEx?=
 =?utf-8?B?bzNWdWw1a3lBd2dzTkE5R1ZtbnZ5Z2J3Ym9QbDBHcjJROHkwb3B3WHRtRWFk?=
 =?utf-8?B?dk0yNjlGaU4xK1M2SEttM0hQNEx4YktIRTVWZEJRalc1d3RGelRIMHVpenNQ?=
 =?utf-8?B?dzNGNVAyV2lYQXJNWGRUMUZsK3Rzb3poVkQyMVRyU1kyc0MxMXl5WmRpaExG?=
 =?utf-8?B?RUgvbFRMaTVZSm1hbUEwRklpOTViNnZxcndHUmJiVjRIb2N0eXhvckErWHYw?=
 =?utf-8?B?UVd1Q21vZkdabTREUmtFWDU1UGVXSEl2NjB4a2h0NkFkUGh3bWx4d1pFYkVL?=
 =?utf-8?B?MUZoN2Z4Y29odk5Ib1R3UlRFTXZoNkJNZkhVQ0U3bkhlRExBc3lVZ2NSKzdW?=
 =?utf-8?B?V3NVbHZEZnRTSHViZDdWNDlCMjBxUmppeXJxQ3p4OURVTVpiTGlUTTNMQmNr?=
 =?utf-8?B?RkNkS3o0NGx1cStSRjY4enFPWDJrd0R5bzdMTUQ1Q1Y2ZktYakVLUCt5c2lU?=
 =?utf-8?B?NzJFTzg0UkhkN2NpTng5OUtzQmlaYTZjK2lTSlozUTRjMVF1OHBnL3BGZTZR?=
 =?utf-8?Q?ZLkE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096e14fe-637f-46b8-84dc-08da75f9a6ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2022 09:13:53.0269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fZvsArjn+ghVjGq82UPT0Jh2UQ/nfBmXpOhGm1QJyGq3SpFGtFnQunMzojwr+MpzMcOyShqPZ1XODcOHHCOqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5013
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDMvNl0gY2xrOiBpbXg6IGlteDhtcDogQWRkIGF1ZGlv
bWl4IGJsb2NrIGNvbnRyb2wNCj4gDQo+IE9uIDYvMjgvMjIgMDk6NDQsIEFiZWwgVmVzYSB3cm90
ZToNCj4gPiBPbiAyMi0wNi0yNyAxODoyMzozMywgTWFyZWsgVmFzdXQgd3JvdGU6DQo+ID4+IE9u
IDYvMjcvMjIgMTc6MzUsIEFiZWwgVmVzYSB3cm90ZToNCj4gPj4+IE9uIDIyLTA2LTI1IDAzOjMy
OjMyLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gPj4+PiBVbmxpa2UgdGhlIG90aGVyIGJsb2NrIGNv
bnRyb2wgSVBzIGluIGkuTVg4TSwgdGhlIGF1ZGlvbWl4IGlzDQo+ID4+Pj4gbW9zdGx5IGEgc2Vy
aWVzIG9mIGNsb2NrIGdhdGVzIGFuZCBtdXhlcy4gTW9kZWwgaXQgYXMgYSBsYXJnZQ0KPiA+Pj4+
IHN0YXRpYyB0YWJsZSBvZiBnYXRlcyBhbmQgbXV4ZXMgd2l0aCBvbmUgZXhjZXB0aW9uLCB3aGlj
aCBpcyB0aGUNCj4gPj4+PiBQTEwxNHh4IC4gVGhlIFBMTDE0eHggU0FJIFBMTCBoYXMgdG8gYmUg
cmVnaXN0ZXJlZCBzZXBhcmF0ZWx5Lg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gQWdhaW4sIHRoZXJl
IGlzIGEgY2hhbmNlIHRoYXQgdGhlIGJsay1jdHJsIGRyaXZlciBtaWdodCBkaXNhYmxlIHRoZQ0K
PiA+Pj4gUEQgZnJvbSB1bmRlciB0aGlzLg0KPiA+Pg0KPiA+PiBDYW4geW91IGVsYWJvcmF0ZSBh
IGJpdCBtb3JlIG9uIHRoaXMgPyBIb3cvd2h5IGRvIHlvdSB0aGluayBzbyA/DQo+ID4NCj4gPiBB
dCBzb21lIHBvaW50LCB0aGUgUERzIGZyb20gdGhlIEF1ZGlvbWl4IElQIGJsb2NrIHdpbGwgYmUg
YWRkZWQgdG8gdGhlDQo+ID4gZHJpdmVycy9zb2MvaW14L2lteDhtcC1ibGstY3RybC5jLiBUaGVu
LCB5b3UnbGwgaGF2ZSAyIGRyaXZlcnMgd2l0aA0KPiA+IHRoZSBzYW1lIGFkZHJlc3MgcmFuZ2Ug
YW5kIHRoZSBpbXg4bXAtYmxrLWN0cmwgYWxzbyBoYXMgcnVudGltZSBQTQ0KPiBlbmFibGVkLg0K
PiANCj4gV2h5IHdvdWxkIHRoZSBQRHMgYmUgYWRkZWQgaW50byB0aGUgYmxvY2sgY29udHJvbCBk
cml2ZXI/DQo+IA0KPiBUaGUgYXVkaW9taXggaXMgcHVyZWx5IGEgY2xvY2sgbXV4IGRyaXZlciwg
bm90IHJlYWxseSBhIGJsb2NrIGNvbnRyb2wgZHJpdmVyDQo+IHByb3ZpZGluZyBQRHMgb2YgaXRz
IG93bi4NCg0KSSByZWNhbGxlZCB0aGF0IHdpdGggd2l0aCBibGstY3RybCB3b3JraW5nIGFzIGNs
b2NrIHByb3ZpZGVyLCB0aGVyZSBpcyBkZWFkIGxvY2sNCmlzc3VlLCBpZiB0aGUgYmxrLWN0cmwg
bm9kZSBoYXMgYSBwb3dlci1kb21haW4gZW50cnkuIE5vdCB2ZXJ5IHN1cmUuDQoNClJlZ2FyZHMs
DQpQZW5nLg0K
