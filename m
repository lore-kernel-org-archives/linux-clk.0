Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167A1C4167D
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbhL0NcN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:32:13 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54460
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234040AbhL0NcK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:32:10 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 199114000D
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640611928;
        bh=Ys8+KWWv6cblvYfRfABL3+M+hNb6oCdRIvi8aT4vj7M=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Ju7MzlygWJ0Zv78VFg089a4OoptRcBGnGjD9shFxoWDIvfU8YCsoR1TsvOB4IJaGY
         v0xv8/8YIYcmf20Vnt5gZxnymPGx3A8qIYZwaDbopbcufOo6cV9hf2zB+8rMLMC/al
         v2B3YVDWmkzj/o0iUmvWxy3NEZ66stM8Z4yvdGb9fmV9y4nWQjbCapZMsLIAV5rmOU
         sXk2kAzrzk8p8S5D0k0TzKvkUSb9Nj8EPhBzhrR4CulTvYLgnOw3BfxbEuJx4AB8t/
         kapDSXijaV2OH3b13aZ3bIPFSph/IgROsD9MBeAqFDnbdKn6PyLEcfd01xkjp+emoq
         qVaW6Vr4bzYAw==
Received: by mail-lj1-f200.google.com with SMTP id c20-20020a2e9d94000000b0021cf7c089d0so903839ljj.21
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ys8+KWWv6cblvYfRfABL3+M+hNb6oCdRIvi8aT4vj7M=;
        b=Hka3dmKSjvViU9Ryu1eCiXzEH1NpRvUfRaR+my560fs1qv84VBQ8Ktyfn0gkDjADaH
         E5t/4SVzl0GbsnWskLKCG7AEG+AlZ5wUyLi46L6ZRpUwkeNB9fAna+K0bprqxFt0kFYA
         iO0+bdC6w+svIX8dwfwFYa0znvNKkvK7/c56KNvUwUmNeO1N42wkLe/LqIWlagtCwNwA
         GokwvG/Sbly9uhUqmpcPy1j6FvnpENx9dzwcrkMO0YD3AfTVBr03CMCzYInkcuhG9LlO
         BkQW5ux6L5AqWQ2YqkHaYkmjNEsEZI0LDi6U0hAKAaWWxRYCrcS/Bt9KjJiADuFAgKZu
         4vJw==
X-Gm-Message-State: AOAM530st33DU4FkdZppA4GJ/VJomi1LLHjCQW0F6qEKgQoyzaug5A7W
        +ebQh5pdz7z/yvN6bTlU+G0ndnmnPd+7vDO7wmSvdxAuEinmNXAHKiYjZak89ErYcT6qmcy3hOJ
        HoCATE2ZjJxl+qyU6FUReCKFwEbpJdX27BRuzig==
X-Received: by 2002:a05:651c:1054:: with SMTP id x20mr13675245ljm.445.1640611927040;
        Mon, 27 Dec 2021 05:32:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzazX3ZCxB4v/l+C8+nXPPq3MgFAHSUlHAZU6sucg0O4uB9a/5/Rs9mH1zRhW8sZSfsXxuJnA==
X-Received: by 2002:a05:651c:1054:: with SMTP id x20mr13675234ljm.445.1640611926892;
        Mon, 27 Dec 2021 05:32:06 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d14sm1433510lfg.18.2021.12.27.05.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:32:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 04/19] dt-bindings: altera: document Arria 10 based board compatibles
Date:   Mon, 27 Dec 2021 14:31:16 +0100
Message-Id: <20211227133131.134369-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new compatible for Arria 10 based boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3d7a2f699279..963c83904010 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -23,6 +23,9 @@ properties:
 
       - description: Arria 10 boards
         items:
+          - enum:
+              - altr,socfpga-arria10-socdk
+              - enclustra,mercury-aa1
           - const: altr,socfpga-arria10
           - const: altr,socfpga
 
-- 
2.32.0

