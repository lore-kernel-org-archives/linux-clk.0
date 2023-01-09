Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A6BC678D9
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 17:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237384AbjAIRrf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 12:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237393AbjAIRqG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 12:46:06 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9259A3F132
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 09:45:47 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id az7so9012189wrb.5
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 09:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6YIZ1LSx3MNvvQS/l3TnIoF+zlWTaB4f6323ZSrlbw=;
        b=P9u6ajRuUYdG9bREoMXwTHqfgtz/c1/LeAa6N1trN/7KM+wU58o37hbPyd8ad5wWxv
         eyifJ194PSUaB9pPRztMO0HTzERh2yJkiTX/2a+HCF+pyfV13VkMBHz0gstqFCBkTHfH
         glSpOCSJ9C63OdHw9g+iZp+EGIygMNzjJ5ZyYpn1dGEwDJtWWe/TZhuBucApmFtUYqxS
         Q71k3haoISbH52aFzrJjsxSEA7dWz+ZJmWrND960+bAQuO7izMhe5hzYJlMKAvt3Unkb
         jb1Hpg5CBez62/ipwOK8uYrAIkkvMZGCR9aDTwJR4mCxe5GZvBkc8Z6v07gmd9kNoBIz
         Yv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6YIZ1LSx3MNvvQS/l3TnIoF+zlWTaB4f6323ZSrlbw=;
        b=BDN1q6tEcd0CVjAOY/ReHMi5lp9SuGmTs7IpvZKeRXx/O/7F0GZgWAXXWAVKeipZEd
         EbaqfuTwEDc5r+YWWXd4KHYRwCPKRhCJSF7YvqA8lahGyjhUPQ8p37G8K2d71taN+8eV
         Fk4xegvwi9o4fgGacMK7cMFzBt3ez/ZpO4gZ3EGNxQC1eUzAxaTsvyGHmlJUDu6pvrUI
         wMBNnMSNA3IP30AwUGZr/7h7LWrYM8Z8uEPe8C0z4/LI3PrmYbuR6zwGgp77UfOH1kUT
         0z/0yQPkuFRLVjf3Up9l7TwUzOuHIKsokVchcaMPdmXRREbq5qXXTemsZEJAivmOHXIb
         kstQ==
X-Gm-Message-State: AFqh2koxTY5zQQajZHa3zpZUPsmWoIWDVf4XV5m8LVk5FyayfCCjiGv2
        1rUiYRzIIKalTTnENq54j07hEg==
X-Google-Smtp-Source: AMrXdXuPVGk40F49NFrVvlrS+Sm9nALGRx5drRYXfMMI1eX+O0k9GGSjTS84tvbh8OFn6R9VaVx/qA==
X-Received: by 2002:a5d:4150:0:b0:286:2b9e:f549 with SMTP id c16-20020a5d4150000000b002862b9ef549mr27405355wrq.66.1673286347202;
        Mon, 09 Jan 2023 09:45:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c88:901e:c74c:8e80])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm6142902wrv.113.2023.01.09.09.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 09:45:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 11/18] arm64: defconfig: enable the pinctrl driver for Qualcomm SA8775P platforms
Date:   Mon,  9 Jan 2023 18:45:04 +0100
Message-Id: <20230109174511.1740856-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230109174511.1740856-1-brgl@bgdev.pl>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the Qualcomm SA8775P TLMM pinctrl and GPIO driver. It needs to be
built-in for UART to provide a console.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d5c938adbd2d..6c752b9a4565 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -555,6 +555,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
+CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
 CONFIG_PINCTRL_SC8180X=y
-- 
2.37.2

