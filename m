Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65ACC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 10 Mar 2022 00:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbiCJAzf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Mar 2022 19:55:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiCJAze (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Mar 2022 19:55:34 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0565B0C50
        for <linux-clk@vger.kernel.org>; Wed,  9 Mar 2022 16:54:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mqe5AYiV5/WpI7ZL5f6qZePIMXtSFQ7tIQ/LQ323SGOZTyIehaj2P1AfDvWOinzAaceegSSrdvMVfRECcN1lIrbVH08EyYFXmBfUln/QqRxsfXU80dxz1iFWt7IqkLR6i79RPm3y4LqLpYhs98Mzf98uVr2Z/Y3vXXh8V+5W+N5+/vc6YL8hjWl8jCj2TZMySmGZVU0qPfvjsN7qM7kgQhU/qWYH1qC2DSr8KdO2ngBYz5wSgXeVj25clhz495GHj/WUtruLYrMkwLkxporsQ74fOn5VuHdmoA12fD3muV1Poqikb2TNILVdnNic2TRLontc8P5jiEf/l1fRVTW4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXfl3bowHa476BjJkHpCEUzr6X+GEOv2N5uSVaiIf2E=;
 b=Bi9AokMd7ePRdIpjfpURnBoKuprhIT9Ov7XEkPIs3Jl8upQzFZQ3vzfQVJ1zrfFh83URpWQMUc88Pqj9UhMAtCe9UZLqa+qGBwuGqF9/4YDUfywvfyVCLE0QFu6qFZxlzEKK2/Mpp4PDrm5+xyhGmosY3WSrXDzuqc3ZTRw/A24R7lbOwPjrq9mhZs7ucKJvkibHxpiUGSfTVzaAZ1V1lJ2rWbBA2yhxNo7rZrMiodKWmoMLNdAPhcHiC1UyTKWjqkz2OyW60PU/NJ8feH8EI8ZP7wG2j/ikpD/YwNzmdUq/6FCq2AYyuo3DzLIXuNgtsYwwdyvTJTUvgtMNfbyKBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXfl3bowHa476BjJkHpCEUzr6X+GEOv2N5uSVaiIf2E=;
 b=b0PtEEmOogDFnhGKNNnO7jZMA3E/l+h0prkAn+U9F7Mms8v28Xdpn2GZxBKQ/OnkZHl+RPTPZTp8TATgh3uYaJjHdUfgQ4VQNKuXnr2gF8mXav0yfxD4OvhnfXCPJo5jvu06LIasH9D9f6HWidLJPLMFWSjefdvOUEDHboNzY9s=
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9)
 by HE1PR04MB3050.eurprd04.prod.outlook.com (2603:10a6:7:20::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 00:54:29 +0000
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::4da8:6419:c67:3ec7]) by DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::4da8:6419:c67:3ec7%2]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 00:54:29 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: imx: Mark the snvs clock as critical by default
Thread-Topic: [PATCH] clk: imx: Mark the snvs clock as critical by default
Thread-Index: AQHYMtPKXrtwcZ+ITkyDH92RW3sWJ6y3ZlmAgABljSA=
Date:   Thu, 10 Mar 2022 00:54:29 +0000
Message-ID: <DB9PR04MB8412630A41E49E66EB5FFB04870B9@DB9PR04MB8412.eurprd04.prod.outlook.com>
References: <20220308101714.164163-1-ping.bai@nxp.com>
 <20220309184637.31E2CC340F4@smtp.kernel.org>
In-Reply-To: <20220309184637.31E2CC340F4@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c281e5a-13e9-4740-3569-08da02308882
x-ms-traffictypediagnostic: HE1PR04MB3050:EE_
x-microsoft-antispam-prvs: <HE1PR04MB3050F036B93C8C6F95CB9B0A870B9@HE1PR04MB3050.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z94xsIoef8AQ8X1Ic+nOGIrkLdm4FcKAI/KM63acfUTmbhF/zJypJ5kUkPB/Gt+9mQPCd+ayPJUfPdiH+VRAmOFJhoTxUsWbsWfFK+xTM4o8nXwdu2TBQ9r2l+V+pFzYGG/BTgj3VyHNmjhmDw6bV2BGB7NCUBWlXXhokOMF7r0KbkP52rs5dpMjya6C2Eq/oDDrMeyF0UYP2wndlR4POewBqXZb99Qx5kLvA/lViaOuemCz/RW7JdM/K2jhYNjcD1pcVHkrgkKLWi9d50UGn17OKchBDMjxGObksIBMaOQo635E/N75ccaX4tamfEER7PuwIULsfRGVAn45bKRQPHiQKjn4dE9QdeYkLDsG2RLdXyAD0u/46/r2/1mL3UrZ9MAmlZI3ulBLzHBT4139xak+8yKXhnbeKbYItYKaE3qy8TiVAFcBNdk4B9WF80piGgz/VgqHZI19NS50j65StJxRwd9UY6lJ7qz+Se6AfwmdGPxPXEDKC8HbDXdOmoGs/zuxFvWHV6HZAuHv7nsbk06UW3JrOIKCCUVFuOy7lSPglvNcnw3qVo/OmCmQOpAzqXg/dArPjL3FWvG40slsem2DzR2E4mMVRJ69dw1+R370xWcdcoohRnNV8DHgFhrdwtX4vx6rSI3hJ6lO7QJH78RUJTBkhDSdHA5VpgRJ/xbOJWIzWSSa649baMf9O0piyjXYDUX9UHZjJO6awVCwEg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8412.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(122000001)(38070700005)(8676002)(8936002)(4744005)(66946007)(64756008)(66446008)(76116006)(66476007)(66556008)(54906003)(4326008)(5660300002)(52536014)(110136005)(38100700002)(86362001)(498600001)(7696005)(9686003)(6506007)(71200400001)(186003)(26005)(83380400001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFc1dW13bkdZNzRQdG9ZaWRtRTRFeklJWEhxNFUvcGFHNlNzelU1Y01OM1Vu?=
 =?utf-8?B?RDN0bno1eFdMSFhSKzdpZjNIWGRnME1xbEZGZUdsWHZJQlNSL3ZnRlJ2a0F4?=
 =?utf-8?B?TVYxUFljMm8zdUVIWVVEb29VQkpxdGtGcnRNb1Y2cjNRVmNiM2NwZmRMRmx2?=
 =?utf-8?B?elY5cHlIajdaaFRVVkcvNGpNd0VyNzQ3dldha3ppMDBxdTMyYk9aeFhTMk9i?=
 =?utf-8?B?WWVJMUZodkhtaDdHSVE5M3ErMEZuZmxyRjBBalQ4bnFnNzhDUFlZREQ4QmFM?=
 =?utf-8?B?WHErOUxvTWZYbUpKeUFaMTZ0M3oyMDNSSEZyNitqNXN3M012NS9vN1U4Yk5n?=
 =?utf-8?B?MGFQc054cndPQ0MrQ2crcDZwenpLVEhZaUFudnoxZXpFVmZZblEvejlGQi9Z?=
 =?utf-8?B?NmIzMTNBK3F3OVg3eDlyeDVIRFZlNWF5cE9ZcGsweVg1RnF6MUV2TVNaS1lZ?=
 =?utf-8?B?c3YyODJsRDBiTmU5cngvc2dUUHk2c2ZzOHNyeEVjKzZjMEV6bmdiZFlyeTVH?=
 =?utf-8?B?b2owVjR6cVloOS9PRWVyK1Qwb1JxRmdSUkkzd0xCY2xsRlE1WkNrYlVFakoz?=
 =?utf-8?B?T0VYMm4wL1pDWmhBellUQUFER0FuT1pJenBYanVWWGlTbXRuOE5zYngxeEdP?=
 =?utf-8?B?NDQwam1Na2w4RXgzMnRpNmR5ZmRwc3JGQ2NvVFQ2NlhlVWxQcE5XL0tNZk9W?=
 =?utf-8?B?OTlHRUFMK2J2MTA5MmpORTVYZWF2ODNqcDRVRlFHcWFpYUtqaE9vbVlISzJl?=
 =?utf-8?B?MmRrNUw5M1lNYjBNTlRCQ3hXcGp5dXRpTFE1MWR0Q3c5cmVuaGw1b2MxbWxj?=
 =?utf-8?B?TFgzcDFjOHordHBVWE5VQnBkRUdMbkJmbE1pdi95MDJXN2FYNk5kbWEvQ1lx?=
 =?utf-8?B?aEhaUWd0cmlrbGg3eWpvanBpQzZFamZkMTRrN2M1aGtpZFRRQWgxNmNCaTBZ?=
 =?utf-8?B?dGFPRlZDcW5yVE9TdFhNQnRxZWNTT25ZRmlsZGx1YjQwMEtSRUxXWUJYSnhQ?=
 =?utf-8?B?UTJNRDRUc0d1SFlFRGhsVndxdUh3d3ZkbTVFbHY1N2NLMmQxL0p6YkhRQmF4?=
 =?utf-8?B?anJydk1TK3JLOXdEQmZCZGtxN2EzbThqNCtnYUFGQk56bzJDZFFhZ2U2WWh5?=
 =?utf-8?B?NHNkeGhySzlXS1NrTVo2cDUyRDljeFArN1ByMTVpb1BHOHArMHV5S3lXMlgz?=
 =?utf-8?B?SC9JVUtaUmsxZE9MV2NrZGVzeGtGbmpjQjNXU2FzUC9EOWdOWkI5S1VXYTF6?=
 =?utf-8?B?ZWUzU2hOeWxINlkwaEZiQW5JbUZQdisveHRUaUpvZHMzWTlVSXd6ckhWelI4?=
 =?utf-8?B?cFFaY21Ud09CYkY4dHJGbytGYXRtUVpiaDlxMG5Md09xNmt6a2xhNkIzY3Fi?=
 =?utf-8?B?dTVNTXFYNSt0bzJmdXorak1tZkFOUnh3WGlabVBZME9UbGtDc0ZKaWZScnhG?=
 =?utf-8?B?RUowNnN5VUN3K2d3Ykw1TnF2d0VTR0VrMlZFck02ZEV6QjJ2SExCa3Z5aDBn?=
 =?utf-8?B?QXluemhaczFPVFJhZjl4OHRYTm14YlVna255Nnl3bVhDVDIxa2ZVM3NDVXJu?=
 =?utf-8?B?bWdISmVEckd0eURSMEo5SFZVcjBGckRxZFllYW9RU3pOKzlURGRyckoyaXdS?=
 =?utf-8?B?WkRtbW9qdzBFY1NUcWRvazJId1dNVVJaMUZVRDhnL2FrVmYvSXpEak9aZGlX?=
 =?utf-8?B?ZnFJdmNBS2ROVjg1UVJ6K3doSFNIQlcxNnJkbjI0dW5lc1I1NDRWOHFFSjFP?=
 =?utf-8?B?dCtBN2RDc1M3YytpdUhmM3VHSnV2dVpJRHFaUkNuNFFDdHo2SHRoU0QrWGh4?=
 =?utf-8?B?VXVuWHJhRjBLbUljNDVyaUZpNGJuOUhsQktSMEl6T3ZXSzA3Y3oxQ0VQaUND?=
 =?utf-8?B?aG9vNTU4dUxpd2Jtb2xaOUxJZGk2SDAzZnVjQTVQZjM4ZG05V2tHaGRiNHp2?=
 =?utf-8?B?ZU5ZNm1sL2F6cXBaaERpYmpETDVYVFBsTjlma3kvSCtiZERHZjdkNWplN1p3?=
 =?utf-8?B?STZ0NWh3aE5kdldVazJBU1VqZFJuTkV4d1NXakNuSjNNanRVM3VucUE4L1pD?=
 =?utf-8?B?VERoYi9RUFZua2x2NWFRRlhOdjF5NTRGMGR5VnNkSktvQXJ1Vi9QWThTdyth?=
 =?utf-8?B?WlpUc0FSODk2cE5tMHNBOHhLZjhuTmtqN2lwU3U4UE5hNDUvUm13bzhISVZV?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8412.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c281e5a-13e9-4740-3569-08da02308882
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 00:54:29.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPsVzmxqJ0oyDfU8zeCn4PG7CfEHaRUzl3SpPt92ytkLaMbMdtfz9A5SpsDd2gLnJDI6Ynvc6VYFWRxYRRyzzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3050
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IGlteDogTWFyayB0aGUgc252cyBjbG9jayBhcyBj
cml0aWNhbCBieSBkZWZhdWx0DQo+IA0KPiBRdW90aW5nIEphY2t5IEJhaSAoMjAyMi0wMy0wOCAw
MjoxNzoxNCkNCj4gPiBUaGUgU05WUyBtb3VkdWxlIGlzIG5vdCB1c2VkIG9ubHkgYnkgdGhlIGxp
bnV4LCBpdCBtYXkgYWxzbyB1c2VkIGJ5DQo+ID4gb3RoZXIgU1cgY29tcG9uZW50IGlzIHNlY3Vy
ZSB3b3JsZC4gTm8gc2Vuc2UgdG8gZ2F0ZSBpdCBieSBsaW51eCwgc28NCj4gPiBtYXJrIGl0IGFz
IGNyaXRpY2FsIGNsb2NrLg0KPiANCj4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIGV2ZW4gcG9wdWxh
dGUgaXQgaW4gdGhlIGtlcm5lbCB0aGVuPyBQcmVzdW1hYmx5IG5vYm9keSBpcw0KPiBnb2luZyB0
byB1c2UgaXQuDQoNCkZvciBzdWNoIGNsb2NrcywgSU1PLCBubyBzZW5zZSB0byBwb3B1bGF0ZSBp
dCBpbiBsaW51eCBrZXJuZWwuIGJ1dCBpdCBpcyBhbHJlYWR5IGFkZGVkIHRoZXJlLCBhbmQNCnJl
ZmVyZW5jZWQgaW4gZHRzIGZpbGUsIHNvIEkganVzdCBtYXJrIGl0IENSSVRJQ0FMIHRvIG1pbmlt
aXplIHRoZSBjb2RlIGNoYW5nZXMuIF5fXg0KDQpCUg0KSmFja3kgQmFpDQo=
