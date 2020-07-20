Return-Path: <SRS0=zu0T=A7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F3DC433E2
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jul 2020 13:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FDBF2070A
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jul 2020 13:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NC6pn24F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgGTN4x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jul 2020 09:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgGTN4w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jul 2020 09:56:52 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DC3C061794
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2020 06:56:52 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id y3so608409wrl.4
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2020 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=teTsd+lyniIxR48cY+GKFo5yHCS0LhKUIulvlmDYWnc=;
        b=NC6pn24FLGswMMMrIpYLJObmNy94hQTIxwG/LhPxWBep1bTaxct/kVtdNqYLyyhEOo
         wP0loCjWASsjV6AqubLqm6paWd8KdwHKkgw4pM8kqwT4KKUvfzUpSriA/TJck4Kmqe3i
         jIEYvArlbMVOBmI8NCuXQbdhp+hLQPo6NoAhGDZlfrRpQFuT0/tsP7Xi39Ee4sNaHk+U
         HYDWNGk2FnTwbcZKLdJ9Rhmj1ohWnihhIxkVGrpEkHlD54IWrl35tRPZRu22ssSCCHew
         3vm/By1CJ9hoXvzGvg3gZ79cPOPDAXwEx0r28khP0WcB0EF57m+gsDBYIbP0PBzgmj8Q
         aCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=teTsd+lyniIxR48cY+GKFo5yHCS0LhKUIulvlmDYWnc=;
        b=i7VaH4Rc0m15nQt9aJ2f9m6S99rfD/DhoCAkVlHnCTXrOO57TRf8P/syPhqtB28Nbm
         03ZtZ8ksvgNRb2XlAxS13wfI5eY4dsb+e0gN5605gtO7F45yG9OmC1ZyGYwfPSTcdfuX
         qO7H2jrjJ5ZM2+3YmXKPjuXjnbFN35ZHgWaTceUQbYZGKM/m6C0mvExdfaxyuO1IAdtE
         ut6lAYAlljHbBih3ioIPlM8rDi4IrPODLrT6An09kBLA7TaXFQfwxDkIDm5bt24rNT8h
         amRacpUCd62YK+OdyckZp51ub1iU4wi/nci8ywM9S+KDSoWkbOWba30XKZq45q0aPJcD
         TIEg==
X-Gm-Message-State: AOAM533x2dvYHID36dh5+SN9S8jxBfAKBHt+X5xvu/k7d3/mvdZ9Tedb
        SvuEVkH7uW6gbisiBMR6ObhVMw==
X-Google-Smtp-Source: ABdhPJxONW60AOezRhV/7wUwc6Z/98omckHJGjfk4KqQ/Q6kYQ+jcgxzddYJnAl/T9fpOxsFZiciyA==
X-Received: by 2002:adf:fe85:: with SMTP id l5mr21311700wrr.333.1595253411068;
        Mon, 20 Jul 2020 06:56:51 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id d10sm32776743wrx.66.2020.07.20.06.56.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 06:56:50 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        robh@kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 0/5] msm8996 CPU scaling support
Date:   Mon, 20 Jul 2020 16:02:15 +0200
Message-Id: <1595253740-29466-1-git-send-email-loic.poulain@linaro.org>
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

v3:
    - Added Ilia and Rajendra s-o-b and contribution description

v4:
    - Rebasing on master
    - Removing obsolete cooling-min-level and cooling-max-level props
    - Align cpu trip nodes names with other boards
    - Fix trip types to passive for cpufreq

v5:
    - Fix reported 0-DAY CI issues, read_cpuid_mpidr usage requires ARM64 conf
    - Fix cpu_crit node labels
    - Dedicated patch for speedbin node name change
    - Added patch description for dtsi patch

v6:
    - Add Acked-by Will tag to l2 kryo accessors patch
    - Fix msm8996,apcc dt binding file (errors reported by dt_binding_check)

Ilia Lin (2):
  soc: qcom: Separate kryo l2 accessors from PMU driver
  dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996

Loic Poulain (3):
  clk: qcom: Add CPU clock driver for msm8996
  arch: arm64: dts: msm8996: Rename speedbin node
  arch: arm64: dts: msm8996: Add CPU opps and thermal

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  54 +++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 310 +++++++++++-
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.h                   |   6 +
 drivers/clk/qcom/clk-cpu-8996.c                    | 538 +++++++++++++++++++++
 drivers/perf/Kconfig                               |   1 +
 drivers/perf/qcom_l2_pmu.c                         |  90 +---
 drivers/soc/qcom/Kconfig                           |   4 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/kryo-l2-accessors.c               |  57 +++
 include/soc/qcom/kryo-l2-accessors.h               |  12 +
 12 files changed, 1010 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
 create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
 create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
 create mode 100644 include/soc/qcom/kryo-l2-accessors.h

-- 
2.7.4

