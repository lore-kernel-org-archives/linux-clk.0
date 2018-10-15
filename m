Return-Path: <SRS0=3y70=M3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEF4C71132
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 15:30:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25C452089E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 15:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="j3WE6HJI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25C452089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbeJOXQf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Oct 2018 19:16:35 -0400
Received: from mail-eopbgr10082.outbound.protection.outlook.com ([40.107.1.82]:37568
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726422AbeJOXQf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 15 Oct 2018 19:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjkuogevDFu6nnc8MYSDgl+B0fUvv5DxfBd9we1xJbo=;
 b=j3WE6HJIXvW/o9mkVIAumt/F1tSallTaMzk2fDgYF6yQzVWeH0v2gOooQOTgvezHL+odr9HFBqq3/984l/EaxR1CmrHuWkMru/iz2ucK6HxGwNWgUDqTqCLnGf31vfX1bSsBwwcGURf9EO1ch6DKQLU3G8bdIR31cr+UTbi4q+4=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4577.eurprd04.prod.outlook.com (52.135.149.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Mon, 15 Oct 2018 15:30:45 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Mon, 15 Oct 2018
 15:30:45 +0000
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
Thread-Index: AQHUY5UDa12Huho8BEyIYtM4b8PGa6Uf6y+AgAAZoyCAAA3sAIAAOofA
Date:   Mon, 15 Oct 2018 15:30:45 +0000
Message-ID: <AM0PR04MB42111FD6D3542E12250E556880FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
 <1539504194-28289-6-git-send-email-aisheng.dong@nxp.com>
 <20181015073207.66npcgegibl2rybb@pengutronix.de>
 <AM0PR04MB4211129386C9088C6AFEDAF580FD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181015095342.kjokajxyugugbtcw@pengutronix.de>
In-Reply-To: <20181015095342.kjokajxyugugbtcw@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [116.237.60.178]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4577;6:y9MMAGW2BJdP0ZnXjZaB8ezkgJ5ykUSGGnaoCcDTcORIrSjCFmp7Rf6AYv+jzA04dMUSb1f172oLHY/0b5zbiykwDExJnWosU8N6Gqx8b2glqWg7NerShKQpU0KJIt0lsWtJgxePxwVGzH2hoRXkCrVouRLaDCLjzQV4MRSDGuSA6I19ps5wmWSwYEAh6KqjkTO4QgeGArJBGSiNUNCZn2iwePPr3FJggFPzYILReWyYKWIJX4GG9XJgs12UJzGQUf0ejZdoAdaeDlwtTvUguScDFv4HhZQrUuWZbPIW1WTgYAtO+FlRNdB62z2ZC25BZEit2x7Nlr4qdshs6azxTQcSz3wY71TWlpmWb97pzl1wzUESop1Lgk2IpBcIBcHzrrAhexb+7hnnVpMJ3/egGtdwiPiflP1oRE+6uaacmefP4dL/KBr69nPSC4mY0T1YJs+FFIU7cGpALoXKlcN7dw==;5:Fo0WEZdCoJiIXAQS6sCWWF2TvYrc3V6Dkqi2MHIH1ayV4MDBawo3T1Yyg6bs9g4zz0fWPcPuHqNH3jE76U1ORBaw8GIvali62XAKSVQ0kYHOozkhPaJWRDVgSBfm9/CB2FkW6wnI3GRm/9A3NrnDkZXGi/f956F6ATzPh/2WDNg=;7:u8Q8FvqQKYmdfs2uaNq9pbWSUW0RPQ1wtb6Hd3K2J+sQodeiihfv/03rjpVSVukEP1dKt4Xy3/RxLTJv5pG13/MHBhbWtixO/WLxQygCzmEpUozBg14kx4D3x8QfZKvMGUn94yglrLrl7YwCn4X2Kt/lcc89GiNv4gr8V9am9ZYOzTmiFQ6qRLrh3kDRyNUrmWJENQre27+oLeDxWk2v53M8ENJDFS93VUPqYv5hM+37IsPb+rQV5q/oVmJ752ZW
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 1d91172b-2f46-4963-5cc6-08d632b32cf7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4577;
x-ms-traffictypediagnostic: AM0PR04MB4577:
x-microsoft-antispam-prvs: <AM0PR04MB45776CE25FD0AD88F0A6A52080FD0@AM0PR04MB4577.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(9452136761055)(258649278758335)(84791874153150)(45079756050767)(189930954265078)(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(4982022)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);SRVR:AM0PR04MB4577;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4577;
x-forefront-prvs: 0826B2F01B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(39860400002)(346002)(396003)(136003)(189003)(199004)(13464003)(68736007)(316002)(5250100002)(71190400001)(99286004)(305945005)(7736002)(74316002)(71200400001)(105586002)(81156014)(81166006)(93886005)(6116002)(106356001)(3846002)(8936002)(97736004)(8676002)(33656002)(2900100001)(66066001)(102836004)(5660300001)(9686003)(186003)(53936002)(6436002)(966005)(14454004)(26005)(478600001)(76176011)(6306002)(229853002)(7696005)(55016002)(25786009)(6246003)(2906002)(4326008)(6506007)(14444005)(256004)(53546011)(86362001)(575784001)(45080400002)(486006)(54906003)(446003)(11346002)(476003)(6916009);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4577;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ro3qLZb+cEPoT02KCizGVAhMNMFF+VZSSBr+IWsZS36mfBLCFshrb45nGRZm95MvuGz8qEpamH82IdBOaz78GIyzDhklhSd2VYa2Aq5yJXpb19oqEuY3lapvpLz6ZzRsvSJz05p7eRPaF0nuay08RpdbYanLAKfRJV4Z2zwoWzs85w4hkfoHHVugIgGGQFA81Ptl1CNqW6MoUD7IuX+P//GRgWlaMpXRn6Q0jW7Ba6mgLMr6jgkZXgNExPXVYbBaUXOuQGwlzOfqVasrWXBJWRKoYcJ0MKrIi5o8VpMF5WYuSfYAETbxOwcSrpY9h6UUTDMu7NybWJRxNFD1vCOynFPVKloQyYe4IfMsKa8UyLQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d91172b-2f46-4963-5cc6-08d632b32cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2018 15:30:45.3856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4577
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> -----Original Message-----
> From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> Sent: Monday, October 15, 2018 5:54 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: linux-clk@vger.kernel.org; sboyd@kernel.org; mturquette@baylibre.com;
> dl-linux-imx <linux-imx@nxp.com>; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; shawnguo@kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
>=20
> On Mon, Oct 15, 2018 at 09:17:14AM +0000, A.s. Dong wrote:
> > > -----Original Message-----
> > > From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> > > Sent: Monday, October 15, 2018 3:32 PM
> > > To: A.s. Dong <aisheng.dong@nxp.com>
> > > Cc: linux-clk@vger.kernel.org; sboyd@kernel.org;
> > > mturquette@baylibre.com; dl-linux-imx <linux-imx@nxp.com>;
> > > kernel@pengutronix.de; Fabio Estevam <fabio.estevam@nxp.com>;
> > > shawnguo@kernel.org; linux-arm-kernel@lists.infradead.org
> > > Subject: Re: [PATCH V4 05/11] clk: imx: scu: add scu clock gate
> > >
> > > On Sun, Oct 14, 2018 at 08:07:56AM +0000, A.s. Dong wrote:
> > > > +/* Write to the LPCG bits. */
> > > > +static int clk_gate_scu_enable(struct clk_hw *hw) {
> > > > +	struct clk_gate_scu *gate =3D to_clk_gate_scu(hw);
> > > > +	u32 reg;
> > > > +
> > > > +	if (gate->reg) {
> > > > +		reg =3D readl(gate->reg);
> > > > +		reg &=3D ~(CLK_GATE_SCU_LPCG_MASK << gate->bit_idx);
> > > > +		if (gate->hw_gate)
> > > > +			reg |=3D (CLK_GATE_SCU_LPCG_HW_SEL |
> > > > +				CLK_GATE_SCU_LPCG_SW_SEL) << gate->bit_idx;
> > > > +		else
> > > > +			reg |=3D (CLK_GATE_SCU_LPCG_SW_SEL << gate->bit_idx);
> > > > +		writel(reg, gate->reg);
> > > > +	}
> > >
> > > These register manipulations look like they need locking.
> > >
> >
> > Unlike the legacy MX6&7 SoCs, each clock has a separate LPCG register.
> > Do we still need locking?
>=20
> Let's take PWM_0_LPCG as an example:
>=20
> +       clks[IMX8QXP_LSIO_PWM0_IPG_S_CLK]       =3D
> imx_clk_gate_scu("pwm_0_ipg_s_clk", "pwm_0_div", IMX_SC_R_PWM_0,
> IMX_SC_PM_CLK_PER, (void __iomem *)(PWM_0_LPCG), 0x10, 0);
> +       clks[IMX8QXP_LSIO_PWM0_IPG_SLV_CLK]     =3D
> imx_clk_gate_scu("pwm_0_ipg_slv_clk", "pwm_0_ipg_s_clk",
> IMX_SC_R_PWM_0, IMX_SC_PM_CLK_PER, (void __iomem *)(PWM_0_LPCG),
> 0x14, 0);
> +       clks[IMX8QXP_LSIO_PWM0_IPG_MSTR_CLK]    =3D
> imx_clk_gate2_scu("pwm_0_ipg_mstr_clk", "lsio_bus_clk_root", (void
> __iomem *)(PWM_0_LPCG), 0x18, 0);
> +       clks[IMX8QXP_LSIO_PWM0_HF_CLK]          =3D
> imx_clk_gate_scu("pwm_0_hf_clk", "pwm_0_ipg_slv_clk", IMX_SC_R_PWM_0,
> IMX_SC_PM_CLK_PER, (void __iomem *)(PWM_0_LPCG), 4, 0);
> +       clks[IMX8QXP_LSIO_PWM0_CLK]             =3D
> imx_clk_gate_scu("pwm_0_clk", "pwm_0_ipg_slv_clk", IMX_SC_R_PWM_0,
> IMX_SC_PM_CLK_PER, (void __iomem *)(PWM_0_LPCG), 0, 0);
>=20
> This register is used in five different clocks.
>=20

Good catch.
BTW, it seems for the same clk group, we may still not need lock
as the clock framework already defined the global enable/disable lock
for the same group.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/driver-api/clk.rst
" Drivers don't need to manually protect resources shared between the opera=
tions
of one group, regardless of whether those resources are shared by multiple
clocks or not. However, access to resources that are shared between operati=
ons
of the two groups needs to be protected by the drivers."

Do you think it's okay to drop it?

Regards
Dong Aisheng

> >
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +struct clk_hw *clk_register_gate_scu(const char *name, const char
> > > *parent_name,
> > > > +				     unsigned long flags, u32 rsrc_id,
> > > > +				     u8 clk_type, void __iomem *reg,
> > > > +				     u8 bit_idx, bool hw_gate) {
> > > > +	struct clk_gate_scu *gate;
> > > > +	struct clk_init_data init;
> > > > +	struct clk_hw *hw;
> > > > +	int ret;
> > > > +
> > > > +	gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> > > > +	if (!gate)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	gate->rsrc_id =3D rsrc_id;
> > > > +	gate->clk_type =3D clk_type;
> > > > +	if (reg) {
> > > > +		gate->reg =3D ioremap((phys_addr_t)reg, SZ_64K);
> > >
> > > ioremap never takes a void __iomem * as argument. Given that you
> > > have to cast it here to another type and to void __iomem * when
> > > calling this function is a clear sign that the type of this variable =
is poorly
> chosen.
> > >
> >
> > Good catch. I missed it.
> > Thanks for pointing it out.
> > Looks like I should use struct phy_addr_t for it by default.
> >
> > > > +		if (!gate->reg) {
> > > > +			kfree(gate);
> > > > +			return ERR_PTR(-ENOMEM);
> > > > +		}
> > > > +	}
> > > > +
> > > > +	gate->bit_idx =3D bit_idx;
> > > > +	gate->hw_gate =3D hw_gate;
> > > > +
> > > > +	init.name =3D name;
> > > > +	init.ops =3D &clk_gate_scu_ops;
> > > > +	init.flags =3D flags;
> > > > +	init.parent_names =3D parent_name ? &parent_name : NULL;
> > > > +	init.num_parents =3D parent_name ? 1 : 0;
> > > > +
> > > > +	gate->hw.init =3D &init;
> > > > +
> > > > +	hw =3D &gate->hw;
> > > > +	ret =3D clk_hw_register(NULL, hw);
> > > > +	if (ret) {
> > > > +		iounmap(gate->reg);
> > >
> > > Is iounmap on a NULL pointer allowed? Otherwise the error path is
> > > wrong here.
> > >
> >
> > If gate->reg is NULL, the execution seems can't reach here.
> > Am I missing something?
>=20
> Yes. gate->reg is only valid when the input parameter reg in non NULL.
>=20
> Sascha
>=20
>=20
> --
> Pengutronix e.K.                           |
> |
> Industrial Linux Solutions                 |
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.
> pengutronix.de%2F&amp;data=3D02%7C01%7Caisheng.dong%40nxp.com%7C11
> c8f62f729749de7b8708d63284183f%7C686ea1d3bc2b4c6fa92cd99c5c30163
> 5%7C0%7C0%7C636751940255777834&amp;sdata=3DtsICGc0z9Rcfgu4YcKWy5
> hu8sFHXeRYSy3lP8CjtxO8%3D&amp;reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |
