Return-Path: <SRS0=0MvX=WI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A260C31E40
	for <linux-clk@archiver.kernel.org>; Mon, 12 Aug 2019 13:00:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38B9820842
	for <linux-clk@archiver.kernel.org>; Mon, 12 Aug 2019 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565614855;
	bh=l/NqOpnPspQILd59aflIt0y7cwwaNcRzRIKE008vYdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=euptyz47TFsnwTTS/BeF6E6EVmaWDNcPqdwd3m3UjlFzOvpqHmsvq/xraOlmTQo71
	 CHL1NAqUaeycE5EeBSG+BkNMZSxW3BtPsUcz9irZIUEYVF7HHRQ0m2TBqIkCJxgs61
	 N3+IVt4ZYugPpWJrHSl32AB4fvUiGXX8o2j/q5ZU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfHLNAz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Aug 2019 09:00:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:48904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbfHLNAy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Aug 2019 09:00:54 -0400
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1FD820679;
        Mon, 12 Aug 2019 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565614853;
        bh=l/NqOpnPspQILd59aflIt0y7cwwaNcRzRIKE008vYdE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KqmyQ80VsIog146wi5cUzn2HG5COlNTsugile1trKaBUTE2JqEsWoT8fhHtTd8rD/
         wSgba7byZOeiNK/R1FW/vZhMx3UpTUNaALg6UPMTQEhk0V4X8rQZ8DBs33LAdFCzTK
         YJahHd8dX/xdrh0KKFcGJgG20kN5ixX6YkBdLVas=
Date:   Mon, 12 Aug 2019 15:00:43 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dong Aisheng <dongas86@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, sboyd@kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Message-ID: <20190812130041.GD27041@X250>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
 <20190803135048.GL8870@X250.getinternet.no>
 <CAA+hA=TVv8m2GZr0W-u+S6XzJUCYrFDF95iyUGyAsbYMwatyZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+hA=TVv8m2GZr0W-u+S6XzJUCYrFDF95iyUGyAsbYMwatyZg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 05, 2019 at 11:27:20AM +0800, Dong Aisheng wrote:
> > > +- compatible:                Should be one of:
> > > +                       "fsl,imx8qxp-lpcg"
> > > +                       "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg".
> > > +- reg:                       Address and length of the register set.
> > > +- #clock-cells:              Should be 1. One LPCG supports multiple clocks.
> > > +- clocks:            Input parent clocks phandle array for each clock.
> > > +- bit-offset:                An integer array indicating the bit offset for each clock.
> >
> > I guess that the driver should be able to figure bit offset from
> > 'clock-indices' property.
> >
> 
> Yes, it can be done in theory.
> Then the binding may look like:
> sdhc0_lpcg: clock-controller@5b200000 {
>         ...
>         #clock-cells = <1>;
>         clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
>                  <&conn_ipg_clk>, <&conn_axi_clk>;
>         clock-indices = <0>, <16>, <20>;
>         clock-output-names = "sdhc0_lpcg_per_clk",
>                              "sdhc0_lpcg_ipg_clk",
>                              "sdhc0_lpcg_ahb_clk";
>         power-domains = <&pd IMX_SC_R_SDHC_0>;
> };
> 
> usdhc1: mmc@5b010000 {
>         ...
>         clocks = <&sdhc0_lpcg 16>,
>                  <&sdhc0_lpcg 0>,
>                  <&sdhc0_lpcg 20>;
>         clock-names = "ipg", "per", "ahb";
> };
> 
> However, after trying, i found  one limitation if using clock-indices
> that users have to do a secondary search for the indices value from clock names
> which is not very friendly.
> 
> Formerly from the clock output names, user can easily get the clock
> index as they're
> in fixed orders as output names, so very easily to use.
> e.g.
> clocks = <&sdhc0_lpcg 1>,
>          <&sdhc0_lpcg 0>,
>          <&sdhc0_lpcg 2>;
> 
> If using clock-indices, users have no way to know it's clock index
> from clock output names order
> unless they do a secondary search from the clock-indice array accordingly.
> For example, for "sdhc0_lpcg_ahb_clk", user can easily know its
> reference is <&sdhc0_lpcg 2>.
> But if using clock-indice, we need search clock-indices array to find
> its reference
> becomes <&sdhc0_lpcg 20>. So this seems like a drawback if using clock-indices.

Shouldn't we have constant macro defined for those numbers, so that both
'clock-indices' and 'clocks' of client device can use?

> 
> Therefore, personally i'm still a bit intend to the original way which
> is more simple and
> straightforward from user point of view, unless there's a strong
> objections on define another
> vendor private property.
> 
> Shawn,
> How do you think?
> Should we enforce the complexity to users?
> 
> > > +- hw-autogate:               Boolean array indicating whether supports HW autogate for
> > > +                     each clock.
> >
> > Not sure why it needs to be a property in DT.  Or asking it different
> > way, when it should be true and when false?
> >
> 
> It is one LPCG feature.
> For some specific device LPCGs, it may support clock auto gating. (depends on
> IP's capability. e.g. uSDHC).
> So we define this feature in DT as well in case if user may want to
> use it in the future.
> 
> But AFAIK, there's still no one using it. Most drivers reply on runtime PM to do
> clock management. Did not use LPCG auto gate off feature.
> But the current LPCG driver API does support this parameter.
> 
> If you think it's unnecessary to define it in DT as there're still no
> users, i can remove it
> and disabling autogate in driver by default.

I would suggest to drop it then.

Shawn
