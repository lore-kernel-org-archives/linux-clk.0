Return-Path: <SRS0=WyPy=A4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB41EC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jul 2020 09:55:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C32D32070E
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jul 2020 09:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oUjA7LiK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgGQJz4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jul 2020 05:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgGQJz4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jul 2020 05:55:56 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35872C061755
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2020 02:55:55 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r12so10255361wrj.13
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2020 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version;
        bh=D701MasqXkpIbnGbW6mmFxiPCZpNnoz2VIxKQ9a2TVg=;
        b=oUjA7LiK7g/fj9w7b0gpT99pp6/39EIHf2cGYGiTZzVVEqVQhsr1ysmE9WYK4jyszG
         +I53qjxkiALRySZjzAU2gDt7AEPOIm2UaErJ4KBlFSm4ssFMfYpLZouh5zDI6DA2cd8c
         YNUZ61y3Hg6Wp6UJinak/PfFtFB7ksOBbcc2O2SXOS6N9kqHnkXl39wQT5GOZBgOxfOJ
         L66KRDdMjC2xPyxb2ovVmsGX7O1N/x0gJjRAKxYBIOLTi5VhNse858G7UqlyKu7htI3g
         4PMtqTimd3Pe1ArjvJRtORn6vVK3yFYQYMprAOGpUTPyaeXRSUiJNmtgzTES6DcxneKL
         mUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version;
        bh=D701MasqXkpIbnGbW6mmFxiPCZpNnoz2VIxKQ9a2TVg=;
        b=qMF34G/6giv0iNUvRgg6J5BW07Hw2pi+A3RDWvnVu6Gr6a8yjOw1Fp6ZuPDOTOL3ib
         TOiQQm/bq6pL3B4mJerWbEP0YTkvcF2co8dMZ2EUSC0dilr0OfOzFi2S7Sp9uYy2qUve
         9wdCIfJijsfkxGLjoNUhGMTgxKK4Hr+cvNNnDdE8J+Vl5jIEzN6B1E8aAtyL/O1oMGNu
         ogAnB7UbRtlrYYmoNEF9hTBYHe3qbdwSCfTR4h/WuEyvBBO4QzH8zbEY9SfRL5qszwtS
         PQLqmfeZe5sS+Dik9MmtrMr1+qyeZgopR8G0Xi8WIW0vR+zkYMMxG3wzlJryWVl3540b
         K3wA==
X-Gm-Message-State: AOAM530yP2ynRrfXXIoOHGWsursnLdClY8K2c4B6532l2BqroLTJ1DWs
        9pOTfWSqTPaExx0zGDsOTXJ5zA==
X-Google-Smtp-Source: ABdhPJzW5rYJYz3Kx7HIHJoWVAnuRW8zocuIaNeL4sZwZQs/RbS59MNrNMZem3kZcrD0BmFW+RaTPw==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr9310818wru.411.1594979753967;
        Fri, 17 Jul 2020 02:55:53 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r28sm14154720wrr.20.2020.07.17.02.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 02:55:52 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v5.9
Date:   Fri, 17 Jul 2020 11:55:51 +0200
Message-ID: <1jr1tapis8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Here are the amlogic clock changes for v5.9
Business as usual - Please pull.

Cheers
Jerome

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.9-1

for you to fetch changes up to 2568528f55356a2f20f80a18244d3e235cbd2cab:

  clk: meson: meson8b: add the vclk2_en gate clock (2020-07-09 11:37:44 +0200)

----------------------------------------------------------------
Amlogic clock updates for v5.9:
* g12: add neural network accelerator clock sources
* meson8: remove critical flag for main PLL divider
* meson8: add video decoder clock gates

----------------------------------------------------------------
Dmitry Shmidt (2):
      dt-bindings: clk: g12a-clkc: Add NNA CLK Source clock IDs
      clk: meson: g12a: Add support for NNA CLK source clocks

Martin Blumenstingl (3):
      clk: meson: meson8b: Drop CLK_IS_CRITICAL from fclk_div2
      clk: meson: meson8b: add the vclk_en gate clock
      clk: meson: meson8b: add the vclk2_en gate clock

 drivers/clk/meson/g12a.c              | 119 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   7 +-
 drivers/clk/meson/meson8b.c           |  67 ++++++++++++++-----
 drivers/clk/meson/meson8b.h           |   4 +-
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 5 files changed, 180 insertions(+), 19 deletions(-)
