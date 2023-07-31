Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5DBC001DC
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 12:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbjGaMUd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 08:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbjGaMUc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 08:20:32 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960CC19B0
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:20:16 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so6797481e87.2
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690806014; x=1691410814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf3LmmIWrMau5faq7nlMlPKiUzu+qP0dMuprgORcSfE=;
        b=K0GOcdcUPKkJCrwm9ic7QHRzs26pamIeLtNk5RCHei5D6USQDdlP0KDljYOLhYu6lF
         DJ8hXefNOSNr3LEO8N2cmvF4IZ4sUQS/NzgOw0aYkJSPXQRy3rtpcyr6hhqrzJqwelRF
         528mDua7HxjToYrkIgrkhTwRPv0TlthGuWp1Mkk2+Uxbk1hgex/HtBwzOD4qNvNrhJal
         CBpY0jiu53MiCyXWs1v6xBV1mxUvq83QjdA2wAlxJmCXeXXA6O/6mbzz9pEEHkJ27Nxx
         nwlYvcr662OVpWcxN+AypwXcFKrrwAyRq6aFVLYprmIijv9yq2hyQPS46Q8pbdrdtHhC
         j/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690806014; x=1691410814;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gf3LmmIWrMau5faq7nlMlPKiUzu+qP0dMuprgORcSfE=;
        b=Y/Uz0sWmfPM6o8eIjG+M6pq5MbpaxUuKmR0icPHx9+0IfEuUwIs0+leWG4KjqCbotf
         wVEvJfKRQ0HSOwQA+8orCEHrWhs+gXrwZkiR609u4wi4NK6u+/eZsWsUwxXqr1hOsYso
         DqhbnbGw4c6eZ4hpoh3wZaMoZjRRuVtxwXDuoPW4ijJyYHMrjx5z22AoMQI4sarKAg6/
         BiiRsGNwxAniuFH53ZcovmFkOfhMn2wuI2mnE4N6fl+4XxYpV1AWxGzzbSewbAaWSP4q
         FrEKqEL6ravFbCfFT0rjU5d/CJZuJtGEcswtFZxaF3cfd159dQsEGFIp+XrCHQVHN6lw
         RYvg==
X-Gm-Message-State: ABy/qLbSw605lLE707KDBTUOMSckNM1WWnBQFSnzr2oRZDAPVkWnQpXB
        TtuGocwrYVKLmWcBwwMYPFt5zA==
X-Google-Smtp-Source: APBJJlHK1YJ+ycb2Mi0ZGLtYYsXsm/rpLz0hFe+W+eN1LdFXfUN0jmtDbMkk4kss6l5PSzy/TZI81Q==
X-Received: by 2002:a05:6512:360a:b0:4fe:de3:9fd1 with SMTP id f10-20020a056512360a00b004fe0de39fd1mr4731653lfs.36.1690806014533;
        Mon, 31 Jul 2023 05:20:14 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id u9-20020a056512040900b004fe11366146sm2079096lfk.51.2023.07.31.05.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:20:13 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Set PCNoC clk always-on, with or without interconnect
Date:   Mon, 31 Jul 2023 14:20:11 +0200
Message-Id: <20230731-topic-pcnoc-v1-0-452dd36d11d7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPumx2QC/x2N0QqDMAwAf0XyvIBtHbr9yvChxkwDkpZWx0D89
 4U93sFxJ1QuwhWezQmFP1IlqYG7NUBr1IVRZmPwrQ9tHxzuKQthJk2E8+Aesetd8PcOrJhiZZx
 KVFqt0WPbTObCb/n+F6/xun4pYsrrcgAAAA==
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690806013; l=885;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DpM74YJFMGMq7VqXTxFkzlshoHNLJraxbS0yzf7ueLo=;
 b=P3thT/6NZIx2XNQm85ENg0Oe3UkQyRtif7N93V4ggDQwUhQWUuV7SJViO2+qU4A5UC0HyxOtR
 vKnaGz2QSSrAdzJQeV08VdXp++xFIjKTshmAF4KMIOWDv5du/o3pB+S
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PCNoC clock needs to always have some sort of a vote hanging onto
it, so long as the AP is alive. Some platforms guarantee that through
the interconnect driver, while others (that register the PCNoC clk
with the clock framework) don't, which results in a big kaboom and
force reboot when trying to suspend that clock.

Solve the issue for the latter group.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: smd-rpm: Add a way to define bus clocks with rate and flags
      clk: qcom: smd-rpm: Set XO rate and CLK_IS_CRITICAL on PCNoC

 drivers/clk/qcom/clk-smd-rpm.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)
---
base-commit: ec89391563792edd11d138a853901bce76d11f44
change-id: 20230731-topic-pcnoc-d819a4713254

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

