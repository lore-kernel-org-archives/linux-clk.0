Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C41C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 11:37:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239350AbiKQLgy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239709AbiKQLgs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 06:36:48 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724BD697C9
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 03:36:45 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id a5so2078917edb.11
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 03:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5n89bNftvboEAVMXJ3mXkBUp/+egXvwFtqhI+l+Yrhg=;
        b=LwTHOR/e6UsL0qvDqKfYzZF8rhijfI/1z9hjlJs9jskIsV7PO/SX4Bag1gRZb2CFG9
         UYQLbHsuEHSsUuoI1DanZNzc/rYAcyFmjeDMSKy5qMZpTgrNsFyknnOHqJnNcX8Ms85+
         F48rET3GLypNDLOaMcnUHzrBYyhQ063Wqjih8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n89bNftvboEAVMXJ3mXkBUp/+egXvwFtqhI+l+Yrhg=;
        b=natpBL+MsfCaOKZFSi+9vN5uxwhwK3qW/TL4xrnY/2V+GcUrpT/F71ihoFhvtdkMTJ
         gGtPcY8hnHVzdAh9arW5YQnUtVAf0E7Befw9fbdnG5Rgrn9ObvJyDzcjZK+SS8Y0zxhn
         sHgPmDu3s3MGUBYnTMzUM4wugPuQodhEJapqeB+2LPq2ev+nhSoFz9XfZ7/BS5e5nSDN
         dLeuP7e0f/NpBmKRr7AfRBSlAG6A8ZW1Q2hl4UGpjco1lElBAQoClEutyhsMaaGj0pDg
         Bnf1Ipbl5jkllAC/C2rY+G124Yso59KJPEDfllh73nBeUP+9muHtibpxNBrQ5knYsoeF
         LyBQ==
X-Gm-Message-State: ANoB5pmAaNmb1x+logwb5F8hrcd577nc1IYQwBwkifgbgJukKqbUVzAl
        oLhiAq5yU84oPgeU6liwkaq4dg==
X-Google-Smtp-Source: AA0mqf4YXBXOnH9OsK0TZEMc2PMrRe/jO9oOYIzciaRSm9223UfIZ4ifnE+9p2O77EQgbOCY8uqxKg==
X-Received: by 2002:aa7:c9cd:0:b0:461:891a:8162 with SMTP id i13-20020aa7c9cd000000b00461891a8162mr1721324edt.398.1668685003881;
        Thu, 17 Nov 2022 03:36:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (mob-5-90-137-239.net.vodafone.it. [5.90.137.239])
        by smtp.gmail.com with ESMTPSA id g3-20020aa7c843000000b0043bbb3535d6sm413897edt.66.2022.11.17.03.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:36:43 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 0/5] clk: imx8mn: miscellaneous cleanups and bug fixes
Date:   Thu, 17 Nov 2022 12:36:32 +0100
Message-Id: <20221117113637.1978703-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series has been tested on the BSH SystemMaster (SMM) S2 board.

Changes in v2:
- Update the commit message.
- Add Fixes tag.
- Maintain IMX8MN_VPU_* constants to not break backward compatibility.
- Update the commit message.
- Add Fixes tag.
- Maintain IMX8MN_VIDEO_PLL1* constants to not break backward
  compatibility.

Dario Binacchi (5):
  clk: imx8mn: rename vpu_pll to m7_alt_pll
  clk: imx: replace osc_hdmi with dummy
  clk: imx: rename video_pll1 to video_pll
  clk: imx8mn: fix imx8mn_sai2_sels clocks list
  clk: imx8mn: fix imx8mn_enet_phy_sels clocks list

 drivers/clk/imx/clk-imx8mn.c             | 116 +++++++++++------------
 include/dt-bindings/clock/imx8mn-clock.h |  24 +++--
 2 files changed, 74 insertions(+), 66 deletions(-)

-- 
2.32.0

