Return-Path: <SRS0=LKfv=46=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD5AC10DCE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Mar 2020 17:04:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AAA42076A
	for <linux-clk@archiver.kernel.org>; Fri, 13 Mar 2020 17:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZt+AvDv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCMREN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Mar 2020 13:04:13 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:32833 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCMREN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Mar 2020 13:04:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id r7so8272465wmg.0;
        Fri, 13 Mar 2020 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VnHkv2SySYBGNIaX4wpCz7wmRgaxA5hMK+HRcRPI5Mo=;
        b=EZt+AvDvnQonno9D8+xAb4mDEqqo7mvDC0c/wSY0Xll4V9jT6o25rlmmzm+iWQ3rlC
         M2ehFbTvupPmt51KVdyIVFm0cSPAy7UwKb4GSNFbXCQqISNQzskUnvRUw1PmDHjK0ZQY
         MtGJQfhUicYt4cjkOcvF7GYzhRCZwZQwz5N59HXNJdZRt4/etuLgCNL5GbB5jWWW55SX
         D7eKXCP4rgm6H4C0ag5MP+h9K0EduC2kDf9PkcjqNretiGV5aAJztcHzGMIvBCtYIlZl
         B5RetYRs39azTIP/Szd2snJr9I8XAYKYa9FJtcX9o/Yjioj6NEkbLR3r2bkJa2xu+SmF
         FHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VnHkv2SySYBGNIaX4wpCz7wmRgaxA5hMK+HRcRPI5Mo=;
        b=MvhepfiFJw1FcVGQr+77/W+1Kcd+JO7D68W6i9r9fekh8OXNiiONeyjNVgatVVlHOu
         bFNL9XzLQNPt+AWtSJcE+lias9XNxGvb7TawD2cFPuf5PIODSMuJntgltz7qnJv4r1BW
         f0/0WSclM6AZeavQp+0TY5KLjSONWKR5g4jz1MfJMBB6GdHvFgXfZD6HJENjUrVFBp8c
         r+EFoEt8Q3FnN3NvS1CUP3Ikb2MkhPrWZSZf3A3DtU2Vd+p7gFQ3Wktc8lwKa4CVISYv
         aXeiH3zxiI1Rxcd0gxHSdOiLs4eOc3Z28gFwhHXnjznXbCVcvbuYHBorkvJEeCjPEX6z
         PhmQ==
X-Gm-Message-State: ANhLgQ3plELBLe14KKRzUmy1h3cR7fUAjL6u+qJLLvHKSZ118MCx6sdx
        0cycUTEkpLrEUkC0jODbHwg=
X-Google-Smtp-Source: ADFU+vuJvZ2CBsvHR8zjvfHMwiDXniYtA0JvHlVc5kjDLLCEupXfek6uRtJM0dXB9tLwomHaJE7KWg==
X-Received: by 2002:a1c:1b0e:: with SMTP id b14mr11706753wmb.8.1584119051386;
        Fri, 13 Mar 2020 10:04:11 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id p10sm80012719wrx.81.2020.03.13.10.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 10:04:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 18:04:09 +0100
Message-Id: <20200313170409.2922165-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.7-clk

for you to fetch changes up to efdd205ccbfaa80bd932bc2fba498026c09db502:

  clk: tegra: Remove audio clocks configuration from clock driver (2020-03-12 12:10:49 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v5.7-rc1

These changes remove PMC clocks from the clock and reset controller
driver because they are controlled by bits in the PMC controller.

----------------------------------------------------------------
Sowjanya Komatineni (10):
      dt-bindings: clock: tegra: Add IDs for OSC clocks
      dt-bindings: tegra: Convert Tegra PMC bindings to YAML
      dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
      dt-bindings: soc: tegra-pmc: Add ID for Tegra PMC 32 kHz blink clock
      clk: tegra: Add support for OSC_DIV fixed clocks
      clk: tegra: Add Tegra OSC to clock lookup
      clk: tegra: Fix Tegra PMC clock out parents
      clk: tegra: Remove CLK_M_DIV fixed clocks
      clk: tegra: Remove tegra_pmc_clk_init along with clk ids
      clk: tegra: Remove audio clocks configuration from clock driver

Thierry Reding (1):
      Merge branch 'for-5.7/dt-bindings' into for-5.7/clk

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 -----------------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++++++++++++
 drivers/clk/tegra/Makefile                         |   1 -
 drivers/clk/tegra/clk-id.h                         |  12 +-
 drivers/clk/tegra/clk-tegra-fixed.c                |  37 ++-
 drivers/clk/tegra/clk-tegra-pmc.c                  | 122 -------
 drivers/clk/tegra/clk-tegra114.c                   |  43 +--
 drivers/clk/tegra/clk-tegra124.c                   |  48 ++-
 drivers/clk/tegra/clk-tegra20.c                    |   9 +-
 drivers/clk/tegra/clk-tegra210.c                   |  32 +-
 drivers/clk/tegra/clk-tegra30.c                    |  33 +-
 drivers/clk/tegra/clk.h                            |   1 -
 include/dt-bindings/clock/tegra114-car.h           |   4 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   4 +-
 include/dt-bindings/clock/tegra210-car.h           |   4 +-
 include/dt-bindings/clock/tegra30-car.h            |   4 +-
 include/dt-bindings/soc/tegra-pmc.h                |  16 +
 17 files changed, 459 insertions(+), 565 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h
