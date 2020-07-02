Return-Path: <SRS0=CvJ6=AN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE50C433E0
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jul 2020 13:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7062520772
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jul 2020 13:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpsQbCTu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgGBNLA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jul 2020 09:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgGBNK7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jul 2020 09:10:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75658C08C5DC
        for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2020 06:10:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o11so28285719wrv.9
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2020 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Q5t3l+nsqnYvfPt63Fkeg1rs+NFzmeHts4X7hoKySws=;
        b=gpsQbCTuawJSVs7F2nP4cXoGm8Z9iOO1MSqH/cldO+L4QI0tglxyxgtLCvjiXPBJDb
         y4KP8k5+IXjR1xD3iAWuHzsawx4wjRa+Q8zJXE8lb8fE7Yk3Nf45xIm4hCX9ZW4An4di
         /+agb/bkJStn9QX3Uuk6q6B55YZac0xlPqAe4ndsWCmaqeo5OE7SpDRQUGQ6y39PIvZ7
         88NoguidCzUzpTeWhGMpADols9r6smRy0fHkuONje1tktksfYDrzPzixuuOHjBavUoO0
         pX/3VlsYwXA95rt/pAHx0bNgKxuLkABcV8sJK/CAMZnQO6JY3+G+ozneaDSaPYGb6PZ0
         XeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q5t3l+nsqnYvfPt63Fkeg1rs+NFzmeHts4X7hoKySws=;
        b=s/nxC16YWcJwdQDFxHWX8mUaXPZH9FZQr9rWSD/RRCBS84RuYk9KNRYlLYv+wwbxkF
         XzV8T7/jk6lWxEQoX1TuO6GQIpy/2j3YHlB4aNrXYf2h5geAjEpV8D4S9bROwgs6/dMz
         WY1FHC5H/tnXbA5oEgmc5sQaWLwBsPXXYsclYW1iupPb0RoHF86/TvURzXqcEn4/gP50
         W36sjtO4DoknD82fHxHDw9voRty1EttVevlql6BuS/FTolxkksWrpUJt3T47LPfZMIwN
         E3HhNziP4G7vHr7GZWmpKxYLopotxT0TRhnErBqeCi7c0KFH7V8aWqzcgYOPEkBWPuJK
         hI1w==
X-Gm-Message-State: AOAM5310ZQvnWF+lB/j6fkQQPJ+JihVQTWQEok64z5GgpWnI3F96TxcH
        z1Ai84YFom17Eu4ESV5oa9dLWw==
X-Google-Smtp-Source: ABdhPJwJ282Z5BK0YJ8Ba7D+0AXIUESIEAxtravsTJ/G2MwFYeTTOsSGWKd8KW3OI719H080wAP4sg==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr30993494wrr.196.1593695458138;
        Thu, 02 Jul 2020 06:10:58 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id 140sm5977248wmb.15.2020.07.02.06.10.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 06:10:57 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, amit.kucheria@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 0/4] msm8996 CPU scaling support
Date:   Thu,  2 Jul 2020 15:15:57 +0200
Message-Id: <1593695762-19823-1-git-send-email-loic.poulain@linaro.org>
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

Ilia Lin (2):
  soc: qcom: Separate kryo l2 accessors from PMU driver
  dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996

Loic Poulain (2):
  clk: qcom: Add CPU clock driver for msm8996
  arch: arm64: dts: msm8996: Add opp and thermal

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  56 +++
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 318 +++++++++++-
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
 12 files changed, 1014 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
 create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
 create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
 create mode 100644 include/soc/qcom/kryo-l2-accessors.h

-- 
2.7.4

