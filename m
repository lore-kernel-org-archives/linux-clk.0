Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630B3C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 17:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242772AbiAYRNo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:13:44 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51156
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356502AbiAYRLp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 12:11:45 -0500
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 749613F4B6
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130702;
        bh=A8H8dxFjft/me9aEVAf7almjxfAoMnYXlO242MCpw7g=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=pjW8tyDAIr/lb70Hq2nxgm7GXRXA4rBIG3x0FWRdEqKmhez/Wn4cGbBauEP2gO1Tj
         lWZsoDKIXINb5pv1mFbOPRbWy5qG0up0uC7qF92iXY+s2xAPK3S25HjU0V8kgqxYiS
         +6LYhnhw3TBASmG7FUmu5j4bc5K0iqQX5KufmGVDRIniCxjc54HeIOG4KMfwhcMRMR
         IPtcBGMag4QfqK5YmnmtEF4Trfy+5nV7mcFhUFawxU07pUWRpGnYWadqVlIXNdl0hs
         fMjNc+pfRDxdy0d0o5twqXTT7z1ytijEKZ/63FXnGV2qbl9Cee5Bnd1S1bbRkoK2qK
         eGFS304/E2YOA==
Received: by mail-wr1-f72.google.com with SMTP id r26-20020adfab5a000000b001d67d50a45cso3330356wrc.18
        for <linux-clk@vger.kernel.org>; Tue, 25 Jan 2022 09:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A8H8dxFjft/me9aEVAf7almjxfAoMnYXlO242MCpw7g=;
        b=wNKZSbMpzNxsuPlOyx7/VYe5qUAtRVlOO9cR8giYMThShnoG3kubER/kfoFymiYjnC
         ghWhRKYgbhZzxwpHxOh/j0K2H2R7lJOmOgqI5KB6arXVitG184GG6U2q8ZpXtLgwyXSK
         4LVaO2yAf4XqC0ThjY6ciDMZ6V2zGyQAmr4EwEjZfB1Z0aoYQqouGivwe4wjItf7IRmx
         g4Bwl0w6cjQpAHVL+Fj76ITc0GRqD5TOJblbKQ4R0Wp+PDWpyGhaIBtl8HPv+DwfRvui
         fv3L7TZhKrG19qvVXuwvY/kuOD8ldLu8355tcPvXLlCtAdC/VNUNA23OO0LBxVp5dVxP
         8GKQ==
X-Gm-Message-State: AOAM532mqIJ8quuZpKZ3IuEXHjOJnuzgVI1mnH6e9yraA3wDkH1Jze9H
        Ex91D1Ox9NKsYzRoJ2Yha9j+OrmuYDW2zhdhRq6rrU2o3OOMhfe7zptiyuDMdBvvURwQxgrM/6y
        Fw4qmPKwLH7DI4X4YKOypN90lwYSjXxEVfTdyPg==
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr1830421wmh.127.1643130702243;
        Tue, 25 Jan 2022 09:11:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZRJJtk6Eg4pUW404OW2S98mBrHu5GF+pAy4IkydvzhbzWujRUD5vT98QX9iYAdGBg/AxRvA==
X-Received: by 2002:a7b:c0cb:: with SMTP id s11mr1830401wmh.127.1643130702108;
        Tue, 25 Jan 2022 09:11:42 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h127sm4477087wmh.2.2022.01.25.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:11:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        catalin.marinas@arm.com, soc@kernel.org, linux-clk@vger.kernel.org,
        arnd@arndb.de, robh+dt@kernel.org,
        Ajay Kumar <ajaykumar.rs@samsung.com>, linux-fsd@tesla.com,
        olof@lixom.net, pankaj.dubey@samsung.com,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        sboyd@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v5 12/16] pinctrl: samsung: add FSD SoC specific data
Date:   Tue, 25 Jan 2022 18:11:04 +0100
Message-Id: <164313066043.81586.3206885780884369059.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124141644.71052-13-alim.akhtar@samsung.com>
References: <20220124141644.71052-1-alim.akhtar@samsung.com> <CGME20220124142946epcas5p11997a3c37546d37cac91f690a2a602bf@epcas5p1.samsung.com> <20220124141644.71052-13-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 24 Jan 2022 19:46:40 +0530, Alim Akhtar wrote:
> Adds Tesla FSD SoC specific data to enable pinctrl.
> FSD SoC has similar pinctrl controller as found in the most
> Samsung/Exynos SoCs.
> 
> 

Applied, thanks!

[12/16] pinctrl: samsung: add FSD SoC specific data
        commit: 0d1b662c374c54bcf68bbcff3b71e6d6e945a7cf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
