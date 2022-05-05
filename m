Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEB8C43217
	for <linux-clk@archiver.kernel.org>; Thu,  5 May 2022 06:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241252AbiEEHCx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 May 2022 03:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236957AbiEEHCw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2022 03:02:52 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661664754C
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 23:59:14 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso4535121wma.0
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gG5ddXZSy1wKmOUQ6uBSLbcGTeipbmw8JGCrHp7VO3o=;
        b=IidFc3QITpakXVpjbjlX8PxSSGvYjWE2ldWmIV6nDpBZNv9U6ycKmbmxY4HGtjY+bE
         eZTlJKFNzLiUrUexd/tvQnwrQxJ0EFmUIb35xqa4WrK3qh7VM57xU0IR1tg/GH6jWbH5
         TF0E6bsTojZliRtJqvyPGjiuz0KvmVTWqyD7/5O8JuQrmOMGSOU6d47+CpldQkyYofZk
         iH1h8rwJCvoK7/fMFEPSDzINSpqzSbAeiJywx9p5U5BbHi+jEDQ4Zr4aUZ9BGKKUDhe1
         Lyh6OT6f1nVVVngwj99+fnMcYtxpnNuHDa4IU2pVdGoJNY2UWa5qmqDvVCBV4aBVGszy
         ZR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gG5ddXZSy1wKmOUQ6uBSLbcGTeipbmw8JGCrHp7VO3o=;
        b=XAwvWZteo5tbZla/NIRp67lEUKjaVFXhl3PxI+7k0DXdwTd+aIp19N73RPSeMB51C5
         9EYU69tt4P2fdzptVbOnWVO6+HZFE/ZwQPENjdRi+Piu/ws7agW0bkbMDWepdQpXvPm4
         ausPR+l0aRfQb+ENPEol+BVfVd7inngqLXbnpeEAQtXMleez7CbAO6v2j/DRDGKgqVPn
         ldaCdSwNWc255Vh20X5inwksb7dBx2UaOik7aXo5tqJA3bvy3L6s2sxkOw85+dtXiryU
         PZ949bX3zCcNvsXwWwmtEyoJIUrNZqzhuglYsTuhZvle6Hv3k8y6u+F4VJ/UdvJ7PtrN
         CNOg==
X-Gm-Message-State: AOAM5305gccxIZRSRSsqrcCUX0VGz8HBfRKl+njFwvgjd8gSqRfTmIhD
        lARzmMv8LmtiiD0sLEXHmofNgg==
X-Google-Smtp-Source: ABdhPJy5lIk1LOt1rt4j0pHvZjxyqDeFde7RLZHukV3nnsvhEe9CJNh5W27AATNlZynas6P68c11IA==
X-Received: by 2002:a05:600c:4e87:b0:394:4992:ab8a with SMTP id f7-20020a05600c4e8700b003944992ab8amr3157192wmq.97.1651733952869;
        Wed, 04 May 2022 23:59:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o9-20020a5d6709000000b0020c5253d8c1sm511198wru.13.2022.05.04.23.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 23:59:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 02/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
Date:   Thu,  5 May 2022 08:59:08 +0200
Message-Id: <165173394468.29323.6199648804566991709.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504075154.58819-3-chanho61.park@samsung.com>
References: <20220504075154.58819-1-chanho61.park@samsung.com> <CGME20220504075003epcas2p17f37265b522bb0c26dbdd4ebeec92ab9@epcas2p1.samsung.com> <20220504075154.58819-3-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 4 May 2022 16:51:44 +0900, Chanho Park wrote:
> Add dt-schema for Exynos Auto v9 SoC clock controller.
> 
> 

Applied, thanks!

[02/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
        commit: e61492e47838f4d99a3ffcc591ba57d1d5d0896f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
