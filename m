Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264B0C77B6E
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 11:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjDNL0Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 07:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjDNL0P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 07:26:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5555A86AD
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 04:26:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x4so3036091lfr.8
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 04:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681471570; x=1684063570;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXayIhb48rpICvZhgV0WpLpWTGJfP5YGp0OUVXORCrU=;
        b=B+aAH7iwOvmQOPM5kAGyXrKGDpG3EgfK7vClDXgy1uEk2I98f/mWfScR07a1scB4fz
         NTjQ56u04nweoPFEM89XzKAkO3xZmFOcRFY0RbCaRTh2qSFhpId5RyZ/kmqSgNwJ0nNd
         QWp2sVBBuQYQaPb/BK3eWNhyNGrL0t86GFMYbQRQV5qFTOA9PhrRyMq9lBj7ZQAzJ7el
         NsGzuADabwE14EL52awSsYbyvUhMPCTuzucA4MH0vY/JKVdMdciB6hXkgRbEgyXPrXYs
         WBJrjGmnRIF4TNgqSRpo1086F9agmwjywSRuBZzdMIaDDKy1nuzBVPsQk2jve81DJhk8
         rONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681471570; x=1684063570;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXayIhb48rpICvZhgV0WpLpWTGJfP5YGp0OUVXORCrU=;
        b=Vyc47egd5L5eDTTDgsYTe2Ovwb/CD7ZD2ahiXI7vUoe/Kr7XYq9mCszD1T/d3K5gk3
         DS1vSv7hL2/gYm0od1x3muj8lSETM8rnRQpsksmFZMwUN9YTbaVun3Fy2OZ+WpV4zk13
         AQIe2orTeKAealdzZiiFL+xi7q6fWuHt5Ul3ar1iY2DYHREWSDYIFzvC53Jznkr6a4Dm
         umtqvd5LWsJVzrxvU/32ib0dSIC2nbQoyykf5STBPj32UmsR1Czjb9QH7izP7dQkapNy
         W1mqjjJlvEZmqyNwT4g3Bd34jMHr6LX9y+AV9pXFa+Hc6BG8n5+E2tmBoqk6/KFQfcML
         mGJg==
X-Gm-Message-State: AAQBX9dvit8LD9qVYp12/ZJeb0HclWlWt8L+1i4jZzjLryIr7Q5eZxgH
        AD3AnylT1odWcmPaXsBBFnBomA==
X-Google-Smtp-Source: AKy350YCD/gqeoFDnTa2Hdfa7XhbQnXeWkA78wnWZoK8ZEzi0mDfNEObzPujJARrty7gF92OloRWSQ==
X-Received: by 2002:ac2:5a4f:0:b0:4cb:4362:381d with SMTP id r15-20020ac25a4f000000b004cb4362381dmr2491545lfn.62.1681471570603;
        Fri, 14 Apr 2023 04:26:10 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id f2-20020a19ae02000000b004ecb06acbb3sm738430lfc.281.2023.04.14.04.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:26:10 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] SM8350 VIDEOCC
Date:   Fri, 14 Apr 2023 13:26:07 +0200
Message-Id: <20230413-topic-lahaina_vidcc-v2-0-f721d507e555@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE84OWQC/32NWwrCMBBFt1LybaR5FNEv9yFFJmnaDISkTGpQS
 vZu7AL8PPdyODvLjtBldut2Rq5gxhQbyFPHrIe4OI5TYyZ7qXotFN/SipYH8IARngUna7mxExi
 jL8OgJWumgey4IYjWNze+QmjjSm7G95F6jI095i3R5ygX8Vv/R4rgPRdKz1cjJQxG3UM7KZ0TL
 WystX4B1EoKpswAAAA=
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681471569; l=1143;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=b1Z8B5GLQvfM6ewcQNkW9peR5LT/DSelr7WkGl08+Z0=;
 b=76jbKqduayOAhCvGyK9OsQaZZi45ZFQ2hNbCxhFM+69mO3MOsGdnvnUZxZvpv9alD59wiz2tVLlt
 24W5MmekCF9GjBtxOpDEnBAyUBiHu0SjMYtWKN4qVMeF+JaFgpX2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v1 -> v2:
- "){" -> ") {"
- subsys_initcall -> module_platform_driver
- constify lucid_5lpe_vco & .hw.init
- devm_add_action_or_reset -> devm_pm_runtime_enable

v1: https://lore.kernel.org/r/20230413-topic-lahaina_vidcc-v1-0-134f9b22a5b3@linaro.org

This serires brings support for SM8350 videocc and updates the
related dt-bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: clock: qcom,videocc: Add SM8350
      clk: qcom: Introduce SM8350 VIDEOCC

 .../devicetree/bindings/clock/qcom,videocc.yaml    |  29 +-
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-sm8350.c                  | 557 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8350-videocc.h    |  35 ++
 include/dt-bindings/reset/qcom,sm8350-videocc.h    |  18 +
 6 files changed, 648 insertions(+), 1 deletion(-)
---
base-commit: e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
change-id: 20230413-topic-lahaina_vidcc-bcdabb475542

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

