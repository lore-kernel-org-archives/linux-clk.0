Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B45AC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 03:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358470AbiFPD6g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 23:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358496AbiFPD6V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 23:58:21 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28FD127CCC
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 20:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yt7I1GInD9aoSgkbs9EjOCJ7KWTfCcgF6k4PF5wJjWGUpznNgashg3ZcHurcFwt1e6qJxavg1DBl+5TfGOJkuMq7joY+vhqgB+iShRouWhGFxc4TKdFfYa5VfrQZ05fp0tsD+nUmuwz6meU1I6rLB+aIE6qHLRBKg8o/CZGNFZMNtPNVd4B1REx0oUJoTiT1LKJDL1dioUyO70oCoyCL9ugCjkL72S2L29gFaXl9Z1CZWMlR8mk3PxZ9a7sZ7Q/O9Hc2hnk5th+U1ifqGLyBclDdSW4JjgjSFEUHx2fAUnEvQ3Y9f70kxNELyuDdstYBsiMgVm+kYiqczE/VNe+UDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfl7lLXHtYScComCFcOC1oDksqY3TdQ39P8hHEDIyOQ=;
 b=UkeLlT/N1OR/hr14gisKdKDEbEDG7u74uhyxU3CBWGQGknmi0AcWLua5aQ1SKuKzt+DsogzK6FwC+3zy3TIU184tZmJ54XvdrtnIxBNzdUPR14SdEBQsmmFYJiWZg0BiVH04Al+ubX7eWOw0wVg05cTJGblY+BcjoubMNzZTCclnrPdAvQ5DfHpfMO/OPDUV6qkD8pgMC/rO2Ew8+nCu/z4r1vy7G7DIACKQFgJPr3EccXxhSHqDP0y5foeJmV34PwOomSMA7SnhJyq/vZNeVma3wHOZudC3vaxL7syCO70KqJnjTP435aVgnkiV++jsBUUvNwrRCl7O0iMMQBuIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfl7lLXHtYScComCFcOC1oDksqY3TdQ39P8hHEDIyOQ=;
 b=CR6mshd9eNWKpaDXU6eE38lPhp7LxRCum+UGJ42fNS8VPeUGRMnJuc90iGluXil/ELw44sxUc6PS5plz94r9aLBH2Qsa4ScQ8prz0koIb3/UDA6189WJ6gwYLe7G99jZuufyt4YpzzRKmNEduyqW1qt7n5iSCUvtnCkrQh5x1UQ=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB7723.eurprd04.prod.outlook.com (2603:10a6:10:20a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 03:58:10 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a892:e4a9:4769:13a5%7]) with mapi id 15.20.5353.014; Thu, 16 Jun 2022
 03:58:10 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     Abel Vesa <abel.vesa@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 3/7] clk: imx93: Correct the edma1's parent clock
Thread-Topic: [PATCH 3/7] clk: imx93: Correct the edma1's parent clock
Thread-Index: AQHYfASplrMDjlWIH0eSncVW7XO8d61RCLyAgAArwACAAD180A==
Date:   Thu, 16 Jun 2022 03:58:10 +0000
Message-ID: <DU0PR04MB9417B711D79B0DE67D425E7B88AC9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
 <20220609132902.3504651-4-peng.fan@oss.nxp.com> <YqpRjwTVZU12H4Gb@ryzen>
 <20220616001604.D4C3CC3411A@smtp.kernel.org>
In-Reply-To: <20220616001604.D4C3CC3411A@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9076bfe4-1d04-4390-48e8-08da4f4c6deb
x-ms-traffictypediagnostic: DBBPR04MB7723:EE_
x-microsoft-antispam-prvs: <DBBPR04MB77231B358318C82DD877A21D88AC9@DBBPR04MB7723.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I/cAP3WUjKQ5X3amTr3IKIBS/RmDtrtwcUCV4Q1Fnoz9FFxpt1qPMQeA/JaquinBlYuE7Ty7ALlQJp1BXkFJsUWOCZxff94d8NVJdvHlwZKmj9OB1weoLXDUh4c/q63iD9WV2ssRWHDbrFcA5HFDjzHqC9yeDkqVjDjjWZ2sMWyAlBiLxuFRHMb/x/So4jiCg8WoX/T6f5n0pzXgZBA2cRXbM2gVQzcO2G6MeW8kcQ2sH/9qyM7IddbXZj6/BjePEH5Vo+1rsVGeiUlNUbpCBc4GrTcvFn3JIG5pvnnSDiSSkPqQCfq7BFnHc/5Xx5NFcKvEU6O/x1IDNJRLTEiBUp27F5lIxHhsFwPw3X3q98wif0c57dTxG+MWXkbJscxf49qr3nRoxgUJCnTWFdSjK7hil/WRZiMxMm6mojg45EWCEKv1hIqtXSIRe1thWdLH09S8gXwUB6a+jJNZhBKksUCDEFZF9b5VBORcdD0HsNFiAIp53roLRJT6Ea05ulfn6PQfY0NBo6iN4XDUyV71zk5eGW5SXpPczFrBVZ7phrEAiFbrbilYzkhWEvig9DlifrqanXYFPVDsb0MOFgFJPXHPshBv7QSkSt97r5v6bPvT1UwOdRf6N2+dAhHd5oGXQss9TklXxUkKXwRQSrUNNA7TgeJTCfPHVzYXbZzGrLNm0zr7xC3jU7pZoaLxSpHQiMeo8Nu0SwC25O/91LvmTA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(38100700002)(53546011)(33656002)(55016003)(6506007)(7696005)(86362001)(4744005)(71200400001)(44832011)(52536014)(5660300002)(8936002)(54906003)(66946007)(76116006)(122000001)(2906002)(66476007)(66556008)(508600001)(64756008)(66446008)(83380400001)(38070700005)(316002)(26005)(186003)(9686003)(4326008)(8676002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmJJSjgvVjZrT2pjUGlsTGRKbzNzUGpQQTZNMFphblVpa3Avem9JMklyRnB0?=
 =?utf-8?B?T2pGNmZhN0NHeHBpSHoyRDFZUnFxbVpRVlVOcmVPS21ET1ZhUW1sNitPZlEx?=
 =?utf-8?B?aDlpdFNEYnVWenQrMENrTVdUOVp5QTBpVGtNL2VhS0g4c2VJSmdSTERITDRZ?=
 =?utf-8?B?NlUyM0xBbDJJLzZzRkxHVDhueXNFQVQ4YW9BQ3B1RktxdSswa0RMR1NGRlA5?=
 =?utf-8?B?WFQvZkxDOVdmcFJrZzRpbWdmWW9XdkRBVng4TFVqN3pEdlRKaWZyWUg2cEl3?=
 =?utf-8?B?K0dacUxjZEhCWnd3Y0V5dVZoSUNNcmVBQy95TVhPbThtSG0xZCtmOVI5Z2N4?=
 =?utf-8?B?SUxUZFdvMGlDWGk3cFN5Snc0cWo2ZS93b2hwVnByd1k5SWQxUXVtZjIzNm5S?=
 =?utf-8?B?Z3BVZFNSY2kzR2FkVXpBeSs0SjhXNUp3ZDJubFRHUjlVeW1DSTlNVHBhSGxw?=
 =?utf-8?B?Z0RPMDNiSUhlSUdrYTBmYXQrRUJDdjd0clNRWDY2L0FrOWxEVHZkUTZscHBR?=
 =?utf-8?B?ZUsyMXREKzhyWGpTYWJFNm53YkRnRWZraGlHVDczUi93RlpBYUwzT1ZOU3Nm?=
 =?utf-8?B?d1BGdEFYRk1Ebmo1VzE4WXhjZS9ScjVBYjR3RlRLRFVEQjF2TVAvRDJVWVRB?=
 =?utf-8?B?eEVlME1ib1VtVnJPOU4vcjNlRWIxSm0zdHpPL2grcjE2VWJIejNoOGptRWZv?=
 =?utf-8?B?Z3dFWG9YYlFGcXgweEM1dWNQV2JLV2lJS1VrZFhyRjgvQkphSkxSK010bFoy?=
 =?utf-8?B?VS9FM1pvcFhiazZqOUtkNmRwK3pzV2VBMWNTM2F6R0FoM2JiZkxjcnVHa3Iw?=
 =?utf-8?B?dStVR3pNNGdKRkJMcnh5Q0NKVEx3Z2Q3Q3dhVGY4QlNUT0xRdDlEZFlON1Z3?=
 =?utf-8?B?cnRoajdnYXBwenk3alF6TG81eDUwbTJsSW1vVlVtdVEzcnk5bkovZTRIenNL?=
 =?utf-8?B?V0JWU0RmZXNkSEZXUHBJWEdSZFFtMlhIa1lMejhTaE5KQUtJZ3JQK3FEaGRs?=
 =?utf-8?B?TEdtTit0ZE13ZjhvVHNObXY4MFhRZzRPdVZoZC83Wi9yMm45MDZoZjVaaFlh?=
 =?utf-8?B?Smhoa1RUNTV2UHR6S3hOeEVicmpBOXFUd0JQK1A5UUNUTDBIR0dJM2hoV09Y?=
 =?utf-8?B?NkZsS25qdkZFSmVoVTZwUHB3YXNUaE53eCtjOHdtVGJIdnB1c1ZiWGlubDJE?=
 =?utf-8?B?NHVBcERTQjhSbEFxRm1tYndqTTR2b0NCMmVFMUdrUGs4cWN3SzdocnpJNUto?=
 =?utf-8?B?WE5waSt2MHBlRXRWM0VoeUlpVTcrL3NyYkhVbW56c3FUU3JmVFMvR2Eza0NH?=
 =?utf-8?B?OXJPUW9iNTViUlRrS2FRKzhoOGVOaE95aXhldmhlL2hXdjhkZXBTM2VCOTlQ?=
 =?utf-8?B?cWptTUtXejBqaExUemd5UEpZS2dORjJOVWtEWFFhcjdNeHdvOExBbURWQll3?=
 =?utf-8?B?NkVNRDFMbjVHL0J2N2t4MzVtdUFMTDd2Qmg5YkFxS1NRb3orODRKeXNJUlgw?=
 =?utf-8?B?VDRYZGU0V1VEMCtGQUpwVlRmNFd4OWNpVHRqVjlyQVZ5K1BQNisxNDhFOWt6?=
 =?utf-8?B?TVJ5dDVtRnJ3R2lXTEVjeU4vS2hqWU11S2pjZERqaGJlQkFBWVBUb1RuRnNx?=
 =?utf-8?B?QWpUbTBRQzNOUmNXN2V3VGUzMFlMQkFwaS82WGxFcllhb0Y0blN3dmpEekFE?=
 =?utf-8?B?TGx4ZnFIRWxvM05OQUg4clA1bEtvTGdoWkI1RWpTRldIS25pVnBIL0pSUmJZ?=
 =?utf-8?B?MjM4OVlxazFrb0lEMDRpdWlXeFRaODJOYW1EOFg4VFhIUGluMEQrN1RlUlN1?=
 =?utf-8?B?aDZvbUlLUkJkT0Y4OXoyT3h6a2czOEMrWDBvMUpMNm1NS2RKa3k0R2piQXFE?=
 =?utf-8?B?SHVtU0l5OTVNd0FQUTBjdmxJMGhEWk1DZzlnbzBYY3NHVmNydlQvaFhQUjBo?=
 =?utf-8?B?T2FPTWM5QmFLcGRiWkttbFZFbUo3RFR2Qkx2dkt2NjMvc2RPcm9LNHp0V1M3?=
 =?utf-8?B?OE5sRXViV1pTcVM4aS9WVlNqT0pNSVJrazBER3QwSEZJUVE5Y2NVOU9oN1l0?=
 =?utf-8?B?cjc5VldyS3RjYkZWMXQxTm9uUlVJcTZUWGUzU3FKWXJpUW93a2hEQ1djbUk1?=
 =?utf-8?B?WWJsZDJGRDI3Tm9Fd2ZnK0VZV1hHRHpTQ29uZlhTS01zU0FZVHhaZUZtTEVX?=
 =?utf-8?B?U25HVzNHbE5xRWVST0lHWkFrYjZCRTRCY2FZRmQ5KzRLSUVmN0V5OUpOdUdQ?=
 =?utf-8?B?dllBbVpIKzM0TEJEZTQ1TU5sZGFKRlAzeDArVjJqY0ozSWdIb3p4OUJuTDA2?=
 =?utf-8?Q?rd+AJfaZKo3qbHCHlp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9076bfe4-1d04-4390-48e8-08da4f4c6deb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 03:58:10.6279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qi7WpRyXSt7Sy0iCqxDs5EAn+VBxiXT5yV2Hf74Fi2zexjQR1MDmx7DQ6+te500jIt/IpH7yT71Wr9+DPXsShw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7723
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDMvN10gY2xrOiBpbXg5MzogQ29ycmVjdCB0aGUgZWRtYTEn
cyBwYXJlbnQgY2xvY2sNCj4gDQo+IFF1b3RpbmcgQWJlbCBWZXNhICgyMDIyLTA2LTE1IDE0OjM5
OjI3KQ0KPiA+IE9uIDIyLTA2LTA5IDIxOjI4OjU4LCBQZW5nIEZhbiAoT1NTKSB3cm90ZToNCj4g
PiA+IEZyb206IEphY2t5IEJhaSA8cGluZy5iYWlAbnhwLmNvbT4NCj4gPiA+DQo+ID4gPiBGb3Ig
RURNQTEgaW4gQU9OTUlYLCBpdHMgcGFyZW50IGNsb2NrIHNob3VsZCBiZSBmcm9tIGNtMzNfcm9v
dCwgc28NCj4gPiA+IENvcnJlY3QgaXQuDQo+ID4gPg0KPiA+ID4gRml4ZXM6IDI0ZGVmYmUxOTRi
NjUoImNsazogaW14OiBhZGQgaS5NWDkzIGNsayIpDQo+ID4gPiBSZXZpZXdlZC1ieTogUGVuZyBG
YW4gPHBlbmcuZmFuQG54cC5jb20+DQo+ID4NCj4gPiBUaGUgcmV2aWV3cyBkb25lIGludGVybmFs
bHkgZG8gbm8gY291bnQgaW4gdXBzdHJlYW0uDQo+ID4gSSB0aGluayB0aGF0J3MgdGhlIHJ1bGUu
IFNvIGRyb3AgdGhlIFItYiB0YWdzIGZyb20gYWxsIHBhdGNoZXMuDQo+ID4gS2VlcCBvbmx5IHRo
ZSBTLW8tYiB0YWdzLg0KPiANCj4gSXMgaXQgYW55IGRpZmZlcmVudCBjb2RlIGZyb20gd2hhdCBp
cyBzZW50IHVwc3RyZWFtIGhlcmU/IElmIG5vdCBhbnkgZGlmZmVyZW50DQo+IHRoZW4gSSBkb24n
dCB0aGluayBhbnl0aGluZyBpcyBzdG9wcGluZyB0aGUgcmV2aWV3IHRhZ3MgZnJvbSBiZWluZyBr
ZXB0Lg0KDQpUaGVyZSBpcyBubyBkaWZmZXJlbmNlLCBJIGRpcmVjdGx5IGNoZXJyeS1waWNrIGRv
d25zdHJlYW0gcGF0Y2ggdG8gdXBzdHJlYW0sDQp3aXRoIG9ubHkgYSB2ZXJ5IG1pbm9yIHN1Ympl
Y3QgY2hhbmdlLCBkcm9wcGluZyB0aGUgSklSQSB0aWNrZXQgbnVtYmVyLg0KDQpUaGFua3MsDQpQ
ZW5nLg0K
