Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A024C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 12:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242596AbiFTM1P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 08:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240109AbiFTM1O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 08:27:14 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AC717AA8
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 05:27:13 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id c13so10416668eds.10
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 05:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+7zSFmCgAYJTfLDYvta4u1btP/xlyhqRxIkaAavVr4=;
        b=vP24YWI/E50s3detS4JAuqTFxXsK7NvUJEF6p9PS7fQGYTTiDyF+J80GJMKoQsxn68
         4OIQNsVMvT+25pRV53ZNTrA5m8gxXmIdwSbiBne3dw/mStu/btTEcanz9iwaQ+TntYup
         dyGZVVNg+L2DugO1zdVnqRmR2fb8uTbRuYyH+AElMir/mzC0vrpcaA4GQENJBho5aGqv
         w9t2u0LAAbmCSLIShCLkGMvMnBewBG9g6nxrMdWx3H5TXhzVg28MnhfZohC0FfSNo6F4
         lqSX5iXCDJoucwc3KfiPbqMIDM+CsztJqRhFCVGYH4YpP9cQVrOdmVi3vqW3mE3R8GBg
         stpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+7zSFmCgAYJTfLDYvta4u1btP/xlyhqRxIkaAavVr4=;
        b=R0sT8dFK1fUyydQUMwpf3rlDgol6w7pikela4wJ+0IfU4Z0Smim4A8aXuAqerpDHyx
         r827fb8gF4ehZleKDTWFMbAG63V1PLcgiTujdU02sdFrdJ0TJA6qaKcw21G2bJraBRa2
         d4IDLZRUTwLzpbgNXvllul/c/cnYrQJeIG5jajFVY5iWOtpkuCH2c6Dou9rqq6b68D6s
         tJzM0IesKKX/KiPvU3On+w5SSP/Cdg0NPql9buPNrtvyOJJOGY2Au0S3Z0ZFs6RyD7fk
         RnQgC2ozoGkNArEcDJYbY/GdQYJrvJArbcf91qERJhRsZWX8BcmZuTwDe5P1VMtgfOEZ
         AtNQ==
X-Gm-Message-State: AJIora98yoU0fybpah78wBmvghqRxks53U4GGDbmdkOwNYOkfSk3q+pD
        V7Dhka6feRyHmg1rPZytjSTACg==
X-Google-Smtp-Source: AGRyM1uhq/cePecmg+PBSpFN37PalbSei6PpK42hPQXx1xuFwBVIL0me4eTVOpNH9Mk0gWnlgM1K4w==
X-Received: by 2002:a05:6402:42c8:b0:42d:f0b0:c004 with SMTP id i8-20020a05640242c800b0042df0b0c004mr28878526edc.356.1655728031953;
        Mon, 20 Jun 2022 05:27:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906300400b00722dcb4629bsm15987ejz.14.2022.06.20.05.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 05:27:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        phone-devel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/5] dt-bindings: clock: Add bindings for Exynos7885 CMU_FSYS
Date:   Mon, 20 Jun 2022 14:27:07 +0200
Message-Id: <165572802724.43913.12874553470306396610.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601233743.56317-2-virag.david003@gmail.com>
References: <20220601233743.56317-1-virag.david003@gmail.com> <20220601233743.56317-2-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2 Jun 2022 01:37:39 +0200, David Virag wrote:
> CMU_FSYS clock domain provides clocks for MMC (MMC_CARD, MMC_EMBD,
> MMC_SDIO), and USB30DRD.
> 
> Add clock indices and bindings documentation for CMU_FSYS domain.
> 
> 

Applied, thanks!

[1/5] dt-bindings: clock: Add bindings for Exynos7885 CMU_FSYS
      https://git.kernel.org/krzk/linux/c/cd268e309c29e9a8b15a47f684d848c1d57fe150

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
