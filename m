Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB2FC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 17:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242436AbiAYRNm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:13:42 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51140
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355598AbiAYRLp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 12:11:45 -0500
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 414B63F325
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130701;
        bh=w7pNveLS0GBUcaM6xZHDvqGiuHIf5TR0krpcnow2fyo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=hqugDulmFV/YpJbTPBNKQtXXj3OCUXpThQUF+/NUp8Gt2EwQZKBnhvcs41NYBKFZO
         piUu24l5/PCp0fpK6R4goyAOzWrvTrx8qWjTEx55rlvucfs6N7EcMGGnshggQTnCkl
         BoUYo3Yiq9dN0t3KS5j9LpViBIm0s79S4XXZDS8kP4oODqBcQhLTbjKKxKR5unjUrA
         oBq2JLNmGk93VohCJwDT6tC9aIdnBS80XQYxFeGUWFG4tdpqrUwWML8+ZynBI4Ndrt
         Vvcd0KlIhZKGUE4aemziVwUSPkVI8ksN1Vq8f1kwmc07U2pQJmcdi7qkR9Zr9j/MgG
         E5YS8DFfdfeWw==
Received: by mail-wr1-f69.google.com with SMTP id r26-20020adfab5a000000b001d67d50a45cso3330332wrc.18
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 09:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7pNveLS0GBUcaM6xZHDvqGiuHIf5TR0krpcnow2fyo=;
        b=rWQPH1LG3GoyUT9nx3Ooe1obr1nhukQipcVTWbnQV9HhI5NTqL0IUOBLx9IGqlhfkQ
         4r98VhKX+bvggoX0DMoF6fLf2wZVUAjw/so5ymljBgTsQ5SLAmFwIOKVEEITIBm1vuU0
         +WyAjFEJ1s8Hkp6EVilPR4RgPS7/lPc/qsUsp9rTYfrXMCOWpjlCcFSrjdehsr2OpG5/
         B+1jAn8HiQetjG1tmr1/Slfnm6sjFVnf8kJA4feZ+HRDh1zdOJs8FPUJnX3x4pCUDI6i
         C6wmcBcYKt3eZKWtqy7l/sA4i1glqh5+1MxuXoZjfcNsYaazXTZ9LjDJennUcapCJrAX
         53Bw==
X-Gm-Message-State: AOAM530Hl/UcLs2h/fCBkNoZVYe/nq3/NVYwC5Cc2upfhD6zojmz3aLV
        IdR1W+5OtaCY5U+hLkIb/Bc4c6bgpFH4+ydWkFWqus7qwoC0wxHODGooWYF541WaftMIMzJy54S
        hgSAkX1KTmnEaiVY9+n3AvD2oUFlSRUEDji/7nw==
X-Received: by 2002:a05:600c:4282:: with SMTP id v2mr3842228wmc.78.1643130700815;
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0UJNIa6CQvbeScVNkgkIbqxoZi3ySJ1nOLLm6MxdhJFLNeQKvajyCF1/0whS+dTxXoqrw0Q==
X-Received: by 2002:a05:600c:4282:: with SMTP id v2mr3842215wmc.78.1643130700627;
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h127sm4477087wmh.2.2022.01.25.09.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:40 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        soc@kernel.org, catalin.marinas@arm.com, linux-clk@vger.kernel.org,
        arnd@arndb.de, robh+dt@kernel.org, linux-fsd@tesla.com,
        olof@lixom.net, pankaj.dubey@samsung.com,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        sboyd@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v5 11/16] dt-bindings: pinctrl: samsung: Add compatible for Tesla FSD SoC
Date:   Tue, 25 Jan 2022 18:11:03 +0100
Message-Id: <164313066043.81586.10760195237607935843.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-12-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124142941epcas5p4bbba53cfc2fc9862da9fd85d44de6e79@epcas5p4.samsung.com> <20220124141644.71052-12-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 24 Jan 2022 19:46:39 +0530, Alim Akhtar wrote:
> Add compatible for Tesla Full Self-Driving SoC. The
> pinctrl hardware IP is similar to what found on most of the
> Exynos series of SoC, so this new compatible is added in
> Samsung pinctrl binding.
> 
> 

Applied, thanks!

[11/16] dt-bindings: pinctrl: samsung: Add compatible for Tesla FSD SoC
        commit: 98ed04b33f43a80c0d9e218023abce3b47ca3539

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
