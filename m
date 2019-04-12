Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48704C10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 19:02:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19B4220818
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 19:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="l4YCIMtz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbfDLTCx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 15:02:53 -0400
Received: from mail-eopbgr70072.outbound.protection.outlook.com ([40.107.7.72]:13181
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726881AbfDLTCx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 15:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ds/0FkURIgKdQM9VOf3FXy3ub5b/a9aegeJCSytQ+U=;
 b=l4YCIMtzVgJhcn5K0K/qRm+VqD56FWTGUPxp0JtPp9BZm884+a0o9yJ7x6OModqocgPgwogLwu/X9i7AVOty3uK6NzNvpPWG5DhWSAuih4NK0dHQgJdXt54GujcSsPku4aBThWXuodFsz0f+vBjnqcq72Hq4MHR8OxPj23AG/hg=
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com (20.178.122.159) by
 VI1PR04MB5454.eurprd04.prod.outlook.com (20.178.121.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Fri, 12 Apr 2019 19:02:48 +0000
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822]) by VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822%4]) with mapi id 15.20.1792.016; Fri, 12 Apr 2019
 19:02:48 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Jacky Bai <ping.bai@nxp.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Robin Gong <yibin.gong@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Angus Ainslie <angus@akkea.ca>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/4] clk: imx: Fix PLL_1416X not rounding rates
Thread-Topic: [PATCH 1/4] clk: imx: Fix PLL_1416X not rounding rates
Thread-Index: AQHU8WJRDUL8WCV20kqikuzhAPWkEQ==
Date:   Fri, 12 Apr 2019 19:02:48 +0000
Message-ID: <VI1PR04MB5533934E767E9B0FA09BBE71EE280@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <cover.1555077720.git.leonard.crestez@nxp.com>
 <7dd868d4673f155faa8c52d80a01d01aed2ea247.1555077720.git.leonard.crestez@nxp.com>
 <155508743438.20095.5061509575513490354@swboyd.mtv.corp.google.com>
 <VI1PR04MB55330D9C5E2DE905333070F4EE280@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <155509407072.20095.14633592159299137519@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7121ef03-3392-4917-0eb7-08d6bf79744b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5454;
x-ms-traffictypediagnostic: VI1PR04MB5454:
x-microsoft-antispam-prvs: <VI1PR04MB54540977DC8D3EE8C878DFF9EE280@VI1PR04MB5454.eurprd04.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(136003)(396003)(346002)(39860400002)(189003)(199004)(26005)(229853002)(446003)(486006)(4326008)(256004)(305945005)(8936002)(93886005)(7736002)(476003)(186003)(76176011)(53936002)(105586002)(5660300002)(14454004)(68736007)(6246003)(106356001)(97736004)(33656002)(6436002)(66066001)(99286004)(71200400001)(71190400001)(25786009)(52536014)(74316002)(6506007)(53546011)(55016002)(81156014)(8676002)(7696005)(102836004)(6116002)(478600001)(3846002)(9686003)(86362001)(6916009)(2906002)(54906003)(316002)(81166006)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5454;H:VI1PR04MB5533.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DlUZVV8D0Kv9y7Kj9/yUakC5UyQzCqVq0+D55RYmlGUvuIK1FktZavXDumOjlbEKBdKhn8nqcIl0iPa+zZApyGkYl6PjyWdddirNwzclLicBZEc9t9yC+8TBE7gULEvux7egPxhkO50p0CEanH1YSaupuNEEYRZGsqYyOUXq6i3s98TpmwbQNz2y7YFg4P6B0d5FGld3ASEvnv9KJ9YEVdP9BLeIU4bzpCqrUgCJpA0KpUt+mI75NDxXdQKs9/scfjkUfrU5fW5hZ2uw4gcVS0mqpKw5l4kh3cjmQse8nUfhZP1gTWO86Uwy+vjzIzUPZTzDIIWrXCUDEhNMnaxiaLOkDo5DgZeKsII3MMDbqfFPkhTuDgQBBGnD2agZO/vQJdEjJi9ilRqPASMJw/ot0FEBFV5gEfRAzCF+7CZRdm8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7121ef03-3392-4917-0eb7-08d6bf79744b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 19:02:48.1237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5454
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/12/2019 9:34 PM, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2019-04-12 09:51:37)=0A=
>> On 4/12/19 7:43 PM, Stephen Boyd wrote:=0A=
>>> Quoting Leonard Crestez (2019-04-12 07:10:03)=0A=
>>>> Code which initializes the "clk_init_data.ops" checks pll->rate_table=
=0A=
>>>> before that field is ever assigned to so it always picks=0A=
>>>> "clk_pll1416x_min_ops".=0A=
>>>>=0A=
>>>> This breaks dynamic rate rounding for features such as cpufreq.=0A=
>>>>=0A=
>>>> Fix by checking pll_clk->rate_table instead, here pll_clk refers to=0A=
>>>> the constant initialization data coming from per-soc clk driver.=0A=
>>>=0A=
>>> Any Fixes tag here?=0A=
>>=0A=
>> Fixes: 8646d4dcc7fb ("clk: imx: Add PLLs driver for imx8mm soc")=0A=
>>=0A=
>> That's the only commit on this file, it's only for a very new SOC.=0A=
> =0A=
> Ok. I take it I should push this into clk-fixes so it can fix badness in=
=0A=
> the v5.1 series?=0A=
=0A=
Since this a bugfix and the original patch is in v5.1 the answer would =0A=
be yes.=0A=
=0A=
It would make a lot of sense to accept this separately from the rest of =0A=
the series.=0A=
=0A=
The original patch is not in any release so there's no need for stuff =0A=
like CC: stable.=0A=
