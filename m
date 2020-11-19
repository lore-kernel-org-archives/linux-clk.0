Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EBDC8300F
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 15:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49B0B246DE
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 15:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ogRs7aHV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgKSPwp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 10:52:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728946AbgKSPwn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 10:52:43 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D380C061A49
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 07:52:43 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id u4so5746754qkk.10
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 07:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iS4PFF4afNVE7r1m6FFtegXe9ReuZEWdknfJDOJxxsY=;
        b=ogRs7aHVgPAe9BFPnptBBpgxHJY2yTOCZkeVo9BIdOoGrIr47GvR7a4/SOKPKeXlz7
         N9hh27I3m3pqEEFW4SA/IirxvRS7+Uve3ZuaoQin3LNcceQO08qYMn92+YDYjVTybV7j
         bSIzxWcAQQJ1XcUKoeRemnMcO4PLgEUPDhV6TrTxNcyUW4Sx/hMjOXHvB5Q29nxFjdw9
         h+VnR8oEuBh5FV6QRfbJQuDhtwaatGpvwneia6taGDiJAMjegXWq5/MEPLinlC2OvfIS
         5r7gJNdpUtLi22yEuDSs6g9KfyI47VLO44gBTSnbRlonevCZrbfqQxE+doXbWaAEobcX
         ThBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iS4PFF4afNVE7r1m6FFtegXe9ReuZEWdknfJDOJxxsY=;
        b=V4euoc0udHtCpVawXfUg1yJ+MsezbaQ1qTqxhtY+yzJRb7afPFJep1YU0oDydfCcIZ
         U5Xj46TFERmbZP4NSNSBFIX9/TtlLXwjObWIBue8QCwK5q4l+2vATM3EbO+IBbb3ROMU
         nLsPkwcZkQrkf8z8gqfMNzOF3P0LiM2wfO0UimGg/NaDS6V711s9RJNKIvHsWoDf9UUC
         11eGq0vX2wWNGyQB8z1GiirMbJEAPITQC6DrdyDOcZFyOKtKUYp+RxxKnDuJz/tCdqQK
         nhp+URm3Bnl53o4NExReDdUeUOKtpaT90FY9eYCU0Xsocoq+HDg6vSNkrap/4Bj6jpH1
         Y4Ag==
X-Gm-Message-State: AOAM531bBBFdvVkOaO3cMcuZXEXeW9UosNf98WL1MqqUyckAQ6eqJus/
        QC2azbsLfk3omUHxri0zanwBXw==
X-Google-Smtp-Source: ABdhPJxHwH4v7FYWbrIIlnErpYmRYuzu4SdUpPCubL+H7hYfW1iAJvkBSx64ZORRUh7Hqwse028vQw==
X-Received: by 2002:a37:e207:: with SMTP id g7mr11719107qki.44.1605801162795;
        Thu, 19 Nov 2020 07:52:42 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id g70sm127290qke.8.2020.11.19.07.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 07:52:42 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [Patch v2 6/6] dt-bindings: crypto: qcom-qce: Add v5.4 to binding
Date:   Thu, 19 Nov 2020 10:52:33 -0500
Message-Id: <20201119155233.3974286-7-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119155233.3974286-1-thara.gopinath@linaro.org>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible string to support v5.4 crypto engine.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
index fdd53b184ba8..ed1ede9c0acc 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
@@ -2,7 +2,9 @@ Qualcomm crypto engine driver
 
 Required properties:
 
-- compatible  : should be "qcom,crypto-v5.1"
+- compatible  : should be
+		"qcom,crypto-v5.1" for ipq6018
+		"qcom,crypto-v5.4" for sdm845
 - reg         : specifies base physical address and size of the registers map
 - clocks      : phandle to clock-controller plus clock-specifier pair
 - clock-names : "iface" clocks register interface
-- 
2.25.1

