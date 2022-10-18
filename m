Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3A9C43217
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 13:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbiJRNTb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 09:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiJRNT3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 09:19:29 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFDB6573
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 06:19:26 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id t25so8567915qkm.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Oct 2022 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pHiEMFfYao+vpXSzcw1Pyr5Zb1hstE5rItxZfxpi4Q=;
        b=NYi6NDnnA73hScjXrX/J/+AsYL8Y40X28MTeO2hJDsxxSm1wNdO+FdH4chdaxuSacS
         l1z1WDo6/nS7LpsELf+IynRlhYDLjEc84aNcJwFcdWGM2ln4OvZ2T+9gIxG7gDsgWBBU
         UQxyZ1a5zPGcl9+0Dkf8DfpFdiEePLaFx9EqwdyYFhvwa6vBz20UlQAq/Nwa4N/iahyG
         4vCmfh0zDkgaNUR/dELAslrL6PSti5EZ85M7QppecGgsQd3NdiOkJjVvSnJjYUfg3L1B
         s1rpsPXvm7IG1kHu0s3fW/qsZYTTj8PKbHOII1myZqwCi52DpblVjl5ra2i6eDKpJnuJ
         lYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pHiEMFfYao+vpXSzcw1Pyr5Zb1hstE5rItxZfxpi4Q=;
        b=rT1iUqBe3ddFrutDNcJ4wfp+/pPoWeFysSm47yPdj3yyN+dCdIetSWoxQfeKS90Gth
         P87SVjIyz1k1KGb9fA1kz4Rkoen/dJnoA35nrXeCGrYjLDPAHNVBQRS7ndZh3JXfYdeW
         gFt8RKYma/BuOg0Wfo7zde506dQcs0x3iPauNtOTBSSbPPq5YXZ5HG1jTUb1pjCbBMiw
         S+kNwkYaIX4eF63tK1IfdvK89GuSZHPbwEGYpF4UxJ10bJyTHzuKrTYWp1gsNQZdsCpq
         czPlldPTfHuOzKzk268r/MPzDSe/42Nr31Qw/bFziaAD6UNv3KXQe8c8a804KA6ryeLG
         LGOA==
X-Gm-Message-State: ACrzQf0OP6IVTSZF6NI0vhtgZe8vJkjLuI6ftpR3NDvYDTnrtQYn1wVf
        gtZo9pswO45b91WZD4LibLzRzQ==
X-Google-Smtp-Source: AMsMyM4D7tu8vG7yq6HFiUpqmmutvXXMw5bAxoPEBAtdyVgzXpcN/wiY+KW8504fK1vupNWtM5BJ0g==
X-Received: by 2002:a05:620a:45a0:b0:6ee:e153:8d49 with SMTP id bp32-20020a05620a45a000b006eee1538d49mr1833526qkb.170.1666099165270;
        Tue, 18 Oct 2022 06:19:25 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id s6-20020a05620a0bc600b006e6a7c2a269sm2527599qki.22.2022.10.18.06.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 06:19:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [RESEND PATCH] clk: samsung: exynos7885: Correct "div4" clock parents
Date:   Tue, 18 Oct 2022 09:19:12 -0400
Message-Id: <166609913433.8547.14138781440023077011.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013151341.151208-1-virag.david003@gmail.com>
References: <20221013151341.151208-1-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 13 Oct 2022 17:13:40 +0200, David Virag wrote:
> "div4" DIVs which divide PLLs by 4 are actually dividing "div2" DIVs by
> 2 to achieve a by 4 division, thus their parents are the respective
> "div2" DIVs. These DIVs were mistakenly set to have the PLLs as parents.
> This leads to the kernel thinking "div4"s and everything under them run
> at 2x the clock speed. Fix this.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: exynos7885: Correct "div4" clock parents
      https://git.kernel.org/krzk/linux/c/ef80c95c29dc67c3034f32d93c41e2ede398e387

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
