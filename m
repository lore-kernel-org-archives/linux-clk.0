Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C015C77B7A
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 10:58:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240106AbjFGK6w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 06:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240140AbjFGK5n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 06:57:43 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2321FDC
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 03:57:18 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so58715065e9.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135400; x=1688727400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nhh2pD6FUwpfqM+PflikOwAsazbxvES8HqlJahcr2Ms=;
        b=KFQBr+uH8chocYBPMM7TXYaBgimmZKiLErP8bz4ZHdTtzE9Ru6QWpQATqFwtvuuIHx
         wuc/N4EKx4N8n/hUx8OX1gb0RSFDQXtMNZZv6dmrEs8ux3fguJQQaCiD6yjSzaTTfpQM
         0hMCopgN0crLDUV0OaMQUCdXFouGk2gidnGc4K9tpvd4kkY6rf6UMRcf7t8eBOvpR4Zw
         lCMX07Eq1O0KNj13awuraoSHhWLg9YkFF2oIWpyP27BnFAwRjeX8bMl/y//nI7NoZRb1
         EXBDA3AWjQCcesL+I7/gP2T8ceFUpoYblNMnPrOdfq6yWuH1Tw4fXVz3ip+qCc2ws3wB
         8h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135400; x=1688727400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nhh2pD6FUwpfqM+PflikOwAsazbxvES8HqlJahcr2Ms=;
        b=Y/NVaZTsoSOZ2JW8mUqLOS5Td7IF13vVsGdmPFfmWBR4uaQHV3xijUrjtleUNyaVdJ
         2GIvqNwRrcg2QFTRzcaxCpFAqMlZX9VSx3Ep3Xpbt9kUar+8qGx+RM14zTPyuoXvpr2S
         TZPvWUR0gU2d0blnaqeTAcK7B0nvleKbnPWsReEs8ZVOQq+xhvdapCxBlVMedE8nBqXt
         yFSRxgE+6cMKDvJQZe5g5Sa967yk4oGmOuIr3zVlwtOHU1Kb4cWcjwxXS9Rrdqpc0MaE
         fgNBoQzeONzipRfXMb06BSFgb7aoGbScstUDXSB8HMn0Ayjvy12iJNjaRs0JPxjzklU5
         Yn+A==
X-Gm-Message-State: AC+VfDxUwop2IISPB50Mmf8l+QtJmBqGzlbLoW2wxkmT9yldSmekjFsC
        FN3+hJl/DIZUvkYKFt0bTQBXKw==
X-Google-Smtp-Source: ACHHUZ7eRWZds5eKntMyGFzNnviMEO1GIcs4uQ54WBlODcq6ebb2XHG2cqK7AVZN/geoSptZTB4aSg==
X-Received: by 2002:a05:600c:230f:b0:3f7:e497:aa03 with SMTP id 15-20020a05600c230f00b003f7e497aa03mr3797345wmo.28.1686135400045;
        Wed, 07 Jun 2023 03:56:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:39 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 07 Jun 2023 12:56:29 +0200
Subject: [PATCH 18/18] clk: meson: axg-audio: move bindings include to main
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-18-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BhdgvijRztviwBcQcsc7eiZfm245yvplEhk4v09X2IU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJV2unWoZQB8Is+DP30A/dALDDHhMCVzVvvcFv2
 PGQ/CBmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiVQAKCRB33NvayMhJ0RnXD/
 46MvIaTydY+HcVs2xiqs4Lci7YbjtjKxWp8v6nn0Z3ijGgUXQ8PGeTnbM4+Ey5gpcEQIaM62ERTXTR
 QNAIDhivwi4/hD0woT7niaX8MDvjwyIlJzbHYRzWOPbiTqo9Pv+uJb36obn10GwUay8mSXNwGA7mGQ
 +/L1VIDyDuJyZSOZvxasrx3lG56GBlqD1/q0U96w/uzM4EG9OmcFEnVQfuHxZu8gKu7+xq1o3UX2kQ
 AigSh9oAlIhmHs01Pn5Tpxb86w0uiedQ8s8ADhsh0EaZlN+dGhTz1AMYpxmG5ePNn/63LeAmkJbD32
 15NN24MxJDFTS+mV31gyQaL4+nXC6lvjCCGrRRee8np1Mbg9DUl0++zSUWQn8X7xVpsRB2AEV1C72S
 lHsR5xSUemfAsOgTUcuRLlqXSfJnZ8VcASp8uklS4WfEuKat20B1rxadN5OevgdIbBYg6cu+gWCf3O
 NKELjKEOR+V/ShXD4Vpb3RfcEVsofgT8pnjnn+MrQh+HdNVeCRr/499pqAhH7LYnartj+wskjFdhvm
 USmsp2ei3cpUC7jnKFTgcFOu14M7IfJ8fIASQOtVqrvkS6z/u8+8zlNJA7hCP7FSZs7IgKIdhxFhNg
 AbknKJDrj/4ZgNSn9sLenVJSU6sAe5TtEQCxbhMjbLpz+/PCKzO427aKu/aA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now the clock ids are no more defined in private headers,
cleanup and include the dt-bindings headers from the main
driver file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/axg-audio.c | 2 ++
 drivers/clk/meson/axg-audio.h | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index ef4e0552f77c..025cb4efce36 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -20,6 +20,8 @@
 #include "clk-phase.h"
 #include "sclk-div.h"
 
+#include <dt-bindings/clock/axg-audio-clkc.h>
+
 #define AUD_GATE(_name, _reg, _bit, _pname, _iflags) {			\
 	.data = &(struct clk_regmap_gate_data){				\
 		.offset = (_reg),					\
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index faf08748b205..01a3da19933e 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -65,7 +65,4 @@
 #define AUDIO_CLK81_CTRL	0x030
 #define AUDIO_CLK81_EN		0x034
 
-/* include the CLKIDs which are part of the DT bindings */
-#include <dt-bindings/clock/axg-audio-clkc.h>
-
 #endif /*__AXG_AUDIO_CLKC_H */

-- 
2.34.1

