Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1CFC4167D
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 16:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238949AbhLQQQB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238953AbhLQQP5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Dec 2021 11:15:57 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C43EC061748
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 08:15:57 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id bn20so4125280ljb.8
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 08:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=15f+Ze6FNJittgFADDHtUgTTcR8503nXs41Ek9JpvtE=;
        b=VbD2B0rwV8JxtTK9S3if64JlLCTU1+5bDRJEaKt2+UYbSqd1c/OxESWU/3Y9zpMOIp
         xORL74GWvGiHXlztq+1LW0UCfy+igFf9w1Jdu7K3HqLiFVk+l5pE5abZt8W5xNDMysQb
         qPfKGAXBnFTmeWw3njr5rer6bTHUcqXan0QYVjZTeHDdgGM8xHoTxbyClEO85YlrWxVL
         T/Q/1PNSV8AGTPboOBoUiOT+wNhZlWG3fwTttJlM1H2dHtlW5EE0XME16ajRXWYowCPq
         jNcnGhYz4Nb8taN4UIiBpVAlZVBLvacuRf/tQrV1Ztk4GPPl1KZvLewAFzHGNR9kqZ16
         IrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=15f+Ze6FNJittgFADDHtUgTTcR8503nXs41Ek9JpvtE=;
        b=kxCJ2ryLdYGpu8zXhFH0A9BtmSouVrkkKktU+LZL8caMOHZZVJJmS6gqgvkc2+3Zt5
         6YFBp3TsUEwfrXlkEFq7titq7f7Lc4V//R1B16x0Hk1hXMLfybvdSUPVUXRrxUVSrnTC
         KFiCM0FkcRjzEdYB37604vrTjyCujcOk563u43G8Fqe0c2fFg3alNh8RiSXs9ppfRanX
         GC4ms0Zcn0omYjizD2XdgPSkJE7vEIFnLDjiNuY8zai+urBLB+YmuBjzg2kPfTNJZ5CO
         1piZNaUz/q09xVsLeD763Mnty4tT7W8AokMQn8UpQyCJMzQSJ1AbuBDduPvHNMEkUWIP
         H/Rg==
X-Gm-Message-State: AOAM532AwZJcJcWQrrV3W/VCmH4jY2svSKouGyCYwFFh3Ab+RI9CftI0
        opbUYtbZAi7uuQ/JqCdmXSS6hw==
X-Google-Smtp-Source: ABdhPJw+UbN8zwav66L+P3QZG0al+Rw25j2hqujD+XhCzFJatRciH4W39QillkSQFhbPjp34jDPPzA==
X-Received: by 2002:a2e:808a:: with SMTP id i10mr3348752ljg.329.1639757755453;
        Fri, 17 Dec 2021 08:15:55 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i18sm1453775lfu.67.2021.12.17.08.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:15:55 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: Add vendor prefix for WinLink
Date:   Fri, 17 Dec 2021 18:15:45 +0200
Message-Id: <20211217161549.24836-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217161549.24836-1-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

WinLink Co., Ltd is a hardware design and manufacturing company based in
South Korea. Official web-site: [1].

[1] http://win-link.net/

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v4:
  - (none)

Changes in v3:
  - (none)

Changes in v2:
  - Added Ack tag by Rob Herring

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4698213611db..25f94c723cbc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1328,6 +1328,8 @@ patternProperties:
     description: Wiligear, Ltd.
   "^winbond,.*":
     description: Winbond Electronics corp.
+  "^winlink,.*":
+    description: WinLink Co., Ltd
   "^winstar,.*":
     description: Winstar Display Corp.
   "^wits,.*":
-- 
2.30.2

