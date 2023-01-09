Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9299C678DE
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 00:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjAIA36 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Jan 2023 19:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbjAIA3s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 19:29:48 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4894DDFD6
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 16:29:47 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id bn6so7328679ljb.13
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 16:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjPB6qMW5CCrupsiViZnWcfIPvSm2Sn0b8lV/kmvycs=;
        b=pUuT17G5e0SejScAgjZJ4OGuD7+c3+MmW8gn7O29vf7SlvLrktwyWySTxyCCAFgACA
         mESJmOBBXdqVb4U+iaNL1FVeaZ8DyeCqKHqDkLCEHWN+6ckcMgQp9mQ8LIDNxdDhiRJL
         fmPoXejJTJoE3gVCFUlCnrHKKbcZ0egicdDIGL6+Q7asbuQrgWlqQyUbD3rroJyfx57u
         GQQGOV0/qQjfLZvk7b5RNZWhY7TKAyPR31Pe6sPOjFcK6D1FDjDO5SVX4BD7WU3I3h3s
         3tooVG0P27Gsv3yfsbR7IAfMDZmhEg/rHoNJBa2qmscC4yKS7GLKzBxpncWFLRXPOBXN
         OTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjPB6qMW5CCrupsiViZnWcfIPvSm2Sn0b8lV/kmvycs=;
        b=CF0nofyqM8HyWmRi7wgUdKY/woc4LmHpxSfB8JraC+HwfioOJ1ZRKcsL3QCz+ODbHg
         52TbxYSYqZxWFQQfAsxZaYXawfnN9R4tYgWOHJo4Rel3JtJ4C4VfaGKobKXxfVjldF2q
         IyOnuxwEqX++3uT1GHOh87wy1kgmeS17RHwZ8vrCkJoXdMnWh7yt5FRfgMp5uoiXvcxT
         aC98XY5/GEXisX8UtGjZEWn2nsBA2zbWWygKBlPTHJVHzcC1piqbiCXnCgrrTVYEs7RV
         6RswfTHuaNdRrhK1gwgokuQ2jxxJlZ/FChan+PlRV2nh9X69sc6ss3RBQeb0x0YGi7xh
         8WCg==
X-Gm-Message-State: AFqh2krEstfzufjKhjKxKTbfQgRoOQAuqu9cNUP7wG5lXr0qFzLF/MoV
        mm5r9nXv1KLsZ+jt36uPVQHl0Q==
X-Google-Smtp-Source: AMrXdXs3V9UJ/f8K620dLDOGLZs16j/yzMCMU6ioDI8fxXAgltRsxmGtpsNXnRrtM3QBfZ851+yWQg==
X-Received: by 2002:a05:651c:b24:b0:27b:4975:a468 with SMTP id b36-20020a05651c0b2400b0027b4975a468mr21475901ljr.36.1673224186839;
        Sun, 08 Jan 2023 16:29:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 12/12] arm64: dts: qcom: sm8250: drop the virtual ipa-virt device
Date:   Mon,  9 Jan 2023 02:29:35 +0200
Message-Id: <20230109002935.244320-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop the virtual ipa-virt device. The interconnects it provided are
going to be represented as <&rpmhcc RPMH_IPA_CLK> clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index b3ab2896a6cc..af298dec0568 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2215,13 +2215,6 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
-		ipa_virt: interconnect@1e00000 {
-			compatible = "qcom,sm8250-ipa-virt";
-			reg = <0 0x01e00000 0 0x1000>;
-			#interconnect-cells = <1>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.39.0

