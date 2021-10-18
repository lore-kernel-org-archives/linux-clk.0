Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9293AC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 11:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68EEE61038
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 11:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhJRLsi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Oct 2021 07:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhJRLsg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Oct 2021 07:48:36 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92161C06161C
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 04:46:25 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id b189-20020a1c1bc6000000b0030da052dd4fso8239998wmb.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Oct 2021 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=user-agent:from:to:cc:cc:subject:date:message-id:mime-version;
        bh=C174KNLIkQcIpVKqoVKmO0XecOJBPPgsZBNsljzoVYI=;
        b=ZEE/wRzPZbn/EEEhxb+i2m0hwMQskOM5+yE7+3TAU9RVD/9Ga0Pps4hsWQI2UzNvkI
         6kh5H7dzZSdfRXA22f5aCDTL405uA6gdWQedBTOkooNICHPkDvnF/xzhhguG/Lcaxarv
         nmnxJGp61e8YSnd2qtOBM7240wVHKP/t7skuyxQV+kI94kotiKDSxTp5wTGf5eqsiooD
         Q5S0ff11x52nZu7nfLu7OZwK4XjZENY8Ipo6izjBZxvbcFYlKYzuz58A0CfLNdEZ+KMg
         ad3uopaXJ+DJpnJmuUYGUSuArLLrzk3PnCZl+0G/5clemyuW6R9xq0gKLOTO60VyIvlL
         1Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:from:to:cc:cc:subject:date:message-id
         :mime-version;
        bh=C174KNLIkQcIpVKqoVKmO0XecOJBPPgsZBNsljzoVYI=;
        b=IpiiK+ZT4ySs+r/kDVfJEkzoB/IJryZ8evs8R9xbgw4LQ/D1f9wdFVW8TLcwn8mAqP
         TbGkMlWeTSg8qHUhBUZGG0CEYiRcde3btbRZhTemTOUPKjNdOeS1lvUlhkuF1vLiJzJS
         KBJc292rjVf2q90Qmxufkdgohgyv3FQ2St/Ri6Zsc4hcG3S+7oaOo2xyMu4eBciojpp5
         yw+fHLFSF7n9JYSKETCdhkF0jnYYSHtUMGaBCn2WnKm8O2O7R0fgBaspE+CromFb3sqR
         icZb8Pm571Q2H4VHSj3P7GYGKX4bDoAy6vA+3UGEyH5ehDbevpPcGDqqubSSl17U/BnE
         ypPQ==
X-Gm-Message-State: AOAM531K8MHdS1jKG2+gePzx0gO5SAVKhTWPOlZ27cGbZa5+N0uPtIOe
        dtUGKgweJDVORGgtmiynJ2HWTZRLFIJ/Ow==
X-Google-Smtp-Source: ABdhPJyNZnEnLK0VWhZt5BvHvaJ2EgT5Ta5yrzcUBW3wU+Y6VN06mk5NyoAlWVIlfVGExCVEbVMRSw==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr43825165wme.108.1634557584200;
        Mon, 18 Oct 2021 04:46:24 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m4sm14382721wrz.45.2021.10.18.04.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 04:46:23 -0700 (PDT)
User-agent: mu4e 1.6.6; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic updates for v5.16
Date:   Mon, 18 Oct 2021 13:44:22 +0200
Message-ID: <1jtuhetv1s.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here are the updates of the amlogic clocks for v5.16. Nothing out the
ordinary. Please pull.

Thx.
Cheers

Jerome

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.16-1

for you to fetch changes up to 7bcf9ef6b9c50e87bcb1dee5ced50ccfa2b21470:

  clk: meson: meson8b: Make the video clock trees mutable (2021-09-23 11:46:38 +0200)

----------------------------------------------------------------
Amlogic clock updates for v5.16

* Update video path realted clocks for meson8

----------------------------------------------------------------
Martin Blumenstingl (6):
      clk: meson: meson8b: Export the video clocks
      clk: meson: meson8b: Use CLK_SET_RATE_NO_REPARENT for vclk{,2}_in_sel
      clk: meson: meson8b: Add the vid_pll_lvds_en gate clock
      clk: meson: meson8b: Add the HDMI PLL M/N parameters
      clk: meson: meson8b: Initialize the HDMI PLL registers
      clk: meson: meson8b: Make the video clock trees mutable

 drivers/clk/meson/meson8b.c              | 163 ++++++++++++++++++++++---------
 drivers/clk/meson/meson8b.h              |  26 ++---
 include/dt-bindings/clock/meson8b-clkc.h |  10 ++
 3 files changed, 143 insertions(+), 56 deletions(-)
