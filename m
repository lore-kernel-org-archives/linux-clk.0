Return-Path: <SRS0=d3cq=7R=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA14C433DF
	for <linux-clk@archiver.kernel.org>; Thu,  4 Jun 2020 10:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 341F1206C3
	for <linux-clk@archiver.kernel.org>; Thu,  4 Jun 2020 10:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4k/BVmk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgFDKan (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Jun 2020 06:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgFDKan (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Jun 2020 06:30:43 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B35C03E96E
        for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2020 03:30:43 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r15so5037545wmh.5
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2020 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=EWNm3NkDBVYhFyhLF4mehVUi3D/imqLB+Iv3Oc1iN7k=;
        b=B4k/BVmkVBJSyMzwQlfKwiXKJNeOpcC45lc0uhqx6lm0V9bJO09PHKwzxlBDjhXMMD
         Kg1AfG6ZCjHYclQSt+thvFHKAAamYKETrdvYcsmddNy3PXnFNGLBh2c8wcdBxIoZhTDo
         4ggwTDj+ckoyRuDRS9nXfVWUq7uY7Rd2KZudBg2ch/tN4Hz7qalbnqL7FlzdkoGf7Xzb
         NsFLgrpOA5k7Fp226BUc/cSj6cPhWVUmKoS5b00wdxNgLIZihpqjDBJGOn8m4lIKffB+
         F4ixPYrnK/I7i9+2y6wB4eNuGGUzu5qwaNEgyQsnbPaNolY+Z13ejkvsITEJ12fZ90fg
         SyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EWNm3NkDBVYhFyhLF4mehVUi3D/imqLB+Iv3Oc1iN7k=;
        b=GKrMLCHavUuVCYbOWgIl8AlbEeBA+gLbQ1I9NnuuDt78sbTCPQtzLkkJXKoexEKZcC
         amNsyzuH9PfQL9hkaMtfYmEOTMrU4SxyBiJdI+nlGyPdYQOA7B1Q09erw5pDxeWzx1mm
         ymFAOCmklcu9IFAjt0nwShjdQe+r3OCKPBvwBLYAESstHa7+JrcGfyNRc55Bw2mtFS+4
         ZR0m1ZTUPVWQtV80WH5Ahtv0AeSunnzyXH7RGJuT5H6SX/uP4Whwjh/5KKF7gVrb4g0b
         PKIB9ccsmTPYBcqMWHSBQU0oxjJDRkSJd3zI3UDbsPSMHtVsHHiVpqBf9aNuanszI0ya
         5f6g==
X-Gm-Message-State: AOAM530sh0uYlWOz+8lGFlx0G0SQGIYzrVUhTd2YhUqJX8YOCZQXW6Gx
        tgYlE6sJxY0pEcuXJhwkqqweXw==
X-Google-Smtp-Source: ABdhPJzf/1clym7OXu6bnRSvhn63HTelClDRUgvdZJwzYPFf7Vk0wu+nRY8GZDC+r/Upm42LoZy8TA==
X-Received: by 2002:a1c:7e43:: with SMTP id z64mr3289692wmc.72.1591266641690;
        Thu, 04 Jun 2020 03:30:41 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id n19sm6510164wmi.33.2020.06.04.03.30.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2020 03:30:41 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 0/4]  msm8996 CPU scaling support
Date:   Thu,  4 Jun 2020 12:35:23 +0200
Message-Id: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series is a new tentative for adding MSM8996 CPU scaling support
based on the previous Ilia's series, with some of the latest comments
addressed.

This series has been tested with dragonboard-820c and cpufreq-bench.
The CPU opps are limited to maximum nominal frequencies (no turbo).

v2:
    - Converted dt bindings to YAML
    - Various fixes from Stephen inputs
    - Removed useless wmb barrier, MODULE_ALIAS
    - Use helpers like struct_size() and devm_platform_ioremap_resource()
    - Coding style fixes + comments
    - Kconfig: remove useless depends
    - Added Co-developed-by tag

Ilia Lin (2):
  soc: qcom: Separate kryo l2 accessors from PMU driver
  dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996

Loic Poulain (2):
  clk: qcom: Add CPU clock driver for msm8996
  arch: arm64: dts: msm8996: Add opp and thermal

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  56 +++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 338 ++++++++++++-
 drivers/clk/qcom/Kconfig                           |   8 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.h                   |   6 +
 drivers/clk/qcom/clk-cpu-8996.c                    | 538 +++++++++++++++++++++
 drivers/perf/Kconfig                               |   1 +
 drivers/perf/qcom_l2_pmu.c                         |  90 +---
 drivers/soc/qcom/Kconfig                           |   3 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/kryo-l2-accessors.c               |  57 +++
 include/soc/qcom/kryo-l2-accessors.h               |  12 +
 12 files changed, 1030 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
 create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
 create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
 create mode 100644 include/soc/qcom/kryo-l2-accessors.h

-- 
2.7.4

