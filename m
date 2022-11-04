Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D22C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 08:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiKDISS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 04:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbiKDISO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 04:18:14 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E81D26AC4
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667549893; x=1699085893;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oRPKE6q7ZYMVE1dIXQo1NL4CNdLGo3XlX6nF46Oafxk=;
  b=TPR782opd/z+1EO17np6QOHRwJV5ku6ggjNDW/jTDH7aSJdMetD1CdB2
   aGl88fHeTwTi1VqeuILUQg+y5jgr2VXAmTCVXafut6HaJxLBNatBQ54MJ
   nc7qRSNmwlB4T678SbWZ8RHpvxLFrukhN03Hscgtc6Dq8JDNX/ugBCgxR
   kKFglffiA/x1+8+YC21TmKt9qxKgPnT83gzzdv1alma4iHrMaBbMx5nCJ
   fvUZiCHUtklS0Cpw6gboi90n44jc8+LW9slRmYyOlJOPZ3WG4CVLyYtcP
   5Me0wXqLygI2fM36k7vUHrWeG3BmcN6brl1VrTBA6Hui6i4oANnLIIW6h
   w==;
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="187604687"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Nov 2022 01:18:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 4 Nov 2022 01:18:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 4 Nov 2022 01:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHmAFI+t5UZXdvJBJjsn5ZglbJnlR8mU/CD9Q3g373iUA9IgRp5uCsuJsz84sTXJPsIG39imHUAA0ZEzJ20RdKqYDnGgIaQGoXK07EI2gLffyS3DaxToHR+JPwtHelh4OIz3UUS8LpHytIOmHMrVG4UMbxEPsn6NMPZ9pfFpyf1V1iutoXbbGfG/feidoxATYTg7fZVG6Na4eUR9upCwB0vYRTbCTCP+r4u3k12hO1UjtTnxYdLt4Fu9h0Z8Trw2nKoWID0ua9BQbLB0zL31bil0jKEBRHC7ctPNLyH9pppjbrnaF9RaJGMXYXN2EJxERB9Vb2XKilHH8s69xXcKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRPKE6q7ZYMVE1dIXQo1NL4CNdLGo3XlX6nF46Oafxk=;
 b=OKEs/gXz9pw7ZGJHvX0evMckrevOYuUMny8LC0pfdU+FH+P09dNu9DHx34WLvrNC5+YPyneTkonJ30iGgtocPVHz3SHC+KUdNLIUq9d346+px9GBuKzrNd5VTbnHem77iJIEhusYKhN2Gy7kKP+uxKQ6RISIrKImKzILsP6zFGyRSTFpZ440QnWUQWo5T2Zd989imTJwjhcS2v/iMoKPNUyK+wkDcFNbHuZAmYq9RF/f0G4uMp/iL0dXGC5Hs1IAjNByBERkbq4y8lUZBBCGTB0z5qBrx3qc6pd1LfJmlwgbqIpWoZYdCZrylVGyZkiz8u3/PT9QA3RBKFhDOYgGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRPKE6q7ZYMVE1dIXQo1NL4CNdLGo3XlX6nF46Oafxk=;
 b=q1Opj/AUC55gI1h60mvdnho9HnQYCNAe7eGSOJjbCgFFp6lHIlx5Q7NC7/QG/BUfITzuTbJNss1epkuUowO507PjRDK169VRLFTL7FzmCMuCM4/uiSYEw4NJtrA2Jf2Gdk1WOBPv84UPJYLhyG7eYNIigJsgqjA7W9DJ3dpJT/w=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 08:18:06 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::51f:528c:5fde:40a2%3]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 08:18:05 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <m.grzeschik@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/4] clk: at91: rm9200: fix usb device clock id
Thread-Topic: [PATCH 2/4] clk: at91: rm9200: fix usb device clock id
Thread-Index: AQHY8CX3ow8n65Fn9EaWVn0kEww7/A==
Date:   Fri, 4 Nov 2022 08:18:05 +0000
Message-ID: <1032a0bf-989a-f834-65a8-3b8e39bad44b@microchip.com>
References: <20221103195730.1681967-1-m.grzeschik@pengutronix.de>
 <20221103195730.1681967-3-m.grzeschik@pengutronix.de>
In-Reply-To: <20221103195730.1681967-3-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|DM6PR11MB4690:EE_
x-ms-office365-filtering-correlation-id: 08e471f2-9867-4dae-db71-08dabe3d198d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVh/LbB8vIH+d8LZmH7xaSlWovQJ+CGWh2au9+jpTfVyFyeTWx6maYbvMp6o5DKCkRXBX6oV0Cha75Y/OvzGsEPiwwDPLdgN26zx+VJi+grORiX4vI0Y3XO1JBRSZxhXrclgrMhwxgsdS7M40NLHYhUZm+xI1k3oaeAxr56sF8bKZOdgMhGMAQfSay3/aLVuYGk+5hfOYKc+kcmLWY7KxrALvGWtQjUhsXo6+FJ2MzqkEJgJNoF4wSMl0XZWQEiaG/iRBLlxMoUEJYc/S6MDOFJmecv8jOnul/6ZY9YX+D+Vf/w7Mze98J9Lsq0yeAZu8DqwLxWHbL+SrWm0+F/7ie35GDzzbg5BqcYEgHg+APRRgGMDqUNNgGlOzXIxkgzqJhAqjzJbVA71F3RVStjfuboyl2BsWinxbEIcQJ1PG00xuv/Lt2uUliCcXrUSsCVIU7nchfRfOhd/urmltvbWvSpiTQiElSMzYSBWZbJrhWJA58cBgU8Gnbe9hlr6g9DOLFcs6LB3qBibttwM75RsUtOeQxKvZCQChiQl5OUUkFayqK/zPVd+MYRZvfUxR9DNmmokoJAHZIvv55teil5+GWyRX5V7vYb65YCYpAJvi3YYK8aFuxtXd52/BQGR6eSv3ZmEjgVN0pgLW1Px92RiRCTiJAHp3iKRFvDaCp4G+A2u4juq/areSi7TTYhYEWXwmuWuVVH9QUsSpNeFPp+bPjzTsmdbxKyMbu0e6t2LyPikEaqoL2EXlIcraStK/OhXKY+KIcPutcEyHwbEWfbwNAdnmQScHKsO67d2+J1hJBgWF4EBGek2DqsOLK+QeFYV/lJYEHUIKiAg7xAVsrSBOQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199015)(31686004)(38100700002)(122000001)(38070700005)(2906002)(86362001)(186003)(83380400001)(31696002)(76116006)(26005)(8676002)(53546011)(6486002)(6512007)(316002)(110136005)(2616005)(54906003)(91956017)(41300700001)(8936002)(64756008)(66556008)(4326008)(66446008)(71200400001)(6506007)(66476007)(5660300002)(36756003)(66946007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzFwUExDMmdDK3V2TGp2aHMwVnk2UStZZ0dOSEc3SGVVOGN6d0Y2dVljbS95?=
 =?utf-8?B?cFdYbEdvV1JzZmtrWHBaOTNwMmNpYTh5ZHZiek9lRHpEeDAzd0E4b2M4VFpw?=
 =?utf-8?B?ZVZ2ZDZ5SWQrbnVOVkZaQ0VuQWFPemtxRUNKeUpIb2VMTFRMZVdaRit6Mk83?=
 =?utf-8?B?RDI5YzFTVEEwUFJhZnpoRDVLUlJQUE1xV2RkUjVpcU4weDViMW5Pd1o4ZW9r?=
 =?utf-8?B?ZyttWTFzbmtQVEdqRTU2YjFIZDdvSWZ2dUVlWEdKc2hmVktnSE1QN0V6UzdG?=
 =?utf-8?B?Wi8wR2s5R3k3TzdvemsvczArV1JhSHhaTHdaTU5PSGFaOXFoelQwaThmdlN2?=
 =?utf-8?B?TVlNUFdnUkQwbU5MQUIxNDcyN1E0SGthdEYweWtSM1I1R3JCTFEwbk8wWmFW?=
 =?utf-8?B?Q1JwcUJQYjNYNzhSYk1EMm05cXplNFIvcUpWTDNXS0pNSFFpV2czb092R2JN?=
 =?utf-8?B?Y0ZsWkhiWGUzeUdKbjF2bW9mMjVhOHBzYnRrMndsQlpYa1pYbXc1U0FrUVIw?=
 =?utf-8?B?WlA1d3NGd2Nab2lDOStyVy9oTGI2MnVqT0ZnTllTYkdpdVB4UEQ4VlNYc2hM?=
 =?utf-8?B?TXRNcHdWUHVwMUh4TXkxTFZ6Snh3akNicmw5ZXZiNEpxZjlnSjQ4QnE4NHBE?=
 =?utf-8?B?cVVucmIybk9HcHpYVW1xa0g5emxUd1ZiczcySjljVkNzT1hBblVNakJPTGY1?=
 =?utf-8?B?T2pockh6TEc3MXAyaHQ4QlFKbWNNL1NTNWp1K1NqM210SVY2ZDcrNGFnL0JY?=
 =?utf-8?B?TEIxYUN0dWVQUEhIZi9Bd1NnQzJSVDBSb1A5Yi9LcWxKd3VIaVlpMHJrY1Nr?=
 =?utf-8?B?WW5pS3grVnVHOGtMQ0U3SGE3VldDc3hOc2hvNUdZSHJUR1NjYmQ5MDkyZG1H?=
 =?utf-8?B?MTlUMndKTHAwZzVWNllBb2tSLytGaWtVVkl1Y0h2UnBNb0pHQjZ4UUZBelFY?=
 =?utf-8?B?MnVOcHp0ZDJsNWhVUFhOa2Z1TGt5Mk9yWWlBMWRjZUJqUVRyY0JNdFNMOWow?=
 =?utf-8?B?Rk5GNEg3cVl5WVcxa0tkMWgvMGNoWjM4SjIralRqNGQxUlRBcnJsaUcvTEt0?=
 =?utf-8?B?Z2VLRjZQSnpmSEhyMEpsbUpVK3BYYmVSbHpzdHl6T2hWMnFNa2JBM0d1dkE1?=
 =?utf-8?B?NFgzRjFTQXpoVWRNOEV0cTJtaE16bHBBNU8xRzFnd3k4L0Z6bGdEYnA4R3hD?=
 =?utf-8?B?NUtFYW1xM1MyWUlaWUJyNDJiY1R1N1Y0dHBZWU5YUm5XL2VJS2syUWNYT3Jr?=
 =?utf-8?B?aVRicEZXMVU1aGc3M3pIOU1yQktJMUhxKzhFWXZiWnA1bmxXTFBsUFVvdE02?=
 =?utf-8?B?SWRQcDh6T1JWbndpaWpqQVZnUm9YdDBHcllEcUtFQ2d4aU1HbjJtR3JGYllJ?=
 =?utf-8?B?RXJ0eFIvd2laZHVPNGNWaUREdHlvVDA1UTROay82Q2N3TklmOGFWUkJFd1Fq?=
 =?utf-8?B?cE96TE1HcjZwQk9wSmFGQnhHZWs5Q29mNWhFM1VvUU9ZUkdqaFlENzhHWXlz?=
 =?utf-8?B?dmxkYzZNYVR1QitNMHA2ZFp0VmljTXBBcysvNk0vSlpFbkwzOHM2M0l3bitX?=
 =?utf-8?B?b0JFbWpDSFhqbGZkSDlETGcxQTNUVjc0M1o0cnU2bDBCbXRlTjdSRlN4V2ZM?=
 =?utf-8?B?VG11ZFFVUE5MZ0xVOFMrK0RwTWZuU1hMcWw0Z2h0K1ErRzBPb3duQ1U0YTJk?=
 =?utf-8?B?NHdLa3pxSTV4QkxGN3FsdXBjcHR2WTQrTFk3L0ZJZi83eVpqbEFiN09NempB?=
 =?utf-8?B?d2VxcWdMU0NhK0FhQTVUblpZc2I2Sm9UYWdKTVJkT0sxaXgxczF4eVhIQkhu?=
 =?utf-8?B?Rk42WGQrKzZLNSsxZEFMRkpsRDgxYzJ0TUVndUZEREJyYlorTGJtelFxVGhQ?=
 =?utf-8?B?UUJoSm1EZ2hhRzZtV0dlcUVsQVZIdGExcWQ0T2x3eEVTS0ZXanB1RlNia1dJ?=
 =?utf-8?B?TFR5ZWRSM2ZBM3J6UEoxN3JtbWFXUE91Q1k0bVZtK2MvUkRjU1I0VHlxZW1J?=
 =?utf-8?B?YlJzbVJ5TkJyWlMxN0FNNHBpVFlCLzFxYm9iTThwOGs0ZU1PNkpGTjJ3bXF6?=
 =?utf-8?B?OEZkeGlKRmc3WU5JUyt1ejJPRjlGTys4RXF2a0R2cnp0bUQ2STVVeWttdDFk?=
 =?utf-8?B?QkV2VEFIWUt1TWZ2N1dTSlZwaDlkbnpUNVN2b3M0OU5SMHk0NWJQalNlV292?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFFD341BFF06E948A6D1200CA2046C73@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e471f2-9867-4dae-db71-08dabe3d198d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 08:18:05.7043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xtJeSiNmaPPBlX85I4chZws7Hdr5+tFTu6uTbMu4WbUEx9wrbNAwY+cUXWokrLCLzhqoNkFhShcG/6fiQ8aRMSOGvgTDzMqc/0o8i131vKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMDMuMTEuMjAyMiAyMTo1NywgTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IFJlZmVycmlu
ZyB0byB0aGUgZGF0YXNoZWV0IHRoZSBpbmRleCAyIGlzIHRoZSBNQ0tVRFAuIFdoZW4gZW5hYmxl
ZCwgaXQ7DQoNCmV4dHJhIDsgYXQgdGhlIGVuZCBvZiBsaW5lDQoNCj4gIkVuYWJsZXMgdGhlIGF1
dG9tYXRpYyBkaXNhYmxlIG9mIHRoZSBNYXN0ZXIgQ2xvY2sgb2YgdGhlIFVTQiBEZXZpY2UNCj4g
UG9ydCB3aGVuIGEgc3VzcGVuZCBjb25kaXRpb24gb2NjdXJzIi4gV2UgZml4IHRoZSBpbmRleCB0
byB0aGUgcmVhbCBVRFANCj4gaWQgd2hpY2g7ICJFbmFibGVzIHRoZSA0OCBNSHogY2xvY2sgb2Yg
dGhlIFVTQiBEZXZpY2UgUG9ydCIuDQo+IA0KPiBDYzogbXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20N
Cj4gQ2M6IHNib3lkQGtlcm5lbC5vcmcNCj4gQ2M6IG5pY29sYXMuZmVycmVAbWljcm9jaGlwLmNv
bQ0KPiBDYzogYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20NCj4gQ2M6IGx1ZG92aWMuZGVz
cm9jaGVzQG1pY3JvY2hpcC5jb20NCj4gQ2M6IGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20N
Cj4gQ2M6IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEdyemVzY2hpayA8
bS5ncnplc2NoaWtAcGVuZ3V0cm9uaXguZGU+DQoNCkNhbiB5b3UgYWRkIHRoZSBmaXhlcyB0YWcg
aGVyZSwgdG9vPw0KDQo+IC0tLQ0KPiAgZHJpdmVycy9jbGsvYXQ5MS9hdDkxcm05MjAwLmMgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9hdDkxL2F0OTFybTkyMDAuYyBiL2RyaXZlcnMv
Y2xrL2F0OTEvYXQ5MXJtOTIwMC5jDQo+IGluZGV4IGIxNzRmNzI3YThlZjhkLi4xNjg3MDk0M2Ex
M2U1NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9jbGsvYXQ5MS9hdDkxcm05MjAwLmMNCj4gKysr
IGIvZHJpdmVycy9jbGsvYXQ5MS9hdDkxcm05MjAwLmMNCj4gQEAgLTQwLDcgKzQwLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBjbGtfcGxsX2NoYXJhY3RlcmlzdGljcyBybTkyMDBfcGxsX2NoYXJh
Y3RlcmlzdGljcyA9IHsNCj4gIH07DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzY2sgYXQ5
MXJtOTIwMF9zeXN0ZW1ja1tdID0gew0KPiAtICAgICAgIHsgLm4gPSAidWRwY2siLCAucCA9ICJ1
c2JjayIsICAgIC5pZCA9IDIgfSwNCj4gKyAgICAgICB7IC5uID0gInVkcGNrIiwgLnAgPSAidXNi
Y2siLCAgICAuaWQgPSAxIH0sDQo+ICAgICAgICAgeyAubiA9ICJ1aHBjayIsIC5wID0gInVzYmNr
IiwgICAgLmlkID0gNCB9LA0KPiAgICAgICAgIHsgLm4gPSAicGNrMCIsICAucCA9ICJwcm9nMCIs
ICAgIC5pZCA9IDggfSwNCj4gICAgICAgICB7IC5uID0gInBjazEiLCAgLnAgPSAicHJvZzEiLCAg
ICAuaWQgPSA5IH0sDQo+IC0tDQo+IDIuMzAuMg0KPiANCg0K
