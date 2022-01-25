Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DC9C4321E
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 17:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1457733AbiAYRTY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:19:24 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55166
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346552AbiAYRNe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 12:13:34 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8E80B3F32D
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130717;
        bh=LvBwPzZuQYg1sk1AcEyVLVG7UxYbxMueMK9OojLw1Q4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=CY7PK8+b4bB9aoCAUW0tERxpxzO0v2nWOQ0fzR7bvxf0uuXmbre7Zc06Vd/PnuyS0
         O8uBlpcNoiSNJOquriY5l5fBTFqrJhKrDQXqd/BtaNpn7lUcg3dxRYtP6ZI62MgtNR
         CkCfJuKdyLVJwA2pEo58ykbTMKNophQQJGFncYp4vV6TOd3JShy5Il1XiCbXKMueo8
         OvhTk5ChHAZ9Hx+RkjVtBR1OFBkIodANZahKQrmEjfYTpY5+lao3+BJYmcGFAZeggB
         8YX2YBKG1WBJ+I3DFeTMIVGzLGb2Dyu3qNvnkArmMgIjA90gdO9aVDwEK2l18aaWNb
         MTmNZlV+AtUcg==
Received: by mail-wm1-f69.google.com with SMTP id l16-20020a1c7910000000b0034e4206ecb7so1774190wme.7
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 09:11:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LvBwPzZuQYg1sk1AcEyVLVG7UxYbxMueMK9OojLw1Q4=;
        b=XF9x7XF94CQ1WHuZNDJAWDMnrgCm8pTPTp1ZILhuzBGxQ7j74AwlJC1Xep8oqTPjcn
         yRDY0pIcNbzdUMXjz5od9VVZ+3gUtlveDgvUex9G9sT9w8T1+WTYml9q69OYAwgSR9ic
         HriSclLI2v/KKDisif+Mw3A8gz4S2DSOEKL9/iLYrjSTaxrbGhlDsHqOVAf0A+hzjpTw
         vRQ9fB9DU3ZhQzdincaAHKL3kcxTiRurT24iGL/0pzcJktodig/RcM1I8jLwdTzp3MFf
         8GSOoCmLiCD8toVIZBnkdLGC5jeEaEl6V33t1c01VubChxSk/RjgYceqsBUAwS4JArHv
         gtBQ==
X-Gm-Message-State: AOAM531Cq9zrOqCsFivhQAC6uHe+0NcwyPW0VIm4glz/It4HERAsSq+w
        q3J0+B+tUEee2zUteArbwHk8xWmcr4i9z7MMg8f7WXimeDCLMISUsOEzjRVp/tMmDwhJX3ZlDiG
        U0Rml/sgoqgEjZLr7HIey2PIcPVtDbPAO9nAtoQ==
X-Received: by 2002:a05:600c:4b95:: with SMTP id e21mr3819805wmp.106.1643130716925;
        Tue, 25 Jan 2022 09:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfP17LMlnVHGMliQrz4/SA8fpjZEApa5SVjlONjtvltbKWP+dIusViDktiO3K5mmPtxTR73g==
X-Received: by 2002:a05:600c:4b95:: with SMTP id e21mr3819792wmp.106.1643130716796;
        Tue, 25 Jan 2022 09:11:56 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linus.walleij@linaro.org, linux-fsd@tesla.com,
        devicetree@vger.kernel.org, olof@lixom.net, soc@kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org, arnd@arndb.de,
        linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, pankaj.dubey@samsung.com,
        s.nawrocki@samsung.com
Subject: Re: (subset) [PATCH v5 16/16] arm64: defconfig: Enable Tesla FSD SoC
Date:   Tue, 25 Jan 2022 18:11:07 +0100
Message-Id: <164313065136.81319.934364321640879263.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-17-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124143005epcas5p103598aa358ac35fe5e1ee762faf508b0@epcas5p1.samsung.com> <20220124141644.71052-17-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 24 Jan 2022 19:46:44 +0530, Alim Akhtar wrote:
> This patch enables the Tesla FSD SoC in arm64 defconfig.
> 
> 

Applied, thanks!

[16/16] arm64: defconfig: Enable Tesla FSD SoC
        commit: aeb62e360c0fffd9cf218a314647d0c7254becbe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
