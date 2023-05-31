Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CB1C77B73
	for <linux-clk@archiver.kernel.org>; Wed, 31 May 2023 09:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234765AbjEaJBc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 May 2023 05:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjEaJBb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 May 2023 05:01:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4324C0
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 02:01:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so6530265e87.3
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 02:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685523688; x=1688115688;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fuKl8R0SVaBERImB5qO7yJ/wWAuRKKhQv+u4wxwoJUU=;
        b=WQaaaPoAY+5xaX6AhZ26wJMpfoene/Rnf8nw30qp3KQuoSJ4IHSHtT1W2Y7ALtUo72
         XLgSSsW+MM9roC71ysqr4DzEd1JsmT2v8mNvLrqQoh4/ZH8xNuX9fETelOWwU35AGAhW
         EaWbRLUEM5/+JFdDFKb4wZaRdJrj3AEFTj/arEAepP914gKOTB/92uAkWyh+HEySNKMo
         TOvqS2iKgp7Z5QMwxZ4aIqDAeoq10zXBCaxLQ0hfAGsCC8LNGdQ9JzGWcrz8vYiEKIIa
         vi0vP6J54Q5qLVpvITOXSC4CiMInddwWxD8IqCwnrnkiV5w62AlLjfoVAzZN08hlHM7f
         h1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523688; x=1688115688;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuKl8R0SVaBERImB5qO7yJ/wWAuRKKhQv+u4wxwoJUU=;
        b=EQ63xifJExUp6OVGDEWBd6WgiOAEG/94N3Hy/4y5w+fLtARGuo/RRS1gHpyaDbOIKy
         C37FYGcvZFCWtNImOD7Kl8b1JMGxkmifixXfpK2DcLQotxGz8MSerjYz/bNSTnk9OeUT
         hPPXe8yS662nBfMQybK9d3xIXeVzSxYIRDQDtFrsXTd3LNJi44sby1WtgseWuwb2T+Il
         hwfqBOH28TSfawCvp/JB/eDyp63Sgl9Q9joyubSYycJsRmKUdubawHm5HeGD0KRrsT/F
         QPl7htryiGTLYvWfwsYvMvGPoELWV2jXbDoIjwaom4NUeHAFEPw4/kFAGlBbSIXZvtNd
         bBnw==
X-Gm-Message-State: AC+VfDxyZeB3bXwbbZV/rVTzV6+rcp6xmXDyj2avXhifZWx82TclVbdr
        9S4HUyprXbtnyyixBkE4qRNyhg==
X-Google-Smtp-Source: ACHHUZ6kOWU5LAZJfE6qDV5Re7ast+TK1RDPbZTIfxwpSoKb2KmFiCQLQcn1bSEZMyIXjLUmsCMJ7A==
X-Received: by 2002:a2e:360e:0:b0:2ae:ce63:a380 with SMTP id d14-20020a2e360e000000b002aece63a380mr2165383lja.17.1685523688006;
        Wed, 31 May 2023 02:01:28 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id f4-20020a2e9184000000b002adbe01cd69sm3217446ljg.9.2023.05.31.02.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 02:01:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] MMCC MSM8998 fixes
Date:   Wed, 31 May 2023 11:01:19 +0200
Message-Id: <20230531-topic-8998_mmssclk-v1-0-2b5a8fc90991@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8Md2QC/x2N0QrCMAwAf2Xk2cDaKXb+ioi0XeqCXTcaHYOxf
 zf4eAfH7SBUmQRuzQ6VVhaei4I5NRBHX16EPCiDbW3XXjqDn3nhiK7v3XOaRGJ+YxrOwaZwTS4
 a0DB4IQzVlzhqWr45q1wqJd7+p/vjOH6LfKqQeQAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685523686; l=1107;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uWXJDM1O+vnkxqo9vnGAbSBIC66g11fjF+/qeDi1FPs=;
 b=lWRBkIEhd8Fer7WmwpCgmQjf297db9v60VEAtfw1fMCzhY8C/o5Lx9myY+V/caOsGiCxph89Q
 gb0qmEJ0LyaDmj79ij7RbxaG3NTPG4Yk9JDsG6BxfeW01Nc/QybDP3p
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

8998 has a couple of issues related to its clock controllers. This series
attemps to fix some of them.

The DT patch should go in first for bisectability, otherwise
clk/pd_ignore_unused will need to be used, as the SMMU GDSC is no longer
considered always-on.

This series results in less "clk stuck at 'on/off'" messages and should
marginally reduce power consumption.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      arm64: dts: qcom: msm8998: Properly describe MMSS SMMU
      clk: qcom: gcc-msm8998: Don't check halt bit on some branch clks
      clk: qcom: mmcc-msm8998: Don't check halt bit on some branch clks
      clk: qcom: mmcc-msm8998: Fix the SMMU GDSC

 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 +++++---
 drivers/clk/qcom/gcc-msm8998.c        | 6 +++---
 drivers/clk/qcom/mmcc-msm8998.c       | 7 ++++++-
 3 files changed, 14 insertions(+), 7 deletions(-)
---
base-commit: d4cee89031c80066ec461bb77b5e13a4f37d5fd2
change-id: 20230531-topic-8998_mmssclk-fd4b2fb7f8c1

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

