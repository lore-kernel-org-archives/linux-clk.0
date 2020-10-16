Return-Path: <SRS0=W/YM=DX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD88C433DF
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 14:12:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EBA520866
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 14:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JB0ZR3Fo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408658AbgJPOM4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408656AbgJPOM4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Oct 2020 10:12:56 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF6BC0613D5
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2020 07:12:55 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s9so3086325wro.8
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2020 07:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5OWg3ftk4N++cGTvtidW1nQcYwkBYUJIWAKoaAJoUU=;
        b=JB0ZR3FoUlW/JFBSJAimzbR9cTGbrAYD/+9uf2EoIqoJ/hRqQ1n3E8EfhHxfs8m3WL
         ycOGcMyutOnOYV8TG+udGFQep5jMCWMcsrw1tEeWiQX7ztGyvW/Fab3ECYyjEFerBa0O
         LP3CA5ItQsVYelucyJ7V4BneROyrhjIp2J6HokXuPtEw815t2I9TRxQZF6wkPzEfea87
         l6oNJGfs5EIRZBnDXu5Eim/z8rtxCP0SeQy4nU0qNPEZpDbTWlX1b6CTlDUDyttdjff/
         lkAl84CxVKuYFid5XUFVuVw8v0S8w1/yZjPvdcgEonFYC4K6nstJPdMfwkC1kJVm61+Q
         GmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/5OWg3ftk4N++cGTvtidW1nQcYwkBYUJIWAKoaAJoUU=;
        b=SCgt7IWGOfQwKCthGN/Ww6oowR2VeTcd1e08wET2cgTxj8cvScDrGTstiWnYlj9Rp2
         y6U2gL/CtpXRLqedf4vjniZYO+3pMcMi6XoZPLPoHjEEqwNzAlSMUYNxxV4mPzTKKQJY
         xUuGAyF2q+/Y9YP2C+oZIiTQVM0ec93Z2ButbOAppzOejSe2F4mHPOZqyXbpIkSGlhzb
         V8MAMnA2VTXmcg2QfjPMBjAPS7jgvTH8VRMMVu9LYjQIq5NLOCqUpF8u286Y4N88rzuv
         KWJK6+8H2ecaPn6+GyJazk6Mzzm8TsCUeGyOGAfBDJloOen7Qwd/VO/0SrsZsr2sYdsq
         gXqw==
X-Gm-Message-State: AOAM531M9BvZPqO8FLmRbbBSD3dmjTac4cRXRHSGDsyRrY39Sa+c1ZhO
        hcOSc1ONuG0q95M2dWBb6hlqsg==
X-Google-Smtp-Source: ABdhPJw+syrWSIvIbwdzERHBMz7PuK0C0aRY/cQbmq/KeUEvG0vIAO0FlZzAWNzvuHTOUVhIHXJFEQ==
X-Received: by 2002:a5d:5090:: with SMTP id a16mr4005862wrt.281.1602857574137;
        Fri, 16 Oct 2020 07:12:54 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id p9sm2982284wma.12.2020.10.16.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:12:53 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/4] clk: qcom : add sm8250 LPASS GFM drivers
Date:   Fri, 16 Oct 2020 15:12:37 +0100
Message-Id: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds support for GFM Muxes found in LPASS
(Low Power Audio SubSystem) IP in Audio Clock Controller
and Always ON clock controller.

Clocks derived from these muxes are consumed by LPASS Digital Codec.
Currently the driver for Audio and Always ON clock controller only
supports GFM Muxes, however it should be easy to add more clock
support when required

Changes since v2:
- updated Kconfig text and help as suggested by Stephen
- removed unnecessary header file include
- use fw_name instead of name for parents
- use devm_platform_ioremap_resource

verified dt_binding_check to pass on linux master,

Srinivas Kandagatla (4):
  dt-bindings: clock: Add support for LPASS Audio Clock Controller
  dt-bindings: clock: Add support for LPASS Always ON Controller
  clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
  clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks

 .../bindings/clock/qcom,aoncc-sm8250.yaml     |  58 ++++
 .../bindings/clock/qcom,audiocc-sm8250.yaml   |  58 ++++
 drivers/clk/qcom/Kconfig                      |   6 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/lpass-gfm-sm8250.c           | 320 ++++++++++++++++++
 .../clock/qcom,sm8250-lpass-aoncc.h           |  11 +
 .../clock/qcom,sm8250-lpass-audiocc.h         |  13 +
 7 files changed, 467 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

-- 
2.21.0

