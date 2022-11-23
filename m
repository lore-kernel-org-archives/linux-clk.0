Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA431C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 14:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236848AbiKWOVP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 09:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238027AbiKWOUr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 09:20:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 118EA663F5
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:20:31 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d1so17499243wrs.12
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 06:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFzDxpWqkqEB+uPsP/l7eY+9vWzpuHYgwjXpD5issVQ=;
        b=IdmaEqOgEOEdyX2gzNhqKjbbli39aLpBgR8GPR8rmBye/EbpFqYuzK1+iBKlsvxEfV
         WkpFJmM9GcGmujTrWh+v23RsKxtegmDEXppogzwEVRnVZYdFrIvvXoYjt5rN3Elj9npJ
         ssYggvPRubGz5LsWHYefblcgkurzfMlSvjUIyx+FJe3kvzcnNM0avvJCjMuq0RM1GngA
         6rJIwy+GkJVvoqwiI/UCh5ktJM/EiF7ubFckiNPpjxpqHHuGZYha7EJmuoceYGhR5Ho6
         AYzZ/r1RabtRSqJsMKbZ4gPFAh9gs7d57sIoB09yQk3ueNWxeXgGqDJrsvF2VLIU43d+
         UvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFzDxpWqkqEB+uPsP/l7eY+9vWzpuHYgwjXpD5issVQ=;
        b=5FkKQR7MavGH1KsIe8MJGyxcO8P2DWHcKzdXRURJFme8rFYYmomTMaNUbYvq19jjVl
         MIJXrp8436oY2OzdvOY3o+rIbjQzLaZr00U4Tkl53DQT3AFptPPhkoJQTFQOFmkeLp1e
         I+LObfi2G9/vII01O9bTuT9mlYm8ofln7oRRBTeigWVABHRD3yHBHDiofyU0+AgLDlD9
         7jPQsVXe5ZSUUW1T1AYjPJ8pMoMnpjxFbM+tnv2lYgeEmSrdl2D64vrcTq3AtUXGxQdh
         qrILbrIGvrT50P5Kizu+yGOXLpG2cQI3Y6/fCRlBIlc2oUjB9pJj6+/bKqwEZx+Q0LBu
         hxNA==
X-Gm-Message-State: ANoB5pmxvA5MkIifVIVXmP/zGhEZ5Boob95WZ/W2pW9o3XstZMy1/Fol
        ZR7zRfms2VpRyd6V8pW6LrvR/Q==
X-Google-Smtp-Source: AA0mqf69lf0T1tIlF6HtvnZqc//gOQ2wXsW4naI43F0mcq9jAbOloNyQ6rnBYoH2MELBfXsoTKINNQ==
X-Received: by 2002:a5d:4202:0:b0:238:c1d5:3293 with SMTP id n2-20020a5d4202000000b00238c1d53293mr5246664wrq.446.1669213229576;
        Wed, 23 Nov 2022 06:20:29 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b003cfd58409desm2837438wmq.13.2022.11.23.06.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:29 -0800 (PST)
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
Subject: [PATCH v2 7/9] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Wed, 23 Nov 2022 16:20:07 +0200
Message-Id: <20221123142009.594781-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123142009.594781-1-abel.vesa@linaro.org>
References: <20221123142009.594781-1-abel.vesa@linaro.org>
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

Changes since v1:
 * added Krzysztof's R-b tag

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

