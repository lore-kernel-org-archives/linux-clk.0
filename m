Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50066C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 00:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1620020989
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 00:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Vgcd59Jz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfCSA4g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Mar 2019 20:56:36 -0400
Received: from mail-eopbgr790049.outbound.protection.outlook.com ([40.107.79.49]:4176
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726326AbfCSA4g (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Mar 2019 20:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxbNIIRiHX9i5bRF2jluJJV7FuKv47a41V96iloFmg8=;
 b=Vgcd59Jzbn4rg1IxX0dJSl5twGiFmJKQObsp/zEpOH+99KZw0dcarNnVDeJfgw6CCVH/uHby+wRd9uJAHC4JBka3j/cbrCRFqJ1rNINeb3FzN9T9CsHdhBI2g8TOqFSAMFxjRWKrxtcZBp3Fa/TwTUXdPUiyKFQdxpRJzw+q3dE=
Received: from BYAPR02MB5992.namprd02.prod.outlook.com (20.179.89.80) by
 BYAPR02MB4967.namprd02.prod.outlook.com (52.135.234.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Tue, 19 Mar 2019 00:56:32 +0000
Received: from BYAPR02MB5992.namprd02.prod.outlook.com
 ([fe80::911c:eb9a:23e7:1da8]) by BYAPR02MB5992.namprd02.prod.outlook.com
 ([fe80::911c:eb9a:23e7:1da8%2]) with mapi id 15.20.1709.015; Tue, 19 Mar 2019
 00:56:32 +0000
From:   Jolly Shah <JOLLYS@xilinx.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michals@xilinx.com>
Subject: RE: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
Thread-Topic: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
Thread-Index: AQHU2MLP3LcWV07VTUS26X81SlwhL6YINY+AgAAKLACAAYEYAIABEEgAgAdaIQA=
Date:   Tue, 19 Mar 2019 00:56:31 +0000
Message-ID: <BYAPR02MB59921A729FAD12C5B4143D09B8400@BYAPR02MB5992.namprd02.prod.outlook.com>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
        <20190312110016.29174-2-m.tretter@pengutronix.de>
        <155240936160.20095.7716704029189456788@swboyd.mtv.corp.google.com>
        <20190312182546.24e46c5c@litschi.hi.pengutronix.de>
        <155249424471.20095.16028115604342624987@swboyd.mtv.corp.google.com>
 <20190314093836.6a70abc7@litschi.hi.pengutronix.de>
In-Reply-To: <20190314093836.6a70abc7@litschi.hi.pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JOLLYS@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edf91d43-a0eb-499a-1333-08d6ac05ba5a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:BYAPR02MB4967;
x-ms-traffictypediagnostic: BYAPR02MB4967:
x-microsoft-antispam-prvs: <BYAPR02MB4967FD566983CFE6D58526B3B8400@BYAPR02MB4967.namprd02.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(376002)(396003)(136003)(346002)(39860400002)(366004)(13464003)(199004)(189003)(478600001)(316002)(186003)(14454004)(76176011)(54906003)(97736004)(106356001)(110136005)(107886003)(102836004)(2906002)(26005)(53546011)(99286004)(105586002)(8936002)(4326008)(72206003)(25786009)(6506007)(6246003)(305945005)(68736007)(74316002)(66066001)(7736002)(7696005)(71200400001)(71190400001)(52536014)(93886005)(86362001)(55016002)(6436002)(256004)(14444005)(81166006)(8676002)(229853002)(9686003)(6116002)(3846002)(53936002)(81156014)(33656002)(446003)(11346002)(5660300002)(476003)(486006)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4967;H:BYAPR02MB5992.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ah6HX6a2rdbRQNa0GDFuIBv6cd0RIFiNy785cD0qYqOUH/ai0DmBfbNTo57u8ajk8KMJjNB3jZEP1hU280zqAu3gkNo8ntg9KO2iYxgoVPRb5NRteUNbNRL05DhyPrzOxJx1dWzy4FDmC4M37ind0RtzxfNki82uAH99R2N44MUUcxXI0YZzDBsjqP+0fOlrgfG/qHzx0T7uEvA6D+r4hDnnzIQKUwNiR1DMqWB4dN/7ywfj8iByzQGu8+/3pm2kScdHF6PU/KJIo2KIPlUtRWfp2HQK2bMZn3ObtWy/WyqEmawUcUpLQMSI5wbd36sxGv4ORGX7zFHGXPIw5CPl14W72jQHSpIH3l4NnL0T7TdsU9ot64RnSmsa6FeO4M0QmeNkV/yTZSp03BKtTRqCyQx0FtjwxH4FlW9bN1sjMRA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf91d43-a0eb-499a-1333-08d6ac05ba5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 00:56:31.9372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4967
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Michael,


> -----Original Message-----
> From: Michael Tretter <m.tretter@pengutronix.de>
> Sent: Thursday, March 14, 2019 1:39 AM
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-clk@vger.kernel.org;
> kernel@pengutronix.de; Michael Turquette <mturquette@baylibre.com>;
> Michal Simek <michals@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>
> Subject: Re: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
>=20
> On Wed, 13 Mar 2019 09:24:04 -0700, Stephen Boyd wrote:
> > Quoting Michael Tretter (2019-03-12 10:25:46)
> > > On Tue, 12 Mar 2019 09:49:21 -0700, Stephen Boyd wrote:
> > > > Quoting Michael Tretter (2019-03-12 04:00:12)
> > > > > CLK_FRAC is not set in the divider->flags, but in the hw->flags.
> > > > >
> > > > > The firmware sets CLK_FRAC for fractional clocks in the clkflag f=
ield.
> > > > > When registering the devider, these clkflags are copied to hw->fl=
ags.
> > > > >
> > > > > Moreover, divider->flags field is a u8 type, but CLK_FRAG is BIT(=
13). So
> > > > > this check would never work.
> > > > >
> > > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > > ---
> > > > >  drivers/clk/zynqmp/divider.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/di=
vider.c
> > > > > index a371c66e72ef..fc70950c1e24 100644
> > > > > --- a/drivers/clk/zynqmp/divider.c
> > > > > +++ b/drivers/clk/zynqmp/divider.c
> > > > > @@ -117,7 +117,7 @@ static long
> zynqmp_clk_divider_round_rate(struct clk_hw *hw,
> > > > >         bestdiv =3D zynqmp_divider_get_val(*prate, rate);
> > > > >
> > > > >         if ((clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
> > > > > -           (divider->flags & CLK_FRAC))
> > > > > +           (clk_hw_get_flags(hw) & CLK_FRAC))
> > > >
> > > > CLK_FRAC shouldn't be set in the struct clk_hw::core::flags field. =
It's
> > > > not a clk framework flag so it shouldn't go there. Please fix the u=
ser
> > > > of this flag to place the CLK_FRAC flag somewhere else. Even adding=
 it
> > > > into divider::flags is not a good idea because that numberspace is =
for
> > > > dividers, and this flag seems to be zynqmp driver specific, so mayb=
e
> > > > just add a bool to the zynqmp_clk_divider?
> > > >
> > >
> > > Thanks. The driver sets the clk_hw::core::flags based on a response
> > > from the ATF and this response includes this flag with other clk
> > > frameworks flags. I can test for the flag when registering the clock
> > > and set another flag or a bool for the zynqmp_clk_divider and will do
> > > so in v2.
> >
> > Cool. Thanks!
> >
> > >
> > > However, this merely sounds like a workaround for an issue in the ATF=
,
> > > which should not define and use this flag in the first place.
> > >
> >
> > What is ATF doing with these flags? Hopefully ATF and the Linux kernel
> > aren't using the same numberspace to describe these things. For example=
,
> > I would be concerned if ATF was looking at the CLK_SET_RATE_PARENT flag
> > and passing that value from firmware to the kernel, blindly assuming
> > that the kernel wouldn't change those numbers to be something else.
> > Obviously that type of kernel change would be invasive but it's not an
> > ABI that we've ever published so we're free to do these sorts of things=
.
>=20
> You mean that the ATF defines macros like
>=20
> 	#define CLK_SET_RATE_GATE       BIT(0) /* must be gated across rate
> change */
> 	#define CLK_SET_PARENT_GATE     BIT(1) /* must be gated across re-
> parent */
> 	#define CLK_SET_RATE_PARENT     BIT(2) /* propagate rate change up
> one level */
>=20
> in plat/xilinx/zynqmp/pm_service/pm_api_clock.h, sets the flags in the
> response to the Linux driver, and the Linux driver copies the flags
> that it got from the ATF to clk_hw::core::flags like
>=20
> 	init.flags =3D nodes->flag;
>=20
> where nodes is the response from the ATF? That's exactly what is happenin=
g.
>=20
> So instead of only translating CLK_FRAC, the driver should actually
> translate all flags in the ATF response to proper clk framework flags
> instead of blindly copying them, right?

Except CLK_FRAC, all flags are defined same as clk framework. I think we sh=
ould add custom flags field and pass zynqmp specific flags there.

Thanks,
Jolly Shah

>=20
> Michael
