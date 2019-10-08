Return-Path: <SRS0=oEB3=YB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BCEC10F14
	for <linux-clk@archiver.kernel.org>; Tue,  8 Oct 2019 07:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF45820640
	for <linux-clk@archiver.kernel.org>; Tue,  8 Oct 2019 07:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VLEkmuDM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730171AbfJHH0S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Oct 2019 03:26:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34088 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730169AbfJHH0S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Oct 2019 03:26:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id j11so12267766wrp.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Oct 2019 00:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version;
        bh=YJvy9nsXaskuwsNETGxqbLFMHW5hYq6DMzsdXiXCa9s=;
        b=VLEkmuDMTW45fFL33LNxB4BnipNy7ebQhOyZioGwQBnouB+t9IbM7Qnqg6+t6inysP
         tF5vNqhYUOXAjM6M7GFtmRO1Y2ZM30mgnIsT0gGaNjPC/36LBVB2/mi9c43WcS8U88c8
         Pz9D4JJ22IMB6x3cbW95oeIaMbxCeJOX3YZO2SjWRiBwldp428Y+2uGa7RfG5PcdnkmR
         /x7W0H7YyzxyzY0GuHAmajtcyrPswnx7xrRfxNzXj7DkclWNgvxNodnxBc8ER8otdMUD
         ZnHTxOYi/9MsEG6qeM8gExvN8YZeMfzMHYLAN+hSnDLXwytocOG9bCwF0HEdK874bYA7
         kT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version;
        bh=YJvy9nsXaskuwsNETGxqbLFMHW5hYq6DMzsdXiXCa9s=;
        b=pFpjL6j+dmKcEWoIKTqf5MM4lhvk+kcmWy3pZgMh/d3LkB9KGYw7qKy5H8hzlPO1YH
         yJaUcyqUUCQBt6AICKDdM4tfQY2E289ZbAF0kGCaepc9QuPmOlMzGt/7GYmF7+7s6h1l
         SOu0KbDsoG7a4e4TNWYKCSKtpUtbsKW3VEnPb1vZkHLXuYV3vUvf42kl9LRvgJoFshQ+
         QQxSoTL2avxD3VgI4j3WCPqIZlszRxkMrNefDG+SF4pL2jwFPLAe5cjyIffWOeUG4pGx
         8q6tpUXI0nSqZpKD4jbyRnvgZznX6YWHdfPybeV5LK8bidQ0uBh4t+d83uVDyQyVvh6U
         Zhqg==
X-Gm-Message-State: APjAAAWanFBunwrdZtIxRTmhjnIEL7Qu0huvHFYM/fgUOWinoPRzhBvs
        Gv4//Uev+ZtsDyEWhjKHAFG5lQ==
X-Google-Smtp-Source: APXvYqxbbHsF9Yfc9ZjXLR7Vy96blle3+q70yYI8j1SXjf038VkmOu/KxRq6y4WUP5xpChrP4gZfew==
X-Received: by 2002:a05:6000:1090:: with SMTP id y16mr1708129wrw.316.1570519574639;
        Tue, 08 Oct 2019 00:26:14 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id i11sm6757471wrw.57.2019.10.08.00.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 00:26:14 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: fixes for v5.4
Date:   Tue, 08 Oct 2019 09:26:12 +0200
Message-ID: <1jzhibaeaz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Please pull these few fixes for the current release.

Thanks
Jerome

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-fixes-v5.4-1

for you to fetch changes up to 90b171f6035688236a3f09117a683020be45603a:

  clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes (2019-10-01 14:51:15 +0200)

----------------------------------------------------------------
First round of amlogic clock fixes for v5.4.

This fixes the clock rate propagation for the g12a cpu clocks and
the gxbb adc clock.

----------------------------------------------------------------
Martin Blumenstingl (1):
      clk: meson: gxbb: let sar_adc_clk_div set the parent clock rate

Neil Armstrong (2):
      clk: meson: g12a: fix cpu clock rate setting
      clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes

 drivers/clk/meson/g12a.c | 13 +++++++++++--
 drivers/clk/meson/gxbb.c |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)
