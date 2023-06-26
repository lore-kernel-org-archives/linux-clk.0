Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35CCEB64D9
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 17:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjFZRsQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 13:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjFZRsQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 13:48:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F29183
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 10:48:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b69ea3b29fso23471761fa.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687801692; x=1690393692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9fUgEJ67HkDH34+zzCuhAJ7MUNwqjTfuQwZXMZwwsw=;
        b=bEYOsRm0zoI3Xf55vqZIXQdAiNJU2p2rgXJv76vUbsoKwZ1qRboNxiayAsAtuI85fV
         heXIcqEnZkd23tZSTNKC4ekY98RaI4RR/01MwGeK3DpDn/NDt0VjQmP/dKWeSxMDENMY
         XqdsiJWpRs95bWGVLBUhvOymcbB8pMZDmKLlW4r4vZQkKTGQ1/A3aLBg654fKf2xYxBA
         97jboCovwbyI0X8bhzlj6kPc696CshDRGcSd6NXVa9YYOqp8OGoRRHBrY5zzqn6gU5uk
         BvuE1JMy/4o3qA5tEKHq3vXwN2jAlnBtYoPtjC4wCJZiEuJkpF+WLkenJGIbKHjgDqKe
         lfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687801692; x=1690393692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9fUgEJ67HkDH34+zzCuhAJ7MUNwqjTfuQwZXMZwwsw=;
        b=GPG+kHMImD568Ssj9Ei3IMtW9ZGQfSMS95SKMOBbJlHOPZADypuSGOCnTS/V5LN8aI
         sxnNaT83G/70+hDO+jrcQeT1AdPn6E2mY4XlFQEb9DjmbITX2ECFGJi62YGfZPnzMaj3
         ABy9OPWwR9tzoUohxjvAiehsQXG42D1ei6aAcw8MF0D+bwScjDAK+jHr+yDs08TYGfm3
         q2b1f2M3XwD6b+ZLGxWjGNmNb9X1LHXogdcoWAIxM8royU10HbewlHjxyyRzJ+lqbpqY
         7O2xcEAch7r3du/hb7DxiuRIM+9D/1wDmgxSVuJufyI3HW4WU5l7N/SLPfmC2qG51PXo
         gMLQ==
X-Gm-Message-State: AC+VfDxDU03oKWTlMItGtUpJlBU7Wq5b5QRZjiR8eHWgGo6AzWjsGCcl
        Xc/cDk5JPt0RaUREMPk+gH15TA==
X-Google-Smtp-Source: ACHHUZ7FiSeKZXM2baZmXdTjyDzstcuHnUOia802fOfKZ+C6be73RWADkTpg6CqFkSUjDs5F+hoWLQ==
X-Received: by 2002:a2e:8559:0:b0:2b6:9fdf:d8f4 with SMTP id u25-20020a2e8559000000b002b69fdfd8f4mr2322575ljj.29.1687801692061;
        Mon, 26 Jun 2023 10:48:12 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id h19-20020a2eb0f3000000b002b470afec39sm1337076ljl.48.2023.06.26.10.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:48:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/3] Fix up 8280 GCC GDSCs
Date:   Mon, 26 Jun 2023 19:48:05 +0200
Message-Id: <20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFXPmWQC/4WNQQqDMBAAvyJ7bkqSFqs9+Y8iZbOJcUESSay0i
 H9v6gd6nIFhNsgusctwrzZIbuXMMRTQpwpoxOCdYFsYtNQXWWspljgziUyNbuTTE3mbSShTm5t
 DgzjUUFKD2QmTMNBY4vCapiLn5AZ+H69HX3jkvMT0Odar+tk/l1UJKeRgW4XtVRuL3cQBUzzH5
 KHf9/0L5RFFAs4AAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687801690; l=1075;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CwESCshIY+wSLyr68qR+yighC4LBKQO7Rmi1mrcuW5E=;
 b=HNxYQKpR8UXJV2+BC97EGzn7IHYPG2F6wVu9z2CwTVU+FxuZU9vTWkt4u5N2mXok2UWz3x+mS
 QAXB7aNmi0xD9cHDkL1HwM6S8/f1QG24pTxzlWXeWik1MKEUb/FWrrI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Part of the SC8280XP GDSCs were not fully described and others were
missing. This series attempts to fix that.

As usual with the laptop stuff, please test it on your setup to make sure
everybody's still happy.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Pick up tags
- Drop HW_CTRL as the flag upstream indicates usage and not only support
  for that feature
- Link to v1: https://lore.kernel.org/r/20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org

---
Konrad Dybcio (3):
      clk: qcom: gcc-sc8280xp: Add missing GDSC flags
      dt-bindings: clock: qcom,gcc-sc8280xp: Add missing GDSCs
      clk: qcom: gcc-sc8280xp: Add missing GDSCs

 drivers/clk/qcom/gcc-sc8280xp.c               | 121 ++++++++++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  10 +++
 2 files changed, 124 insertions(+), 7 deletions(-)
---
base-commit: 60e7c4a25da68cd826719b685babbd23e73b85b0
change-id: 20230620-topic-sc8280_gccgdsc-1b6b7eabaaf6

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

