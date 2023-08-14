Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC435C41513
	for <linux-clk@archiver.kernel.org>; Mon, 14 Aug 2023 10:42:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbjHNKlo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 06:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbjHNKlh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 06:41:37 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5207310DB
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:41:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bdcade7fbso541541966b.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 03:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1692009685; x=1692614485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Djj4l4V/6mjTCVIY5j1u2m14Bqurma+fObOXnVezLR0=;
        b=fBXI+rRnh1me98p2B6w9MJ+himWLu2zzOVjf19ltNVYFfR/dNpJxyBqCz8zTs1bJhx
         9ETPAkFP8toVGszYn8vNWF3zgyNJ8dTJ9EmV/PRn8ORbDyGt51YRA8tUs1AlGBYPc/uf
         c1fZgwFTy5MW7wNzz0TeWZ+AVGDOxn1ORnT6Y3bMVEA1O6o86YSQvaIUysQgP58JRag5
         N96eyCE5fUlCS1zHrsFwr4JEbOWtlKfr8WuPGfjnxcW3dS4jg+n7i3mahMjWVqicC5YO
         +I4PbOWPQMjmRjlFmekO9xOnSInNBXEPmWFHHhWf5DFsvyNZTp8R5HQaQrITnK2LjyuE
         L5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692009685; x=1692614485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djj4l4V/6mjTCVIY5j1u2m14Bqurma+fObOXnVezLR0=;
        b=QArBr/eJVX5D2ZwbL6556Rx5aP5y9j62GTqRRlo6qWy247R6X7R/d0wWI49iYYx4RP
         TCw8oJV7vYr0np7c42/qm9qRScAnYX0/X1hlefRBIIbqQTT/DGjJmAncwxPt5/+vrM9J
         +otCuxXmtDopTOCpDI09Q1lV6axBSEqQGtNENTehi8jLquE/RB4PV9I8IhITrfAQtGey
         k2zU/RZB0wsS2RPTk3un1N/fYISIxVVa4VZhOvyTrAkUmCsnU+gRrrBhlr2nrIJDGTB+
         LeBAnIR7elrcVpPUl71d0lItLpVNijpkphcY6A7eUenR0gCzTNFRuTjGwD9Zym6tRcAj
         k04g==
X-Gm-Message-State: AOJu0YywhjtaLVNYyVoGnc08YdKX5P9VMWtdA4mPqA23vX6kJkWUxdKN
        RZ3vOJPMzOOlr0hAZiPqQMu+fA==
X-Google-Smtp-Source: AGHT+IG2Bg4je6dJx6bRZIw22iqCWG+Wx8NgEDEAyVFrqeUSGUgTzmkjIzRJRcIMWoTUmhbGYHlFAw==
X-Received: by 2002:a17:906:7489:b0:974:183a:54b6 with SMTP id e9-20020a170906748900b00974183a54b6mr7128442ejl.33.1692009685347;
        Mon, 14 Aug 2023 03:41:25 -0700 (PDT)
Received: from fedora.. (cpezg-94-253-129-24-cbl.xnet.hr. [94.253.129.24])
        by smtp.googlemail.com with ESMTPSA id qw4-20020a170906fca400b009934707378fsm5486586ejb.87.2023.08.14.03.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:41:24 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/2] clk: qcom: gcc-ipq4019: add missing networking resets
Date:   Mon, 14 Aug 2023 12:40:24 +0200
Message-ID: <20230814104119.96858-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814104119.96858-1-robert.marko@sartura.hr>
References: <20230814104119.96858-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

IPQ4019 has more networking related resets that will be required for future
wired networking support, so lets add them.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/clk/qcom/gcc-ipq4019.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index c134c468bb33..4a0bd668892e 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1713,6 +1713,12 @@ static const struct qcom_reset_map gcc_ipq4019_resets[] = {
 	[GCC_TCSR_BCR] = {0x22000, 0},
 	[GCC_MPM_BCR] = {0x24000, 0},
 	[GCC_SPDM_BCR] = {0x25000, 0},
+	[ESS_MAC1_ARES] = {0x1200C, 0},
+	[ESS_MAC2_ARES] = {0x1200C, 1},
+	[ESS_MAC3_ARES] = {0x1200C, 2},
+	[ESS_MAC4_ARES] = {0x1200C, 3},
+	[ESS_MAC5_ARES] = {0x1200C, 4},
+	[ESS_PSGMII_ARES] = {0x1200C, 5},
 };
 
 static const struct regmap_config gcc_ipq4019_regmap_config = {
-- 
2.41.0

