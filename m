Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400B6C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 07:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245342AbiDKH0m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 03:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245362AbiDKH0l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 03:26:41 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4875F26106
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 00:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649661867; x=1681197867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gLVYInG1QIEeMC+HdYt1pmNg/6ITtUK5E9Ju8+MtiyQ=;
  b=nEPONyxTQNAsNzydTAJN8HoV6HsJcPfgGueRVLvD0UmpvCjLdCPd5pTZ
   njV/CEkn9ymxr2YE3xMz8C5Wdpuz2Ca652Z0ueYLsvDNW0KDcqz6oe7FE
   tpeXxhkCs2Lds+1azqduH/EgPbH2SYLrAChknkWOaThOQeJzLGQIw3Ccx
   lPkn25yWH4sKKRkiHSh+HXUIBomKGdrgXLJlM+wOtQ+6/NACWl3GC4MBr
   ogPoAocr+WsFMR8c5/j+TuisHdxmC8NKDFeikzwBKJL88C65fVsM76jUT
   XSRc2NLkyTAiRB/t/PKQ76tgSobjOqu+khHu+IJ4Bfbs9nyRV0DiEGvan
   w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643670000"; 
   d="scan'208";a="23211599"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Apr 2022 09:24:25 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Apr 2022 09:24:25 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Apr 2022 09:24:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649661865; x=1681197865;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gLVYInG1QIEeMC+HdYt1pmNg/6ITtUK5E9Ju8+MtiyQ=;
  b=nsGkZ3Cc/Zi6yXjTrvn43/ZmKe/IlK93aWoGym3NuRy+wwT1JKBXCM/5
   1+HJCq56wCh4SDVY2W/h2j0TU9ChVqhsP9c5asz8PIRpv/wh0kbzsh1ck
   cCDxlfmSLK9Ri/8qML4qlExMh5C8yKMBSA+jZs7E1QPtIAo5DJqqDHsGi
   zeR7bTMuSUAkPl8TSQbxl7qTVMRxQMG9wxSKpvlau0f7kWYQaeLFzCY5v
   gUjsO2Ka73GtRfT7dmylDSxRDTtlr2PavXwdoRQgfwpWcQN8nLjAeKME+
   lQxIJP7nSnlkwHNTXHFRct+YBuHdHj7ZzY+L2zpq4++Gq59BGMMDPs3LI
   w==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643670000"; 
   d="scan'208";a="23211598"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Apr 2022 09:24:25 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 16DF9280070;
        Mon, 11 Apr 2022 09:24:25 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: (EXT) [PATCH 00/22] clk: More clock rate fixes and tests
Date:   Mon, 11 Apr 2022 09:24:22 +0200
Message-ID: <4703993.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <11958147.O9o76ZdvQC@steina-w>
References: <20220408091037.2041955-1-maxime@cerno.tech> <11958147.O9o76ZdvQC@steina-w>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Montag, 11. April 2022, 08:25:31 CEST schrieb Alexander Stein:
> Hello Maxime,
> 
> Am Freitag, 8. April 2022, 11:10:15 CEST schrieb Maxime Ripard:
> > Hi,
> > 
> > Thanks to the feedback I got on the previous series, I found and fixed a
> > number of bugs in the clock framework and how it deals with rates,
> > especially when it comes to orphan clocks.
> > 
> > In order to make sure this doesn't pop up again as a regression, I've
> > extended the number of tests.
> > 
> > The first patch reintroduces the clk_set_rate_range call on clk_put, but
> > this time will only do so if there was a range set on that clock to
> > begin with. It should be less intrusive, and reduce the number of
> > potential side effects considerably.
> > 
> > All the other patches should be probably be flagged as fixes, but
> > they've never seem to have shown any real-world issues until now, and
> > they aren't all really trivial to backport either, so I'm not sure it's
> > worth it.
> > 
> > The last patch will probably prove to be controversial, but it can be
> > left out without affecting the rest of the series. It will affect the
> > meson clock drivers for the g12b SoC at least. It stems from the
> > realisation that on the g12b, 4 PLLs (and thus all their children) have
> > a rate of 0, pretty much forever which feels like a bug considering the
> > rate 0 is used as an error in most places.
> > 
> > Those 4 PLLs have a rate of 0 because meson_clk_pll_recalc_rate will
> > 
> > return 0 if the diviser of the PLL is set to 0 in the register, but:
> >   - pcie_pll_dco has a few registers to initialize set in
> >   
> >     g12a_pcie_pll_dco, but meson_clk_pcie_pll_ops don't set the init
> >     hook and will instead call it in the enable hook. This looks like a
> >     bug and could be easily fixed by adding that init hook.
> >   
> >   - gp0_pll_dco and hifi_pll_dco both don't set any of there n field in
> >   
> >     the initialisation of their register (g12a_gp0_init_regs and
> >     g12a_hifi_init_regs). So if the bootloader doesn't set it, and as
> >     long as set_rate isn't called, that field is going to remain at 0. And
> >     since all but one users don't have CLK_SET_RATE_PARENT, this is
> >     still fairly unlikely.
> >   
> >   - hdmi_pll_dco doesn't set the n field in the initialisation either,
> >   
> >     but also doesn't have a set_rate implementation. Thus, if the
> >     bootloader doesn't set it, this clock and all its children will
> >     always report a rate of 0, even if the clock is functional.
> > 
> > During the discussion with amlogic clock maintainers, we kind of ended
> > up on a disagreement of whether returning 0 was ok or not, hence the
> > expected controversy :)
> > 
> > Let me know what you think,
> > Maxime
> > 
> > Maxime Ripard (22):
> >   clk: Drop the rate range on clk_put()
> >   clk: tests: Add test suites description
> >   clk: tests: Add reference to the orphan mux bug report
> >   clk: tests: Add tests for uncached clock
> >   clk: tests: Add tests for single parent mux
> >   clk: tests: Add tests for mux with multiple parents
> >   clk: tests: Add some tests for orphan with multiple parents
> >   clk: Take into account uncached clocks in clk_set_rate_range()
> >   clk: Fix clk_get_parent() documentation
> >   clk: Set req_rate on reparenting
> >   clk: Skip set_rate_range if our clock is orphan
> >   clk: Add our request boundaries in clk_core_init_rate_req
> >   clk: Change clk_core_init_rate_req prototype
> >   clk: Introduce clk_hw_init_rate_request()
> >   clk: Add missing clk_core_init_rate_req calls
> >   clk: Remove redundant clk_core_init_rate_req() call
> >   clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
> >   clk: Introduce clk_core_has_parent()
> >   clk: Stop forwarding clk_rate_requests to the parent
> >   clk: Zero the clk_rate_request structure
> >   clk: Test the clock pointer in clk_hw_get_name()
> >   clk: Prevent a clock without a rate to register
> >  
> >  drivers/clk/clk.c            |  239 +++++--
> >  drivers/clk/clk_test.c       | 1256 +++++++++++++++++++++++++++++++++-
> >  include/linux/clk-provider.h |    6 +
> >  include/linux/clk.h          |    5 +-
> >  4 files changed, 1439 insertions(+), 67 deletions(-)
> 
> Thanks for another round of patches.
> On top my patchset this one does *not* break my imx8mp based setup. Booting
> is as usual without any changes in dmesg.
> Given this patch set I suspect the other one on github you sent me on
> Thursday is obsolete now.

I have to correct myself here a bit. While using my current board .dts fpr 
imx8mp works with this patchset, things change if I apply Lucas' HDMI patchset 
[1] and enable HDMI devices. In this case I get the following errors:
> hdmi_pclk: recalc_rate returned a null rate
> fsl-samsung-hdmi-phy 32fdff00.phy: error -EINVAL: failed to register clock
> fsl-samsung-hdmi-phy 32fdff00.phy: register clk failed
> fsl-samsung-hdmi-phy: probe of 32fdff00.phy failed with error -22

The offending patch is the last one 'clk: Prevent a clock without a rate to 
register'.

Best regards,
Alexander

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/
20220406160123.1272911-1-l.stach@pengutronix.de/



