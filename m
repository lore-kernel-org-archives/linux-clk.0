Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697A4C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 14:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbiDHOSu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 10:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiDHOSt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 10:18:49 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C840C17A8D
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 07:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649427404; x=1680963404;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Sbe2+ING/E4CCYJxUlK24TJ7/QUfQIMtlQmmC4xYBfg=;
  b=0mhJj6csLUiU4PjcPhKkD7p98CFSIO6e58IQFz183xhqCrJfSEt5Vvwe
   tp/PGDmiG1fKyD+DUAmmWxhyX50ZqKO4vR7kiATlmWT4mVoZjYibfAK8H
   0xtqc6pi/bu1LUxWY0cAtCQXLRnj8UyYQdqBbilHAQjVyMWJkWIF8mdIW
   ou/gUbRNUOFsj+hKrACK1oSEn/6JmwtpkTbRSjWoVegMMMRr4hwkiBBAs
   AuP75FcVle0ZVHrVxpqGRupDDrklcrgJ0Z2BZnCadVTIFa+lWjxoLb0t3
   D1y1/6NWGrqNbGuMqHC4xM3KWILKxSYZQkzZ5/z/MoGAreNZRw2TVqE54
   w==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; 
   d="scan'208";a="159869713"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Apr 2022 07:16:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 07:16:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 8 Apr 2022 07:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiHWzcaR8JXNdgeO/BB8XHz6XlIyjwCQccC9ZPlqshrh7KWfLhG3dFxjb5iARs/xlKAJDtkh6Rsjj48ACTH/AIUOyCc3Ej+tz73Omy3I+1jJMsr3wWludJ59WsZ+Q20m3oP7h7lb01cUlPaQSsJPq1wNyPtEyURd09Vz555wYl4wYyntA6pTjjDd921vq0UdiTS7zsoANQRKVCGk/ouT2lVPcWlbdz6vi9NMdfLLuMpWeAbXacKwiw+mF8WdOljDesJos+/2wplqZ8nLQ5fsS4wAEhD9HBG3Nqe/DCgrMpTRNnU0hu51+VXEHgQy5gRyG10G4uvm2mXTxG8eX9ukww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sbe2+ING/E4CCYJxUlK24TJ7/QUfQIMtlQmmC4xYBfg=;
 b=Z25UmtSwQ9xYUql63yMD0MjGAg9gG9GnRxe6ZHbX6ix+MQUmCDV8G4fRv9ugwDf2jxtjNjCdk/SyvygcO7v3gHWH5KFbCAwmVI8mOB1+6Qj1lZ0k3Do1LTQ5jD/JklAeee8zf+4MCrpmNORIfA/5OUm7vn4jXJ+0Eddk+BE9bPAdL/WWeBJ9gUxm1RjOSsQdgd1d87o5gLd/uzMwCC5ugJfDnpOi9FyuO1UkkJ0eVaVRNv0Op+Lv8H75Dr7BX91UB8Q2rYn2aRa/9NQKxp07amsatzlL7wuuHI61+UMiyjbb+OUe8q2ahkXBU+FVnD9ahCaBShDnc0F2pSgi6a2LRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sbe2+ING/E4CCYJxUlK24TJ7/QUfQIMtlQmmC4xYBfg=;
 b=WA1fB3roM7PVl4OVAe+z5L2xN9/fbf86yYeadlTqtjNR0JrbWkzuRVzMc4sad/aIMFXmbiAisFHyJq7dVD0cGCR4PYAmxgD5ai904HnTguRXUV28kXaRU3Ywb5ZTg6OLTI8/OylccCqra/Vs3qr6UOzuuYNY/L6mPtj3dIej8Ro=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 14:16:42 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 14:16:42 +0000
From:   <Conor.Dooley@microchip.com>
To:     <andrew@lunn.ch>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <Daire.McNamara@microchip.com>,
        <linux-riscv@lists.infradead.org>, <palmer@rivosinc.com>,
        <linux@armlinux.org.uk>
Subject: Re: [PATCH v1] clk: microchip: mpfs: don't reset disabled peripherals
Thread-Topic: [PATCH v1] clk: microchip: mpfs: don't reset disabled
 peripherals
Thread-Index: AQHYS0qp5nLbv82Rzkqpqwk2Zn/CP6zmClsAgAAFfoA=
Date:   Fri, 8 Apr 2022 14:16:42 +0000
Message-ID: <4d840171-b483-7a0e-f078-b701fc858421@microchip.com>
References: <20220408131352.3421559-1-conor.dooley@microchip.com>
 <YlA/GEA0uai/s0g4@lunn.ch>
In-Reply-To: <YlA/GEA0uai/s0g4@lunn.ch>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ccc547f-d136-4d8a-12be-08da196a67b6
x-ms-traffictypediagnostic: SA2PR11MB5100:EE_
x-microsoft-antispam-prvs: <SA2PR11MB51003CDEAB9BAFF084505BD998E99@SA2PR11MB5100.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IaEvxyZ0DS0Dv/pOPzNOFFQsRQY3fbtFLPqI5WetNoG7JmXjuNcSfa32M3t2OalDCQyt0IX9yZbgOxJYVwmoOuOV+RRHjmvWkgZSHcLkqFDF4bapBKQJCyyUlBhpxN95cYpdAgMnoR+lnsoRe7xC3g0dTCIvjaswiqAQvUBmYWUbeVfMegxKtHA0WQTrGdRYj93MbPVpqB42ecOVmw12dflsZEBOz8V3OpXcLYH6EdFTzJk5IgGkXDtNZMeI6UTo7Jn7VApIJfNK0Qh9ulg72W9eb2Ll0e2J6RYyzYzzw/Fog7RVotZPNm8n5vejWGM1T7til6ndWd7WmSL8vRlJQSqZlmoWjndzakpEL6uMpNSWzZaDzt48XRUSlxgSU85wbJ3p41tiF2jgNRlHPfxdJ1Dp1Vw1Z2AAzMAITFX70YI1jSxmqDhAZFaLmgfF8oOeppbkWia8LYzbng6oM/qfky84FtvoRaO+JAEzRVUWhlejD0yjT91LmruR8oFsU4v3Iu6tcc4QFGTgmxVuEjCWsCu/kDRQbpnbFyqAnF+4FZCuRdtOA6QzqxdzPg3Lul8vxl0wSUzdqUKMJpZb8UqPXrrwEy9U2+Jrh55fCcaa3HRONdEPaHEBYIfLxAgn+xFj9qMDVdxWjg5g75d+nh9YsF+zarBPnL2xmuhP/zRepUCf4eIQKfBKgeaR/h94o5TAhBQd0vFTPCbFoiVfNYLCDuRkyuUtEIXjqO0H/CQeE9jXNfj5vfd7JJd1DHMDzkFndK2Jiru/lUcHGrAv0YYVw2wuUryOTHKoN3QbVk6MGtd4fnuOa12D3AbAyddGRkX06NLcQyj4HVWE/8Vka5MLr+Kc6SR28w9rhWoj2fqF4vc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(122000001)(38100700002)(6506007)(2616005)(26005)(2906002)(31686004)(36756003)(8936002)(5660300002)(186003)(53546011)(83380400001)(54906003)(6916009)(76116006)(64756008)(31696002)(8676002)(66946007)(66446008)(66476007)(4326008)(66556008)(86362001)(316002)(6486002)(966005)(91956017)(38070700005)(71200400001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDZidUY5SmRpLzlUUnRQUWhRalRqTERVTWh4dVVUeU5JSXZ6ZVNiTlFabi9P?=
 =?utf-8?B?blBaTjRMcy94WnhvMU9tVm03Z0RaMmJvdEFvdjJwcFNhSGxIdjRpY2NyNDNC?=
 =?utf-8?B?YkJPL21KZGN5amZkVmVRWDRKM3pRRDFjUDRta08yQW90Y291RnJBMXdZU0pP?=
 =?utf-8?B?ME1JeDRsUlNxK2JYM0paczFOWmFETFdyaXBod3MwWVhtaEFQeHlocG12UXA5?=
 =?utf-8?B?S3UvRkd4OTNkYkRnbTV4V1A5NzlpRVpoYjlLQjF5L3M0WHQwenFvS2JGWTl5?=
 =?utf-8?B?VWpUY1dtUjRaMFNXb1RpMCs5VjU1WlJOcGNzYXltOWs5VkhsN0dEOVRUWEZH?=
 =?utf-8?B?cEVSZ2lkUk9EemNiUFBnajY5bXRTK2UrU0ZEbFI4YUFxcHRWVUxKVzRGMmUv?=
 =?utf-8?B?elBsZG94aUtnSXhkM0k5c1pqMStZUFBHUjl5WXB2Qit3YytXUEVoTERuL2pZ?=
 =?utf-8?B?R0Y5NGpETEJjUTNwcjhUakRPYlo0VjdFY0tBUk8wcWY0WlRWQWo4NjU5WEs3?=
 =?utf-8?B?anJrNnBVNWkrUWZnL3hIbzRlTFdrbnE3Ukp4UFQvSmFFamlkb1FwOUFWMUpp?=
 =?utf-8?B?RDdYN3g4RDJWa0VjSGFtS3ROakJhVHFpQXN5WFJZT0g0WGdyTkoxMjB0Ymt4?=
 =?utf-8?B?dExnZFBCTHJQczJzK1RnczJYdFVFT0lhYjJTbzYzNi91SW50VU1ESm5yN1ox?=
 =?utf-8?B?eVZaSkVXb3JVZ1VBY0d2cTJGMjBSemVzUzB6cC9MZnlkblk0NDU4cEF1QTgr?=
 =?utf-8?B?WFk0YW96U0d5cnNsS250UndHN3RWZDVYUllxREZOOVcySGlWQlNGbGFoaE9h?=
 =?utf-8?B?T2plVENpSGJSZHFPQzV0cXVxcjdQVkRKcURhMUk1YlJ3elRaT0hyMFZ1YjBQ?=
 =?utf-8?B?Ymg4TmZNbWV1bWdtTEtIVlJNQXVBNXhUamxCMGtPdnFmNUZFZkY3V1VsTE9q?=
 =?utf-8?B?UkFqWjBtK2QveWFzYzIxVkNtV0FkZi9Sc2I3elN5LzhqOXpoRC9vZExxMnRM?=
 =?utf-8?B?NEduU2tMNWRtWnBMQW8raVJ5Y3I3NWwzbDN6SUpBUzlWNjJJTEp2RFJkSXd4?=
 =?utf-8?B?bEhKNlUxRStYV3hWQ0Q1R1ZBZ2J4RHVab0x0MDNlVjRHK3FkclBIdW1XVzU4?=
 =?utf-8?B?SDBEQVdrSnB6amlUWjhWME9Dam04SlNzS1FWUXQ0YnJ6bjJ1UGRvK0RqZWps?=
 =?utf-8?B?YlN2WTdZQi9nQ3JIMmhYVy82VUpJVHlwSXRjREVNVVhmTHZLRjZrUXlxMmRk?=
 =?utf-8?B?NFZyczRWcFcvcUlCbUhsS0NnWnJ1Ym1xeU9NQ1NTdU5WQitla0g1Si9EOUNB?=
 =?utf-8?B?Vk1RdmpMWnovTHJMcC94ZHR6STUxVmhubzNUQzB3My9hbHVRdUdhczVLcG4x?=
 =?utf-8?B?QW82ZmxsZzBkdG9VVjVmQkRRQVNYM3BKTUVHTGNDMG43MDNSc2E0bVN1Yyt6?=
 =?utf-8?B?bGsyQ0ZXWi9DN1BKWmlTRm5odlBlejdrcGlvR1l0WG5vSFFESWM1Q2kvNUZp?=
 =?utf-8?B?NG1nQS9CZjRQd0p0Y0RDbmd4OTZpdHc5SXpCekpHeUE1L25BWDZSUkQzRE50?=
 =?utf-8?B?YURqTE9ENHMvdUozdVd6bzB1cWwxS2FaODlMYUNNdUZ5NE4wZjJKamUwcXVW?=
 =?utf-8?B?UjRicEdnMzdKUjFmQXpWTnFveitNNVl1R1pwTWNmd0Z2YmszV01nc3FKWEgr?=
 =?utf-8?B?ZHVKeVYrVjNHSGk4dU5kZ0pjbGNsTTdmMGx0L3lyUUV3T1RHNWZUdnU5Ynh6?=
 =?utf-8?B?bUdqNlBoZ0RJRU43bXdoWDc4WHBkNTJ3QlpLc24wdlM5QzNITmVVaG5OTzhw?=
 =?utf-8?B?SGszeFpHYlRCNXJPNzZRK3MveXh2THNPeE91RFZZNEwxV29rVkdsbDJ2Z1k2?=
 =?utf-8?B?QXZnRkczS21QcUxTKzZFVHhrS2VkYmxzQ3dCYk5kK3p0aTl0QjQ3c1hmTW5q?=
 =?utf-8?B?bEVnSElDZDdFaVprc2JtWjlmTlZObVNTbkNHVzlXU0hhMW94dmRzYjZ1Ylp6?=
 =?utf-8?B?MEFydlMreThaemhGTE15WmwrTHNBQ1BwcTh2RW1TeUh1OXl4K2FFRGdNVFRL?=
 =?utf-8?B?aWxpVnpRWURrR3gydGNJaWJSUDUrRzVZb3JySjgvU2N0SlhYUkJsOVJYa1NK?=
 =?utf-8?B?UEh3MGhMOXJBbGVjQjA4cXQremN2L2thKzdTbDlKYk4xcjNuaU9oa1RNUkdl?=
 =?utf-8?B?eXhHSGJXL1lvaWc0aUExV3FkbGxSUWdSeU1aUU5kOURsTXFGakFSMVFxSDhO?=
 =?utf-8?B?Q1FFNnlLdmlDK3B6R0NHL0pnR2tsMnFUVGFkL3NFUHV0cnlqU1B4VURYbGNx?=
 =?utf-8?B?N2lXOFc2TXZ6RXB4VXFyb0ozcDVra3VSYnNxTGoxL21TTkQxMHVJdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B531C59B5498B943AFDAFFDD4AF7F742@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ccc547f-d136-4d8a-12be-08da196a67b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 14:16:42.2466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QEBO/EFDKnxohkbwHygnjiiiKlMzSD1ao/yNNbj/wLEXaoRKs7Pa7kVxkx9VX3LGH+ahXpNlKt03T3EsnkzCa52UrnQKtDEUcN3JOD7b6NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5100
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQoNCk9uIDA4LzA0LzIwMjIgMTM6NTYsIEFuZHJldyBMdW5uIHdyb3RlOg0KPiBPbiBGcmksIEFw
ciAwOCwgMjAyMiBhdCAwMToxMzo1M1BNICswMDAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+PiBU
aGUgY3VycmVudCBjbG9jayBkcml2ZXIgZm9yIFBvbGFyRmlyZSBTb0MgcHV0cyB0aGUgaGFyZHdh
cmUgYmVoaW5kDQo+PiAicGVyaXBoIiBjbG9ja3MgaW50byByZXNldCBpZiB0aGVpciBjbG9jayBp
cyBkaXNhYmxlZC4gQ09ORklHX1BNIHdhcw0KPj4gcmVjZW50bHkgYWRkZWQgdG8gdGhlIHJpc2N2
IGRlZmNvbmZpZyBhbmQgZXhwb3NlZCBpc3N1ZXMgY2F1c2VkIGJ5IHRoaXMNCj4+IGJlaGF2aW91
ciwgd2hlcmUgdGhlIENhZGVuY2UgR0VNIHdhcyBiZWluZyBwdXQgaW50byByZXNldCBiZXR3ZWVu
IGl0cw0KPj4gYnJpbmd1cCAmIHRoZSBQSFkgYnJpbmd1cDoNCj4+DQo+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi85ZjRiMDU3ZC0xOTg1LTVmZDMtNjVjMC1mOTQ0MTYxYzc3
OTJAbWljcm9jaGlwLmNvbS8NCj4+DQo+PiBGaXggdGhpcyBieSByZW1vdmluZyB0aGUgcmVzZXQg
ZW5hYmxlL2Rpc2FibGUgY29kZSBmcm9tIHRoZSBkcml2ZXIgJg0KPj4gcmVseSAoZm9yIG5vdykg
b24gdGhlIGJvb3Rsb2FkZXIgYnJpbmdpbmcgcGVyaXBoZXJhbHMgb3V0IG9mIHJlc2V0DQo+PiBk
dXJpbmcgYm9vdC4NCj4gDQo+IE1heWJlIHlvdSBzaG91bGQga2VlcCB0aGUgY2xvY2sgZW5hYmxl
IC0+IGRpc2FibGUgcmVzZXQgcGFydCwgYW5kIG9ubHkNCj4gcmVtb3ZlIHRoZSBjbG9jayBkaXNh
YmxlIC0+IGFzc2VydCByZXNldCBwYXJ0LiBZb3UgYXJlIG1ha2luZyB0aGUNCj4gYXNzdW1wdGlv
biB0aGF0IHRoZSBib290bG9hZGVyIGRpc2FibGVzIHJlc2V0IG9uIGV2ZXJ5dGhpbmcsIHdoZW4g
aW4NCj4gZmFjdCBpdCBjb3VsZCBvbmx5IGRpc2FibGUgcmVzZXRzIG9uIHBlcmlwaGVyYWxzIGl0
IG5lZWRzLCBhbmQgaXQNCj4gbmVlZHMgdGhlIGV0aGVybmV0IGZvciBUUFRQIGJvb3QuDQoNClll
YWgsIEkgbWFkZSB0aGF0IGFzc3VtcHRpb24gYmVjYXVzZSBldmVyeXRoaW5nIHN1cHBvcnRlZCBi
eSBtYWlubGluZQ0KY3VycmVudGx5IGFyZSB0YWtlbiBvdXQgb2YgcmVzZXQgYnkgdGhlIGZpcnN0
IHN0YWdlIGJvb3Rsb2FkZXIuDQpJIHdpbGwgZG91YmxlIGNoZWNrICYgbWFrZSBzdXJlIHRoYXQg
dGhpcyBpcyBleHRlbmRlZCB0byBhbGwgcGVyaXBoZXJhbHMuDQoNCj4gV2hhdCBpcyB5b3VyIGxv
bmcgdGVybSBmaXg/IEl0IHNlZW1zIGxpa2UgeW91IG5lZWQgdG8gYWRkIGEgcmVzZXQNCj4gY29u
dHJvbGxlci4gVGhlIG1hY2IgYWxyZWFkeSBzZWVtcyB0byBzdXBwb3J0IHRoYXQ6DQo+IA0KPiBt
YWNiX21haW4uYzoJLyogRnVsbHkgcmVzZXQgR0VNIGNvbnRyb2xsZXIgYXQgaGFyZHdhcmUgbGV2
ZWwgdXNpbmcgenlucW1wLXJlc2V0IGRyaXZlciwNCj4gbWFjYl9tYWluLmM6CXJldCA9IGRldmlj
ZV9yZXNldF9vcHRpb25hbCgmcGRldi0+ZGV2KTsNCj4gDQo+IFNvIG9uY2UgeW91IGhhdmUgaXQs
IGl0IHNob3VsZCBiZSBlYXN5IHRvIHdpcmUgdXAgZm9yIHRoaXMNCj4gcGVyaXBoZXJhbC4gT25j
ZSB5b3UgaGF2ZSB0aGVtIGFsbCB1c2luZyB0aGUgcmVzZXQgY29udHJvbGxlciwgeW91IGNhbg0K
PiB0aGVuIHJlbW92ZSBhbGwgdGhlIHJlc2V0IGNvZGUgZnJvbSB0aGUgY2xvY2sgZHJpdmVyLg0K
DQpZZWFoLCBhZGRpbmcgYSByZXNldCBjb250cm9sbGVyIGlzIHRoZSBwbGFuLg0KDQpUaGFua3Ms
DQpDb25vci4NCg==
