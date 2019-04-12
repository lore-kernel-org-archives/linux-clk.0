Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F14EC10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 16:51:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02C9720869
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 16:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WDYhqQ1B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfDLQvl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 12:51:41 -0400
Received: from mail-eopbgr140071.outbound.protection.outlook.com ([40.107.14.71]:13196
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726624AbfDLQvl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Apr 2019 12:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DaptNJDwE1jCpjPQoUEAaxUJrkd56ltbIuHW8vRNOA=;
 b=WDYhqQ1BBHJPTLVGD0Ny/KcPWzUybQ5Qa5AyilMwJL7zWRtL245qs72imUXxAXey0dvvOm1IW4JlSvZUulbWVV0eK8/NhCje80HJZdHezfhMhQzNleMAi0hRkfNYGp2B5C8153+5DS2wgLV6dCimrvulTbMUKx9lFruRaOqLqY4=
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com (20.178.122.159) by
 VI1PR04MB4814.eurprd04.prod.outlook.com (20.177.48.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.15; Fri, 12 Apr 2019 16:51:37 +0000
Received: from VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822]) by VI1PR04MB5533.eurprd04.prod.outlook.com
 ([fe80::cca7:43cf:dc13:a822%4]) with mapi id 15.20.1792.016; Fri, 12 Apr 2019
 16:51:37 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>
CC:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Robin Gong <yibin.gong@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Angus Ainslie <angus@akkea.ca>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "linux-pm@lists.infradead.org" <linux-pm@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/4] clk: imx: Fix PLL_1416X not rounding rates
Thread-Topic: [PATCH 1/4] clk: imx: Fix PLL_1416X not rounding rates
Thread-Index: AQHU8U/+WE0bcFs32UiKWx2jnuEbaw==
Date:   Fri, 12 Apr 2019 16:51:37 +0000
Message-ID: <VI1PR04MB55330D9C5E2DE905333070F4EE280@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <cover.1555077720.git.leonard.crestez@nxp.com>
 <7dd868d4673f155faa8c52d80a01d01aed2ea247.1555077720.git.leonard.crestez@nxp.com>
 <155508743438.20095.5061509575513490354@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2650929-8e89-44be-bd2d-08d6bf6720ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4814;
x-ms-traffictypediagnostic: VI1PR04MB4814:
x-microsoft-antispam-prvs: <VI1PR04MB481446EC4EAC6644E89F3F65EE280@VI1PR04MB4814.eurprd04.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(346002)(39860400002)(366004)(199004)(189003)(106356001)(71190400001)(229853002)(110136005)(305945005)(5660300002)(446003)(26005)(74316002)(81156014)(52536014)(53546011)(25786009)(7736002)(6636002)(186003)(81166006)(68736007)(66066001)(4326008)(86362001)(6116002)(102836004)(6506007)(44832011)(97736004)(478600001)(2906002)(3846002)(33656002)(8676002)(53936002)(256004)(14454004)(55016002)(105586002)(8936002)(6246003)(6436002)(4744005)(486006)(316002)(99286004)(476003)(9686003)(7696005)(76176011)(54906003)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4814;H:VI1PR04MB5533.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OVlU1Bj/PZff/ImNp1ZRwEw8Iy+Gbr6LqK+icas2I1kgS9bDqlvLVAyrke1wrN8BpS6Pcm3boxVqteiqbQxTEoAmBY28VI+Uc67S+/hKGLW6nY5ASQRfZY++LROSMfmi7piTMadncZJK033Jc+rGvWX//XhG0N+aG+9jK1FuleLoDaJCAmyCd3c2a+VZTQdnnPYpczo2rD7+V1mUdh8Ry4TCGCWuEQyDJJzUDEdMc6I7oDJ5lIc+DY9yXKpLEuxaAylOZ0yZitRn9QnpogIj50mnM83PCEpss/1Gp3oHxy8pbqVL6wkX+A0ztWKakaAhk6aEvLVoDaK+ByNcPXdzaOihDdGzuHlk7xbHYsf9YwQOFKmiqtaxUlBw6sfixCa56aSZaG+AbPWTJUYsC9TtVZg+62XA9eTdqBBNOQKTItc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2650929-8e89-44be-bd2d-08d6bf6720ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 16:51:37.2606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4814
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/12/19 7:43 PM, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2019-04-12 07:10:03)=0A=
>> Code which initializes the "clk_init_data.ops" checks pll->rate_table=0A=
>> before that field is ever assigned to so it always picks=0A=
>> "clk_pll1416x_min_ops".=0A=
>>=0A=
>> This breaks dynamic rate rounding for features such as cpufreq.=0A=
>>=0A=
>> Fix by checking pll_clk->rate_table instead, here pll_clk refers to=0A=
>> the constant initialization data coming from per-soc clk driver.=0A=
> =0A=
> Any Fixes tag here?=0A=
=0A=
Fixes: 8646d4dcc7fb ("clk: imx: Add PLLs driver for imx8mm soc")=0A=
=0A=
That's the only commit on this file, it's only for a very new SOC.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
