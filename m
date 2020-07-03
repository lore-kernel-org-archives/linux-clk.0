Return-Path: <SRS0=ceW6=AO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B342C433E0
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jul 2020 08:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EAF8206DF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jul 2020 08:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6I+Ljmv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgGCIoc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jul 2020 04:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgGCIob (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jul 2020 04:44:31 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F383C08C5DD
        for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2020 01:44:31 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f7so28784308wrw.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2020 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=i0v/KX7PDGOWBhmBu7PvBmI/9TXzkIhiF8/roULCWIA=;
        b=n6I+Ljmv6tykD9SmTWqXiDnCdtPvc5J2ksK9dHqUMfPQS4RGsnIbwOdgQN8seJJwGb
         aHl24m/6220+pgWljVZBTHjlJmMlDNXEeBIxsRquq7mB+DmKO8L9j5eTUUkAW614Rauj
         0+wCJBkvtHjKR9WQiXSglGbKeE0e24ov0sYNhFft+U3ERrYEe1jY6T23HjVJ2QEM2+Go
         7E7fWWoWzyhE2uZo2Hz2vC8jASUJ2BhjO9TUix6O2eW1CeSpwBJFxmDryQUY0xX6kf2G
         MWmM2s8Mi2WIs5HLvvkSEbBwsRvpbi/XuBIuzt1OSkjaqZST89zABMbVSQ1OaeG2eXDn
         jZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i0v/KX7PDGOWBhmBu7PvBmI/9TXzkIhiF8/roULCWIA=;
        b=gVdIchY+OJUFZ+O01sHUTKQusrzhGl1Lkx+pa2rL9fu8N0qjc+92jayEXOS6cOOUMX
         p6EPENcH2IU/vOiHhNDCGgONzTgVelUizXW/H9n7wyq9erGjIV///KyGsBNUjCDmjhbt
         coCeniZuMLP85Pms534xiV90sfyALIczOTJsadbQuSCnYqfuHdmHbTgH2Q3fU8SrHWD+
         NkSf5gyV1n7U+lpJ0ShDolN14E6mV/r8HSUPJC1Up40BRmeFgtp4CRLN0S7HQMEkgymS
         FS9ZzJdJuVNx/m1gVKtv7dbDAqWB+81K8m3lpSMS66uA/VmNHzakogmNIGfh+x/61WmT
         wOdA==
X-Gm-Message-State: AOAM532EDuSQsfv5E0aSELPH8m0hs6cxetTaZfcz78ndt2M8fRYWA5y3
        BLltCFm9hIDusHeCbQA24kZshA==
X-Google-Smtp-Source: ABdhPJzjWkKwmqcI+aNTUH+oBtattcrt2OYHyXq2qUMWmTUgoRABi6MyIswjOQOmZpwb1V7n41GSEg==
X-Received: by 2002:adf:dfd1:: with SMTP id q17mr33645090wrn.94.1593765870024;
        Fri, 03 Jul 2020 01:44:30 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id b18sm4213116wrs.46.2020.07.03.01.44.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jul 2020 01:44:29 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 0/5] msm8996 CPU scaling support
Date:   Fri,  3 Jul 2020 10:49:40 +0200
Message-Id: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
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

Ilia Lin (2):
  soc: qcom: Separate kryo l2 accessors from PMU driver
  dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996

Loic Poulain (3):
  clk: qcom: Add CPU clock driver for msm8996
  arch: arm64: dts: msm8996: Rename speedbin node
  arch: arm64: dts: msm8996: Add CPU opps and thermal

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  56 +++
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
 12 files changed, 1012 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
 create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
 create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
 create mode 100644 include/soc/qcom/kryo-l2-accessors.h

--
2.7.4
