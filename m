Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510E8C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Feb 2022 12:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbiBPMHL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Feb 2022 07:07:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiBPMHK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Feb 2022 07:07:10 -0500
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30082.outbound.protection.outlook.com [40.107.3.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF274B2503;
        Wed, 16 Feb 2022 04:06:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpPDixGe6fDn3K16wxZM1R6ZHic6oWbe3QclkPDBQ5Y122FxHBzj1JhaWoB/rJRn0aPm4xshe1f1tnNm3wWgV/pFvXpDlRViejkbx/wfOFfOGyA/UEwlLTwwBvURbN2sL8AVBxlg9ZVMdxzilQbUPyT5uPrGL0GESvS7ynsLqm3k3HJxT4zjBLl2W85wRkFwanipWw77f+SVrI8lM6eq+ntAHpa7RQTtGjS4lDm4swkH6sMnqaZXWj+ULmETcv59sg2uBQmhZiccJiTaD75apqckSgri+H/6HQXSpyO0YJG5HT3RVaMOJrLBYpu0Cb+MaabPQupzTNo7ZoCcPJ07PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5LpF3Rq6ioRxLYNxbg/ohu346OUeydbrBtLgrjydnQ=;
 b=B/PVhWMRPb4Pn7IdNPl9sT7N9Gk08S3wOBWha9wnfhHPZXCNURhoEio8IykITHC4wcipcS4ddneoQS7AqhUcq1hWj0ZInLz7ayIHs/N3F+ckZdZuSIu/phipEgIl9BcMHX7MN0io7/kpCZH3mY8jmavS9LC221kUcglVCFSW9785XPBsBKyLZ9cMoUhStiJoJsUgUQdmd3H+H+Rdu99e8HPFGLDzwSuvxIHp/ePsu7PHhr+esGy7a13Y93eDziI/ur7VLWQWZ62w5Qucy9PAKgutmPERFQDrgXp+uCfnFMowGlga7tXIJq3G78kgJQ6aPLA8xK6lcH3/8IE3IWTvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5LpF3Rq6ioRxLYNxbg/ohu346OUeydbrBtLgrjydnQ=;
 b=TPliqyZ1whWRFrikvKhGW7cfzctdz1A+pX5QlwpWeGMpsNYL7UuZL42NJWKEhRT7IX5E6YTLRF4gJVjZ/pclQFdq/gtzDUECYZs1WBWc3JRgnCpGplL0WK2EdISDHiDDLuyQPlhQMkGXioDagWSYPISF8jySZGB3dswS2CGPvK8=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 AM6PR03MB5186.eurprd03.prod.outlook.com (2603:10a6:20b:d2::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.19; Wed, 16 Feb 2022 12:06:53 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::fd01:86fc:2baf:1ac4]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::fd01:86fc:2baf:1ac4%6]) with mapi id 15.20.4975.012; Wed, 16 Feb 2022
 12:06:53 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@rohmsemiconductoreurope.onmicrosoft.com>
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Thread-Topic: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Thread-Index: AQHYIkhGCT5rPypv+k+qpqelhm/DqKyWFsmA
Date:   Wed, 16 Feb 2022 12:06:53 +0000
Message-ID: <c1fce212-4d9e-06fe-e3fe-6d0f2ab29489@fi.rohmeurope.com>
References: <20220215084412.8090-1-marex@denx.de>
 <20220215084412.8090-2-marex@denx.de>
In-Reply-To: <20220215084412.8090-2-marex@denx.de>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bee6348a-5e4e-4d81-617d-08d9f144d21d
x-ms-traffictypediagnostic: AM6PR03MB5186:EE_
x-microsoft-antispam-prvs: <AM6PR03MB51864D57ACA8EBDA4A7F0CA0AD359@AM6PR03MB5186.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RHC3DyKeaIs1gGY9To18ztJtX9ZuKmecWzivtFXxgQYJe+1sO+vaNgXWj9H/UDusC4Yv7J+6h7X+WItc/wq45abl9R0705fMbOqMdxDo3260d3kUgnkbbSKc9xVN0Z/xUfX6nqMxuIdKX4STDHvmn9CoeXiRtGCUWSMMSiCD3Nl0kgxdikSzKGtEQsAPM+TYjk8gT43Z8BbQAhRdvFPHroXvNyl1BrM2QdBfLCfIxRPxzL1SlncTIqCROSm3dMluUwkNGxkY4M7mPeSfrnO8MVSSHXq2yx0eD2gSZGURCJFI8FsDm0Y8bsRNZx2OL8LcQsMqVhqjJr2lvdZFdI80GCV4XlS0oQYfYCDcpJRxVCPdRWkDmblqpuM4kokxG7bnOPr4aa9Jfp9+DoTfYrfN1JYuP+4IB3EJJetEr0l2x3mlzgo0rjmMtkO0T6qEasSb+JsX4sq3i2dqlAkQ0hLiaBZqkdDj89OhdcI+/9OV8zX1bGswLnBI+iISYuUufO+QdGHmPVBeDIlVpos++MNGa7z49f4Nek/fxLtFZD5HNbtMdWAMp7sdlHpgzg+kx4ge5wlS15Dn1aiKDLl157Crc4Ur3itKkLgeWCYPRb7+7ZY43U3hEBlxOlB+Yrvu2RY5R7SVz1ZRjbppbXE0Nis8hiN5lwY5iRjabKSStWy+6cwKGcptoPrDViP5i3rS59gdkLKFyKSlzMahbLXM+08F+y2psYGEyf3PivJI024b5Arh6ttaYZKSY/8QDrSETrTqmBbEWT9kfn+IX+lD64nhmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(107886003)(83380400001)(31686004)(2906002)(122000001)(38100700002)(2616005)(26005)(5660300002)(186003)(66476007)(76116006)(66946007)(316002)(508600001)(71200400001)(8936002)(8676002)(53546011)(38070700005)(6506007)(6486002)(64756008)(66446008)(86362001)(31696002)(91956017)(110136005)(4326008)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkJTY2dNUHJXczhobjljYm8yZlZXU1lETmk2YURBSTBDNkl5alVGSk1jOFYv?=
 =?utf-8?B?K2xTYnZDeHJCWWROVUxUdXRvaGVITkRkN1JYTGRhQlVvNmFzNXFCaEJXKzRx?=
 =?utf-8?B?Y0dpcDN0SzNLU0tiQXk0dEpOWjNZbyswdVFlazRUS1ZuODV3RzhQcVFxMGIy?=
 =?utf-8?B?YzcxMU5nc3hjcEZVSDFRME0wQ0RyaHU5NEtXakJja01BbW5Cd0lyU3VVWHpP?=
 =?utf-8?B?L252R0NBaXIzUGRuU0IzMEdob0Y5REJ3MjNxTlZFYVZNanVOWUlWZW04Q0Vk?=
 =?utf-8?B?R1pYUVpOaThjazZIZTdmNFhOM3VzcFAwM3NsVFVyTWRnaW5VdXdKYjhSTzZX?=
 =?utf-8?B?NGVEd2RiL1p6M05UMTVBUVFWT1gzY0xtdTFna1B0a1JBVWZzaEtkeUdFcXZT?=
 =?utf-8?B?ZzhOY05rSjFxb2dVVTRlclpnYklkc2s4dlpuY0xNVEhIK1JVdXR1QnVMckY0?=
 =?utf-8?B?SlVYUnJBdVFkY21OWGl6M29mNnIrc1dna2dhcmJLNk5idXd3UHpEWHltRHJL?=
 =?utf-8?B?ZmxRQ09BdE5WVmdBQjJJVzZGMi8vZzdpeWQ5cFJEL0V2QmI4RjFBazEwdnFI?=
 =?utf-8?B?ZUNtWUFLMURwWG10M0U3SytUM2NBbmFRS1FTZTg0dWFQTjNkZER3blQ3YXlX?=
 =?utf-8?B?WXlqNFlwRTM3RTA3SmNJc0pwMTdmbURkd0hscjN5dXg0cDZyVXYxOFFpM25y?=
 =?utf-8?B?OEJ3YlpGeUtrams1VnFLNStNVHhjdWt5eHNwUU9CM0pBRmI5ZEw4NEY5VVVT?=
 =?utf-8?B?UTA4TXRhcnQxZ2JOUDU4eFFzaGV2VVRaVm8wb2xmUHpMZlFsWmJXSytDOWd2?=
 =?utf-8?B?Nzlna3JSOUowN0FVUDJ6L1pMSmpQZm0wUnN4MHEwa3cxejJFcjI2eVBRV295?=
 =?utf-8?B?aENsKzdqQ1dGNDFCamNOQ0RRbGtqWnU0VjZJR29hZnVpemhoRWptM1V3UGVo?=
 =?utf-8?B?S0RHWWlxdEkrRnFvT2ZreWtxSkkyT2syZjg3NVpNNk1yRVNMWEorNDNtOWRv?=
 =?utf-8?B?emE0QXBITUVLZW1vWmt2cVUwemNsaEJNWG1va25DWnZaUW5aYlQvdjJtQmxp?=
 =?utf-8?B?TW1pMXhCdTZCWE4wd1Vtc1JYeDJZc1dJMXlDQzdDS04vRXBmckpDOU5lak9J?=
 =?utf-8?B?cmhFQzNHSzRwWDZ1azk1OXBwYS9rY1pFM1BnK291eFFVT3dqRFppN1NuaGti?=
 =?utf-8?B?NEZ2L2FORmZRVXVwS293Zy9yQk5zNE5ic3V1cktLR0c4NlhaSjRZK094RHVq?=
 =?utf-8?B?M3VIT3lEY3hIWGl1V0lQMGR0azZqaGhTSEQva1Y3SmhLMmprZU9mdENXeFAr?=
 =?utf-8?B?OTM3ZityNktQNHdxaytxSlFQeWFGVTZiSDJjU1NteHE0M2RLWjZXdkdSRnJT?=
 =?utf-8?B?MCtvMEoyaWpmbWtKOHRDSjg4UEdidWFrdlAxNE1wNUVKZmFOdDlTRmIvL0lO?=
 =?utf-8?B?NXByUy9KcDRseVZOcmxPOWx1MlhNZ3A1S0hlQnRPeThVMU4zZFB1ODdYcG9s?=
 =?utf-8?B?YnlneFpuNHlIYy9aTnZpNHRKUW50TFZMaEZsemljRmtqTzVzZldPUU42MTRa?=
 =?utf-8?B?VlU5RFdrL3JFVlV0VnphdkNTZ012Y3FrY0lBSFNDdkdFZEVCNmJuNmtsamNN?=
 =?utf-8?B?cDEyaGRyRU04Uy9RWk10NXROK2Mxa25xZ2FXYUlwb2JwbUFESmJPbkpEelBT?=
 =?utf-8?B?RTgzcjhheldEOUs1TThVc3NUby9VUC9jaGRqYjV0dFBWMjlnZklSUzhGc0Jn?=
 =?utf-8?B?MktGY2ZOcHNQQlk5NzJpZ3NkSVp0U056QUI5V3M5Y1ZpOXJoWW4rb2VMaXVs?=
 =?utf-8?B?TVl5N2M5UzVGUGFhUytHL3hZbVBkNzRtUzJKNG01NXJlbVo1WkZMNHhTaXZ6?=
 =?utf-8?B?Q0Jqby94d05BMGdYNHhwZmRTRDJtVkl5WU0vRkZVZHduRmc4em1Lc1JSNGlp?=
 =?utf-8?B?V3h4WitOVDdPNGsrQitHMFpSVlR5WjJJbk5mMTdEWVpMNDV3UXRQR2I2ZFZv?=
 =?utf-8?B?OWxhOEZpOWZubVMzMTVzdlUvSm5vVmZzdjRZZVBvVTBEU2JaclYvLzdseW43?=
 =?utf-8?B?dnlGS1RicUpZb0tZbC9YdGxJQStrek81Q3RWWXZBNmNNQnQxMFk5dnVhRitI?=
 =?utf-8?B?VnVBMEVCUXJnSldsVERHdkxKb2tZVXFRS2F1K0FvTEV1Z3IycCtQZ1lDa2VI?=
 =?utf-8?B?SGZwU2FYZXRoR0o3OUlmZDVETnVSVGp1WVl2UjU1WG1wd1NDN0U3UDZiczk4?=
 =?utf-8?B?UWVhR2FpYUs3WjRITU1VSHVpWnE3TTdwWHZqbjZDaktvL1pVWUlZbkFtT2NE?=
 =?utf-8?Q?DCMxp+C+uXsODf5mFm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE7C2A1A35453B41848F879CDB6331E5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee6348a-5e4e-4d81-617d-08d9f144d21d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 12:06:53.2971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RCkrGBI3V3zp7ZvyYTR1xgtpVSlHOWCWc7CIa/OdWHWG8I5nLHjO1UAfvLaMA0Bj8KLn0WR6zLDBtcRW7shw8LZgZycyua/8EuAVpH6n4q2jDmM8RizKVxNIOWjL6Fkg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5186
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SGkgZGVlZSBIbyBNYXJlaywNCg0KTG9uZyB0aW1lIG5vIGNoYXR0ZXIgOi8gTmljZSB0byBoZWFy
IGZyb20geW91IG5vdyENCg0KT24gMi8xNS8yMiAxMDo0NCwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+
IFNvbWUgcGxhdGZvcm1zIHJlcXVpcmUgY2xvY2sgdG8gYmUgYWx3YXlzIHJ1bm5pbmcsIGUuZy4g
YmVjYXVzZSB0aG9zZSBjbG9jaw0KPiBzdXBwbHkgZGV2aWNlcyB3aGljaCBhcmUgbm90IG90aGVy
d2lzZSBhdHRhY2hlZCB0byB0aGUgc3lzdGVtLiBPbmUgZXhhbXBsZQ0KPiBpcyBhIHN5c3RlbSB3
aGVyZSB0aGUgU29DIHNlcnZlcyBhcyBhIGNyeXN0YWwgb3NjaWxsYXRvciByZXBsYWNlbWVudCBm
b3IgYQ0KPiBwcm9ncmFtbWFibGUgbG9naWMgZGV2aWNlLiBUaGUgY3JpdGljYWwtY2xvY2sgcHJv
cGVydHkgb2YgYSBjbG9jayBjb250cm9sbGVyDQo+IGFsbG93cyBsaXN0aW5nIGNsb2NrIHdoaWNo
IG11c3QgbmV2ZXIgYmUgdHVybmVkIG9mZi4NCj4gDQo+IFRoZSBpbXBsZW1lbnRhdGlvbiBoZXJl
IGlzIHNpbWlsYXIgdG8gInByb3RlY3RlZC1jbG9jayIsIGV4Y2VwdCBwcm90ZWN0ZWQNCj4gY2xv
Y2sgcHJvcGVydHkgaXMgY3VycmVudGx5IGRyaXZlciBzcGVjaWZpYy4gVGhpcyBwYXRjaCBhdHRl
bXB0cyB0byBtYWtlDQo+IGEgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBvZiAiY3JpdGljYWwtY2xv
Y2siIGluc3RlYWQuDQo+IA0KPiBVbmxpa2UgImFzc2lnbmVkLWNsb2NrcyIsIHRoZSAiY3JpdGlj
YWwtY2xvY2siIG11c3QgYmUgcGFyc2VkIG11Y2ggZWFybGllcg0KPiBpbiBfX2Nsa19yZWdpc3Rl
cigpIHRvIGFzc2lnbiBDTEtfSVNfQ1JJVElDQUwgZmxhZyB0byBjbGtfaW5pdF9kYXRhIC5mbGFn
cw0KPiBmaWVsZC4gVGhlIHBhcnNpbmcgY29kZSBvYnZpb3VzbHkgbmVlZCB0byBiZSBjbGVhbmVk
IHVwIGFuZCBmYWN0b3Igb3V0IGludG8NCj4gc2VwYXJhdGUgZnVuY3Rpb24uDQo+IA0KPiBUaGUg
bmV3IG1hdGNoX2Nsa3NwZWMoKSBjYWxsYmFjayBpcyB1c2VkIHRvIGRldGVybWluZSB3aGV0aGVy
IHN0cnVjdCBjbGtfaHcNCj4gdGhhdCBpcyBjdXJyZW50bHkgYmVpbmcgcmVnaXN0ZXJlZCBtYXRj
aGVzIHRoZSBjbG9jayBzcGVjaWZpZXIgaW4gdGhlIERUDQo+ICJjcml0aWNhbC1jbG9jayIgcHJv
cGVydHksIGFuZCBpZiBzbywgdGhlbiB0aGUgQ0xLX0lTX0NSSVRJQ0FMIGlzIGFkZGVkIHRvDQo+
IHRoZXNlIG5ld2x5IHJlZ2lzdGVyZWQgY2xvY2suIFRoaXMgY2FsbGJhY2sgaXMgY3VycmVudGx5
IGRyaXZlciBzcGVjaWZpYywNCj4gYWx0aG91Z2ggSSBzdXNwZWN0IGEgY29tbW9uIGFuZC9vciBn
ZW5lcmljIHZlcnNpb24gb2YgdGhlIGNhbGxiYWNrIGNvdWxkDQo+IGJlIGFkZGVkLiBBbHNvLCB0
aGlzIG5ldyBjYWxsYmFjayBjb3VsZCBwb3NzaWJseSBiZSB1c2VkIHRvIHJlcGxhY2UgKCpnZXQp
DQo+IGFyZ3VtZW50IG9mIG9mX2Nsa19hZGRfaHdfcHJvdmlkZXIoKSBsYXRlciBvbiB0b28uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gQ2M6IE1h
dHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiBDYzog
TWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPg0KPiBDYzogUm9iIEhl
cnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2Vy
bmVsLm9yZz4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBsaW51eC1w
b3dlckBmaS5yb2htZXVyb3BlLmNvbQ0KPiBUbzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZw0K
PiAtLS0NCj4gICBkcml2ZXJzL2Nsay9jbGsuYyAgICAgICAgICAgIHwgNDEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgaW5jbHVkZS9saW51eC9jbGstcHJvdmlkZXIu
aCB8ICAzICsrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay5jIGIvZHJpdmVycy9jbGsvY2xrLmMNCj4gaW5k
ZXggOGRlNmEyMjQ5OGU3MC4uMWUxNjg2ZmE3NmUwMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9j
bGsvY2xrLmMNCj4gKysrIGIvZHJpdmVycy9jbGsvY2xrLmMNCj4gQEAgLTM4NzIsNiArMzg3Miw0
NSBAQCBzdGF0aWMgdm9pZCBjbGtfY29yZV9mcmVlX3BhcmVudF9tYXAoc3RydWN0IGNsa19jb3Jl
ICpjb3JlKQ0KPiAgIAlrZnJlZShjb3JlLT5wYXJlbnRzKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0
aWMgdm9pZA0KPiArX19jbGtfcmVnaXN0ZXJfY3JpdGljYWxfY2xvY2soc3RydWN0IGRldmljZV9u
b2RlICpucCwgc3RydWN0IGNsa19jb3JlICpjb3JlLA0KPiArCQkJICAgICAgc3RydWN0IGNsa19o
dyAqaHcpDQo+ICt7DQo+ICsJc3RydWN0IG9mX3BoYW5kbGVfYXJncyBjbGtzcGVjOw0KPiArCXUz
MiBjbGtzaXplLCBjbGt0b3RhbDsNCj4gKwlpbnQgcmV0LCBpLCBpbmRleDsNCj4gKw0KPiArCWlm
ICghbnApDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWlmICghY29yZS0+b3BzLT5tYXRjaF9jbGtz
cGVjKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobnAs
ICIjY2xvY2stY2VsbHMiLCAmY2xrc2l6ZSkpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCS8qIENs
b2NrIG5vZGUgd2l0aCAjY2xvY2stY2VsbHMgPSA8MD4gdXNlcyBjcml0aWNhbC1jbG9ja3M7ICov
DQo+ICsJaWYgKGNsa3NpemUgPT0gMCkgew0KPiArCQlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29s
KG5wLCAiY3JpdGljYWwtY2xvY2tzIikgJiYNCj4gKwkJICAgICFjb3JlLT5vcHMtPm1hdGNoX2Ns
a3NwZWMoaHcsICZjbGtzcGVjKSkNCg0KSSB0aGluayB0aGlzIGlzIG5ldmVyIHRydWUgYXMgdGhl
cmUgaXMNCmlmICghY29yZS0+b3BzLT5tYXRjaF9jbGtzcGVjKQ0KCXJldHVybjsNCg0KYWJvdmUu
DQoNCkFueXdheXMsIHNlZWluZyB5b3UgYWRkZWQgYSBkdW1teSBiZDcxODM3X21hdGNoX2Nsa3Nw
ZWMgaW4gYSBmb2xsb3ctdXAgDQpwYXRjaCBmb3IgQkQ3MTgzNyAtIHdoaWNoIGhhcyBvbmx5IHNp
bmdsZSBjbG9jayAtIEkgd29uZGVyIGlmIHRoZXJlIGlzIGEgDQp3YXkgdG8gb21pdCB0aGF0IGR1
bW15IGNhbGxiYWNrIGluIGNvbnRyb2xsZXJzIHdoaWNoIHJlYWxseSBwcm92aWRlIG9ubHkgDQpv
bmUgY2xvY2s/IEVnLCBkbyB5b3UgdGhpbmsgc3VjaCBhIHNpdHVhdGlvbiBjb3VsZCBiZSBkZXRl
Y3RlZCBieSB0aGUgDQpjb3JlIGFscmVhZHkgaGVyZT8gUGxlYXNlIGp1c3QgZ28gb24gaWYgdGhh
dCBpcyBoYXJkIC0gSSB3YXMganVzdCANCnRoaW5raW5nIHRoYXQgbWF5YmUgd2UgY291bGQgYXZv
aWQgc3VjaCBkdW1taWVzIC0gb3IgYXQgbGVhc3QgcHJvdmlkZSANCm9uZSBzaW5nbGUgZHVtbXkg
aGVscGVyIGZvciB0aGF0IHB1cnBvc2UgaW5zdGVhZCBvZiBhZGRpbmcgb25lIGluIGFsbCANCnNp
bWlsYXIgZHJpdmVycy4gSG93IGRvIHlvdSB0aGluaz8NCg0KT3RoZXIgdGhhbiB0aGlzIC0gSSBz
dGlsbCBkbyBsaWtlIHRoaXMgaWRlYSEgVGhhbmtzIGZvciB3b3JraW5nIHRvIA0KaW1wbGVtZW50
IHRoaXMhDQoNCg0KQmVzdCBSZWdhcmRzDQoJLS0gTWF0dGkNCg0KLS0gDQpUaGUgTGludXggS2Vy
bmVsIGd1eSBhdCBST0hNIFNlbWljb25kdWN0b3JzDQoNCk1hdHRpIFZhaXR0aW5lbiwgTGludXgg
ZGV2aWNlIGRyaXZlcnMNClJPSE0gU2VtaWNvbmR1Y3RvcnMsIEZpbmxhbmQgU1dEQw0KS2l2aWhh
cmp1bmxlbmtraSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fiB0aGlzIHllYXIgaXMgdGhl
IHllYXIgb2YgYSBzaWduYXR1cmUgd3JpdGVycyBibG9jayB+fg0K
