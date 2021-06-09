Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42148C48BCF
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 18:58:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 294CE613DF
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jun 2021 18:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFITAO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jun 2021 15:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:57960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230322AbhFITAN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jun 2021 15:00:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B808661364;
        Wed,  9 Jun 2021 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623265098;
        bh=qtjtATardZ5xIYBHfA2mW9faGPKEIDRJz1pkCsMJ0ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EpqPIfFbt7w+6SU77Za/ovI2M97mgMz+4gPjPllmFYRaunnt6HjQV303U4uBjLiqm
         soVEW9Hm8WgTMMi/R2RaBwcF+NEm1e2VhSv0iuMX/UmPrl60PczdM5osleUyzGelWb
         EknLh5mDHy+GfI/PtQsLBXaGJf11aPzRK+meBtVc=
Date:   Wed, 9 Jun 2021 20:58:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: agilex/stratix10: add support for the 2nd bypass
Message-ID: <YMEPSEs/V2XkWVm8@kroah.com>
References: <20210609185008.36056-1-dinguyen@kernel.org>
 <20210609185008.36056-3-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609185008.36056-3-dinguyen@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 09, 2021 at 01:50:07PM -0500, Dinh Nguyen wrote:
> The EMAC clocks on Stratix10/Agilex/N5X have an additional bypass that
> was not being accounted for. The bypass selects between
> emaca_clk/emacb_clk and boot_clk.
> 
> Because the bypass register offset is different between Stratix10 and
> Agilex/N5X, it's best to create a new function to calculate the bypass.
> 
> Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the Agilex platform")
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  drivers/clk/socfpga/clk-agilex.c    |   4 +-
>  drivers/clk/socfpga/clk-gate-s10.c  | 119 +++++++++++++++++++++++++++-
>  drivers/clk/socfpga/stratix10-clk.h |   2 +
>  3 files changed, 123 insertions(+), 2 deletions(-)


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
