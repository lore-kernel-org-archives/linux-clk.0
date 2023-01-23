Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A95C54EAA
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 20:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjAWUSX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 15:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjAWUSW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 15:18:22 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C8535270
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 12:18:20 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r2so11936190wrv.7
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 12:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FflYPwr3M/bnWPvk5ojh/SDXRU2zuT+fKUMW5bHVZVU=;
        b=anAeWvTLdi1pF9jtm4TWVL/XxAXUksOyceS9GZfF72xOmEKnPLB7FkFJ5w0kLyBsSY
         f9SvHjXioyo3glKeD2Wzn/FMtrAfGT8MRTrIbsUccSNtTscxJ9h2ulra5z4TPvy2U9n0
         ZkQV7ZB2CthUkXwJVsmLlwhDdgz3XB6fJKP0aqst9/3JdQcFGOePpUgZOI0aAQtCeSjp
         70/w8p4pCdNvoObjrhbevR4FI1xD//y8C2zJEYo9jTl3WEuw2ppIZgn3oDLaVvVgVIDu
         AlKJ6r+gaLv9LBNjPlHn01uxF24B21KVDTCfoDgFXiRXAKKuOdnke5KSvyoz4wn1XtIy
         C7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FflYPwr3M/bnWPvk5ojh/SDXRU2zuT+fKUMW5bHVZVU=;
        b=nVdM3aHCufo0XrexoYs08hwTBKY9x5gIyAP2tr7w5wxhMafytEC58V4u7FxVbYNytV
         xiugXctbY1WznCFsUAvbKieWyQaWutd+4PlK4L4QjhJxxPaLRFWsTZnnOCpVOIUHx/FV
         /oYnFOdzurSbmzcx1JHVuQTamde7SDBHD7eiKRTaaHTF7yQmQmg3Onq5oIg0y3PPM3CV
         WOJ+uWzvM6xKn5d/KBTutbbrZsOlKvByf3ATdLG2cQ83S+Bb0G3j/TmEAG7x7i6fBZBO
         AOlkqt0tisKjnJuDJVwDhvDyl7yqxm6VBLrdYB2BxlSgzcM6qOJVDrO/40X1IkHBcQRx
         9T3Q==
X-Gm-Message-State: AFqh2krcz41K2IZ8yDVA0OQOWLxEsCcpVHrBhjxIc8/O0FmmJmuPCKUV
        ycs2ahOmu+1VmoawxrlUBYD2/g==
X-Google-Smtp-Source: AMrXdXv08153HfRvW8bM0I5g+nTjDJyeBcfgRRZFjH8pbb2MQMmyx4aarBkFE9Q9Zv1qpgAd14wXQw==
X-Received: by 2002:a5d:6e8f:0:b0:2ab:78e2:864e with SMTP id k15-20020a5d6e8f000000b002ab78e2864emr22085836wrz.19.1674505098968;
        Mon, 23 Jan 2023 12:18:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d4b01000000b002be53aa2260sm210078wrq.117.2023.01.23.12.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:18:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] clk: qcom: gcc-qcs404: fix duplicated num_parents
Date:   Mon, 23 Jan 2023 21:18:11 +0100
Message-Id: <20230123201812.1230039-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

num_parents field is being initialized twice:

  gcc-qcs404.c:63:32: error: initialized field overwritten [-Werror=override-init]

Fixes: 2ce81afa0c7c ("clk: qcom: gcc-qcs404: sort out the cxo clock")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 5f58dd82d3fe..a39c4990b29d 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -60,7 +60,6 @@ static struct clk_fixed_factor cxo = {
 		.name = "cxo",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
 };
-- 
2.34.1

