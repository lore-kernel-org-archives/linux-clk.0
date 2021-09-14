Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C311DC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 02:56:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4BBD60F92
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 02:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238143AbhINC5Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 22:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238148AbhINC5X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 22:57:23 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC34C061764
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 19:56:07 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g184so11321864pgc.6
        for <linux-clk@vger.kernel.org>; Mon, 13 Sep 2021 19:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7aZTfIyIwGJxBeqjp2VS+8QxWVwQJBhJBrFL9IwQ/I=;
        b=SMh8M7i+YBbf3JVwyKAm6l+2GeJJngfp/yQ6evnUagwigWSEm8DW89r1VhUoCmS2sW
         gN9TmSBWdf4ouXknl90o6FucJsimeuaVYOVfuyeHn53pJtb+q4Xp7Lf46q5lm0QVLmcG
         87AnPpO/AlNdBTvL1FaZnJryegvOlFcdPgXjr+Vo9F0/qG5I4qAK4fmepZkI+6YB4wKG
         n+IjU5yEaWTFmhnD+dMrmTLax98o+2Jezc5p1SbNGAq6A4t/wCbwIocFfdq95nnTh4DL
         OdOsb7PquTb6Y/qZec/cfg6cIB9DkhEqZoRkHuoBLT9you0iH284YVQ70dgyYd5amIFm
         xcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7aZTfIyIwGJxBeqjp2VS+8QxWVwQJBhJBrFL9IwQ/I=;
        b=UV2mmcZXT4LICrzssG8Q8UujQj4xipfKPuGhg/tZpAZFCb45MyxFBMzdqr+POTG5VU
         jhcyGLYFTLUVfjqMEnbdO//kY9jA23pCjKr4yIO19DkJ2Sn/3Zi+O7SbMGL8aWAulM/H
         DHtKtn9OMq9uwHBr9durvdExm6cL62spofl5FIYGmhR1Zq+zcbBDZzKKWTh0DIKg2liO
         0rVQaZnPdkw17MoM2zIw0VjotIgeLJBxl104nJ+rrcs185V1lhej+SRwPjRqyFx8vTYy
         ZJnXUSiA5lujOBz0Ho0avm2RdFUPXne8JcGs36QUgHpChYWhdI3ZZoaanepANfHX8dxg
         HA/Q==
X-Gm-Message-State: AOAM533Q0HiGkM+qSLfluHOoLoOx2qvOT7S/SNUErsUHn3mJJQlzOMwS
        QWV59+8n+gYiP+ppu8m8TDgHKA==
X-Google-Smtp-Source: ABdhPJzxkMtnVcWWRNx/7/bu41SQ47EAxang4nwLpn7E20O7eDMJ3xo1Bn/j1jp2K74NBkZUt3IvKQ==
X-Received: by 2002:a63:b1f:: with SMTP id 31mr13594664pgl.73.1631588166860;
        Mon, 13 Sep 2021 19:56:06 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id r13sm9622654pgl.90.2021.09.13.19.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 19:56:06 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/3] dt-bindings: clk: qcom,rpmcc: Document QCM2290 compatible
Date:   Tue, 14 Sep 2021 10:55:53 +0800
Message-Id: <20210914025554.5686-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914025554.5686-1-shawn.guo@linaro.org>
References: <20210914025554.5686-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible for the RPM Clock Controller on the QCM2290 SoC.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index a4877881f1d8..da295c3c004b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -25,6 +25,7 @@ Required properties :
 			"qcom,rpmcc-msm8994",·"qcom,rpmcc"
 			"qcom,rpmcc-msm8996", "qcom,rpmcc"
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
+			"qcom,rpmcc-qcm2290", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
 			"qcom,rpmcc-sdm660", "qcom,rpmcc"
 			"qcom,rpmcc-sm6115", "qcom,rpmcc"
-- 
2.17.1

