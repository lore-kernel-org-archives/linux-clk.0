Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1038BC04AA7
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 12:31:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6219208C3
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 12:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mtX1wcS9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729818AbfEMMbZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 08:31:25 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36858 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbfEMMbZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 08:31:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id o4so15079319wra.3
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2019 05:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a0zDbTaa26ZySHoR9jAKQENuusgUutv6iF4zZAMHHyo=;
        b=mtX1wcS9kONTXKDjOAvlX2YSMyoJbMEHEStzY48fjKQrJGj9j+ajTQ1w+CC2FH2PYP
         DOSQhUe/lHcfeG6HWyhZ2O0OMEs29Sk9D8p1BHtUL3WTmff3xeteIp+/6aTWrflNBabs
         YLbe1lua9Nnjjwjt7h6QnQ50n3Dv3Y6CVNF6k83a3O1dGOOKfdeHcYVVrJ32Uiuk82/t
         1mNBkIfBIfOseviNJPfkzqEOEI2KPnm9nSjq22WIGIy8I6nAssHLdBxuwHejfPRt7KH9
         iNRVT2pWfFKygo5+U15kIiCNPKiFxRIT5sQk/fsrVh/HjfXgM0jSZst1NFMGmKVsnXCL
         5I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a0zDbTaa26ZySHoR9jAKQENuusgUutv6iF4zZAMHHyo=;
        b=imFrO00RUKIGrop+MMofM+ANOCHKHqUH1rkQPZzBvjkB9qXyD1fcKGHT+M1Kr5IVj2
         ZEOiXlTFspjf8yiQ9HHBse/P9AVQgSjMCa4w5khlcI9LxP0hLv/dkioveD4iKW1rh+mB
         lgWiMELOy5lxfLZGh1w0t04t6xSi7HMsUHa7qNcuKzdBUvLlf9agsIR86u7nyCqbo1dd
         KWUldJdD27nY9znTQ6ESe68dsJy5x2QAJKUlT9uHlvln0Ta0X8y/M+0VIVJM+pwhVJG2
         xFHgSUx8CbGjhAVdUFIu8d/7G/wI+t9y6ib4YLkM64t+WhmpbOxrJSqa89hfEh2bhU4L
         K8LA==
X-Gm-Message-State: APjAAAVktgw8ZoA5RviSXcqDvYW1HwVbsB3/Gqtjw5kdc0BYKvDg2WXg
        fsTzp3vKC91YPRh68ADF7ZxjAQ==
X-Google-Smtp-Source: APXvYqwjb5WcdnNbNi455xLV0O5EORjeFi0LCmBfRmVg75MPPb4ZOa6EeMxt3cqUECWOAand/HVppg==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr18367756wrr.122.1557750683186;
        Mon, 13 May 2019 05:31:23 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 05:31:22 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] clk: meson: fix mpll jitter
Date:   Mon, 13 May 2019 14:31:08 +0200
Message-Id: <20190513123115.18145-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset is a squash of these previous patchsets [0], [1] without
modification, beside a re-ordering of the changes to facilitate backports

We are observing a lot of jitter on the MPLL outputs of the g12a.
No such jitter is seen on gx family. On the axg family, only MPLL2
seems affected. This was not a problem so far since this MPLL output
is not used.

The jitter can be as high as +/- 4%.

This is a problem for audio application. This may cause distortion on
i2s and completely break SPDIF.

After exchanging with Amlogic, it seems we have activated (by mistake)
the 'spread spectrum' feature.

The 3 first patches properly set the bit responsible for the spread
spectrum in the mpll driver and add the required correction in the
related clock controllers.

When the g12a support has been initially submitted, the MPLL appeared
(overall) fine. At the time, the board I used was flashed with Amlogic
vendor u-boot. Since then, I moved to an early version on mainline
u-boot, which is likely to initialize the clock differently.

While debugging audio support, I noticed that MPLL based clocks were way
above target. It appeared the fractional part of the divider was not
working.

To work properly, the MPLLs each needs an initial setting in addition to
a common one. No one likes those register sequences but sometimes, like
here for PLL clocks, there is no way around it.

The last 4 patches add the possibility to set initial register sequence
for the ee clock controller and the MPLL driver. It is then used to enable
the fractional part of the g12a MPLL.

As agreed with the clock maintainers, I'll submit a series to CCF to
remove the .init() callbacks and introduce register()/deregister()
callbacks later on (pinky swear).

Jerome Brunet (7):
  clk: meson: mpll: properly handle spread spectrum
  clk: meson: gxbb: no spread spectrum on mpll0
  clk: meson: axg: spread spectrum is on mpll2
  clk: meson: mpll: add init callback and regs
  clk: meson: g12a: add mpll register init sequences
  clk: meson: eeclk: add init regs
  clk: meson: g12a: add controller register init

 drivers/clk/meson/axg.c         | 10 ++++-----
 drivers/clk/meson/clk-mpll.c    | 36 ++++++++++++++++++++++++---------
 drivers/clk/meson/clk-mpll.h    |  3 +++
 drivers/clk/meson/g12a.c        | 32 ++++++++++++++++++++++++++++-
 drivers/clk/meson/gxbb.c        |  5 -----
 drivers/clk/meson/meson-eeclk.c |  3 +++
 drivers/clk/meson/meson-eeclk.h |  2 ++
 7 files changed, 70 insertions(+), 21 deletions(-)

-- 
2.20.1

