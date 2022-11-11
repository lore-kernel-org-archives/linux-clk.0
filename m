Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94F1C43217
	for <linux-clk@archiver.kernel.org>; Fri, 11 Nov 2022 11:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbiKKLBF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Nov 2022 06:01:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233116AbiKKLBD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Nov 2022 06:01:03 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB7259FF4
        for <linux-clk@vger.kernel.org>; Fri, 11 Nov 2022 03:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668164461; x=1699700461;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GciC6sKYjOrwjEpPb3tzUj/x8002hQ0NuIDG8jAxWkE=;
  b=hL6RJeOgWn+eOQfm57W5YDceTmybWm5YPpKMb5Pwu9mxdTaNw+qLuTwS
   IWaSPA7BPHJ4fWRG1SThSg+crY2EczvYQqQQbHgOohoxY7X6rcdT25V2W
   a1swQEYUzSISUkzrc6iS3h+iRVm/kpGn0HRh90EWCsSeJf5ah9p18jqHO
   +uRBr2FGbrVqcmXNc/QqNv6MXIT+l5N5dxJ1dwpK7qsGQSK7yNKlwnmiz
   kbeoiU8zwkIYsgNDdV323WRq8qgHUXJc6QKvUMohVB6c7YgbzCx4c9hI5
   N9nvFtDOO7u4sYRLralrrG/f1xSKb8yUgAzwO0q01CiAWhUgDac4IvIJ8
   w==;
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
   d="scan'208";a="183089696"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Nov 2022 04:01:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 11 Nov 2022 04:00:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 11 Nov 2022 04:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eENFAFZSL25TiiXIY318lsAf49GdQgtP6CmJ6T4u5FK47lXMCoI3krogw3B+jQ/y5OqUuHck4N+tOAof8+M+eeCllO4YFIyk8hUefXMaXDn9cno0KQJP4On0apvDp6Xv0X5zgHuFd+DA4XlbMNJij9GysRuPT/I1wgrgbqzV9etR1I9hCZfLLhh61xGYSZEmee3BAyEYBRjY8GpCMLdvLvAlosmaMM+DYpezT/M2hf1NJl6IH/KP4pZA8fnakSI7rPLCJgnocJ1Oa8f4pAploaSASuRyd++kg1IyTxGKSqJW8Qa2x4eRq31vvU/vfQzUrpS7S/8ulrH1uRuXxJuupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GciC6sKYjOrwjEpPb3tzUj/x8002hQ0NuIDG8jAxWkE=;
 b=RqkSmbNI/QqBaEjBlGy8ZsNeF01r8ODOBltVzsPed4wKDTevfqX8EpMtpqCWzCJYyWTCiTCT8fvyKjVRW/i4Zd59j8NXO1jFnzl/vagcvXnb12hZqhk9pRKl3Ol3DGhozI4KNcHD5FufsYs+5HaN0o9ibn9Tq70BmuuvTcZFvLnlwd/rLUIo/ghTnQoN/CIJftW9vzxtcAm/lVwA//L5AXdZbXtUTGVDQQPEL55wX/VsnMwA+b0AiEfx2afYJNJH78QiLAuVVKDKADP8M2jMrlqD+GaiMAUE4HO6YFTMDhW97TiC3V/yTciNdLimSS3MkDM+R331EDHGvprgjkhdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GciC6sKYjOrwjEpPb3tzUj/x8002hQ0NuIDG8jAxWkE=;
 b=PHYuy2mrg7WdNgv3HF3h0AKcAYfqnWgNPPPVUdoAJgOu3+/nahwh0GslBcggM5Ck8Db98fPcakcJmodS/5XmHdQyvN3MLXz7Jo7PI3I/8gkU8ogzcL1Blpwn2/BvbtGE4JBzvpPyJ7OSXrqdeFsoiS78TYIa/G87g6NtXbw1Pgk=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 11:00:53 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2%3]) with mapi id 15.20.5813.012; Fri, 11 Nov 2022
 11:00:53 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <m.grzeschik@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <linux-clk@vger.kernel.org>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH v3 1/3] clk: at91: rm9200: fix usb device clock id
Thread-Topic: [PATCH v3 1/3] clk: at91: rm9200: fix usb device clock id
Thread-Index: AQHY9bzdEa6UnItx0kCSKySk1Hnx/Q==
Date:   Fri, 11 Nov 2022 11:00:53 +0000
Message-ID: <048269a7-3aea-129f-f4db-4cd321e89fa3@microchip.com>
References: <20221109124638.147270-1-m.grzeschik@pengutronix.de>
 <20221109124638.147270-2-m.grzeschik@pengutronix.de>
 <94c6679c-f518-aa74-5cda-f28f1dc3129a@microchip.com>
In-Reply-To: <94c6679c-f518-aa74-5cda-f28f1dc3129a@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SJ0PR11MB5598:EE_
x-ms-office365-filtering-correlation-id: 35edc12c-a50a-48f3-f90b-08dac3d40078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a/uYVI0eyhGdeQri+DC/J84+AlsVq/jtBz8d7p76a5Qz3qZFEaznlBUZOal+wAbTkkOeOp6yrUYY0UZ1PAzM1nHvaXoX1e4b8GNt7RKr0Zc25tQtzvkrAVYZseDG0tOs3EJiNz8rPgOT3DSVFKJFUYLgbJq4MhrJg/mfe30iQlpk+vwWs/I/TypwqTta1uxnP5Evk/La0VBUiYVIK+tCm+JEps3HrqZ/oKkeEBqGhwRXTm0IqGrMzzHDzZwLhuxnVZBc1X/VHQOn5a4EpKhxkxEPIdbcgzpBuNCuzp6gRiVeGqqWk93uX+xYDGpDM+FsshYHUkaYacQCI2lGxu+oncBPtlB3Z70hjJ8g+cEey9g3Sd6Dq7qd2635sedDbQ6bVB/XE0W1rNUKoeBxYWnb6S06L4zWgNUCPhwNv3yljSR6apCK58WJgH0l7EQOZy1FclZd+4I9c0pF3RfTiPkFoio4/VTWJYqWG77A+AKx7SwjbeJCj/X+sfqo7wKohLmBNoVoS9LtLG806E2Bj5keE7VUjOqvFgETrQI3uxyMchWy3aDfJjh+j+Ax0hzdDXWsnMAUduK4xEVpiFUcNanQui+xLXsb/xtvR54l0Ykwzp/ZoQp6DYR5qtxmwbyg5FE2tcG8P3uDaiq91iJ88exnNhEwE9p08IBhqrZ+f/qSzZxXTv6SPA7bm3viHDmdMre6nkPc7i6ZZrr2wqskxLnrbjCg9gmDSZCmXZ7sv1dEIecE5g3f5+ba32/XJe8SgsISmikN0DqHnEzsLjuJNr73xAGzMxkrNXCrXBT96D5p3ebjdKxtaMggP/PtfENKKkDAWRvhK9yQvAoZ2x8OCJ9Ivg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(83380400001)(6486002)(8936002)(478600001)(71200400001)(41300700001)(5660300002)(186003)(316002)(6506007)(4326008)(38100700002)(6512007)(38070700005)(36756003)(26005)(31696002)(86362001)(110136005)(2616005)(31686004)(66446008)(8676002)(64756008)(66556008)(66946007)(91956017)(76116006)(53546011)(2906002)(66476007)(54906003)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVdwT0xMZTkwbEhOMWZXdGJWamVrTU1LTTZlUUpEWTRhWG8xVUE2RlI2dXVn?=
 =?utf-8?B?MU1rZC9CL3ZpbERQaEMxaGQyUlZ3Q2FDOUphcDdTRkFKR1pTVDhXODFZSHoz?=
 =?utf-8?B?ck1zckxJLzRGNUszb3g4bk5TdEE3d0ZVRzAwdHlHUURmaUM2WHhocEZZaG1q?=
 =?utf-8?B?UmR4UDJsMzlYcmlzYVduZUJNa1g1T3N6cmMrU29NaE5iYjdXTnFOaDdZSHlM?=
 =?utf-8?B?SlNoU1FjcXFuN2ZjQmZDeUJublZkZitkdThQbVhqREp4dGpKeWVSSkxtZHBj?=
 =?utf-8?B?dU03aXFXcVhubzZsVVhiZWhJYlR6QXV5TkR4UHcrM2FNTHh5cmlNWElZMnZL?=
 =?utf-8?B?L1lTZnA4L0JsN0lYaGlObnljbFdOcGN1aWJ6YzZqdkpER1AzeFlnSWw3SFhk?=
 =?utf-8?B?YkZTUmJ3YjVqU1VleUdPZllsLy9nckNVVkNNVlE0UVpicG05YUgyNUN1ZzhI?=
 =?utf-8?B?cEFzSEF2RklIbmtqWEFwZ1c4a0cwQXJlRUJodTY3SmN3S0pRaDJtaFZ0cFcv?=
 =?utf-8?B?K2RsN1pickdIK1QvVnJoUVZFK2JITXY1OERxVVZvc2Ira00vbXpFbTMxMFYv?=
 =?utf-8?B?TGtyUEJXWC8wSWpNbHlZb2VQbXdCdkxJVGFZVzZOZSswZDJqTkFpK3dPcFJB?=
 =?utf-8?B?b0UxMUtkT0VkVjNoN0hicDNISGgxSk5QSUFJcGNzZkRvaWhOeityT2Rrd2dU?=
 =?utf-8?B?Y0dkMDdkcTUwMGpaRTlzQW1CRURiL1p2dEZMUDBwZ0VDRG15MkpRQ0NiR2hK?=
 =?utf-8?B?WnR5aDJCWml0d1pBQk5XUk1LbjQ2VHE3cmVaQVhqdVBXN1lqRmVXdzhQRlNl?=
 =?utf-8?B?aXVucHRpTzNBSUpLajlYTXA2Y3dGbEo5OGYwUHBCd1VVRk5tQktTak85ajFE?=
 =?utf-8?B?aVZEblY0RWRxVHJPWEhRR0hHOW1QNGYzV3lISElxcWtPdW1tQzFIQSsyMldj?=
 =?utf-8?B?REt5MFJhaXNiSUFEV0J0TlpqM0JqWE1US3hNVkNHVHhzQjZMemRxcS9qU3V0?=
 =?utf-8?B?TDJpNDFBUmRJc0FpVGZGQysyU0NoNDV3eWhURXNJTXZRRG53WHk0YXo5MGQr?=
 =?utf-8?B?cE5hMWN2ZEV0ejRlUW4zckdQWUtGWTZjV1F6dURPa0lWSzk1b2RtTGVZeGhw?=
 =?utf-8?B?TFVMd3U1MDhGeGd4TjhVc0NGSGhiMnloRkwyV2ZJcWVsZTQ0RU5oZGZTRTJL?=
 =?utf-8?B?OVozUEdDSnFDS1BjNGFocFdSTUdSMHFyOXkxSEFGVDVqMTcwcDhUUy8wUmY4?=
 =?utf-8?B?RXQ2amdaa1RnREsrZWhPTjBOeTJ4djZGOUo1SkhDWlVobkNTOEl6QTg1RHd3?=
 =?utf-8?B?aDNyV2UxUUpCaGN0bkMwVEM2VGlGSmt4Qkw5dmZhWkJhd3ZoSkRhTEhtbUwz?=
 =?utf-8?B?cHZoZXk4RzAwWVM0YTNETU9YWDE0MHhTcUpURnFCdnFmUzhLaFpZbTBmalQw?=
 =?utf-8?B?ZVJKWWJYdVdnWW55SnptOUM0OUZxeHJtSk0xbU9KZ0IxVFZDRlZjdVI1NWVJ?=
 =?utf-8?B?dExkUlhjQUpXK2dkU09TdVZnS1Y4U0E3WFFGWVpxdW9zN0JsU1JyNHA4VnZo?=
 =?utf-8?B?cjN3OTBJY1QrYnNSaEZEbCtuTVNzbVlHTEYvR0VJb0hvZEwrenFxcXVHMTBq?=
 =?utf-8?B?MnhHODJlUHIrcmdiYTFORENBbFhXbFFaSStQMlpub1NJdis3elNkMU5rV2VB?=
 =?utf-8?B?UjZSL05zVm4zTHJhYzQ3cjVNSTJYSUcvTzlmU25VRk5IcnZzSndETXlFVUM5?=
 =?utf-8?B?d1dXR0RteFBncXprVURsTE5CR0UvWGZpUndUbk5UM0FEOStsMVdmekpJQWdj?=
 =?utf-8?B?akdqV2JqUm5wdDgrbmpmR0w0Y09IMTZUMUsyby9MVkl0SHZaTStIV0ZaRXZE?=
 =?utf-8?B?Q3FaS0R1SW1SRlNIQWFuYm5SOGlvdXFTeExzQmpmZk9DZ3hPU1VjU0h3S2dJ?=
 =?utf-8?B?S2paZ2JENVZtWjJXekxhSFAvZWZGMmNCa0h4aDRORWhIVmR5SWhaY1FVb2xz?=
 =?utf-8?B?TXJxTXBkc2ZlM01Jb1dFS3A3bVZQdVhWR1F5cThaZGJQb1o3OFVOM0hZOTJW?=
 =?utf-8?B?VHNCK21JODRCVHJQWkpkVkZuRk9XSVJYRDc2Nm52OTdZdTI3VTVLTWJLL3Iv?=
 =?utf-8?B?a3R5a3U5c3V4Z2hpcGhkNzlDbXRuWnQ3NUkwcFUvbVFkR3BDWnpCL1REOXpL?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <658065923D77D64BBBFC04E6203E3381@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35edc12c-a50a-48f3-f90b-08dac3d40078
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 11:00:53.4601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rnPdUFWMCZHSl20oLv6/EL/Jd499XtMFdXpz8VB1uW/RN/nyYXMHghoGrCevO/llcsPB3k8AljL8bhqFxqoTBuey/Sai2RdN3pXavo33OZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5598
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMTAuMTEuMjAyMiAxMjo0MSwgQ2xhdWRpdSBCZXpuZWEgLSBNMTgwNjMgd3JvdGU6DQo+IE9u
IDA5LjExLjIwMjIgMTQ6NDYsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pg0KPj4gUmVmZXJyaW5nIHRvIHRoZSBkYXRhc2hl
ZXQgdGhlIGluZGV4IDIgaXMgdGhlIE1DS1VEUC4gV2hlbiBlbmFibGVkLCBpdA0KPj4gIkVuYWJs
ZXMgdGhlIGF1dG9tYXRpYyBkaXNhYmxlIG9mIHRoZSBNYXN0ZXIgQ2xvY2sgb2YgdGhlIFVTQiBE
ZXZpY2UNCj4+IFBvcnQgd2hlbiBhIHN1c3BlbmQgY29uZGl0aW9uIG9jY3VycyIuIFdlIGZpeCB0
aGUgaW5kZXggdG8gdGhlIHJlYWwgVURQDQo+PiBpZCB3aGljaCAiRW5hYmxlcyB0aGUgNDggTUh6
IGNsb2NrIG9mIHRoZSBVU0IgRGV2aWNlIFBvcnQiLg0KPj4NCj4+IENjOiBtdHVycXVldHRlQGJh
eWxpYnJlLmNvbQ0KPj4gQ2M6IHNib3lkQGtlcm5lbC5vcmcNCj4+IENjOiBuaWNvbGFzLmZlcnJl
QG1pY3JvY2hpcC5jb20NCj4+IENjOiBhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbQ0KPj4g
Q2M6IGx1ZG92aWMuZGVzcm9jaGVzQG1pY3JvY2hpcC5jb20NCj4+IENjOiBjbGF1ZGl1LmJlem5l
YUBtaWNyb2NoaXAuY29tDQo+PiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZw0KPj4gQ2M6
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPj4gQ2M6IGtlcm5lbEBwZW5n
dXRyb25peC5kZQ0KPj4gRml4ZXM6IDAyZmY0OGU0ZDdmNyAoImNsazogYXQ5MTogYWRkIGF0OTFy
bTkyMDAgcG1jIGRyaXZlciIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEdyemVzY2hpayA8
bS5ncnplc2NoaWtAcGVuZ3V0cm9uaXguZGU+DQo+IA0KPiBSZXZpZXdlZC1ieTogQ2xhdWRpdSBC
ZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNCkFjdHVhbGx5LCBsb29raW5n
IGFnYWluIGF0IHRoaXMuLi4gSSB0aGluayBpdCBpcyBiZXN0IHRvIHNxdWFzaCB0aGlzIHBhdGNo
DQp3aXRoIHBhdGggMi8zIGZyb20gdGhpcyBzZXJpZXMuIE90aGVyd2lzZSBhcHBseWluZyB0aGVt
IGluZGVwZW5kZW50bHkgd2lsbA0KbGVhZCB0byB1c2IgZHJpdmVyIHByb2JlIGZhaWx1cmUuIEJh
Y2sgcG9ydGluZyB0aGVtICh3aXRoIHByb3Blcg0KZGVwZW5kZW5jeSkgdG8gb2xkZXIga2VybmVs
IHZlcnNpb24gbWF5IGFsc28gbGVhZCB0byBmYWlsdXJlcy4NCg0KPiANCj4gDQo+Pg0KPj4gLS0t
DQo+PiB2MSAtPiB2MjogLSByZW1vdmVkIDsgZnJvbSBwYXRjaCBkZXNjcmlwdGlvbg0KPj4gICAg
ICAgICAgIC0gYWRkZWQgZml4ZXMgdGFnDQo+PiB2MiAtPiB2MzogLSB1cGRhdGVkIHRoZSBmaXhl
cyB0YWcNCj4+DQo+PiAgZHJpdmVycy9jbGsvYXQ5MS9hdDkxcm05MjAwLmMgfCAyICstDQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2F0OTEvYXQ5MXJtOTIwMC5jIGIvZHJpdmVycy9jbGsvYXQ5
MS9hdDkxcm05MjAwLmMNCj4+IGluZGV4IGIxNzRmNzI3YThlZjhkLi4xNjg3MDk0M2ExM2U1NCAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvY2xrL2F0OTEvYXQ5MXJtOTIwMC5jDQo+PiArKysgYi9k
cml2ZXJzL2Nsay9hdDkxL2F0OTFybTkyMDAuYw0KPj4gQEAgLTQwLDcgKzQwLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBjbGtfcGxsX2NoYXJhY3RlcmlzdGljcyBybTkyMDBfcGxsX2NoYXJhY3Rl
cmlzdGljcyA9IHsNCj4+ICB9Ow0KPj4NCj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNjayBhdDkx
cm05MjAwX3N5c3RlbWNrW10gPSB7DQo+PiAtICAgICAgIHsgLm4gPSAidWRwY2siLCAucCA9ICJ1
c2JjayIsICAgIC5pZCA9IDIgfSwNCj4+ICsgICAgICAgeyAubiA9ICJ1ZHBjayIsIC5wID0gInVz
YmNrIiwgICAgLmlkID0gMSB9LA0KPj4gICAgICAgICB7IC5uID0gInVocGNrIiwgLnAgPSAidXNi
Y2siLCAgICAuaWQgPSA0IH0sDQo+PiAgICAgICAgIHsgLm4gPSAicGNrMCIsICAucCA9ICJwcm9n
MCIsICAgIC5pZCA9IDggfSwNCj4+ICAgICAgICAgeyAubiA9ICJwY2sxIiwgIC5wID0gInByb2cx
IiwgICAgLmlkID0gOSB9LA0KPj4gLS0NCj4+IDIuMzAuMg0KPj4NCj4gDQoNCg==
