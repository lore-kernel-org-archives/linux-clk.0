Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D090C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 07:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41C6861151
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 07:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhJ2Hpi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 03:45:38 -0400
Received: from mail-eopbgr00070.outbound.protection.outlook.com ([40.107.0.70]:53217
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232222AbhJ2Hpg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Oct 2021 03:45:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPVZ515U3O2ZH6+k3Gb3y2sfmXBe4ZohoyBbbQUmHsflEhMChQJ3F9pXXpeyE3C84qBPzGAy4X3vuHzVYwEpZAJpNkHuz+SfkDLopxqI8maWMw151E/He6UNQWWQg0hrsS2H9XJMeIx6cb9VsRkN/zZ72G3RPbyrT2xSv5sQv8+PuP9LeklehJc8EtG/Q6/TFpKS12ms4e1UA9cHpVLZIiebsVD9mIbhbSkbWoyiphuKHCRriuTmQAeXv/+aVXA7ZN2u+cFhKzF81gXiLa4G6I+FXgELJ+9dFn+GDh1bIk/eMZmY+9aBfVb/s1UGFEeJI4hhhrKpCdmHJMK2tvk0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghgUuSOHzGwUKWWPO635Q8nI9ETOEy4VM76Drwjqezo=;
 b=BPqkQP0G34tUM3hcX1TlHr3pXxu2cclammyzK/mdSq3nrjQeozcqA1Q5nZVxe7iHPJTU/ovJCcLGfBRrJ88pJRLKqK6pYP0tTldLybzn/OccL/zESTZPlGPe3nzA0yb6L+Ygf/VJ4VL91D0HbuXZEC2m0ziLeWBs7vrjLdb4h29QOSQCzylMadzJbT2aTOz+w5AOmhHvGMxXdAI5D8RUV77ef3gJXpzLEQu1Wk+xqe5dYsjsnXs5REgLWNaP0crdwBTn1ebKkMDCcOKke8rBq+/QN8Wii17kRxA5DG1KzGCL/DdRFobBiZMhCKef63hWZ9aGnWJj2O28NHUXFenxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghgUuSOHzGwUKWWPO635Q8nI9ETOEy4VM76Drwjqezo=;
 b=okq3E4A1WmJQ46iSp2v6R4U+R/HXn83B3QI8PaT7tUg66gnsNy+/sB27rvkhh8wCW7h+C23i4eVXa+N0CiOuVqKc/xF2e828zYBwsihjcN0ZLlo6jp1R34EuVefauUdc3Kr3AGDb8Vo6w7J512F35MPsrw/cbtyWuE9RMYuShig=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2394.eurprd03.prod.outlook.com (2603:10a6:3:74::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Fri, 29 Oct 2021 07:43:05 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d535:e3e:baf4:2d60]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d535:e3e:baf4:2d60%5]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 07:43:05 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Rob Herring <robh@kernel.org>, Marek Vasut <marex@denx.de>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: rohm,bd71847-pmic: Document
 rohm,clock-output-is-critical property
Thread-Topic: [PATCH 1/2] dt-bindings: mfd: rohm,bd71847-pmic: Document
 rohm,clock-output-is-critical property
Thread-Index: AQHXxY+JJdX8Jutbb0a+1WZK+KZDHavbq2eAgAAOd4CADT93gIAArMIA
Date:   Fri, 29 Oct 2021 07:43:04 +0000
Message-ID: <e746f83f-87e4-c18c-f2c3-be13e491cd77@fi.rohmeurope.com>
References: <20211020084956.83041-1-marex@denx.de>
 <263da45f-d648-3c65-aed3-e4ba41927911@fi.rohmeurope.com>
 <4b3cc52c-a618-ea7d-6778-68060cfadf8e@denx.de>
 <YXsVHRnzAWCFTPCo@robh.at.kernel.org>
In-Reply-To: <YXsVHRnzAWCFTPCo@robh.at.kernel.org>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63f0976c-5242-4e9b-04e8-08d99aafbe36
x-ms-traffictypediagnostic: HE1PR0301MB2394:
x-microsoft-antispam-prvs: <HE1PR0301MB2394998848546C1322E366DBAD879@HE1PR0301MB2394.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m+zPTFChh/X3/W07FlppsB43KL5EkVfwgyZW35Ym0vPSdn+j9oBKuKb0RVZUFKUJh4BsNaLQZTBISUEBZQlWxpdSNJzIk59bQ0l8DwiURzhIWJKGjxWxZdFROinVokyCW/HJafDDi2wMBWh+6Zezy+QExcaDxjw2O56bPqDlqLGTYO9DZli0/qLTOWZSamshtCvX+yRm16PL5mRsEEo2E1UgpP940IEXf+j204FgdPppy85fIcKF5JVfKUE3uAAxxMUhfhWtcMkL3na2JB/lB35uVhIFhk0KfVmRZVWeoMTXdNL5Z4P8bU1M25C8AV2522Y6HfIsTflxIZ6N3DR0qcbfNGYhafag4tN4pLciJLww6J9onztl8+/XXSgLPOm4g9RrMIH6je/+Nfk7+lxDx3MVREhyC3jIrOaOV9tCUjkeCCSIqODcurKqx8M/ORlJpXHb4gv2vYioPpdBvMQm/xhrb7gBHmYbb5JeTGxxHe5Wz7pfLPv7vicVUOCQeCyIDUGoieN090V8spJ5d6cQWwOrcXi3t2tgNp65Bx13LwWnXTkuqss35V6uLx86zhsLm/rwL3p3WMgxXGMMn9vcXKK/aHklMGjcA2LlP7sqjZKoTQ9UGoPBMepHdSroM/L7Rt7O4m7oGliLIEoRZsQyCaBqGF7DJP+XNHpK7y1hw5DPXElEbxaYWb6PkU+SpT+kCXtGt1e5ftFB2iRHrjCilFSh1/QVYcfQzCYnBo4o0iuNPe6z4NtCY4Gpn69LCcN60bAQoUeHCUgvOHWq4MiXag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(6512007)(64756008)(53546011)(107886003)(2616005)(76116006)(4326008)(66556008)(66946007)(54906003)(26005)(66476007)(6506007)(186003)(31686004)(316002)(8676002)(122000001)(86362001)(508600001)(5660300002)(71200400001)(31696002)(83380400001)(8936002)(110136005)(6486002)(38070700005)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDFLK2FaeENidzA0NXA2S1J5R2liTGN0VWM5NC9qWGpadGkzanlPamdKdEp5?=
 =?utf-8?B?ODIzMlU2bWt0QVdiT3JhWEI3Wlg1YWlZMUZ0TkZtRWcxeGNvaHhERGhSZys0?=
 =?utf-8?B?a2ltbHY0V3pxNzBxWkdPbHNNdmdvZnBGdjJZZ1U5NmNwZ2h0Wi9nbC85eFlt?=
 =?utf-8?B?REExYVlpbExPUkFnTU55S1NRVXE5TUorbU5ySnF4Z2hyenlicnFvQkdlcUM4?=
 =?utf-8?B?elRHRGVCVmVES1ZKSGo3QXhJQnE5ejAyZVF2Wmp0UzJZbTVBME5WL3pMY3BI?=
 =?utf-8?B?VnFkZURYZjUvL3RQNHp5T0JDWkxEQ1gwSlBSV1QrZ0o0SktOVW5TbEZkS1la?=
 =?utf-8?B?L2tkdFYvaEdVNTloUXhwL3E0RGVnMHczQk5ISFpBTlVMVXlMMVNHMmFmM2ZI?=
 =?utf-8?B?cC94cGpGLzVKNEhmM2ZEakQzb1l3M3MzTnY4NEs4OU1lOUY5U0dhWEo2dGll?=
 =?utf-8?B?Vkw2MXJCa0l6ZmhGRmhhblpLc1F4SUpvZ2lFanYzN1BCVzlEOTlvWUxnQmZB?=
 =?utf-8?B?eTRIaFNaV3M4T2kyTnF0YzJUM2VvVEU2dkxQZ1BPYnpCc251S1hTVlYyTnhz?=
 =?utf-8?B?N28vVDA4Sm5nMnZDMmQ4Mk14WGpQVHJYYTArLzZvRWx0eTFDa2xHMmlyeUo2?=
 =?utf-8?B?cXJ0ektvTDd3czhoT1hRb2ExR2lZaEhQcDZLUDY2bzViNWIvVUg2S0FTYmxY?=
 =?utf-8?B?Rms3RlNFbStBbnV3NDMraWR5d09YcklydnJsL1phZFR1NGtyRk1oNTluS2tj?=
 =?utf-8?B?LzVKTGszQWRjcUpVQm5zZ3htQVFDdklNbDdCOXBrWTN1aVAyUkZYWlg1VEFy?=
 =?utf-8?B?S20xZGNYejg2KzY4QldZUndCMGdHZzFwWGFwZ3NRL0dFa3RtSnNQM0pUM0s1?=
 =?utf-8?B?bjlJV1M2cG9HNC9wL0xuS0UvVFJuUzQwVEROY2hXU1dWNllXdkZmT0MxL2tr?=
 =?utf-8?B?WW95Y2hoMGhJZ3BnNnZ3c3EwMjBhZTYxL3pkZHptbTIwdTFZMkZPWVNhTjdi?=
 =?utf-8?B?bW1HRDMyVWlGWnNiNm5PT3IwcTFuUUdmVHRTRHpDcVQ1eTN4d08vYTNaazd6?=
 =?utf-8?B?b3ExaGZRR2pvREVya3NUeWw2SWYzMFhUY2FxeTdpbHFvaVVhb3JpWlFWY2E3?=
 =?utf-8?B?UEtydjlaV3hrVnNQM2x6Z2dkMTFacE1uNktzNCsvUTZBUUdhY3ZrclBBM3Y0?=
 =?utf-8?B?OWkzZ1lTb3Vhdy92Q3FJRGVVYVFhRVllZjFyK3ZtMzdTYXNiSlB6bDNmTE85?=
 =?utf-8?B?bkVDQWtoTmt6czhiYjc5ajJLdlAwUWlMU244U3g3TE5VZFFUUm1VTmo3NVR6?=
 =?utf-8?B?dDFtbTQyWlBVR0VLMFpiNUFwTTc0MTVCeWt0WWpnWUJwY3ppSExUSDFRRW4y?=
 =?utf-8?B?SDE4UWhQbW5McmRsbXNCbjY3LzVRMVAydzhCdXRwd21IcUdWZDRxRGpIQTVz?=
 =?utf-8?B?ZXZqS0FVSEdiRDVid1p3SGp4VFZvekU0cFlHRzRYWTBhRUJLWDhzc2J4VmEx?=
 =?utf-8?B?L2haNHVyUXVQc1JtYlUrS3NNRk8ralU5U1I0V3FIN2w1R1U1UmJmK0VSa3VK?=
 =?utf-8?B?c25YcGxzSUlKeTZJcG9INmdBVFJsQmEyaHJxNGNSbmtmRDY2azR2ZityZzBK?=
 =?utf-8?B?UWE4OVJPV2c2RmVlbDVCODd1cndIc1lZZXgyd2RSWm9WVWFvdDhjaEJuQW94?=
 =?utf-8?B?dzhvckhEc3h1b0grWURKL3QrOG1FR1pVbSsxeU92N0lSVDhCR1puRDFRU0FW?=
 =?utf-8?B?UnB2azRpT25LWTMzYk9CVlNDSDNWeWloaURPS09xTGwvaUgyY3NpS3h4cm5O?=
 =?utf-8?B?NndUdFErSjl1SVpTc2lIS2dIWUZ3bXVsdTc2V3JEVjgwMjFGK004clREdXhs?=
 =?utf-8?B?NVMyTnJTMDdQL3psMU9VTVFicm9hS0tYWHJzUnhYWGk5Nms3WGpkQ2pBMzcr?=
 =?utf-8?B?akRabmNSWVd6RUdJRGhaZHU4eVZHZmFGa3NaYS9vVTFYeUsrcG12U2RSaGs0?=
 =?utf-8?B?aEkvQUs0aE1xbmdydWsySmNKZUlCUjhWZk1xVms2djlDME81c0hiM29VK24r?=
 =?utf-8?B?cEZicjlmUXJhQ3hSS3RBMlZZbGE5cGgvdUsrRFRQS3NqWUJjRFRIOWl6YWJt?=
 =?utf-8?B?WGJYdlQyTWxDVGI0V3d0bkdTUWJ6MittVytYVVdZTkcrYUZ4S0dleXRESWRt?=
 =?utf-8?B?RjM0RWtycjJNeXp2WDE5c3pVWnBETUxHYmxFZVFGZC9xR1U5UTd1alMyaXhS?=
 =?utf-8?B?YlM2M3ByekFJWndUTlY1VlJIQVA5b1kvaTQrYkUxQ1hTbGFFWDlLSGE3R0dP?=
 =?utf-8?Q?4o9MVZGE1d4AhFeRVa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <244CC4AAD9F4F3479810AB31FA39250E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f0976c-5242-4e9b-04e8-08d99aafbe36
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 07:43:04.9472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSONJcBDXDRgrE6KW00MVqPeYbDZLJeMzQUI77Un9gByKxdZD4FGsNu/xHa8Fai6eQo9eY/4QODRwLNtGj4UEFSeEYKWjVAvpT/8lTJPW7ZCaJ+9nnXFKgY74xB5WegC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2394
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMTAvMjkvMjEgMDA6MjQsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBXZWQsIE9jdCAyMCwg
MjAyMSBhdCAwMTowNjoxM1BNICswMjAwLCBNYXJlayBWYXN1dCB3cm90ZToNCj4+IE9uIDEwLzIw
LzIxIDEyOjE0IFBNLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPj4gWy4uLl0NCj4+DQo+Pj4g
SSB3b25kZXIgaWYgdGhpcyByZWFsbHkgaXMgc29tZXRoaW5nIHNwZWNpZmljIHRvIFJPSE0gSUNz
PyBEbyB5b3UgdGhpbmsNCj4+PiB0aGlzIHdvdWxkIHdhcnJhbnQgYSBnZW5lcmljLCBub24gdmVu
ZG9yIHNwZWNpZmljIHByb3BlcnR5PyBJIGFtIE9rIHdpdGgNCj4+PiB0aGUgUk9ITSBzcGVjaWZp
YyBwcm9wZXJ0eSB0b28gYnV0IGl0IGp1c3Qgc2VlbXMgdG8gbWUgdGhpcyBtaWdodCBub3QgYmUN
Cj4+PiB1bmlxdWUgdG8gUk9ITSBJQyhzKS4NCj4gDQo+IEkgaW1hZ2luZSB3ZSBkZWJhdGVkIHRo
ZSBuZWVkIGZvciBhIERUIHByb3BlcnR5IHdoZW4gY3JpdGljYWwgY2xvY2tzIHdhcw0KPiBhZGRl
ZCB0byB0aGUga2VybmVsLg0KDQpTb3JyeS4gSSBndWVzcyBJJ3ZlIG1pc3NlZCB0aGlzLiBNYXli
ZSB0aGlzIHdhcyBkb25lIGJhY2sgd2hlbiBJIHNwZW50IA0KbXkgZGF5cyB0aW5rZXJpbmcgd2l0
aCBzdHJpY3RseSBwcm9wcmlldGFyeSBzeXN0ZW1zIC0gb3IgdGhlbiBJIGhhdmUgDQpqdXN0IG1p
c3NlZCBpdC4NCg0KPj4+IEJ5IHRoZSB3YXksIHRoZSB2ZXJ5IHNhbWUgY2xrIGRyaXZlciB3aGVy
ZSB5b3UgaW1wbGVtZW50ZWQgdGhlIHByb3BlcnR5DQo+Pj4gcmVhZGluZyAocGF0Y2ggMi8yKSBp
cyB1c2VkIGJ5IGZldyBvdGhlciBST0hNIFBNSUNzLiBBdCBsZWFzdCBieQ0KPj4+IEJENzE4Mzcs
IEJENzE4MjgsIEJENzE4MTUsIEJEOTU3NiBhbmQgQkQ5NTczLiBTbyB0aGUgY29kZSBjaGFuZ2Ug
aGVyZQ0KPj4+IGFkZHMgc3VwcG9ydCBmb3IgdGhpcyBwcm9wZXJ0eSB0byBhbGwgb2YgdGhvc2Ug
UE1JQ3MuIEkgd29uZGVyIGlmIHRoZQ0KPj4+IHByb3BlcnR5IHNob3VsZCBiZSBtZW50aW9uZWQg
aW4gYWxsIG9mIHRoZSBiaW5kaW5nIGRvY3MuLi4gVGhhdCBjb3VsZCBiZQ0KPj4+IGFub3RoZXIg
YXJndW1lbnQgZm9yIG1ha2luZyB0aGlzIGEgZ2VuZXJpYyBwcm9wZXJ0eSBhbmQgZGVzY3JpYmlu
ZyBpdCBpbg0KPj4+IGNsayB5YW1sIDspDQo+Pj4NCj4+PiBXZWxsLCBqdXN0IG15IDEwIENlbnRz
IC0gSSBhbSBvayB3aXRoIHRoaXMgY2hhbmdlIGFzIHlvdSBwcmVzZW50ZWQgaXQNCj4+PiBoZXJl
IGlmIHlvdSBkb24ndCB0aGluayB0aGlzIHNob3VsZCBiZSBnZW5lcmljIG9uZS4NCj4+DQo+PiBJ
IHRoaW5rIHdlIG5lZWQgc29tZXRoaW5nIGxpa2UgZ3Bpby1ob2csIGV4Y2VwdCBmb3IgY2xvY2su
IFNvbWUgY2xrLWhvZw0KPj4gbWF5YmUgPyBUaGF0IHdvdWxkIGJlIHVzZWZ1bCBub3Qgb25seSBo
ZXJlLCBidXQgYWxzbyBmb3IgdGhpbmdzIHdoZXJlIHNvbWUNCj4+IG91dHB1dCBnZW5lcmF0ZXMg
Y2xvY2sgZm9yIHJhbmRvbSBzdHVmZiB3aGljaCBjYW5ub3QgYmUgZGVzY3JpYmVkIGluIHRoZSBE
VA0KPj4gZm9yIHdoYXRldmVyIHJlYXNvbiAobGlrZSBlLmcuIHRoZSBTb0MgaXMgdXNlZCBhcyBh
IHN1YnN0aXR1dGUgZm9yIENQTEQgWFRBTA0KPj4gYW5kIHRoZSBDUExEIGlzbid0IGNvbm5lY3Rl
ZCB0byB0aGUgU29DIGluIGFueSBvdGhlciB3YXkpLg0KPiANCj4gVGhlIGp1c3RpZmljYXRpb24g
Z2l2ZW4gaW4gdGhpcyBwYXRjaCB3YXMgZm9yIGFuIFNvQyBpbnB1dCB3aGljaCBzaG91bGQNCj4g
Z2V0IGRlc2NyaWJlZCBzbyB0aGF0IHRoZSBjbG9jayBpcyBoYW5kbGVkIGFuZCBrZXB0IGVuYWJs
ZWQgcHJvcGVybHkuDQo+IA0KPiBUaGUgQ1BMRCBjYXNlIHdvdWxkIGJlIG1vcmUgaW50ZXJlc3Rp
bmcsIGJ1dCBpcyB0aGVyZSBhbiBhY3R1YWwgbmVlZCBvcg0KPiBqdXN0IGEgcG9zc2libGUgY2Fz
ZT8NCj4gDQo+IFlvdSBjb3VsZCB1c2UgdGhlICdwcm90ZWN0ZWQtY2xvY2tzJyBwcm9wZXJ0eSBo
ZXJlLiBNYXliZSB0aGF0J3MgYSBiaXQNCj4gb3ZlcmxvYWRlZCBiZXR3ZWVuIGNhbid0IGFjY2Vz
cyBhbmQgZG9uJ3QgdHVybiBvZmYuIEJ1dCB3aGF0IGl0IG1lYW5zIGlzDQo+IHJlYWxseSB1cCB0
aGUgY2xvY2sgY29udHJvbGxlci4NCg0KSSB0aGluayBJIGhhdmUgc2VlbiBzb21lIHBhdGNoIHNl
cmllcyB3aGljaCBhcmUgYWltZWQgdG8gcHJvdmlkaW5nIA0KY29tbW9uIGltcGxlbWVudGF0aW9u
IGZvciB0aGUgJ3Byb3RlY3RlZC1jbG9ja3MnLiBJdCBzZWVtcyB0byBtZSB0aGUgDQppbnRlbmRl
ZCAncHJvdGVjdGVkLWNsb2NrcycgaGFuZGxpbmcgaXMgc2ltcGx5IG5vdCByZWdpc3RlcmluZyB0
aGVzZSANCmNsb2Nrcy4gSSBkb24ndCBzZWUgdGhpcyBoYW5kbGluZyBpbi10cmVlIHlldCB0aG91
Z2ggYW5kIEkgZGlkIG5vdCBmaW5kIA0KYW55IGRpc2N1c3Npb24gYXMgdG8gd2h5IHRoZSBnZW5l
cmljIHN1cHBvcnQgaGFzIG5vdCBiZWVuIG1lcmdlZC4NCg0KU28sIGlmIHRoZSAncHJvdGVjdGVk
LWNsb2NrcycgaXMgdG8gYmUgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIsIHRoZW4gSSANCndvbmRl
ciBpZiB0aGUgaGFuZGxpbmcgc2hvdWxkIGJlICdlbnN1cmUgZW5hYmxlZCBhbmQgZG9uJ3QgcmVn
aXN0ZXIgdG8gDQpjbG9jayBjb3JlJyBvciBwbGFpbiAnZG9uJ3QgcmVnaXN0ZXIgdG8gY2xvY2sg
Y29yZSc/DQoNCg0KQmVzdCBSZWdhcmRzDQotLU1hdHRpIFZhaXR0aW5lbg0K
