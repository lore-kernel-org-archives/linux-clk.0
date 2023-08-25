Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20650C71133
	for <linux-clk@archiver.kernel.org>; Fri, 25 Aug 2023 18:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbjHYSOh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Aug 2023 14:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbjHYSOG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Aug 2023 14:14:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACFC2724
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 11:13:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4ffa248263cso1918542e87.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 11:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692987200; x=1693592000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TeMnYPJ3KxrFwSpu3efDqnuLqJ80q872/kIEbrU7wo=;
        b=h4a4Xz+gp1u8rtDNLjA8TH1uR3EghAAGh8LWajTzkYuwbM8N4O7MLEQ1hUoa4aKN4m
         ZRLSQQzITGJEOooU1g1Aet1ll5xddRaByqXQhZFXTmOGhBGpu5t3pHW+bsTAEHC6lS4d
         dcbmJkilR+9E2YHXySA99Akbxv0LuXdS0bCalNeqdb1aMrfWhDQt9F9+KuPUfTkEOjTz
         HfHyp9x29t5oP/r5qOPbFAQsmvtEA+XxIRhCmWU12cFZgB07mKY1ssKYmTY/s2WYHLsj
         p3woRYNh/LGkqpCCmpvuxoox9ttNOBE0dHYHq1Ba/SdY6rZWqNx/KV3iUGNE8zI+VpTz
         ZKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987200; x=1693592000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TeMnYPJ3KxrFwSpu3efDqnuLqJ80q872/kIEbrU7wo=;
        b=TgPxuR/hd4ohFCFiTpDMrXTiQVauTiE1HisaSu3Htcb2fHML6GgByWz+1i08B16WwH
         9byS5TTwr0FTMP4zDs4GyDBGPiYlHSu7MLfsTRP8mI7lg1T0AQm0rLzu5QX+kEV2rmTV
         9snAjrgIvfxvZ7qPFZvW0DOPhPharJfCuGWyP7+EGDQJyPfOzPUXRZjoWZ1+memuAGuM
         plQiqQuxcKhVkEqdqFsC/e5QQoM1DW1Zu3vxGDBvOsDnj2I9Ma8OCphoLH5YBP1D4Mp0
         ihQMnNm2LhtTUHPFMeeQsv8fGX9p1goWiCRt9PxFC1wacF1pitgxHKCJLghKEKCG6wBK
         FDtw==
X-Gm-Message-State: AOJu0Yzzwu56s5FiHNvcu1kf4R2raognOf7VddcW+Lc2INmLCY4FZlTG
        /ZiOWsXy8G2c/GNR6fhrxIZPZQ==
X-Google-Smtp-Source: AGHT+IENTg/CoSs/0Snu/WkdvbcaXjnIW9+7z+J89mjofNi00Tg7fcMFN+cdA/EGlC9TqHO36xqDKA==
X-Received: by 2002:a05:6512:3ba2:b0:500:8022:3dc7 with SMTP id g34-20020a0565123ba200b0050080223dc7mr14913390lfv.10.1692987199796;
        Fri, 25 Aug 2023 11:13:19 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
        by smtp.gmail.com with ESMTPSA id b2-20020ac247e2000000b005009920b6afsm374522lfp.9.2023.08.25.11.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:13:19 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 25 Aug 2023 20:13:16 +0200
Subject: [PATCH 2/3] clk: qcom: reset: Increase max reset delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-topic-6115_lpasscc-v1-2-d4857be298e3@linaro.org>
References: <20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org>
In-Reply-To: <20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692987195; l=566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=87NDHyI+LvwN9CqST5Jf5fNXtDFPiv1laEmkRq1a1As=;
 b=9MzaglliUVrbmVPVIQA+UDY17AoEE8NafqETUwAVa7cEVjHT4LHRz4JfryCS7/DWvuQ/nXuop
 C4quWHeRToIBD3efWWErIbDbHrvHCboI3CcMEdWQb7ADChjyYXqFhJo
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

u8 limits us to 255 microseconds of delay. Promote the delay variable to
u16 to hold bigger values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 9a47c838d9b1..fe0561bf53d4 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -11,7 +11,7 @@
 struct qcom_reset_map {
 	unsigned int reg;
 	u8 bit;
-	u8 udelay;
+	u16 udelay;
 	u32 bitmask;
 };
 

-- 
2.42.0

