Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFE0C64E7A
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 02:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5614720C56
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 02:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgLBCxN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Dec 2020 21:53:13 -0500
Received: from mail-vi1eur05on2065.outbound.protection.outlook.com ([40.107.21.65]:57952
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727590AbgLBCxM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Dec 2020 21:53:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRdAbGFzf/033n0VRMZxCVcvMwOEoH5PGffLWxl7Uj2XXpu3hsZu00zMRd1AVJABbPlkqDh3lanWc5dZpVA9rsnMp9rU/z2MqXPHD9jK5zlvy3Z03mHxwyB5ANjJI9tabZrOtOR3TnS2KCuCCzfbQdum80K+xAJfOGDA0HG2McJnBP/7Eijy9ieZjli5eF0U0ycTebitLXlJIguDpNuwgv3xQyFcfwLLUbiAkFB94DB2xNJ1pv54Lvk3whtGqQaEZPf2YFcAqzVyKlFdah3wswXxV7lKU78k9qn+XpdqSvDSSbB8qabhqubRrC20B6Ywu8P4AF9Mtcx9Bb0QwzxLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxtZM08P0OmN76iylMM+mbuEJs4GA67+3ieEkNAJszI=;
 b=W4/iwppCckwALN0Z6pyn34dMjy0TPiC9yKGC361Z3QpVr2N2kb1qGgF3wqr+JXlGbFSKSv6Mfu57kKzMa55NjNQhdnrnDTQKAH/bKZBnSeQsIFhul+LDZs0H/l7gyFYEHdsKvLEOJM09vlcn3qxiQ6Sxe4Loz4nD10i2nWECIwf6NvVC/7HQuFkNNOlKzwb/Hkvh70qgPaC7DtW/WJquXElfRm8NCdeRK4REwth3H5giEAM3Q8hwNcUkiM0/8HsAwg6jtQmMOhZ9L9XZ+vaGOjhRqlcOw5t8llkzVTvRZVngNjQIDidourMEwSaj66L9BhGS40ys3p2ctPeRgqYFAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxtZM08P0OmN76iylMM+mbuEJs4GA67+3ieEkNAJszI=;
 b=PyheRm97rz9+OqfHIiqDYcx3Ynav4D+pm9tLjuSk6dRsSNcWrOlVDKGe9l8EFWfY0+nzACQTf9abYRGfvkqvlacnDSTnXX2AP3+IF1pXutUSL+lEBczCgcUy6E9V3Ns1f5OUy6QQ5T56cjhXq/YgrKxBW/KLeTSUrnHiciBUCjI=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AS8PR04MB7494.eurprd04.prod.outlook.com (2603:10a6:20b:23f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 2 Dec
 2020 02:52:24 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 02:52:24 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "sudipm.mukherjee@gmail.com" <sudipm.mukherjee@gmail.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: RE: [PATCH v2 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Thread-Topic: [PATCH v2 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Thread-Index: AQHWxvey8YRvcGr/J0utiKv7VLIQFanjHfjw
Date:   Wed, 2 Dec 2020 02:52:24 +0000
Message-ID: <AM6PR04MB49663F3412239E39BB078FA280F30@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201130084624.21113-1-aisheng.dong@nxp.com>
In-Reply-To: <20201130084624.21113-1-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ad487e35-f9fd-4345-68ca-08d8966d4c18
x-ms-traffictypediagnostic: AS8PR04MB7494:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7494740B501635D9DE223F2C80F30@AS8PR04MB7494.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hCrB4vKvPz4ACk0itTs9k6HUzDtoJPHkgMw2U6WDhX06DmA93TrT6ZtGXE0+CPuMSA70yPdhnZold0SjxDCrDAMPeHe63AmqRj2NPZdBGqmD62ELVUAxFrqpnwx4/AlIKbOHR39OSwG+r5db3d9zZCqilUufbU12ajkfwGbokUaQK1benHSaFusN9Bqio2y15OqdItnxWQnToWNcHykC04vX6cN8xb5ChAJICd+zOJax3l/8bNhWYazTy9Od7tGtqfxI+r1U1/ZFXLIh8MgkZw/WHqMe4138focF+0QqA5ouc+j/n2fSxJJR08X/0aRgH94f7DwG4P/j7d/WYIicqQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(7696005)(55016002)(71200400001)(186003)(66476007)(64756008)(66556008)(66446008)(66946007)(4326008)(2906002)(9686003)(6506007)(478600001)(26005)(52536014)(5660300002)(86362001)(8936002)(76116006)(316002)(54906003)(110136005)(33656002)(8676002)(44832011)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NUdyRVRJcjczR0t6RGRYeVl2RnFIdXNpZ1A2NkFvaG9DOTViOFdqdHRoeDJs?=
 =?utf-8?B?NDVqdk9nM1V6UVc0WHlYaTRDRjFRZ0JGYldiZ05IOHZlS29WVy9ScFByRmEv?=
 =?utf-8?B?ZlVqcVBJVWVGK2hzOGkzaTQzdlpsVDhnVGtuYzV6VG01VUJlK3p0WGJId3lv?=
 =?utf-8?B?QVVkdnlLcTFWQ0dqeEFiRGNqdVRKOXlnNXZrR0MrNFZKZUlUREhSdE93d2dI?=
 =?utf-8?B?SnREdDFlS2RzN2RXZU1IaGFEQWduODB5S0xDakNwazVheGZWeHJ6WVNIRFh5?=
 =?utf-8?B?eTBuZ2hRQmdnaDdPK2VaYzBpMnk5MURVYmNzZS80M2p1OUFSdkxBdnNzV0VJ?=
 =?utf-8?B?Yk5RU1kwcFV4aFdqMUE2dGlxUDhKNkFIeVYrZkFIajdaY0pPRndlbk9SKy9Y?=
 =?utf-8?B?QW9hVnUzZVVRK0V1Y00wVEFTRXdjYm56TkxxWE1VVlNtV3Frc1BPYjBJd1ln?=
 =?utf-8?B?cEZEWXFMRFBnODQ3NXlocHBQVkZuUGVsZFdPWU5xb0E5ZVJmdlZueHhtSWwy?=
 =?utf-8?B?aUNGWml3UG96MlpNMjNPUE9ibTFhZVhncEhIcVRqUVBTQ3F0Q2t0VWdiV2Nr?=
 =?utf-8?B?RitzaHBnUzMyQlpHREdsaFpyYWlZQVRtVkFmM3hYVXQ3U3lIbFNXK2JpY1FZ?=
 =?utf-8?B?YURGaEpXT2xkS1RLLytKamJsWVYwWEJlVlhRbGxHSU1HaG03SzFTdWliVWRT?=
 =?utf-8?B?WmxwdVNkcFZaWGNiK2YrY2lGMWxUbFd6OXpGczhTWG1yemorWTRpY2E0MndS?=
 =?utf-8?B?ODZ5MDluWlB5bzVrNW1yQVI5YW1mbk84UHlRa2NmSVhFaUlvMkpJZEpzTzEx?=
 =?utf-8?B?RitjTVJza1RLeVhOYkd0ZHhUWEhMR2VRUjhjNDdkaVphYWZLNFpiWWdpcnd5?=
 =?utf-8?B?ay9GZE9rOGUyWWVnd1hzbWRPKzFCellNelVmMkdnV2tDR0ZxMXBSSlR0Smtv?=
 =?utf-8?B?VHRQcjhweWw1TlIrbVowRDBpVU1rVCtNSVlJOTl4V1NmRkNyMGY2V0VzMU5T?=
 =?utf-8?B?dVVGSmcybmdUQmhGSjJ2ZzV0YU5aNnFpNk16N01YTGR3eXh4UXlBVmtZS3Jn?=
 =?utf-8?B?dGJrUStFaTd3ZWtnTzVVL2NlTUlrenV3RmM4OTFiT0FtdzVSdzlXanJlWEhS?=
 =?utf-8?B?ZUNFZGhRN0xZNWJPcHFXZ2Q4VVUrTldEMWpLQ2x5YU51dFpVUnlvR0MzUUlG?=
 =?utf-8?B?UW9RcGtLM25tUE0vaWhqSGQ5RU5IdUdnazNSZjNHUDcxRnBFZlhvZW9hT0xY?=
 =?utf-8?B?U1RQZjVwamJEZXIrZEhoajVIVjgzdnN4dWdWT2psbHZaRFhqQ0o5aXhlTnY4?=
 =?utf-8?Q?2tFKVHjCDqHEU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad487e35-f9fd-4345-68ca-08d8966d4c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 02:52:24.4365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpOcwzRN6v+lWRMGdzzD+Q6FwpoCy+dh+0W80K34DPkrGUFSuA7MAofcpgGcoPUuCbGEckjDUXt95RYJV+kGdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7494
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgU3RlcGhlbiAmIFNoYXduLA0KDQpUaGlzIHBhdGNoIGlzIG5lZWRlZCBmb3IgdjUuMTAtcmM3
Lg0KQ291bGQgeW91IGhlbHAgbG9vayBhdCBpdD8NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IEZy
b206IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
Tm92ZW1iZXIgMzAsIDIwMjAgNDo0NiBQTQ0KPiANCj4gVGhpcyBpc3N1ZSBjYW4gYmUgcmVwcm9k
dWNlZCBieSBDT05GSUdfSU1YX01CT1g9bSBhbmQNCj4gQ09ORklHX01YQ19DTEtfU0NVPW0uDQo+
IEl0J3MgY2F1c2VkIGJ5IGN1cnJlbnQgTWFrZWZpbGUgd3JpdGluZyBjYW4ndCBzdXBwb3J0IGJ1
aWxkIGNsay1zY3UubyBhbmQNCj4gY2xrLWlteDhxeHAubyBpbmRlcGVuZGVudGx5LiAoZS5nLiBN
WENfQ0xLX1NDVSA9IHkgd2hpbGUgQ0xLX0lNWDhRWFAgPSBuKQ0KPiANCj4gIm9iai0kKENPTkZJ
R19NWENfQ0xLX1NDVSkgKz0gY2xrLWlteC1zY3UubyBjbGstaW14LWxwY2ctc2N1Lm8NCj4gY2xr
LWlteC1zY3UtJChDT05GSUdfQ0xLX0lNWDhRWFApICs9IGNsay1zY3UubyBjbGstaW14OHF4cC5v
Ig0KPiANCj4gT25seSBlbmFibGUgTVhDX0NMS19TQ1Ugd2hpbGUgQ0xLX0lNWDhRWFAgbm90IHdp
bGwgY2F1c2UgdW5hYmxlIHRvIGxvY2F0ZQ0KPiB0aGUgaW5wdXQgZmlsZXMgZHVyaW5nIGxpbmtp
bmcuDQo+IA0KPiBFcnJvciBsb2c6DQo+ICAgTEQgW01dICBkcml2ZXJzL2Nsay9pbXgvY2xrLWlt
eC1zY3Uubw0KPiBhcm0tcG9reS1saW51eC1nbnVlYWJpLWxkOiBubyBpbnB1dCBmaWxlcw0KPiAu
Li9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQzNDogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMv
Y2xrL2lteC9jbGstaW14LXNjdS5vJw0KPiBmYWlsZWQNCj4gbWFrZVs0XTogKioqIFtkcml2ZXJz
L2Nsay9pbXgvY2xrLWlteC1zY3Uub10gRXJyb3IgMQ0KPiANCj4gVGhpcyBwYXRjaCBtYWtlcyBN
WENfQ0xLX1NDVSB0byBiZSBpbnZpc2libGUgdG8gdXNlcnMgYW5kIGNhbiBvbmx5IGJlIHNlbGVj
dGVkDQo+IGJ5IENMS19JTVg4UVhQIG9wdGlvbiB0byBlbnN1cmUgdGhleSdyZSBidWlsdCB0b2dl
dGhlci4NCj4gDQo+IEFuZCBDT01QSUxFX1RFU1Qgb24gYW4gb3B0aW9uIHRoYXQgaXNuJ3Qgc2Vs
ZWN0YWJsZSBpcyBtZWFuaW5nbGVzcy4NCj4gV2UgY2FuIHJlbW92ZSBpdCBmcm9tIE1YQ19DTEtf
U0NVIGJlY2F1c2UgQ0xLX0lNWDhRWFAgc2VsZWN0aW5nDQo+IE1YQ19DTEtfU0NVIGFscmVhZHkg
aGFzIENPTVBJTEVfVEVTVC4NCj4gDQo+IEZpeGVzOiBlMGQwZDRkODZjNzY2ICgiY2xrOiBpbXg4
cXhwOiBTdXBwb3J0IGJ1aWxkaW5nIGkuTVg4UVhQIGNsb2NrIGRyaXZlcg0KPiBhcyBtb2R1bGUi
KQ0KPiBBY2tlZC1ieTogU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJv
bml4LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAu
Y29tPg0KPiAtLS0NCj4gQ2hhbmdlTG9nOg0KPiB2MS0+djI6DQo+ICAqIHJlbW92ZSBDT01QSUxF
X1RFU1QNCj4gLS0tDQo+ICBkcml2ZXJzL2Nsay9pbXgvS2NvbmZpZyB8IDQgKystLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL2lteC9LY29uZmln
IGluZGV4DQo+IDNiMzkzY2IwNzI5NS4uMzA2MTg5NjUwM2YzIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2Nsay9pbXgvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2Nsay9pbXgvS2NvbmZpZw0KPiBA
QCAtNSw4ICs1LDggQEAgY29uZmlnIE1YQ19DTEsNCj4gIAlkZXBlbmRzIG9uIEFSQ0hfTVhDIHx8
IENPTVBJTEVfVEVTVA0KPiANCj4gIGNvbmZpZyBNWENfQ0xLX1NDVQ0KPiAtCXRyaXN0YXRlICJJ
TVggU0NVIGNsb2NrIg0KPiAtCWRlcGVuZHMgb24gQVJDSF9NWEMgfHwgQ09NUElMRV9URVNUDQo+
ICsJdHJpc3RhdGUNCj4gKwlkZXBlbmRzIG9uIEFSQ0hfTVhDDQo+ICAJZGVwZW5kcyBvbiBJTVhf
U0NVICYmIEhBVkVfQVJNX1NNQ0NDDQo+IA0KPiAgY29uZmlnIENMS19JTVgxDQo+IC0tDQo+IDIu
MjMuMA0KDQo=
