Return-Path: <SRS0=3y70=M3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0698C28CF8
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 09:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85D312064E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 09:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="RSETcx8s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85D312064E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbeJORBp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Oct 2018 13:01:45 -0400
Received: from mail-ve1eur01on0065.outbound.protection.outlook.com ([104.47.1.65]:28576
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726273AbeJORBo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 15 Oct 2018 13:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fuVD69img37rfDVmbys0bvUP2iZ7GrTKcRiR0TJCpM=;
 b=RSETcx8sS7uIQ8ItXHue0iJ0H3ubm/6SpuyyDEE9vhr5eu1V8SHKRh/0rfsFj1JzDzIvfWNIVLQG1cPlGOxDmhAjR/CL5HARIBNboF9CMo6H488DqMXfUQ2o2TAXUgJ+mz+Qtk+W4pyRbT6IaoG0DaG4avtBxJgmOJkgOQtoDmQ=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4306.eurprd04.prod.outlook.com (52.134.126.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.26; Mon, 15 Oct 2018 09:17:14 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Mon, 15 Oct 2018
 09:17:14 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
Thread-Topic: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
Thread-Index: AQHUY5UDa12Huho8BEyIYtM4b8PGa6Uf6y+AgAAZoyA=
Date:   Mon, 15 Oct 2018 09:17:14 +0000
Message-ID: <AM0PR04MB4211129386C9088C6AFEDAF580FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-6-git-send-email-aisheng.dong@nxp.com>
 <20181015073207.66npcgegibl2rybb@pengutronix.de>
In-Reply-To: <20181015073207.66npcgegibl2rybb@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4306;6:FA/Ma4/cv+hos1ap85MUGMRZNAmZ2+KvlB+4C0FRhKvfRWlDmPua2NIcP8b1vDj2Y+YaEoNaJt3YEZTxVsaqhwBiviBTdPyObARtAqAgKVXdX5SGRS4OyC6qxVYDWzkb4/FOHPts1jYMaEAs4eL634pXs7XuJlBcIiNbaIBRXZIwIay8eFTshUA4FMmQ8I6FVAI4bUx6qLDl0Y4rlNiThqJxUQM9+WRHADv+saDXZLq0Fe1tdp/Ra8OjWS99WHcPb5rznUpfM2JRhfRxPS4csxGCc6rYl5ommtHrbC/zZxlG7QWaKFHKKbEVUU8ErkjOvATwpS6ZUaQDy7PnoO/R+caxPl15l6UP6CM7EmW4E1tQzdohAlz4JKUKc3AwWuwHl7xAh9rebZDXimM8rrQMeZ/bf4YoQPhh3ywerkcMRg3b3v1TstXK4YxTknccx5RNUGzR2xUyM89/g+kN86EhKw==;5:ij6NeDtUwBJSNZykfc4O26Z56tOLX3lGHczQiGcYdFEe4fUIgE+jcoegbRn28bVnSr2cPEsYg277rwfuG4dQhL9B9u8k8us4M770jEo+59jWLYbhaAf/Sb2oQf575tRi5EfNsNwXZgMHlLzayuZa3LmUckjgVR6BySdGdULVTuY=;7:BN3FgOaVhuCBu9eOUkqmdTtR810w6j51wBaCUmorUMH2cucOxepse32NtpkAFQkPxdlOKJvQbJwL8YdHy6PBhHnyKa1h8M9aoEjXZJCk0WJ7taqmVOPtSq33XBUB7P1mL3W5CELzNOGYhXl5E0vc8tKYOPXE/0Go6riExjrWVp2ai+f5BMsT0AHvMOR5wFkEZ0OuIxIvVFlzUylzVINOtFReBZy8NtJQBcBkFZrcRD47/G95+L9mvsMcsBRc+bCP
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8e2c3b39-8953-44a5-170a-08d6327eff2d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4306;
x-ms-traffictypediagnostic: AM0PR04MB4306:
x-microsoft-antispam-prvs: <AM0PR04MB4306D499B70A0CBEDB8055CD80FD0@AM0PR04MB4306.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(9452136761055)(258649278758335)(45079756050767)(189930954265078)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(4982022)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991067);SRVR:AM0PR04MB4306;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4306;
x-forefront-prvs: 0826B2F01B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(39860400002)(346002)(136003)(13464003)(199004)(189003)(186003)(71200400001)(71190400001)(476003)(316002)(486006)(446003)(2900100001)(11346002)(6506007)(53546011)(45080400002)(2906002)(478600001)(25786009)(4326008)(6246003)(26005)(68736007)(102836004)(86362001)(575784001)(6916009)(105586002)(97736004)(6116002)(7736002)(966005)(9686003)(6306002)(106356001)(14454004)(3846002)(81166006)(8676002)(229853002)(81156014)(6436002)(305945005)(5250100002)(99286004)(5660300001)(74316002)(66066001)(54906003)(55016002)(53936002)(76176011)(256004)(8936002)(33656002)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4306;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: x6roXfgfP14wY1JrajkkjLhje5Ib4egnvEi4xgDBnbOSfMUyu3yv+y8taKld4zTgtgTu+31PdtcweDXpV+VHMj79bqlhrYUrusyaf0VjjWWE8tDhLmcTF3hQwc8Iuk/64otP0J9S2GR687Mpd6TxMcbg0p3G81b6ahJfOlRvM/NRWGdpyWPXYFtWTycQGag6uPQC3BDARiASj0a8AWORKdgsq/zbtRzF94YuV2X8Qtffhwn0PJW7vzs819V9Ix5R6UcB28sYYg7Rm1zBEmdgEhjZhLHPSSF7XFZg4QoJ3zLNAKp9TZIS8DkLz+lgqEwATHIpE5PjcawSgQPdCYCqxDL5KKIDrxl+Sg52p5B+bJU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2c3b39-8953-44a5-170a-08d6327eff2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2018 09:17:14.6966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4306
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> -----Original Message-----
> From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> Sent: Monday, October 15, 2018 3:32 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: linux-clk@vger.kernel.org; sboyd@kernel.org; mturquette@baylibre.com;
> dl-linux-imx <linux-imx@nxp.com>; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; shawnguo@kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
>=20
> On Sun, Oct 14, 2018 at 08:07:56AM +0000, A.s. Dong wrote:
> > +/* Write to the LPCG bits. */
> > +static int clk_gate_scu_enable(struct clk_hw *hw) {
> > +	struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
> > +	u32 reg;
> > +
> > +	if (gate->reg) {
> > +		reg =3D readl(gate->reg);
> > +		reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
> > +		if (gate->hw_gate)
> > +			reg |=3D (CLK_GATE_SCU_LPCG_HW_SEL |
> > +				CLK_GATE_SCU_LPCG_SW_SEL) << gate->bit_idx;
> > +		else
> > +			reg |=3D (CLK_GATE_SCU_LPCG_SW_SEL << gate->bit_idx);
> > +		writel(reg, gate->reg);
> > +	}
>=20
> These register manipulations look like they need locking.
>=20

Unlike the legacy MX6&7 SoCs, each clock has a separate LPCG register.
Do we still need locking?

> > +
> > +	return 0;
> > +}
> > +
> > +struct clk_hw *clk_register_gate_scu(const char *name, const char
> *parent_name,
> > +				     unsigned long flags, u32 rsrc_id,
> > +				     u8 clk_type, void __iomem *reg,
> > +				     u8 bit_idx, bool hw_gate)
> > +{
> > +	struct clk_gate_scu *gate;
> > +	struct clk_init_data init;
> > +	struct clk_hw *hw;
> > +	int ret;
> > +
> > +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> > +	if (!gate)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	gate->rsrc_id =3D rsrc_id;
> > +	gate->clk_type =3D clk_type;
> > +	if (reg) {
> > +		gate->reg =3D ioremap((phys_addr_t)reg, SZ_64K);
>=20
> ioremap never takes a void __iomem * as argument. Given that you have to
> cast it here to another type and to void __iomem * when calling this func=
tion
> is a clear sign that the type of this variable is poorly chosen.
>=20

Good catch. I missed it.
Thanks for pointing it out.
Looks like I should use struct phy_addr_t for it by default.

> > +		if (!gate->reg) {
> > +			kfree(gate);
> > +			return ERR_PTR(-ENOMEM);
> > +		}
> > +	}
> > +
> > +	gate->bit_idx =3D bit_idx;
> > +	gate->hw_gate =3D hw_gate;
> > +
> > +	init.name =3D name;
> > +	init.ops =3D &clk_gate_scu_ops;
> > +	init.flags =3D flags;
> > +	init.parent_names =3D parent_name ? &parent_name : NULL;
> > +	init.num_parents =3D parent_name ? 1 : 0;
> > +
> > +	gate->hw.init =3D &init;
> > +
> > +	hw =3D &gate->hw;
> > +	ret =3D clk_hw_register(NULL, hw);
> > +	if (ret) {
> > +		iounmap(gate->reg);
>=20
> Is iounmap on a NULL pointer allowed? Otherwise the error path is wrong
> here.
>=20

If gate->reg is NULL, the execution seems can't reach here.
Am I missing something?

Regards
Dong Aisheng

> Sascha
>=20
> --
> Pengutronix e.K.                           |
> |
> Industrial Linux Solutions                 |
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.
> pengutronix.de%2F&amp;data=3D02%7C01%7Caisheng.dong%40nxp.com%7Ca8
> dc9d70c490491d116b08d6327050dc%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C636751855312147344&amp;sdata=3DRkcPJ0TNLnFP%2BBbTh
> VrApN3Z%2B7MRR8%2FxJO1TSnqBv40%3D&amp;reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |
