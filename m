Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C510EC43217
	for <linux-clk@archiver.kernel.org>; Mon, 28 Nov 2022 09:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiK1JuL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Nov 2022 04:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiK1JuK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Nov 2022 04:50:10 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9022912AFC
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 01:50:08 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id z4so15869985wrr.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 01:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYr3PilnPfWFQx/WIKEh38kY2BYH/dcp/YHhoxh8Bg8=;
        b=pIYQDfZ6HevvCeW6JkvkPYU94gSISP8LKRfeusWna5rnmfks+QnVirtOsyIDXn6pMt
         gjK0bTnH6KKf0RAzypNj0lC/chxDxtuo6OXo7tHam0+lG0HMHk14nC6gEUGKZTFL10Uv
         6ql9Gx0/jZKNE2q9RyMBt6+Q3Y0W6i2QPlA82TzEXPpNZcJIWDjMWEnYKSLICS0/pmlC
         xRfXgSJ6vv4Gww5f+XVExV4ziK+LbArKsuBXi/JwIAseZkT4ZwXNUNC7zALP7u6r0mUJ
         jwzIG/v1Z+/isCqaVAeclcOzDP3W+PP8WtfTppN8wpLl+r59DR56EjQ2rR6y2+EeLl/J
         eEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYr3PilnPfWFQx/WIKEh38kY2BYH/dcp/YHhoxh8Bg8=;
        b=4mg0EgtOfHwSi1QdO3O9xV7C5q6QIELZYRcUYsfDDq7muweDxXvZWyu0iKpz5OsBQB
         C3AeAQ+ExGjqy7YZmqjet0yOI8HVZacbyYeCn0ED1zyCSeuQ7RzR+pESum11Ry12tdgY
         yWvydCI9sCvD7UYKXIY9z/6Y/recUVBdL+Hh+9g154z8wKZ+FYeZd1t1HmLr3OXINHq3
         njOVjaZaoLSD6Wcy6CXVlIrLG+WE39by+KE+OXVaGdh5IoVWpu95dk+T2iK5/CuRZSVx
         DR+iOX8g9gT0tJRtyZECS6FY+GBsPCdse+wpbSObQts5AuJhfhJKNjBIb89mCeeyWPlL
         Th9A==
X-Gm-Message-State: ANoB5pmxoBKeATNJegGkJkavN/1V1SfES1MGaNIKEK7+aViZMGohK3Fd
        VNtpOBZJw5SelB3uBJb7ebAjOnGcAgTYyw==
X-Google-Smtp-Source: AA0mqf4TqhtfTx2q9HBSScoSM1pxasjaHVG8orHA6o3c8NPUwqjEi3am9lKc1nd+omUA/b25dyHnRw==
X-Received: by 2002:adf:f3cb:0:b0:22e:3659:2d92 with SMTP id g11-20020adff3cb000000b0022e36592d92mr21009773wrp.604.1669629007113;
        Mon, 28 Nov 2022 01:50:07 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q10-20020a05600c46ca00b003c6bd91caa5sm15569079wmo.17.2022.11.28.01.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 01:50:06 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.2
Date:   Mon, 28 Nov 2022 11:49:52 +0200
Message-Id: <20221128094952.667315-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.2

for you to fetch changes up to 8178e245fa953f793670147368642717fcdb302e:

  clk: imx: rename imx_obtain_fixed_clk_hw() to imx_get_clk_hw_by_name() (2022-11-25 11:22:15 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.2

- Fix parent for FlexSPI clock for i.MX93
- Add USB suspend clock on i.MX8MP
- Unmap anatop base on error for i.MX93 driver
- Change enet clock parent to wakeup_axi_root for i.MX93
- Drop LPIT1, LPIT2, TPM1 and TPM3 clocks for i.MX93
- Mark HSIO bus clock and SYS_CNT clock as critical on i.MX93
- Add 320MHz and 640MHz entries to PLL146x
- Add audio shared gate and SAI clocks for i.MX8MP

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: clock: imx8mp: Add ids for the audio shared gate
      clk: imx8mp: Add audio shared gate

Dario Binacchi (6):
      clk: imx8mn: rename vpu_pll to m7_alt_pll
      clk: imx: replace osc_hdmi with dummy
      clk: imx: rename video_pll1 to video_pll
      clk: imx8mn: fix imx8mn_sai2_sels clocks list
      clk: imx8mn: fix imx8mn_enet_phy_sels clocks list
      clk: imx: rename imx_obtain_fixed_clk_hw() to imx_get_clk_hw_by_name()

Giulio Benetti (2):
      clk: imx: imxrt1050: fix IMXRT1050_CLK_LCDIF_APB offsets
      clk: imx: imxrt1050: add IMXRT1050_CLK_LCDIF_PIX clock gate

Haibo Chen (1):
      clk: imx93: correct the flexspi1 clock setting

Jacky Bai (2):
      clk: imx: keep hsio bus clock always on
      clk: imx93: keep sys ctr clock always on

Li Jun (2):
      dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
      clk: imx: imx8mp: add shared clk gate for usb suspend clk

Marek Vasut (1):
      clk: imx: pll14xx: Add 320 MHz and 640 MHz entries for PLL146x

Peng Fan (4):
      clk: imx93: unmap anatop base in error handling path
      clk: imx93: correct enet clock
      dt-bindings: clock: imx93: drop TPM1/3 LPIT1/2 entry
      clk: imx93: drop tpm1/3, lpit1/2 clk

 drivers/clk/imx/clk-imx6sll.c            |   8 +-
 drivers/clk/imx/clk-imx6sx.c             |  12 +--
 drivers/clk/imx/clk-imx6ul.c             |   8 +-
 drivers/clk/imx/clk-imx7d.c              |   4 +-
 drivers/clk/imx/clk-imx7ulp.c            |  10 +--
 drivers/clk/imx/clk-imx8mm.c             |  12 +--
 drivers/clk/imx/clk-imx8mn.c             | 128 +++++++++++++++----------------
 drivers/clk/imx/clk-imx8mp.c             |  28 +++++--
 drivers/clk/imx/clk-imx8mq.c             |  14 ++--
 drivers/clk/imx/clk-imx93.c              |  46 ++++++-----
 drivers/clk/imx/clk-imxrt1050.c          |   5 +-
 drivers/clk/imx/clk-pll14xx.c            |   2 +
 drivers/clk/imx/clk.c                    |   5 +-
 drivers/clk/imx/clk.h                    |   3 +-
 include/dt-bindings/clock/imx8mn-clock.h |  24 ++++--
 include/dt-bindings/clock/imx8mp-clock.h |  12 ++-
 include/dt-bindings/clock/imx93-clock.h  |   4 -
 17 files changed, 178 insertions(+), 147 deletions(-)
