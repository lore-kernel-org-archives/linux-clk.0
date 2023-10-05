Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E3DE772B8
	for <linux-clk@archiver.kernel.org>; Thu,  5 Oct 2023 16:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237870AbjJEQKw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237727AbjJEQJq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 12:09:46 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C40387D62
        for <linux-clk@vger.kernel.org>; Thu,  5 Oct 2023 08:57:52 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1197000f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Oct 2023 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521470; x=1697126270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4JuZ7X35qvWXE20Wsg1MXbq38lz7Ou1Ypqzl+RcadA=;
        b=G7UllliZAu+TQqprqdyamnnX01PMrFa7o1Na2adSvrSlXMTqUV2ythEpjnSIJXZ+SL
         fPpSfKI9f0lTF2KOdnFe4PGos6m5bvvXeqdPYpBsxhycAqVZsdqPPm7kMS8wrLPe5+he
         WEkw5t1a25g8fyijsFUoNQFQTKjEO8Cjyl4Z6eHmaiewHnQR6fWho31vzP44VtuCupJQ
         Tpw8DOmn2ookY+YRIbFT3MzxzPnNAkVgi0nhctMNpOLFYQ/v4+LsvkjSLy7oCFvMbd7b
         3m3DFXwNcQz6c6pITJPsEvTziPg/8gGS2a1BcdhwipYm3jWXRu9SiX/1hRTNKav2JOcq
         z7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521470; x=1697126270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4JuZ7X35qvWXE20Wsg1MXbq38lz7Ou1Ypqzl+RcadA=;
        b=nZAA395lUqc3G34udygTsBh3si6bIVS9FEeWAriQ5tReKt8h8e21ChCnNeLSfzQ2ds
         WASc2ZbfoFo4O4qWWNVAtQ/mgHT6uITOzPxldB/RjviMqfvhVWyxtXE2nFP3ZKE+GLRg
         MoVLQ3c7NtVK3H2OCLRhx2MBi7MfgVNAR++NGwEWaLt6aDTYUiLeIlz/u9Z4xdFpTrrR
         o4Wu4q5Om0swcRwZ6dk74ZVu0so+39YzoZRUy9qJXvdR+1ju0UsEeZouKRpcX1fWmhTM
         zWDPzuhW9YcGtC/4Sv8t/b2qvhtM2Wv8nA/KqxwbMzdeuU+snZfy7siAHIqEMd/e0J4/
         CjaQ==
X-Gm-Message-State: AOJu0YxtD+oHvnvHSvRGi147ez8lzbqfVherUEaA/n4ctikBxDX9m1e0
        UrPjNl8cK8xVTMw0n+7XEMyvSw==
X-Google-Smtp-Source: AGHT+IFbZgmrAFgMgn9TqyI9AVF1sigX3yfBCAI0y1Q+AU/F8Aul93TO5hp6QuL8KkpRC2ND2wHS9A==
X-Received: by 2002:a5d:4b4f:0:b0:31d:8fed:c527 with SMTP id w15-20020a5d4b4f000000b0031d8fedc527mr4634488wrs.42.1696521470518;
        Thu, 05 Oct 2023 08:57:50 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:49 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 20/21] arm64: defconfig: Enable Google Tensor SoC
Date:   Thu,  5 Oct 2023 16:56:17 +0100
Message-ID: <20231005155618.700312-21-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the Google Tensor SoC to the arm64 defconfig

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..8a34603b1822 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE_TENSOR=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
-- 
2.42.0.582.g8ccd20d70d-goog

