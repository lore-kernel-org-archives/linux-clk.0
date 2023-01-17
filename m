Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EF2C00A5A
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 22:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjAQWoQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 17:44:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjAQWmy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 17:42:54 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D0D5D922
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:17 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so78948319ejc.4
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7bEFoFbOUtsSE/6ZuuEBc3RCFNCiMzDE8TXDtdWn6U=;
        b=XeDsQQcWwPmi0pb4U7JUVvQaF/SuEoPvG+yj2lxCH1zA0apDK3k+1hy1JMp0WiPJv7
         8wdBBOeXm1/c45mVf44ES/yXhNsxb5orX1s6ogfKNX4VRz5oN5Iq2moKEE+xb8pmz4g7
         UNCNoyt1Fk8PL5zUcPCB7m93ks1jvFZnSN3eOerKDV+JqfmFMu4hIgkg1P/X8J6Es59g
         0GGlG+GVWtYHs+8QxZoDCOs9anqqDPhsp6Ulk9HHjwvGROob8o85qVMahiugpkCqruat
         UA7bVSpjGuSaTj1wlkT1SAhR56IZDlX3ORCWuGNcv8O0p+ybUwjNO41QWLJamZ7O/3lt
         ihqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7bEFoFbOUtsSE/6ZuuEBc3RCFNCiMzDE8TXDtdWn6U=;
        b=yi7T14JQQbfF/D9thk27rg5gVQlNINhMGCd8VrtMBQoKlNc89pQMIb5C5Lh9ikM/lO
         q24ASBbfDKmovbfEa4dFwC1EfyMM2Vm3YG/2RWq7k5Xyw9d48SuswumKNTpHgVkqFigH
         sbDRJnYtYTjWwdkNxXiVnH8poJLniXg1+48FtZap5d/OCH08pMde5fxRxn5DYuKkBRGl
         /j1NHTeAQRk/hjSGQyEm4f9Ildw4rVJ7S+xtXBp6M9qUxoNAzqxGagyjRpZNionfQ8oJ
         wyYoakMfbRRfJbB+F7C5hmr+K6KL04DSzGwRjwCd7r+UL226R4VKJvasXMZmnhBeULNf
         x7jQ==
X-Gm-Message-State: AFqh2koR72p/Gpy3cFQScR+vwUA0n11ARw8KCFapEOcw1mLtea8YZHwP
        VFjd4VghQtyz2D2KkB7zQuu66g==
X-Google-Smtp-Source: AMrXdXuGW7kOm7Q0K5Drssz2TXNa/0t0VkmEB96wiRTVFo/F7/KkA3siLMXKBe2AIG3hwIkRxvGrVA==
X-Received: by 2002:a17:906:eb8e:b0:871:6b9d:dbc with SMTP id mh14-20020a170906eb8e00b008716b9d0dbcmr4640462ejb.21.1673994615878;
        Tue, 17 Jan 2023 14:30:15 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ec20-20020a170906b6d400b007c0f5d6f754sm13835189ejb.79.2023.01.17.14.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:30:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: mailbox: qcom: add SDX55 compatible
Date:   Wed, 18 Jan 2023 00:30:08 +0200
Message-Id: <20230117223013.1545026-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The commit 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55
APCS") added SDX55 compatible string to one of clock-selection
conditions, but failed to add one to the main schema's compatible list.
Fix this omission.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..36deddca1524 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8953-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
+              - qcom,sdx55-apcs-gcc
           - const: syscon
   reg:
     maxItems: 1
-- 
2.39.0

