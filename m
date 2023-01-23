Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C00C05027
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 14:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjAWOMy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 09:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbjAWOMv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 09:12:51 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693D2EFA0
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 06:12:49 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso8645658wmq.5
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G39hMZwAB1I+MR/8X+9Z84y3g7mvJ1HkDca7b+0MgBY=;
        b=qs9sdYaR4ERMkJB5aqIe9MBCuNbnYUAfb1Yixdfj8kTvjCnWZ3IKRI5VbcVMbGF42n
         cQ3beP3HZYC4U0GeQ7aubljNohHnoSbv3KY+KtA0IjgACaqwQbKqBm6/2cmOuaWDeazM
         +9AtDaibIv5xKL8R4NmZxS5x4t6n7rWU1ax47FLHTvQnL3vupn1+iKaZB7i0vBXJQom9
         vr9T/mZPzA9MJ3AEOgYNzpDjNgH+etjY9Db9zhxkYJ0uLyCL+WWN+YTzIlXt/HhYFAZL
         xKjFxGa/u2Dqmvs0/lJpdunVkVbMx1hEKt74+2bVAT8eWSNWmiOXxz+/jJnI95WGd1oi
         bygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G39hMZwAB1I+MR/8X+9Z84y3g7mvJ1HkDca7b+0MgBY=;
        b=HFUwKHUJqgfImUHB+JVsumjl7B/J+p5y0sLSb802b1pzupAYvpyr5KefCfCeB2zu8d
         EkBpVwl+Y7n170/n56Id1J/XEPorvB4RN6VzuKjhT9N62qPx7cutGP7DiVNl8mzD7rmg
         Ht3vVnBT2PY/TSwWr09dGnJ+HFZThFsn4/OREch3TjAg/Hp5tgkgFGfpZ4JZANDWOCek
         NdF8a2jDG9d401CUHMcBEgApn0zk7XjYwtW+04E9z6JOfDObT29UOfd4/NhnkoQRDo2C
         I7M2UbhSI5SoK/hus/eGp8Ah716GwsIL0JhLylFfBHr+uxYjD3Qh0cfb2oanpC7iZgAB
         bVSA==
X-Gm-Message-State: AFqh2kq0GQFvNv0OB/66nWWxeD+cxPA/ap9RqV5LBR4iHSA+N3wE8C8C
        NeUc8wKaswY4SIOixgvngwy/oJkw9x/HuCQe
X-Google-Smtp-Source: AMrXdXv1uE+sN8GzZzkRGNz23hn8wPOXeFZa/hgo08zkWMCB2qtrhOLUKZIsAQYlItJJC9lmsX6n7A==
X-Received: by 2002:a05:600c:3b84:b0:3da:fd7c:98b3 with SMTP id n4-20020a05600c3b8400b003dafd7c98b3mr23942841wms.25.1674483167939;
        Mon, 23 Jan 2023 06:12:47 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id e12-20020adffd0c000000b002bf95821372sm6614471wrr.42.2023.01.23.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 06:12:47 -0800 (PST)
User-agent: mu4e 1.8.10; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linux-amlogic <linux-amlogic-bounces@lists.infradead.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@linaro.org>
Subject: [GIT PULL]: clk: meson: amlogic clock updates for v6.3
Date:   Mon, 23 Jan 2023 15:07:11 +0100
Message-ID: <1jmt69nxup.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here are the amlogic clock updates for v6.3.
Please pull.

Cheers
Jerome

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.3-1

for you to fetch changes up to 716592fdb5e255a1b9dcb444822c9c1f9a1e248c:

  clk: meson: clk-cpu-dyndiv: switch from .round_rate to .determine_rate (2023-01-13 15:14:12 +0100)

----------------------------------------------------------------
Amlogic clock updates for v6.3

* Use .determine_rate() instead of .round_rate() for the dualdiv, mpll,
  sclk-div and cpu-dyn-div amlogic clock drivers.

----------------------------------------------------------------
Martin Blumenstingl (4):
      clk: meson: mpll: Switch from .round_rate to .determine_rate
      clk: meson: dualdiv: switch from .round_rate to .determine_rate
      clk: meson: sclk-div: switch from .round_rate to .determine_rate
      clk: meson: clk-cpu-dyndiv: switch from .round_rate to .determine_rate

 drivers/clk/meson/clk-cpu-dyndiv.c |  9 ++++-----
 drivers/clk/meson/clk-dualdiv.c    | 21 +++++++++++++--------
 drivers/clk/meson/clk-mpll.c       | 20 +++++++++++++-------
 drivers/clk/meson/sclk-div.c       | 11 ++++++-----
 4 files changed, 36 insertions(+), 25 deletions(-)
