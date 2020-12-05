Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C184C1B087
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 18:41:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC52022EBF
	for <linux-clk@archiver.kernel.org>; Sat,  5 Dec 2020 18:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgLESTV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Dec 2020 13:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728188AbgLESBB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Dec 2020 13:01:01 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2AEC061A54
        for <linux-clk@vger.kernel.org>; Sat,  5 Dec 2020 10:00:20 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id 91so4544188wrj.7
        for <linux-clk@vger.kernel.org>; Sat, 05 Dec 2020 10:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:message-id:date:mime-version;
        bh=PTXa6B/B0BNrbQJqk8SVfud/vMOBiyjb/emTUMto2ik=;
        b=MPFfiBDQZxoubDp47KqhOPCsl0Uu0ERfIVCSN+PkGlf6uNfh324TLdfASYbZ/It3aY
         UGAJtAI4+tkA8tViVrBNROjOxFZfeqB5FS34WHxbNS2r4Q1cDhVJu9rlzVPirDNZV/i8
         60ARDDAW1ryo12WD+Xf+Im1RY5mIUczX72oXtDgjnBnAR2ov2Bnpvi7Ur9kayjpajUSi
         z9l0YMrx3FQjr4OgCjaM/+TOodE80LNdzwt6SFqvUZDIAFnnxqVmsLF2XKswJa3QNmJj
         kBykULaoWQcVioGIEXpTTc2n0Y8OjZU07jnfO4dtDPjOQQm+Ain57GxVWPlBoGC9stbg
         P22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:message-id:date
         :mime-version;
        bh=PTXa6B/B0BNrbQJqk8SVfud/vMOBiyjb/emTUMto2ik=;
        b=iiyLi5CHH238YOf5O1QXmXmbD00ELhmh8NIVhVtSrZBpw2zJagsx9C4q8Ofl0nt4UW
         pmnxwOnSvbJiTlsUuz0Ie2UKp0bASzYK+jxQO5hmm6WZvy6juGEOLR629AWXpkSdIQrV
         xo0YgzGVp8zl+LfQTtIWWoq8q3wbhD8cqfIfrQYE9FRrR8FdBbtx1IELyRXu6mCb2cjU
         KUjZ8o7COo7B/bS9LsUonucWAtnKIJfF0IfVpDeHMEf1iYdVY072HU+hMJBkMJgWK3ce
         L59axLRYKR31CI48FwDjbzlrSXurbQQTXqkfLhhqVt/kCsNiSIU8WfcfD7MKALDoPhyG
         vcOA==
X-Gm-Message-State: AOAM531DKKzuCRPNDSXX2QvlcgDkuMmaP9lXobA1MOD0M4NeUrJE57to
        iofY4Srr9ktdsJPscY0DzWme+UAgnqVMWj0v
X-Google-Smtp-Source: ABdhPJxDuNhmmBblFW6fyO7wkhOXA8WUFQ0W09dGX+p5ryihjGiJrwlmb4k0cJJijfX1nHIWVMrHRQ==
X-Received: by 2002:a5d:4892:: with SMTP id g18mr11067256wrq.365.1607191219674;
        Sat, 05 Dec 2020 10:00:19 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id h3sm21635wmm.4.2020.12.05.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 10:00:18 -0800 (PST)
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL RESEND] clk: meson: amlogic updates for v5.11 
Message-ID: <1j360kp1zh.fsf@starbuckisacylon.baylibre.com>
Date:   Sat, 05 Dec 2020 19:00:18 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Here are the updates for amlogic clocks for v5.11. This is based on your
clk-hw branch, instead of the usual rc1, since it depends on clk_hw
stuff you've already applied.

Hopefully I got it right this time ...

Please Pull.
Thx.

Cheers
Jerome

The following changes since commit e6fb7aee486c7fbd4d94f4894feaa6f0424c1740:

  clk: meson: g12: use devm variant to register notifiers (2020-11-14 12:58:31 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.11-1

for you to fetch changes up to 88b9ae600138baff18c7f4c4870622584acc6111:

  clk: meson: g12a: add MIPI DSI Host Pixel Clock (2020-11-26 15:25:20 +0100)

----------------------------------------------------------------
Amlogic clock changes for v5.11

* Add MIPI DSI clocks for axg and g12
* Make it possible to build controllers as modules
* Fix Video PLL clock dependency

----------------------------------------------------------------
Jerome Brunet (2):
      Merge branch 'v5.11/headers' into integ
      Merge branch 'v5.11/headers' into v5.11/drivers

Kevin Hilman (2):
      clk: meson: Kconfig: fix dependency for G12A
      clk: meson: enable building as modules

Neil Armstrong (6):
      dt-bindings: clk: axg-clkc: add Video Clocks
      dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
      clk: meson: axg: add Video Clocks
      clk: meson: axg: add MIPI DSI Host clock
      dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
      clk: meson: g12a: add MIPI DSI Host Pixel Clock

 drivers/clk/meson/Kconfig             |   7 +-
 drivers/clk/meson/axg-aoclk.c         |   5 +-
 drivers/clk/meson/axg.c               | 824 +++++++++++++++++++++++++++++++++-
 drivers/clk/meson/axg.h               |  23 +-
 drivers/clk/meson/g12a-aoclk.c        |   5 +-
 drivers/clk/meson/g12a.c              |  79 +++-
 drivers/clk/meson/g12a.h              |   3 +-
 drivers/clk/meson/gxbb-aoclk.c        |   5 +-
 drivers/clk/meson/gxbb.c              |   5 +-
 drivers/clk/meson/meson-aoclk.c       |   4 +
 drivers/clk/meson/meson-eeclk.c       |   3 +
 include/dt-bindings/clock/axg-clkc.h  |  25 ++
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 13 files changed, 979 insertions(+), 11 deletions(-)
