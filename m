Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i0x1jBDt"
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56521115
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:23 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-77f8e4702a6so149247385a.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545142; x=1703149942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NpBpw87ancReoayxiYNLEpdh+qbLyvkQJUBfcAOaoQ=;
        b=i0x1jBDtKLGBSHWJe6Y5P8awCV4vjrBhYub4s5xNckoIF1vPLDN59GTsfMUebze/I+
         IBiMHqpy+V3baWZHsw2W4UWAk33Bo08J+iF0RCJ/vf2cy3fov/Ryqsut5i8HJW2Sdnqk
         oiXV4JKPHMgshO0ACaFFhpin5RbCNH0qZMy71Bz7+NUyyegtQXu+AxRsZydhZSohJAAw
         h9TtttUvYsJSBtKFKuWa915707Y55mEqevxlKIpJcOdwTLjU+IIYbYNsnjkuM2Hm3Mk+
         Hvd9DfgK2GMhT31GtcFbLWd+9k+uxeppfgIjWLFmY6/Ux72DBJ6s7RnusGtgO2XT+eFg
         xO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545142; x=1703149942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NpBpw87ancReoayxiYNLEpdh+qbLyvkQJUBfcAOaoQ=;
        b=s4D47NwmgiBbi6IPYht2kG6EY+0vWNQPCeeIE7svmeeg/ENNsMFW6HzJnF513/9yzL
         32TOvSjJPm9cPVIaXmyu7jQ5PAPoNrMdle9t1BjUKapTDaXp9HcI+tuJSj92LgvY9J+2
         3UJ2ncRBtK/PZeYScaAYdbFgvunTU69hg9Vw5FChbTkKKgTjhCLdt3ydu5Sjhohc9Kg/
         Ov/HWjDP3m2GXvnx3rJYWfiWdgn+tNQhl/yxlidjYz5xne2QKTxN0NIslD38X2Cyl5S7
         HZa7V5DINj0sobT3ICB5PcUXHVIpB5/8UmwIS0ZwmucomE6ALjLQuz0HUXYJT694ZzUW
         FemA==
X-Gm-Message-State: AOJu0YwWjALvTK+EXssVkaJm59m0Tnb9KVY9kReIMGN8yH62pl6GULvM
	Jr+P8Y0vOr57bDpXTqM3VSa0
X-Google-Smtp-Source: AGHT+IHkKGZjjk5nJUoZ+N0uLM2h0SgrsFVpX/16fIAjacSPXopzF1OgPVpV/nLmed6E8PzbjRaw7w==
X-Received: by 2002:a05:620a:260e:b0:77e:fba3:81e5 with SMTP id z14-20020a05620a260e00b0077efba381e5mr10587915qko.123.1702545142533;
        Thu, 14 Dec 2023 01:12:22 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:12:22 -0800 (PST)
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
Subject: [PATCH 11/16] arm64: dts: qcom: sm8150: Fix UFS PHY clocks
Date: Thu, 14 Dec 2023 14:40:56 +0530
Message-Id: <20231214091101.45713-12-manivannan.sadhasivam@linaro.org>
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

QMP PHY used in SM8150 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 3834a2e92229 ("arm64: dts: qcom: sm8150: Add ufs nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 43d56968a382..18af94852974 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2065,10 +2065,12 @@ ufs_mem_phy: phy@1d87000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
 			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 
-- 
2.25.1

