Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4CBC4708E
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 12:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbiLFM5Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 07:57:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbiLFM47 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 07:56:59 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A26D2A416
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 04:56:46 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id bj12so5882722ejb.13
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 04:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=ZidEHgzTJHJ971XlhxbwNqDseoGZb4yiXfiNEuK1MupurvPx4WxIuPhAO1Ol8lRoFB
         rElAMvO2HZedoExmb3Hv0y7cyO6c2VkfegW235AT0hMt1ZXIEpnTLorrH8w3T5TSHVnY
         8LrwsV6Xp3Z6PHjS2Lyosfj7Oy4ekiglnkuiRZAxkgHj/95kuz9J90cbAYVULc8TbR7N
         atcACt5TV6g0ZtVipPTrK+FcvpMHZf3D776wmsWMZJ5NUdY46L5N3cchWtN9xB23qWow
         E3O92JC0A5ANdgWI0Ji5KwDIcbWLxPUyat8dGbma4FPZN6SUORykLq9eKEqk2uT6TO5w
         5bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=rxsFOT/qZDHcFwc9ZU2XydGh+4s7uTuLpC7vu6ICixml0vIr2AqtbDUx6wDLNQ7SAk
         45oqJGo30gHGwx6IhV951dk2yY2ROSqbQTXoy2tSrk2L8pxGsVgsxC5VhBtlFy9zdWV2
         btHIfY8HrFPPFiD9p2k/q85eoRh/JLvcZpY+W9fVo5wOg8K4UpIdnuUbZ3SdyFR/AhOT
         t4U6kfRtMBeBixK+NpSvrUI9M+5v6rcxd8XWk3pd643/qj7BMok4FudkkI94A3LToPFy
         mBEAgvv3Wm347dsTjXZmPzQwr3LgsqETGbkLhSn9RjWIZyNu64tHUySz+O6AzzE7Mdvj
         YEVg==
X-Gm-Message-State: ANoB5pkVWsBBBUSkZgzca7vpaSHSkEfbMkZ6oaV0ARXrFfJSL4uK/AoJ
        n7eoHTXy/kTJ/VjQQyp+KukWzQ==
X-Google-Smtp-Source: AA0mqf67q3Yvp7TQgfE72/7Tj0luKiaE0vPffE6fFIVzoJ1X9eDGj9MyzYpyk5HclUqH1c7klkS7AA==
X-Received: by 2002:a17:907:3f8a:b0:7bf:4ae6:c36 with SMTP id hr10-20020a1709073f8a00b007bf4ae60c36mr35871464ejc.674.1670331404524;
        Tue, 06 Dec 2022 04:56:44 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7cd4f000000b0046150ee13besm932991edw.65.2022.12.06.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 04:56:44 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/5] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Tue,  6 Dec 2022 14:56:33 +0200
Message-Id: <20221206125635.952114-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206125635.952114-1-abel.vesa@linaro.org>
References: <20221206125635.952114-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SM8550 has a new fixed divider as child clock of CXO
called CXO_PAD, so add IDs for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/qcom,rpmh.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..f3e0288420ce 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_CXO_PAD_CLK			27
+#define RPMH_CXO_PAD_CLK_A			28
 
 #endif
-- 
2.34.1

