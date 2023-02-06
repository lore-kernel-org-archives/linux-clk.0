Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47974C636CD
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 00:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjBFA1l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Feb 2023 19:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBFA1k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Feb 2023 19:27:40 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1130C4C3D
        for <linux-clk@vger.kernel.org>; Sun,  5 Feb 2023 16:27:39 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id bk15so29824518ejb.9
        for <linux-clk@vger.kernel.org>; Sun, 05 Feb 2023 16:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gp59R213AIVhf0rg6oz7SOZcDdHcOLWRVoAaATbsRQE=;
        b=MEUCBQISThWH+b2Ucyn3XNV+AMeMMPmsEZVQ7+rHhHXpNkNa+RQoysPG6e5naxWS2Y
         5IJzU83D0bTazSZAQKck+IJuX62oVbGUNmFzCTH0Qa6MWCMfvzLiUXfj8f9vALEPQP3o
         izH2SSsc3SxJ24i0QwXLyW6ZdfAhnuW+fH3bsjdeG50qFmN1Dan40TuYjPHBr89706qw
         6vR6Kw1ySwGjoUSwHXIcP8YXj7QNZEHdcQPtZGzp3l8e2l4BNh8CHMvbmq3dQJCZgrgD
         Lnwxrer7WIahNbmjKkjrqqObaX2zMjpv3Lfc1ExE0tS0JUMfK93nnR6UCkKwPhvaAYdC
         BaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gp59R213AIVhf0rg6oz7SOZcDdHcOLWRVoAaATbsRQE=;
        b=gaSQIDERU+OfLdnQWs9wOryaWeSaBT6+0K84+sbaP0J7v0yWTR/HyZBq5BPPRY+im3
         9qEigyylBAul/WkKfTTd08AMNYFqGpDmNpoZKsofrJOvogiN9nr10mWpTQELrWd8Dk4w
         pZ6AE209BgK/UEEZKGgk+UnzJtrR6DI6Q9EXi3h4SaoAfyWef13gSd76ocCjpbumu7Q5
         hLS0yoKdDi22fC8nSGXsFPpNSnHt425kokIe8HJ+1V2+MTyQmUgl8tcjD1MY0FKrE7e4
         X6IupgBJwvWANTSQpeOM4D5P2msE1TjIBVzJ74WXBBElxpcKg1R9E6s59xAn6FNVWUQK
         yw1Q==
X-Gm-Message-State: AO0yUKVAfEgZG3Kco3cIiCkpFQDUhm4zMeCmtN5RMwN4SPvIQQoL0NQA
        WeJ6n+HpW36j+GF2khyeo6tysw==
X-Google-Smtp-Source: AK7set8grDq0upnIL9MazKBpssfMi58EDXVWhNbeRv0+yo9661x6mlbD4FsdAAniDhMUASPf8H68VQ==
X-Received: by 2002:a17:906:5283:b0:879:8752:9fb2 with SMTP id c3-20020a170906528300b0087987529fb2mr19113510ejm.67.1675643257673;
        Sun, 05 Feb 2023 16:27:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 16:27:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] arm64: dts: qcom: sm8350: enable GPU on the HDK board
Date:   Mon,  6 Feb 2023 02:27:26 +0200
Message-Id: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add A660 device to the Qualcomm SM8350 platform and enable it for the
sm8350-hdk board. Unfortunately while adding the GPU & related devices I
noticed that DT nodes on SM8350 are greatly out of the preagreed order,
so patches 4-6 reorder DT nodes to follow the agreement.

Dmitry Baryshkov (8):
  dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
  arm64: dts: qcom: sm8350: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
  dt-bindings: display/msm/gmu: add Adreno 660 support
  arm64: dts: qcom: sm8350: reorder device nodes
  arm64: dts: qcom: sm8350: move more nodes to correct place
  arm64: dts: qcom: sm8350: finish reordering nodes
  arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
  arm64: dts: qcom: sm8350-hdk: enable GPU

 .../bindings/clock/qcom,gpucc-sm8350.yaml     |   71 -
 .../devicetree/bindings/clock/qcom,gpucc.yaml |    2 +
 .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2515 +++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h        |    1 +
 6 files changed, 1359 insertions(+), 1239 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

-- 
2.39.1

