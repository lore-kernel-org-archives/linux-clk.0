Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11A4C7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 10:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbjFLKTa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjFLKSY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 06:18:24 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB211BEB
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:59:12 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f735259fa0so41761665e9.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563873; x=1689155873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZL7F676qnGuDggNTxNbDvWwuuEoE9PWaV3K3eMeu4cY=;
        b=ZJhQLvTlBIAKPJI07OjUieRfKmCPgu3j55886ScyUilRznd0SKbmB9apDzwj3Tqj5x
         T2mNQh5iowlGKVkiZ46Gd/gpv2Wy6NLFSgVR5fHOR2OuGf+FGpOSwjaTeQA6cqOkxqxi
         3V5qKAnPRZbMKSHHM+vb8Kxx8AtKnoqyKmQXRg0feNx3KfiMPFFMNV+0SfCdOT8jkNRZ
         hxzcfi2tjr8eNPpACRfFNfA+kkK8JCUMn/qdcbcCga6vs6ozs+iUw/6GOLo9cezpdzZH
         ou4dcgqHkqSRY4t3WmZm2auawHu6R8i0b6yoUAHQ3P66jX6iLlBbnzngM/sO0aDlCDwx
         s0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563873; x=1689155873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZL7F676qnGuDggNTxNbDvWwuuEoE9PWaV3K3eMeu4cY=;
        b=I1LPX3pMCEO+ztg6lz4ZOvfRqf+6r+fSWKeiBu1GKgbLNHCCaZqJrPEEQyxE4FuSRW
         zAzI/NW+98pef+ISc9zXZMdsj+8v94ESMPXF/9/89XObjn3YEABZ167iG6ufVP47UXzS
         ibvqYeXa/MoCa0CwLJ4tSaQIDqQAICKcXFmktDyHId5aqCsrvEzkgLMHekO3q0zQ0/fi
         QOVCvYrR9vgglPQS7LaWpjH1Rymcxufs+NsFCKAF9Mg506baaqQht8a3K2QNd8BfhAtM
         KShytFCOtn5BVPaw+z13qERxBfm9A+kac6iVMu+o0gltE5XLNnY4B4I3w7R/2oGJYL86
         QRYw==
X-Gm-Message-State: AC+VfDytk03A7U5OM5J4lIQP46EPhstISsvcoLw3WTXRPfdARkEgA0og
        dE+yiptB/8hJmr3LsO1O6eNW+w==
X-Google-Smtp-Source: ACHHUZ7BccJFx+y0enM2+1OFciMk5fgTOpRVaVbW0GIHvdntA/ixkQVmIzJGCm0Fz09GTpZ2HrWoiA==
X-Received: by 2002:a05:600c:2310:b0:3f7:4961:52aa with SMTP id 16-20020a05600c231000b003f7496152aamr6850138wmo.15.1686563873362;
        Mon, 12 Jun 2023 02:57:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 12 Jun 2023 11:57:36 +0200
Subject: [PATCH v2 19/19] clk: meson: axg-audio: move bindings include to
 main driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-19-38172d17c27a@linaro.org>
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
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tdQh/9l9bbOO/xduw4X55YNw4CGdSuUcP4MCwJ672SM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwMajJn0JjAA6/q5/GCSSK8FW4zQ5lCG+SLMeYI
 Y9WBiP+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsDAAKCRB33NvayMhJ0W5aD/
 kB1Y6fa+guMuUVS04lb4q/w0zkGu6tny+ys/DakB1hd8KJvHhB9usTDp1i/zA0MFmddC8Ob0H+pazF
 NrBuq9fvnuctYR3Fbx7dq0ou+i1TUGxkq9/OZz9GSawxSWipZ2gnc0Ld2EZN/FByH8xgRqodTtqaXf
 Xxls79k/mr3sixj+ETzANRfhTOCb+42jJ6yFvhh8FQ4e4/aM1TZILftVB5B9XfwTFDFTxM/Mg84gO1
 OAC7DsrVGUzXd5OHjlAqm2xjeE0/IPMeRDbEe7TYd5rgUgDF+LJeKLPsssWjkNjFYG94A5UFz9enGq
 988wLDobKgDxDnom/raCWlFACKPYZfmttUKqgTv9u93ZF1ZJ3IYUxy4VNINPiC5DoCbVRgHSogG2JU
 Qq2V7yadzzrscVwIbY/pa6HEWmIFqN7aIYYn9Aab58jRx8a5g0pg36RALx81l6tHizpY1LE3rFIF4Y
 UElNq1G9Ywd9vh5GW04HOUI70sNCViR45IvrqNa4Cmk/v1U9dBqdNxsNsr6qVL9//MtD4bK6g0P0bZ
 yxqmHK1awPTy51C99Ft8VDS5WXPDHKM1v4dCmppgUo2tfDDHCjhfoFSKp2NNtYl5AAmeLeegYeLwAs
 Q0skahEYpqSvPYcn7QDPs/QN6teL0TcS/qIQ4B+pFLs60SMFt9idTFCoOiBQ==
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
index 6917e35232b6..6aca231b1d81 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -21,6 +21,8 @@
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

