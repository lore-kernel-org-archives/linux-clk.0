Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9B1CE7A90
	for <linux-clk@archiver.kernel.org>; Sat, 23 Sep 2023 15:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbjIWPBF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Sep 2023 11:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjIWPBE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Sep 2023 11:01:04 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DA81B6
        for <linux-clk@vger.kernel.org>; Sat, 23 Sep 2023 08:00:57 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-405361bb94eso37013775e9.0
        for <linux-clk@vger.kernel.org>; Sat, 23 Sep 2023 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695481256; x=1696086056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vA79xyD+PI0yTnhfaRji6jl5WeCnlojw8Sdf795ardQ=;
        b=pLAtZWi52lNZyMgkzyD21GM66S2r19aRkyd3N35MDulpauOp/VD0CooNRRub/dad5a
         ePg9+dY43b4gro1G/Y8byDc6KAvgZ/c+CBwF3z4kEKuGtt1ZqAW2qjGO6rLqgKqYEI/M
         f4NkLiG+BWgsVwEKr+dxe8pF7tCi/G5FN2JnqnJysNBzhhxr70Y+up2bb5mGlDOht14v
         lbI1e6J7f4FkvP//mUQ8LdA5Oo4zS7y7NIcGB6IGYmOXxk1UKIfJfzpQIpbHVE9F5MPU
         ru4M4+36osmGtZACLWP3M+vY7x0if0ikvUKdi0Ek+VOOsu8+Fnc5zxb6AahA2XWQQChP
         mYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695481256; x=1696086056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vA79xyD+PI0yTnhfaRji6jl5WeCnlojw8Sdf795ardQ=;
        b=RtOGZPI9/6qX9cwSaC8HVKrPYEk8xS9rhiEfBOckmGydeoSfMR4GhJa3jbmAKttVdv
         iruWw3pgTs3mVoE8tOWmK6Tviim23+h1Qmt/1TdkV8nMDWqi5/dlrhBG2zG7or3HOgKz
         +K4WkLi50J/z2jBehlzizqeaHR81VORItmXZ8lQ+0V/aYmN9aGkSJAjCer3lPs76MvYA
         p0n8u9jZWPgW6bnkDY4vE4kVuHoSkAY/GBm6Cm7fhJtDBDSa2rw6HVVsqmjkVEo/ciDn
         ilOpO/Ko322Wmh594EvyHWdm6MguD9wHB0VWzFOLJFH7nbr8e5NEtbREJRBD0hCChRWR
         SDmw==
X-Gm-Message-State: AOJu0YwnTrU8Zcrk14sHFBR4Gs3jsd6fU40zXc+Zsq0yXF+UQ6u2LIuf
        mMk/p6XJSWJrlR/5cTEIN4tmUg==
X-Google-Smtp-Source: AGHT+IFer9fB1MpYho3IkwkJ6C0+JOEp2GkPhJjHoub4fFsQziH0jcjSVV8tvLVhn0zHn2yAw4294w==
X-Received: by 2002:a05:600c:2183:b0:3f9:b244:c294 with SMTP id e3-20020a05600c218300b003f9b244c294mr1856618wme.35.1695481256422;
        Sat, 23 Sep 2023 08:00:56 -0700 (PDT)
Received: from x13s-linux.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b004053a2138bfsm5787006wms.12.2023.09.23.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 08:00:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 4/4] arm64: boot: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
Date:   Sat, 23 Sep 2023 16:00:45 +0100
Message-Id: <20230923150045.1068556-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230923150045.1068556-1-bryan.odonoghue@linaro.org>
References: <20230923150045.1068556-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add in CAMCC for sc8280xp. The sc8280xp Camera Clock Controller looks
similar to most of the sdmX, smX and now scX controllers.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..dad4894f358c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3450,6 +3450,21 @@ usb_1_role_switch: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sc8280xp-camcc";
+			reg = <0 0x0ad00000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss0: display-subsystem@ae00000 {
 			compatible = "qcom,sc8280xp-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.40.1

