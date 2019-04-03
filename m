Return-Path: <SRS0=fESv=SF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDC2C10F0B
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 09:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 808FE21473
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 09:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="FQhMN//2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfDCJcK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:32:10 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35994 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbfDCJcJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Apr 2019 05:32:09 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E5C4025AD6C;
        Wed,  3 Apr 2019 20:32:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554283928; bh=zFhPSrrsHYmP0uY0sJYnD3RpalcG1S/o012vEEn/L1c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FQhMN//2e6Z+h3BpfTHgQwBA/wa1UDkgXL9k3PbuYw6ZI7x+mUW7GkbztP1PvucgW
         xQukSOhmv+HEKIYyalpg2zR1aRrjMQESlk2auHNqkGc3ngO5npMEwqQuw+AgtDkBuc
         lgV5IPBoeLAmdIqNgewSZLolX+SXX62TC3jHKjZk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 06513940361; Wed,  3 Apr 2019 11:32:05 +0200 (CEST)
Date:   Wed, 3 Apr 2019 11:32:05 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2] clk: renesas: rcar-gen3: Fix
 cpg_sd_clock_round_rate() return value
Message-ID: <20190403093205.bhdjpvicuo5vqsgl@verge.net.au>
References: <20190402070856.28066-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190402070856.28066-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 02, 2019 at 09:08:56AM +0200, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> cpg_sd_clock_round_rate() may return an unsupported clock rate for the
> requested clock rate. Therefore, when cpg_sd_clock_set_rate() sets the
> clock rate acquired by cpg_sd_clock_round_rate(), an error may occur.
> 
> This is not conform the clk API design.
> 
> This patch fixes that by making sure cpg_sd_clock_calc_div() considers
> only the division values defined in cpg_sd_div_table[].
> With this fix, the cpg_sd_clock_round_rate() always return a support
> clock rate.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 90c073e53909da85 ("clk: shmobile: r8a7795: Add SD divider support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Use "<" instead of "<=" to use first match (doesn't matter, though,
>     but is more aligned with the behavior of cpg_sd_clock_calc_div()),
>   - Keep best_div instead of best_rate, to avoid extra
>     DIV_ROUND_CLOSEST().

Thanks for the updates.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
