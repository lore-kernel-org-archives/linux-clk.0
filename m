Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB146C7EE2E
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 10:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237989AbjFGK5r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 06:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239522AbjFGK50 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 06:57:26 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E6919A4
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 03:56:51 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f736e0c9b1so40594925e9.3
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135392; x=1688727392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41DgEDA7RawwFVKe9DAaWHKPEIRy9vX8sgeP4hKFr3E=;
        b=tnRp8VCCn+7iu3kHb67gSI+wEsIiW0WgxvgOiGJwSWpxbh7q5BtHSkYMFFyhq63DtN
         KjjYP8wWEVa6jHgJbCY16ho+MmxNg5atxWzw32gOtLDVoXGxjzjKxgIyIIq8tSfnZGZS
         +ssFoGFrHHskfs4hYzPDFxudqTC5uoH/1mDFYbZqu2fOb/Qg01G7NZraMIH+iOy6PIM4
         +Mypp1pkGsSAmWSqfb51CaXd3c+6V3W+8LIhI/o6a/IlsG4DP0R50DxJURinOqMuEFW/
         aAUtZ98ILBO0MOcmTWTlmBJ4/BB3UmmuIFXnt6STnAfYWYKP3wIeuKwboqkXGz91wqJr
         PL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135392; x=1688727392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41DgEDA7RawwFVKe9DAaWHKPEIRy9vX8sgeP4hKFr3E=;
        b=d2ELBdaBSlwY36FsZNvW7LZlvnfRJkqbVyPmJu6rRj/HpHCU4qL2F6N6rpV32Wefa2
         RsQeKvIBu7xDDbo8I3g5dqIotI8jsuOdp7GF/Hh9vFbCmi0n7buo9Gkv9516U+hoH82K
         wUYQQcaId8T6JiGD05hB2hsKQmuuwzlo5j84GSy91qUJb3LjOrlVy2C8NDVT6imuDENa
         Kurm0SVFdYcbzHji9ToV3sBBakGUTuzuzOP5G4t5+Bevqvv2I/ro0OWMxaTX/dRyYyWq
         5alkzLGO5sh58LsegXyVCpNCmib804+7aKIOTONSqxdhZgosl1P27xlU8sK/d46GGfyx
         OkNg==
X-Gm-Message-State: AC+VfDzCaJvYfqMM72bn3jA1BRGhyoEqo8h+Ei84ra1GlB3ZSLMa28Cd
        TzrvoyyC4biNWkowKUofh+1drQ==
X-Google-Smtp-Source: ACHHUZ7s2BtfPEbOY+k0qWIYFagv3pauqJNnaEtrfH45+8D3kzSDxukEWAs43P/Dxh3PPQeFMZ80zQ==
X-Received: by 2002:a1c:770d:0:b0:3f4:2770:f7e9 with SMTP id t13-20020a1c770d000000b003f42770f7e9mr4229015wmi.17.1686135392129;
        Wed, 07 Jun 2023 03:56:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:31 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 07 Jun 2023 12:56:20 +0200
Subject: [PATCH 09/18] dt-bindings: clk: g12a-aoclkc: expose all clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-9-9676afa6b22c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2594;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wGNjFvwT/m2SY9qfICrCHA3euNVfwb5B04GQshKGRz8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJRsO4L4fTFv9ZIkQHFxwTk4FQsNg0tNWHPQJjy
 cX6jRLKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiUQAKCRB33NvayMhJ0TE8D/
 45dml+KkzDWCjCo6wK7EcpD1KadwYtEnWLfdehDeOf3TR18XV7zacE2RuWrwWlKmhrJ3gsc/dBcKdR
 3tHatCjwmWmUQ+nE/iPQFjTfEPtm2BSqKz0ddMk9aNFXOu3AVUrOASJ7fwGankd8WV9RWV8Jfe5zvp
 uFfm3KG9IZozpdu7nwqTEx3UGWgAJhDXtHalqvjPVrJb/ZBUtZW/6q/GG1gUaBX5CcMwjuKxqJrClD
 NtnHsfWiEHcvqcbSzG4D6yY0bevZz/VCYXhfqeoxu/c4n1U+oc/M5CU39RI80P7Dhc9/suw3ElAwoZ
 hXpBYrnSzKmaboBv42ginDYNNgpaHSAVqfamBb/bYg10lydBjgilAIibBTN3SQTXs2Ha9E/w6yd6B0
 BcI7CRkSVJpxVxEUifhrYNovFRVw10UBmghzwNi8hRWeg66/lheJRGrto80PqVBsOoRpGnSvIV7ihZ
 zOpZ8Jw5NOM5BhHOo7/NvbcnTbukCgJl0QBqVJNbrjFmHfi/QzMenUwqo5hecuzN3VNkdd/JvQVBng
 kBMbtlXY7Zy6i5OcIz2kDwp7moS6ZeI/pMoYdVG0Tgb0uitI4L9ADfhQrg5CZcnQOy+tQgw7oH97tN
 owR+k2l52tdxopokCz15pF0kb7K0iZLiyJCuSTdWlM/WRfLq8KD7PhWud+VQ==
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

