Return-Path: <SRS0=daJW=WW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A92FC3A59E
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 07:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D148120874
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 07:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PSbBqb6X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfHZHZp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Aug 2019 03:25:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44129 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729967AbfHZHZp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Aug 2019 03:25:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id p17so14227213wrf.11
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2019 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vi+5MAs5YPmzj2/dMi2vTYN5J12g6DXwnBkbqOyuq8o=;
        b=PSbBqb6XZgEn2SRTKyC47UhqHnWOTSu2ER6bJb/T9wDwAMRSL/t+cR1GbxWep4zY8t
         bcDEPF+1mpeK6UFcBaLHyp4WK/oe0ow2VML4rHRfZHPw4lekBr+yRp04oU1Jum/Z4fNT
         BePoai6t+Y+ZHNeGEOfKmafXAPXOWjUtyzzoQuu3fA6+iXkrrA8/5z+RFcGTDbt96erC
         z9/RSt2NpYdJkaYkPYmHL5fYtMjKd2GadjZ3gco6SCSnGLp1YlkDecMWBpiG0ywgiqLB
         vbSnRwRVCMz3cLYImyKRaIrWA82ddWcF9IXn7mj3DrbJN7XCW7+iLLz8O2oOa1L7Gfp0
         uqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vi+5MAs5YPmzj2/dMi2vTYN5J12g6DXwnBkbqOyuq8o=;
        b=H5Q4363Jq2cUemmfjbklGz+SNFg5bM5suCsHpX28crT0FRSKoeVQgtlJmiqELagvox
         9fL8gp1SrpilfOyjjZ3m2tVUwOL8FGRVOwUa3xnneuc2UXynBRZ0BLSXolQA+tkKV8Ir
         LnyEA+gWuqQiAbfoFz5O+jJRgXWPwJBRWzXD/hYSjEBymkk/b/Wt1PZRwRiqiFBuFweF
         OzuhQPO6lPH7Xyjekxi7XlSPlwr9qtSXyykPPbbz2yZMe1ngFFsH2JOB26ZJ8OdN0a44
         Des94MhEc9yao67rJv+eccif1PD6qyQ7it7bdOb7/dP7nvKI8YrnsrW8OLRv928o3Y2X
         92bA==
X-Gm-Message-State: APjAAAW1Y80eVvBW0yjav0gBzTX9TvFjMUJQcQNFx4ALw1to1ZYO7Zxd
        xyunGgfybNw51ZE2T/sUlPtuSQ==
X-Google-Smtp-Source: APXvYqybtZYW+ukLWrnL9K43ubqngTyIbj8VraKPg6F0WHgGq8IMkM07gENqA5Th9n+bokqLsYeLPQ==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr20804133wrk.98.1566804343185;
        Mon, 26 Aug 2019 00:25:43 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a26sm10821324wmg.45.2019.08.26.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 00:25:42 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] 0/6] arm64: meson-sm1: add support for DVFS
Date:   Mon, 26 Aug 2019 09:25:34 +0200
Message-Id: <20190826072539.27725-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Following DVFS support for the Amlogic G12A and G12B SoCs, this serie
enables DVFS on the SM1 SoC for the SEI610 board.

The SM1 Clock structure is slightly different because of the Cortex-A55
core used, having the capability for each core of a same cluster to run
at a different frequency thanks to the newly used DynamIQ Shared Unit.

This is why SM1 has a CPU clock tree for each core and for DynamIQ Shared Unit,
with a bypass mux to use the CPU0 instead of the dedicated trees.

The DSU uses a new GP1 PLL as default clock, thus GP1 is added as read-only.

The SM1 OPPs has been taken from the Amlogic Vendor tree, and unlike
G12A only a single version of the SoC is available.

Dependencies:
- patch 6 is based on the "arm64: meson: add support for SM1 Power Domains" serie,
	but is not a strong dependency, it will work without

Changes since v1:
- exposed GP1, DSU and CPU 1,2,3 clock in patch 1

Neil Armstrong (5):
  dt-bindings: clk: meson: add sm1 periph clock controller bindings
  clk: meson: g12a: add support for SM1 GP1 PLL
  clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
  clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks
  arm64: dts: meson-sm1-sei610: enable DVFS

 .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  59 +-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  69 +++
 drivers/clk/meson/g12a.c                      | 544 ++++++++++++++++++
 drivers/clk/meson/g12a.h                      |  24 +-
 include/dt-bindings/clock/g12a-clkc.h         |   5 +
 6 files changed, 697 insertions(+), 5 deletions(-)

-- 
2.22.0

