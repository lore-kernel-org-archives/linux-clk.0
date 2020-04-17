Return-Path: <SRS0=c3RB=6B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FD7C2BB55
	for <linux-clk@archiver.kernel.org>; Fri, 17 Apr 2020 07:01:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 928D022201
	for <linux-clk@archiver.kernel.org>; Fri, 17 Apr 2020 07:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2oHjmSU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgDQHBf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbgDQHBP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Apr 2020 03:01:15 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47821C061A10
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 00:01:15 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h69so665524pgc.8
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 00:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EaN0Seks3JgknsK9BVWkgtTm/fzHe3RWKNOjTd9p+qc=;
        b=N2oHjmSUk1H3eZy02ScumUxitUXE/7djA+CdKOZRbv02gbQB/4+1vOymlchCMXQgRf
         sWhee0lK0XhaWru25QV0dQi88JkGU6QKvheoj5dnaoZEBXYJw/oNmQbw6n9/c+N8N9ln
         VpWWQur1cUWtzOJNcWt7ldKd0CQjyWuqjod+/Re+S8czpvszlqcneqlWA2loOvY5AHiE
         W+27jroj6PpmZCsdhMk0VwbaxZfe1h28snyy98zQPo51o5dD0OU59v1Rn57uen8M8RE/
         fSr/TVwuviDyoTJl8NaFpXSliWhM8LZhf5RwSBwtzGKoDpUg/B0pIAqoEvsvDIjNFYuc
         1EpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EaN0Seks3JgknsK9BVWkgtTm/fzHe3RWKNOjTd9p+qc=;
        b=U78p5csyT713SUoR6Vmu6yhdhW4Q6EU18q1g99fMJ2WA2OCiAtbNAD7ZOO88wXMAJC
         1QKonudrP39yMEZxNtRknZqDD/+m9NAbrjr4iNna2ql+URa6prVbv83zr18Z6kl/eA3D
         hgWTIw3Wjgy1kAMWr/qgsJBuEnGaP4+g+9GlHGxGhlu+yjT0Uuo4j7oDlnXL784PGWFV
         hF5zBsC+7X4vVvlN7DgjxE0s4/anGxoFUXbkKIbxkZLjq/5i5EJ9JVP82PlCco7lArXS
         VwLtkp8gi99QuLMNRUpfnCeYJu4II9jl35tZwXFaFWnd27mEzfP8aScbW0mGnGHU6GSL
         AvTg==
X-Gm-Message-State: AGi0Pua+d4RhmdxVxnQjLSBIQ2T0ObRKaR3Omau/eSuL83nJR8w/Nv4F
        ZPKRFqlDSvodkYF070XEaXLCWQ==
X-Google-Smtp-Source: APiQypI4H58E4Hn7junl0qfO7JnmLs7Wc3DZgo9GXuO7Bx45z0RdlE5e+2Hj0zhyut03Ql8vjew09g==
X-Received: by 2002:aa7:943c:: with SMTP id y28mr1780257pfo.171.1587106874750;
        Fri, 17 Apr 2020 00:01:14 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c125sm18561609pfa.142.2020.04.17.00.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 00:01:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: msm8996: Make GPU node control GPU_GX GDSC
Date:   Fri, 17 Apr 2020 00:00:44 -0700
Message-Id: <20200417070044.1376212-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
References: <20200417070044.1376212-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Presumably the GPU node needs to control both the GPU and GPU GX power
domains, but given that GPU GX now depends on the GPU GDSC both can
effectively be controlled by controlling GPU GX. So use this instead.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 895202d07a8b..af1f4977b97d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -639,7 +639,7 @@ gpu@b00000 {
 				"mem",
 				"mem_iface";
 
-			power-domains = <&mmcc GPU_GDSC>;
+			power-domains = <&mmcc GPU_GX_GDSC>;
 			iommus = <&adreno_smmu 0>;
 
 			nvmem-cells = <&gpu_speed_bin>;
-- 
2.24.0

