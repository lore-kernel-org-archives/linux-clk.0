Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397E5C76196
	for <linux-clk@archiver.kernel.org>; Tue, 28 Mar 2023 19:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjC1Tgs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 15:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjC1Tgq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 15:36:46 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510BBF3
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 12:36:45 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p34so7605483wms.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680032204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDi0sPSTLB7eAuIgWAobS9FE/uMoxKTeXL5+WCsqXmk=;
        b=pAE/Anb4jFNCU0zI5aj4Mfm2iU/Z7FnB4DYmMXvDmdmyiMf9Qn4ZBBTpWyncIA3SfS
         43Ispb70wyVjSu7L+eA7Iuza0GXA03kZGHWuLNfIBuX8kMhsqwUbwaFq82mUStZIIY4O
         fecJSxQ34AVdEQgF67ZzlhAHtKpRfc5fBsGXAlzA6+x19K6jDqS7ya+GxWzdEEpbNhDz
         fkSzSJKq6jAevPF5ffIm8A8nxp0X+5n+A3GLid8wJh9H7Dz1gYaHfS1CAtep4SWWq93K
         vr1sz2HjPeU84WZjR/Quzo6TKbwhHTbqKXh1zz3kjKJUMUhMqtdnNq8aJnHBql77QHE4
         x74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680032204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDi0sPSTLB7eAuIgWAobS9FE/uMoxKTeXL5+WCsqXmk=;
        b=UQTz1HvK3AfdxNeHzZx5GKulhf3sJP4gjligBFPATgBerU6pQBJs2THi18rpM+SSTo
         7n/pKmoWWNEsApchJVkiAutsZSK7UOHw4VYNpwVCvkhTtnjKyddje6hoSb5zMth1tSAm
         oJ28bs0bTV8izib4nNtLBRMeIbbRnp1jwoT0IsOHlDydvyZOla7mLY1vO0Jsk9f+aRGq
         ySqqVE+tWOvCbfqJxw/gHZiXJs9Wv822A2mJPGEEGSK7d2ohgKreHKoUnqI9Yl1wxmvi
         WjajDNZhQU4rLZGWJpLl0ndtmg8hVg87hOnf6PBh7HnirM3k6Nzc6VeDQ6zzAhZgcbvw
         wqNQ==
X-Gm-Message-State: AO0yUKU5XnZUOqwLajpTQ1JkgWj73bRhYh7W/Vk0MTQKff/BxoDkdax+
        H75Y0TiJsLnGh85L0/20jLN7EA==
X-Google-Smtp-Source: AK7set8Wd12xTw8Uw2pNxpWv2ZIHiOMK3NQRpNv6gyaRe3GY5utq1XGMTUhwO7Kg9/gsp87NhnJlRw==
X-Received: by 2002:a1c:f013:0:b0:3ed:ac66:9445 with SMTP id a19-20020a1cf013000000b003edac669445mr13661092wmb.8.1680032203957;
        Tue, 28 Mar 2023 12:36:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7b39:552d:b2f1:d7e8])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003eb5ce1b734sm18060544wmk.7.2023.03.28.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 12:36:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 3/7] arm64: defconfig: enable the SA8775P GPUCC driver
Date:   Tue, 28 Mar 2023 21:36:28 +0200
Message-Id: <20230328193632.226095-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230328193632.226095-1-brgl@bgdev.pl>
References: <20230328193632.226095-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the GPUCC module for SA8775P platforms in the arm64 defconfig.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d206a9120ee4..fa0a145defe2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1161,6 +1161,7 @@ CONFIG_MSM_MMCC_8998=m
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
+CONFIG_SA_GPUCC_8775P=y
 CONFIG_SC_DISPCC_8280XP=m
 CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
-- 
2.37.2

