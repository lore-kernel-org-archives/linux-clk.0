Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F589C43216
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1525E6101E
	for <linux-clk@archiver.kernel.org>; Tue, 10 Aug 2021 09:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbhHJJdR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Aug 2021 05:33:17 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:43026
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239163AbhHJJdC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Aug 2021 05:33:02 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 5849F3F338
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628587958;
        bh=Hsa8IKqVji29FGH+yRDuNJzfbTLnU+d/QReLlRASr30=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=qssNyyJMLQ/nuMzjqRNHiLlERiJ/cOFW7vUZb8GGNkh1/ntGwGvwN5fXjQALKOFvf
         mojDPU4f+rGCQ910mjJu0K5/1PSACPwNQJIhDhhNdPpGa/BBrMg9mLVAfZGVoo6VpY
         pXh3iO69ha841xKJxbH8S+jSOmKUj6c9Tp2K0p3LZ0I3l8vZCTtAMpdyhWV5013W95
         zfsxf2ItTdhp+DnWgkUM/oi7xL/Am6tHMEwcDjyzQEaPFZJir9/6q7s4+fFCevgjAM
         wymXKClGhy0OzdM7LaY0sVw3to3bS1+j+IegcSBNBFe92PnOrY5HOLvXJ+9JjgG906
         uCq8g2O2n3xLA==
Received: by mail-ej1-f72.google.com with SMTP id q19-20020a1709064cd3b02904c5f93c0124so5353873ejt.14
        for <linux-clk@vger.kernel.org>; Tue, 10 Aug 2021 02:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hsa8IKqVji29FGH+yRDuNJzfbTLnU+d/QReLlRASr30=;
        b=HV33AY80lKVqVdtw0XuJ4l3tlEObqeKktoN/XOc0WdBxium+KjjmWBE5r0DfDoZoII
         0kmf6WMui5bKtElBrk6tj04jvUhdKGUtuBYF1xK1lDFL8U6p6J9ztNCmkA2MDBKTXr5U
         grLuYHk9pfjnKnp52UJWw3ZOWNwZrx6qOF5HIKPTOaJpb0C1kK7uG/Qw88RBwlfRMgQ4
         hX+u04/X8uLM+9upoxBLTkyRnOk/GJyG6oN3u+umcyCCzXFSmMrsc1fzKWhixhvuBjB/
         /92jMWdIPdLLcRDC/OC/t46urlVSA6c0Rbs5h8lCcmCdjekcDnHIanSkKBK+9yj2Pc9N
         p3Jw==
X-Gm-Message-State: AOAM5336oFALUujhchxePMho71MCcP2V7uEREM7Q8YUUx046AxWtto7Y
        neSjzcRD4PgbJkdWfeg4E/huGwYX/e2kXqkinkCOfQhQBR86B+EShqUuoGdFVallGFLF5mRt4p4
        QcJai09UnxFmW6CxmaNfMtd7h1guG3O0aCgOD4g==
X-Received: by 2002:a05:6402:718:: with SMTP id w24mr3802093edx.49.1628587958081;
        Tue, 10 Aug 2021 02:32:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR7C8E/KWR2jGuw3L7l7j2/qOnH9UiytPUdHGRKEP61jLqGIG5z9kzxTHeSOVYaSZs0tSahg==
X-Received: by 2002:a05:6402:718:: with SMTP id w24mr3802084edx.49.1628587957975;
        Tue, 10 Aug 2021 02:32:37 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id q21sm5117606ejs.43.2021.08.10.02.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 02:32:37 -0700 (PDT)
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
Subject: [PATCH v2 8/8] MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry
Date:   Tue, 10 Aug 2021 11:31:45 +0200
Message-Id: <20210810093145.26153-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Cover the S3C and S5Pv210 clock controller binding headers by Samsung
SoC clock controller drivers maintainer entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2dbacacac3f5..4477215ef649 100644
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

