Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A4EC38147
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 13:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjARNwS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 08:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjARNvw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 08:51:52 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860D84CE49
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:23:03 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id ss4so75901580ejb.11
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXnOHOh5QfaalI7LSXB28OMKjzgZCCU/t1AphNsWkmU=;
        b=jVy6cI5Y2Gqwq63utnSYVTfRMoB0i/4a2T4WK0rqHMmk934kXDo48bhRIqqA/5bPRr
         yxj9gy7Jpcve/AK8UyQg3DFbuZ0bXYlPKRmJEJ3PWvWMhO57n0apT8/Uw9aoqAfknfwx
         bBu/aoXAoOGRuopTsGs1YTra1QL/IzM4rxxZVlipHWecWEKcONzU0Wm5jtmj8udQp2jJ
         3hsZ70+asjKJgUg21YPG+4p0oyic6n/shJE9gq2I2TggTiLFzqistku8lY9iex6qSgUg
         MklMdD8oaTb8e1z3crNhepAFgVevzoI91Ladek55ZL6pzckZ16yk00wx1wQSBbEEzjXF
         qvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXnOHOh5QfaalI7LSXB28OMKjzgZCCU/t1AphNsWkmU=;
        b=yJnOUi0a67NAfax+2zwCzE283Y1g4NJBewvfj6ztoJvBnLpYEdvun1RVYuLP+JPaYL
         wyGNId2onA+828k8m6sWvaebdeWtMccEyv8gmJlQAJu/HdW1m9LsePbayZLyyi4BOuia
         D96tPLEge1BotX86UW0Cvhk7OaRZ9m0+qV8p1jqhS1nvkY0Ew6Scp83o8J39B/W9ewyj
         lyEERZFaXi3n6d8waw7WA3sGEmcOSWLUeujY3dO3pn+MqfhcFU8LtZleMZLs9Av9E+AV
         Z5bpx0CrX9doffmt2qYXxAHNM78L2rmAJgfDPqtnm9PbIHBy6FZdmMOvnif6vcSEyiCA
         fvcg==
X-Gm-Message-State: AFqh2koQgDHkpsafpVaL0ecPLAJX6cLgPtjm6b1iagcD44MhMnNxAbbN
        y6KqfS2BpsUCjzfCuxEPg/Ax6A==
X-Google-Smtp-Source: AMrXdXvEvf8lIORvXJrxWslPTiqR0cMA289EZOn/n3Fnaz44xSeTERqwc5iSyyK2avTmGujkJwsc1A==
X-Received: by 2002:a17:906:a393:b0:7c1:1fcf:266c with SMTP id k19-20020a170906a39300b007c11fcf266cmr7015490ejz.14.1674048182042;
        Wed, 18 Jan 2023 05:23:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0083f91a32131sm14633831ejh.0.2023.01.18.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:23:01 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 5/7] dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
Date:   Wed, 18 Jan 2023 15:22:52 +0200
Message-Id: <20230118132254.2356209-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
References: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the #clock-cells property to the MSM8996 example, as the APCS block
is going to provide the `sys_apcs_aux' clock to the consumers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 7d8de7a16984..1633aa82fc84 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -166,6 +166,7 @@ examples:
         reg = <0x9820000 0x1000>;
 
         #mbox-cells = <1>;
+        #clock-cells = <0>;
     };
 
     rpm-glink {
-- 
2.39.0

