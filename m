Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878E4C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 11:30:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E115233EA
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 11:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbhAMLap (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jan 2021 06:30:45 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:13215 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbhAMLap (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 06:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1610537444; x=1642073444;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IAiE2DFkmrLmI5vt37KDjmB6OHZCxgPffiQO6fyIoyg=;
  b=jAWQKJaye7tsbAPvWDdtg9Ny4P7iVLHGMOez1k8a2Y5Y+B+o0ByobwKK
   HrFsHIeBliZAFURBi4Wiv/i6cVd/woJoGBJPDElF9o/TCznpHLsKiMYUP
   gkerujopTU14PlGfBF3Gn5l9srJPmuXaMByt85j2c5LNv/t4geZTe0So8
   my1YiXruXRXj2+TcaeQH+JiBPyOHk+NSx0hQCaTm3nzMb+MWYB+2pc0jn
   DCKH4EteZ7+cjpTdi07eAKBYcWtp7Zg3wgOOVH8WGt2LtM7kCDaUZvpd6
   mf0Kho8HHPd/gDv1z0MxJ7Mt5SAWf23v0KbROEFYnZK+OFJHP0ftJGX06
   g==;
IronPort-SDR: 9NzReqygl50RAFv4fkpirAFQfLfgSdsjSDT37tnyQTasL7fUcvdsVyqe7mjHkKw+klxcxnKtml
 paheEnQpXwu2c2Emw4oGL7JPCQVvSjtKJcS31+uCBz/yMVAwqfBwo5rxR17MFZADddXzewvrUl
 TD2l3A8GB8fhgSu8dcUArhKdL4WjYW+MkL9hncfO7k7yUgRZu2cn0yVvZDOlBTlkP3dOClFpXP
 vLpinoc1hEMbT5c9JIoMwxnnLwpfj1dzsQr+doRIpGM/UDlMUSvQmSKQCuFG4E8vRLXonTDjlW
 cbk=
X-IronPort-AV: E=Sophos;i="5.79,344,1602518400"; 
   d="scan'208";a="157323795"
Received: from mail-cys01nam02lp2055.outbound.protection.outlook.com (HELO NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.55])
  by ob1.hgst.iphmx.com with ESMTP; 13 Jan 2021 19:29:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOekAzShxVzoDToipZpSmd9KaNgcvTE4RHv/6NHGqCSLSSxusObblmBXt3tjteJEt0aXjWS2PXZqo/cjPet5h07GarRtVgGAE3cVfMeuJaBklP5DJXnhvC1w1/8sa98sgmAcDkwWVW4JVIYdhelzlzAtYYt9yg93EHXaZD/v7WMrBsuP5kNFRZCDltl0K0RLNh5Cj6gg+j5wbh2DAT1JlJgS4FCs1qjmdiLAt37CadXDO0yQN8zPKZc5Xc8/uX9X56oLfuGmuaEl+764IrkqAm/B+HmWxQ/q6R9Z4C316WP7fSGphd+Zni/QT7DPgoNnwkY3cTsa1XwT0TUI8tloEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAiE2DFkmrLmI5vt37KDjmB6OHZCxgPffiQO6fyIoyg=;
 b=A4RnE41gzKEqJhArxa6pvO2Lb7K+aoz7Qr3wbfIxxcOJ8c7EzyXp9SCue9K4kZNES7yFkTivEjuGkz5brN0kWDfs/Ma7MxlQ9dMD6GDldSPmgQhrK8EF5m2WMet4KZFdueqlrIgJE3qD2w1XBYdGr3DiaVzmYYN2ajqgoKyv3r5KuwbDG9hiI02RdsE61l5DHymEQZifA+k/USUDO/AIwx1w/AP1lxNL4ETZNVb8rS7HB+V80ink9ve4k2ki5vMxBDZnbJ/TlsnMzq3MKdjx7w2Gl7i216KtTkgN8W4RV8a5MOWhAq02XxdtBQml40wW1d8efg1eFvHp5ngJo5iC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAiE2DFkmrLmI5vt37KDjmB6OHZCxgPffiQO6fyIoyg=;
 b=U7kwlvx+xzHBCpPiieOoxTcCh3mjEaNaPuTxhilkHX/LcIXYXjLGwFYXgUmAcITcGwzeHftTQ++j58Jb2L5Nq30wifkwvXukEIav+kbvYsIhyogSXVJaH12cmGrWYzcmwWe7wB0nCvjsJxQQff0I/1W3+5LUDGtZhtpsdikmZbc=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7062.namprd04.prod.outlook.com (2603:10b6:610:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 11:29:36 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%8]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 11:29:36 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW6H6jBxZahSfnlkqtd1vCx2d056olOk4AgAAzcAA=
Date:   Wed, 13 Jan 2021 11:29:36 +0000
Message-ID: <14eb3ad4c736b30a790169854878aeec019f9004.camel@wdc.com>
References: <20210112010238.200241-1-damien.lemoal@wdc.com>
         <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
In-Reply-To: <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d54ba479-8e8a-4100-5e01-08d8b7b681f3
x-ms-traffictypediagnostic: CH2PR04MB7062:
x-microsoft-antispam-prvs: <CH2PR04MB7062D9BBB14BBDF2E8713973E7A90@CH2PR04MB7062.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9x3pCqa/OudKfqMZZwsMdxO4u2ygkKMMt/fkPRgdyQM1TLP93PbVusNRCRso3xo0mtSsYy5oy8tLHxcwEjXSyrXQbdWa+cvbfI08S3yoBf/A6OrJ4u0LCtn6ofqDJ21xPpaRsQiVEa8V4dN49/iaf1tINjay7bWU40indUVPmRWf9YkUWcc6ge/MoaQDgFstNwAn2+OpwYuwLAOvxQv+HgaOdxuuTfBkdcgd3iUx/ZasIWtVQw0Mw6+YjN7QxXHKpNw/ws/nkmrlehXNclRokOVEjbX7ouGIoJE/Pa/g3Y94VGwVdJqiHr2LigH1lNlyt77h4i/Sh8fzMIjwfFiccudzidH88+pOQqu0/3h/zcogNuPyZDBFdDIQUi51P92HCnvPejAQKwONzJQMCHNdMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(6486002)(2906002)(83380400001)(6506007)(86362001)(316002)(4326008)(71200400001)(8676002)(6512007)(2616005)(478600001)(66476007)(66556008)(64756008)(76116006)(91956017)(66446008)(110136005)(8936002)(5660300002)(36756003)(66946007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eUNtejAwRElIWDJ1OW0xemVDUGVadGlRZlVuVUl3Q1ZLanYzYTBseTcwODBn?=
 =?utf-8?B?dEIrZmxKdE4weEMvNXRKOS95SUM1SDdZYmZjR3RyTFRldWxzMzlkWXVGQlhD?=
 =?utf-8?B?WGxjSitWZmE0UWtiYmpSRVlPS1drWll6MnM3a1lJcjJPZ1ZXUVllRnJsZjNo?=
 =?utf-8?B?SC9pWm01U04rL3czSkl6TmZnOUN6QStkb3RCZHpWcnJZYkd0M2k1cXVFaXpz?=
 =?utf-8?B?cUtyT1FiejRORVFBSDJ5Y3BKcGxRTUVuMTFOUGJLcnNjUWM4cXgzdWorTmNP?=
 =?utf-8?B?MlJ2QkpIV05lSWJHOGtkNlVKS293UGVSbEY1QllxK3BiMkxtSFM2OWQyZ29O?=
 =?utf-8?B?VFJuTmEvb1h6MFE5T3RHbkJ6RDFkcFgwc0twd2pUY2NHc2I2K1NGNmdXQjZB?=
 =?utf-8?B?Y0thc1V2UCtubzdSSVBOLy94NERMTzBZclZWZ1UvNWZIZnNxUUtNSURYMHhP?=
 =?utf-8?B?QlAyQWg0YTgvVDV0MWdPQjYyOGh2UHB1bk9GVy8vNURjNzJWZGRMTDI2aFVh?=
 =?utf-8?B?cG5TbWRIRVQvUWQyRi81OUk2UzJ4RVdQRkwxM09aZTZrYUN4UDNnT1JjWlhS?=
 =?utf-8?B?Q2ZSWlhGRThrTWJBMFlaS0dYd1lGRzlwQnNTQkh0ZHpxTFlLYkdCODd5M1Bh?=
 =?utf-8?B?blBQZDBLRWdxVndUMlgvVkFWQVYzb2FjSjBIMnZoVDVnaS9QN2V0KzlIcith?=
 =?utf-8?B?cHcwWGVJL3VQNXR6RkxpYmhKOWhlc3ZJRWdoUEh5enBITnFNQjVWaEN5WEht?=
 =?utf-8?B?UmJXTVh4dWhZU2QrVlFUQWdydnFCNDZtbm8zTHRaVVUyQnJjU2hzU296Zld3?=
 =?utf-8?B?SnF4cmhqWndCR0o4UWYxdE8zUk1UQk9manVsYVhuam9BeXpheEc4Z0lwMTlG?=
 =?utf-8?B?aXNGRm9zOEtZdVpOazdLTnVJeE1DS0FBS0pVNjRlYzBSbmYrWjk0ZGdwUGo5?=
 =?utf-8?B?Z09LOVF3WmxJd25sRXd0S1hPR1BRa1AzZ3diN1YxUEwvTk5LNnF1SzhOakNl?=
 =?utf-8?B?K1dLSzZOZWE1dDYySU1GZjZkMkpldGlLcitQUy9KalpOSWl4c0V5Q2pNYkxI?=
 =?utf-8?B?MjgrTXl4NUJKYlY3cFVHY2ZKN2dPTVVpVEJxMGVjWGNOc1dTa0xMZVIyNkZO?=
 =?utf-8?B?dWNwZzJUTSt5ZXRvVUsySEp5SXBlUTNzR1BUNVplajlHcFgwSm9EVmIxUmpF?=
 =?utf-8?B?SVEvMTRwMHJlUkxRZitkWVMrRzlvYzJ2ZW1jR3lySXFyZGFDZWJEYXZmOW5Y?=
 =?utf-8?B?Rk1wN01CTDJ4LzJNOU5RLzNRd3ptVURjbzE1aU5BTXIrN0VoUjI4OHhCaVZo?=
 =?utf-8?B?OXgwQVVyTGl4aGtaTDJmeGJmOHlFSldvNU1CTFMwdlIrYmM0Z0VwWnVUWjNt?=
 =?utf-8?B?KzR4TEdtazhBalp4bDJaMkFFMG14U1BrN2U4eGt6QkFEcjJKSm40Zk5Od0hv?=
 =?utf-8?Q?5mQu4emp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0CB16A63DF3CF49BCD183EEB808A984@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54ba479-8e8a-4100-5e01-08d8b7b681f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 11:29:36.3503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9cixDYbDKhKayK06YpmH9y7OM42wxk8lkryxxnVEtx0jAGar21en4vunc8f37FMO+a23bA5EytPvPu5FlQFDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7062
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gV2VkLCAyMDIxLTAxLTEzIGF0IDAwOjI1IC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+
IFF1b3RpbmcgRGFtaWVuIExlIE1vYWwgKDIwMjEtMDEtMTEgMTc6MDI6MzgpDQo+ID4gQWRkIGEg
Y2xvY2sgcHJvdmlkZXIgZHJpdmVyIGZvciB0aGUgQ2FuYWFuIEtlbmRyeXRlIEsyMTAgUklTQy1W
IFNvQy4NCj4gPiBUaGlzIG5ldyBkcml2ZXIgd2l0aCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgImNh
bmFhbixrMjEwLWNsayIgaW1wbGVtZW50cw0KPiA+IHN1cHBvcnQgZm9yIHRoZSBmdWxsIGNsb2Nr
IHN0cnVjdHVyZSBvZiB0aGUgSzIxMCBTb0MuIFNpbmNlIGl0IGlzDQo+ID4gcmVxdWlyZWQgZm9y
IHRoZSBjb3JyZWN0IG9wZXJhdGlvbiBvZiB0aGUgU29DLCB0aGlzIGRyaXZlciBpcw0KPiA+IHNl
bGVjdGVkIGJ5IGRlZmF1bHQgZm9yIGNvbXBpbGF0aW9uIHdoZW4gdGhlIFNPQ19DQU5BQU4gb3B0
aW9uIGlzDQo+ID4gc2VsZWN0ZWQuDQo+ID4gDQo+ID4gV2l0aCB0aGlzIGNoYW5nZSwgdGhlIGsy
MTAtc3lzY3RsIGRyaXZlciBpcyB0dXJuZWQgaW50byBhIHNpbXBsZQ0KPiA+IHBsYXRmb3JtIGRy
aXZlciB3aGljaCBlbmFibGVzIGl0cyBwb3dlciBidXMgY2xvY2sgYW5kIHRyaWdnZXJzDQo+ID4g
cG9wdWxhdGluZyBpdHMgY2hpbGQgbm9kZXMuIFRoaXMgZHJpdmVyIGlzIGFsc28gYXV0b21hdGlj
YWxseSBzZWxlY3RlZA0KPiA+IGZvciBjb21waWxhdGlvbiB3aXRoIHRoZSBzZWxlY3Rpb24gb2Yg
U09DX0NBTkFBTi4NCj4gDQo+IFRoYXQncyBzdGF0ZWQgdHdpY2UuDQo+IA0KPiA+IFRoZSBzeXNj
dGwgZHJpdmVyDQo+ID4gcmV0YWlucyB0aGUgU09DIGVhcmx5IGluaXRpYWxpemF0aW9uIGNvZGUs
IGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gbm93DQo+ID4gcmVsaWVzIG9uIHRoZSBuZXcgZnVuY3Rp
b24gazIxMF9jbGtfZWFybHlfaW5pdCgpIHByb3ZpZGVkIGJ5IHRoZSBuZXcNCj4gPiBjbGstazIx
MCBkcml2ZXIuDQo+ID4gDQo+ID4gVGhlIGNsb2NrIHN0cnVjdHVyZSBpbXBsZW1lbnRlZCBhbmQg
bWFueSBvZiB0aGUgY29kaW5nIGlkZWFzIGZvciB0aGUNCj4gPiBkcml2ZXIgY29tZSBmcm9tIHRo
ZSB3b3JrIGJ5IFNlYW4gQW5kZXJzb24gb24gdGhlIEsyMTAgc3VwcG9ydCBmb3IgdGhlDQo+ID4g
VS1Cb290IHByb2plY3QuDQo+ID4gDQo+ID4gQ2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVs
Lm9yZz4NCj4gPiBDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29t
Pg0KPiA+IENjOiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9mZi1ieTog
RGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4NCj4gPiAtLS0NCj4gPiDCoE1B
SU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gwqBkcml2ZXJzL2Ns
ay9LY29uZmlnICAgICAgICAgICAgICB8ICAgIDggKw0KPiA+IMKgZHJpdmVycy9jbGsvTWFrZWZp
bGUgICAgICAgICAgICAgfCAgICAxICsNCj4gPiDCoGRyaXZlcnMvY2xrL2Nsay1rMjEwLmMgICAg
ICAgICAgIHwgMTAwNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoGRyaXZl
cnMvc29jL2NhbmFhbi9LY29uZmlnICAgICAgIHwgICAxOCArLQ0KPiA+IMKgZHJpdmVycy9zb2Mv
Y2FuYWFuL01ha2VmaWxlICAgICAgfCAgICAyICstDQo+ID4gwqBkcml2ZXJzL3NvYy9jYW5hYW4v
azIxMC1zeXNjdGwuYyB8ICAyMDUgKystLS0tDQo+ID4gwqBpbmNsdWRlL3NvYy9jYW5hYW4vazIx
MC1zeXNjdGwuaCB8ICAgIDIgKw0KPiA+IMKgOCBmaWxlcyBjaGFuZ2VkLCAxMDY0IGluc2VydGlv
bnMoKyksIDE3OCBkZWxldGlvbnMoLSkNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2Nsay9jbGstazIxMC5jDQoNClsuLi5dDQo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBrMjEwX2Ns
a19pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApDQo+ID4gK3sNCj4gPiArICAgICAgIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqc3lzY3RsX25wOw0KPiA+ICsgICAgICAgc3RydWN0IGNsa19odyAqKmh3
czsNCj4gPiArICAgICAgIHN0cnVjdCBjbGsgKmluMDsNCj4gPiArICAgICAgIGludCBpLCByZXQ7
DQo+ID4gKw0KPiA+ICsgICAgICAga2NsID0ga3phbGxvYyhzaXplb2YoKmtjbCksIEdGUF9LRVJO
RUwpOw0KPiA+ICsgICAgICAgaWYgKCFrY2wpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsN
Cj4gPiArDQo+ID4gKyAgICAgICBrY2wtPmNsa19kYXRhID0ga3phbGxvYyhzdHJ1Y3Rfc2l6ZShr
Y2wtPmNsa19kYXRhLCBod3MsIEsyMTBfTlVNX0NMS1MpLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7DQo+ID4gKyAgICAgICBpZiAoIWtjbC0+Y2xrX2Rh
dGEpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiArDQo+ID4gKyAgICAgICBzeXNj
dGxfbnAgPSBvZl9nZXRfcGFyZW50KG5wKTsNCj4gPiArICAgICAgIGtjbC0+cmVncyA9IG9mX2lv
bWFwKHN5c2N0bF9ucCwgMCk7DQo+ID4gKyAgICAgICBvZl9ub2RlX3B1dChzeXNjdGxfbnApOw0K
PiA+ICsgICAgICAgaWYgKCFrY2wtPnJlZ3MpIHsNCj4gPiArICAgICAgICAgICAgICAgcHJfZXJy
KCIlcE9GUDogZmFpbGVkIHRvIG1hcCByZWdpc3RlcnNcbiIsIG5wKTsNCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHNwaW5fbG9j
a19pbml0KCZrY2wtPmNsa19sb2NrKTsNCj4gPiArICAgICAgIGtjbC0+Y2xrX2RhdGEtPm51bSA9
IEsyMTBfTlVNX0NMS1M7DQo+ID4gKyAgICAgICBod3MgPSBrY2wtPmNsa19kYXRhLT5od3M7DQo+
ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgSzIxMF9OVU1fQ0xLUzsgaSsrKQ0KPiA+ICsgICAg
ICAgICAgICAgICBod3NbaV0gPSBFUlJfUFRSKC1FUFJPQkVfREVGRVIpOw0KPiA+ICsNCj4gPiAr
ICAgICAgIC8qIEdldCB0aGUgc3lzdGVtIGJhc2UgZml4ZWQtcmF0ZSAyNk1IeiBvc2NpbGxhdG9y
IGNsb2NrICovDQo+ID4gKyAgICAgICBpbjAgPSBvZl9jbGtfZ2V0KG5wLCAwKTsNCj4gPiArICAg
ICAgIGlmIChJU19FUlIoaW4wKSkgew0KPiA+ICsgICAgICAgICAgICAgICBwcl9lcnIoIiVwT0ZQ
OiBmYWlsZWQgdG8gZ2V0IGJhc2UgZml4ZWQtcmF0ZSBvc2NpbGxhdG9yXG4iLCBucCk7DQo+ID4g
KyAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiArICAgICAgIH0NCj4gPiArICAgICAgIGtjbC0+
cGFyZW50c1tLMjEwX1BBUkVOVF9JTjBdID0gX19jbGtfZ2V0X2h3KGluMCk7DQo+IA0KPiBUaGlz
IHNob3VsZG4ndCBiZSBuZWNlc3NhcnkuIFNwZWNpZnkgdGhlIERUIG5vZGUgaW5kZXggaW4gdGhl
DQo+IHBhcmVudF9kYXRhIHN0cnVjdHVyZSBpbnN0ZWFkLg0KDQpPSy4gSSB1bmRlcnN0b29kIHdo
YXQgeW91IG1lYW4gaGVyZS4gSG93ZXZlciwgSU4wIGlzIG5vdCBjcmVhdGVkIGJ5IHRoaXMNCmRy
aXZlci4gSXQgaGFzIGl0cyBvd24gZml4ZWQtb3NjaWxsYXRvciBEVCBub2RlIHRoYXQgY3JlYXRl
cyB0aGUgY2xvY2suIFNvIGENCmRpZmZlcmVudCBwcm92aWRlci4gSGVuY2UgSSB0aGluayB3ZSBj
YW5ub3QgdXNlIGFuIGluZGV4IGludG8gY2xrX2RhdGEtPmh3cywNCnVubGVzcyBJIGFtIG5vdCB1
bmRlcnN0YW5kaW5nIHNvbWV0aGluZy4NCg0KDQotLSANCkRhbWllbiBMZSBNb2FsDQpXZXN0ZXJu
IERpZ2l0YWwNCg==
