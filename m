Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB42C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 22 Apr 2022 07:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444917AbiDVHn3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Apr 2022 03:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444944AbiDVHnL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 03:43:11 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47DC506F9
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 00:40:18 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M6Jr4K004559;
        Fri, 22 Apr 2022 03:40:16 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3fkh6rj0wt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Apr 2022 03:40:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSXCVYxiRDT7JJfbLydNAJ8ECtoS+ndF7O+cFwqFPLR0N19Hbbthbp12x8pw6ctk8V07il4tnt2KozHQB8H7PeR/qWzwdQvpoNfI7G/q55WQBZLh9lstOfzGU6Ty6lImglCE3zIoI8XOzcZlnfanEy+q1XWtizPsBe2OFVDPONf3EwprnvQMDkL9mb7jBa1uAggSNkvmZVY/7vbCA1tCtqmrl+J4y4oG1jPB09+zU2j3HwuV3nGT/s063fkvHRnjXHceiv/RUnqu1xrcV9KDfHhkfViI6c6hZu9Q7iFBAUVau5Kx0sqL6wjsFz6dkunh2Fi2MRsI6iycN0A6j/hYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qM+SoKtKTl6vHzRGMU1hrIoHiZlreacBgA+fce8AqMI=;
 b=fPlBP9B0Nqfx2yBctsjrlWO7sfkfxiHEVbna87qMkxS+6ug9JZTHlgqfIlG7w7qSDm0QNdJumLkf5VC9enh6ctFWYXYaF+nVXnSUVJhOmv6pc6wtWCCXkSD3w9pymkhcoFYMB60cUAtSgFRu8fGqUNlkgny2PGcRLQImTxSZ41F5XTAG3lcEUIaq/OEMPI4o50p82XoTFJdrozWm1TPekXnjPIimSb8l0RsiXP3IwdjV/+3yVv/fvPKqSFmIUAm21dZ7eTnO49TGMUJ8ICrf8rE9DTxKGn++wf1J9+ir4TELy/YEBDMDummHSgtApqARY7tzQMycQF91fKRHBVnFjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qM+SoKtKTl6vHzRGMU1hrIoHiZlreacBgA+fce8AqMI=;
 b=K6iti62jRnA5UwGaN5L8Hu8v2NkoJhjOmh4PRi3mNoV6cg4VAwjcoyiSCLvoZ39tG//e8p1qUxohWH+5Va+4H2g26U7BxJimj2pffuVYjyWK7hnYiXUpJOLUEc5iis6VO5rCrCR0nccH74QgVGqmVr6Z7SprNrZsudiUs2/T0UI=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by DM6PR03MB3514.namprd03.prod.outlook.com (2603:10b6:5:b9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 07:40:13 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a97e:a520:c3a6:d2ae]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a97e:a520:c3a6:d2ae%9]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 07:40:13 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>
Subject: RE: [RFC PATCH 2/4] clk: fix clk not being unlinked from consumers
 list
Thread-Topic: [RFC PATCH 2/4] clk: fix clk not being unlinked from consumers
 list
Thread-Index: AQHYVd65R4CCZN+hL0ipVw1TqV3l1Kz7iwfw
Date:   Fri, 22 Apr 2022 07:40:13 +0000
Message-ID: <PH0PR03MB6786A22B45D67800CDF2C50E99F79@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220407133036.213217-1-nuno.sa@analog.com>
 <20220407133036.213217-3-nuno.sa@analog.com>
 <20220422002003.3120DC385A7@smtp.kernel.org>
In-Reply-To: <20220422002003.3120DC385A7@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE56QTRNemRoTVdNdFl6SXdaaTB4TVdWakxUaGlaVEl0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhEY3dPRE0zWVRGbExXTXlNR1l0TVRGbFl5MDRZ?=
 =?utf-8?B?bVV5TFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTWpRMU9T?=
 =?utf-8?B?SWdkRDBpTVRNeU9UVXdPRFk0TVRFNU56ZzFOelE1SWlCb1BTSkdRVmt2VEVw?=
 =?utf-8?B?eVN6ZHdUVzlVT1NzMFZXTllXVE55Y0ZkelNEQTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVRldSV1IzZVVoR1lsbEJaV2cyUjJsS2RFMHdNbUkyU0c5aFNX?=
 =?utf-8?B?MHdlbFJhYzBSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
 =?utf-8?B?QlFVRkVZVUZSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZC?=
 =?utf-8?B?VVVGQ1FVRkJRVlpKUlhadlVVRkJRVUZCUVVGQlFVRkJRVUZCUVVvMFFVRkJR?=
 =?utf-8?B?bWhCUjFGQllWRkNaa0ZJVFVGYVVVSnFRVWhWUVdOblFteEJSamhCWTBGQ2VV?=
 =?utf-8?B?RkhPRUZoWjBKc1FVZE5RV1JCUW5wQlJqaEJXbWRDYUVGSGQwRmpkMEpzUVVZ?=
 =?utf-8?B?NFFWcG5RblpCU0UxQllWRkNNRUZIYTBGa1owSnNRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVGQlFVRkJRV2RCUVVG?=
 =?utf-8?B?QlFVRnVaMEZCUVVkRlFWcEJRbkJCUmpoQlkzZENiRUZIVFVGa1VVSjVRVWRW?=
 =?utf-8?B?UVZoM1FuZEJTRWxCWW5kQ2NVRkhWVUZaZDBJd1FVaE5RVmgzUWpCQlIydEJX?=
 =?utf-8?B?bEZDZVVGRVJVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCVVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVOQlFVRkJRVUZEWlVGQlFVRlpVVUpyUVVkclFWaDNRbnBCUjFWQldY?=
 =?utf-8?B?ZENNVUZJU1VGYVVVSm1RVWhCUVdOblFuWkJSMjlCV2xGQ2FrRklVVUZqZDBK?=
 =?utf-8?B?bVFVaFJRV0ZSUW14QlNFbEJUV2RCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlFUMDlJaTgrUEM5dFpYUmhQZz09?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f9b045a-f87f-4d64-724e-08da24335620
x-ms-traffictypediagnostic: DM6PR03MB3514:EE_
x-microsoft-antispam-prvs: <DM6PR03MB3514F131BD9ABE0AA3AD4B5899F79@DM6PR03MB3514.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YfnyybuJXvQNFVHPqWNirpL9KA79h8OIhS6u0k8ZO7Ea3UkKyn4tkV6P3k4qTesE+guQl58m/sbyrHjm1djDSg74wJH5Vr8k7p77Z2rY7hN/RN8nNf8ADJpp6kjlK30c88DsQUduNyexMFfr2Cx5g0Q1nqMRVkJBDYxaHwQoa0vEyU0pTb2FXZzhpixIDuMNGp/LSH56wnB0X06jjT86QLf8OEpU+m8ZAvBlhEN5qkjCTMl10SR/f1ZTVfPNODOQnpOg9e5OLEhgilg9SjcXXGUtzdJTD3cnB2jEbhGakLQ+RKAHDSx30HlOaeQ0t27iJEV7kaxUTs27fIY3fIPY9xAaNNHsuswxjHZcOBh6yvuvCBsf4oQW9DYXMVXqIa7ztAufKxlYE4WzUbhvIUAOgHue17w6MbEM0/zII3hLLbkwVw1iWmv6BDHpyssyPCN2tntiA06t0uhrD9kA5155/xbwQhrBAQb1fBE22eea2kbKZWNqlvXUodu3dr6+78az+EwAdO7r/U/K4SYd8YLFXYAkiXTlu0722bTvWrFbWrE1+W0lJQpl0uFORFLCoAFC9yeYbUVWnqTZcjLlIG2nwePSSVZPH6EumxmIEjKkOUV6tGdETXkkk40EDMW5X6yLkm5y/Kubk3w6o5bkcRjNPmZfhN962g/AWeuJNdc4QQZM9Syvh2jlSo6JyVBLAVv3TiCD7/vjHdCu62BrvNJGxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(8936002)(86362001)(38070700005)(38100700002)(122000001)(55016003)(64756008)(66446008)(66476007)(8676002)(66556008)(4326008)(76116006)(66946007)(52536014)(5660300002)(110136005)(71200400001)(7696005)(53546011)(9686003)(316002)(508600001)(6506007)(2906002)(26005)(83380400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0lNc0gwaUg5bk1PU3U2SERLUjEwT2FjWmlMTzRCcmpWcjZNeWlPU0k5ZXRa?=
 =?utf-8?B?S2N0c1djZHdieUFTMUE4bzV5c2wzQ2FmYTJRYUp4SmJFcmJJVTQzNE9IYXc0?=
 =?utf-8?B?WG9YSWdUN2hTZmV6dnhrdnVYSjBtaG1MbWxTc1VwSWJjM2wxVWN4bk41alFu?=
 =?utf-8?B?d1ZYREdobUNzSHZmMWJZbk16ako1bmxNS0ZleHJ0K04rTGNWaGVqSTNRc0JN?=
 =?utf-8?B?b0VGekgwaTVhK0dwUE10dVcxUTh4VXZmT0hBbEFEcWxqQ0NkQ3V1OC9GSW83?=
 =?utf-8?B?Nmpsc2hwUXBJSUFxSWQ5UmhQMGgraTFHNnVCR1Z6amk2d1B1SThicVdpOUtE?=
 =?utf-8?B?NW9JakZid0ZZOVc0WExEMmZOSzZLejg0WG8zbEtIWk4yVVBPTnRqS1NscFFY?=
 =?utf-8?B?Tjc1TXRodXp1Mk45ZDNPSG1SQTZNRktsQ1VOK2d0WnZqVUpvbGNTc1gyQ0Zw?=
 =?utf-8?B?Y1NwNENTYmZmN3pDaGVIMU1tWUJESTc3cWFrVERCYlNtYjh2MVh2ajIyREk4?=
 =?utf-8?B?YmNzOE1ZRDVtem9YZnNlMkxrS1FmU2VzV0szYW5lWUdraGJzZWJ0aFB4eGUy?=
 =?utf-8?B?OXZFVjBYL3lRNHo4Tis2ei9GQmNndnZ3RElnMEJpdHdzMWplTU1uVkU4S2tP?=
 =?utf-8?B?cXk1c216anRZalFxcDBkS29hRzlnSXhYblVQVHkrc1FMSTljSjRCUzV0WjlX?=
 =?utf-8?B?SW51OGdsZWQwTk9hTG9RSGVnTDFXTzgzMG1aMm11L1crRWVBNk1vTFg4U1Ar?=
 =?utf-8?B?VU9uTjR0RGx1WTdkYTY0d2orVWpXN1l1T01xVjRjaDdBeE9aM3JwRHJyZEhK?=
 =?utf-8?B?RG1NaFhCVGJydHpoa0NuelJyQkVOT1A4UW1XL1JZWXBJUWFSWGJrVzlucWE5?=
 =?utf-8?B?S0NDN2pSQVBmYmh0VjdlZ1AvK3R2TG95Y083d0V5dGQ4aHJGd0pGRGo4cUZw?=
 =?utf-8?B?N2Z2YkpDclhqV0pBa1VyWW5WOUxJUUlXaDA1WlVXSE4xSWIvQThkMkcvbU4r?=
 =?utf-8?B?MnFzQ1dITWVQMzV2YURTRS9OMy9JM0ZZcUNZMC9FdXVoOW84MTBGNFRmSGtz?=
 =?utf-8?B?blhkM2lqTC95NlYxcE9DQ3U4UkRYakl2dzNYbFdVQUhEbTRFU3IzclprSU52?=
 =?utf-8?B?TkVOaXBJeVE5Y2pJOG8yM3drNTUrakNMTGEvSGZES0FZYzU0NnFCV3JHWVhQ?=
 =?utf-8?B?ZzMzbjE0aVlaeko0Znpwd25MZXBrTUVNSHJoMTY1VTlGVCtkOVB4OXhmcHJS?=
 =?utf-8?B?YkJxbi9reXpKMm14VGNtTkxibjdIYzJTWHNSK3c2QktxbEdPRHJMaDQrN1Jx?=
 =?utf-8?B?OVdVVFR2NGZqOU1mMmEyeVlDc05yTWszMUluNU5jUHhCYm45OFduWW1EcmZi?=
 =?utf-8?B?N2xJSGZmNm80UDVRQnV6dGJia2t4QjZGK29Ya1hqanNlMnFZbTZOUzMrSjBR?=
 =?utf-8?B?VEJCVnhQbU9GRGtFQXJUODgxZlBxZWY0dVZYS1pQTkJuSTB3L1dnNzJ6V2tL?=
 =?utf-8?B?YWFKbW5meGhUTlE5OUF0blZqUEZEZUhiVTA2Q3hDdW1HYzQzeVBxMm5GMW1k?=
 =?utf-8?B?R2JranlKbzBvdjkxM3pUY2dlUHhOWlhlNU9ZeXpXeXpFWktGWmNqcVpkSlZo?=
 =?utf-8?B?ZERWTVBlYlR1K2dlMGZhRmlnbnE4REtReG1yUFQxeGR3b0VDNGljb3I1aEN4?=
 =?utf-8?B?K2NzN0ljRmlxYnk2NE95S1NNaTFNeXN5MkNJbGJSY3hGUmxKSjZuSUVUdVNR?=
 =?utf-8?B?aEM1SThWS3JTNjMxa2J6TVZmWEtKcHI4T1p2SzhUcDRVVUZMRnNSMS9QRnJB?=
 =?utf-8?B?Y2kwZEp2Y1ZNZ2F5dnpoMTNnenhxTlZwSS82RE5OVHh0YzNXSHJGM1k3bEVn?=
 =?utf-8?B?V1hsNW1rQ1M1L1hkTm5PR0gzQ2t6dEJpeFFZd1UvaXhveFowbzJXUUFZa0I1?=
 =?utf-8?B?NjJ3NWZQRzk5QnYzOUh2NlFFU1daOFpDVm41ZS9oSE1HRHFaenRrUTdnMFFk?=
 =?utf-8?B?b2JQT1JHQzZiMnNjNjhJdEI0dnJtdS9ZcGpSa2JBS3hPZkJmQi9RUlRvdXhu?=
 =?utf-8?B?RWExNGVpeVJpS2R3MWs4bzF0cXZsWmpWTXJqMWxTZlIzMFFVUWpwZHFidkhC?=
 =?utf-8?B?d1hIS3htM3c3WWcvazBUVFFBaHhXbjZCWHRsZnhKRjg0cFBXdFNmUnRoa2Nt?=
 =?utf-8?B?VFlFV3R4eU4rVWNSTVdZWDdieGw3MWZGL0hsTEVQeGpiYW52RktLWUIrcExL?=
 =?utf-8?B?TXZEMDFZdW55ZkUwTEcrbTZxT3grRlAyK2hRMHVKb2xRK2pjNk9PaUxUYWpM?=
 =?utf-8?B?NUNPY0NHNW5FQXFSS2wrVjNONEZwSU4yRkdiS0w4YTFDd3VXTHZFUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9b045a-f87f-4d64-724e-08da24335620
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 07:40:13.3075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4iOXMddqTx/HeVlfPNGEvp9oKbPM3DvyotE1eCvYACNr4gqjiYY8Gu3K0rvboTs4IIHgtT3hSfMLZ99ySi0KsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3514
X-Proofpoint-ORIG-GUID: sHrwxIEjuDyJF4abGCXEc7CpAJm4PCi8
X-Proofpoint-GUID: sHrwxIEjuDyJF4abGCXEc7CpAJm4PCi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204220033
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDIyLCAyMDIyIDI6MjAgQU0N
Cj4gVG86IFNhLCBOdW5vIDxOdW5vLlNhQGFuYWxvZy5jb20+OyBsaW51eC1jbGtAdmdlci5rZXJu
ZWwub3JnDQo+IENjOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDIvNF0gY2xrOiBmaXggY2xrIG5vdCBiZWluZyB1
bmxpbmtlZCBmcm9tDQo+IGNvbnN1bWVycyBsaXN0DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBR
dW90aW5nIE51bm8gU8OhICgyMDIyLTA0LTA3IDA2OjMwOjM0KQ0KPiA+IFdoZW4gYSBjbGtfaHcg
aXMgcmVzZ2lzdGVyZWQgd2UgYWRkIGEgc3RydWN0IGNsayBoYW5kbGUgdG8gaXQncw0KPiANCj4g
cy9yZXNnaXN0ZXJlZC9yZWdpc3RlcmVkLw0KPiANCj4gPiBjb25zdW1lcnMgbGlzdC4NCj4gDQo+
IFBsZWFzZSBhZGQgdGhhdCB0aGUgY2xrIGhhbmRsZSBpcyBjcmVhdGVkIGluIF9fY2xrX3JlZ2lz
dGVyKCkgcGVyIHRoZQ0KPiBhbGxvY19jbGsoKSBjYWxsLg0KPiANCj4gDQo+ID4gSGVuY2UsIHdl
IG5lZWQgdG8gcmVtb3ZlIGl0IHdoZW4gdW5yZWdpc3RlcmluZyB0aGUNCj4gPiBjbGtfaHcuIFRo
aXMgY291bGQgYWN0dWFsbHkgbGVhZCB0byBhIHVzZSBhZnRlciBmcmVlIGlmIGEgcHJvdmlkZXIg
Z2V0J3MNCj4gDQo+IHMvZ2V0J3MvZ2V0cy8NCj4gDQo+ID4gcmVtb3ZlZCBiZWZvcmUgYSBjb25z
dW1lci4gV2hlbiByZW1vdmluZyB0aGUgY29uc3VtZXIsDQo+IF9fY2xrX3B1dCgpIGlzDQo+ID4g
Y2FsbGVkIGFuZCB0aGF0IHdpbGwgZG8gJ2hsaXN0X2RlbCgmY2xrLT5jbGtzX25vZGUpJyB3aGlj
aCB3aWxsIHRvdWNoIGluDQo+ID4gYWxyZWFkeSBmcmVlZCBtZW1vcnkuDQo+IA0KPiBEaWQgdGhp
cyBhY3R1YWxseSBoYXBwZW4/DQoNClllcywgYnV0IGFzIEkgc3RhdGVkIGluIHRoZSBjb3ZlciAo
SSB0aGluayksIHRoaXMgb25seSBoYXBwZW5zIGlmIHVzZXJzIGRvDQpkdW1iIHRoaW5ncyBsaWtl
IHJlbW92aW5nIHRoZSBjbG9jayBwcm92aWRlciAobGV0J3Mgc2F5IHdpdGggYW4gZXhwbGljaXQN
CnN5c2ZzIHVuYmluZCBvciBEWU5BTUlDX09GKSBiZWZvcmUgdGhlIGNvbnN1bWVyLiBJbiB0aGF0
IGNhc2UsIHdlDQpkbyBmcmVlX2NsayhjbGspIGluIGNsa191bnJlZ2lzdGVyKCkgYnV0IHdlIHN0
aWxsIGtlZXAgaXQgaW4gaGxpc3QuIEhlbmNlDQpieSB0aGUgdGltZSB3ZSB1bmJpbmQgdGhlIGNv
bnN1bWVyLCB3ZSdsbCBoYXZlIG1lbW9yeSBjb3JydXB0aW9uLg0KSSBjb3VsZCByZWFsbHkgc2Vl
IHRoZSAgbWVtb3J5IGNvcnJ1cHRpb24gZHVtcCB3aXRoIFNMQUJfREVCVUcuDQoNCj4gSSBkb24n
dCBzZWUgaG93IF9fY2xrX3B1dCgpIGlzIGNhbGxlZCBvbiB0aGUNCj4gaW50ZXJuYWwgaHctPmNs
ayBwb2ludGVyLiBUaGlzIHBvaW50ZXIgaW4gaHctPmNsayBzaG91bGQgYmUgcmVtb3ZlZA0KPiBi
dXQNCg0KSXQgaXNuJ3QsIGJ1dCBfX2Nsa19wdXQoKSB3aWxsIGNhbGwgaGxpc3RfZGVsKCZjbGst
PmNsa3Nfbm9kZSkgd2hpY2ggd2lsbA0KdG91Y2ggdGhlIGRhbmdsaW5nIGh3LT5jbGsgcG9pbnRl
ci4gSSdtIGRvbid0IHJlYWxseSBrbm93IHRoZSBoaXN0b3J5DQp0byBrbm93IHdoeSB3ZSBhZGQg
dGhlIGh3LT5jbGsgdG8gdGhlIGNvbnN1bWVycyBsaXN0LiBPbmUgYWx0ZXJuYXRpdmUNCndvdWxk
IGJlIHRvIG5vdCBhZGQgaXQgYXQgYWxsPyANCg0KPiBzbyBmYXIgd2UndmUga2VwdCBpdCBhcm91
bmQgYW5kIHZhcmlvdXMgY2xrIHByb3ZpZGVycyBoYXZlIHVzZWQgaXQuIElmDQo+IHdlIHN0YXJ0
IHJlbW92aW5nIGl0IG5vdyBJJ20gbm90IHN1cmUgaXQgd2lsbCB3b3JrIGJlY2F1c2Ugd2Ugd291
bGQNCj4gcHJvYmFibHkgZXhwb3NlIG1hbnkgZGFuZ2xpbmcgcG9pbnRlciBwcm9ibGVtcy4NCj4g
DQoNCkRvbid0IHRoaW5rIGl0IHdpbGwgYmUgYW4gaXNzdWUgb24gcHJvdmlkZXJzLiBOb3RlIHRo
YXQgb24gX19jbGtfcmVnaXN0ZXIoKSwNCndlIGRvIGNsa19jb3JlX2xpbmtfY29uc3VtZXIoKSwg
c28gaXQgaXMgb25seSBuYXR1cmFsIChhdCBmaXJzdCBnbGFuY2UgYXQgbGVhc3QpDQp0aGF0IHdl
IGRvIGNsa19jb3JlX3VubGlua19jb25zdW1lcigpIG9uIGNsa191bnJlZ2lzdGVyKCkgKGF0IHRo
aXMgcG9pbnQgdGhlDQpwcm92aWRlciBpcyBnb25lIGFueXdheXMpLiBOb3RlIHRoYXQgdGhpcyB3
YXMgYWN0dWFsbHkgZG9uZSBsaWtlIHRoaXMgcHJpbw0KIHRoZSBjb21taXQgaW4gdGhlIEZpeGVz
IHRhZy4NCg0KLSBOdW5vIFPDoQ0KDQo=
