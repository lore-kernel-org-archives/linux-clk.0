Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03092C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 17 Feb 2022 05:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiBQFBy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 00:01:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiBQFBx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 00:01:53 -0500
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20085.outbound.protection.outlook.com [40.107.2.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84ECE1CFDF;
        Wed, 16 Feb 2022 21:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTKeaf+6y/de3X7FfparURYk4t/wcsFYqDFrmJP+xxUXsbxCQrh5gS0xdLwyBL6g9iE8TKgW7u90rIk+i5sr10uule9Dm9qu2bmJ/h0WwcvUr9MstqnN4VICZ7PwccSBGrbeSeyDNwQaNUzQpe/thimqrshIQVub0R6oCWltHDpO4BYGwHj8N1+NSW4BbQGm9Vc538PtgRkdMNrODbFBbCchCVhZ19oKrDW4GSp8bb/TWXZxpBL/mzSdHRAeWuqlhWsxurIbQTOX3cMSgRQ5v2RHhAvOm5Lc1rgaShDIRdzpabtZV/5ziMqtdCglWC4ni+JCtHnPq00d12jm0KNeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWKM8VyY8FbZsLQ7O1D2IvshNbzkZhgz4jZJYd1XpNo=;
 b=kuU98hYIz1sL8b5XtDIOg5e5mTm/KUIqzAJBoo56x2VtPlkclcopUahxPyqy59kPinNgauznCgQQ0tibXJi9rO/pa6eNG0dpmcTiljD8LijO++WvIYzb5sUwsKjBk3+jDQWfDmn1KnivhTArRyBcqpWOECGzYhI7nEj3FAmYtt5lzdV1UupJZCSpwts3jjVQdxTnfp3I6hZ/yHIJGk3UoFp53WEs+PkUrnLbO4KTWtv4m6aDmlO/bC/XzMO+AMhOs4og5JwgpkExZsojtGZyB2PxsZH6nF98+BmKPJtk5UhC/okUHnov3PSMIJnSSzxq6bMF8ya6xLmozlqQPkoVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWKM8VyY8FbZsLQ7O1D2IvshNbzkZhgz4jZJYd1XpNo=;
 b=Ht2S6gkxYsie86fmNZLK4Npx1sVOKJ0vcmWwyDYu1mxC6dEtfaUImQNfShbuNXSXlKIec0Yg7i4QHc/9MprZnQr4RW/znca/STECJ9GxCqqWRUotA19H+AGI5LXgwZWlhOO5hn2r8omul+/jUBvjeDRHkzFZYEPPx1MBwK/pqds=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 AM9PR03MB7694.eurprd03.prod.outlook.com (2603:10a6:20b:41e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 17 Feb
 2022 05:01:35 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::fd01:86fc:2baf:1ac4]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::fd01:86fc:2baf:1ac4%6]) with mapi id 15.20.4975.012; Thu, 17 Feb 2022
 05:01:35 +0000
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
Thread-Index: AQHYIkhGCT5rPypv+k+qpqelhm/DqKyWFsmAgABP1ACAAMuwAA==
Date:   Thu, 17 Feb 2022 05:01:34 +0000
Message-ID: <88ee0a11-359e-60a5-4d96-54fef6514e69@fi.rohmeurope.com>
References: <20220215084412.8090-1-marex@denx.de>
 <20220215084412.8090-2-marex@denx.de>
 <c1fce212-4d9e-06fe-e3fe-6d0f2ab29489@fi.rohmeurope.com>
 <8083fbfb-d039-a7c8-7c08-c57ebf9e3b56@denx.de>
In-Reply-To: <8083fbfb-d039-a7c8-7c08-c57ebf9e3b56@denx.de>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 905fa223-4ab7-4320-da66-08d9f1d29261
x-ms-traffictypediagnostic: AM9PR03MB7694:EE_
x-microsoft-antispam-prvs: <AM9PR03MB7694065FCF0CB6EBA726B018AD369@AM9PR03MB7694.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BTUlDsaQKwvsT09eeqUATwe+vw0yo8cHB0Klef1Xmjd3bAPbZZAL0QVTmMQ2VYN/pdgOsReFNVXuEj4eLLvPqpa07s/Tb2Gdh4Z7xw+H9GEbo2D2La4EcTDoZTekIeaxiJdSpdMIBFgpDz9yEoYyOJNCPqsr/4uHSQ7TFIIQ+WCD37FMIGYbSZDZ3RJibIuN+UUfZw0c0+VZYcrl/JT49C+eooGL7fL9AV8gi57U/S46pyAyYdB99aCs0lO/s6IF8ZNhr9WZaUBuxKwUTbr07D6Aof4GZcWN8F8cejWhun+U5z7MrfSv1CL1rKC/sZm/bDl14bXkM/NWT1saczvpM5XqAR/j/5FOLQzLvPboLs6TE9wqPZoBgK+rI3+mF/Cz++YDBzXXe84MPxe73qeFzTstsTA+DPDSyrfeqdU4xhODiPaO/S2ecU9EbjmrCdUfrVBt3/QLcJTDxwGXHtj46Cv79aIwVApyVCrkpYWcGxwoNuqK0mEQRfywbYqcRMSMx0cgRWO8CGIdIA8speg4INy5yDSo85VYoYg9AzGBQGQeBBtyFOWo+olQvmokKIQCr4PBFy3qEDfJKtVPybgUtG4tDAK5WQ88fiU3K994gPEsabCzOgqtZhogVhqInGeaKwyvKrYpCF4FgsnNx2yEeaQHuCag8+j0SSDE3lvNzpxq7XpTmyi7PJT6ufI18TqVablTfvmOQhrxDiPeozhGVYaU4D7itZq40dD9KHrM2lJkzGEKaoB0ru5thGHxq1dBzWcVfBaFsGDMxx32yIkNKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(4326008)(66446008)(64756008)(66556008)(8676002)(31686004)(76116006)(316002)(66946007)(54906003)(110136005)(508600001)(6486002)(31696002)(86362001)(38100700002)(38070700005)(122000001)(6512007)(186003)(6506007)(107886003)(2616005)(53546011)(71200400001)(5660300002)(83380400001)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y09ETHJkQTdza1YzbjAzYXVHdmZQbFB2dWhlRkdMQVB2R0xyaXc2SGh6RkpX?=
 =?utf-8?B?d2FDelRTRnhjRWFpSlJOYXBZclN6MjBxZW5rSGRjbDVlaXFHQklHU0RkMmds?=
 =?utf-8?B?a0hHZDFGRWE0bGJjeFZKODVPaTFDQlAzTDBwL3d6RG1GcFJzQjVSbitmaFZp?=
 =?utf-8?B?eG5PbFFzT2ZDdnlQMC9kNmVFVlVKZE5rckkwVGtpN0MwaDRqb3pPNGx4UDcy?=
 =?utf-8?B?aFlOTW05M2l4aC9XWlRoYkM2VU9FbndUem95QWtnQUt2RXZ3aUJRb0ZsUzJv?=
 =?utf-8?B?Um9FMTdHV1Q0NU1SQTJtR25yQ0I5TkRqTFY4MEpWV1hkRURHSTVpY1hFbDlB?=
 =?utf-8?B?SjExcXQxbUw4M3lXeXR1TXJBMkRTSTBQQzlMM0pYakIrek40MGx4MERGUTFI?=
 =?utf-8?B?QTNqNGZqNjVOTWxWTlFDbFREUDFtMitlL0ZDcTRjTEUyZzhrbFJ2dGJ0dFp3?=
 =?utf-8?B?OVo0Vm1zb1N2aW5tT1krZG9SVWl1eXgwWDB1L04rQ0Z3SDB2MTc3SHI5bVNr?=
 =?utf-8?B?bjJkYWFFOWJwVFczN200R1h2TFZkb21aRlVheklYdFR3VG92WjIxL2Jpa2tR?=
 =?utf-8?B?L1BWWGZzVXJCa09zaFcxWFVRUUhPTlp2bnpxK0ZZWG1KQ0I3VEZvL2p5d0Vq?=
 =?utf-8?B?cmtJZ3I1dkxybzFtREZBRTV5czU5TWsyTFZ2TDN2SVg5andpWG9ZNmxkMGpD?=
 =?utf-8?B?WU9ITzlGWmZrK3VOU1JEZFJ3Y0cwR1JxVDljSkNxMzRQWjN4aSt3NEVOQngw?=
 =?utf-8?B?YVliaGo4M24rc0NFY3ZvTjJrc1VuTFloZWx5YzVNdkRWV001MXovcGxUVy9T?=
 =?utf-8?B?azZxbVB3UlhaZyswSmlJcFFzd0s5NHI4R3R3SnYzUU5sZjduMXdGdmh0SUtK?=
 =?utf-8?B?aUtlR3o2cVlRMlJUM2V2U1JtQTVHZTh2ajJoNVYxakxCSXo0Z2dKa0V2dDEx?=
 =?utf-8?B?RWNjRjAxdnJ6Ly9BZ1hNTXYzYVJoclY1TVIvYVRTVHhRc2xteHZIL0V6d1FY?=
 =?utf-8?B?akZWTm5JUXBCNEhIVFB1Z0NkNktnbVRUdHlCVTdWaGhSNXo2Z3VzdmxZczhM?=
 =?utf-8?B?ZGxOdWpmd1Rhc2lSR01IdHBwVHloNHg4cU1kdnhkSTRKcTQ2QXVLYWNGa2pu?=
 =?utf-8?B?azhUL1RyRS9OT0FPVjlUR2sxd0NCVlphakJrWGRVN25wL013VXowbVhZR0Fi?=
 =?utf-8?B?WVA4V2NkcVd5d0U2Wmg5ZzhWNE9CalF5VVB6bkV6MmlOd2VOS1FJOXAxWnV6?=
 =?utf-8?B?WmpheE84Z1BnU0ViRWUxQ3FzT2Y3TWtKQjZHU21iZkdFbFZGeElLQUdBczA0?=
 =?utf-8?B?Y1lRT0tmZ2lhNlpqdVVzemVTRnprT3lCbHZtZ1IwWEJLbkNCMktwS0xGVzJB?=
 =?utf-8?B?Qkd4dW1XbnVYUGpCN0tMSjdpWFFZY01HdUwvbFk0Q0ViYkNCZFN5cG0rRS9o?=
 =?utf-8?B?RXFnbVU4czZPdFh2NytQNWl6Sm9jbFpKdmQyWTBBTVpZZENxeXhZbFlyeFJK?=
 =?utf-8?B?Q3M1NFJTanlFdnh2Vnlrb25KMS9GRE1vUWM4N3k3aW1mMGk0R1dDZUptV2h3?=
 =?utf-8?B?RnY5WkZ6SHpvRmIyRzlOSFYvOVY4TzhXd2o5c1hiNjU0STBFc1JBcGUyVXE4?=
 =?utf-8?B?Z2VROHJ2cEQ4d2NnRjhjckcwQ3orNTR1NnkrQ01NVzh0ZmJtdTJHNWR2eG90?=
 =?utf-8?B?bnF6T2xzVU1LU0M3S1kvR3hTWTVnbSs0MWt0cDgvb3B3T00xemE1RXErQi9k?=
 =?utf-8?B?b2kvSktOd0hnN0YwUEJia2QvWDNiT3h1YXdLVjJJbWloNDA2L2F0c1RQTzdv?=
 =?utf-8?B?QktnTm1kdW5kVThrV1FsMXZLWGt2TWVQQ0dBT0J2SmRtYnVMbnAzMzBKZkZk?=
 =?utf-8?B?cHhoQi9md0ZKKy9vaWJLKzMvazhOblpSTEFuVUxBQTVsSlQyM0RrWnBXWlR6?=
 =?utf-8?B?aHkzQ3k2OVErWVc0bVpYUEhzZHVWZVowa29WWlhwb3h3enJUa0NsL1VkTUZu?=
 =?utf-8?B?MWpvNFczeHVUY2l6QUpLNzM2VnJYU2hqVTJWSWEyNVRncW92cDR4azBDVXRH?=
 =?utf-8?B?d0VsQnU4aXNLK2FIZ1JtclNuWDU4Ym01QlhyRHM1dVNIbFVvai9ZYkNuNVIy?=
 =?utf-8?B?cTdKeGFKakp2dDZseFM5Y25hdXg4MkswWi9rV204UU96TDdCMEM3NnQzZ3Z4?=
 =?utf-8?B?ZkdWQWRLaG1UMlBQK0VqOTRLdnV1WGFPODhJbXJlWWtSeWVzVWY1L29RRWF3?=
 =?utf-8?B?YmRjZ2JZdUY4RU9uMitWc2YxTzRvZDZqMU13WHlrWnErODBEdlFLeThDZUxJ?=
 =?utf-8?B?MjNsZTM5VjcwUGR6WGVQZWRGY0FVSWg0STdLdy84VWxFTG50N0x5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2323BAABD6B5F9449FF6AD026A8AB264@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905fa223-4ab7-4320-da66-08d9f1d29261
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 05:01:34.9229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KqaDvgWD2YRstss/7O+5ShiZ8O38WNFz1WlBNZ0/iPd4fvywcH9W8NpAOYjkY8aP+BTImcQjz/uw49c7DjC3LDiVw2gI3e0+p9et7ZXYC296WOUdsqhV8gfICvHIR2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7694
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMi8xNi8yMiAxODo1MiwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+IE9uIDIvMTYvMjIgMTM6MDYs
IFZhaXR0aW5lbiwgTWF0dGkgd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IFsuLi5dDQo+IA0KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGsuYyBiL2RyaXZlcnMvY2xrL2Nsay5jDQo+Pj4g
aW5kZXggOGRlNmEyMjQ5OGU3MC4uMWUxNjg2ZmE3NmUwMSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2
ZXJzL2Nsay9jbGsuYw0KPj4+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay5jDQo+Pj4gQEAgLTM4NzIs
NiArMzg3Miw0NSBAQCBzdGF0aWMgdm9pZCBjbGtfY29yZV9mcmVlX3BhcmVudF9tYXAoc3RydWN0
IA0KPj4+IGNsa19jb3JlICpjb3JlKQ0KPj4+IMKgwqDCoMKgwqDCoCBrZnJlZShjb3JlLT5wYXJl
bnRzKTsNCj4+PiDCoMKgIH0NCj4+PiArc3RhdGljIHZvaWQNCj4+PiArX19jbGtfcmVnaXN0ZXJf
Y3JpdGljYWxfY2xvY2soc3RydWN0IGRldmljZV9ub2RlICpucCwgc3RydWN0IA0KPj4+IGNsa19j
b3JlICpjb3JlLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBjbGtfaHcgKmh3KQ0KPj4+ICt7DQo+Pj4gK8KgwqDCoCBzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdz
IGNsa3NwZWM7DQo+Pj4gK8KgwqDCoCB1MzIgY2xrc2l6ZSwgY2xrdG90YWw7DQo+Pj4gK8KgwqDC
oCBpbnQgcmV0LCBpLCBpbmRleDsNCj4+PiArDQo+Pj4gK8KgwqDCoCBpZiAoIW5wKQ0KPj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pj4gKw0KPj4+ICvCoMKgwqAgaWYgKCFjb3JlLT5vcHMt
Pm1hdGNoX2Nsa3NwZWMpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+PiArDQo+Pj4g
K8KgwqDCoCBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICIjY2xvY2stY2VsbHMiLCAmY2xr
c2l6ZSkpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+PiArDQo+Pj4gK8KgwqDCoCAv
KiBDbG9jayBub2RlIHdpdGggI2Nsb2NrLWNlbGxzID0gPDA+IHVzZXMgY3JpdGljYWwtY2xvY2tz
OyAqLw0KPj4+ICvCoMKgwqAgaWYgKGNsa3NpemUgPT0gMCkgew0KPj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiY3JpdGljYWwtY2xvY2tzIikgJiYNCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhY29yZS0+b3BzLT5tYXRjaF9jbGtzcGVjKGh3LCAm
Y2xrc3BlYykpDQo+Pg0KPj4gSSB0aGluayB0aGlzIGlzIG5ldmVyIHRydWUgYXMgdGhlcmUgaXMN
Cj4+IGlmICghY29yZS0+b3BzLT5tYXRjaF9jbGtzcGVjKQ0KPj4gwqDCoMKgwqByZXR1cm47DQo+
Pg0KPj4gYWJvdmUuDQo+IA0KPiBJZiB0aGUgZHJpdmVyIGltcGxlbWVudHMgbWF0Y2hfY2xrc3Bl
YygpIGNhbGxiYWNrLCB0aGVuIHRoZSBjYWxsYmFjayANCj4gZ2V0cyB1c2VkIGhlcmUgdG8gZGV0
ZXJtaW5lIHdoZXRoZXIgdGhlIGNsb2NrIG1hdGNoIHRoaXMgY2xrc3BlYy4NCg0KL21lIGZlZWxz
IF91dHRlcmx5XyBzdHVwaWQuDQoNCk9mIGNvdXJzZSA6KSBJIHNvbWVob3cgY29tcGxldGVseSBt
aXNyZWFkIHRoZSBjb2RlLiBTb3JyeSBmb3IgdGhlIG5vaXNlIQ0KDQo+PiBBbnl3YXlzLCBzZWVp
bmcgeW91IGFkZGVkIGEgZHVtbXkgYmQ3MTgzN19tYXRjaF9jbGtzcGVjIGluIGEgZm9sbG93LXVw
DQo+PiBwYXRjaCBmb3IgQkQ3MTgzNyAtIHdoaWNoIGhhcyBvbmx5IHNpbmdsZSBjbG9jayAtIEkg
d29uZGVyIGlmIHRoZXJlIGlzIGENCj4+IHdheSB0byBvbWl0IHRoYXQgZHVtbXkgY2FsbGJhY2sg
aW4gY29udHJvbGxlcnMgd2hpY2ggcmVhbGx5IHByb3ZpZGUgb25seQ0KPj4gb25lIGNsb2NrPw0K
PiANCj4gWWVzLCBJIHRoaW5rIHdlIGNhbiBvbWl0IHRoZSBtYXRjaF9jbGtzcGVjIGNhbGwgZm9y
IGNsb2NrIGNvbnRyb2xsZXJzIA0KPiB3aXRoIGNsb2NrLWNlbGxzID09IDAgYWx0b2dldGhlci4N
Cg0KVGhhdCB3b3VsZCBtZWFuIHlvdSBjb3VsZCBwcm9iYWJseSBkcm9wIHRoZSBiZDcxOHg3IGRy
aXZlciBwYXRjaCwgcmlnaHQ/DQoNCg0KQmVzdCBSZWdhcmRzDQoJLS0gTWF0dGkNCg0KLS0gDQpU
aGUgTGludXggS2VybmVsIGd1eSBhdCBST0hNIFNlbWljb25kdWN0b3JzDQoNCk1hdHRpIFZhaXR0
aW5lbiwgTGludXggZGV2aWNlIGRyaXZlcnMNClJPSE0gU2VtaWNvbmR1Y3RvcnMsIEZpbmxhbmQg
U1dEQw0KS2l2aWhhcmp1bmxlbmtraSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fiB0aGlz
IHllYXIgaXMgdGhlIHllYXIgb2YgYSBzaWduYXR1cmUgd3JpdGVycyBibG9jayB+fg0K
