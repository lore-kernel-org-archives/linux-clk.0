Return-Path: <SRS0=A1Rx=CX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E166C433E2
	for <linux-clk@archiver.kernel.org>; Mon, 14 Sep 2020 17:24:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06739208E4
	for <linux-clk@archiver.kernel.org>; Mon, 14 Sep 2020 17:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F5/z7ocv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgINRYT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Sep 2020 13:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgINRYI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Sep 2020 13:24:08 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED7EC06174A
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2020 10:24:07 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gr14so1134865ejb.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2020 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version;
        bh=hFCbjxW8uW+yuxs/JPTkQS9JaMQxM3PMZY1XAnoJQSY=;
        b=F5/z7ocvDKzr+vhOc+7o9bGoSp+bHfkRTTV72pMQAXpnsX9TI0c5Z84L2kMRJoS0qL
         dwGO7znmuaWD81sNt+fK5+U61zrW2+nT89nE0fzkSDA7L93eG8zyugjwVbyjvxIUWozZ
         I9Nr8he0R2Z+EDI3B6qyUXVkiYYxdrjAoUG6rObqvq6UZN8f3m3itpw7fZMipogtx5qW
         GpOd9V1Gbb6iEitjYQEMg0Xkfo2uanPDfS/TwHQMW/eJ3n0/rYt52g9U/mXTpHMG0Vpm
         tVtKxUhAbqTd66MXg6tZZiwKoF6JclouN41fV3dr1l/p7FIVr8RCDAzPPSYZUKfOf2mq
         TeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version;
        bh=hFCbjxW8uW+yuxs/JPTkQS9JaMQxM3PMZY1XAnoJQSY=;
        b=Fdj5XQ38sTiUzliAQT0PwBuxEdqrhkrwo1XfhBVCCVO4FUHn/DZULq9fPc6Sz0VCfl
         EEtvzATktu56AUQa+Fnaka0b1HuO2MnuvOUMlehhpzunNangdMCAcQRp0uW9liGmSL1Z
         9MOXs/37FwNJa8Cpq/bgN8v8XJZIbBycY9UDrisBJZ4RRBHzmsWufGhhkzDcG5g6WJBh
         LkZOYn4ToulmvuMl602rqRXG2YLQDSwU2SuV1/oyE9UYSg7+ZSmIvBKeTFL9HdpGKvG1
         U6BrdtqV3uhI8TIlDZnlQD8tLxwkf2C8/yysumvq6+ENNUD9/dP0Zq/cT6m2SzDLlY8f
         D/DA==
X-Gm-Message-State: AOAM532bIQzyyb3Lf77X5TWh5JQvb8UUz0wF4UZiXVGmTQnWg2lnB5bg
        L6ci+44ZWJbH4HuJ1WwI5X2mRg==
X-Google-Smtp-Source: ABdhPJy2bQLRu8ffYasf1ax+5TUs//GyxEYDG2pq8Yz0EDxvYyC42y8ku3JnZMrDpoZd7Ij4EGnWXg==
X-Received: by 2002:a17:907:2055:: with SMTP id pg21mr16545089ejb.501.1600104246142;
        Mon, 14 Sep 2020 10:24:06 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id by24sm8199302ejc.100.2020.09.14.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 10:24:05 -0700 (PDT)
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: updates for v5.10
Date:   Mon, 14 Sep 2020 19:24:04 +0200
Message-ID: <1jd02ob7bf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Here are the Amlogic clock changes for v5.10
Please pull.

Cheers
Jerome

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.10-1

for you to fetch changes up to 7b5c5720a3689c2c16968ee276b7c47edb64ce0f:

  clk: meson: make shipped controller configurable (2020-09-10 11:47:33 +0200)

----------------------------------------------------------------
First round of amlogic clock updates for v5.10

* g12: update audio clock inverter and fdiv2 flag
* config: allow to disable unnecessary amlogic clock controllers

----------------------------------------------------------------
Jerome Brunet (4):
      clk: meson: add sclk-ws driver
      clk: meson: axg-audio: separate axg and g12a regmap tables
      clk: meson: axg-audio: fix g12a tdmout sclk inverter
      clk: meson: make shipped controller configurable

Stefan Agner (1):
      clk: meson: g12a: mark fclk_div2 as critical

 drivers/clk/meson/Kconfig     |  26 +++--
 drivers/clk/meson/axg-audio.c | 214 ++++++++++++++++++++++++++++++++++++------
 drivers/clk/meson/clk-phase.c |  56 +++++++++++
 drivers/clk/meson/clk-phase.h |   6 ++
 drivers/clk/meson/g12a.c      |  11 +++
 5 files changed, 274 insertions(+), 39 deletions(-)
