Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9C3C4361B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 02:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FD58230FA
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 02:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgLPCiD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Dec 2020 21:38:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:48858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgLPCiC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Dec 2020 21:38:02 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608086242;
        bh=fgUIX683y61CzkSVIWm4+Ymn8j77Nunxl/6XsSSe7u8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lvJxuSl2pY7IrP7ovn5lgzQqmuuywihX3YCN29W5HljoOCjwJrCxHdVJ1nIdcT3GF
         Ed6wf4z6raLI9ROjEeSqt9C3jjoy+qZ1/7xLraTB+p+YIbNnaQvd1UYyLyyxD3O4pn
         lr+GtebsxciU3wDA3KU3NOzY3h8tTCU+RrCebPx8fJqduv/6Y435wqqyFZIMgIeb+C
         NPirmsol8dyNv1TxVMUbDsWrnX+1sYPx2fj/S4SiJkxzvCmjm+djZjed4Di887och+
         LDQU4x1oXz91b7hQ+9/yddlozun91jNzWgF7xoKQitqN/gufQRqE+97L3bw8tQoA9u
         pqizAl8slxuDA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201215115632.GB23407@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de> <160783860077.1580929.7577989890301235621@swboyd.mtv.corp.google.com> <20201215115632.GB23407@pengutronix.de>
Subject: Re: [PATCH 00/12] soc: xilinx: vcu: Convert driver to clock provider
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, rajanv@xilinx.com, tejasp@xilinx.com,
        dshah@xilinx.com, rvisaval@xilinx.com, michals@xilinx.com,
        kernel@pengutronix.de, robh+dt@kernel.org, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>
Date:   Tue, 15 Dec 2020 18:37:20 -0800
Message-ID: <160808624070.1580929.14530755991373122337@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2020-12-15 03:56:32)
> On Sat, 12 Dec 2020 21:50:00 -0800, Stephen Boyd wrote:
> > Quoting Michael Tretter (2020-11-15 23:55:20)
> > > Hello,
> > >=20
> > > the xlnx_vcu soc driver is actually a clock provider of a PLL and fou=
r output
> > > clocks created from the PLL via dividers.
> > >=20
> > > This series reworks the xlnx_vcu driver to use the common clock frame=
work to
> > > enable other drivers to use the clocks. I originally posted a series =
to expose
> > > the output clocks as fixed clocks [0]. This series now implements the=
 full
> > > tree from the PLL to the output clocks. Therefore, I am sending a sep=
arate
> > > series that focuses on the clocks, but it depends on v4 of the previo=
us series
> > > [1].
> >=20
> > After this series is this anything besides a clk provider? If it's only
> > providing clks it would make sense to move the driver into drivers/clk/
> >=20
>=20
> 1. The driver is also responsible for resetting the entire VCU (the
> VCU_GASKET_INIT register). This isn't something that an individual encode=
r or
> decoder driver should be doing. However, other clock drivers also impleme=
nt a
> reset controller.

Right.

>=20
> 2. There are several registers for AXI performance monitoring in the VCU
> System-Level Control register space. Right now, these are not used by the
> driver and I have no plans to actually use them, but this might be an arg=
ument
> against the move.

I suppose if/when that happens we can have a small parent driver that
probes the compatible string and makes two child platform devices, one
for the clk part and one for the PMU? That would let us keep the code in
drivers/clk/ for ease of find-ability. This assumes that the PMU
registers don't overlap with the clk/reset registers. We usually put the
clk and reset controllers together if they use the same registers and
need to make sure the frameworks don't stomp on each other.

>=20
> I think it is OK to move the driver to drivers/clk/, but I don't have a s=
trong
> opinion about it.
>=20

Ok. I'm not too strong on it either, but drivers/soc/ is sort of a
dumping ground for random soc things. I'm not looking at it closely but
if the driver is in drivers/clk/ I'd be more inclined to look after the
clk bits.
