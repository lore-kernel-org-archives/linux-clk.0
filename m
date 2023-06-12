Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F9BC7EE45
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 10:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjFLK2t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjFLK2c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 06:28:32 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CBE8E556
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 03:08:39 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so6178130a12.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686564422; x=1689156422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NrWkYN+T1PuofiMKnG6dXc8ZUYCBSKcJmUWA7/nNhc=;
        b=B/uIqxlx2N2brzvwnub3jXK6Ur5ovV5ZNxQz0LK4UIHH9Z1aN/arWkQfpJxRhkvI3N
         ixFDjKvgSgsrYkeLvv7wQdMYb/RURiMoC9UuxCNNHjlhtSJolAS0tsCGqBwLl41j696b
         gXM3wanQaHOp7npLsYpPx7SpC7coFSi86TJ9UNRLGr7YckGgRsWF7V8y9/sF4BYmMAYY
         R0+FGiRsPUYWRSs+3c6N2jey7esVxB/UaxovS3ujkyMGuDMUBpXe3ApOzZY6xk8Jnvbi
         x3vPPcracvz4WOM4qlZ6LKeO7EtoBOT09pmgQucZyuqnFErhAslTgLNciNinrnIQrwBH
         l/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564422; x=1689156422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NrWkYN+T1PuofiMKnG6dXc8ZUYCBSKcJmUWA7/nNhc=;
        b=Qxqyou3x+lt+BOdIAI3GUGLCv6TLD551gz3sj2YSjNlb62PoGnq5vZeEJEWpBpaYKw
         czpqsty5vxs4u/EOwOVpDYLTEJ3kpRJ3F40Y+IU3M6LwhD+DlHh8Vyh3U/Hd9Mrf20v9
         MB4SxOiZte89qOFWy0a12YBn7KXIST/FADS9y7V5kjrWdCywCPyWykGhs0tO8oQwuZ3v
         YM6NawpXXbCA8qjAWL2fPYSNUiDuZopSsukcrA3Wq6HOcAK2TOp+yC1WYNxL9Kn77heP
         I+E060zziv9QFSpQCndObQErk60nUxFBugLYFzxHCiBiw44k7gxfOUOmt9W57dEfrKkC
         5dLw==
X-Gm-Message-State: AC+VfDx/SNZIdieYMeCGejsLDl34SOvjdsAmvhIS2A5MEA26EVTUwX8c
        sABmGlnZDIEUZo8FKeJTXelArXLtTfyjOXzeRpwo0Q==
X-Google-Smtp-Source: ACHHUZ6UbFF7XinpTrt0jXBpOVxMXkcAEgZfOmFyUIfEmeQZYaZ2yudSohukq1I9n1QgkdhoX5dpBg==
X-Received: by 2002:a05:600c:3793:b0:3f7:8fd5:567 with SMTP id o19-20020a05600c379300b003f78fd50567mr7016692wmr.2.1686563864354;
        Mon, 12 Jun 2023 02:57:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:44 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 12 Jun 2023 11:57:27 +0200
Subject: [PATCH v2 10/19] dt-bindings: clk: g12a-aoclkc: expose all clock
 ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-10-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7gny86gEdGuVv1Xi4BFHu+2b+JlYB0+AahzkDT5GhB8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwJUlUTItdC3kUPmDRVJZidNU1HOd9NfqDOUhnU
 bzLCyWiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCQAKCRB33NvayMhJ0e6sD/
 9L2RHqJBZ/WvUasGVtJfG0CFUUkWOgmyPk/3wNkO1BBXEh3pG16D+iz8phOPtBXy4bZeoIy9yrECAg
 bFiUwZljtqSHiC2xuxI6NZZxhWtVL7a2O8REQF/c9l3Uvm6QK7QVKwAaHZ013tWz0vwXGEDwvB5vbg
 39OL+HRj3gashe6POOxBPzkHvLRVPxYJbn5ki7VXalUGOlilNXSgt96xPL3Cb7UHQGKRd2N8bpqVe0
 YFSsrd3LEVswisxTAIzkIdVYvQNtkPhH6pBRlbbI3RiaJ1N/iLU5UTF5Ryi7bd9sg5o4e4c5CGAjGI
 GnX8os6dWBlsfaZCgR9EMJr6szIRjyPlqvSN8iSeNpYdBhT7kfxhrTnRfiSIHzjVhe1Re94rzi+74H
 hOqm7JplhUOTBlT+0h5EUaUKPo9ywReTbZseoJbZbl/px/he34vURUqtFWHXi7yHVACZ+qk97hIp2n
 Z8+fa1H1gG3oAE5ebW2P19Tx0EbZDmTgT9HARMP2ryNONbEuEEq2WSSWNyZgloju8gzBB/+5TXJrf3
 XWTSI3xP1UjIxWKeBIm41DJ0iiuZl+rHFp95rfv5lEOUkR6xl8f5WbBFR6NU7aJKptewbC5ZD0bndK
 /qbPrEkrVh9LJgadhJxLHK0Fugi2baKtbZXSOL89x7kLcHpcv8G7u22wbJGQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Due to a policy change in clock ID bindings handling, expose
all the "private" clock IDs to the public clock dt-bindings
to move out of the previous maintenance scheme.

This refers to a discussion at [1] & [2] with Krzysztof about
the issue with the current maintenance.

It was decided to move every g12a-aoclkc ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a-aoclk.h          | 17 -----------------
 include/dt-bindings/clock/g12a-aoclkc.h |  7 +++++++
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
index 077bd25b94a1..9d6eeb24ae0c 100644
--- a/drivers/clk/meson/g12a-aoclk.h
+++ b/drivers/clk/meson/g12a-aoclk.h
@@ -7,23 +7,6 @@
 #ifndef __G12A_AOCLKC_H
 #define __G12A_AOCLKC_H
 
-/*
- * CLKID index values
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/g12a-aoclkc.h. Only the clocks ids we don't want
- * to expose, such as the internal muxes and dividers of composite clocks,
- * will remain defined here.
- */
-#define CLKID_AO_SAR_ADC_DIV	17
-#define CLKID_AO_32K_PRE	20
-#define CLKID_AO_32K_DIV	21
-#define CLKID_AO_32K_SEL	22
-#define CLKID_AO_CEC_PRE	24
-#define CLKID_AO_CEC_DIV	25
-#define CLKID_AO_CEC_SEL	26
-
 #include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/reset/g12a-aoclkc.h>
 
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
index e916e49ff288..8fe7712fb12d 100644
--- a/include/dt-bindings/clock/g12a-aoclkc.h
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -26,10 +26,17 @@
 #define CLKID_AO_M4_FCLK	13
 #define CLKID_AO_M4_HCLK	14
 #define CLKID_AO_CLK81		15
+#define CLKID_AO_SAR_ADC_DIV	17
 #define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_CLK	18
 #define CLKID_AO_CTS_OSCIN	19
+#define CLKID_AO_32K_PRE	20
+#define CLKID_AO_32K_DIV	21
+#define CLKID_AO_32K_SEL	22
 #define CLKID_AO_32K		23
+#define CLKID_AO_CEC_PRE	24
+#define CLKID_AO_CEC_DIV	25
+#define CLKID_AO_CEC_SEL	26
 #define CLKID_AO_CEC		27
 #define CLKID_AO_CTS_RTC_OSCIN	28
 

-- 
2.34.1

