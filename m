Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEFAC3E8C5
	for <linux-clk@archiver.kernel.org>; Sun, 29 Nov 2020 20:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9099020731
	for <linux-clk@archiver.kernel.org>; Sun, 29 Nov 2020 20:51:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AHfp4NMR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgK2UvZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Nov 2020 15:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgK2UvY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Nov 2020 15:51:24 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A87FC0613CF
        for <linux-clk@vger.kernel.org>; Sun, 29 Nov 2020 12:50:44 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id s8so12612440wrw.10
        for <linux-clk@vger.kernel.org>; Sun, 29 Nov 2020 12:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:message-id:date:mime-version;
        bh=11SVmcLjK6UeFfGAKdcpke7xMCZ9FSgIq3yT8lzKa94=;
        b=AHfp4NMRjG8JWl/9iTpWPVMuwaSEbag4HV3CNGrEb/gF8xalghqVhjFJfXp5O0+N/A
         R5Fknc1GS9LAIMwxVW4AZtCF5Q9EBT+v9fPMjs3d1Hvn8YI/ls5LLNj7vKWwhGbBdz9K
         18zSm6Dp/ZdnV8x7HQ/pSfW4PdQIDI6/afWUC4lcmd5xCpeB8bX+EYDNQjVcvlNCBxdx
         0wGeacQB2jt6fRXIPaKJCoNGdXFZEdWtjx86poYnkhJtoXiLvrJdE5NkewzmEaH9N44E
         mYPrLidjCXwP7DeHvOjVYdjJW/nXkK01gKh0SUuShg2XQ0BjIqZsoGbtbke58qoynetl
         W1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:message-id:date
         :mime-version;
        bh=11SVmcLjK6UeFfGAKdcpke7xMCZ9FSgIq3yT8lzKa94=;
        b=jhxGD9d515hArOFfoh8DXB/f2HPqRGjraU8Sh+a4ksCI8VhFNXFNuF0hfUQ26q2x35
         WYxOJge6dekbem5JPwd+vR7YyFq+uq+BFutB1ZtNtO2o93bVsjKvfojZECtdDO2R2vU+
         GY9NHdX91DaybQsVk/HTzbejnXbNsvMAR9025j5V6ds93BfMnRKSOQRV4fyB01W+oQH1
         WQYmOjsp6MAMjxcYJF3gmdr7f6FtOJwDhEikMk3WlZ9rNztI/DbS/4QR+mk1/02rXRDn
         riJbkMivJua/Rod2z4vCmaftrlNkmVOyW9nhbSWARgh6Hdd9iR/fREc+8YUBKzLIO5u3
         j0jg==
X-Gm-Message-State: AOAM532J2/Z9OKx+jQBDXG/H8tHV9gRLAXk18IBLLJP4CNZix3nkPzrs
        fcxVXzvvLSUO2m6wxdnaH463r9FvABUAMg9/
X-Google-Smtp-Source: ABdhPJyz9WSYSxftKGwJFmeQpGKUPueZj3cuy71FZGjwc2q0bk77rAfZOnzfT4/JFUi59k2stggxEQ==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr24466673wrw.145.1606683042908;
        Sun, 29 Nov 2020 12:50:42 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id k11sm16065846wmj.42.2020.11.29.12.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 12:50:42 -0800 (PST)
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [GIT PULL]: clk: meson: amlogic updates for v5.11 
Message-ID: <1jtut7yjj3.fsf@starbuckisacylon.baylibre.com>
Date:   Sun, 29 Nov 2020 21:50:40 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here are the updates for amlogic clocks for v5.11. This is based on your
clk-hw branch, instead of the usual rc1, since it depends on clk_hw
stuff you've already applied.

Please Pull.
Thx.

Cheers
Jerome

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
