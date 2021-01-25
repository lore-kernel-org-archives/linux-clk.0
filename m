Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4A8C43381
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 05:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE67A229C4
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 05:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbhAZFfx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728637AbhAYNTT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2021 08:19:19 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6543C061574
        for <linux-clk@vger.kernel.org>; Mon, 25 Jan 2021 05:18:38 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id 6so12463818wri.3
        for <linux-clk@vger.kernel.org>; Mon, 25 Jan 2021 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:message-id:date:mime-version;
        bh=8xoToqjd1UStdUQYba00mf5Yg6qyUV8aYxspMqz+348=;
        b=MQAyMG6wHg7Oy8c3zLqnYJjF72gC3raqFDf//YAuZCo8u3RwBwWpYuLmJwRLPkXTyx
         HLzpHZk5Z0Voh/CcWeCtqt+c+gio/sK9KGyaiQxgG36er7rqrg7s8fIsLcU/zKjVVzy8
         2WfibzURNra1hM6bdDWZqUNyAwjkMSSBsPeECNxnjp/ENpA61rmKKoYKyrdYCHK73Zva
         8qf/ooCa9yesM5NJ/Hdyh3b51/z9uJ/tCN9us4ofgOtSKzhgF544o3+WyHjAMpEOaDVI
         SeRTvPMZWnGdaQvt/1cIajy/kpAKE0b0x+/SifJlnAF1y4YxYXkkR77yQUtKiklsmDYY
         V2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:message-id:date
         :mime-version;
        bh=8xoToqjd1UStdUQYba00mf5Yg6qyUV8aYxspMqz+348=;
        b=OpRgpaRCukw6JFG1pMXNL+cQnYBZegu4uaAbyKVbswzKCHPlKPCasADgJvjmBlhU/O
         Uv5T7JMV2mk7rE1UCbYLRcNEh5nZu0ZkKfCPyc092oOImEwXl5CAfLPXSGrAWNgDAaUm
         8q9IWXi7vqo8NpxPobwiUdp3MfoYcpGRGrpjfnukZYF6eTMQRdVTvLPJeGGDaSOCVKoY
         DaFEwNDFV5OUfYlvcCONE7vgcqwnhuwYxV9honQi7yUk9qphnITKsRWgWrevZayyvKpI
         7u5WHvIZRM6nYwiQjhhXxiDUl6GwGHOA2K3ygkNeVXGqBwAa0QtWlxhPx/9jCjFeKipX
         yzxA==
X-Gm-Message-State: AOAM531qPaSvZwmbLoeBUELf+JZEXStQrNYgANhxi5FWpeBkFEp0dYgY
        JKFWlVmsZYB571uG8SYT0B6KiQ==
X-Google-Smtp-Source: ABdhPJzCGzDFsaH+t49kkVepF1jOykGdNIRNUK5oB4G6A6Jm8xyhEmlL9BIViv50I+WDYDtxIsxAWg==
X-Received: by 2002:a05:6000:1542:: with SMTP id 2mr953692wry.356.1611580717460;
        Mon, 25 Jan 2021 05:18:37 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id k15sm10333615wmj.6.2021.01.25.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 05:18:36 -0800 (PST)
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic updates for v5.12 
Message-ID: <1jy2gh17f7.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 25 Jan 2021 14:18:36 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here are the updates of the amlogic clocks for v5.12. Nothing out the
ordinary. Please pull.

Thx.
Cheers

Jerome

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.12-1

for you to fetch changes up to af57824425389adab637a2ae872ac488f50b5832:

  clk: meson: axg: Remove MIPI enable clock gate (2021-01-04 12:03:02 +0100)

----------------------------------------------------------------
Amlogic clock updates for v5.12

* pll driver fixup
* meson8b clock controller dt support clean up
* remove mipi clk from the axg clock controller

----------------------------------------------------------------
Martin Blumenstingl (5):
      clk: meson: clk-pll: fix initializing the old rate (fallback) for a PLL
      clk: meson: clk-pll: make "ret" a signed integer
      clk: meson: clk-pll: propagate the error from meson_clk_pll_set_rate()
      clk: meson: meson8b: remove compatibility code for old .dtbs
      dt-bindings: clock: meson8b: remove non-existing clock macros

Remi Pommarel (2):
      clk: meson-axg: remove CLKID_MIPI_ENABLE
      clk: meson: axg: Remove MIPI enable clock gate

 drivers/clk/meson/axg.c                  |  3 ---
 drivers/clk/meson/axg.h                  |  1 -
 drivers/clk/meson/clk-pll.c              | 10 ++++---
 drivers/clk/meson/meson8b.c              | 45 ++++----------------------------
 include/dt-bindings/clock/axg-clkc.h     |  1 -
 include/dt-bindings/clock/meson8b-clkc.h |  2 --
 6 files changed, 11 insertions(+), 51 deletions(-)
