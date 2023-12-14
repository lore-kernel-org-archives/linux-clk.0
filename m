Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SMB8TQvx"
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E162128
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:41 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-77f31239797so417196985a.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545160; x=1703149960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTvHTb3eBsG5jFvbdhGh0zasO09G1PrRZVvH3m7yDqQ=;
        b=SMB8TQvxC/lcyxZuBGHxOxwfXLr+T6ApQrnvq+POPmCPs/mUifAGNsHPSK3CMFUILj
         0ZQfqLj/x9iLvfdQ0GPqPewttGt/02fPTuw9KxDBKc4rtSEd7EtYswxm48gJOcRQIUPg
         Gwv8f/x5EA9G9BQTM9H+kZItNDDytWrg11EmxUEopj56FwyBXmPbDQgiQX9rsYJIx2ij
         qPgHTdriCW1UqHrVMpOX+/IS6Pa03/wXQjGVYFGvbdjxvx5dmdAJOot7qw8fbZi+latG
         81eyWPodlRxWkZ3filaUEdVYoDibtoyoTBd85H0kLn1ett0d5EmXiweXZ/oJLhlJut8Z
         w3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545160; x=1703149960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTvHTb3eBsG5jFvbdhGh0zasO09G1PrRZVvH3m7yDqQ=;
        b=W4UWX1t0mZbhMkL8pTRoEjcK5Yb6tUNXHCNOM0J0DYCo1Oid3BU+83OYYK6dA8JbA1
         OvUhGcsjVBLVOTnkuL09dZg1TFGRcoPFQmEqbuLPtCXFLrQrPo2nUHvl72WlXJa+pZd3
         54cdZyBy83GD2E7zL7EUUHSYrBnTMuOa6Wbij8uo0niFzXRALflTNGKovDffyOiG15Vo
         1ZVlIKZIqXpxlMfC04rhYFuWmIOwTvIa30md0AXlmQeYfrHpz8CT6eXdqdPuDAvu1XLc
         kvvA4l88M9Rc/xKFSqGLbiUxVYHgFMsAh/+SL73T2DKaeILq9S84N53Pfa6xqz+A0bv0
         3cfw==
X-Gm-Message-State: AOJu0Yzn81dEt6aa16hJmyUCEWh7YhpNsjNpe1c/hXk2g3uy+FjVqGJH
	f6NcW1nW0GQikYrwGKcCPFjQ
X-Google-Smtp-Source: AGHT+IEpmVaZuTwzbu1BWhivPFP3wp0kwntHWmdosjIBL5bKy/r96k37U4HBpjYRfuW3aZIMXlXqmA==
X-Received: by 2002:a05:620a:20d7:b0:77e:fba3:757d with SMTP id f23-20020a05620a20d700b0077efba3757dmr9763694qka.117.1702545160156;
        Thu, 14 Dec 2023 01:12:40 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:12:39 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 14/16] arm64: dts: qcom: sc8280xp: Fix UFS PHY clocks
Date: Thu, 14 Dec 2023 14:40:59 +0530
Message-Id: <20231214091101.45713-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SC8280XP requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..37344abbe8bf 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2256,9 +2256,12 @@ ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sc8280xp-qmp-ufs-phy";
 			reg = <0 0x01d87000 0 0x1000>;
 
-			clocks = <&gcc GCC_UFS_CARD_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-			clock-names = "ref", "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_CARD_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 
@@ -2318,9 +2321,12 @@ ufs_card_phy: phy@1da7000 {
 			compatible = "qcom,sc8280xp-qmp-ufs-phy";
 			reg = <0 0x01da7000 0 0x1000>;
 
-			clocks = <&gcc GCC_UFS_1_CARD_CLKREF_CLK>,
-				 <&gcc GCC_UFS_CARD_PHY_AUX_CLK>;
-			clock-names = "ref", "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_CARD_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_1_CARD_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_CARD_GDSC>;
 
-- 
2.25.1

