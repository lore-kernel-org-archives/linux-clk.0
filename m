Return-Path: <SRS0=eZcb=7X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3A9C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 08:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50F1B2064C
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jun 2020 08:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O3FQn37F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgFJIaS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jun 2020 04:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgFJIaR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Jun 2020 04:30:17 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D79CC03E96F
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 01:30:17 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so1227643wrc.7
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7qPvfAK/wIPUWfgqcjzBx41M5rLQsIgGSEZcayEYX00=;
        b=O3FQn37Fw3dtMfw8SHlpmRruARSNx8N74Lbw/4/ptHL+LNio0fm7wjTBotWaYwVSz3
         4oy5ByC/54ljbNGuRvxSQNrTfw3cuisPIm0I2GNYTq7axQGCBJ8QwslTPzkl3L4ShVwF
         Hy18ra+U8NdU8JWLBzIw8eWkcUbSN1xPE7YE/k4O3Ai2zCyhUxV2zWAqrLUXOnUbW3i8
         injhSJjF2Urlm2O5UWnm/gGdjh2zTYMWNOfWd5XiYFvHzABBqVz6NwxmxM4XizSyWF1e
         VOJoZzZys/yzUtovAowiySYbNi4lPeC7viiqLivn8zYAY7Yo4WEzGgugorTaD1aqpcoW
         NuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7qPvfAK/wIPUWfgqcjzBx41M5rLQsIgGSEZcayEYX00=;
        b=JBSt6Q4dSTUrIcxM22UU/xjAvqoQaW2vNelljFYMsrK9lpMUf/WmLk6Y4stYbpdlRk
         ZpRa7rDYg8Aug1d2Vaozu/wuETBqWfeZyfYaa3WOWohmvklM1Ym4KV63JKRrwHrOTqta
         ml4XNgu8AOzOY3HoWGshNgC26ZwRNwkkLI0NFvzN2cqPwr7HiYsKaF4gu/44nJdjhjjS
         K+VRXeeclCtT8Y02uFrPo/vBH2oRGlCXE/PVVLRsCqNP3hKAVvKwgqF7plFhev5lBYqW
         xV4X+ryp+DK2RK2eGj+z2RBm6ProDG9bv/yGwiundCEJeL4RPZOXEOIIvbJkEunIdCvB
         tpOQ==
X-Gm-Message-State: AOAM531lcFxLzONcBXBhIA14D8QS5m2KirDuCIZ1NsfgCpYiejbFelyW
        yZOiNGtlWVwqt6TW3Cga0hZ/JQ==
X-Google-Smtp-Source: ABdhPJxZayRZhbDG1jRiWiM/W4R2KNOE8PzRBwn1FswUR3YH+jLRTZo8j6B+3fmNEqqWXEDnTF+1Rg==
X-Received: by 2002:adf:93a3:: with SMTP id 32mr2321138wrp.344.1591777815512;
        Wed, 10 Jun 2020 01:30:15 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
        by smtp.gmail.com with ESMTPSA id u13sm6958974wrp.53.2020.06.10.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 01:30:14 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] clk: meson: g12a: Add the NNA source clocks
Date:   Wed, 10 Jun 2020 10:30:10 +0200
Message-Id: <20200610083012.5024-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds the Neural Network Accelerator source clocks present
on the Amlogic SM1 SoCs family.

Dmitry Shmidt (2):
  dt-bindings: clk: g12a-clkc: Add NNA CLK Source clock IDs
  clk: meson: g12a: Add support for NNA CLK source clocks

 drivers/clk/meson/g12a.c              | 119 ++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |   7 +-
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 3 files changed, 127 insertions(+), 1 deletion(-)

-- 
2.22.0

