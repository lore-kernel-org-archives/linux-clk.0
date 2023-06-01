Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F12C7EE29
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jun 2023 09:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbjFAJji (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jun 2023 05:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbjFAJja (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2023 05:39:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A35E6F
        for <linux-clk@vger.kernel.org>; Thu,  1 Jun 2023 02:39:13 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f5f728c4aaso470470e87.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Jun 2023 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685612351; x=1688204351;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRvNGrsibEvu6jhRJBq1cBQ4kF2HTrS/VOtbw4oxVa0=;
        b=oJPY1B0tSvI82MXYYsTcHjaCd69oP8/C2oPLYL9IUuIiHqI97BuOG6qIrAR9hYgIXD
         LHSp/oMeX5OSTSqjvwgU8UWvU91sUqzidwpeKEC/1A3cw+cCK0T/34coH7nQDgiGt7mW
         Z2lnNzMFh+nNRBtjNDJvDRhrH2rRn59XpPzqzwzz+N1/TpmU8o6AGhS78klDJ8L+GIto
         tiFPKi6K5gVwAYoNCV/6oEkTI7aEt77KujZLxh9nZCOJzl8XlDBTxUH5yiATR/M03T/9
         Uz+Lgote1m/ev2mBXpLE++WvRRrvdbzEJjYHsX0c52q0TOmDD2vlcFZP85HuUlTKlIny
         lX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685612351; x=1688204351;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRvNGrsibEvu6jhRJBq1cBQ4kF2HTrS/VOtbw4oxVa0=;
        b=ElnrQfhAOZqXnG6zKiR8MXfhOJ2LCTnQbyUQgGIlNeJ/hl+33y+0JLGNXqrTGstfY5
         Q+vGjTw8t7zueK/7hYVVayuAVU4Tq0Nwe5ILH/xTfWv8RG2XF+5C3NEH44K1vLPoHl6H
         KK4wstxlQsvn5nhOkTA87qnEpi2MZBnM04WvPZy/2SqhwfEY+d+J9e2NUURK0RRUidQn
         C2/50Ns1xMrnAN15S/N77WJzAW3m2WdtvV0jnZMb4Zj7v6Emmf9Efb7+iRKXoKY7vF5d
         qCRe211m02CM+tepPJBbz30o+JzEUrjFL/3Ys/A3r446+rDiVCncEilffCTs5mfw5JFT
         aRrA==
X-Gm-Message-State: AC+VfDzi/eUFKYE4mkZadldKRR/5XTdaoYqKysSPnUNGCLYw8z2mqXNR
        pgePRqZwvaFoxZVFHnyF4SjdaQ==
X-Google-Smtp-Source: ACHHUZ4wl5eRmVoSl9UH26pnAgkcofTJ38V9G+G3IT8dqT7qVyiM/5Nvy+pDD+XL//satwDo0Gcydw==
X-Received: by 2002:a05:6512:4018:b0:4f3:a763:ccb7 with SMTP id br24-20020a056512401800b004f3a763ccb7mr356822lfb.2.1685612351343;
        Thu, 01 Jun 2023 02:39:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id v3-20020a056512048300b004f3b258feefsm1031119lfq.179.2023.06.01.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 02:39:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Update parts of PLL_TEST_CTL(_U) if required
Date:   Thu, 01 Jun 2023 11:39:06 +0200
Message-Id: <20230601-topic-alpha_ctl-v1-0-b6a932dfcf68@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADpneGQC/x2N0QrCMAwAf2Xk2UC26R78FRFJ02gDpSvtFGHs3
 w0+3sFxO3Rtph2uww5NP9ZtLQ7jaQBJXF6KFp1hommmhUbc1mqCnGvih2wZOVAU4jgvlzN4Fbg
 rhsZFknflnbPL2vRp3//mdj+OHyl+21d2AAAA
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Iskren Chernev <me@iskren.info>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685612350; l=944;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=IIHix1miPp0qtL4poKUvHfug4CBiAQj5S40QUBQ09Oc=;
 b=5RhikQiQfI+zL877J08QzRcusiyGzh3STK6XsgsBunSmpZG/FRrazcjiVqijI8nlRuz9Zkql3
 OzKofyptzZZCCYboY2jT4W2Tlc/vEDd2w48En2F4F3MvUXB/BdFZoI8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some recent-ish clock drivers touching on the "standard" Alpha PLLs
have been specifying the values that should be written into the CTL
registers as mask-value combos, but that wasn't always reflected
properly (or at all). This series tries to fix that without affecitng
the drivers that actually provide the full register values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: clk-alpha-pll: Add a way to update some bits of test_ctl(_hi)
      clk: qcom: gcc-sm6115: Add missing PLL config properties

 drivers/clk/qcom/clk-alpha-pll.c | 19 +++++++++++++++----
 drivers/clk/qcom/clk-alpha-pll.h |  2 ++
 drivers/clk/qcom/gcc-sm6115.c    |  8 ++++++++
 3 files changed, 25 insertions(+), 4 deletions(-)
---
base-commit: 571d71e886a5edc89b4ea6d0fe6f445282938320
change-id: 20230601-topic-alpha_ctl-ab0dc0ad3654

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

