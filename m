Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9360EC77B7D
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 16:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjEQQku (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 12:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjEQQkt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 12:40:49 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43251B3
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 09:40:48 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f37b860173so1208388e87.2
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684341646; x=1686933646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xdDvmJDjqeVtU3worCYJR7EC7H+K8m1I2mTyMfP2vk=;
        b=V7aY0VMoo5ZCcwwrG13zZge67I985EbaaSZQLLuVnRLN98V8FQ39lsc9A0ZrgMuh8a
         IgQTjCzBy6vRpq1VFMhrsUyGsw4kZaqpy9A+mky9v41JtOnW3EFhLcGao4VtA5WGsbEw
         DUMmtlJl4V7VtL8hxXA7CmEZ5ObVcVRmN6vTzvnlm9ZxbYx/r3mAEaR6HApQmcRJKK8n
         gNS0dnLy8+WmNhYTVgD7Q8Jc2boE+7WJlJ2BjMtkX65QuvEFivxBp1nVjSWCq+B4cKN7
         UD/BHgMp75p10FEd3nDx8/VDO1cGKaEpYS/psffBxY8FNky3KLEutp0+VLd6zzAttq+x
         dOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684341646; x=1686933646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xdDvmJDjqeVtU3worCYJR7EC7H+K8m1I2mTyMfP2vk=;
        b=D7aDLGseTxQ/Tg3yHCoDuu195fjAi5EmSTSdhSRh8VtZXLQzm0UQUvz+ZlforbJpDr
         +gFmj9FyYIavSpjEPeflkqzk1TUDpxXqGnbu/D6O+iNerj3jqyAtomxTs/TZaZeuhHGS
         f9Oz4HAFPiF6FUJGx9IH2CBgy3GbOxax0uTDtFJLSj9e9vaubGhse5QrD9JglI2tQyBX
         MqQFfW2IDa7+00cH8y3jibICFBgehfyq1K84sUVLXxm/9CxTVyUPY6+B/1zA46KLSum7
         0Zxpz/dpQyW7KUBDoWvquUT3XvoBSTlnq4ANjli3eetW6V2YjYBPk5JBSVe/38yHHk05
         FYKA==
X-Gm-Message-State: AC+VfDxDWWqMrPXYr2J9YuiHFch0fItN9ueAvdHmO/LW3+nVObkt2ZDJ
        J6G15KtekUxOyOGT+ZabY5pibpo1y6wFCxqghyQ=
X-Google-Smtp-Source: ACHHUZ6xO2wXHIeSKpXgjPvEao6Re1B1D5J4M9TVxhe62Z8YP9EkytjJcIfVEuvmU44MgXxjEUY6cA==
X-Received: by 2002:a2e:4949:0:b0:2a7:6d19:b569 with SMTP id b9-20020a2e4949000000b002a76d19b569mr8845521ljd.53.1684341646547;
        Wed, 17 May 2023 09:40:46 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id 9-20020a05651c040900b002a8c271de33sm1919259lja.67.2023.05.17.09.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:40:46 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] SM8450 GPUCC
Date:   Wed, 17 May 2023 18:40:37 +0200
Message-Id: <20230517-topic-waipio-gpucc-v1-0-4f40e282af1d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIUDZWQC/x2NQQqDMBAAvyJ7dkFNq+JXpIdkXXVBkpBoFcS/d
 +lxBoa5IXMSzjAUNyT+SpbgFeqyAFqtXxhlUoamakz1rjvcQxTC00qUgEs8iLDtp9Z0vTHuRaC
 hs5nRJetp1dQf26YyJp7l+p/Gz/P8AJUHtGd5AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684341644; l=1188;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=e/lggVuMBS0PkLLWqBbNb2RZISCTXYwBvDmZ80YVsjY=;
 b=z9/TsFBmiMuoPWT2k/rdDOETkZ0VZaNOt070SFR76uEiO9x6oS1NDGGhTMQEuJ7ur57g0hEii
 sPOsfM5rzz1DqYc3WwUekvnePl/6qb62vMU/O4Y1pyPp64uyKusaGEa
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Introduce hardware clock control to ultimately avoid spurious rcg
(re)configurations and introduce GPUCC for SM8450.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      dt-bindings: clock: Add Qcom SM8450 GPUCC
      clk: qcom: rcg2: Make hw_clk_ctrl toggleable
      clk: qcom: gcc-sm8450: Enable hw_clk_ctrl
      clk: qcom: Add support for SM8450 GPUCC

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  73 ++
 drivers/clk/qcom/Kconfig                           |   8 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-rcg.h                         |   2 +
 drivers/clk/qcom/clk-rcg2.c                        |   2 +
 drivers/clk/qcom/gcc-sm8450.c                      |  39 ++
 drivers/clk/qcom/gpucc-sm8450.c                    | 766 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8450-gpucc.h      |  48 ++
 include/dt-bindings/reset/qcom,sm8450-gpucc.h      |  20 +
 9 files changed, 959 insertions(+)
---
base-commit: 065efa589871e93b6610c70c1e9de274ef1f1ba2
change-id: 20230517-topic-waipio-gpucc-68d637833b4c

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

