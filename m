Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056D8C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 01:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A323F23435
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jan 2021 01:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbhANBZO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jan 2021 20:25:14 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:13149 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbhANBXx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 20:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1610587433; x=1642123433;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=X/gOe/+YPW5lyixuNHqtIgojt5zQjRLP/xpl+w2o9zI=;
  b=R4soTKrEWlbD44ScZaS3rOpjunNC/Y08mh5JIpKuAfvnlCiaPc0lYnDO
   k0uog5cpb2pnogQcWzBLy2nyusVtMdQclLep2b3FmB3cVGIc/nMWOi7fo
   9XM8p/D+yTjhrk22el8JeAP/9XGCCSc/mC845fpz6ca2gmVugRcYjWXWF
   PJ7ryEhh8YjM79cT8ZrBXCA3LAiHPrE92C9skh3iEJ3HSQBGxTCsN8B6N
   oUYSD5GIGYbjZlYOaW9IisSsZ8lhRJW4bc2Xj8YPF8j+j6yrEYPtKJKDt
   3TlId923n9Fwl0MZIiWtXpaQ/t9PRfv6ZstNHJgeWXOWXFb9j9c+HZH8a
   w==;
IronPort-SDR: +1sdnEJ/Kask6j4ftezvwQjVfczT9EuhCYu5RTtY62GdCbwX2SXD8mg14DHqlVH9i/Qnbxb03H
 zWBw/y/PPjiW4Bo1vRxmf0tD4zIsBY4QVx5sSCPJaT7LVnGHdW+tB41Iw7nhvIcBJR3mGsPhe0
 CiNO1PxlrmcB8T3iYZv9y2dTUFnAr4//T6aCO995vU1pBBqYgrbUTlBErfBo0cCnYAFHYvgoBz
 PeR9Sim/gsmqKECQBQeBekGgcVhLH9+Tmiv6FfyqI9f0KFBGsELFmtl37my12x0DF4empisJna
 WZI=
X-IronPort-AV: E=Sophos;i="5.79,345,1602518400"; 
   d="scan'208";a="267686645"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
  by ob1.hgst.iphmx.com with ESMTP; 14 Jan 2021 09:19:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZF2a1Hi8Mw6mMPGGeVdIE3EPWInjBD39wxlZAAb8hcFutp0f1iAr7zDB1zbQ1WX21YHHFw5s7UZEecPEoTqgN+fOHEjqLkj2gLEePM4qyUBE4xITYq+pf9lziz5hV4uhppO27LRtCRjVJiwAb1qVZ57mO2R/LTSt3bo2ebyi8syV+e2Wt03eAeDZRQ5N6V9XRCYqF6Za/+nos3Fn7wqy/DcIuLt17k/BEIVcTrs8HR5Z9X5ChDRyKE2joO3jgtfKWqMHXlT6be4wCgWkhYUOHdKM16BqGvc9ruaGyDVUUEwWwgV2KZYLQm+L7UwKgvXhNGep0nkDIlWLK0P7xnwa6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/gOe/+YPW5lyixuNHqtIgojt5zQjRLP/xpl+w2o9zI=;
 b=VtUbOy2MheiiN3hDSBV1gK4TdtU9lB6CimoD8Kyfznwm+Z7LWVA9ABV24YtE910PNyXmu7V3FcL1QJaEik2iai7yum+8VqNqzPYCzwbqTZEpfsjrw/6dzwTSGB5A2vPirGSLiARilx0h1LURm6vbsHRoNG//BdQYyofUsJuh/SAckN90P4hUOS4/UevaOM3YQMC4ka1QmCsddgNI/ku63n3V5ii9xE579sjmlgfrIl9cMM4uAMdKszS9NY02Vcj0osAVR3xujfGta8PCEtsbmIOAAn92K6cR9aLRncW0M+spnHZ6yttrsVyWSTaSKPaOl8ZeZwlN9P4N/DHM+A7Vwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/gOe/+YPW5lyixuNHqtIgojt5zQjRLP/xpl+w2o9zI=;
 b=AYD357aqxgl5BJQPjGhDPr6t3GrtHKbxdBm9knxbMiMiOSPVGjn6aQA7XZjNNRyGU+aZHALgy9jlviSz4b6e+Mf0+6haMU6fuI6P8yxLJCm5Pcd+WE4RmKbD8wZNrEYei9CYciSF234U8Xo9nXsutoN/d5WYwtP3MJ6G7sm1UDs=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6554.namprd04.prod.outlook.com (2603:10b6:610:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 01:19:36 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%8]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 01:19:36 +0000
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
Thread-Index: AQHW6H6jBxZahSfnlkqtd1vCx2d056olOk4AgAEbWIA=
Date:   Thu, 14 Jan 2021 01:19:36 +0000
Message-ID: <3ddfa635647cd6c0a012324d59ca90bae297f2be.camel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 32f4489d-5ca9-40d7-77bb-08d8b82a753a
x-ms-traffictypediagnostic: CH2PR04MB6554:
x-microsoft-antispam-prvs: <CH2PR04MB65546A64D206F2689405183BE7A80@CH2PR04MB6554.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rggd8SYXYLvXBpmSretDFfaWRIQULqf4arjyA8+JNxLiG5vBnKPDdh9f0e2Eac04XLV3zwfn/fALMctGb07bI9pWIsI6UXTFrgbW0pMyeesK0N+tLxb44eFxYjtdujReP+Jgr+uF7zkvyWj/7UQDI2jRz2GiQe00QTqYuduTN1nWGp2hgdaxDJBBnOkbgi2ompl46emqdgePVFe+hDQNsT4LtWLrgM0nvzeGfBisnR+8Dv0azRkMxiVnuMRGIamSb9g7Q+YH7z+p6T5nCLke37nizByvEGvgRWzrzs5x+BTMorVJa/QTykC37mK9RMCbAaa4M4LtiQzg60oqyEWdOSL0l2YhdaV/JXVBj1yDGvwU4XSLWWCXiQRb3HQOtFXEUoDVpmkqNrpJw4f7oE3rXw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6522.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(186003)(4326008)(36756003)(6506007)(66476007)(86362001)(2906002)(64756008)(110136005)(316002)(83380400001)(66446008)(478600001)(2616005)(8676002)(91956017)(5660300002)(66946007)(76116006)(66556008)(6512007)(8936002)(71200400001)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NHpWMS8vTWYvWEc0TVdvYnRKWFY1dEg1MHpJMTQxM1REMlhlUk9tSFllOXFi?=
 =?utf-8?B?bzdwSWowTVVwWFJyMWE4cEYwNWxZaVozK1RCT2J0VXlrNy9meXJLRUx0YmNS?=
 =?utf-8?B?bXUzNVlNam1HSXRRL0VKSlZPUXNpT0JOd2QxcTRmaG5PaWh0UlpoNy9IVUJq?=
 =?utf-8?B?QUtWaU9zRWw5OURXZWNTTTZ6UTRRN2VzbHhLTU9OTDVKSXVOUHZFUXMxY2w5?=
 =?utf-8?B?OXpxOGllSW9oS1I4b3VPS2hacU9VK09ZcU0wNWRFdE5kOCtRc3ZFUktRQlY2?=
 =?utf-8?B?dEhvTXROWmdsK1h1WFVWSFJyYTlHM0JCS2lLMURtcE9VMEVxeVNrZGlML2ln?=
 =?utf-8?B?NmFJdUlPeWNvTkNNWFAwZk9WMnlXcndYOWw5RzVleVhzSlp1YTV0QktlMnlq?=
 =?utf-8?B?OC9MMk1GVm8yV09YWXljdnRienFQOTUxdU1pYnhRZm1oZzBBVkZJTmxMYTQ0?=
 =?utf-8?B?NmE2NXRDdmFTS2hEUkRxZzZyLzJKM3V6dS9NcVAxZlBOUHYzQXcvemN0OUxU?=
 =?utf-8?B?YlUrMitQSXJCWVNmeDBCQnBSOFkrQ3BhSWtkeU1yQlQrZFc1MmNNQThBakt0?=
 =?utf-8?B?Q2k5Wk1DT054akVnUHNPQlZQWGRKVkNHNjVlT2VmZEwyMVo1V3R0M3EyMUo2?=
 =?utf-8?B?ZnF0L2FUb2l2Nm5OUFIxT2VQRWRMalhLUWRYdis5Q0l5TlFjSFJVTW5KVmNp?=
 =?utf-8?B?Ym1lOUw1bndDV0lPaTVxZGJjeDBnTzNWQm5mT0hOS0dxczF0ZmY2SEhHaThz?=
 =?utf-8?B?UzFQeEhBMVczK2tTUEVhZTZVUC9RdDdrRVJnUWgzUDNDRG1QZTlFNFg4Mk1H?=
 =?utf-8?B?Y2I0Q0xwQmFJMlFnNmJTci9ycmZQUHpIUFdUZVNYaFJXZEZJVm9JUTVlVTY2?=
 =?utf-8?B?R2tnekk2S25TazRjS2EzVFU2VmIzMWRNU1BTenY5YTR3YjNXenEzdWFrRk1l?=
 =?utf-8?B?ZjJuTEp5c2NZRFV2ZXY4TEkxMHkzL3R6RTZYR0VxNjNTejg5UmhkMEo3Z2Nt?=
 =?utf-8?B?NnFBRC9YdmhFT1MyNmkweGxHZHJjYWliaitEakZsRGs4bDU2VDJWK083Nksx?=
 =?utf-8?B?bnFNUzU5M1M4Uk9NbC9EQ2p3SExMem9WTVV1NkpWZFRDYnE4NHR1ajY5RFdQ?=
 =?utf-8?B?MldIcE9TUHVKUFlZYXowTVpGR2x2WXJUT1hWSEJlYXBzK2NHd3pyL0hOS0xH?=
 =?utf-8?B?YXZqcDFoZEJpMHBRNmhEWFgxdlIvdjBhdWJGd3hpVWxRK3hhSEhiclZ2dzBL?=
 =?utf-8?B?eVd3LzVOak9LVmsvNHlFLy9BSFVnYXE3OWhERlZuZmxQWEhrTm5Jd3kyRTda?=
 =?utf-8?B?a3VZcXNiVmlzbVNSSGZPQm5ucnpTbmFkQndlN3BRUEVxOXUrYWZGdTZDWjhG?=
 =?utf-8?B?Y2h0VElvdXd5RjBIZ21mdHZnZGQ4Z0s0RTNOTW5WNitSNzkyNWZscTlScUcw?=
 =?utf-8?Q?AJ00Li5R?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <29C0F255FBDB984EA5053080A52E00D5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f4489d-5ca9-40d7-77bb-08d8b82a753a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 01:19:36.7151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3EUxZji49deodP/Cio6lN9DROqF/HEGyvn2LJtZTP/O7jAHW7kU0gzuLfd3COp6WyMPaaanJVOWAIQMDHmP0yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6554
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
L2Nsay9jbGstazIxMC5jDQoNClsuLi5dDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3QgazIxMF9j
bGsgLSBEcml2ZXIgZGF0YQ0KPiA+ICsgKiBAcmVnczogc3lzdGVtIGNvbnRyb2xsZXIgcmVnaXN0
ZXJzIHN0YXJ0IGFkZHJlc3MNCj4gPiArICogQGNsa19sb2NrOiBjbG9jayBzZXR0aW5nIHNwaW5s
b2NrDQo+ID4gKyAqIEBwbGxzOiBTb0MgUExMcyBkZXNjcmlwdG9ycw0KPiA+ICsgKiBAYWNsazog
QUNMSyBjbG9jaw0KPiA+ICsgKiBAY2xrczogQWxsIG90aGVyIGNsb2Nrcw0KPiA+ICsgKiBAcGFy
ZW50czogYXJyYXkgb2YgcG9pbnRlcnMgdG8gY2xvY2tzIHVzZWQgYXMgcGFyZW50cyBmb3IgbXV4
ZWQgY2xvY2tzLg0KPiA+ICsgKiBAY2xrX2RhdGE6IGNsb2NrIHNwZWNpZmllciB0cmFuc2xhdGlv
biBmb3IgYWxsIGNsb2Nrcw0KPiA+ICsgKi8NCj4gPiArc3RydWN0IGsyMTBfY2xrIHsNCj4gPiAr
ICAgICAgIHZvaWQgX19pb21lbSAgICAgICAgICAgICAgICAgICAgKnJlZ3M7DQo+ID4gKyAgICAg
ICBzcGlubG9ja190ICAgICAgICAgICAgICAgICAgICAgIGNsa19sb2NrOw0KPiA+ICsgICAgICAg
c3RydWN0IGsyMTBfcGxsICAgICAgICAgICAgICAgICBwbGxzW0syMTBfUExMX05VTV07DQo+ID4g
KyAgICAgICBzdHJ1Y3QgY2xrX2h3ICAgICAgICAgICAgICAgICAgIGFjbGs7DQo+ID4gKyAgICAg
ICBzdHJ1Y3QgY2xrX2h3ICAgICAgICAgICAgICAgICAgIGNsa3NbSzIxMF9OVU1fQ0xLU107DQo+
ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgY2xrX2h3ICAgICAgICAgICAgICpwYXJlbnRzW0syMTBf
UEFSRU5UX05VTV9DTEtTXTsNCj4gPiArICAgICAgIHN0cnVjdCBjbGtfaHdfb25lY2VsbF9kYXRh
ICAgICAgKmNsa19kYXRhOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIHN0cnVjdCBrMjEw
X2NsayAqa2NsOw0KPiANCj4gUGxlYXNlIHJlbW92ZSB0aGlzIGFuZCBnZXQgdG8gaXQgZnJvbSB0
aGUgY2xrIGh3IHN0cnVjdHVyZS4NCg0KSSBhbSBzdHJ1Z2dsaW5nIHdpdGggdGhpcyBvbmU6IEkg
ZG8gbm90IHNlZSBob3cgdG8gZ2V0IGl0IGZyb20gY2xrX2h3IHN0cnVjdA0Kc2luY2UgdGhlcmUg
aXMgbm8gInByaXZhdGUiIHBvaW50ZXIgSSBjYW4gdXNlIGFuZCBJIGRvIG5vdCBzZWUgaG93DQpj
b250YWluZXJfb2YoKSBjYW4gYmUgdXNlZCB3aXRoIGl0LiBTdXBwcmVzc2luZyB0aGlzIHZhcmlh
YmxlIHdvdWxkIGFsc28gZm9yY2UNCnBhc3NpbmcgYWxvbmcgdGhlIGRyaXZlciBkYXRhIHBvaW50
ZXIgdG8gbW9zdCBmdW5jdGlvbnMuIFRoYXQgY29tcGxpY2F0ZXMgdGhlDQpjb2RlIGEgbGl0dGxl
LiBTaW5jZSB0aGVyZSBjYW4gb25seSBiZSBhIHNpbmdsZSBpbnN0YW5jZSBvZiB0aGlzIGRyaXZl
ciwgaXNuJ3QNCml0IHNpbXBsZXIgdG8ga2VlcCB0aGlzIGFzIGlzID8NCg0KSSBhZGRyZXNzZWQg
YWxsIG90aGVyIGNvbW1lbnRzIHlvdSBzZW50IGFuZCB3aWxsIHJlc2VuZCBhIHYxMiBzb29uLiBU
aGFua3MgIQ0KDQoNCi0tIA0KRGFtaWVuIExlIE1vYWwNCldlc3Rlcm4gRGlnaXRhbA0K
