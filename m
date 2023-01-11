Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290BDC67871
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234282AbjAKTPI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbjAKTO6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:14:58 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0003DBDB
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:14:56 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id f21so12624956ljc.7
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vaIBd0CC37lKBZFOz5cdwnKW8YSH6Qh1+49VQVi/i9Q=;
        b=jXqdERILJY3x0nbobfIpiJucQ5W277/Dw+XLPtmc1n+5F7TkDXMPcbYhf2/vHzIFQc
         XwoCA6E4rwRKdOvuSl1OuTNPxkNFlGdBBrTGTQnhMG7xAcPIPLJSXvzfMSUvWznNOpkV
         B0TOcSgyda0LEUqyu24gsWr0tCESzUL+h5GPr+LFwNdX8Or4FXrFPyN8HjuoA5AIwP7y
         rwtQ10+2gm+tSbi0AP9c8YGYuvkNJ3S5fQ4sbrQCG1+QhcFz5YJFFd5A+sCSUmbbt4cF
         3DiWlpPgha1P4ZUzof2HFTdpkfDYOEMlQJp8irD5ZQEzFpN4yZ/Y+qmnUkxNjLD1WAmI
         lKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaIBd0CC37lKBZFOz5cdwnKW8YSH6Qh1+49VQVi/i9Q=;
        b=3MkLrSLpZdDZY7j3xyjSkm4ZH50x9GDWaLMfhbBBUSH0DNWlil/o9iF1phtM/icAlP
         ASIaQRMwfVnercoKc1oO5juQmOEZdmvieTkqXS6DpxV60soXpaQVp0WAb/+hGKt9mmXD
         9kdgr2GyTjwhWBK1nFA2QhmGJhilRVA+qHlkGVfxBT9YdadQNTuXUn667ouwHV/WSC/q
         RPP3czTT7XAzz4BALtqo6OgjVEKmkq4XAFhkvwkSQaCKet8/792KOBnAFT32K6R3Hp0M
         cvn4F16Pz3Pw89Ukennn4L4gn01odqxE0HcYXHYqaCJUMNaYhAPB+cfpVNgqZaHj5gzO
         ozcA==
X-Gm-Message-State: AFqh2krdfMfx1qswdCr1ghnmSK0TYijh7Zdy8K/i6Dwm+LUtOO8Pngh6
        GcOn6fDyZFUqaq69NHgosjxOhA==
X-Google-Smtp-Source: AMrXdXtZnSmEZtVm9mYx87dyPnUp2PfAWqlQwp0jFiOqupK1w1Pz/eKWHCE0RogYRnCpreYOn77zmg==
X-Received: by 2002:a2e:b056:0:b0:27f:cacd:e7ec with SMTP id d22-20020a2eb056000000b0027fcacde7ecmr13735043ljl.28.1673464494889;
        Wed, 11 Jan 2023 11:14:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r7-20020a2e8e27000000b00289873cce0bsm76343ljk.14.2023.01.11.11.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:14:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] clk: qcom: msm8996: add APCS clock driver
Date:   Wed, 11 Jan 2023 22:14:49 +0300
Message-Id: <20230111191453.2509468-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sys_apcs_aux clock can be used by CPU and CBF clock drivers to drive
those clocks from GPLL0 while doing initial setup. Add simple driver to
setup and export this clock.

Dmitry Baryshkov (4):
  dt-bindings: mailbox: qcom: correct the list of platforms using clocks
  dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
  mailbox: qcom-apcs-ipc: enable APCS clock device for MSM8996
  clk: qcom: add the driver for the MSM8996 APCS clocks

 .../mailbox/qcom,apcs-kpss-global.yaml        | 10 +--
 drivers/clk/qcom/Makefile                     |  2 +-
 drivers/clk/qcom/apcs-msm8996.c               | 77 +++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |  2 +-
 4 files changed, 81 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/qcom/apcs-msm8996.c

-- 
2.30.2

