Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7090CC00528
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 19:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjGaTVr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 15:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjGaTVk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 15:21:40 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4105FE75
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 12:21:38 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe426521adso303363e87.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690831296; x=1691436096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/t8DRBw/SU/wCVm3PYMUyKIs6c21Yu3JcmAKF85Gvf8=;
        b=NeXxPtrJw+57Wp4yKLlew6UZdmQZ8JM3q63wuzjj0sBqtqBFMBrjYaZoeIeaYZkmln
         +P8wfU+57cWgt5gci0PeZmf1elUIaorzGw3VVxfPrxo5pYLEyqcGDcrbhv73k32/Sr4H
         rcTtX2NG5bRQii7lLy+VNRIM7b33J465cYOP5z0AL2RoCvNH9A0lvQzp/x5JfHSPBItE
         ttlLcBZc2PrANcPAWJDRJ9JJdGXD1GUZuTptqvCVrosNt/16fhRkujtcIdXwxUX22SkU
         wgHg1nxwQkSrQPj5Pj9FhW4JPf6wwXU8pW9Mh8qSRW1X/9oUXYvwlzZndr+vbBW44fse
         lYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690831296; x=1691436096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/t8DRBw/SU/wCVm3PYMUyKIs6c21Yu3JcmAKF85Gvf8=;
        b=g7o6K+ngyxUjttcXvB4RBP+c5nn4X+mGUgvynKV1ltWWJS4540vl3BGwPnD37O0ONF
         gF1WohqM+DwS03hG6AlJUfC+HYhO+NX8ZyGo1ii7uG3isIYHs4fNwnHxtWZrKPXmFiG5
         LAlsTg6niRFtypEpJdHi54F8ZU8ijdIdIguVjv/jR4SdpfgY9tf249bKk3hNZrCsgnsc
         SnOFl5wme62eNA/oJzSySVBninb0Ei6qrOn6/bhUNn8uFVUd7mFMTbNXmQLyR1KQ00qH
         bJN7mRnlV9hBT3L/Ji2xvt+i6t7+QcSbf8lfadvIOI1fSCoh1i3gJ+MYEwUVM+IuRjT2
         l7OQ==
X-Gm-Message-State: ABy/qLbDi7G0UIISK93iY0+z47xZcQ/LRdzkxIr6c5q2emaqb4rEHHhe
        mhmb3BpxiwokJ+tGJyF5mn9y9w==
X-Google-Smtp-Source: APBJJlFA9X/ggpdCcoHwNPgkrjxNQg3USgRBigs3+rkfYuoglO212+WeLec+0qMSBzgzTb8urY7K5w==
X-Received: by 2002:a05:6512:224a:b0:4fb:9712:a717 with SMTP id i10-20020a056512224a00b004fb9712a717mr570611lfu.13.1690831296438;
        Mon, 31 Jul 2023 12:21:36 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id ep28-20020a056512485c00b004fe1bac4080sm2024882lfb.222.2023.07.31.12.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 12:21:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] Add SC8280XP videocc
Date:   Mon, 31 Jul 2023 21:21:31 +0200
Message-Id: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALsJyGQC/32NQQrCMBAAv1L27EqaqG08+Q8pkiZru1CSktSgl
 P7d2Ad4nIFhVkgUmRJcqxUiZU4cfAF5qMCOxg+E7AqDFFKJRihcwswWW9mKR2ZHwVqslbgQKdN
 ITVDC3iTCPhpvx5L61zQVOUd68ns/3bvCI6clxM8+zvXP/n3kGgW2+qzdyQmjFd0m9iaGY4gDd
 Nu2fQGF3qo4ygAAAA==
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690831295; l=862;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=NPlBeoc1BvvuWLaNJtYVjossmn9VQhbH+6CYvT87Dc4=;
 b=M6XKNFvTuOM8bJ4cwSWXzOBAk5hKoFHiGD5K751IRhi8mQLi+OIWmfrLZRQRyp7dkKpwSZx5v
 3h0PifKQKyRDIVoP86kgGGbmRsxuMJ2S2oISHKzKeBp0EXJfzYvYEOY
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SC8280XP largely reuses the SM8350 VIDEO_CC block. Add the missing pieces
to make it work in preparation for adding venus support.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- 8280 => 8280xp
- pick up tags
- Link to v1: https://lore.kernel.org/r/20230703-topic-8280_videocc-v1-0-8959d4d0a93e@linaro.org

---
Konrad Dybcio (2):
      dt-bindings: clock: qcom,sm8350-videocc: Add SC8280XP
      clk: qcom: videocc-sm8350: Add SC8280XP support

 .../bindings/clock/qcom,sm8350-videocc.yaml        |  4 ++-
 drivers/clk/qcom/videocc-sm8350.c                  | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 2 deletions(-)
---
base-commit: ec89391563792edd11d138a853901bce76d11f44
change-id: 20230703-topic-8280_videocc-1306ee3a729e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

