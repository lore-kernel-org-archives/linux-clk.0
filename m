Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548DBC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236776AbhL0Nfz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:35:55 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39514
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234268AbhL0Nfx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:35:53 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7926C3F1AA
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640612152;
        bh=SHDOTqD45fkOcgdIZOrzabWTlwg9fQB3mqCZYwiASwc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Q3FslC6lesIAV88C7ZW/jyt4KbTp+Bv33AUsKlaF568VrgMz2xl2I63btQ0XQstw4
         7i3NbcM/KRs6dB7iARVg/iXAAbGivirjgLSPfRVlCxfTstDSl+cP0ZYj1eq7RJd5oY
         JnSSwVhFyVaoV2ew7/r0Qo9mO0vz1+w2O6klNdxfVINcCqA0RXr4qbkNbLso8OYbc8
         lItcf7QgdLeSve6MHti8kExUsJfK6h4hjpiYsdNV/fmQJPiEFNBIffAD/HVIfvVMb3
         qmWgSL2u0C1c5P/ssnuJ+KW2REAn9u1kNwxPExiWNBGxtwP3ppfTc0jlGQGYq3eFZQ
         awundG1tuw0bw==
Received: by mail-lj1-f198.google.com with SMTP id w17-20020a05651c119100b0022dcdb204b9so1603753ljo.5
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SHDOTqD45fkOcgdIZOrzabWTlwg9fQB3mqCZYwiASwc=;
        b=utsL1gYc6UMIO4SUXJfW2GbYsUcO19hvLo07412wAKOOlFHocbXQAHYib6XZ3gb/Nb
         EOdHXY7M9CZ3jmIlS/MzUELv+ruQVH2jJxXjWG33Z5jvr0bFLyGPugRFqFjAr/45fdkg
         4C58/MWCXiogQ5IlKMOJtLibQ+ktZpNoHJ1/6fvk4gJHhMNuF7OT4lUdRRJb3o8fxX65
         Uv+57V97VryDoyaJ60arF0M/fLa76jkNfXbAe2EGBiuv1ISeo3mAs3MmpU1aH/ZXHN2M
         9vDumwMQbSORUJJPbhWGS4cwTGZqMk5odxsMa7a+zSzwjT4PykRDZEw6CP+Jb//FhjGO
         TJrA==
X-Gm-Message-State: AOAM533kOYzwTq6rjA54ROnrh6Uiwsd2UadnqEsfQbbJcgM8ue/aEcKs
        lWNTpB6s8OzYZ2y3ulE+wzr6Yxvxgvk5Yc9JGk4d4G7VEfdTolLengdvHBg4BWz83A6vj3luD0h
        FXW6lLO1QtKhBkhFFQL9AYU9lwPGX0xIWdk4/Rw==
X-Received: by 2002:ac2:51bc:: with SMTP id f28mr15038334lfk.222.1640612150083;
        Mon, 27 Dec 2021 05:35:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz74YnaGqeKHmwR3S7E74UQQMqDX12yIAKinwFN3GzO62zbbfUGRpdn19Zp2pmz0D3CIOT/OA==
X-Received: by 2002:ac2:51bc:: with SMTP id f28mr15038324lfk.222.1640612149924;
        Mon, 27 Dec 2021 05:35:49 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id h21sm829100lfu.253.2021.12.27.05.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:35:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 06/19] dt-bindings: altera: document Stratix 10 based board compatibles
Date:   Mon, 27 Dec 2021 14:35:32 +0100
Message-Id: <20211227133545.135049-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new compatible for Stratix 10 based boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index f4e07a21aaf5..5e2017c0a051 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -43,6 +43,12 @@ properties:
           - const: altr,socfpga-cyclone5
           - const: altr,socfpga
 
+      - description: Stratix 10 boards
+        items:
+          - enum:
+              - altr,socfpga-stratix10-socdk
+          - const: altr,socfpga-stratix10
+
       - description: SoCFPGA VT
         items:
           - const: altr,socfpga-vt
-- 
2.32.0

