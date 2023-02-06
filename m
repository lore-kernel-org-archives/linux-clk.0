Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9876EC6379F
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 14:57:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjBFO5S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Feb 2023 09:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjBFO5P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2023 09:57:15 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140E4244A7
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 06:57:11 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id gr7so34929695ejb.5
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 06:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cLuf1U+2WjifV8fnrslcwZDFA4TZvCGB2iPkwtWqNUI=;
        b=oq9jViBl3HA8dQj59yZsQcWYKhAEvJWr1Mqzc1nDjWd3kRLMlEJmDIhfOc2l+p9NLd
         sEyjvRaMXAsm/bYtTpQnIz65QqWwNZzD2ixnXeIv/n7h0wwjcYKGqo5UlUhhHj/+UxhN
         Vjip+0N5Gcg9eBr6e9L2FgnlD02pMQtDmefHpu6L6q15uOGJwGLd6Q+iHLS5qDhwcnpv
         jcH/BDXAdXafNKaM0EBgworEii3bTIRcz1nDLBmzdKEdZFuwosxwjqEO4W6y868kqLfD
         btVyftrdECwXZvuYQTLDMsH366OL3edNWQJg4/Ues9yHsG8FHbMc5frF17qLpR6RVgFB
         TLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLuf1U+2WjifV8fnrslcwZDFA4TZvCGB2iPkwtWqNUI=;
        b=AlAE9hmNuUOCB5o2EQsnUmuNd+O9eTLOMVzEMI5iuat9bLvzfBMPZRHPIJNedRl6UW
         FpU1irUcPRKa4wYDgREWi8rNIEhF8Heoc6qsv9HN4nEknS1pwUMmp9/82oBTz/vXn/QM
         JNPqi8rESDZHKBCS/Xs4vNdkx/4d3hblsP79MWFrZejemlfkWy/s1c58mCaHQIcgo5/A
         U0f2YpIuDB3GGiEfYiKiPEjdQY4GV5CbMFEU1sdGfdhC8uMFv6iTWxTFzL4jfdHJ3NRL
         /1838l0s009bA/khdrKpqG8Kar1So2y48qtxLzRoJpkvCQtGqOlNPgt1eXrgaAue32H0
         z8YQ==
X-Gm-Message-State: AO0yUKWSToSFvoto0CWb+68KYvz5jdGgwfi/YQamwDPmZSKWP/P37e9z
        BuCDKvtodNTlpTpC3NWD6q6BK7Y/Hmy3LjWk
X-Google-Smtp-Source: AK7set/oKvZyc+ZrfLJPgnfOVLJVKoAm0Z0SgsTUoA8rN3b3dRK6zhySANFVfe+x2ByyCb7N0W7vLw==
X-Received: by 2002:a17:907:7ba9:b0:87b:d3dd:e0ca with SMTP id ne41-20020a1709077ba900b0087bd3dde0camr13140091ejc.26.1675695429234;
        Mon, 06 Feb 2023 06:57:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:08 -0800 (PST)
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
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/8] arm64: dts: qcom: sm8350: enable GPU on the HDK board
Date:   Mon,  6 Feb 2023 16:56:59 +0200
Message-Id: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
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

Changes since v1:
- Fixed the subject and commit message for patch 1
- Fixed GMU's clocks to follow the vendor kernel
- Marked Adreno SMMU as dma-coherent
- Dropped comments targeting sm8350 v1, we do not support that chip
  revision.

Dmitry Baryshkov (8):
  dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
  dt-bindings: power: qcom,rpmpd: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
 include/dt-bindings/power/qcom-rpmpd.h        |    1 +
 6 files changed, 1357 insertions(+), 1238 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

-- 
2.39.1

