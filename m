Return-Path: <SRS0=0MvX=WI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59E9C31E40
	for <linux-clk@archiver.kernel.org>; Mon, 12 Aug 2019 15:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9882F214C6
	for <linux-clk@archiver.kernel.org>; Mon, 12 Aug 2019 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565625294;
	bh=GqbIVxc3IQ9SeU60mFNZIC6Nb287EK7LtdRjU/Ufx7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LKaID1gh2jFtgdLqkscrtVu9ngw+FNZzplB0j4mRCZn/7j24GPmFcW4xAO84PHoZ+
	 Azw2xGCngUCIDRcSKvzYRnmUbfoFgUGyTkhwNrjDn7NcGZJyFDgTE1KNjvIbKMTKY8
	 QkVYDDMb7kyUkTrwGVXC6ocmNs6ESJhfhtPvPUgM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfHLPyy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Aug 2019 11:54:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:53034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfHLPyy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Aug 2019 11:54:54 -0400
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02F5B20820;
        Mon, 12 Aug 2019 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565625293;
        bh=GqbIVxc3IQ9SeU60mFNZIC6Nb287EK7LtdRjU/Ufx7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FLw9OfRUlzvUhEmRtEKfgvMkxE0PeWjjuY+1TQMisiwwx+YRhJ5AiokPZ1ZnOmMVS
         /jV7XfO9GrRel6gy1O0jcCgWqAWnIAhhZaR6CsIoLY1b0vpErRfQ6NjeHDOMZrLiij
         5HKbpaw3tryoGqsBC8WqkuO+z+XQEKAdz/gI+ELE=
Date:   Mon, 12 Aug 2019 17:54:42 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     Dong Aisheng <dongas86@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Message-ID: <20190812155440.GA12237@X250>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
 <20190803135048.GL8870@X250.getinternet.no>
 <CAA+hA=TVv8m2GZr0W-u+S6XzJUCYrFDF95iyUGyAsbYMwatyZg@mail.gmail.com>
 <20190812130041.GD27041@X250>
 <AM0PR04MB42117575E82B4B762FE2143880D30@AM0PR04MB4211.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42117575E82B4B762FE2143880D30@AM0PR04MB4211.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 12, 2019 at 02:41:55PM +0000, Aisheng Dong wrote:
> > From: Shawn Guo <shawnguo@kernel.org>
> > Sent: Monday, August 12, 2019 9:01 PM 
> > On Mon, Aug 05, 2019 at 11:27:20AM +0800, Dong Aisheng wrote:
> > > > > +- compatible:                Should be one of:
> > > > > +                       "fsl,imx8qxp-lpcg"
> > > > > +                       "fsl,imx8qm-lpcg" followed by
> > "fsl,imx8qxp-lpcg".
> > > > > +- reg:                       Address and length of the register set.
> > > > > +- #clock-cells:              Should be 1. One LPCG supports multiple
> > clocks.
> > > > > +- clocks:            Input parent clocks phandle array for each clock.
> > > > > +- bit-offset:                An integer array indicating the bit offset
> > for each clock.
> > > >
> > > > I guess that the driver should be able to figure bit offset from
> > > > 'clock-indices' property.
> > > >
> > >
> > > Yes, it can be done in theory.
> > > Then the binding may look like:
> > > sdhc0_lpcg: clock-controller@5b200000 {
> > >         ...
> > >         #clock-cells = <1>;
> > >         clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
> > >                  <&conn_ipg_clk>, <&conn_axi_clk>;
> > >         clock-indices = <0>, <16>, <20>;
> > >         clock-output-names = "sdhc0_lpcg_per_clk",
> > >                              "sdhc0_lpcg_ipg_clk",
> > >                              "sdhc0_lpcg_ahb_clk";
> > >         power-domains = <&pd IMX_SC_R_SDHC_0>; };
> > >
> > > usdhc1: mmc@5b010000 {
> > >         ...
> > >         clocks = <&sdhc0_lpcg 16>,
> > >                  <&sdhc0_lpcg 0>,
> > >                  <&sdhc0_lpcg 20>;
> > >         clock-names = "ipg", "per", "ahb"; };
> > >
> > > However, after trying, i found  one limitation if using clock-indices
> > > that users have to do a secondary search for the indices value from
> > > clock names which is not very friendly.
> > >
> > > Formerly from the clock output names, user can easily get the clock
> > > index as they're in fixed orders as output names, so very easily to
> > > use.
> > > e.g.
> > > clocks = <&sdhc0_lpcg 1>,
> > >          <&sdhc0_lpcg 0>,
> > >          <&sdhc0_lpcg 2>;
> > >
> > > If using clock-indices, users have no way to know it's clock index
> > > from clock output names order unless they do a secondary search from
> > > the clock-indice array accordingly.
> > > For example, for "sdhc0_lpcg_ahb_clk", user can easily know its
> > > reference is <&sdhc0_lpcg 2>.
> > > But if using clock-indice, we need search clock-indices array to find
> > > its reference becomes <&sdhc0_lpcg 20>. So this seems like a drawback
> > > if using clock-indices.
> > 
> > Shouldn't we have constant macro defined for those numbers, so that both
> > 'clock-indices' and 'clocks' of client device can use?
> > 
> 
> I think we can do it.
> Does below one look ok to you?
> #define IMX_LPCG_ CLK_0	0
> #define IMX_LPCG_ CLK_1	4
> #define IMX_LPCG_ CLK_2	8
> #define IMX_LPCG_ CLK_3	12
> #define IMX_LPCG_ CLK_4	16
> #define IMX_LPCG_ CLK_5	20
> #define IMX_LPCG_ CLK_6	24
> #define IMX_LPCG_ CLK_7	28

Looks fine to me, except the space in the middle of macro name, which
compiler will complain anyway :)

Shawn

> 
> The usage will look like:
> <&sdhc0_lpcg IMX_LPCG_CLK_5>
