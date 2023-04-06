Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A979C76196
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 20:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238845AbjDFUIF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237120AbjDFUID (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 16:08:03 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F0A9756
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 13:07:53 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id l12so40630580wrm.10
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 13:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680811672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rfkTef0ZdTkMKzZCQdBC5k73nnYAxbztufMSetHz8w=;
        b=mCMuhp+j3/ZIScGPav1F7wnjUdBKQG5tZsAQswaFdMzngFC6npciIIEQZWbzH1gUFQ
         sg8VJVfPvTwPYRZwV2oF9L74hvJYVNCm7Vjfrk7zqOToVWKTpVoJNXjOvyGNLXI2ELTf
         5xNe6Fs/wThBc1JdbSTEN/p3afVWtSY8t8rNAais0fU9QIKJTyYPkMDRWLoaBf3roGFo
         L4/23jTn/8M7RZQcgjSpOrX/RE4j76jyG2UhsRVR/78khJaTdT8d/Uh/SftSPDPZtZhX
         Y6SQRyTynq4hutVQY4Af36TZaXOt80jMT59ZX6yT3CYLlE3nApobe28AmebrSqbSh3s/
         F/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680811672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rfkTef0ZdTkMKzZCQdBC5k73nnYAxbztufMSetHz8w=;
        b=Q0jFdZXRZA1kZVEtoQaw7Eucmcb7gyOoDvJH7Vg27V4IuA5V4a3Y5HftRTskzZfeRg
         xKUc/SW95GBBm4MABerqvwR8Yvi6JcnlHeB2jx9vlzMP70G21C6bYO0lkUf5iODWUmnz
         tBxnchnqknLZtrv77IjAGUVstaS0/EU50C8y9u+/H1yOgf6Mw0VinKRtMrzaXJFkQsJu
         pddfDHggZyqf893lRYKxsw7Z8CPuRUNCzedOIjYM+x/xBUF9eDIeB+8OgW5UgJ69N1KI
         mWqdaQl5hqLphRq4qtUl6FJYaDsYLcAY56tqWtON+CZeRRmvWsNRNre29rGDDe2P+IdL
         4mPg==
X-Gm-Message-State: AAQBX9etAQ2tQ0YCjMHwrHcXCGitvK0CLrhWEf8VnxfDNW6/3/+tZDu9
        D9wtEpp06y3ioiDdVDSrYp5uew==
X-Google-Smtp-Source: AKy350YKkQTWxX+kH1yWryMZ/grGykBiuDsvJYQJSRjDnKkKwqTJ7J8Pu6b3BMhV3BCqCxqelyxfUw==
X-Received: by 2002:adf:e70b:0:b0:2ef:5560:bae9 with SMTP id c11-20020adfe70b000000b002ef5560bae9mr1435908wrm.68.1680811672178;
        Thu, 06 Apr 2023 13:07:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4793:cb9a:340b:2f72])
        by smtp.gmail.com with ESMTPSA id c11-20020adfe74b000000b002d89e113691sm2560506wrn.52.2023.04.06.13.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:07:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 3/7] arm64: defconfig: enable the SA8775P GPUCC driver
Date:   Thu,  6 Apr 2023 22:07:19 +0200
Message-Id: <20230406200723.552644-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406200723.552644-1-brgl@bgdev.pl>
References: <20230406200723.552644-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the GPUCC module for SA8775P platforms in the arm64 defconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1e7021ead7f5..aaeccedd49bb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1162,6 +1162,7 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SA_GCC_8775P=y
 CONFIG_SC_DISPCC_8280XP=m
+CONFIG_SA_GPUCC_8775P=m
 CONFIG_SC_GCC_7180=y
 CONFIG_SC_GCC_7280=y
 CONFIG_SC_GCC_8180X=y
-- 
2.37.2

