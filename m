Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5B8C4320E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 14:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A188360F93
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 14:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233420AbhHIOAq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Aug 2021 10:00:46 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:52828
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234538AbhHIOAp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Aug 2021 10:00:45 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 92BBF3F34C
        for <linux-clk@vger.kernel.org>; Mon,  9 Aug 2021 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628517624;
        bh=PXrJ+BbgGTXejs85MxNsHQpcGJv4nzL8+I3ykkzFz/Y=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=UItA6TtFhztj5GcV5g8jP6Do8rXQoP2xe090xFv9d+pRvdhlN2fH4eOaOKK9gyo5W
         9mtp1wbjLKnCdZ5uKP7PtODpDDCPC9jvwfWzLc8cXvoywfKnF/esAiq6QuTSxe3e1C
         ouv83DiPthm3Rq5Calrk0OkFsPW3ca7b04MrYpW7cKLCdCzMYJmlI3ay7JtLyg3HrP
         uXGsraL8FMV7ojHf7YakFLvfxGsKT1GLIhfBJlplpMUXRbb3dly0GsYamVfm3t3VwM
         oBkZgYz1NzJOf1Z22folkEQMq5Q7+ITaw6XiYEWdeWuxLb/trelGmIPckejjIkJwkO
         lwZh/DPKJYsYw==
Received: by mail-ed1-f71.google.com with SMTP id y22-20020a0564023596b02903bd9452ad5cso8894685edc.20
        for <linux-clk@vger.kernel.org>; Mon, 09 Aug 2021 07:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXrJ+BbgGTXejs85MxNsHQpcGJv4nzL8+I3ykkzFz/Y=;
        b=TNxW4oc40X9oRIerT5sl0Kk779Vh+H0AC8E8HTjJcsuUJagpPN5vCx/ugxnr2HIhPl
         dLFjP7Yw18dkeA8DCEYSxjZDvQcjR9dsvySJ3kGzviWHGIIetkOUnu2DL7p//8Dn2NoU
         Tb1+lYR3kOBTSsgUhVwvhIfWZzShM0o2zECsIHVvy1BUNE92dfkt1ZjfR9Bimsb/EsDs
         I0fljfMlg2uHwtSFoBV13ahP4lFIl7XAi5rffGoovUORn1mONG6gRYrI9fVXI6w5CI/m
         /oEul+CN4QKVTpbj6wy+BuOlHUVAl+87gXO18war7W0C9CKTjui4CDusA/Te8YlT1V18
         2U3w==
X-Gm-Message-State: AOAM5316sTm5ODlxGoEBu3nLVzou0HWDSdVDX2LulnLYCPadB/QvCKBT
        oV+7/iZu/m/1E5XJmQyaysxVjXvbYv9zPqKJF0XvWCLOaFz7X8laEx6Ty3qCokALqH+RUvedfXo
        Apod3srHY13ROCX2iSK5VHWzRZtmsIUInHDfzCQ==
X-Received: by 2002:aa7:c6d0:: with SMTP id b16mr30047987eds.257.1628517624123;
        Mon, 09 Aug 2021 07:00:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy733K83FCEVxUSDiFu+sAff4YqEjYwxphl7rHUYA+ge65yYWoTdLNweov2T/r4nxposORUTw==
X-Received: by 2002:aa7:c6d0:: with SMTP id b16mr30047953eds.257.1628517623881;
        Mon, 09 Aug 2021 07:00:23 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id b17sm7909686edd.27.2021.08.09.07.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 07:00:23 -0700 (PDT)
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
Subject: [PATCH 0/3] dt-bindings: clock: samsung: convert AudSS to dtschema
Date:   Mon,  9 Aug 2021 15:59:39 +0200
Message-Id: <20210809135942.100744-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Rebased on on previous series:
https://lore.kernel.org/linux-samsung-soc/20210809120544.56596-1-krzysztof.kozlowski@canonical.com/T/#t
It affects only the maintainers file change (context-dependency).

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
  dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
  MAINTAINERS: clock: include S3C and S5P in Samsung SoC clock entry

 .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
 .../bindings/clock/clk-s5pv210-audss.txt      |  53 ---------
 .../clock/samsung,exynos-audss-clock.yaml     |  79 ++++++++++++++
 .../clock/samsung,s5pv210-audss-clock.yaml    |  75 +++++++++++++
 MAINTAINERS                                   |   3 +
 5 files changed, 157 insertions(+), 156 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml

-- 
2.30.2

