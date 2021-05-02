Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281A2C433B4
	for <linux-clk@archiver.kernel.org>; Sun,  2 May 2021 12:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 091C06128C
	for <linux-clk@archiver.kernel.org>; Sun,  2 May 2021 12:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhEBMVh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 May 2021 08:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbhEBMVh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 May 2021 08:21:37 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6553C06138B
        for <linux-clk@vger.kernel.org>; Sun,  2 May 2021 05:20:45 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id zg3so3801383ejb.8
        for <linux-clk@vger.kernel.org>; Sun, 02 May 2021 05:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qqcj0BqgNgc1kx4Ifq3fIk2WlqX2X6sfrX0+upPU08M=;
        b=JpKUjkb4rKj3rHgTE7xBziJ6MrZrt2O2FBGJEL1wUMLwt5Xu471qz3yd1HD3CaSV5E
         ySdRvgC+gKModoCBMnPS+4OCYmtakK/2MOlzR0AeTMWsyVC8ImXHFRZjHO9HXtihyve1
         zJquBj4geX1T5Tsxc+w+ebBM/nUYn6qIOm26jqhXUKpcfx9WtDZwRyk1PoEnOX2hyJvA
         yyI2GVU8HUH5zEtb4XnQr4D2w48JaWKoaB7acUvBpdfIgYXBxBoTQ+3NHv1XLFNqgOMd
         sBfoj7Ni/Lo87KvYbn6mnLueKgd7dZxR3RSFFtT35/v2z0f/N7dspn3ep3vHr2Rrt9F/
         cQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qqcj0BqgNgc1kx4Ifq3fIk2WlqX2X6sfrX0+upPU08M=;
        b=Mqcp+/FjGUDjx2PkvcMsCXjFNeYJhzS995Ig33Fly7PkWQX4kYt/oRWzzLK5FjM9fX
         C4X+pPJBEiyyKDvc1yCNpm/lx4DwSKu3YbDuHK2ZScD+ELVV0ahiN3KU0KqBiy60IoIP
         o0ylnto22GYZRhE5XE6WwA3RLBaoBohHkACav1YoN43TIZVQKTeJMrNd2Zjy/pMB11lO
         uuisKpjMalxsed2K0cwOV6Pn4tSkUghcb+qVMZfwqYrrD2F6T10izCY8RRcxtBVBddvQ
         ow6ZRcNfXwHasqwZtZUV9ieFcXv8HAC2W7PXr6SHKRvt0EBxztTE1IrC3LudxU3es6iK
         aIuw==
X-Gm-Message-State: AOAM531pHh1ETtb9ARIK5CYiCwugC/6c1qMEoonohjroKafdmWMh0uJe
        OPIiVR6yc9Pns9BjwGN1PXySeQ==
X-Google-Smtp-Source: ABdhPJw2r3QVd9qc44rIT86Cb/Gz6aXvVaQaubc7oCSkq1yyExPbVDNfjHCjgz1jdCiXkX7ulg+lPg==
X-Received: by 2002:a17:906:1e44:: with SMTP id i4mr12410533ejj.61.1619958044723;
        Sun, 02 May 2021 05:20:44 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id b8sm9866238edu.41.2021.05.02.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 05:20:44 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 74b6daf4;
        Sun, 2 May 2021 12:20:32 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add MSM8226 compatible
Date:   Sun,  2 May 2021 14:20:24 +0200
Message-Id: <20210502122027.9351-2-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
References: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the dt-binding for the rpm on the Qualcomm MSM8226 SoC platform.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 2684f22a1d..e6e4cb3d0d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -32,6 +32,7 @@ properties:
     enum:
       - qcom,rpm-apq8084
       - qcom,rpm-ipq6018
+      - qcom,rpm-msm8226
       - qcom,rpm-msm8916
       - qcom,rpm-msm8974
       - qcom,rpm-msm8976
-- 
2.25.1

