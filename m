Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03F6C001DB
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 01:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjHIBXC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 21:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjHIBXB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 21:23:01 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8D419A8
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 18:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfrT1Y38Lw8lmbFavCCMk32VRIm12bUxNpAp9Ymw2ZgNlDTMgw0LFiD2vHNVe0KySOkIYy0Mu6X8I+oGiXejmGcAQ0PMob6sxXdaM5fVHJXPKp5LvdGDt6chtzrhiKnnxQ1MTsJ+hP2hwIVJIQE3Y7d/K3KnzUSuKjmpxlfjhhbLzgCVQc93FYOZkmE/r5Z+Dz5e3lQmhOOqRUn1MElMTsWd4mXqR8cf9OlQ93FF1iqYuaxvKUFv0qfjdguI+W8gdwz4o7vOmpYsvCIgvfNf+W0QYQpxdJfWEJzwoDQDIuRNQaRheFZ7N5DRqw/E0ffNN6m7im7nE4/C1nxXMGU49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44+s0Vc4+eYHH/KKRT9+ufcTL0sMfCb7QQVAx9z+CU8=;
 b=BK59GsaNJy+Vwswm7E8dDA6KMxAz1ZoUjCtdCeEkpTmVLvmMgUCLY/tbUBKEe/otFT08pIUO9jfTuNBHdqOFFnRIIpoMEkVBBkP78RYIxlmGkVJBf1TTkxn9ol1TINfu6b5Km0GwhFXS9hbR9NFnIHMb1sHIJVqpv5cFYoV+kN/jPwWsJXD6l2aEuGloPwMe6iJquFt7xp3X1xwbZo8VRJBhBRaM+dbMAFVzV6c6Ko2zNiL3X9QxvJImnqX5PpafMXmyBz67yDH1mWc/GKqUHMcUhSGmFFXr+cQAYmM3YabGu4oj8EK550O+YIwfHVvpYEk85jtOksqDBkEXnCRhOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44+s0Vc4+eYHH/KKRT9+ufcTL0sMfCb7QQVAx9z+CU8=;
 b=FY5RqbsUjbGkIxWU0Z7Ke7+HSskVyMvKdgRzuykjFyuqupe7PEPYgjRdiZjagwU3CY5vAs1MCIpCpXF5b1vADWb4pR3gKG9dXiwn0YLLdDUxpxLZaknF8+DaskFvy/GpatjEs6Kez/Nlu/JaLynHVB16LSg3rrWlv7yn11mu7Rk=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS1PR04MB9381.eurprd04.prod.outlook.com (2603:10a6:20b:4db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 01:22:57 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5d6a:ec53:f2a8:5b97]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5d6a:ec53:f2a8:5b97%6]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 01:22:56 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Adam Ford <aford173@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>
CC:     "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH v2 2/2] clk: imx: pll14xx: dynamically configure PLL for
 393216000/361267200Hz
Thread-Topic: [PATCH v2 2/2] clk: imx: pll14xx: dynamically configure PLL for
 393216000/361267200Hz
Thread-Index: AQHZyQvZuoVW8EW4BUaobMmhshzKRq/gUwmAgAAMZACAAM3XQA==
Date:   Wed, 9 Aug 2023 01:22:56 +0000
Message-ID: <DU0PR04MB9417442CEA0086A6DE6D890C8812A@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20230807084744.1184791-1-m.felsch@pengutronix.de>
 <20230807084744.1184791-2-m.felsch@pengutronix.de>
 <CAHCN7xLdwNXXeEi82KN7QWgUqUCeFjxJgkdo0+GujJYo8qLXVQ@mail.gmail.com>
 <ce1303c3-79b2-7a50-6fab-6235d9930d53@pengutronix.de>
In-Reply-To: <ce1303c3-79b2-7a50-6fab-6235d9930d53@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS1PR04MB9381:EE_
x-ms-office365-filtering-correlation-id: af24c7c0-f2c8-4560-1140-08db98772969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uSzbAdwqgykPBtMKJQBQ6i/s5FctKnxrqOuOFI0ApEQXN0XWTyboNAntSHctoBUU/KcRykNpiMsE8e+eEg16j+TpqjKQBKKg3oqajCxUo0TMJAPLODlCG5GwB55SgUKcVSYTDV9ThcLFVIVn/HUoQtTxFxdgxpjJgdE7DSPhfZxYrYa8LXfZndofbB8FvvszHZf7+CVFspfqK4STue0vs8G34OHmZarLr/ShS9sfrfbJ2E1sfJhonjlm18x/NaBPtWmgFD+5S567Ip+Y6NuYpp4EYFSeDTcIDXb3D3L7+XEiPaqimROGyzq17L/OL9ME6DOT9y9FjkuWoRbJeFR7OWs6UqvYStPm/W92aouRH4NuOHe0IVDDb1vXxz6ecXEKJk8n2MDBJ6pUAOaAi6CLS1ADgYlrXc0ijiG398CxA2d2EvXb62SYgtFKHTvXvFNB93NAXA0wS45fOXGIbju2NeFU6+D8cRM5Ucm7Rxs/1Sn3HzJNRS2BmZxI07f0tRkk9QOVkJ/ADyvNyfRmw4YgFeWyAC+Lj/IUxxy6M421W63BXMhP0JrBZrBThaDlPnmcAYuYzzbJvN1rn5OdjbNcbNeVxL93D7Q+dYl2Pt1uzF/OlXk1JaFKP9iEhox+mF2Q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(1800799006)(451199021)(186006)(966005)(9686003)(53546011)(6506007)(26005)(33656002)(55016003)(38100700002)(110136005)(54906003)(66946007)(44832011)(7416002)(41300700001)(52536014)(5660300002)(86362001)(38070700005)(4326008)(66556008)(2906002)(66476007)(76116006)(8936002)(8676002)(316002)(71200400001)(66446008)(64756008)(7696005)(122000001)(478600001)(45080400002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUltMjNFRDEvWm9zSzJ5VTNoTTJVamIwL1dFMWRWR2hpaEUrYjEzTEdlcUp1?=
 =?utf-8?B?YU1sWkpvZlZaQUJLNUJJeis1czhBNEdRZjJPdjFKN285MWNlSHlvRDhoK3ZL?=
 =?utf-8?B?T3NKUUI2V1N4TTJZbCtmYktWYU1yeU1sK0xwMWVVK2lkK2pydEZDZlhERFNo?=
 =?utf-8?B?OHFRU3VjanlJa2hhaTIrR0YzT2hxRGpORDBWWGFCTG55MU1QNy96a0ZTUEJJ?=
 =?utf-8?B?ZTIxVFQ2Sm5PeSs2MTdOMlZkZnd2cnNCUFd4NWZyaHdVVGNCamFlY0R3dDRV?=
 =?utf-8?B?OGVtb0U0MlpHT1pacFNWSUtiM25vZkpQTDI0TEJxa2F6K3YvWGNJbDlmUmNS?=
 =?utf-8?B?NWsxR05halhOUmhnZEFrTUhLVENxSlM0VVJ6SDJaNGRWT2FFSnlXVXNEVjlo?=
 =?utf-8?B?M1dMcDdXSndYOGdqK1pIK0szSS90aVowU2Q2eUtuR2JFd3hLaGZ1QzIxY2pv?=
 =?utf-8?B?S0RXRUZVdnFUNC9yTk1oVzVJTEVtUTZXWE1LM3ZNYjFjVmhlN0duTGtoVUJE?=
 =?utf-8?B?Qy84Q1kvbEVhMGdERGwwZFRTSmZGRFVCYlVOeVNkMER4V21RY2VRdWpWejRi?=
 =?utf-8?B?VTQ5ZFk0bUNHSW5zRTdXbXRFOFBxcHl5YVpMdlllYng4QzhtNFBGNkc0cHBt?=
 =?utf-8?B?ekRMMHJrOHZtYkUzRmMwSndVZGJxWVI5V1JuV3QyZXMrSktkN2x4L0xISk9I?=
 =?utf-8?B?S1JPVFhISXdyUjBDQWNDN05iZnNsK0p4T1czQWZweXBWbzRiMGFkZ0dndkxF?=
 =?utf-8?B?QjFqR0FURWRYZ3J1aFZEeDZ5bnJjaHhHU2NiL0d4YWwrWXh1SGVxc0dPL1Ew?=
 =?utf-8?B?a2FpTExnc25mY2ZEd09PSFhqd0tCREE0WXdOYnhYQmMxbHg1UGZHVHpsVjRH?=
 =?utf-8?B?UU1HT2x2Q0Y3L2k1OS9pdG53WHdzN1NVSFNCQkxYVXZqSU04VnoxTVRTOTgr?=
 =?utf-8?B?dEZsRnorUGlsODZGenpwVCszRjBTOUhvTzg1L21UcWo0cSs1QTQ2bWQ1dzhI?=
 =?utf-8?B?Tm9QR0ZVUkNRYzJUc3BpeFpPaFNYTm5hZHJnS1ZrK3IwcTNDTU9Cbk9GZE9H?=
 =?utf-8?B?enFWVmVnOVV2NktESENGbTg4K2tDM0JPTjUrS3FiNEcxbStIanBEeUx6dDB1?=
 =?utf-8?B?cTZxSDFxTks5SXVjNjVqRm02empxQTN0ZjZKNld6R3dLV3A2Wm1DeFExY21y?=
 =?utf-8?B?OUtoc2xjWTlXdUR4OW9TcFhyYStqRDl6ak93R1JDOWd0YnNqaHhxcWlHemxN?=
 =?utf-8?B?NzVVYjB4SEptUVYvbnFDTG9qUVp2NDBNcEZEemlwRFowengrMmlyNTdJanhK?=
 =?utf-8?B?OGhpTjc1bXc4SEczSUIrOVhqQi84OFpqWS9XUk4wUmxaYXlHZWUvZlphaDhH?=
 =?utf-8?B?MWRBVk9WQk9najlCMC93c1NGY08wWVdOV2t4cE0xSXBQbXFLT0VtbGZzWC9K?=
 =?utf-8?B?QjdRaVJoaElxRFZpVVZZYVlqWEVtc3dObmVsa1NuSnFwakt4azY2eUxNSFdP?=
 =?utf-8?B?VlNaVEI2UkFCaFJrYkh5OTZlWDZ4TTJISUo0ME1WVkkvQ1NoTm9pK1FZdzEw?=
 =?utf-8?B?UGhPWnUwa2xweGRiSHVzbnZTVzlCaW1FaDlQdmZJa2FMdVJHVlRlSDZQSUZT?=
 =?utf-8?B?R1l3TUpIeGttM09PZ0Jld2hBQ054RkNvUHJTbFZOY28yMHRJV3VvYzBhK3Nm?=
 =?utf-8?B?M1BNeThoajgzZWh1QTN5WHRyczhGdDhwTHhvYkM5L2ppczl1SHN2anRDcUhi?=
 =?utf-8?B?eVRjTXJudlpqVEhqRXRSenJWVEREdmJwRXN2dVQyWkQwbGorQ3IrV29iRktr?=
 =?utf-8?B?VHQvb0V5dklhWUxXN3ZVZFNEUmlrdExzS2MwMVZXSlpCMlpFeUdjTnFuQWVW?=
 =?utf-8?B?N0NBUDJEV0Vaam1pOGIyN29ENUFGSHBNNGZNTkxMSFhTNnMwalVVQURQS0pK?=
 =?utf-8?B?OVNTMXM2UUZaQXg2R1RuMWw2Rk4xbFhpRktRdk5ubmU3RjVrcThBOEZ1UWgr?=
 =?utf-8?B?QVczVTcyeXVOVkFoNU9wYlc0NW1FSHdVKzRkK21MUXdRTnd3cUphN0RLcnQy?=
 =?utf-8?B?N0MvN3pzbGlML01JVHVWZ0hJekVnT2dKNEE2VzFaakp1TUZPT0N0QTliVDI0?=
 =?utf-8?Q?ERN0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af24c7c0-f2c8-4560-1140-08db98772969
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 01:22:56.6337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qnPwAyora7UVuVJUukjzx/XCAUKgnC+DcfwJd2Fl2p6f9Ljw+s37CBwDaVHGzfR8+Zzby25JeQPYRI3j1KO2vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9381
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0gY2xrOiBpbXg6IHBsbDE0eHg6IGR5bmFtaWNh
bGx5IGNvbmZpZ3VyZSBQTEwgZm9yDQo+IDM5MzIxNjAwMC8zNjEyNjcyMDBIeg0KPiANCj4gT24g
MDguMDguMjMgMTQ6MTksIEFkYW0gRm9yZCB3cm90ZToNCj4gPiBPbiBNb24sIEF1ZyA3LCAyMDIz
IGF0IDM6NDfigK9BTSBNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPg0KPiB3
cm90ZToNCj4gPj4NCj4gPj4gRnJvbTogQWhtYWQgRmF0b3VtIDxhLmZhdG91bUBwZW5ndXRyb25p
eC5kZT4NCj4gPj4NCj4gPj4gU2luY2UgY29tbWl0IGIwOWM2OGRjNTdjOSAoImNsazogaW14OiBw
bGwxNHh4OiBTdXBwb3J0IGR5bmFtaWMNCj4gPj4gcmF0ZXMiKSwgdGhlIGRyaXZlciBoYXMgdGhl
IGFiaWxpdHkgdG8gZHluYW1pY2FsbHkgY29tcHV0ZSBQTEwNCj4gPj4gcGFyYW1ldGVycyB0byBh
cHByb3hpbWF0ZSB0aGUgcmVxdWVzdGVkIHJhdGVzLiBUaGlzIGlzIG5vdCBhbHdheXMNCj4gPj4g
dXNlZCwgYmVjYXVzZSB0aGUgbG9naWMgaXMgYXMgZm9sbG93czoNCj4gPj4NCj4gPj4gICAtIENo
ZWNrIGlmIHRoZSB0YXJnZXQgcmF0ZSBpcyBoYXJkY29kZWQgaW4gdGhlIGZyZXF1ZW5jeSB0YWJs
ZQ0KPiA+PiAgIC0gQ2hlY2sgaWYgdmFyeWluZyBvbmx5IGtkaXYgaXMgcG9zc2libGUsIHNvIHN3
aXRjaCBvdmVyIGlzIGdsaXRjaCBmcmVlDQo+ID4+ICAgLSBDb21wdXRlIHJhdGUgZHluYW1pY2Fs
bHkgYnkgaXRlcmF0aW5nIG92ZXIgcGRpdiByYW5nZQ0KPiA+Pg0KPiA+PiBJZiB3ZSBza2lwIHRo
ZSBmcmVxdWVuY3kgdGFibGUgZm9yIHRoZSAxNDQzeCBQTEwsIHdlIGZpbmQgdGhhdCB0aGUNCj4g
Pj4gY29tcHV0ZWQgdmFsdWVzIGRpZmZlciB0byB0aGUgaGFyZGNvZGVkIG9uZXMuIFRoaXMgY2Fu
IGJlIHZhbGlkIGlmDQo+ID4+IHRoZSBoYXJkY29kZWQgdmFsdWVzIGd1YXJhbnRlZSBmb3IgZXhh
bXBsZSBhbiBlYXJsaWVyIGxvY2staW4gb3IgaWYNCj4gPj4gdGhlIGRpdmlzb3JzIGFyZSBjaG9z
ZW4sIHNvIHRoYXQgb3RoZXIgaW1wb3J0YW50IHJhdGVzIGFyZSBtb3JlDQo+ID4+IGxpa2VseSB0
byBiZSByZWFjaGVkIGdsaXRjaC1mcmVlLg0KPiA+Pg0KPiA+PiBGb3IgcmF0ZXMgKDM5MzIxNjAw
MCBhbmQgMzYxMjY3MjAwLCB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUgY2FzZToNCj4gPj4g
VGhleSBhcmUgb25seSBhcHByb3hpbWF0ZWQgYnkgZXhpc3RpbmcgcGFyYW1ldGVycyAoMzkzMjE1
OTk1IGFuZA0KPiA+PiAzNjEyNjcxOTYgSHosIHJlc3BlY3RpdmVseSkgYW5kIHRoZXkgYXJlbid0
IHJlYWNoYWJsZSBnbGl0Y2gtZnJlZQ0KPiA+PiBmcm9tIG90aGVyIGhhcmRjb2RlZCBmcmVxdWVu
Y2llcy4gRHJvcHBpbmcgdGhlbSBmcm9tIHRoZSB0YWJsZSBhbGxvd3MNCj4gPj4gdXMgdG8gbG9j
ay1pbiB0byB0aGVzZSBmcmVxdWVuY2llcyBleGFjdGx5Lg0KPiA+Pg0KPiA+PiBUaGlzIGlzIGlt
bWVkaWF0ZWx5IG5vdGljZWFibGUgYmVjYXVzZSB0aGV5IGFyZSB0aGUNCj4gPj4gYXNzaWduZWQt
Y2xvY2stcmF0ZXMgZm9yIElNWDhNTl9BVURJT19QTEwxIGFuZA0KPiBJTVg4TU5fQVVESU9fUExM
MiwNCj4gPj4gcmVzcGVjdGl2ZWx5IGFuZCBhIGxvb2sgaW50byBjbGtfc3VtbWFyeSBzbyBmYXIg
c2hvd2VkIHRoYXQgdGhleSB3ZXJlIGENCj4gZmV3IEh6IHNob3J0IG9mIHRoZSB0YXJnZXQ6DQo+
ID4+DQo+ID4+IGlteDhtbi1ib2FyZDp+IyBncmVwIGF1ZGlvX3BsbFsxMl1fb3V0DQo+IC9zeXMv
a2VybmVsL2RlYnVnL2Nsay9jbGtfc3VtbWFyeQ0KPiA+PiBhdWRpb19wbGwyX291dCAgICAgICAg
ICAgMCAgICAgICAgMCAgICAgICAgMCAgIDM2MTI2NzE5NiAwICAgICAwICA1MDAwMCAgIE4NCj4g
Pj4gYXVkaW9fcGxsMV9vdXQgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICAzOTMyMTU5
OTUgMCAgICAgMCAgNTAwMDAgICBZDQo+ID4+DQo+ID4+IGFuZCBhZnRlcndhcmRzOg0KPiA+Pg0K
PiA+PiBpbXg4bW4tYm9hcmQ6fiMgZ3JlcCBhdWRpb19wbGxbMTJdX291dA0KPiAvc3lzL2tlcm5l
bC9kZWJ1Zy9jbGsvY2xrX3N1bW1hcnkNCj4gPj4gYXVkaW9fcGxsMl9vdXQgICAgICAgICAgIDAg
ICAgICAgIDAgICAgICAgIDAgICAzNjEyNjcyMDAgMCAgICAgMCAgNTAwMDAgICBODQo+ID4+IGF1
ZGlvX3BsbDFfb3V0ICAgICAgICAgICAxICAgICAgICAxICAgICAgICAwICAgMzkzMjE2MDAwIDAg
ICAgIDAgIDUwMDAwICAgWQ0KPiA+Pg0KPiA+PiBUaGlzIGNoYW5nZSBpcyBlcXVpdmFsZW50IHRv
IGFkZGluZyBmb2xsb3dpbmcgaGFyZGNvZGVkIHZhbHVlczoNCj4gPj4NCj4gPj4gICAvKiAgICAg
ICAgICAgICAgIHJhdGUgICAgIG1kaXYgIHBkaXYgIHNkaXYgICBrZGl2ICovDQo+ID4+ICAgUExM
XzE0NDNYX1JBVEUoMzkzMjE2MDAwLCA2NTUsICAgIDUsICAgIDMsICAyMzU5MyksDQo+ID4+ICAg
UExMXzE0NDNYX1JBVEUoMzYxMjY3MjAwLCA0OTcsICAgMzMsICAgIDAsIC0xNjg4MiksDQo+ID4+
DQo+ID4+IEZpeGVzOiAwNTNhNGZmZTI5ODggKCJjbGs6IGlteDogaW14OG1tOiBmaXggYXVkaW8g
cGxsIHNldHRpbmciKQ0KPiA+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY1LjE4Kw0K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBBaG1hZCBGYXRvdW0gPGEuZmF0b3VtQHBlbmd1dHJvbml4LmRl
Pg0KPiA+PiAtLS0NCj4gPj4gdjI6DQo+ID4+IC0gbmV3IHBhdGNoDQo+ID4+DQo+ID4+ICBkcml2
ZXJzL2Nsay9pbXgvY2xrLXBsbDE0eHguYyB8IDIgLS0NCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L2Ns
ay1wbGwxNHh4LmMNCj4gPj4gYi9kcml2ZXJzL2Nsay9pbXgvY2xrLXBsbDE0eHguYyBpbmRleCBk
YzZiYzIxZGZmNDEuLjBkNThkODVjMzc1ZQ0KPiA+PiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVy
cy9jbGsvaW14L2Nsay1wbGwxNHh4LmMNCj4gPj4gKysrIGIvZHJpdmVycy9jbGsvaW14L2Nsay1w
bGwxNHh4LmMNCj4gPj4gQEAgLTY0LDggKzY0LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbXhf
cGxsMTR4eF9yYXRlX3RhYmxlDQo+IGlteF9wbGwxNDQzeF90YmxbXSA9IHsNCj4gPj4gICAgICAg
ICBQTExfMTQ0M1hfUkFURSg2NTAwMDAwMDBVLCAzMjUsIDMsIDIsIDApLA0KPiA+PiAgICAgICAg
IFBMTF8xNDQzWF9SQVRFKDU5NDAwMDAwMFUsIDE5OCwgMiwgMiwgMCksDQo+ID4+ICAgICAgICAg
UExMXzE0NDNYX1JBVEUoNTE5NzUwMDAwVSwgMTczLCAyLCAyLCAxNjM4NCksDQo+ID4+IC0gICAg
ICAgUExMXzE0NDNYX1JBVEUoMzkzMjE2MDAwVSwgMjYyLCAyLCAzLCA5NDM3KSwNCj4gPj4gLSAg
ICAgICBQTExfMTQ0M1hfUkFURSgzNjEyNjcyMDBVLCAzNjEsIDMsIDMsIDE3NTExKSwNCj4gPg0K
PiA+IFBhcnQgb2YgbWUgd29uZGVycyB3aHkgd2UgbmVlZCB0aGUgbG9vay11cCB0YWJsZSBhdCBh
bGwgaWYgdGhlIGRyaXZlcg0KPiA+IGhhcyBiZWVuIGZpeGVkIHRvIGFjaGlldmUgYmV0dGVyIHJh
dGVzLg0KPiANCj4gVGhlIGxvb2stdXAgdGFibGUgYWNoaWV2ZXMgYSBkaWZmZXJlbnQgKHdvcnNl
KSByYXRlIG9ubHkgZm9yIHRoZSB0d28NCj4gc2V0cG9pbnRzIHRoYXQgYXJlIGRyb3BwZWQgaW4g
dGhpcyBwYXRjaC4NCj4gDQo+ID4gSSBkb24ndCBrbm93IGlmIHRoZXJlIGlzIGENCj4gPiBzaWdu
aWZpY2FudCB0aW1lIGluIGNhbGN1bGF0aW5nIHRoZSBudW1iZXJzIGFzIGNvbXBhcmVkIHRvIHRo
ZSB0aW1lIGl0DQo+ID4gdGFrZXMgdG8gc2VhcmNoIHRoZSB0YWJsZS4NCj4gDQo+IFRoZSBzcGVl
ZCBvZiBjYWxjdWxhdGlvbiBpcyBuZWdsaWdpYmxlLiBEaWZmZXJlbnRseSBjaG9zZW4gcGFyYW1l
dGVycyBtYXkNCj4gYWZmZWN0IHRoZSBzcGVlZCBvZiBsb2NrLWluIG9yIGFsbG93IGZhc3RlciBz
d2l0Y2ggdG8gb3RoZXIgaW50ZXJlc3RpbmcNCj4gZnJlcXVlbmNpZXMuIEkgYWxzbyB0aGluayB3
ZSBtaWdodCBiZSBhYmxlIHRvIGRyb3AgdGhlIHRhYmxlLCBidXQgdGhhdCBzaG91bGQNCj4gYmUg
YSBkaWZmZXJlbnQgcGF0Y2ggd2l0aCBhIGRpZmZlcmVudCBqdXN0aWZpY2F0aW9uIGFzIGJvdGgg
d2F5cyB3b3VsZA0KPiBhY2hpZXZlIHRoZSBzYW1lIHJhdGUsIGJ1dCB3aXRoIGRpZmZlcmVudCBw
YXJhbWV0ZXJzLg0KPiANCj4gSWYgYW55Ym9keSBmcm9tIE5YUCBjb3VsZCBzaGVkIHNvbWUgbGln
aHQgb24gaG93IHRoZSBleGlzdGluZyBwYXJhbWV0ZXJzDQo+IHdlcmUgaW5pdGlhbGx5IGNob3Nl
biB0aGF0IHdvdWxkIGJlIG1vc3QgdXNlZnVsLg0KDQpObyBzcGVjaWZpYyByZWFzb24sIGp1c3Qg
Yml0IGxhenkgdG8gd3JpdGUgdGhlIGNhbGN1bGF0aW9uIGFsZ29yaXRobSwNCkxVVCB0YWJsZSB3
b3VsZCBiZSBlYXNpZXIgdG8gdW5kZXJzdGFuZCBhbmQgY2hlY2suDQoNCklmIHRoZSBydW50aW1l
IGNhbGN1bGF0aW9uIGFsZ29yaXRobSB3b3JrcyB3ZWxsIGFuZCBub3QgdmlvbGF0ZSBWQ08NCm9y
IHNwZWMsIGl0IHNob3VsZCBiZSBmaW5lIHRvIGRyb3AgTFVULg0KDQpSZWdhcmRzLA0KUGVuZy4N
Cg0KPiANCj4gQ2hlZXJzLA0KPiBBaG1hZA0KPiANCj4gDQo+ID4NCj4gPiBhZGFtDQo+ID4+ICB9
Ow0KPiA+Pg0KPiA+PiAgc3RydWN0IGlteF9wbGwxNHh4X2NsayBpbXhfMTQ0M3hfcGxsID0gew0K
PiA+PiAtLQ0KPiA+PiAyLjM5LjINCj4gPj4NCj4gPg0KPiANCj4gLS0NCj4gUGVuZ3V0cm9uaXgg
ZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwNCj4gU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwNCj4g
aHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAl
M0ElMkYlMkZ3d3cuDQo+IHBlbmd1dHJvbml4LmRlJTJGJmRhdGE9MDUlN0MwMSU3Q3BlbmcuZmFu
JTQwbnhwLmNvbSU3QzVjNDZhMDgzDQo+IDg3NzE0Yzc3NjM5NjA4ZGI5ODBmZTc3NSU3QzY4NmVh
MWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMA0KPiAlN0MwJTdDNjM4MjcwOTY2MjkxMTQ0
ODM2JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTQ0KPiBDNHdMakF3TURBaUxDSlFJ
am9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwDQo+ICU3QyU3
QyU3QyZzZGF0YT1sT0dIcEVjd0pDVE1PSEhSYWNWcXlCaWMzdHZYaXo3Rm1EWDlsM29oMnlNDQo+
ICUzRCZyZXNlcnZlZD0wICB8DQo+IDMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAg
ICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8DQo+IEFtdHNnZXJpY2h0IEhp
bGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1
NSB8DQoNCg==
