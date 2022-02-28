Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12130C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 14:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237306AbiB1Or2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 09:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237322AbiB1Or1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 09:47:27 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9BD80202
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 06:46:47 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id n15so8671673plf.4
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OvbikKoAKho7Bpj5HDlLF47y32hMSGJasX39JrNGXFI=;
        b=URmkyZsvYVruw8oMATM/SU6nj7nbkltFjJM1BBt12+QxuYj28G8pzr/DCx95mMbxil
         IsWRSETMV0B0ur/ZPTJbDPgtN+hzn9G7wg1Q5VU9ZbjgasHSGttuSuo3kzzXZJADZUaY
         gRTuNLWWiqLls8Dp0qjACh3WYIWLC8XWOj+q6e1e4nkK9G6EIfOyhQtMb0GwyaAJZo41
         gwZvWMlA2pu1ZkGjaNbyBVHEfGf6vqobsT+suj6aFF8hH1va3f17S2nXgia7yea2dr1L
         rvq8/VyU8+dYLJKFDjiW9NEx5OOhnb3idVwuScQPAs3/hkOJ/zfl5DKJD9XZxAIKXGz7
         cFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OvbikKoAKho7Bpj5HDlLF47y32hMSGJasX39JrNGXFI=;
        b=z3wKaIObZCQhiMvdLbHaQh+Q2PnD9Z10w5l9vcH97qRsjQKI3vc6SzDDO+RmjRtQAd
         8CDdyEfwfTiLlicV2UMn5w8cL/P5doUkwMcwcvHOaKSdgbb2q6MS3kKp2lEaNX/SrtTS
         y4+lD17Za7aFExXQjpRbAfalMnWtrL+DAKyNxjE4CH+kBTW6XMGy4IDrbg04tS/36+Fr
         WD2GjuGZz4FcHW5ADIBxu/JuVjk8cZwDx7U0Cf67Ku7pDNLhHzoARxR9KZVLOclNqbKU
         ZPz0AYOFlyxQx17frU5fLGASo+pK0IUrhegj3TSV8UBUyEjfvHzMoZeLdB3B5aav0tuw
         Vx2w==
X-Gm-Message-State: AOAM532LgpZ9ODukLZbJKfMF2X7JW3wmPRahGeL1g2FW3JxYxRawkeGl
        EmmbsXhZCFl5CsLZezIwY3prsA==
X-Google-Smtp-Source: ABdhPJw1ppE/mHpMlz5oM76uYs/NB7A7jUShPr/59O8tKUhyzttPd5wuf2RPmpSNKSQvOqiZZvEmgA==
X-Received: by 2002:a17:902:f242:b0:14f:e2d3:e251 with SMTP id j2-20020a170902f24200b0014fe2d3e251mr20581720plc.19.1646059606688;
        Mon, 28 Feb 2022 06:46:46 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id lr2-20020a17090b4b8200b001bd6b5cce1dsm1736713pjb.36.2022.02.28.06.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 06:46:46 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Add ufs power-domain entries
Date:   Mon, 28 Feb 2022 20:16:07 +0530
Message-Id: <20220228144607.456194-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228144607.456194-1-bhupesh.sharma@linaro.org>
References: <20220228144607.456194-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add power-domain entries for UFS controller & phy nodes
in sm8150 dts.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 6012322a5984..7aa879eb24d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1637,6 +1637,8 @@ ufs_mem_hc: ufshc@1d84000 {
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
+
+			power-domains = <&gcc UFS_PHY_GDSC>;
 			resets = <&gcc GCC_UFS_PHY_BCR>;
 			reset-names = "rst";
 
@@ -1687,6 +1689,9 @@ ufs_mem_phy: phy@1d87000 {
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 
+			power-domains = <&gcc UFS_CARD_GDSC>,
+					<&gcc UFS_PHY_GDSC>;
+			power-domain-names = "ufs_card_gdsc", "ufs_phy_gdsc";
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 			status = "disabled";
-- 
2.35.1

