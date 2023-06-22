Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5D4EB64DC
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jun 2023 11:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbjFVL5x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jun 2023 07:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbjFVL5w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Jun 2023 07:57:52 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD10171C
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 04:57:50 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f122ff663eso9724057e87.2
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 04:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687435068; x=1690027068;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vLvgCImQ9a6c8UHP9511WNjq7ZpYfkFoY/txai7EhQ=;
        b=m7bH1SNkbu9RFfe81Rnm7hMLSLrrvUeoEb+fhqZlYXBD9tvTNeeh66t2oEW9BRTWME
         OXJhjxdWDIkD9RQXvL1B7G2TP0HsgcY9w/vvEmzdSq0M7mh5WPf0Vee+Q/NMGBbeFkiz
         cYofI8tmuydbWk5hI/WAvHb44JgvKpqZI00ELSij8Z/giAW0ZhkmSOa5/LE+RlH478tD
         cR7xn/KG0n0+Jc1Dq9xriH7o0XqXblngtH2iuyCAQmkdMIkDqJcSyahZk7nWzzOROv6u
         XKy3LxwxI9ftNgDEz5kCzJ8hOZgEBWwUdJ99J7Umcpun8qV91JKLd9aaLE6ahvmCNdkt
         exqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435068; x=1690027068;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vLvgCImQ9a6c8UHP9511WNjq7ZpYfkFoY/txai7EhQ=;
        b=gqenvVxlLs8c/vhHE//4hxlb5xuBPM9KPI8uOeenNMZGZ50CtCS4+azCsQzyrkhEjB
         ElFBjAfwwumjAeQ9TAMhIR6gmtNZxLe5U/wbgHWE2kdZW9bh2EbmzJWovRQwydSYYM7O
         ezFh2m9YavhkDNkAcdu8UB1B+HOB+vckIG+7kKNwDTzdgGXQAlXzBEdpVGehBeb0JqU9
         SblJhPOSFSvp1LexuDa0PKExPRMq94uUuK3UvAa+Fvf/hHJekc49X2CxafH9wjtbwNyS
         6sDR3PzR8GLlluSKTkGuVU0RFIV4+Munos8PimO1JcoFvkrJ8Di3e8N5ag9/s6shIH1x
         izmw==
X-Gm-Message-State: AC+VfDzc+8d6q9OWx/r1SPhRvIFJaH+f6KzBba3psf3c19soGlvtocpH
        uuXjiszOHlr+s2Z092LTu1dHvi8K4icKS64ZFQk=
X-Google-Smtp-Source: ACHHUZ75TQv59aPcG+cUl0gm+4IQIcCIW0/2JpOMmCtweguyXGnApY1koGY2jnPFPAc4RCNh6R6QyA==
X-Received: by 2002:a05:6512:3286:b0:4f8:7127:9b9d with SMTP id p6-20020a056512328600b004f871279b9dmr1166186lfe.37.1687435068388;
        Thu, 22 Jun 2023 04:57:48 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id eq21-20020a056512489500b004f4c3feb9fbsm1099235lfb.61.2023.06.22.04.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:57:48 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/9] MSM8998 clk cleanups and fixups
Date:   Thu, 22 Jun 2023 13:57:40 +0200
Message-Id: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQ3lGQC/x2NQQqDMBAAvyJ77kJMRBO/UnpI0lUXQ5TEloL4d
 5ceZ2CYEyoVpgpjc0KhL1feskD7aCAuPs+E/BYGrbRRvdZ4bDtHtM7ZmFbsTDs4209GKQvSBF8
 JQ/E5LlLlT0oi90IT//6T5+u6bmFhcrt0AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687435067; l=1563;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=beSw4DerolKlnlu7guVjHR7VZCdVcgsNzWLv04yx0RQ=;
 b=dmTfAs5cKF5NrvBkeFPCusReqVMFWBp/0hRrk9aYHwz75DJmkGWnJPX/Oj2+o2SaWp6w7ePHK
 i3dGNgZsQh9B+YeOuoMrV2nd7npc73BDOyCcDhcbbylQw8vMwVvny8O
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MSM8998 clock controller drivers have some rough edges around whether
and how Linux should touch them, which this series tries to sand down
a bit.

MSM8998 maple seems not to explode, please give it a spin on your boards.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (9):
      dt-bindings: clk: qcom,gcc-msm8998: Add missing GPU/MMSS GPLL0 legs
      dt-bindings: clock: qcom,mmcc: Add GPLL0_DIV for MSM8998
      clk: qcom: gcc-msm8998: Control MMSS and GPUSS GPLL0 outputs properly
      clk: qcom: mmcc-msm8998: Properly consume GPLL0 inputs
      clk: qcom: gpucc-msm8998: Use the correct GPLL0 leg with old DTs
      clk: qcom: gcc-msm8998: Don't check halt bit on some branch clks
      clk: qcom: gcc-msm8998: Don't poke at some BIMC GPU clocks
      arm64: dts: qcom: msm8998: Use the correct GPLL0 leg for GPUCC
      arm64: dts: qcom: msm8998: Use the correct GPLL0_DIV leg for MMCC

 .../devicetree/bindings/clock/qcom,mmcc.yaml       |  2 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  8 +-
 drivers/clk/qcom/gcc-msm8998.c                     | 92 ++++++++++++++--------
 drivers/clk/qcom/gpucc-msm8998.c                   |  2 +-
 drivers/clk/qcom/mmcc-msm8998.c                    | 35 ++------
 include/dt-bindings/clock/qcom,gcc-msm8998.h       |  3 +
 6 files changed, 80 insertions(+), 62 deletions(-)
---
base-commit: c87d46a9e8ebd2f2c3960927b1d21687096d1109
change-id: 20230622-topic-8998clk-4317986f3008

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

