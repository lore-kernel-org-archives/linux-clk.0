Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11401C4167B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:23:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiLQAXc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiLQAXC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:02 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA0A066C3C
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:33 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m29so5658989lfo.11
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw0n1LkFyR04NfrsZcxul+5/yjJGz7Sdv3Db/gbp0H8=;
        b=U50zxo8n/BD6fQ/v/hWIab/sQDbcMY1DAGIDGZmwtczhL7OKc7YbnT7F67SxtTszZk
         jEU0AxaYsZRcwJGFb/9pFqjE0LXA8LpkP0hDRoVHPgyJ0/VQ8YJIsVEl4htCQbkX5raG
         fCJnn+SWeTEJ51X2LhfvMcJBc2fb0HSDbq4Ouj5VfXSSVEB8so1CIUV110wJl7hbnNDl
         eoTCfwgP8EbJrM3cFeEsLCA6eFmaPo0/eR0mRnqdpj9r6svJuyxuXpBUy3N8FMFeENWf
         VOfU8PS2g+THHj+sgoZnuDKvGw71v0l9x89assRHTPGK8guczNvDsKyKUxDaiLYdMPMB
         e5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw0n1LkFyR04NfrsZcxul+5/yjJGz7Sdv3Db/gbp0H8=;
        b=K8hzTA3I8hb1yKP7XO7YfryXhGPGXDli0Y8f/4DfZ1LAk+QgfQkmssdwXrXUmARg10
         Q7AaaZxTo79yJNQOJlaIV+jBE2fULqFYTR++/1v2j3dx31W3sajO8ZXwk4r30YxXQWkp
         jiD7+/l5Te8Eo9CvzoTDriDC+9qMvd1rsi7QSrGWjv+bWUd79ooCmOs7Bs/p3EUJofyC
         fdV3UoLB+XJ8OLkW/0MSXuUeX01cfrEywnkp2EcPl1vgt7JzIU8X76GL/e3I3BaEqSez
         eVl6oUca0ZaUrhTIxeFpxy0EkhoRbBOjNXoIsOtcdFqfdliOS13ejZPYYTXUgqQ98p4q
         WN4w==
X-Gm-Message-State: ANoB5plfj7MOM+zxQ78HMK4IrRim9CXiA6z3m1+2hI+hLU42i0NB8NGj
        Izl00EGI0YrNWeqSR/4045Th2w==
X-Google-Smtp-Source: AA0mqf49NRUCkB+rHihLGWKrvFeZlWFy4qTa00HW+o604lrVwXriqc9YxMeQtPG9YgYunx4dm8VvQw==
X-Received: by 2002:a05:6512:3992:b0:4a4:68b7:dec3 with SMTP id j18-20020a056512399200b004a468b7dec3mr12330945lfu.31.1671236252091;
        Fri, 16 Dec 2022 16:17:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 01/15] dt-bindings: clock: qcom: gcc-qcs404: add two GDSC entries
Date:   Sat, 17 Dec 2022 02:17:16 +0200
Message-Id: <20221217001730.540502-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On QCS404 platform the Global Clock Controller supports two GDSCs: MDSS
(display) and OXILI (GPU). Add corresponding indices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-qcs404.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
index bc3051543347..126a51898571 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -177,4 +177,8 @@
 #define GCC_PCIE_0_PIPE_ARES				21
 #define GCC_WDSP_RESTART				22
 
+/* Indexes for GDSCs */
+#define MDSS_GDSC				0
+#define OXILI_GDSC				1
+
 #endif
-- 
2.35.1

