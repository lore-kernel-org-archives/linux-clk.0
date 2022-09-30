Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E64C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 02:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiI3COR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 22:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiI3COQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 22:14:16 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBB31E4591;
        Thu, 29 Sep 2022 19:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ra7PLBH2I9d4aMrzYP0+m4adCjuvCh+Jp4nt7b/PU3hvVTE00lYE0cYDzyqNy0AMhwfbJfV2ck0/++qcKtVyjdPdrL20spxhrrOJkftTkJv3TfzSm9uu0PvszbcxovehBE6cAKO3TbFCdYOrDSMqwSh1E52HzA8pWJRn6CLmMpEqMva7O7wX7zFg81fFtSoUvoe+1IGmaAYIPLG/S0LnBa8Ddf6B+FpXt+t5D8W/mKoPpzwvMDnU9ibagjNBfeKngCBrUmvGWeIrFUiZEefM8v34mMYCepHahhaxAl6QqRMwCgpam5DZSfD8YTxM+EeVN0W4rwdiC5MbnuRX+lDDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+knW0+9DE6c5/hmnLePfQowyYc2FDP5zVVqli+L3nMw=;
 b=hbsC8B/APFYDxLl/vjpgwlfpCHWc6I1yiF/w9a5kLQZO55RfHPLfyLNhHwo7/s5DuHxjXb1Kcw6McZbOswpt9u+9txfa3bDmu2lFnhtdrD0Okd5llxyDY+CI8OG5L6g4jJleaQD0b/cvy7AsKkrjgkawAcp6ZIPzL9hzlloI/Unj+HL1OddCx/SR4FMoW89SWeNjfa9zLOzFTpp2KKlj/QsoY/zez/ZeJkFsiqThRG1NmHCodlgeV4G6EzYoBhzDfe0iG0HHr1r3EduH/WMjxCCNF55ZwMv3Xn2UD94OQfDonuT9DOmVOPMx4+9wpgbaBZmokk620XgTL50jXpO9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+knW0+9DE6c5/hmnLePfQowyYc2FDP5zVVqli+L3nMw=;
 b=f0JUnlGsQ2h2+YfkOKjPdMxbYo7NegXOwJyO+/AEywE9ZU0HnUTxP0QB/MJUI5pFskpUmaLIkrrGT9C+eXA23hHu8f2MJ1vr5uofgsvnkaX6njq+8zKx/PtKox2LXNrnvYr2DfGS7qbVo665BJTrHVmw5fZ89NRPMDqSj5FeUtU=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by PAXPR04MB8142.eurprd04.prod.outlook.com (2603:10a6:102:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 02:14:12 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::4ceb:3c8:9764:6dea]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::4ceb:3c8:9764:6dea%7]) with mapi id 15.20.5676.019; Fri, 30 Sep 2022
 02:14:12 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH RESEND v3 2/3] clk: imx: imx8mp: add shared clk gate for
 usb suspend clk
Thread-Topic: [PATCH RESEND v3 2/3] clk: imx: imx8mp: add shared clk gate for
 usb suspend clk
Thread-Index: AQHYzzw0xbfrwMJjQEGhpbpHYKj11633L8EAgAAStwA=
Date:   Fri, 30 Sep 2022 02:14:12 +0000
Message-ID: <PA4PR04MB9640252B09DF496EDD7F517C89569@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1663929905-10492-1-git-send-email-jun.li@nxp.com>
 <1663929905-10492-2-git-send-email-jun.li@nxp.com>
 <20220930005356.66A25C433D6@smtp.kernel.org>
In-Reply-To: <20220930005356.66A25C433D6@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|PAXPR04MB8142:EE_
x-ms-office365-filtering-correlation-id: d064fc0f-5e59-4931-d28a-08daa28977a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8VrLbi8XNTyufUtUgtHfL/LM5QMGpws3S5kqC5aHdF1yvQ4dcaMFARQTbdml0k6joDQItnbX+d9cQK7YGzC7JWweivW9cjAY+frXMe1mevdqz1Sv0RB21uPsipxI4i7JZ/iL/d5pmOMa6qkDwprgT9KkTpwB+/CQ8X+dOVno2yFJc2iEtPwfw/mKZzaM2ysFwIKBYJWDZWXhh0H/DoX/sgGRJdpybpMyvRVsgaOX/6llYUgcsKqna4KHQcuzBWiq3BgfTtCgaZvKaJu0q8weOsa/B5Zb50n/70zto4tz0tDhtBcIWmdZQP4ZNbVoU/8NcbwUkjFnaD2bfRCJ3Gjq6oNoW2F/az4SzxbGkVjS6P7KmTN8mQ7lUbErpMM7fytO7Qtd2TEndFJE9HvksdcPjLp0lhQ32xdKUy2IMS9L+e/lfurxRAsB26rs16/T8bU2XPfuML+p0UT02xviNNAacBQ6JR/ONfWsW90bgt+FF6L1500cvvnzTbvKea+Q+h2XDK3ClQO11eYo7/G02NZBzPQYv6XSRObnRRnooVYaLiUpDHMOevT/i3ijOI7NJi7oZWHlrbbCkmLSMwhkOofVr3Uq0RB3TbFDhVjx/PK/8hmMdG6CoddStZuXxtc9WuvC/r0cm3QcAlRPvppmQz7GNvblCYNNq5nPt33NJEUPSsgUXNWNRC8AJiftIvXZX0eEfktmlak4F5PAog6WRe+yGPGTqxpMceyQf24JEDvVPYZ+OkKTPJC5v+Tj7HqLClS5JjWIFJZT5tNUDWGn0i5RBRlP5OPJ+4XkRXK0pHkcjCA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199015)(110136005)(33656002)(54906003)(86362001)(122000001)(9686003)(38070700005)(38100700002)(186003)(66556008)(5660300002)(83380400001)(53546011)(52536014)(6506007)(66476007)(7696005)(71200400001)(8676002)(7416002)(316002)(55016003)(76116006)(66946007)(66446008)(64756008)(4326008)(26005)(2906002)(15650500001)(44832011)(41300700001)(8936002)(478600001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFI4c3NyYzN3Yzd3NCt2Vy9Yb2NDbVIxa1hGVTBQa3dDWnpWSTZIeHY3bHkr?=
 =?utf-8?B?MzBGTTQ5cGhoODZUaDNEKzdiVTRzbDF3SjYrR1c4TnRjTFJBaDVJeFJURW1y?=
 =?utf-8?B?SUdEa083K2VTeGxCeXowNmJWRGdrV3NEZXphM1NmYVRZR3hxTmNHUUlsNEli?=
 =?utf-8?B?bTgxKzVYUk1iVHBNQ29tdE1tM1pkRmpiTGpNWlhsbTk2V01YSG5rL3d6MEVt?=
 =?utf-8?B?UGZMN1cxV0ZMRE10dzBCdlBTUzlLakpMa3JxT0xBSjZCMnczY09LTkNSclFP?=
 =?utf-8?B?eHRKSlhDQnA4Lzl6RFNnRGUzM1FmbHUxQnlQbTBiTVRhRzZodHJmNFZzaG1N?=
 =?utf-8?B?NktFbnRkTVo5OWFUUTJOTnB4TGU2MzhqNGNOUG5PeWp0SmVlejNhRUJjQURH?=
 =?utf-8?B?Wk5wTVdZRkJBTGRuUDNLdnovN0ZnSzdpSmFjLzBpVDhaWmM2RHhOSk9NaWcw?=
 =?utf-8?B?RkFwVmpuV0x6N2xJSXU5ODFMeEpZZ3o2TmZBU1cvdWFuUTBRajJGWVJHNE1D?=
 =?utf-8?B?djIxYS9iVFJZTm9ycWdKcHRBRHZUVUdjRDMvNVJnNGVpMmVsNkpKQ2U4amVk?=
 =?utf-8?B?MCtsdUxRaUQ4TVQ3eEwzRzJZTmtEODBRNjlFZVFCQkVnekJvRFZCVXFsRHlu?=
 =?utf-8?B?d0dSaGFYNFFPSkY2OGJhalZSbG95bi8yRUtITEY4TkI1aWlZNHFYaXJ6SGFw?=
 =?utf-8?B?SllNMWZvNnBqQThwb3NYOUx1SFZWYlFzOW9BZTVETWhzelpEc05mOXVyaG9G?=
 =?utf-8?B?RUlPb2RqRTcyQ3hoOXQ2UWRXTUtDc3ZRRTN6V1ZWU3BNTDd5WklLd05RKzdN?=
 =?utf-8?B?VUhJMERhN2lVTXFESm1xNTNGVmpUajZKcGJXTVQxQ0JEQ1QzRlI5V0szRys0?=
 =?utf-8?B?UFc4dmtvdnlPYVlUZC9pZGhEenRpa1dyUm1sMCtuc2NiTzFLTDNOOXh4ZkxM?=
 =?utf-8?B?c2JsZlIzUXlPTG5zbVVCUUN3eDZvZzc4dkFVQ1IzZTlQZlh5MVV5NHU0Zkl5?=
 =?utf-8?B?ZjlLQVcxa3NuRVoraWhsanFnYThJcjFxKzFjNVFtdWNHZ0htQUdDdjB4THFk?=
 =?utf-8?B?eXR6SWdwbk9hdHNpaXluNUlpWStRNDRwblhxanh0SmlCdkprc0pwS252TTBw?=
 =?utf-8?B?d2NIalJCNER2MU9vRDA2V2UrVDVvMEF6Y3lFYU4xbFhCYmpRaWJLTUdhLzVV?=
 =?utf-8?B?dnlUUG9uMjRINjh4M0VMTi9KUFZjdktXRXJjTnhYRy80ZHNHRjNlaVZLeHY4?=
 =?utf-8?B?aGRla0tIeU82SHNjT2pMYTZXdnhmTEJlMlNOZ0pwbUk0WDVHbXRLSURyQWFX?=
 =?utf-8?B?eWpQOUZHeGljd1ZnODVac2lWTm1OSzYwMHplMTc5L1FSK3dGQjFjdjJEWXlX?=
 =?utf-8?B?aGhKaWZOeERwYnE2YjRCWE15NTRxZFltWTNWanBXK01WUmtsNlVtMjZpVEFz?=
 =?utf-8?B?RUM0TzhkUmtvU25XZjJoeW9vbHpZRldEU2IwTFkvL2Y4K3FjV3VpdWR3WHFH?=
 =?utf-8?B?dm8rczdncWprNzhwcUs1L1kwNnlQTkdidWtXSXMrakZzNGc4UWIvbDdRS2pR?=
 =?utf-8?B?TWRxaEEvTnRxRy9Eb3NWYTJ5ekRoWnVKUFphaGtUUkdEOEp0bVJYaTBUakpX?=
 =?utf-8?B?ZDV5VlJEcjNmQUtWZW00d0w2YStiZHNMUlcrWjVDWDhwV0txQ2ZCa3JoUjdJ?=
 =?utf-8?B?bng4SlFEVDBnczQ2Tm9FTTNZZ1BIdmlQTHBPU0VQeXoyWnpzRHp4a2x1M2NT?=
 =?utf-8?B?ais3TXZ3VERkRG9tZFhMa0tuVDUrTGp0cFlkS3hLVVBvVTA1Skdpb0JrYlJD?=
 =?utf-8?B?K1p5V21lRXU0NWF2YkIrZUpEbFNQOSsvZG5FYU5rZythd2Z0RDArWThaaTBa?=
 =?utf-8?B?S20rK3lpdkxKdjZMZTRORzh5S2tYajVQWkh0TDM3T2NJRlZpVFFtZkFaRGJU?=
 =?utf-8?B?TUpNQUgxWXlLK3ZYOUliSG55YSt4N3dUTTBIYytzTUtpaU9jQUpOVzNCNVFr?=
 =?utf-8?B?YWFnSmVGV05jMC9SUnhhVUlYZlZ2aVowOEtwd3VBN002WEdiQ0F0dXZUOVBp?=
 =?utf-8?B?c2pRUGZRcUhPMTFlQSswbG9HdGZrK2VCYlRwUEo0YnFEdEZSV0VKdG9rOWs5?=
 =?utf-8?Q?CY8A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d064fc0f-5e59-4931-d28a-08daa28977a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 02:14:12.7543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbp5YJwQXgmw1YYcKePqScDROkVkQl0UzFF4zCO+IPfOmNA3qxek0nAYnRenz5il
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8142
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDMw
LCAyMDIyIDg6NTQgQU0NCj4gVG86IEp1biBMaSA8anVuLmxpQG54cC5jb20+OyBhYmVsdmVzYUBr
ZXJuZWwub3JnDQo+IENjOiByb2JoK2R0QGtlcm5lbC5vcmc7IGtyenlzenRvZi5rb3psb3dza2kr
ZHRAbGluYXJvLm9yZzsNCj4gc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25p
eC5kZTsga2VybmVsQHBlbmd1dHJvbml4LmRlOw0KPiBmZXN0ZXZhbUBnbWFpbC5jb207IGRsLWxp
bnV4LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPiBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsg
bC5zdGFjaEBwZW5ndXRyb25peC5kZTsgUGVuZyBGYW4NCj4gPHBlbmcuZmFuQG54cC5jb20+OyBh
bGV4YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tOw0KPiBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgbGludXgtY2xrQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFJFU0VORCB2MyAyLzNdIGNsazogaW14OiBpbXg4bXA6IGFkZCBzaGFyZWQgY2xr
IGdhdGUNCj4gZm9yIHVzYiBzdXNwZW5kIGNsaw0KPiANCj4gUXVvdGluZyBMaSBKdW4gKDIwMjIt
MDktMjMgMDM6NDU6MDQpDQo+ID4gMzJLIHVzYiBzdXNwZW5kIGNsb2NrIGdhdGUgaXMgc2hhcmVk
IHdpdGggdXNiX3Jvb3RfY2xrLg0KPiA+DQo+ID4gRml4ZXM6IDljMTQwZDk5MjY3NjEgKCJjbGs6
IGlteDogQWRkIHN1cHBvcnQgZm9yIGkuTVg4TVAgY2xvY2sNCj4gPiBkcml2ZXIiKQ0KPiA+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjUuMTkrDQo+IA0KPiBXaHkgaXMgc3RhYmxlIENj
ZWQ/IFRoZSBjb21taXQgdGV4dCBkb2Vzbid0IHRlbGwgbWUgd2hhdCBzb3J0IG9mIHJlZ3Jlc3Np
b24NCj4gaXMgYmVpbmcgZml4ZWQuIFBsZWFzZSBoZWxwIQ0KDQpTb3JyeSwgSSBtaXNzZWQgdGhp
cyBhZ2FpbiwgUm9iIGNvbW1lbnRlZCBvbiB0aGlzLg0KSSB3aWxsIHJlc2VuZCB3aXRoIGNvbW1p
dCB0ZXh0IGltcHJvdmVkIHRvIGV4cGxhaW4gdGhpcy4NCg0KVGhhbmtzDQpMaSBKdW4NCg==
