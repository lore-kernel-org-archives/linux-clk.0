Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BDCC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 12 Nov 2021 06:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BC7660C4D
	for <linux-clk@archiver.kernel.org>; Fri, 12 Nov 2021 06:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbhKLG7C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Nov 2021 01:59:02 -0500
Received: from mail-am6eur05on2054.outbound.protection.outlook.com ([40.107.22.54]:46816
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230259AbhKLG7B (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Nov 2021 01:59:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gH0Vg+1ekbrrPt8/V6WYjtYL2noV1VnCCFp/4zkTdZFYiTfcVzUsgt0tAXOxQhaWroFwPQi3A9/5WmfE7g2yNc8Zfoh+1b/qji2dXRfeebS/g0mDbQU894QdOyxLJ7k2PxyBcRfxMsgq6z7DLL1+ECRGV41ZLBpMu3ASsVwAfygksi6yPx1mc21+dKUL+CZtpTyyq5CZ9PI8aYt+3aFbF54QOJOHuzhtLt76BicSHM0tYym0uuP7sjFppDbaq4XXBkMkLaPCyjkyHxpqk3YKtKw6ZoQh0yf0McQZ+1DXj4rf9GJgcmubQlWLkKyvJQgy68B19qMrykXtjbDeOKRHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUE7TesHy1BUdwaSgKyadirjyv1ubuw6KNHzceJ1CY4=;
 b=I9UKdiC8F58pa7Up5aPqQIQyOrlo3d2CaNYyLsGS3stH+iL+3L8vHYkpdJ+g/qSgkuTRORYuOV5CvRVhLOOdtFWu4eUjRBQ2ltKjXuyAbHTTIrNSBVMiCkuQ6x6V+B/BuW4HhAQAH7ksGIZJNK5xrRyGbc0Lug3wHKu5zfE1NGVTo8LGUWCYmaIuAjtuecJ5mZlCpivp37+Deii8jlEwliBIClIKTRboxmq9XWdn2uvs1ezimW8cpzb3mdRXXMmgVbdNozuC/2Yrl9RWli40gxvWxf6Blrx63Ff1ir7KI9WpXDWujL98yQtUFxL+tHJpGsbQk7QI7XptqSHm0qwRhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUE7TesHy1BUdwaSgKyadirjyv1ubuw6KNHzceJ1CY4=;
 b=K5n7wuvJicRgW79wf5kwqrtOFA4P6P1qHWl4DYZPTauXxB+1UEWDGMZ6Wmq9eqmxwimZToWFLCpkBUZot1sZCjX75ArfPu0Fl5jth2rgmPuPJtumN5bVP8Hr/+Ge2xXqOs+m8ljdDZTdOCsUQKyleNj//mDsz6AYul0vxkwIn3c=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2283.eurprd03.prod.outlook.com (2603:10a6:3:23::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Fri, 12 Nov 2021 06:56:09 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d535:e3e:baf4:2d60]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d535:e3e:baf4:2d60%5]) with mapi id 15.20.4690.026; Fri, 12 Nov 2021
 06:56:09 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [PATCH] [RFC] dt-bindings: clk: Introduce 'critical-clocks'
 property
Thread-Topic: [PATCH] [RFC] dt-bindings: clk: Introduce 'critical-clocks'
 property
Thread-Index: AQHX1PH6DkDwwy7Brk+8vCujsOCFkKv/etgA
Date:   Fri, 12 Nov 2021 06:56:08 +0000
Message-ID: <bddd1533-10f3-e1bd-b79c-e1ab24902da3@fi.rohmeurope.com>
References: <20211108224242.278128-1-marex@denx.de>
In-Reply-To: <20211108224242.278128-1-marex@denx.de>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b88f40af-c106-4d75-7f2c-08d9a5a9818d
x-ms-traffictypediagnostic: HE1PR0301MB2283:
x-microsoft-antispam-prvs: <HE1PR0301MB2283CC616879957896BE2209AD959@HE1PR0301MB2283.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t/t8egEl5u/B63Q83koXkfojZtVZqjDZxy2nM/gNCBLOwRY+W+pQRhPESQbjqsNhoTVpG0XN4jZiAeV4iqo+lV7C+w+d/0KHGq4mqHvjMEPCeuv2F9cIDYQcfgOrOqk+GICsVCqihUv7UUzxk9vndcuyrz4Zv3+Qr41UJqz7B+Qyj8qnF50MQxcVJhq3QlBazXKgqTVs4qNv65bdKFB6XocEVGYOaqZ4xooJjpLhCpxD7omYDH6HSukVFkruB58KI8P2pCzdWfY0D2eyIoCxlME4o8cvBxyRn8k7OrSdkf+w9MMmZxo1W9Cubo/5VbmrvevTw0H/Sw52+tLLCQi0jzgbMO/fEV7r5T+5BUkNiqgR3ui7T4QJz4C9V2Z8vDJlXbSi5fheDWOIC1FKvCuAYlBCtoSKLRU6vQ+O2SanDxocuBqyNfGnco1aAqS/ubhePnhHvOGqNalIswykkGiJsL3V2+v9M96RCihy96kRpmpzmDSbNQG5LZBGS6hAV5XP8PpiYboIG2Mg7tdhJjPxCKc6UjtMRMgrWVyE/PL48F468/RYkGducObXwyA3K4ZuGTxZFHoe481tEhxiay4/UyZKHZ3hCVPglibYu+LaHfSj4iM3ZZ161iOlr5TgnwZBZuao8A+IAsmF7vuuEeZqNYsNo6U9/zkJ5XWJySKh9YuxjBwADzsteoSEZbTjQ0C2tM4WkIDlxGUQYTKWRMuuF3wqwm+4hpjv8MwzZfJFMJXnrVRYQhEVQgYOhR7bk/Iq87RpiJj9yOHAznLlGIKpLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(2906002)(186003)(31686004)(86362001)(107886003)(8676002)(71200400001)(5660300002)(38070700005)(53546011)(6512007)(83380400001)(38100700002)(6506007)(122000001)(2616005)(54906003)(110136005)(6486002)(4326008)(66446008)(76116006)(64756008)(66556008)(66476007)(66946007)(8936002)(316002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlFVeHJjNHc0cS9ueTd3ajhVTWg4MXptbTFyOWpWMDJzdDJPT1ViOGZJOG1v?=
 =?utf-8?B?Rk0yQ01BTEpDdWFEL2Fnc2JEcEdENDFBdi9Udm8zc1JEeVlKcCsweWxnN2d2?=
 =?utf-8?B?Q2N5My80bHFEeFNCM2JLU3dRa0pvejVxczQ4VFNFWW10M3E4Tnd4L2NHR2w4?=
 =?utf-8?B?NzRpaXNvN0I0M3ZvU09vUVg2alc0TDNtd2J4RjZDQ09YTVF4bWVFOXRhaXc5?=
 =?utf-8?B?SCtFRnpOaEZpRExVUFZ0OGNzaTlObHFoWnFHY252bFBHZ2pBc0M1dmxSdkdC?=
 =?utf-8?B?YXhET2crM1hJY1BLVVVwY1hnUzJFTWVTdXRCbXZzUXdYZUUzS1k4NmphTEp4?=
 =?utf-8?B?RFFNTkhINDlscVV0RE42bGVmRzZtM0RmNWVLY3doTnE3d1JjYndWVE5zdlpu?=
 =?utf-8?B?bTVsczNjYTQrckQ1YXhIaXZjQnJGbHE0ODBPMGl5OVpQV0V1RHFpcVVSemVz?=
 =?utf-8?B?M0RtTUtDVEROQ0JSMTNwcS94c25MRkhnMHVLUElHQTIvTGpWR2lpMlZEMXYr?=
 =?utf-8?B?M3JSbDZOb044dmR2Q0srUGpEb3N6ZVVZM0dabjVHSVNva2szeU9ZRlFpU1pK?=
 =?utf-8?B?NHdPeXJDVE4xU1ZTTm5jY1F0d1FRbGNuSXlBN2JDdFQ5eTluODEwNjFiL29m?=
 =?utf-8?B?eXBmQkdjM0VYVFNycG9kS2lkOHpCbmtPSXA3MFIzOWlsVkFBWXJtU3BUYUFy?=
 =?utf-8?B?Q2VnV3BzQXZSd2x4cytVZVlxKzZlUjNrcG5WTG80aXBFdm9iL1V1b29DdVVY?=
 =?utf-8?B?UVI0c3JMcE9KME5sc0VhenFjYytETXV3R3NlSHYydW5EMVpxa0JaMmtTOVlT?=
 =?utf-8?B?Ym1rQXZoUmphcks3alRIditZSGVRcUszUVVnWEFMUWJOdjhCVU9CWVQxK0NU?=
 =?utf-8?B?a0IrMnhhS3VpLzVzTWFQMUpuSi9tYWNEMnltUzJMaEdXOEdCbWRBeEhCdFdH?=
 =?utf-8?B?Z29EQ2gyN1hDeU83L1hPbDUyNUNBVG8wWWhOOGJNWjkrZVM2K3RzRlFVcWhG?=
 =?utf-8?B?OW5zYnBBRDd3OXpqK3N4TWFUbXZ6OGZ1aDdESGg2M2gzNjdPd3FrWndYTGlW?=
 =?utf-8?B?NkFTZHNBeDE2akVzRVZtdExxOEdFQkdOWUVEeW5mdUYva0dCMEVvam5JdFc4?=
 =?utf-8?B?dWlQa3Qwai9ZZDhScERoZytRWFdFRHJUd2haRCtvY1BEQ0F6cHZsdC9ZaGFt?=
 =?utf-8?B?WXFMQUJuZ1IzaVppMitmYjNPVk9LallBOFlBY1Fyb0txSXY1OXlKYlZZQnhh?=
 =?utf-8?B?cy9rUnBZUi9WUnB3c1VrbGhydU1EN0tPdHo0QzRDaDFUOFFpQU56ekNUUU0z?=
 =?utf-8?B?T2w0dGNBNStvS3RNc0NocHBzL1hLaUsvejlhN1Zjd08zVHRoUWw2QmdkcnJJ?=
 =?utf-8?B?ZXF6VTIxVHczSklsY2JJWHJYcWVDTkNFOWNYemptUEIrQ3pFK2crdzAzdlc3?=
 =?utf-8?B?dGNTNDVIT1MxYkNoNThRMHpQTGMxK3dLNW9tVW50RG9ydnpOak5FWWQ1UzM2?=
 =?utf-8?B?S3Q5UlNtVkxzeU8xMzFSM1FjMVhVdXFaOFdnVmp3dlZQV2puN2drZDVHSGcr?=
 =?utf-8?B?WFlxMHhCcm1sWUIwb0RuUGdzYmtBbnoxOVJlRVQ0bTRiclBTWU5PL1NEUUd6?=
 =?utf-8?B?VE1HWERMYU9uc0JVY1E5OTYzYmhOTHJ0Q2E0TFVSUmw1SVQyZSsvRlg1RWVx?=
 =?utf-8?B?OWdSOVlZTUxPTWJwWWg5T3BvZ25tVVBvMVl0dWk4ODk1RmZoVlNpZXFrWkFj?=
 =?utf-8?B?bnF1YWRzSXpVVmltRUZpVjM2L0hQZHRFMW1vSGUreldCV3BFVyttMUYzNHFR?=
 =?utf-8?B?a1VOWkdKSGE4NHZFNHhDWlUyRzc3WkhJblB6MlpOeGYwa3RkM3JzVUpRK2tD?=
 =?utf-8?B?ZUpaSVhPbEU4dlhWUXArK0ZmSThET2lOQ1NzSmZJN1ZHNGVqcVRZbFdNcjZQ?=
 =?utf-8?B?WmdYRC9mUWtORFJ4NHJOUE90ZDdXQUJXVG1YTkNzdlZHQ1dUVmRIUEl5aXd2?=
 =?utf-8?B?bmhCRjFzVjN6aThScEdKWVduWVJFY1gxdFptZjhrUG5xRGVRV2N1R0crc2dp?=
 =?utf-8?B?Yms5Q0Y3c2c2Rm1FNWt0OWY0bFdRdkxrYXQrTklJcVhrNmlkdFc4RElTMVk2?=
 =?utf-8?B?TEo2YytpQW9Qd1BuMXMxcWtDdk4zZUdmY3I1aG9WV0xQenBZSnEwMzlPL1Ri?=
 =?utf-8?B?RHhUSFU5a3N3VVpzRWVZU1NmSnVGUVRqZ254dDZZeERIcDVNOE8yMmhlb1RS?=
 =?utf-8?B?VlJCcjZicGdkcmxDQVZTZTB2cU1za3NrMlJKVUtWNnpSTnRmVFZuVUIweW5K?=
 =?utf-8?B?c1N6NDlweHgyck9Ra2d3d3VHNkRNVjgyU0JLQjZYY1dFNS8wODFyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55729FA99DD6D445AAB6149611AFC5DD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88f40af-c106-4d75-7f2c-08d9a5a9818d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 06:56:08.8727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+6JS6mizsMBDmxp967apdQQSYczv2CBbxzexKoLxISJSdmo4LVB5jVTAeKNRDtCLFehZI5vG6zNz7socyorCqUCXufKOgnYbqFUkjY8HLNyTezA22oyEafgLLzLyO71
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2283
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMTEvOS8yMSAwMDo0MiwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+IE5PVEU6IFRoaXMgaXMgYW4g
UkZDIHBhdGNoIHNob3dpbmcgaG93IHRoaXMgbWVjaGFuaXNtIG1pZ2h0IGJlIHdvcmthYmxlLg0K
PiANCj4gU29tZSBwbGF0Zm9ybXMgcmVxdWlyZSBjbG9jayB0byBiZSBhbHdheXMgcnVubmluZywg
ZS5nLiBiZWNhdXNlIHRob3NlIGNsb2NrDQo+IHN1cHBseSBkZXZpY2VzIHdoaWNoIGFyZSBub3Qg
b3RoZXJ3aXNlIGF0dGFjaGVkIHRvIHRoZSBzeXN0ZW0uIE9uZSBleGFtcGxlDQo+IGlzIGEgc3lz
dGVtIHdoZXJlIHRoZSBTb0Mgc2VydmVzIGFzIGEgY3J5c3RhbCBvc2NpbGxhdG9yIHJlcGxhY2Vt
ZW50IGZvciBhDQo+IHByb2dyYW1tYWJsZSBsb2dpYyBkZXZpY2UuIFRoZSBjcml0aWNhbC1jbG9j
ayBwcm9wZXJ0eSBvZiBhIGNsb2NrIGNvbnRyb2xsZXINCj4gYWxsb3dzIGxpc3RpbmcgY2xvY2sg
d2hpY2ggbXVzdCBuZXZlciBiZSB0dXJuZWQgb2ZmLg0KDQpIbS4gSXQgc2xpZ2h0bHkgYnVncyBt
ZSB0byBwYXJzZSB0aGUgY2xvY2sgcHJvcGVydGllcyBmb3JtIERUIGluIG1hbnkgDQpwbGFjZXMu
IEkgd2FzIHRoaW5raW5nIHRoYXQgcGVyaGFwcyB3ZSBjb3VsZCBwYXJzZSBhbGwgdGhlIGNsayAN
CnByb3BlcnRpZXMgYXQgX19jbGtfcmVnaXN0ZXIoKSBhbmQgc3RvcmUgdGhlbSB0byBiZSBsYXRl
ciB1c2VkIHdoZW4gDQpvZl9jbGtfcHJvdmlkZXIgaXMgYWRkZWQuIEFmdGVyIGhhdmluZyBhIGNo
YXQgd2l0aCBNYXJlayBJIHdhcyBraW5kbHkgDQpleHBsYWluZWQgdGhlIERUIG5vZGUgbWlnaHQg
bm90IGFsd2F5cyBiZSBwcmVzZW50IGF0IF9fY2xrX3JlZ2lzdGVyKCkgLSANCnBoYXNlLiBJIGRv
bid0IGVhc2lseSBzZWUgYSBiZXR0ZXIgd2F5IHNvIEknZCBiZXR0ZXIgdG8ganVzdCBsZWFybiB0
byANCmxpdmUgd2l0aCB0aGUgYnVnZ2luZyBmZWVsaW5nIDopDQoNCj4gDQo+IFRoZSBpbXBsZW1l
bnRhdGlvbiBoZXJlIGlzIHNpbWlsYXIgdG8gInByb3RlY3RlZC1jbG9jayIsIGV4Y2VwdCBwcm90
ZWN0ZWQNCj4gY2xvY2sgcHJvcGVydHkgaXMgY3VycmVudGx5IGRyaXZlciBzcGVjaWZpYy4gVGhp
cyBwYXRjaCBhdHRlbXB0cyB0byBtYWtlDQo+IGEgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBvZiAi
Y3JpdGljYWwtY2xvY2siIGluc3RlYWQuDQo+IA0KPiBVbmxpa2UgImFzc2lnbmVkLWNsb2NrcyIs
IHRoZSAiY3JpdGljYWwtY2xvY2siIG11c3QgYmUgcGFyc2VkIG11Y2ggZWFybGllcg0KPiBpbiBf
X2Nsa19yZWdpc3RlcigpIHRvIGFzc2lnbiBDTEtfSVNfQ1JJVElDQUwgZmxhZyB0byBjbGtfaW5p
dF9kYXRhIC5mbGFncw0KPiBmaWVsZC4gVGhlIHBhcnNpbmcgY29kZSBvYnZpb3VzbHkgbmVlZCB0
byBiZSBjbGVhbmVkIHVwIGFuZCBmYWN0b3Igb3V0IGludG8NCj4gc2VwYXJhdGUgZnVuY3Rpb24u
DQo+IA0KPiBUaGUgbmV3IG1hdGNoX2Nsa3NwZWMoKSBjYWxsYmFjayBpcyB1c2VkIHRvIGRldGVy
bWluZSB3aGV0aGVyIHN0cnVjdCBjbGtfaHcNCj4gdGhhdCBpcyBjdXJyZW50bHkgYmVpbmcgcmVn
aXN0ZXJlZCBtYXRjaGVzIHRoZSBjbG9jayBzcGVjaWZpZXIgaW4gdGhlIERUDQo+ICJjcml0aWNh
bC1jbG9jayIgcHJvcGVydHksIGFuZCBpZiBzbywgdGhlbiB0aGUgQ0xLX0lTX0NSSVRJQ0FMIGlz
IGFkZGVkIHRvDQo+IHRoZXNlIG5ld2x5IHJlZ2lzdGVyZWQgY2xvY2suIFRoaXMgY2FsbGJhY2sg
aXMgY3VycmVudGx5IGRyaXZlciBzcGVjaWZpYywNCj4gYWx0aG91Z2ggSSBzdXNwZWN0IGEgY29t
bW9uIGFuZC9vciBnZW5lcmljIHZlcnNpb24gb2YgdGhlIGNhbGxiYWNrIGNvdWxkDQo+IGJlIGFk
ZGVkLiBBbHNvLCB0aGlzIG5ldyBjYWxsYmFjayBjb3VsZCBwb3NzaWJseSBiZSB1c2VkIHRvIHJl
cGxhY2UgKCpnZXQpDQo+IGFyZ3VtZW50IG9mIG9mX2Nsa19hZGRfaHdfcHJvdmlkZXIoKSBsYXRl
ciBvbiB0b28uDQo+IA0KDQpJIGRvIGFsc28gbGlrZSB0aGUgaWRlYSBvZiBiZWluZyBhYmxlIHRv
IHJlcGxhY2UgdGhlIGdldC1jYWxsYmFjayAtIGFuZCANCmEgZHJpdmVyIHNwZWNpZmljIGNhbGxi
YWNrIHdpdGggYSBnZW5lcmljIG9wLiBDYW4gdGhlIGNsb2NrLWluZGljZXMgYmUgDQpzb21laG93
IHVzZWQgZm9yIGdlbmVyaWMgb25lPyBQZXJoYXBzIGFsbG93aW5nIGFsc28gYWRkaW5nIGEgZHJp
dmVyIA0Kc3BlY2lmaWMgY2FsbGJhY2sgZm9yIGNhc2VzIHdoZXJlIGdlbmVyaWMgb25lIGNhbid0
IGRvIHRoZSBqb2I/IChJIGRvbid0IA0KaGF2ZSBhbnkgY29uY3JldGUgaWRlYS9jb2RlIGhvdyB0
byBkbyB0aGF0IHJpZ2h0IG5vdyB0aG91Z2gpLiBCdXQgd2hhdCANCmV2ZXIgaXQgaXMgd29ydGgs
IEkgZG8gbGlrZSB0aGUgb3ZlcmFsbCBpZGVhLiBJdCBzb3VuZHMgcmlnaHQgdG8gbWUuDQoNCj4g
VGhvdWdodHMgKG9uIHRoZSBvdmVyYWxsIGRlc2lnbiwgbm90IGNvZGUgcXVhbGl0eSBvciBwYXRj
aCBzcGxpdHRpbmcpID8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPg0KPiBDYzogTWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1
cm9wZS5jb20+DQo+IENjOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5j
b20+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KPiBDYzogU3RlcGhl
biBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gQ2M6IGxpbnV4LXBvd2VyQGZpLnJvaG1ldXJvcGUuY29tDQo+IFRvOiBsaW51eC1jbGtA
dmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAgIC4uLi9iaW5kaW5ncy9jbG9jay9jbG9jay1iaW5k
aW5ncy50eHQgICAgICAgICB8IDE2ICsrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvY2xrL2Nsay1i
ZDcxOHg3LmMgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysrDQo+ICAgZHJpdmVy
cy9jbGsvY2xrLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjUgKysrKysrKysrKysr
KysrKysrKw0KPiAgIGluY2x1ZGUvbGludXgvY2xrLXByb3ZpZGVyLmggICAgICAgICAgICAgICAg
ICB8ICAyICsrDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspDQo+IA0KDQpC
ZXN0IFJlZ2FyZHMNCi0tTWF0dGkgVmFpdHRpbmVuDQo=
