Return-Path: <SRS0=3Kxj=UV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A1FC43613
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jun 2019 02:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25FDC2070B
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jun 2019 02:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561169698;
	bh=Gw3/H1gb74X47RvwF/uGMRSSiLRpYocUROtj7YIJTQg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=UyxJjLso1KqYPIzohKeuY06ekMNBSWgYM8tQ7A/F/O87fUudt54ITNUoisVIb24G5
	 iOeShvy45qksPtNWKbFqTljsfJ9j5p9buK0Fyd0IDnxPI1qUvSmmahvF7MN4b8Yeoq
	 1U9P91rlTlKjAf/uNqpOJ95rdBDlMY5lAHasaFRc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbfFVCO5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jun 2019 22:14:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:35332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbfFVCO5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 21 Jun 2019 22:14:57 -0400
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC8AB20881
        for <linux-clk@vger.kernel.org>; Sat, 22 Jun 2019 02:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561169696;
        bh=Gw3/H1gb74X47RvwF/uGMRSSiLRpYocUROtj7YIJTQg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VehpLnHup/AkdWVOKWpqRHTZ5wzoPU2KUaZaLoB8UYKQZyV0VUgPdaYXsO87OR8AC
         7loe/VSVGCebHeTXoMtnOklXOgH1A3Ol0n1uu3C1qyFHmomObt85qGctZ4Y5UitpX0
         nwdD7io4jS5WHomi60BwUN/6pwcvjTMEOxmnaCmI=
Received: by mail-wr1-f49.google.com with SMTP id f9so8194806wre.12
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2019 19:14:55 -0700 (PDT)
X-Gm-Message-State: APjAAAWkKjn6BY6O9Nu8VqDmvs0ZPWBdyJFwbTEOHWeBviahR/lPCUen
        DLnq/ccM9BfclgqHk9XKoFRNcWQ7oKKTP9UA4YY=
X-Google-Smtp-Source: APXvYqwvTIqSCbtB4S32cImo7307egfKoTitBiG9J1m3Ljc//NNauJ9wSYq+YM5mYMOCX+q+HStxsMAjvW2mvaBRzYA=
X-Received: by 2002:adf:f946:: with SMTP id q6mr12293105wrr.109.1561169694434;
 Fri, 21 Jun 2019 19:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190619082307.GA27382@wens.csie.org>
In-Reply-To: <20190619082307.GA27382@wens.csie.org>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Sat, 22 Jun 2019 10:14:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v660Wc12DnQ-OPQ67M4KT=Up+eA3aeAuCD71HDyJ5iy8gg@mail.gmail.com>
Message-ID: <CAGb2v660Wc12DnQ-OPQ67M4KT=Up+eA3aeAuCD71HDyJ5iy8gg@mail.gmail.com>
Subject: Re: [GIT PULL] clk: sunxi-ng: clk parent rewrite part 1
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 19, 2019 at 4:29 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-ng-parent-rewrite-part-1
>
> for you to fetch changes up to 594d7e8fbe906ad3162ad84ae74acfbdcf8fa3a5:
>
>   clk: sunxi-ng: sun8i-r: Use local parent references for SUNXI_CCU_GATE (2019-06-18 19:53:33 +0800)
>
> ----------------------------------------------------------------
> Allwinner sunxi-ng clk driver parent relation rewrite part 1
>
> The first part of ongoing work to convert the sunxi-ng clk driver from
> using global clock name strings to describe clk parenting, to having
> direct struct clk_hw pointers, or local names based on clock-names from
> the device tree binding.
>
> This is based on Stephen Boyd's recent work allowing clk drivers to
> specify clk parents using struct clk_hw * or parsing DT phandles in the
> clk node.
>
> This series can be split into a few major parts:
>
> 1) The first patch is a small fix for clk debugfs representation.
>
> 2) A bunch of CLK_HW_INIT_* helper macros are added. These cover the
>    situations I encountered, or assume I will encounter, such as single
>    internal (struct clk_hw *) parent, single DT (struct clk_parent_data
>    .fw_name), multiple internal parents, and multiple mixed (internal +
>    DT) parents. A special variant for just an internal single parent is
>    added, CLK_HW_INIT_HWS, which lets the driver share the singular
>    list, instead of having the compiler create a compound literal every
>    time. It might even make sense to only keep this variant.
>
> 3) A bunch of CLK_FIXED_FACTOR_* helper macros are added. The rationale
>    is the same as the single parent CLK_HW_INIT_* helpers.
>
> 4) Bulk conversion of CLK_FIXED_FACTOR to use local parent references,
>    either struct clk_hw * or DT .fw_name types, whichever the hardware
>    requires.
>
> 5) The beginning of SUNXI_CCU_GATE conversion to local parent
>    references. This part is not done. They are included as justification
>    and examples for the shared list of clk parents case.
>
> ----------------------------------------------------------------
> Chen-Yu Tsai (25):
>       clk: Fix debugfs clk_possible_parents for clks without parent string names
>       clk: Add CLK_HW_INIT_* macros using .parent_hws
>       clk: Add CLK_HW_INIT_FW_NAME macro using .fw_name in .parent_data
>       clk: Add CLK_HW_INIT_PARENT_DATA macro using .parent_data
>       clk: fixed-factor: Add CLK_FIXED_FACTOR_HW which takes clk_hw pointer as parent
>       clk: fixed-factor: Add CLK_FIXED_FACTOR_HWS which takes list of struct clk_hw *
>       clk: fixed-factor: Add CLK_FIXED_FACTOR_FW_NAME for DT clock-names parent
>       clk: sunxi-ng: switch to of_clk_hw_register() for registering clks
>       clk: sunxi-ng: sun8i-r: Use local parent references for CLK_HW_INIT_*
>       clk: sunxi-ng: a10: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: sun5i: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: a31: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: a23: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: a33: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: h3: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: r40: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: v3s: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: sun8i-r: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: f1c100s: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: a64: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: h6: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: h6-r: Use local parent references for CLK_FIXED_FACTOR
>       clk: sunxi-ng: gate: Add macros for referencing local clock parents
>       clk: sunxi-ng: a80-usb: Use local parent references for SUNXI_CCU_GATE
>       clk: sunxi-ng: sun8i-r: Use local parent references for SUNXI_CCU_GATE
>
>  drivers/clk/clk.c                        |  44 ++++++++++++-
>  drivers/clk/sunxi-ng/ccu-sun4i-a10.c     |  39 +++++++-----
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c    |  41 +++++++-----
>  drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c   |   2 +-
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c     |  69 ++++++++++++--------
>  drivers/clk/sunxi-ng/ccu-sun5i.c         |  34 ++++++----
>  drivers/clk/sunxi-ng/ccu-sun6i-a31.c     |  39 +++++++-----
>  drivers/clk/sunxi-ng/ccu-sun8i-a23.c     |  34 ++++++----
>  drivers/clk/sunxi-ng/ccu-sun8i-a33.c     |  34 ++++++----
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c      |  29 ++++++---
>  drivers/clk/sunxi-ng/ccu-sun8i-r.c       | 104 +++++++++++++++----------------
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.c     |  46 +++++++++-----
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c     |  29 ++++++---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c |  32 ++++++----
>  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c |  29 ++++++---

This has some build errors in it. I'll respin.
Sorry for the noise.

ChenYu

>  drivers/clk/sunxi-ng/ccu_common.c        |   2 +-
>  drivers/clk/sunxi-ng/ccu_gate.h          |  53 ++++++++++++++++
>  include/linux/clk-provider.h             |  89 ++++++++++++++++++++++++++
>  18 files changed, 526 insertions(+), 223 deletions(-)
