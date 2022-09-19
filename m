Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6C0ECAAD3
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 10:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiISKn3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiISKnC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 06:43:02 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069D527CF0
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 03:25:12 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id ay36so10972646wmb.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=i8qtV1ORsa+HHhmlmkZQpKs+M06Hxfc+YDUSBHs+KQM=;
        b=BHxpezMJV9I0Vrn7MPNMzqigHCUPwbZ39msFNMcvODM9382mD4va5jMzdzyw3DTxfW
         EGgCmu9TZolJhYwHrK7uroVPcwjG9Ufy8hJ2clV4aZ32qm1RRJWG/2zFQAL8Ikew6SNJ
         iVLSn2TnHszk7aOLhVN80vsGKi6KVjb095upN+PYgaqtHpKdupzeQ//7nQpwGL19MyKI
         rVBLWTGFCMdqikEfmiTbdYcd7MbCNtRXv6VNVRwLAl4LFyN1rwAVHH5jYjcnq6NHWPVf
         VkjXKgvt8/2Z4Q3fi+OK7fp4fbsHujU2BhZbR+V5Hdkz8qGfTIStOBf+9psy85h70yNQ
         svjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=i8qtV1ORsa+HHhmlmkZQpKs+M06Hxfc+YDUSBHs+KQM=;
        b=Gs9fUWu4d6KjA/eUrswTLAlHGA+v0HwiHB7Mlm6f8nzEan99jMV6eRQaa94MzSbGVG
         /QBuPYt1HM77z+W6oMfVZFpoGUrcu3D1JS0jrLSLtN7ByCDVLM74ofm2SI3lm7MqjV27
         8ldT3FpdV+KmrEHGV3chq8ZFhthYIvZjkoqqSxm0dDIFaHQhgsoyn3tBGgL0WgHLVkMH
         R4bGYXfEkEzK55UlEdvopiA5qHXubQ2bwXgT93azGqQVX82z+lRgN3U4/Z0LYVKhHFQC
         PAYZeqwb93AYOZzOzBGi8WVvZ4vNDEoOHd3GNGhtiQlGjelQnsYUvW7WPdB+KbELGP9B
         jVDA==
X-Gm-Message-State: ACrzQf1REkRoqnUnUA8rjSDhInyfbHN6qhT/YNNaYGmBMlPZ/zbPi5s6
        rCRaTfUMTckBr/+n64GLVI1E1Q==
X-Google-Smtp-Source: AMsMyM563dXLnPjqspSBvSJ7Y7IQXbM52WpnK9RK2H3xJlFfsqc5fj7ojkYgZ/JHTb3Mu/bcQaa3Fw==
X-Received: by 2002:a05:600c:3591:b0:3b4:bf48:9f10 with SMTP id p17-20020a05600c359100b003b4bf489f10mr10204952wmq.76.1663583055840;
        Mon, 19 Sep 2022 03:24:15 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b11-20020adfd1cb000000b00225239d9265sm7939153wrd.74.2022.09.19.03.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 03:24:15 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.1
Date:   Mon, 19 Sep 2022 13:22:44 +0300
Message-Id: <20220919102244.3537437-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.1

for you to fetch changes up to 67e16ac1fec475e64dcb8238f471c6fd154ef806:

  clk: imx93: add SAI IPG clk (2022-09-19 13:06:45 +0300)

----------------------------------------------------------------
i.MX clocks changes for 6.1

- Change order between 'sim_enet_root_clk' and 'enet_qos_root_clk'
  clocks for i.MX8MP
- Drop unnecessary newline in i.MX8MM dt-bindings
- Add more MU1 and SAI clocks dt-bindings Ids
- Introduce slice busy bit check for i.MX93 composite clock
- Introduce white list bit check for i.MX93 composite clock
- Add new i.MX93 clock gate
- Add MU1 and MU2 clocks to i.MX93 clock provider
- Add SAI IPG clocks to i.MX93 clock provider

----------------------------------------------------------------
Marcel Ziswiler (1):
      dt-bindings: clock: imx8mm: don't use multiple blank lines

Peng Fan (8):
      clk: imx8mp: tune the order of enet_qos_root_clk
      dt-bindings: clock: imx93-clock: add more MU/SAI clocks
      clk: imx: clk-composite-93: check slice busy
      clk: imx: clk-composite-93: check white_list
      clk: imx: add i.MX93 clk gate
      clk: imx93: switch to use new clk gate API
      clk: imx93: add MU1/2 clock
      clk: imx93: add SAI IPG clk

 drivers/clk/imx/Makefile                 |   1 +
 drivers/clk/imx/clk-composite-93.c       | 171 +++++++++++++++++++++++++-
 drivers/clk/imx/clk-gate-93.c            | 199 +++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8mp.c             |   2 +-
 drivers/clk/imx/clk-imx93.c              |  30 +++--
 drivers/clk/imx/clk.h                    |   9 +-
 include/dt-bindings/clock/imx8mm-clock.h |   1 -
 include/dt-bindings/clock/imx93-clock.h  |   9 +-
 8 files changed, 402 insertions(+), 20 deletions(-)
 create mode 100644 drivers/clk/imx/clk-gate-93.c
