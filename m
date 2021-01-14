Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A56C433E9
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 03:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D2112368A
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 03:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbhANDRF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jan 2021 22:17:05 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33824 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbhANDRC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 22:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1610594222; x=1642130222;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cBrtV+gYYKIqrnpK//QEyJy4CACH0C5NQlz9AbN0kQc=;
  b=k0vRSNV6sLq4DKYtMJHLCdfqIze3arxiKZeh8abWMag+LBJ6aFh1YFHN
   nxXRYFJD5kJ7HCwbqUllaXTcJnR9CrdgH+P7JPALUKUXgMOPDVSuTX2LZ
   ApYWqmoI1DFEEzKPis0t3rUE8IQ2UPUlKbs5LblZk66I5Vf0AbG+mAB9o
   2HtpzwgEsksQNK1dGJSps7g2tQMdVlt9+LdC3SYOJbuqNeVf2gHEtUkbR
   aOze240bxLIdfMxyZjgpp3MYsLvMHLcsClKEcRWnVgw0yxaRi9h4lnFYZ
   vK7vw7cb+aUyhhKhabrXdotr/xDHb1+CLb26sBWjUChFyIG1WLdkk0rZK
   Q==;
IronPort-SDR: 67eh2LmzkgY7sz6dE2ZwdQpM/1CbqrX9SquYoqoTxWGYibhqcq+cNfrgPQ86bbqrn4d7txS6SC
 ztYk+lxIXlAQOOS9Cg73aoZddB/v1RQly2arraCiU8jw605q/zd7mJLT1mQ022vYsFeP/xpqbT
 80B45JhplPbJmlbEHI7Rwm6CIDlLY9mtew6gSrVFvruHPgjLGTPcdOHnPDuAQhrV9VIWUwtWor
 Du1zCGJaWWbWCMg7iRoglITYXtQ7X+BQ3XoKnfW0Aaf9nFnslLDgAcyBwdCTFG/FxY6B6bUYEZ
 +8I=
X-IronPort-AV: E=Sophos;i="5.79,346,1602518400"; 
   d="scan'208";a="157387329"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
  by ob1.hgst.iphmx.com with ESMTP; 14 Jan 2021 11:15:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwkXsNP+ne/PFIv27shN5a8HaQPZSTP0n+/GM5Faq4Xo0HYnMEYYgRHGhjIzr0lEoBpMLxv+ECU0bghKMW0oYUkmrBGmXH29xTjQ/mcDj98EQjWgAGiainbHzvoAtKJFkYPH0UBzRs8WL+m8cwsnX0lq9EgexChNdAEiwbJ6B4ATH13+vlF6llAcJLVtpT3oFaB2i4a96c+bRqCtVHmUYniSB7jhb6cRp9cSI/6tSu8JLWiTjOpAlYuBKofYh4IpDYLc5PNVBR3NdMZCXPB3wrGcLgTGa6vI7TdWnfuhY1MXje0dzk926cz8Ke1GNQ1dLIkjI1r7jVkcKqszNN9TMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBrtV+gYYKIqrnpK//QEyJy4CACH0C5NQlz9AbN0kQc=;
 b=F7cp6yZ08APMfUXnMQ4Tsq/wfO8UYfwrchrVLamFVaKPWeoHxh4lWnoeC6BMt0vopfP6W8oFbxkOfN6G472EV0PN65r02+xpdwYKEkRmxOeWWWTQYFPRPAhlCXKVv4+db91Cr6r0mPNsnkKMUXoAdVc5bZFSZ+kKGgMsym/1IGsPf4bLe3ZWqtrx3DYARW6NBfLGoHvD86WjxJJtWXwZQWNJFNGTiEFqCjKIjdhe2/GTQ6X5vwRP66pbl4S+b9t/C91IdxNwXh3sN35R+b1INMab9/S20NrkwVHwgdx7vBPVwo2Duv29y3gJ2BDaLydnK3hoB7kPa7lGhRRsgVqrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBrtV+gYYKIqrnpK//QEyJy4CACH0C5NQlz9AbN0kQc=;
 b=njxANiV4wG6i7LmnzHvqfB6VeldVAo+dW8Ng6PSA0k0QEO3rD8/MfA2Zxuhoiz1fiDULoQKyTmQuLDGpquN6CvKy9waDfwGkLLSVMuc9QxxBApRJ5atzQyFbChQn/+chRm4QDJeuI8d3KW9bEoD5iYgptnhgQbT2YzQ2UgqDEmk=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB4530.namprd04.prod.outlook.com (2603:10b6:208:4d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 03:15:53 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%8]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 03:15:53 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW6H6jBxZahSfnlkqtd1vCx2d056olOk4AgAAzcACAAJ1mgIAASGmAgAAJ9gCAABifgA==
Date:   Thu, 14 Jan 2021 03:15:53 +0000
Message-ID: <05dcea7f1d40676b4e2742f3bd2ef5e5a8a6e2c3.camel@wdc.com>
References: <20210112010238.200241-1-damien.lemoal@wdc.com>
         <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
         <14eb3ad4c736b30a790169854878aeec019f9004.camel@wdc.com>
         <161057117528.3661239.31662832878817559@swboyd.mtv.corp.google.com>
         <be5eabd7ae8cd86c467b08dc5e457248551e5372.camel@wdc.com>
         <161058886422.3661239.2411294438387885286@swboyd.mtv.corp.google.com>
In-Reply-To: <161058886422.3661239.2411294438387885286@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b822e76a-216c-439d-295d-08d8b83ab3ac
x-ms-traffictypediagnostic: BL0PR04MB4530:
x-microsoft-antispam-prvs: <BL0PR04MB45305877193A36E5EB80BD6CE7A80@BL0PR04MB4530.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5OHdRYOt2mW7cYqkkUBJ/DjH/MNTOfv8ACcud+wRgMDdt0OsJobjQh8guaZsnT5UkBfs1qcspC8jZJJf+snMVBiGnJYYmuKvyub9ahXRoxaBQI5nntd8S5jVGvjH5z43oiN+vAE4KTcnfSeKfntjW4+4tpE+5yxS6OVDuCJhyf9t3se0FWN+QIj857cG+ySkGvf1STw/9L+60LxrioYwLuyCL1LoW5Y2wFdcICjnR6gMyucCmkS9TaBd0yR6IsvzpLKlFdCLAYy7MM5bxGbNQgTayUNWgRpqZH7hgtWl7LSjgqPS4ZKeEwH/9CBvc9Do7FO0X8Jm57W9Vbp+lYROnVczf3NK3jT4GzNNvF1gDrQlaupIW9p7mb15n1aeRatpoNiA8rrx5Nqh3dJb80xBFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(71200400001)(36756003)(8936002)(4326008)(86362001)(110136005)(8676002)(5660300002)(66476007)(66446008)(6486002)(2616005)(66946007)(186003)(66556008)(91956017)(478600001)(76116006)(83380400001)(2906002)(6512007)(316002)(6506007)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OTlMd1ZMT0tjREUrRjBKbWlNWGt0bVI0RkFncklPNXFkTUI0OURWRmpSMUli?=
 =?utf-8?B?Sy9nbFE5TzhPZ2hpdEN6WSt2Uk9LY3RiOHZxWTVVN295K3IyZGNYZnFkSVhY?=
 =?utf-8?B?RXQrZ09ZeTlSLzh1alYwVnNFUUNHOGpXVFJLazJjN1dnNFBPbVZpNlh5WEhY?=
 =?utf-8?B?cFNmU0x0bVltWlVVSDNLOVZCejVRV3J2cGhGSUQ3bENOcXhVS0c2c0o2dm1N?=
 =?utf-8?B?OWY5bmFlZFRsbE5GNlpVTnU3NXc1R1JNcnkydXYvQTV5eWc2KzJpMnUzcDho?=
 =?utf-8?B?MUZVM3lpazBPSStxQTJ1WUUzTGdzdDg2dU9Nd1kwd0VrWUcrbmlnLy9xbko5?=
 =?utf-8?B?RFpjNWNVbTVyNE1yVWRXOGlQV3h6cWY0LzJzODg4N1djclB0ZlFZZnJPanh1?=
 =?utf-8?B?SzZLZ0lWaGtnNWUyTkMvcytDcGREaHJYbzdpNCtzZkxUU1BpOW1XdCtrQVNX?=
 =?utf-8?B?d2Q1NUV0RHVjMnNlbStRclhDYUVPRWR2M2kxbk5VMHNwU05Fb25FL2dDdGdF?=
 =?utf-8?B?QkN0YmdSZXVveW1pUUVrc1hWNlZBbzkzM3pBMW5KQzNKUjJPZU1rQ2xONTZM?=
 =?utf-8?B?dXFXYjZkUkg4aUlxbGpMd1hGMkkyTFJzTk4zMUExcUZ0R3QrRWpKMEE4Y05m?=
 =?utf-8?B?bnZLVXIxc0NvblBwUTZPbERkWXp6SDZsZzcweWYyZjJCUVpRMmtSUUE5VDNC?=
 =?utf-8?B?SGYvQ3BHR21rTFlscThSMHZqb2tBckJ0S2M1NkEzckFNcVdUY3BPRDZyN3dn?=
 =?utf-8?B?T1BFdUlEV1ozbURFazdFai9pRUZ1YmZYWmlzWUJMVjJ5RGdrVEQzQ25PMlpz?=
 =?utf-8?B?VHN5OWdZYzh6S0RXNEFnck5QakxuSktXZmVyMlduWVZMYk9zNGxTK01yK2FM?=
 =?utf-8?B?UjBwb0JtYmZsc3VVZTg4MGNEOEtUVllRY0RxSjA0Z0IrdlhxbldaSDI1aVRF?=
 =?utf-8?B?ZWRCMDhPcDNCdTNSM2JyUkdDSkptVktVdWRBNkN4cDNPVGZrRENNK2lTTnMw?=
 =?utf-8?B?dkphb3pjbEtub2pmb2xLVnBnZlEvQUtTMGxXdHo1b1p0ZXFhbDhyd01lQkFn?=
 =?utf-8?B?UTRLanNMY3lvaXNCM0l4RXFkY3ppcGwxSzREbEdPVm5FUk16eFdlWk01RXdk?=
 =?utf-8?B?WEJYNFlWVmZobjA3Tm9HSTJ2SnBlZEIzWWpmQnFyRktCNmdFdGNQU1lIeEpw?=
 =?utf-8?B?Y1ptRkRxSUFENGY3MTBjci9qS3NqUHlwcHdCZ2JJSEMxKyt5WGJqSjlWcVh4?=
 =?utf-8?B?ek4xL2xMK0FhTzFER0RKejVNNmhQbmlBcDhZVVg1TC9vaUFkd3l2aEk4aFVz?=
 =?utf-8?B?WVlzQzhSZGNmZkl3WjJvc1Job0RKaEU0R0tabmpINDZUMkFsVjFuUnNiMFVP?=
 =?utf-8?B?aVIrQllYVWVPZnNMbGhrS0kvdjFhbmpnSWdtMExCODJsUnFUamRaQnVuTGJV?=
 =?utf-8?Q?2x0UG2Sg?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C82778BCF2496646827ABE6C7D48D245@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b822e76a-216c-439d-295d-08d8b83ab3ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 03:15:53.4196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2KtNK6PDYPffBiKhDNlYk71PrrmjtjSrJUklYhaZeNFW8wy3YdGF+4ze6w4d9BaWxbtkD/9ruwTr7fbgxxRGLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4530
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gV2VkLCAyMDIxLTAxLTEzIGF0IDE3OjQ3IC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+
IFF1b3RpbmcgRGFtaWVuIExlIE1vYWwgKDIwMjEtMDEtMTMgMTc6MTI6MDYpDQo+ID4gT24gV2Vk
LCAyMDIxLTAxLTEzIGF0IDEyOjUyIC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+ID4gPiBR
dW90aW5nIERhbWllbiBMZSBNb2FsICgyMDIxLTAxLTEzIDAzOjI5OjM2KQ0KPiA+ID4gPiBPbiBX
ZWQsIDIwMjEtMDEtMTMgYXQgMDA6MjUgLTA4MDAsIFN0ZXBoZW4gQm95ZCB3cm90ZToNCj4gPiA+
ID4gPiBRdW90aW5nIERhbWllbiBMZSBNb2FsICgyMDIxLTAxLTExIDE3OjAyOjM4KQ0KPiA+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ID4gKyAgICAgICAvKiBHZXQgdGhlIHN5c3RlbSBiYXNlIGZpeGVk
LXJhdGUgMjZNSHogb3NjaWxsYXRvciBjbG9jayAqLw0KPiA+ID4gPiA+ID4gKyAgICAgICBpbjAg
PSBvZl9jbGtfZ2V0KG5wLCAwKTsNCj4gPiA+ID4gPiA+ICsgICAgICAgaWYgKElTX0VSUihpbjAp
KSB7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcHJfZXJyKCIlcE9GUDogZmFpbGVkIHRv
IGdldCBiYXNlIGZpeGVkLXJhdGUgb3NjaWxsYXRvclxuIiwgbnApOw0KPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybjsNCj4gPiA+ID4gPiA+ICsgICAgICAgfQ0KPiA+ID4gPiA+ID4g
KyAgICAgICBrY2wtPnBhcmVudHNbSzIxMF9QQVJFTlRfSU4wXSA9IF9fY2xrX2dldF9odyhpbjAp
Ow0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFRoaXMgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeS4gU3Bl
Y2lmeSB0aGUgRFQgbm9kZSBpbmRleCBpbiB0aGUNCj4gPiA+ID4gPiBwYXJlbnRfZGF0YSBzdHJ1
Y3R1cmUgaW5zdGVhZC4NCj4gPiA+ID4gDQo+ID4gPiA+IE9LLiBJIHVuZGVyc3Rvb2Qgd2hhdCB5
b3UgbWVhbiBoZXJlLiBIb3dldmVyLCBJTjAgaXMgbm90IGNyZWF0ZWQgYnkgdGhpcw0KPiA+ID4g
PiBkcml2ZXIuIEl0IGhhcyBpdHMgb3duIGZpeGVkLW9zY2lsbGF0b3IgRFQgbm9kZSB0aGF0IGNy
ZWF0ZXMgdGhlIGNsb2NrLiBTbyBhDQo+ID4gPiA+IGRpZmZlcmVudCBwcm92aWRlci4gSGVuY2Ug
SSB0aGluayB3ZSBjYW5ub3QgdXNlIGFuIGluZGV4IGludG8gY2xrX2RhdGEtPmh3cywNCj4gPiA+
ID4gdW5sZXNzIEkgYW0gbm90IHVuZGVyc3RhbmRpbmcgc29tZXRoaW5nLg0KPiA+ID4gPiANCj4g
PiA+IA0KPiA+ID4gQ2FuIHlvdSB1c2UgY2xrX3BhcmVudF9kYXRhOjppbmRleD8NCj4gPiANCj4g
PiBOb3QgZm9yIHRoZSBiYXNlIG9zY2lsbGF0b3IgImluMCIgYXMgdGhhdCBjbG9jayBpcyBjcmVh
dGVkIHRocm91Z2ggdGhlIGRldmljZQ0KPiA+IHRyZWUgKGl0IGhhcyBpdHMgb3duIGZpeGVkLWNs
b2NrIG5vZGUpIGFuZCBzbyBpcyBub3QgcHJvdmlkZWQgYnkgdGhpcyBkcml2ZXIuwqANCj4gPiAN
Cj4gPiBCdXQgSSBjYW4gdXNlIHBhcmVudF9kYXRhOjpody4gVGhhdCB3b3Jrcy4NCj4gPiBTbyBJ
IGVuZGVkIHVwIHJld3JpdGluZyBhbGwgcGFyZW50cyBzZXR1cCB1c2luZyB0aGUgY2xrX3BhcmVu
dF9kYXRhIHN0cnVjdCB0bw0KPiA+IGRlZmluZSBhbGwgY2xvY2tzIHBhcmVudHMgdXNpbmcgdGhl
IHBhcmVudF9kYXRhOjpodyBmaWVsZC4gVGhhdCByZW1vdmVzIHRoZQ0KPiA+IG5lZWQgZm9yIHRo
ZSBwYXJlbnRzIGFycmF5IHRoYXQgSSBoYWQuDQo+IA0KPiBUaGUgZHJpdmVyIHNob3VsZCBub3Qg
YmUgY2FsbGluZyBvZl9jbGtfZ2V0KCkuIEl0IHNob3VsZCByZWdpc3RlciBjbGtzDQo+IHdpdGgg
YSBkZXZpY2Ugbm9kZSBvciBhIGRldmljZSB0aGF0IGhhcyBhIERUIGJpbmRpbmcgd2l0aCBhIGNs
b2Nrcw0KPiBwcm9wZXJ0eSBhbmQgdGhlbiB0aGUgaW5kZXggYW5kL29yIGZ3X25hbWUgY2FuIGlu
ZGljYXRlIHdoYXQgdGhhdCBmaXhlZA0KPiBjbG9jayBub2RlIGlzLg0KPiANCj4gSW4gRFQ6DQo+
IA0KPiAJdGhpc19maWxlc19hc3NvY2lhdGVkX2RldmljZV9ub2RlIHsNCj4gCQljbG9ja3MgPSA8
JnBoYW5kbGVfdG9fZml4ZWRfY2xvY2tfbm9kZT47DQo+IAl9Ow0KPiANCj4gQW5kIHRoZW4gY2xr
X3BhcmVudF9kYXRhOjppbmRleCA9PSAwIHRvIGluZGljYXRlIHRoYXQgaXQgc2hvdWxkIHVzZSB0
aGF0DQo+IGNsay4gSWYgdGhlIGNsa19odyBpcyByZWdpc3RlcmVkIGJ5IHRoaXMgZHJpdmVyIHRo
ZW4gdXNpbmcgY2xrX2h3IGlzDQo+IGFwcHJvcHJpYXRlLCBidXQgb3RoZXJ3aXNlIHdlIHNob3Vs
ZG4ndCBuZWVkIHRvIGdldCB0aGUgaHcgcG9pbnRlciBmb3INCj4gYW55IGNsayB0aGF0IGlzIGNy
ZWF0ZWQgb3V0c2lkZSBvZiB0aGlzIGZpbGUuDQoNCkkgY2Fubm90IGdldCB0aGlzIHRvIHdvcmsu
IFRoZSBzeXNjbGsgbm9kZSBoYXMgImNsb2NrcyA9IDwmaW4wPjsiIGhhcyB0aGUgc29sZQ0KaW5w
dXQvcGFyZW50IGNsb2NrLiBCdXQgdXNpbmcgY2xrX3BhcmVudF9kYXRhOjppbmRleCA9IDAgdG8g
c3BlY2lmeSBpbjAgYXMgYQ0KcGFyZW50IGNsb2NrIGZvciB0aGUgY2xvY2tzIHJlZ2lzdGVyZWQg
YnkgdGhlIGsyMTAtY2xrIGRyaXZlciBkb2VzIG5vdCB3b3JrIChubw0KYm9vdCkuIEhvd2V2ZXIs
IGlmIEkgdXNlDQoNCmNsa19wYXJlbnRfZGF0YTo6bmFtZSA9ICBvZl9jbGtfZ2V0X3BhcmVudF9u
YW1lKG5wLCAwKQ0KDQp3aGVyZSBucCBpcyB0aGUgZGV2aWNlIG5vZGUgZm9yIHRoZSBzeXNjbGsg
ZHJpdmVyLCB0aGluZ3Mgd29yay4NCg0KTG9va2luZyBhdCBjbGtfY29yZV9maWxsX3BhcmVudF9p
bmRleCgpIGFuZCBjbGtfY29yZV9nZXQoKSwgdXNpbmcgaW5kZXggc2hvdWxkDQp3b3JrLiBOb3Qg
c3VyZSB3aGF0IEkgYW0gZG9pbmcgd3JvbmcgaGVyZS4gRGlnZ2luZy4uLg0KDQoNCg0KLS0gDQpE
YW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFsDQo=
