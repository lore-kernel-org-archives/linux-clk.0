Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA573C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 17:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1454907AbiAYRPn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:15:43 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51450
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242706AbiAYRNd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 12:13:33 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 60C173F32C
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130715;
        bh=Eq37txspH2phodHd9XBEM6IFXJwB351PQd0cul0xPxo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=i3vxSJLw7gC9U3XSELBEQWNBokeKWgLClftdBRevLz8r0mXgslU+/m+4ExyeG8Rkp
         pgKnika4RuLZbAs6AEallBgaLIJKzkIoS/QrUiSqSrQlrBtQp5FoK/CEnvPUJOPKf7
         oolQCKJjy+WR2KyRR/iPRx6WWy3mm++THMm3xp3da4C+OQ8OBu+PNEAt4uXUlY4deH
         crUCrdC+ZMKMkarR5/3UT7UCAiJz3Q0JMKGWjZbMKFw3EfJj2DmjAvZB26BrNXiqkJ
         Q7aXOJSW0FnRkAsWi8KDuPcm7khm1x1fXBTywti8U60On7cyG2JGrXu2uJhp2wQdXM
         AZoDlniPXkc/g==
Received: by mail-wm1-f69.google.com with SMTP id l16-20020a7bcf10000000b0034ffdd81e7aso1783504wmg.4
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 09:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eq37txspH2phodHd9XBEM6IFXJwB351PQd0cul0xPxo=;
        b=qVWt8+jtapx6SncA6nNSY92gkrIDKrR1rRFvoWYrwgP36KhQTm91nb18iUzjDpTi99
         unTMBQoIeK+7yJrzhWmW/Ey+hlMFNiEaG/+/9uOH5druDT7q7pCFSLV29ikjGPHMSKcY
         qaDFKkq9a8MldJzJs24GlGBK0EEjjS7dxAJZDDnKkTazsV2WZ/av0+CIgWdYIhULcTa/
         jB0PWBkUFExYCQVhqVwK0Pu9K1Oi3o9ltwpG6rWyJGg/sgK5RLuBZtVWoa5Nn9Ry6OO8
         bdhYmHwU5ZHYct7hW6DdwcpQtPaoKOVCxNTg8C9y5iW1FLnGdKXcxULMbCASYkw0gwG/
         Me1A==
X-Gm-Message-State: AOAM533kb+bGkDpsnIC3eH/D9a/9eoPrdfFp12PjQSF2vMNMjGqGGvWO
        BOgMyqP67HsfGCx+Be4KlWsjPc0b8OZr9i5nUZlNe2FZG63L+Px1FHAk6Cymg6oqw2QPGJfdcUL
        pgsjr28w9Z3O6BNqH9bg1gwNTRVyhQ9NkFAWTAA==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3770879wmj.189.1643130715145;
        Tue, 25 Jan 2022 09:11:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrbdeHL0IlLxe23svOOleIzfku/tFpG1O9rOLv6Af/becvU1F5yAgCWPKlbpU8ULSRE8Matg==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3770860wmj.189.1643130714957;
        Tue, 25 Jan 2022 09:11:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f8sm1185826wmg.44.2022.01.25.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        sboyd@kernel.org, olof@lixom.net, soc@kernel.org,
        linux-fsd@tesla.com, linux-clk@vger.kernel.org, arnd@arndb.de,
        linux-samsung-soc@vger.kernel.org,
        Shashank Prashar <s.prashar@samsung.com>,
        catalin.marinas@arm.com, Aswani Reddy <aswani.reddy@samsung.com>,
        robh+dt@kernel.org, pankaj.dubey@samsung.com,
        s.nawrocki@samsung.com
Subject: Re: (subset) [PATCH v5 15/16] arm64: dts: fsd: Add initial pinctrl support
Date:   Tue, 25 Jan 2022 18:11:06 +0100
Message-Id: <164313065136.81319.15871986388224953551.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-16-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124143001epcas5p4c0aab0902709a24bbedadaa223fe7910@epcas5p4.samsung.com> <20220124141644.71052-16-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 24 Jan 2022 19:46:43 +0530, Alim Akhtar wrote:
> Add initial pin configuration nodes for FSD SoC.
> 
> 

Applied, thanks!

[15/16] arm64: dts: fsd: Add initial pinctrl support
        commit: 773d685fd406514af4b365aaa54fe493cf523602

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
