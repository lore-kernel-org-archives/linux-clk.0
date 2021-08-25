Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AACC25AEB
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 13:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DD60610FA
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 13:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240160AbhHYNob (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Aug 2021 09:44:31 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35894
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232304AbhHYNo0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 09:44:26 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B6AB6407AB
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629899015;
        bh=skl+DRiXkNysfO8pcQNyeLlyFZw5ntPUibqnPCDAM3U=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=iNOt7udhk/TcPcnXRCrcag/nIHDyPhszuqjBxBS3RNX8wpv3oITNBzzdD/MWu3OWQ
         3kcVha4beXy8+ofCQ/llg66SFoyy2Zzk3NiLLpT315JXb1RVvPS98TgGG8AxMRy1jx
         5JXijaN7p6JeBDyNbY9F+QcjutEO0F3QyGqaGFjU7nWPDEzqRntckCvOBxCqGAlNR5
         skvFwgvlOUxzUiLdvWT60UCCiUCdHbB86+/pVzv0WHkMif4k2gFMw2DZ/FcYhubu3c
         SE+7Y7mhdK3qRBLr+vFapYs1dauLrgbEWLqFD3WpzfsVgIzevRKuBlFgiVQMEX6OPE
         JzQGcUezwD8Tw==
Received: by mail-wm1-f69.google.com with SMTP id r125-20020a1c2b830000b0290197a4be97b7so1871185wmr.9
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 06:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skl+DRiXkNysfO8pcQNyeLlyFZw5ntPUibqnPCDAM3U=;
        b=jupZoZncP9agHQqRF8c+c8Owy+/frZe3DlLiAlquppJHvYT5dDOA31XfG3KFsc56cp
         Dl53s748+qmpWV+HsFHuGXE7WyfG1bY3wmTRvY3j8FDagOCj0dIu1cL4qK7Fg8B3a/Ir
         OV0z1NvkTiLiHlMVvRndwdR8N2MirgZ2fPErmcLY+xMyZLvgkz9rmQagJsa44+gsOZOg
         iSAl0wcgmzqwZrWRCSX0Gu+06YIuzCPEjUUxSTEG8IYY0oVecbm2DGA5i7/b0L/UjIHp
         95iXzcOFKep365ZwbArm3ZwaSmPsrsmT+w6l2WwuaIIin3TbhqDEMN6rZGhF5tiIPv+s
         6hzQ==
X-Gm-Message-State: AOAM530/EA0imkRuYCUfpLi7wmKEpUVgDyT1obHmT0V1HZgelnOcfz7x
        sypLLeyMgXomnv5EGLZ9NNYrTv5v7g0kw9WCTkZdFWVjE2LSB7WXIAUxBk5OwmKbVLhF8bYrr7Z
        QJox0OppiWq53SJQeiyv+JzJByd2aUPgg4nloww==
X-Received: by 2002:adf:e887:: with SMTP id d7mr24689372wrm.79.1629899015399;
        Wed, 25 Aug 2021 06:43:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuhNGgwvNYoo0GmQ6L5/SlgHG39BAbAF1TxdBcudJBAkgJcJdjgsnDBKXIrzEA7Y3mZjl6Iw==
X-Received: by 2002:adf:e887:: with SMTP id d7mr24689355wrm.79.1629899015263;
        Wed, 25 Aug 2021 06:43:35 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.172])
        by smtp.gmail.com with ESMTPSA id w9sm5238954wmc.19.2021.08.25.06.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 06:43:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 8/8] MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry
Date:   Wed, 25 Aug 2021 15:42:51 +0200
Message-Id: <20210825134251.220098-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Cover the S3C and S5Pv210 clock controller binding headers by Samsung
SoC clock controller drivers maintainer entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a8e1e5d10d1f..eb4ada858826 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16496,6 +16496,9 @@ F:	Documentation/devicetree/bindings/clock/samsung,s3c*
 F:	Documentation/devicetree/bindings/clock/samsung,s5p*
 F:	drivers/clk/samsung/
 F:	include/dt-bindings/clock/exynos*.h
+F:	include/dt-bindings/clock/s3c*.h
+F:	include/dt-bindings/clock/s5p*.h
+F:	include/dt-bindings/clock/samsung,*.h
 F:	include/linux/clk/samsung.h
 F:	include/linux/platform_data/clk-s3c2410.h
 
-- 
2.30.2

