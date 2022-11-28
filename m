Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FA8C46467
	for <linux-clk@archiver.kernel.org>; Mon, 28 Nov 2022 12:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbiK1M2t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Nov 2022 07:28:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiK1M2q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Nov 2022 07:28:46 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0467610FCE
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 04:28:43 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id q7so15645728wrr.8
        for <linux-clk@vger.kernel.org>; Mon, 28 Nov 2022 04:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=dO8rrEKSNakUsplBe22EF1VJo6lb692wT33n1MaScsBpAzQC6Xv74CEXK60Whbny6T
         2nxf6JRW0NB7Q9y8MNaw+vCTVNnzsUKAlQIm9WUe6o0MjEwJd1P1f8b0eczpLazouvqV
         0rPKBtAjzlsgMqD5gGX+92o2vYRjywTRRT7KJ5yWQmmermvkj1BsLduTfEzf+htd7d0m
         OOjW9pi2ULjTTsQWHzmFakw5EcBoCRXjjY6KQtS25NKp8FCEBj3md/7MzZML8x7m+v8X
         SDUtQ1FUdwaOFFCWm1+xU9gcmOcooePolXBQAzpfKrEYoe7HwUAUt13HEFmqtL/oSQBS
         1LRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=12ucHdyhstaXyYJlCoahlLBdkW2ruRZrhYV7S9vSCf9ZdNVFcR7XbS/JRi/69sknow
         6hIR8udnU3mYXoDVigvchX5F23mSyotjjk92Lhxe9qTw2gOI8IZ9oqK7CYz5wmySIdfQ
         esf2fl0j7jgRc4fd//4/kmqalb+Vr+ZYOkJAfzJfWIyi1oO3O7XXEmHUq+FQhYi6h6x0
         ecV+N9sTTv7/QuXwe6m/DOIRWgnF7jq8VZGiAMESVCMO1RGq+LxSxoF3zW/NOmoGIkvN
         RvWUli0mQRws4LY9yLwHmhD0wsNBd2tOC3ovTj4VQfidSXQelDlIun4bFXTka1EUC5Q6
         00Qg==
X-Gm-Message-State: ANoB5pnP//boKxZKRByATlt3EyT7MeVeLVOe2hfkhtBHY2Hwwf1vbo4j
        gHWPh6ZIQFQv1soMPEc4QsrR4A==
X-Google-Smtp-Source: AA0mqf4ZfBOz6QlwRKKo/ryJmk+nrlJnAjm4/pc9CNq/fUoxUVorirPqq0MaQoWfntBg2AwNb02s6Q==
X-Received: by 2002:a5d:6503:0:b0:22e:35e8:382d with SMTP id x3-20020a5d6503000000b0022e35e8382dmr31203936wru.475.1669638522445;
        Mon, 28 Nov 2022 04:28:42 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b002421db5f279sm598405wrm.78.2022.11.28.04.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 04:28:42 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 7/9] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Mon, 28 Nov 2022 14:28:18 +0200
Message-Id: <20221128122820.798610-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128122820.798610-1-abel.vesa@linaro.org>
References: <20221128122820.798610-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SM8550 has a new fixed divider as child clock of CXO
called CXO_PAD, so add IDs for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/qcom,rpmh.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..f3e0288420ce 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_CXO_PAD_CLK			27
+#define RPMH_CXO_PAD_CLK_A			28
 
 #endif
-- 
2.34.1

