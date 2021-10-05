Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374FFC433EF
	for <linux-clk@archiver.kernel.org>; Tue,  5 Oct 2021 11:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17996610A2
	for <linux-clk@archiver.kernel.org>; Tue,  5 Oct 2021 11:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhJELjH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:39:07 -0400
Received: from mail-dm6nam12on2088.outbound.protection.outlook.com ([40.107.243.88]:27200
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230500AbhJELjH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Oct 2021 07:39:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvAGdJP53id2hNOVczGiRVZUnxx/RSRC3gy6W/TCSW4AZ4RCEMZaNzgOvFK26vTwF1NKa8n7wG8Bg6f8hwugGcWFMqHiK7glXUBzJjh7iggs37mFxrkjwNaYkHy088jqD//0mdVInS5EMOSt30nl9M2FnsV6rxfJJG1/YrgMF1R/OelYHS31jlJtdXrGm0WHmCubl8/fjpGD8btYJmb+p1Qb9/ACQiUNsq912nWDzie24nHKhNV1ua2UXD7i+gsQcPwnd9zH+MiI2MWdX2Bpfb2o4ta0+WY8Sr2SE6bJdv9vUhFUQRwmD9L/u0N6l/0yaSuKhTLg5u/q9i2mmok08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFodSOQXzZOi7kesiN3j74p1oq6L1ABo7+t60aoOedM=;
 b=f5tQdj3XT6QEBHIwn16Qn5jEYwtXZnRDDTNZzOB45ugrJb9Dk0+zktq9ofBfLRXSStiQnACWqnKV/aqHPmDvHNk0aalltWzXfHd6A6/K837hmCIY+tJvrWQ8qVAPDoPn8QsLR8+BJ6vDVgzwYzsABPDeBYz5rLqYsYLy5rm++jsYFzL1Sh5uZC9t6crSB1xbsapqpem+zdoMWXeLWoRQUUYHwviajYlthvLsU/V5LNGzWcBVl3KRKj8o2Zsofdz0LOZ1jKA23s31kibT+eYluBku00CnE3wa7DYojRcqdRYSV9Sa04Z8n8z2bpTOxKcpjO3VSgTjg4seTIyttPXlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFodSOQXzZOi7kesiN3j74p1oq6L1ABo7+t60aoOedM=;
 b=barWMrwnqwuEiwQezmDIKFcdCuHSt60DjBozm/VAq5K+xqZmNrS59jf9oA3Dz1OoGxVV0H8gh053QIfOZ0eHikHGOnlACA8ApdZdabmfkGcjSbZo6/Tywbk33cwKQ551phGty1pe37CVef1QH41nIF9jU2GLeCzbdsGzU37MgLc=
Received: from DM6PR02MB6635.namprd02.prod.outlook.com (2603:10b6:5:221::18)
 by DM5PR0201MB3495.namprd02.prod.outlook.com (2603:10b6:4:7d::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 11:37:12 +0000
Received: from DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::d6d:8488:de6b:eb9f]) by DM6PR02MB6635.namprd02.prod.outlook.com
 ([fe80::d6d:8488:de6b:eb9f%4]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 11:37:11 +0000
From:   Shubhrajyoti Datta <shubhraj@xilinx.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     git-dev <git-dev@xilinx.com>, Michal Simek <michals@xilinx.com>
Subject: RE: [PATCH] clk: zynqmp: Replaced strncpy() with strscpy()
Thread-Topic: [PATCH] clk: zynqmp: Replaced strncpy() with strscpy()
Thread-Index: AQHXo8geLALr1QcogkG2YMOLTJaPv6ucN16AgCg6bEA=
Date:   Tue, 5 Oct 2021 11:37:11 +0000
Message-ID: <DM6PR02MB6635E9F94E9A5FFC06188EF2AAAF9@DM6PR02MB6635.namprd02.prod.outlook.com>
References: <20210907090920.2620-1-shubhrajyoti.datta@xilinx.com>
 <163122197920.1821005.15545429119086077225@swboyd.mtv.corp.google.com>
In-Reply-To: <163122197920.1821005.15545429119086077225@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a3f26fd-99eb-4eab-ed66-08d987f478e7
x-ms-traffictypediagnostic: DM5PR0201MB3495:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR0201MB3495BE6B21C8E4722BFDEF21AAAF9@DM5PR0201MB3495.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 258XIO5VlOS+oJkXEQ7c2kEUnl8lVvisoYV7CfN50fkS4OxZ5HNhcSECFmFbSrh4gC9oWv3oF0o8ki/0Y6WzsznEmWKshXphR4LF1pqVJpTFXNi0w9kymZUK96no5H+tfh80grHrAeu65vuQWt4xkmE2tqh5rHD2uJ8oFoWjifKVI09xir/PoOEG0/2TJQ+kHdwkI6yvOfO9IMG4x3GBsU3r5wgdK9eSf1dkUdjCDVop5mJv3IuBfyxjJooiZUXbuCSVs8FQDA7tIa9BIhosf6DRdgo3me5OzMAHnyql+ieIgRSvQNfTzbqFKht8FZWWjDgGs2ivVdmyGyt4GSmCOjZ0xdlifY2+IPikMuu9DVJcfIyAMVC5RplAqOJ2UNvP9bEsJC3Ue2vyQN80YHf77RSyf3geLsX47xyFi2407gn1VWdJZIh9GTR7VNEjLKXXqq8MktRwJI9cftEFhS1tBRbFu1d+vvecKbvStzCQn522VfBnuiLGdfJO1w0p2Wcfa2LKjdaYn6mQ0g1zKH+vUgER5KHqkLwo2H5q8nn3GE9SD1+qFZLBgTLWPcQR/JG4lafK4Wlm1ZEvYRaC3+sHoMnIeokU7kNgWs2Troa911uFzGqUHbtUCl4/aC/w1MHfxBeIXhuFIoGSSET1f6D7nG7ij9rk7NsSrh99oUw6YEOlcjT9vnJjCOjHRNhvGPtq0YFX35BdS6UUJ6bmBISWaP8foR3wNkHn5uq6gMdvwTMmHVB4kjhun1QVGtReHpvp/Xwp07I0RUe857nBgdBVNQFE4FAF47WtO3h2skDrO1M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB6635.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(66446008)(7696005)(4326008)(55016002)(966005)(5660300002)(9686003)(107886003)(8676002)(38100700002)(38070700005)(508600001)(316002)(76116006)(64756008)(2906002)(86362001)(122000001)(33656002)(66476007)(66556008)(110136005)(66946007)(6506007)(83380400001)(186003)(71200400001)(4744005)(53546011)(54906003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3FkRjd6SGZVY1p6akV2QU04NWVORmNBTDFMczhvOTFKdy9MdnVoREl1OXdN?=
 =?utf-8?B?MElRRnQvRkxBQ2xKV093VVZMV2l0RmM5Z2J0b3ZoZEVUSnFuMXVlWEU2aFUv?=
 =?utf-8?B?SE9acGxOTkFCOTVKVTZ5OWxqR242NXUvaDF5VW9TcVUxcE5RNldyZWRVQ0h2?=
 =?utf-8?B?Yzk5eVhZMnhiL2ZWY0MzME9iSmpCdkI3eHZPanFwSDNOcDl6SnhpdWRrZzBP?=
 =?utf-8?B?OENVaHlNZHpnVVhWMm01b2IrSjliZFB2b3RpeWNNN083TWNRbVhVUWNySkpl?=
 =?utf-8?B?V3V2R1FYVSsvMVFQVU9xV1R5UnNQVHI0bHV0Z1djMDc1S2txcmxnWFBpRHo3?=
 =?utf-8?B?Vm5DcldpeTIzeVYrdzBzYmwrWklUOU5pYjhMS1hQR1M1L3V6NVM4VXl5dlVY?=
 =?utf-8?B?dkNlTzRGekswR25JOStlRnIyd0I0OWlxNllvN2hkekxTb0R4Mmx0dC9TdWJ1?=
 =?utf-8?B?MmZFdU9oSHhUck1XYVc1ZzRMRzdjZGkzNGwzZ05venkyZnFXVjByNUJ0Y0Iz?=
 =?utf-8?B?OXBnRytSSEtNSDVmU0NuM2E5ZjFONjkva3k2S0hNN1c4QWRVR3B6OGZqQWhI?=
 =?utf-8?B?WldUTTMwa3BXQXpPZUhQbXBMbnpteHdIakwrZ09IWEhjUUxneHQvRUtwYk1R?=
 =?utf-8?B?eWFQd0IxVko5dnV0Lzk4YVo1Sk1SQjNpdzZGeEhlSlBFSWxZSFdTcE9NcjNY?=
 =?utf-8?B?UmI0Y25ZYjZscGlVc3YyU1BMak1uMWdlbXhFVFNCSHRWYzhEaVUxSFlUMEFB?=
 =?utf-8?B?TzBrQjdqemJ6dnpsVXpjQ3ZiRHgraitNWHlwR3UvWmh2Y0UyT2hoOVR0dVZl?=
 =?utf-8?B?cmxBUVh4dXBaS21oQ2YxUFVFWStIdDlNdmlzTktETU8xeXJ3cGpMSUd4TGk5?=
 =?utf-8?B?ZjlDMGt1b0Vtak42c2VSeXlzd3RGWC9hUkU4NHFSbFBxYkUzcjJxbXRJTzFu?=
 =?utf-8?B?cGdFM09uZnMwOXRKQmNiaUM4RHA2U0p2RlNYb2RhdytNQ3ZwbkRPZTBXWFhC?=
 =?utf-8?B?b1VTTW9lVmNheHJ0bDBkcTBVSVFLU1JQN2R4dHc2U3czc0FQck0zUmhYZmZu?=
 =?utf-8?B?RUV4K1h2cytjcUVnNDI3NTBTMHg5TFZ6aWtoM0VxQjRyNXpwMm1BK3J4K0Fn?=
 =?utf-8?B?YWtoa09RT1hFR0RQekJ6cW41WGhSQ1F6enhMSHdFcU9NZzl2QjRYOWlwVm9p?=
 =?utf-8?B?VTFYWUpZNSt6Z2RBeUticllWVENHQ25FRGdEd3hZTHgwNXVlc1FqNkI1V2Zl?=
 =?utf-8?B?cHRscFVVNEJmRDRCMXo2YjlZT3hVK0xGS1VsN0c5VWJVUU1hN0hJRzg4bTNM?=
 =?utf-8?B?UkxGRFJoK2NqZEdtYkUva0ZZSUlJMVM5ZHV5aTFtL2VRUWNEUGlzR2lvS2tq?=
 =?utf-8?B?cG9ERWU1Q09ncThhY3ZhbTdYeVkvR1hLMmdSc2V1NlV3aEZOU3dQZUcvRUht?=
 =?utf-8?B?YllYWmFjMk90VXRPQ01KMkcvZzRZZEx4ZTE4d2N3eXQwY01pamFXNE42bVVt?=
 =?utf-8?B?Um9LcDF0bUJoMzArVmNiS0RleTRDSHlQUVFXUnlMajNWcWJzeHdqUnY4R2hn?=
 =?utf-8?B?bVYzQ2pBRzdLb0J1S0lVcnJiMDNYekRIeERvZUtpQ1h0S3IwTFpQN05QTlNV?=
 =?utf-8?B?WEJMUnNaOVB2c2lQaXdFcVZ6N0VDdnNyRHNmaEhjczV5M0ZIaUZSU2xEd2sv?=
 =?utf-8?B?cjN6QlErNGJuK3hJaFQ5Q2kyY0YwVlpjQ3BDRFNDUGRaV3UySFRyYnl4Uk8y?=
 =?utf-8?Q?Tot9KQn7HDzWiIRvEbPYqW0XeL9dnAq36ovWB5o?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB6635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3f26fd-99eb-4eab-ed66-08d987f478e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 11:37:11.8577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAhddxYZtJK4TszfpQ9uMfwF7mWAPlzdHn4U0dXNSONrDzvANqZSYfTWNzXkqy6cTCGIPecAuGM+ZyZ50PKtnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3495
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxMCwgMjAyMSAyOjQz
IEFNDQo+IFRvOiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqQHhpbGlueC5jb20+OyBsaW51
eC1jbGtAdmdlci5rZXJuZWwub3JnDQo+IENjOiBnaXQtZGV2IDxnaXQtZGV2QHhpbGlueC5jb20+
OyBNaWNoYWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gY2xrOiB6eW5xbXA6IFJlcGxhY2VkIHN0cm5jcHkoKSB3aXRoIHN0cnNjcHkoKQ0KPiANCj4g
UXVvdGluZyBTaHViaHJhanlvdGkgRGF0dGEgKDIwMjEtMDktMDcgMDI6MDk6MjApDQo+ID4gUmVw
bGFjZWQgc3RybmNweSgpIHdpdGggc3Ryc2NweSgpIGFzIHRoZSBjbG9jayBuYW1lcyBhcmUgc3Vw
cG9zZWQgdG8NCj4gDQo+IEFuZCB3aGF0IGlmIHRoZXkgYXJlbid0Pw0KDQpUaGF0IGlzIHRha2Vu
IGNhcmUgaW4gDQpodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1jbGsvbXNnNjA1
MDUuaHRtbA0Kd2hlcmUgd2UgYXJlIGFmZml4aW5nIG51bGwuDQo+IA0KPiA+IGJlIE5VTEwgdGVy
bWluYXRlZC4NCj4gPg0K
