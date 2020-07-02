Return-Path: <SRS0=CvJ6=AN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2412FC433E0
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jul 2020 09:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0003C20702
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jul 2020 09:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROc9lpGY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgGBJeS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jul 2020 05:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgGBJeS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jul 2020 05:34:18 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053F1C08C5C1
        for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2020 02:34:18 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g75so25961912wme.5
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2020 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=wNBd8IKH2tiilVW9f95WBKZLvBm2AFUMvOOUIMAtbjU=;
        b=ROc9lpGYJNr1jvW8KUTWHIl5/yg1514yfak4l0bsnJO+YKrdMUY+pr6c2GYcfDPhyH
         hB6TxIbELlhaCqBq4McBt6aWhBtSRutKQFcfNVkkRaW9D4UQ0bg2Q/21IO2Q7k6Jir7f
         m2GpKy7yNC9Y1RX0MbKtp1ijkmbdr0bo4DPrcb+iu9loAYXOE4sTIqwiHsCpMc3R3Dwx
         ywW02KGTMEr1SRKmFyUpt74J4qUhY9r+sBPMBh5hrbexEGd+9uQl7FnDgJnOTQNGVPZX
         QpMttaIqio83dvyEpVdX09/awsZ2VZGOn+p0rLTngkqWiVieE3zvmZoRdim4v/12ajSd
         7szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wNBd8IKH2tiilVW9f95WBKZLvBm2AFUMvOOUIMAtbjU=;
        b=hhFEP4epEaKIDCb+vcCHrPo8NseyFSBObyFexoBppxPiAJd0FVw8c5UJ+jLvn8HL0q
         Duk1VWKM/Tl/bB5oXBGj3xOxc9+EyJ+cJ7/cecySm1x36IxT4PqGYLlNwePsOjCmimEo
         +QbWbdreBvSkHXjQOp8oRmwjHxWjjy/bEVlqDnh212yAeL71rpAK95CgnVFdvgDMej2k
         TdBGOR7OsWRtGtE/cS4+wJn/D1/KvPKctmrn7DW0EHvMcp2fBaUmS+L0ZDaQpVzLaloB
         4i+pJz0uT+Z8kFZEz54hkjvYo3A9sLOFvq9URish5EjTKXfj3wcHeCmgYaQ34MLBFrnF
         FvUQ==
X-Gm-Message-State: AOAM5305ryEgWn5iKmHwoPtQHa4XPdLjmK1Z9yVotdXYklDBPgfSi7n8
        i0hLwwpBtxAbrI2uLJMfQangBA==
X-Google-Smtp-Source: ABdhPJyI+3aY/huDvFyQGp8SbhwNpNuAtLvQnnARxI8sob2XVnNHABW77w/SdZSe5/6HKrTKYMNPwQ==
X-Received: by 2002:a1c:2d83:: with SMTP id t125mr31554275wmt.187.1593682456705;
        Thu, 02 Jul 2020 02:34:16 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id b184sm10326345wmc.20.2020.07.02.02.34.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 02:34:16 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 0/4] msm8996 CPU scaling suppor
Date:   Thu,  2 Jul 2020 11:39:19 +0200
Message-Id: <1593682763-31368-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

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

