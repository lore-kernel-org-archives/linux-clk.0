Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F821C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236813AbhL0NgG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:36:06 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54564
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236808AbhL0NgD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:36:03 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 688FE3FFDB
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640612162;
        bh=o1chKf4rhRGoYEviXpRjKWITlZ+Zc/lnutNkUw8AFLM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=st8qkPdz4Z+/tSG+GnVOk3xmqAUSe4OFgTvQA5fZSLwdfw0/GfdXNmD+ARJXyFTf+
         FobFIe5UWf4rFRpeRbS8hGs3iOp2tU8Q6+/iE0lKqH33IMMbO4DJk4BIzLiLhSHDYA
         5DKV6uCzXAj256nSuzqKaw9aEQ8WvGOzNDxz95jP+dVbIsJoBEZrxQ2wVVPFsc8aSp
         84ZUHWbOJ1NsOyyULxn4qM/zcvNclAIeB71nmm1cThueoXJM0QitaIG9fxhraOE+Es
         n0AH17wCtSKTU1oN6VcM6BbY4lsszmTY9w/CIdGBR57QtjB96nMaX4IG2udtlHnNjz
         RwTOg9+vAxUUw==
Received: by mail-lf1-f69.google.com with SMTP id b5-20020a196445000000b0042659f2a17cso2707553lfj.23
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o1chKf4rhRGoYEviXpRjKWITlZ+Zc/lnutNkUw8AFLM=;
        b=spnSjZJ/wR3z/v5KDDJhvWa5DeLFN313MKF6DwG0jqzgpKEIMUWiu1YWxXft0FRDDF
         0eWlXviWXCxJU4L32HtWute2uiAVl/V5jiFvz2O9ZGya3eEDRU2z6vH2+d6QCk2wP/c0
         GnPB73G1rzcVsU6hxOchI1p4A1BppGxr9DJpzdurlrgRI6SlTdjmBLHEuMQuYHApbAwJ
         VG9t9DBgMJVjHqyRUU0UCsiOECtfsheOAPAez51aNm1gCrelweljNIRgy9XelskOVzp8
         QdLV0eaQmF2yqS5kQ928vj2QfEkc6y61uqRuFH9Y6FBbvdHncVgVjgGYsOCI4KPR/NA0
         qUkg==
X-Gm-Message-State: AOAM533VFLCfgA5x8Cy6BIphzc4bygqrfgIxrNxOsxIWqiPv2+tlFIi8
        v3t3TtD8ErKzEuwXE5yKq1c6O0TIGY1hZOEYLAF5ZDBvWTKUAHpTeSUqA4Lgn76yb71fiFRjMao
        ycxc5hGPRxh/gu7VCJHekYScU8vICpUdGDoF5gw==
X-Received: by 2002:a05:6512:308e:: with SMTP id z14mr15088867lfd.330.1640612161375;
        Mon, 27 Dec 2021 05:36:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwva8zKPnEw3lVn3bSljA913LVhJSEpc5uwboSFZa19Mf6V7NKXYAZqLhEQ/3hK1oeP7iLGxg==
X-Received: by 2002:a05:6512:308e:: with SMTP id z14mr15088851lfd.330.1640612161216;
        Mon, 27 Dec 2021 05:36:01 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g18sm800107ljj.124.2021.12.27.05.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:36:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 07/19] dt-bindings: intel: document Agilex based board compatibles
Date:   Mon, 27 Dec 2021 14:35:46 +0100
Message-Id: <20211227133558.135185-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new compatible for Agilex based boards.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/arm/intel,socfpga.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/intel,socfpga.yaml

diff --git a/Documentation/devicetree/bindings/arm/intel,socfpga.yaml b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
new file mode 100644
index 000000000000..6e043459fcd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/intel,socfpga.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/intel,socfpga.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel SoCFPGA platform device tree bindings
+
+maintainers:
+  - Dinh Nguyen <dinguyen@kernel.org>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - description: AgileX boards
+        items:
+          - enum:
+              - intel,n5x-socdk
+              - intel,socfpga-agilex-socdk
+          - const: intel,socfpga-agilex
+
+additionalProperties: true
+
+...
-- 
2.32.0

