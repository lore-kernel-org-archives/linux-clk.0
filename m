Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160DEC04A94
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 19:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbjGaTVs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 15:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjGaTVq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 15:21:46 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD178198
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 12:21:39 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso72574911fa.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690831298; x=1691436098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgiy1L5xFFXzTL6vBU06WTwPPyk+2wiDw9CMMBxoAqU=;
        b=BDN5aHHLy5f+8ZqWeFKahTozUsHMkbDIzeox+LKbsAUEdlRMAhTtlSid6HPBqTS3ah
         YWA1H1rvCd9Yxtropqa6pGlppKi3xPL1VbOgHBS4HhCL8g8G4ZwZC7l7O24bMXw2RgMM
         mwa+2Zm2xp3lsmT7U83U7TcLw+nDkXUxHWu68f1+nQ1TgGTLzC4DFAt2IxCyuuv3mk1N
         TTqIjU7Yu7NmCB3cLIxGp4HhC57kbNgdhaoc2LFbABvxNK0CQAPFhj27EJm9RRoDUGLl
         0HkHLuwRBrHwYkWhT/E7yA1sgyOPTPWY/WpGow9lVtYitKsoyC95OC9E5NMcumP/4JfY
         Y+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690831298; x=1691436098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgiy1L5xFFXzTL6vBU06WTwPPyk+2wiDw9CMMBxoAqU=;
        b=l51tIQl+V3x47BK1SONoipcgSMpvGtVK0s3ZzZpLwcFxwN/VsrqXeDxv+vusnXmVsl
         z09ZkXp05F1jovRD/db7QaHFOotBKfglejJTJBWDXqyvSszggGhlST7tBOkJNKu+CR2P
         b+/e3NmPZ/RdX3H2nSnzTrHaOqySTCFre0i2hMVBVjPrbmCdGlwrtfzaLAHnXHYOsQQW
         kviLWaqA8dEwhShk/7pe/lUwX3SchA7/jaT4cNhjFdtCheEoroUtopuK2HWtl62L72HG
         IIz5U2De0t58BV6rer5PIwbAu6izzUBigOmMzXOk0LL0B+eMHjfjbDKfHb/if15oh4i1
         jhPg==
X-Gm-Message-State: ABy/qLbg90eIUQYw2hy7jAl6gMxkVrQYRmQ5RVj0qv7/vMp/1ZrjewFW
        8bpFR0UhzZQXVt1kB1iVSuimXg==
X-Google-Smtp-Source: APBJJlFpN3Bb8twZNdS+ZKYDc6oIsWZ5yeH4TbKtJjzw2AzrHWElVbmYnMr0mMKxrFe8Bm/BJVXAbQ==
X-Received: by 2002:a05:6512:5cd:b0:4fb:9a1e:125c with SMTP id o13-20020a05651205cd00b004fb9a1e125cmr439606lfo.45.1690831297882;
        Mon, 31 Jul 2023 12:21:37 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id ep28-20020a056512485c00b004fe1bac4080sm2024882lfb.222.2023.07.31.12.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 12:21:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 31 Jul 2023 21:21:32 +0200
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,sm8350-videocc: Add
 SC8280XP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8280_videocc-v2-1-c88269806269@linaro.org>
References: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
In-Reply-To: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690831295; l=908;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=09vaheOwPFgSKvoFFPC1+TxzhpnRaLHei7up05bRFww=;
 b=eWW9amWrxG5uiuQwj6XKg0uo9aY6AR9mGVP8x/iG039uc295/S37S4cgVj1KL+C4d8j5Brp+s
 lnKXQA4nY58CcHkmht1o3PFfQN9ew+5aVVk6FoC6zVfQz7iqv4hjrdI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SC8280XP reuses the SM8350 video clock controller block, changing just a
couple tunables. Docuemnt it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
index 23505c8c3dbd..2114664978e1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,sm8350-videocc
+    enum:
+      - qcom,sc8280xp-videocc
+      - qcom,sm8350-videocc
 
   clocks:
     items:

-- 
2.41.0

