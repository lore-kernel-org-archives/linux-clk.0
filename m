Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CC2CCA47F
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 07:41:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236727AbiGSHlt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Jul 2022 03:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236921AbiGSHlZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 03:41:25 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0DF1A832
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 00:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658216485; x=1689752485;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2ryuvoMRGNsVWuRC6apOG5kvfPquAvHgv9NXg4wG0n4=;
  b=NcZXKw1+CyxsD6wVR0ZhKASqQ/0PVD6Y1usm/OqNfm8LRxCQ/i0RxPjI
   l06EWQBfgLl2JFx4NDtLNtEMy4rN6AoAy50kFnB2CHhYxQD0wZoZBunFi
   KgBbU7MFadySA6bN5prcAPLnLZYVxBg6LY05GfgKAuNmUqFe4xLPrpBLS
   5xVZ90kNfhkBY0cNZqhhK4yIbkMe6/WN2BXcivEY4wdZGyd0pRMImOa2t
   bpXaIQROs1+zCDodvB5pbbvt21qaiATsCV3CQKWDahbUwsC9/AHWQn4hM
   MzlBMsciGr5e48KBYGzJxS4K1xJWX89bxGkFxkF036Qew6uRCHJjvj4My
   g==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="172893094"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 00:41:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 00:41:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Jul 2022 00:41:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eoxh9SCPZpx8t2Z6WG4Ej/gsZMTkGLr5iSkmE+IJLX9aKyOG+fdNhcsYDeJwmU+Mald/zqF4ded0/fGHgrknlUnuD/VPNvpwrk0rdxNv4l/97YkdDflspB12mn/4Od+1GzsGcqoSrihkOk8oOW/mqnbGzru/3oC+Xyqr6bkgIUwqWf0kgoUXSErRi2RVXvAJqkbrhRMmpOpfF2HBnwl1IAgl9obuE2RTuQpGpeAEy2F8L7c9b9nw9yo7tpwLPLukeMfDFQxJ+SRYlry6WDiSydnyA0dhCexXfLSdqBeFGy5UNJYkUgZY5VrE50beY44REguyVSN77UqdnK2w1LDDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ryuvoMRGNsVWuRC6apOG5kvfPquAvHgv9NXg4wG0n4=;
 b=B4RuebUXh5SOcOIL1rmmaHBiaLEBlpIS+CQScEPHACy05jLkgmJ1okUh+pBPkTKrgpEqCMGanua3PnTzcF4BZ2Iad2XsqPyIwRwtA69Yyp3v1CzmaZIm8T86vCduPjMeZsXTxSyXWLtsBYasCXmTuNkJGOqO/Md5redZvLONQFc8PqUwkexPrFivz3IgRZt7OzhWYo4fU3OkPSAwuhCE34SKBDo0mYYP0qaUZsfN86l0bm0fVfUJri+NODSnhJMPZnbFCfeIqn/oEyNHx+FJfpa9+EStLdndaaNqp6gqOO1el42rSdV2v34tTIgjA7vJ77Cofy8xxkY0IcxiasX5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ryuvoMRGNsVWuRC6apOG5kvfPquAvHgv9NXg4wG0n4=;
 b=moJ37oG4yZ1rB+Ujl+L0hFBad5kDY09xI32vlKGl+UJ6UddX2DUCl3r2+INU+1YjVxvhwryb54KiIHMI3kN/9JYxLliBk7sNpLEHqSgyOONuToiTtogp6R3wwEFo18rWuHTER3WyhEh6jGSdGSSDFiHQpSY/hfygc4vw4dHAgW0=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by MWHPR1101MB2208.namprd11.prod.outlook.com (2603:10b6:301:4d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Tue, 19 Jul
 2022 07:41:20 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c%8]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:41:19 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] AT91 clk fixes for v5.19
Thread-Topic: [GIT PULL] AT91 clk fixes for v5.19
Thread-Index: AQHYm0LvryrNHRiQO0+G5XcTPgAqAA==
Date:   Tue, 19 Jul 2022 07:41:18 +0000
Message-ID: <b5075c91-5ee4-ee1a-f492-f4495c63a2c7@microchip.com>
References: <20220712100605.898385-1-claudiu.beznea@microchip.com>
 <20220719070321.D3D53C341E3@smtp.kernel.org>
In-Reply-To: <20220719070321.D3D53C341E3@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5122207-9900-4204-5e69-08da695a1195
x-ms-traffictypediagnostic: MWHPR1101MB2208:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tt9lKkcPgKROhamfJstMmAqcYWB3d76kSXZUCd6fyFYegCDroPjkrQ+vRpXov6+85+WvzyAkVm92YibIWT7fEMuXpeDt8ep1JV6sBsnpyBHz/g2jP3nH4Hsa3QXEha7eoSq2FCijBMlUfgj9uBkDs1jca21ql/UEQ3uVQ5AHHB+DSUlYroI/xUpicR6Kejw1N6+86L7zpKOp+FEdOw8ctscVlMY+5xoJspImhMBH1Pb1MDgU2p6Lv8nzTZpjlu4bZxGkXj2rtZ9V/WnHzr18QqTngK+gHvT4vhjX8/C35KIFbJIQ1SR++VdOUm6vUOb7lroJCxA4Ks1rolw7P3hn4x8rioln5rZlOOVyN4tJ9O80VZDD4Qn4obEMUK3rGhZQAm3XAuLEJwm0HseCz9E8Gxx3VbKSjcU5MGvAh7rIRvZslMUwhKSw1TMKph6+K+thub8+HAwdm5qVpbhIR2ViHvMyK6h384we2EONp4LzDbaf2pt5dQM7NZltv5JAi0Q64V4MJXydz6Njj2XJuH225W1ArmWd9t2dW3qDSh1i6utW/IH10rHYXNU/uH+I40YUr3/XZBLw+sEKFSo0CUNikkHqhQEeDMB5+YgcBEUcCQQ4tZ3JFJavCyLbJhFV03Ubp9VLZLB9sM5FZrc4ewm/Bouslez8WmpnLFB12h5djXsvzYBlD5MyY9zvlsF4Fu/PZL895zyMNUUFjYnG2d9yJDHkgoRAK3BI/QVMrHxcCaPrXWeusuhgMRGYCocucyacg+Be1clNpGvE5t26pIS5MCifbZAgMKQnrpDZeDk/r/qX6vE0ESCZBwkQIbqhuTawV/DUAJiAYeY0yHFe4bPpkDObhDCd9OPl+rBcB9BXCQ0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(366004)(376002)(39860400002)(66946007)(38100700002)(64756008)(186003)(316002)(76116006)(36756003)(4326008)(110136005)(31686004)(91956017)(66446008)(71200400001)(66556008)(66476007)(26005)(53546011)(478600001)(31696002)(2906002)(6486002)(2616005)(6512007)(86362001)(41300700001)(122000001)(6506007)(8676002)(5660300002)(38070700005)(83380400001)(8936002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkpMOEZEY0t0Sk1EN0JZTDRySldET3MvT2VYcnR4bVVncXZlNDFlYVVqa2l6?=
 =?utf-8?B?ZHM2dHNhK1ZiN2FXdzRIdUt5VG84QXFrY1ZBY3phR1NDMFF3ZVN1UzJIS3Js?=
 =?utf-8?B?SmZ3TnlvemNyU3lneE9nQ3VNRlFXUHFIUDBVMnBxSXhjOEEyVFc1V296QURT?=
 =?utf-8?B?OUszTWZCQ3YrbHZXWWRHZkRlSGp1UlAxaU5sK3JTUGFiSFc5VkI1d2R0UFhj?=
 =?utf-8?B?cnUwMEMwOEdXSXNXVVpRNUZRb01Pc1lqZ01JNXpmWXJGNFc5elh4T0Z5d3Ez?=
 =?utf-8?B?bitFcE1HZHFrMDBGN0tveTlocU1Uc1NVREhLR01OQXNJbEFYbVpXaFFmcEJH?=
 =?utf-8?B?VlpkanpYSTVZWHRkTDJpaFFZc21ybGV1dHIzajBtWjFjamhmQVd6TkRBK0N2?=
 =?utf-8?B?OTdXWnJZWVZHRkh1cGwvaStYdXpmcVVhV0UrR3hxeWNVVTJZZ0FBbmpaRTVs?=
 =?utf-8?B?ZGtWRGczaHRZQTZuNDJTY0lwTnZ1Yy9qWmlMSXE0TGhvY3Z1eUY1QlVlOVZM?=
 =?utf-8?B?bkQ4d3pROFNETXdQSDRhNzNhdE5CWkpWNzRncWl5aTRDOWZzdmxWSnhIS1hR?=
 =?utf-8?B?NTZNQk03YTBQU0N1cnhjY0Q5MVlNdnBaTTM2KzBXUDhLN1B6ckZVUldQdmxY?=
 =?utf-8?B?a0Nhb1kxZzZISXFvV2NrdVBJL292ZXMxUndvTHJNMzY4RTNWSVk5ZHJpQ3p6?=
 =?utf-8?B?eGdlejNtbzQ2MUVzbzA2djJMTklTVzhTckpZbU9wSnNCRkJtQXZpci9IU2p1?=
 =?utf-8?B?VzUyTWZhOHdtZnFDd280TnYvcW94aG1xcGhIVEVaMzExS092bWd2YzRVZkRC?=
 =?utf-8?B?V0diN1pPSytGY2xXQ3NaQWkwTUk0V0pEdWR3ajg2KzNNeGhrbWFDMUM1ZzhM?=
 =?utf-8?B?YTc3RFFidFNHVWhPTXc1aFhNRERnbG5YY2VxdGNQT01SOTB4QzEwU09rM2Nt?=
 =?utf-8?B?WEQyZzhFWlpFU2laS3BaY0xOcVJWMEtZN21KQ3pyb0NuSXNlellpTzVQbGxU?=
 =?utf-8?B?ZnVRTWV5bWdWOVRGWDlaQXZLby9NYjR5VTBkZnB0OVlRNHRYWVVnTS80Qkli?=
 =?utf-8?B?UnliYzhyT0lTcW1GczYvaER2VitIcXczbnpXSnFaN3RIZlZuYlZOUmZNT3Nx?=
 =?utf-8?B?M2duaDBuVmVBTjR2QXNFdE9VN2hwSlpmLzhKZjhjT1BVbE9ZZGt3Z2Q0YWcy?=
 =?utf-8?B?ZFZKemNaVG03ejIvbUZqWGd0VWVhQWpqaEJsamlTb1RGQjZDT2JYNk9nSGhZ?=
 =?utf-8?B?VUhvdzdEOVB3VjU3ZjNRZCtjTUNYNGRDWms3ZnpDUWNEYnlkd1pRTkVTQkJF?=
 =?utf-8?B?cDBKdXlaUkppYkFiWFMrNEVwdFBYS1oxT212T0hOWUpoMnd3U2wzZVhxbmRU?=
 =?utf-8?B?aEszZ2g4aW50Y0xUeU5Tb0tkQi82dTU5S2w5SHgzN1dFRHhMWkF4U3kzU3Rr?=
 =?utf-8?B?UUdFRmNLcFo4Nmx4cnFOYVpITWFOY3NFMENoWCsvWXFhNTZLUjgxU0MrUVVR?=
 =?utf-8?B?NW9YQno2aWdPMTFzVVRuRjhQa2dWMnU3ZDBsSVl1SXFZejNxOWFZU2R5SS9E?=
 =?utf-8?B?aWZSVWt0VE8vUFhQY0V5OVBDV2hhcG9ZaXd3ZXpiaHJzQ2J0Vk5ZYjRNcU55?=
 =?utf-8?B?RjVQY1ZvV3BIODBzOTZhMVl0UXdSd1B0UmkxSk9NQVhaNnFHZUJzbVNrOEFy?=
 =?utf-8?B?cUgyNWxEaklFd2Qwb04ybDVhZWREMWdyRjF2SWZYQ1VBZkN2WjIzdE5YWlNF?=
 =?utf-8?B?VDJUWDdjUy9kdUhuZ2lFQm41ajdONGZEaUVSa29oZkJLck9CSDBNVXlwTytG?=
 =?utf-8?B?NDNXejNQSVdBZUFhM08wd2owSE82a1dURXJBQXF2NGJMVGpFY1FuM096d0hQ?=
 =?utf-8?B?TzNJVHdXOGE5bEZGY3hKYmVxZ2o3ejdTQTFSNzFWR2p3WDF1dmpCZzcrS0sz?=
 =?utf-8?B?SXlvNWZKL25LNVhuOTdaWjlJN005MXVMV2x2SWlyb3pFQjR5aDlDcFRKR0Np?=
 =?utf-8?B?R1IrQmFURStrcHlpdFFRTlNWUWUvWnI5bHFEYTVFd3dKcnJUbzZnWnczQUEv?=
 =?utf-8?B?eEF2ckVSdVhmWHI5WTNLN3pVSFVrYmJJaUlwRjhVWVlyN0FoSVBiZWJjRm5u?=
 =?utf-8?Q?8z3FnF8DhwCRA2hDrsXYo0QOa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48FFB77D0B11C64D8E81642F200B2A4A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5122207-9900-4204-5e69-08da695a1195
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 07:41:18.9008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7OVrbbI9WtVRTGSZcexSN8p+TYUVDbWI4JyrVofi07pqcJ01ML6L01f11IzDLR6EbjBO6GJGOr1U2K0IC/0KvRpBPMNT4ur/HPZSG4/00aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2208
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMTkuMDcuMjAyMiAxMDowMywgU3RlcGhlbiBCb3lkIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IFF1b3RpbmcgQ2xhdWRpdSBCZXpuZWEgKDIwMjIt
MDctMTIgMDM6MDY6MDUpDQo+PiBIaSwgU3RlcGhlbiwgTWljaGFlbCwNCj4+DQo+PiBJbiBjYXNl
IGl0IGlzIG5vdCB0b28gbGF0ZSwgcGxlYXNlIHB1bGwgdGhlc2UgMiBmaXhlcyBmb3IgNS4xOS4N
Cj4+IFRoZXkgYXJlIG5lY2Vzc2FyeSBmb3IgcHJvcGVyIHdvcmtpbmcgb2Y6DQo+PiAtIG5ldyBm
ZWF0dXJlcyBlbmFibGVkIG9uIExBTjk2NiBTb0NzIHRoYXQgdXNlcyBjbG9jayBnYXRpbmcgc3Vw
cG9ydA0KPj4gICBpbiBjbGstbGFuOTY2eCBkcml2ZXINCj4+IC0gcHJvcGVyIGJhbGFuY2Ugb2Yg
cmVmZXJlbmNlIGNvdW50ZXIgZW1iZWRkZWQgaW4gc3RydWN0IGRldmljZV9ub2RlDQo+PiAgIG9i
amVjdHMgdGhhdCBpcyBpbmNyZW1lbnRlZCBieSBvZl9nZXRfcGFyZW50KCkNCj4gDQo+IFRoaXMg
c2Vjb25kIG9uZSBkb2Vzbid0IHNlZW0gdG8gYmUgZml4aW5nIGFueXRoaW5nIGNyaXRpY2FsLg0K
DQpUaGF0J3MgdHJ1ZS4NCg0KPiBJIHRoaW5rIHdlDQo+IGNhbiB3YWl0IG9uIGl0LiANCg0KU3Vy
ZSwgbm8gcHJvYmxlbS4NCg0KPiBUaGUgZmlyc3QgcGF0Y2ggaXMgcHJlc3VtYWJseSBpbXBvcnRh
bnQgdGhvdWdoPyANCg0KWWVzLCBpdCB3b3VsZCBiZSBnb29kIHRvIGhhdmUgaXQgZm9yIHY1LjE5
Lg0KDQo+IEknbGwNCj4gY2hlcnJ5LXBpY2sgaXQgdG8gY2xrLWZpeGVzIGFuZCBwdXNoIGl0IG91
dCBhbmQgdXAgaW4gYSBmZXcgZGF5cy4NCg0KR3JlYXQhIFRoYW5rIHlvdSwgU3RlcGhlbi4NCg==
