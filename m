Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DF7C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 10:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BD1E6136A
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 10:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhJTKQp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Oct 2021 06:16:45 -0400
Received: from mail-am6eur05on2056.outbound.protection.outlook.com ([40.107.22.56]:20576
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229771AbhJTKQp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Oct 2021 06:16:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjL1lkbByw38inefww0hVhjXzisFiiuA/hpXBnLWT7nOTaSbyz/gKXRaio6AeHFRDPKslXRbBHiHWoU0BffRRhtEo6p6TCu1T5fvWy1ZiFqf63LlhpIzU4cqNLGXMCp16W0giMu9NEiIgK5CbCJV1vOpb6Ze+g+XIpUwPWLP7ka+aYl8RgwwD4CKvphjWBfuakxNFA1z9wAyoBJUiTxwHnLalX6v0aTEci+pjBYL2MzziWO7rClVrNV76pr/eFTQlk3ejQi4BKlmeBUPgXthPUAA/PA23qbeicQIThv3r8fleWnSHkjsRBsQ0WKjhf4SDTCDrxYX/FXnowgMvsCtSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iStepYrAceWlfC+t1NZmnsdmForSzo+cj1/xVnYW/2Q=;
 b=GwWHVazU5dDUIP1kiBOSW68x8Ju2B42eYsP2Sb3OKxVT6RYKtO9EFjjV8s/aXCkEPy5JdUUYQusAK4NSx8FMIqIXJCZwLQgTWCDA60+TsLak9m0fMS06AmPpcUiGxM5nOHfWsti3kOJhMQ74WwKLlz9kiovJbwqxWhKiuHqW90K2XvfBj2oM+nMPeJiwhjAd4JxWsbAXo1JKHIItp5j4NjhO9pGJiezPpUbb7TCAQXK2rynDYEHccPUkIpG6XqbeBRGwBMq7j1mhRbcK8fcfm1tHuknoHmmQ8AsCi5vAkFmMxnAz3YW47AjDYb3mYkS6w1+yuDd23zLy1cbyXEZMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iStepYrAceWlfC+t1NZmnsdmForSzo+cj1/xVnYW/2Q=;
 b=vet4Q//iulq//HE+VZjnCE5e1bgTsa7drKR8wsq69Tilf8xJ+q7b3MMeP4FlI/fXVcSEqFHzAnouVE0DKS+sDeJLXjxVxeWSo8bp0P2hhNHOeZoQqg/jw2LpSRF6l3Wj128rEv0R8/jw9Mz1FbakNeGNZzw49zvswq4ofqX2V4Y=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DB7PR03MB4011.eurprd03.prod.outlook.com (2603:10a6:5:32::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Wed, 20 Oct 2021 10:14:28 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::65a0:9648:47b:5be4]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::65a0:9648:47b:5be4%5]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 10:14:28 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: rohm,bd71847-pmic: Document
 rohm,clock-output-is-critical property
Thread-Topic: [PATCH 1/2] dt-bindings: mfd: rohm,bd71847-pmic: Document
 rohm,clock-output-is-critical property
Thread-Index: AQHXxY+JJdX8Jutbb0a+1WZK+KZDHavbq2eA
Date:   Wed, 20 Oct 2021 10:14:27 +0000
Message-ID: <263da45f-d648-3c65-aed3-e4ba41927911@fi.rohmeurope.com>
References: <20211020084956.83041-1-marex@denx.de>
In-Reply-To: <20211020084956.83041-1-marex@denx.de>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9dcda5a8-7058-4c10-0402-08d993b26669
x-ms-traffictypediagnostic: DB7PR03MB4011:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR03MB4011E23CC12B3D282F0C3CDEADBE9@DB7PR03MB4011.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pgw124xvN2heMgLZgohYIqyl7mxkMK1fD8RDh2haxCgumReLCzauJe4Pam0C23nxFBN6SCwHSingXHQ7/Yuqx6XUo48mNzGOhgKNUVikJCr1wITZYOIr7b7jAxY4tsAyCsOf7SWIDES9VTSUoXHgP5H7qJQsPakn4noYtEEgLyYS2o8XCEhEKNDNVWrXwKxCMf1Vsic2f1rfNE7gsUQZAzuoZTH5aFpIbYYiYlcXSPbOzQH7t/HYlu0gc1X9RY04IBGzl/VG1XiXLuicx5W9KplPujNpnw1aY9FIsfqxkjE1H6bztHxGIF9aktLT1noOAIkPzrTXPzIWLwa2302vHUADJeukmCsLeLdd9XvfDwtSQNNJPoJvhUuDKEPmrOFyS5+JAiOw9Xc/YhxPRON27mXFJTNVZtAJ6zAzzOOaNUQ7XHGPl1yArR2GJD5JrEN2iBrwqkOsGlxdbsaDjriVSFcX1tVIIs/EdEGKmX3hEbE12pHSRWNUyAuEra1pEwYR1JEHPEKtIBxRF+NNlTtz4QI3X+nnq8yjZI3BoWHNyxE1bHwwNYNFvuTrCYpsmtSkGLXKbM47RDQElho5AaSxsXSas6mR3lp2VfvMlQJCi719amZC8NppWJLOGvGfFMr536FUn2cGHnoeRVH5vg/wsz2tiPj+WHNO0ffvLd5gKhlVOwuqkwFzmNGxkZXX7nkvBWkH7+zWG3+R7Jnsfg/zsUmu1Xb3GPzVS+4Osrxym2/Bo5B60hHRpE5XEKB+wDQ2js2ojCva4ZMQ/WX2AQVnWg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(66446008)(4326008)(66476007)(316002)(76116006)(107886003)(2616005)(71200400001)(26005)(66946007)(66556008)(5660300002)(110136005)(38070700005)(8936002)(83380400001)(91956017)(64756008)(2906002)(122000001)(8676002)(38100700002)(6512007)(508600001)(54906003)(53546011)(86362001)(6486002)(6506007)(31696002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVRmaCtIaGMwK2hQdGxybXdTWVNBWWgxTkFoVDZuUnV5NXZBSmVFNFgxamJr?=
 =?utf-8?B?UUlmWEhnZGpEd0tnMkhiL2pxVUdYVmJ5OHNBc0ZNN0MxVnNaR1E3ZkJhSmNo?=
 =?utf-8?B?cDRlajZaNXJRTmg1Q0pQOWtkVU1RZ1V4TnNtN2xPQWxpSDFRSjNKM25NUUpa?=
 =?utf-8?B?OS90a1FZekk0QytJOHRURHFOdFYyV3hidGkyOFVCT1VWc3l4Rzh5NUwrUVRa?=
 =?utf-8?B?R29VUzNsU21ha3VTSUladzBHdlA4djBNK3JON3pRZ0U0VzZIWUpEZndNWmVw?=
 =?utf-8?B?aDNiM3RJaUhJeG50OE5KbHhGT3hIT2p5U1lMZUhwN2Q4cTU0cWdPcEk5QzJr?=
 =?utf-8?B?QkRSa3hpNndCUWkwYWRhL0x2R3NsV2JUN3dDTm9qcEhPMU5tRDlrSmZSUDN0?=
 =?utf-8?B?S1RBNEhLbmowZ3lwaTc4RmRvOEFiT0xOWW5tYzUxQlJHNjNzVVVSd2ZTVWdv?=
 =?utf-8?B?dm1aZlRoM1pGSjNKVUdBc2lyN2Y4N3RqdWJBajZVeGlOaU5xbWU5OExOcW1Q?=
 =?utf-8?B?cmI3TzlEejQwRzJsNk0vQmZPZy8zOXFTZFFUUUU2Z3NMaVh2NmpZS2UvaUdG?=
 =?utf-8?B?ZlphK1JPS3hhQXIzdWVuR2JOQ3IvUkQvRE5pcml2WnI5UTQ0cG1LUnBZQjZS?=
 =?utf-8?B?UFhRWWdiWVBXZUhsTlhoRmVPZzJVeUsrY0tjWkgwOEo0cXgzQ25BTFpZVnhs?=
 =?utf-8?B?Nng3b0xOM3pTeWQwRDdTYVNmVDNkMmNqRGozZFlWY3Y0cGltKzBFREtsRS9G?=
 =?utf-8?B?R0swN3pSRU1zZzA3TzI4RHR6SWd0YU5xOHdNTnpPMDg1bTdycDh0Nks5NjdU?=
 =?utf-8?B?Yzg3b01JdGQ1bjJLZzNEb3Y0ellDTkVVWG9zU0loM0E1T3l2SEhmbkVYdlVE?=
 =?utf-8?B?ZzV0Yll3SktqSWlNcWFvV004cE5mcndjWC9aWmh6K2ROODg1YUJmYVFqZWVY?=
 =?utf-8?B?dU1iaG1hdGtqY0kwNFRxZzBNeU42MmhpNGtodXo1OWFhcDk1ZHJWRnhxaGdS?=
 =?utf-8?B?V1dncHM1NDl3Ujl2TVBCeFdGcHVhMlkzU1I1YkVLQkZubTMzelkwa1R5dFUz?=
 =?utf-8?B?eWlGS1dHMnN5bFNHeE1IYUFFOFlOM0FTTU04RkxpS0tiVkJjWUdLUVArUDds?=
 =?utf-8?B?NmlmanF2TVNrTzNjelZUQk5ubGlVTnl3MnJTTDBIMTZ2ZHhPekpGTGo2bDUr?=
 =?utf-8?B?OWc3eGlzNUUvL2x3L09uTDl3eUZyRVRmVDg4OG1aZmN1c243czZHMjNIVlJI?=
 =?utf-8?B?eVozdjFpWHhJN2IrVm85SkZCc3BBRVBxaXlmRytBaUlBU2EvWGV6ZUVTL3Qw?=
 =?utf-8?B?cGxhNjV3UVBtZmZreW55Q0NRQ1c1aDdxbFBXVGJ5clNpQ0s3dWxMRW1UcGVi?=
 =?utf-8?B?TGJ2cEZrSFV1Nk9uNFJ6aGV5VnlvMzM3OC9IRVVucHNwMTJHNlllaktrV2xs?=
 =?utf-8?B?K2Q4SnZxWTREOVpqZWJyZmpwVFA3ZU9WekFWSWFoeUUvaEllZ0NMMVc1ZHJ4?=
 =?utf-8?B?OHRrNklnTFVIa2tCSVlrVDhuVVdEczZ0aDVjN1FIV3BSTUlNelNDaHcxN3h3?=
 =?utf-8?B?ckRjVmlZYk5jY2J5Rzh2OHFKN204MFFyRXVoMU9peDJ1OFl5OS9zN3BsM1Nn?=
 =?utf-8?B?azUvODl5cGpwaG8xdFFFLzRmbmQrRldQaWJ6S1d3QTJsT08xRm1SWUJtcm5N?=
 =?utf-8?B?d1JvaE9yc2xxdmxMZHUrM0E3QUF1RzE2Szd5MlVRbmhncVZvQ0g0UFpJWFFm?=
 =?utf-8?Q?DDHOMTuCx9q6wvMiNs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6B56E00E9C702429E9059843B8C4B57@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcda5a8-7058-4c10-0402-08d993b26669
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 10:14:27.8647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Matti.Vaittinen@fi.rohmeurope.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4011
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgZGVlIEhvIE1hcmVrLA0KDQpUaGFua3MhIEkgbGlrZSB0aGUgaWRlYSBhbmQgYXBwcmVjaWF0
ZSB0aGUgaW1wcm92ZW1lbnQuDQoNCk9uIDEwLzIwLzIxIDExOjQ5LCBNYXJlayBWYXN1dCB3cm90
ZToNCj4gQWRkIHRoZSBwb3NzaWJpbGl0eSB0byBjb25maWd1cmUgUE1JQyAzMmtIeiBvdXRwdXQg
Y2xvY2sgYXMgQ1JJVElDQUwsDQo+IHNvIHRoYXQgdGhleSBhcmUgbmV2ZXIgZ2F0ZWQgb2ZmLiBU
aGlzIGlzIHVzZWZ1bCBpbiBjYXNlIHRob3NlIGNsb2NrDQo+IHN1cHBseSBzb21lIHZpdGFsIGNs
b2NrIG5ldCwgd2hpY2ggcmVxdWlyZXMgdGhlIGNsb2NrIHRvIGFsd2F5cyBydW4uDQo+IA0KPiBU
aGUgaU1YOE0gUlRDIFhUQUwgaW5wdXQgaXMgb25lIHN1Y2ggZXhhbXBsZSwgaWYgdGhlIGNsb2Nr
IGFyZSBldmVyDQo+IGdhdGVkIG9mZiwgdGhlIHN5c3RlbSBsb2NrcyB1cCBjb21wbGV0ZWx5LiBU
aGUgY2xvY2sgbXVzdCBiZSBwcmVzZW50DQo+IGFuZCBlbmFibGVkIGV2ZW4gaWYgdGhlIFJUQyBp
cyB1bnVzZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5k
ZT4NCj4gQ2M6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUu
Y29tPg0KPiBDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPg0K
PiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IFN0ZXBoZW4gQm95
ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+
IENjOiBsaW51eC1wb3dlckBmaS5yb2htZXVyb3BlLmNvbQ0KPiBUbzogbGludXgtY2xrQHZnZXIu
a2VybmVsLm9yZw0KPiAtLS0NCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkL3JvaG0sYmQ3MTg0Ny1wbWljLnlhbWwgfCA1ICsrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvcm9obSxiZDcxODQ3LXBtaWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcm9obSxiZDcxODQ3LXBtaWMueWFtbA0KPiBpbmRleCA1
ZDUzMTA1MWExNTMuLjI0OTdhZGUyYmJkMCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yb2htLGJkNzE4NDctcG1pYy55YW1sDQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcm9obSxiZDcxODQ3LXBtaWMueWFt
bA0KPiBAQCAtNDEsNiArNDEsMTEgQEAgcHJvcGVydGllczoNCj4gICAgIGNsb2NrLW91dHB1dC1u
YW1lczoNCj4gICAgICAgbWF4SXRlbXM6IDENCj4gICANCj4gKyAgcm9obSxjbG9jay1vdXRwdXQt
aXMtY3JpdGljYWw6DQoNCkkgd29uZGVyIGlmIHRoaXMgcmVhbGx5IGlzIHNvbWV0aGluZyBzcGVj
aWZpYyB0byBST0hNIElDcz8gRG8geW91IHRoaW5rIA0KdGhpcyB3b3VsZCB3YXJyYW50IGEgZ2Vu
ZXJpYywgbm9uIHZlbmRvciBzcGVjaWZpYyBwcm9wZXJ0eT8gSSBhbSBPayB3aXRoIA0KdGhlIFJP
SE0gc3BlY2lmaWMgcHJvcGVydHkgdG9vIGJ1dCBpdCBqdXN0IHNlZW1zIHRvIG1lIHRoaXMgbWln
aHQgbm90IGJlIA0KdW5pcXVlIHRvIFJPSE0gSUMocykuDQoNCkJ5IHRoZSB3YXksIHRoZSB2ZXJ5
IHNhbWUgY2xrIGRyaXZlciB3aGVyZSB5b3UgaW1wbGVtZW50ZWQgdGhlIHByb3BlcnR5IA0KcmVh
ZGluZyAocGF0Y2ggMi8yKSBpcyB1c2VkIGJ5IGZldyBvdGhlciBST0hNIFBNSUNzLiBBdCBsZWFz
dCBieSANCkJENzE4MzcsIEJENzE4MjgsIEJENzE4MTUsIEJEOTU3NiBhbmQgQkQ5NTczLiBTbyB0
aGUgY29kZSBjaGFuZ2UgaGVyZSANCmFkZHMgc3VwcG9ydCBmb3IgdGhpcyBwcm9wZXJ0eSB0byBh
bGwgb2YgdGhvc2UgUE1JQ3MuIEkgd29uZGVyIGlmIHRoZSANCnByb3BlcnR5IHNob3VsZCBiZSBt
ZW50aW9uZWQgaW4gYWxsIG9mIHRoZSBiaW5kaW5nIGRvY3MuLi4gVGhhdCBjb3VsZCBiZSANCmFu
b3RoZXIgYXJndW1lbnQgZm9yIG1ha2luZyB0aGlzIGEgZ2VuZXJpYyBwcm9wZXJ0eSBhbmQgZGVz
Y3JpYmluZyBpdCBpbiANCmNsayB5YW1sIDspDQoNCldlbGwsIGp1c3QgbXkgMTAgQ2VudHMgLSBJ
IGFtIG9rIHdpdGggdGhpcyBjaGFuZ2UgYXMgeW91IHByZXNlbnRlZCBpdCANCmhlcmUgaWYgeW91
IGRvbid0IHRoaW5rIHRoaXMgc2hvdWxkIGJlIGdlbmVyaWMgb25lLg0KDQo+ICsgICAgZGVzY3Jp
cHRpb246DQo+ICsgICAgICBOZXZlciBnYXRlIG9mZiBDMzJLX09VVCBjbG9jay4NCj4gKyAgICB0
eXBlOiBib29sZWFuDQo+ICsNCj4gICAjIFRoZSBCRDcxODQ3IGFiZCBCRDcxODUwIHN1cHBvcnQg
dHdvIGRpZmZlcmVudCBIVyBzdGF0ZXMgYXMgcmVzZXQgdGFyZ2V0DQo+ICAgIyBzdGF0ZXMuIFN0
YXRlcyBhcmUgY2FsbGVkIGFzIFNOVlMgYW5kIFJFQURZLiBBdCBSRUFEWSBzdGF0ZSBhbGwgdGhl
IFBNSUMNCj4gICAjIHBvd2VyIG91dHB1dHMgZ28gZG93biBhbmQgT1RQIGlzIHJlbG9hZC4gQXQg
dGhlIFNOVlMgc3RhdGUgYWxsIG90aGVyIGxvZ2ljDQo+IA0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0
aSBWYWl0dGluZW4NCg==
