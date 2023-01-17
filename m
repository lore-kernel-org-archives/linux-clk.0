Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE505C00A5A
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 22:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjAQWps (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 17:45:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjAQWnY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 17:43:24 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7085B5CFFA
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:20 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id mg12so6574037ejc.5
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/649yjEuK23rZZzK3k1WHwJIEsvrTOVei/MBU/upUo=;
        b=LTbrlGLrZvUgcQ1jtBvu5QHiVbmOZuHuey3EpptHHUoKDfLK46vSH8ZT3dYo89GLVw
         RK5CZn3qVZYlm9IFkiGwg6IvxbPuiFrhFDQmpW5H6plhalBm+rkZTscjEkeb3/746dCz
         Qy4sV5ov893ugyLT792EqKLCLvctSXYmzQ4tqranpLjTf1YYxbx/hD+E3tZATah5+3So
         YpDLC0NIH/hUKdHTfdRp5dHJD6cw/nMhkgvWs+ZWadQqMcWjx8yWGmVfxNLbkQk+16Ky
         0v8DH2q7fU5pHkSvhW6wIkc/MokT85QXy8Q6/gw5D7ghWyXzfQqBcHzfw4mQehhn4mBi
         slsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/649yjEuK23rZZzK3k1WHwJIEsvrTOVei/MBU/upUo=;
        b=dnE39wFCiuEWUCvKjsj/EDJiuYGIyvNYlCRdJdjgbXOCnvFWyDJjhWX3wKFulDEdQX
         Boe0QqJiZTU5WyX9izlrVJwWuQTlaGY8RmUUL/XAcMoS9UAnxoBkDTaQghg9RI0fJeYV
         yI5djPCOrlo4OhJECzocuSszcaNSnio6PDxfJNlFoEVqZKLRjj+q4b6DoUpPhhyzMz26
         0qIkiqH0CVIbIldp8e4BVfdUmy4eDS2nEXHZxZCoLzLBkSVmlfWFFsbgk+Xv59RATLVx
         HgXkuseqdDuNKVOMe5MwBkbntSBHrG2czz4xtkurMytK7iLuvOP9zeF67nGcC4iqRG8q
         ottQ==
X-Gm-Message-State: AFqh2kq0uUavd8a0O134h0HKxUnDfN0bMiisKWzx/tYAwW+fo1OqCqlj
        8eP7T9hOADbKr+dAGTgayCgwVw==
X-Google-Smtp-Source: AMrXdXtP74UzqEdjchqIUiS/J3XmwshoVvYZSgQukiS//9qMvVXCXdFUIWuEj453Xzb1A5rTPJWndw==
X-Received: by 2002:a17:907:cc2a:b0:86e:d375:1f0c with SMTP id uo42-20020a170907cc2a00b0086ed3751f0cmr4406823ejc.37.1673994619093;
        Tue, 17 Jan 2023 14:30:19 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ec20-20020a170906b6d400b007c0f5d6f754sm13835189ejb.79.2023.01.17.14.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:30:18 -0800 (PST)
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
Subject: [PATCH v3 4/6] dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
Date:   Wed, 18 Jan 2023 00:30:11 +0200
Message-Id: <20230117223013.1545026-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the #clock-cells property to the MSM8996 example, as the APCS block
is going to provide the `sys_apcs_aux' clock to the consumers.

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

