Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6622C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 26 Apr 2022 10:11:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348401AbiDZKOd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Apr 2022 06:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348576AbiDZKNY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Apr 2022 06:13:24 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4A9229EE6
        for <linux-clk@vger.kernel.org>; Tue, 26 Apr 2022 02:36:13 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id v4so9037298ljd.10
        for <linux-clk@vger.kernel.org>; Tue, 26 Apr 2022 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zA3PSG9S8RMpYvQYHUqOQZlj9sUgez8UvKaakxGaS30=;
        b=vMH/nkn7Ek8lu3EnkzNmkfAe84/udsNJViKYI/sG6o/Tn7he4dHiEgPoQ3bE1JhmS+
         GP2LOio+cfl4s+07nBIrglBPBxezm9iktGZuuJ1P3nK4pWgVaaDtLWJIsuE7V+UQyTFC
         EjgktGySqaEs9j7mweGYpsFTyMWdazhxNdFn0EdLu914KSxsJ5GE5Ed8P2CnieQi8rP6
         blqyfxN4zr3ob9bccoVgtp+2mTI0d8RfnUbXjx4dqUZ6sxXkuPDzvecpRtvEacgOia/R
         3P5/TZSW8qc3ZpegrQHsCpqWkljV/Jpl9s+x8LyqxSYpaKyA5gfaSH4/IvizVBYUEL6L
         NF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zA3PSG9S8RMpYvQYHUqOQZlj9sUgez8UvKaakxGaS30=;
        b=T5MeiqXs5WUWWylWgSqHT06itK/m049ATY1qhEyR2+G9nC3OgQ355OYgEZ53D6uCVZ
         WGQ/QIfyEUHrmE5iiDpN3Jvo96KrQhFE+aPvLGYKiPB7LZG+yn/Jy/LG2/WoVEoihcEE
         Xj4jyJ8lEV5D8dQyh42IOr3kSxFmtEekDRJUCTO8dbQKtCFgVCbY9HPL0ppNCW6wN2dx
         y1TaOAUt28rT0GnYARCjg7MwtMJyZ9OKZ+x02qo9YktdJv+5QPmq/2AhXur8++B9sDAl
         6Lk/5Zfmb0YYk4tDR+CPRCXkDmwQed4UF0yesbFWOiKaD900BlDDLV13j9FaGWLUptbr
         10YA==
X-Gm-Message-State: AOAM532E60Y2vJMCCoaLG8fvSDznHNc5roM73sM6vUFFZfZHDCJl2EBv
        U+SZ9tpVlT8CnJaw5vGlaVyhIg==
X-Google-Smtp-Source: ABdhPJzXDvyrCttoYUsdXCn/FRtm9sEhujJ6qBuKmBTSL/i0RlcWq4Rke6jvS/oCzhr4ix4EY7abdA==
X-Received: by 2002:a05:651c:311:b0:23f:d9fc:9e89 with SMTP id a17-20020a05651c031100b0023fd9fc9e89mr13815822ljp.136.1650965771577;
        Tue, 26 Apr 2022 02:36:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.30])
        by smtp.gmail.com with ESMTPSA id x23-20020a056512131700b004486c863c8esm1684232lfu.257.2022.04.26.02.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:36:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: clock: sourt out gcc-apq8064 compats
Date:   Tue, 26 Apr 2022 12:36:06 +0300
Message-Id: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move qcom,gcc-apq8084 to clock/qcom,gcc-other.yaml as it follows a generic
bindings rather than qcom,gcc-apq8064 one. Also while we are at it, move
qcom,gcc-msm8960 in the other direction: from qcom,gcc-other.yaml to
qcom,gcc-apq8064.yaml as MSM8960 shares the design and the driver with
APQ8064 platform.

Changes since v1:
 - Split the msm8960 change into a separate patch
 - Remove qcom,gcc-msm8960 compat from qcom,gcc-other.yaml

Dmitry Baryshkov (2):
  dt-bindings: clock: gcc-apq8064: move qcom,apq8084 back to
    gcc-other.yaml
  dt-bindings: clock/qcom,gcc-apq8064: move msm8960 compat from
    gcc-other.yaml

 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml       | 8 ++++----
 .../devicetree/bindings/clock/qcom,gcc-other.yaml         | 8 +++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.35.1

