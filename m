Return-Path: <SRS0=CTAb=6Z=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBF1C47255
	for <linux-clk@archiver.kernel.org>; Mon, 11 May 2020 09:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBA1A206F5
	for <linux-clk@archiver.kernel.org>; Mon, 11 May 2020 09:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pBaG7fHp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgEKJ2t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 May 2020 05:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725790AbgEKJ2t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 May 2020 05:28:49 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45E7C061A0C
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2020 02:28:48 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id g14so6361617wme.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2020 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version;
        bh=Mh8BUB33BkRpM8aRwNinU38S2vUC6fEvoov1NKAowG0=;
        b=pBaG7fHpfSyn91qMTy91WjirPbPNwfVY7UW/JkojDMasPZx6lER9z3xS9q+97dUJn4
         Hiq1pnaisrwwq/nCdHLAV2r+67h4Dfhu0WIF+AUh1jrxG0VuvGhkLC1OIwE54J3d/W5h
         O+SG4LTHlZnkd+hR3f1DhxDwp0mVmuNjeK0JRv4A7taIUJUtgZ7XcRNBCayhX89WmzoV
         rMQCdGRgwLUqAK8mz34ilZzahJcHHj5KGY2kNpzS/eIP2UsulAe6LNi7JvP8XrM/y1XO
         As56NoE7r1gaV18Q+NX0jl/GEqN+pFPanX6a10CldokF1P5AzJK9HsNW0U2L4udCGPJu
         GEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version;
        bh=Mh8BUB33BkRpM8aRwNinU38S2vUC6fEvoov1NKAowG0=;
        b=VnIW/c3UK8/WRgRKwp6RJHnxvx79q7iFh7d8Tl6lqbqE4Y/3+xeMvVt6rAb9Eo+tly
         QtjG/8a00jDNadTezf2C/N6phYvxWzE3OW7zYahOTqDq/wwt6pW+hBVM2xOLc7vUxnrL
         Gup5TXTg83QUWhZOpQrObzWx7EV/Zwcrx1ZNvIdWCaoow5yG0w05k+qVwnCqgiX3FK/k
         +voEBWxJs+fhU0+suliM2VE+n1/FHw8XZcrUUp8FfN3BkIMtVcIDHK/ln5RS5btuDzrr
         0MA6lSj6NxmbhiaO1YraQMB1wgQU3bBbfNABq8oS4nFhdWP7SMCBiKvUTeipIwW7ahu3
         1D5w==
X-Gm-Message-State: AGi0PuaYQKukJ3GDZ/jLo3eTfy7NKMam9VQ10qyOOYP7dtM/JlE1pDxD
        aq8J4LJS2I5fjQRG/MIaiZz5yw==
X-Google-Smtp-Source: APiQypKERVZrItZkKv3SFAqMxzeC3pVuCzo0/ct6fZp7Ucz/892XCm/L0uc0xYtYm6t2UV3w6TMK6g==
X-Received: by 2002:a7b:c459:: with SMTP id l25mr29862222wmi.52.1589189327567;
        Mon, 11 May 2020 02:28:47 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id f26sm25790278wmj.11.2020.05.11.02.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 02:28:47 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: updates for v5.8
Date:   Mon, 11 May 2020 11:28:45 +0200
Message-ID: <1j3686g6r6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Here are the amlogic clock updates for v5.8.
Nothing fancy, please pull.

Cheers

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.8-1

for you to fetch changes up to a29ae8600d50ece1856b062a39ed296b8b952259:

  clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers (2020-05-02 01:53:32 +0200)

----------------------------------------------------------------
Amlogic clock updates for v5.8:

* Meson8b: Updates and fixup HDMI and video clocks
* Meson8b: Fixup reset polarity
* Meson gx and g12: fix GPU glitch free mux switch

----------------------------------------------------------------
Martin Blumenstingl (9):
      clk: meson8b: export the HDMI system clock
      clk: meson: meson8b: make the hdmi_sys clock tree mutable
      clk: meson: gxbb: Prepare the GPU clock tree to change at runtime
      clk: meson: g12a: Prepare the GPU clock tree to change at runtime
      clk: meson: meson8b: Fix the first parent of vid_pll_in_sel
      clk: meson: meson8b: Fix the polarity of the RESET_N lines
      clk: meson: meson8b: Fix the vclk_div{1, 2, 4, 6, 12}_en gate bits
      clk: meson: meson8b: Make the CCF use the glitch-free VPU mux
      clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers

 drivers/clk/meson/g12a.c                 |  30 +++++---
 drivers/clk/meson/gxbb.c                 |  40 ++++++-----
 drivers/clk/meson/meson8b.c              | 120 ++++++++++++++++++++++---------
 drivers/clk/meson/meson8b.h              |   5 +-
 include/dt-bindings/clock/meson8b-clkc.h |   1 +
 5 files changed, 134 insertions(+), 62 deletions(-)
