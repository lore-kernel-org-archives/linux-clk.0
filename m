Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4C3C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 19:37:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 693EA2173E
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 19:37:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qOPY++TA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390263AbfIFThH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 15:37:07 -0400
Received: from mail-eopbgr20057.outbound.protection.outlook.com ([40.107.2.57]:1091
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726174AbfIFThG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 15:37:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+rZs6HD7tTTkh7V/8Px0/uwCIbk6Nc0PBnJUWaSsP0PNHXIS31u2PpOcA2j9FD+2SqUVH4uEkOFqNCoA2B71thPL2pY0SKGWfYg43jIA+6uRg78A3yw0IRCMsb7rWnnN7UbsEsrdw4KHv6tdJXQx335EvruExXj/+BchXEIzIq3eeT4BHe9Wvd+i7/8gnJpH6kkfhnBECjaBDqFo/rqv9dTcOlBnlejTNOX4Is9cXGGkZe48BeYksS70Bg1sKE8Mbe8j1hU8ywZvyVVkwqSHB3DUysiGyFwgMiLrX0BfyZlo5x6BaKh7Cr3JdAsIwaIzdEv5feSWG3xpsDyrp8Dpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljIEUsl9YYDvUzn3h/FkX32GvUboR1Ii0V0gti1Tr4s=;
 b=MhvMSdfaF0MIj4kDQCmgp2EOTu2y/LY9FULmM+qoGWHrDXmt/EDuouUSdooeTB87SvIhbSOtoIEq1javbIa3JR7pDPC1qonbnu79RmKZYvyWhZQZsEx4WnX4fTJWXa47cvFSO7hKlWMO1XR4/o5BqtjHdxwsu9zLaXtJAJrKJrIccpHlJY48MRYw5oSafMXDVsmnV1IhpGp3LYdIwwPPlsMEDylN250oQ8dTK2rN9NQ/oKBKvNydSjO9Pu2AcO2muTRktp74a2Vk8e0YNdabI/30gd+dIUIF6L/oejP35Op+I0MkBF9ZQHEcM3Qci2Szka3O6y0KCJC9+iuFbV7Zog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljIEUsl9YYDvUzn3h/FkX32GvUboR1Ii0V0gti1Tr4s=;
 b=qOPY++TA4btOfKxl/tD/HRDq67EXAYYQwm6J1ICqHbLL50c70RMUOVVVB7d/WTorcDOPbY13q+P+81M/SJm5IDJTsZocIGGW6KFgLb/Y6QQsVEmvrDAUnRlLeUo4qBAZ8wrreu+sRiaei69o57mZsydhQg0mqYywCfHmoyJLITo=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB5312.eurprd04.prod.outlook.com (20.177.52.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Fri, 6 Sep 2019 19:36:47 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::c5e8:90f8:da97:947e]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::c5e8:90f8:da97:947e%3]) with mapi id 15.20.2241.018; Fri, 6 Sep 2019
 19:36:47 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>
CC:     Jacky Bai <ping.bai@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx: pll14xx: Fix quick switch of S/K parameter
Thread-Topic: [PATCH] clk: imx: pll14xx: Fix quick switch of S/K parameter
Thread-Index: AQHVYwYI+hx87JSvwEWGyvesxHdlQw==
Date:   Fri, 6 Sep 2019 19:36:47 +0000
Message-ID: <VI1PR04MB70239D5AA9604E72E74CD555EEBA0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <c3e86b5a832a14278e8ba670d51defc70ee78d84.1567590349.git.leonard.crestez@nxp.com>
 <20190906172452.D1ED620838@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8a76b9a-08b7-4fc6-cae0-08d733018e6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5312;
x-ms-traffictypediagnostic: VI1PR04MB5312:|VI1PR04MB5312:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5312D213AD9EF6FF3CECBF94EEBA0@VI1PR04MB5312.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(199004)(189003)(7696005)(74316002)(305945005)(7736002)(8676002)(81156014)(81166006)(14454004)(478600001)(316002)(99286004)(8936002)(54906003)(110136005)(76116006)(91956017)(66946007)(66476007)(66556008)(64756008)(66446008)(33656002)(86362001)(486006)(44832011)(446003)(476003)(6506007)(53546011)(76176011)(102836004)(186003)(26005)(229853002)(6636002)(5660300002)(2906002)(25786009)(6436002)(256004)(66066001)(4326008)(53936002)(52536014)(55016002)(71200400001)(6246003)(9686003)(3846002)(71190400001)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5312;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qtmxDXyIepOZDzzki6eqyyNf/YURy0IsQcNBfIrAxtYUGm+tC4CH0DwFBvxOEfGrqV2cDCN6KOQS5NgojVapGWxSCGUGW65aNsPHU77CnRkFJ8bZYMgYRIOb+DQR6zhU6K/QG2fSnlesrSuvOWRf7gFjKG8idVZEqFK01ubUHkgvx8FshtK6/nPJnB+MosdfDLiqLxTtPFmhiDLlBW3MTi2qR5laQ8Gzu083yGNnikYnfUpm9ahsW529/SftGtbyXlfw1RfOZSM9KPRnvQiUtTsKSzNtZhij7wrcEw6PC7eYx2vODEcE54q7Tr69PH+3rYAnZ5BfEU7N7OH6I1+zWaN1lMZCnNQ2OqMONWy3ZX7pZgZ6BdfLkXv3DxT7s5SQnqKgBrMvAwtz9aB7pHTENKf6guFzt2bkkB+8BxvCxME=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a76b9a-08b7-4fc6-cae0-08d733018e6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 19:36:47.1276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Gw0Y+ZYiKVEBcjlKhW2Xp3b+HS8QCvhwjX/YadElmI3kGcLMhm5F9mGhD4j8WGaA85uiosfy83hO1yncanciA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5312
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06.09.2019 20:24, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2019-09-04 02:49:18)=0A=
>> The PLL14xx on imx8m can change the S and K parameter without requiring=
=0A=
>> a reset and relock of the whole PLL.=0A=
>>=0A=
>> Fix clk_pll144xx_mp_change register reading and use it for pll1443 as=0A=
>> well since no reset+relock is required on K changes either.=0A=
>>=0A=
>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
>> ---=0A=
>>   drivers/clk/imx/clk-pll14xx.c | 40 +++++++----------------------------=
=0A=
>>   1 file changed, 8 insertions(+), 32 deletions(-)=0A=
>>=0A=
>> The PLLs are currently table-based and none of the entries differ only=
=0A=
>> in S/K so further work would be required to make use of this. The=0A=
>> prospective user is audio doing tiny freq adjustments and there is no=0A=
>> standard API for that.=0A=
> =0A=
> sub-Hz adjustments?=0A=
=0A=
Maybe at the audio level? The PLL itself runs at ~400Mhz so wouldn't =0A=
need sub-hz adjustment.=0A=
=0A=
My understanding is that adjustments would be made based on an external =0A=
clock so if CLK framework rounds to 1hz then it would just take longer =0A=
for adjustment to kick in.=0A=
=0A=
>> Lacking users is not a good reason to carry broken code around.=0A=
> =0A=
> Maybe add a Fixes tag so if anyone wants to use it in LTS kernels there=
=0A=
> might be a chance that they'll find this patch mention code they're=0A=
> using.=0A=
=0A=
It doesn't meet stable kernel rules because it doesn't "fix a real bug =0A=
that bothers people" but it's still technically a fix:=0A=
=0A=
Fixes: 8646d4dcc7fb ("clk: imx: Add PLLs driver for imx8mm soc")=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
