Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED02C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbjAKUFV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235861AbjAKUE6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:04:58 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F49943A1E
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bu8so25187542lfb.4
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4EjPqDqf5rLZ0bHqXvZFVAAysXKcEO63I4Y+lNmlts=;
        b=Xy+O1ciR3bKso3CBpPmfk2iecpJwX9koMougnpf2PXdWAXmFwvB6pAQ1EL6pCXFXMA
         da7bw891zryybms3nCxOncO0ujW4U93tEc5rDwAAKKPdSut3OVgQ540TTC1rrTwykWvN
         51rj92Yl2MbJg7Cci4u3QAwgVUiOZnwfleMFrkCryKJPA+yrYb/Yq3TP9qWq44qqphFp
         +Jm8rnE7Wv4/+8RVooQvUw8eYyGzIQ5rnUAX7pmerTa/BcxwIy8ILtZdYMFbgXBiOGV9
         L9pa792Fr292QV0ufT/jAo6iSIugsoFYO6ED091iU9rpLMgemrAZ+q7w6IKolujjMFW9
         SxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4EjPqDqf5rLZ0bHqXvZFVAAysXKcEO63I4Y+lNmlts=;
        b=nRy1TCezNm1x3fUaRrV6hHuWoxjUIYKpVW87M7hzNM8kKupeZOB8PnYuBzYkH9MkKx
         k2KXrQmYqD6p30TehQeiuiSUiCx0SFdr7xaNRKW5qVw+h6wDYY+Zwf6AGb3YV+us+AMb
         wd4QWqISlE5D7JBI4av2IuuxO7DC8JqNR2y2q9Vq3Ygug5YfUjKPsz2ZBdjgCMjjX/vk
         kDtHKczKp1mBVFdWK7SQVncAHjnXtrMYKNkOsbD/ZPm6twz+FkWzjpyI7V+Pxv2rh7o5
         y2EDXKMiitgUlQkW1nbd0IdIcBN6tzOjhBYSfMt0FE36uimCVqZySeDMf8awc94QxLao
         5K3w==
X-Gm-Message-State: AFqh2kryn5wJ2ipgYWvo7cDFS6Wr9asGFtl3J1KCMrdasFZhy//jxtl4
        mqMd8bCq8a8LQ4f2sE7YBIXhOw==
X-Google-Smtp-Source: AMrXdXt2II4jMeCeP/q/o/0mA1FbJvVhuuJTwdntqZpv2pgXoZWVejkkTJa8IrS78fbX0hQOcQXHWw==
X-Received: by 2002:a05:6512:1515:b0:4a4:8a04:4b37 with SMTP id bq21-20020a056512151500b004a48a044b37mr24871905lfb.32.1673467289018;
        Wed, 11 Jan 2023 12:01:29 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 00/14] clk: qcom: cpu-8996: stability fixes
Date:   Wed, 11 Jan 2023 23:01:14 +0300
Message-Id: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series provides stability fixes for the MSM8996 boot process. It
changes the order of calls during the CPU PLL setup, makes it use GPLL0
(through sys_apcs_aux) during PLL init, finetunes the ACD, etc.

Dependencies: [1], [2]

[1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230111191634.2509616-1-dmitry.baryshkov@linaro.org/

Changes since v1:
 - Included bindings update

Dmitry Baryshkov (14):
  dt-bindings: clock: qcom,msm8996-apcc: add sys_apcs_aux clock
  clk: qcom: clk-alpha-pll: program PLL_TEST/PLL_TEST_U if required
  clk: qcom: cpu-8996: correct PLL programming
  clk: qcom: cpu-8996: fix the init clock rate
  clk: qcom: cpu-8996: support using GPLL0 as SMUX input
  clk: qcom: cpu-8996: skip ACD init if the setup is valid
  clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
  clk: qcom: cpu-8996: setup PLLs before registering clocks
  clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
  clk: qcom: cpu-8996: fix PLL configuration sequence
  clk: qcom: cpu-8996: fix ACD initialization
  clk: qcom: cpu-8996: fix PLL clock ops
  clk: qcom: cpu-8996: change setup sequence to follow vendor kernel
  arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input

 .../bindings/clock/qcom,msm8996-apcc.yaml     |   6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +-
 drivers/clk/qcom/clk-alpha-pll.c              |   5 +
 drivers/clk/qcom/clk-cpu-8996.c               | 145 +++++++++++++-----
 4 files changed, 115 insertions(+), 45 deletions(-)

-- 
2.30.2

