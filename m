Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBUfICXI"
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAF712F
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:52 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-77f48aef0a5so279010785a.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545172; x=1703149972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90h9raFSlwYqtZtEwRi3utD1Y8btrpvvb6rt2ijbFWY=;
        b=oBUfICXIt6FQlFyXmmLGXvyZUfztr89Kd74kAKtimFIFE4LLA0VKtz7+1Pl3X6QK9U
         +ioY7JTNSOyL4XYB/ecfoJPKv7cDazqWkqR48Kh8fmiOG2ccX6swHbG2rEA1bxXKXmyH
         Nd2xS4RPD2h5pgvkAlrX8DYZTmwMva4JgtKflvlU9rkr5xjNtkArmt7Fvhz0kjHP2+BO
         qCHtwC+YBeSzO2qow1anvOqXka1LefVbUJps4+H7NB2pbLLI4yrtIFUq5XTmv0H06GuU
         uGagyO+fv4kKI8paCdit2TOp5JttL+u3H01ud5QKX6isBzwJNhXJZSXGIIrz4G6CtYeF
         hA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545172; x=1703149972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90h9raFSlwYqtZtEwRi3utD1Y8btrpvvb6rt2ijbFWY=;
        b=exknMUP7UtMo+KIbJO9YPvHtPyZ5T+Y+hjwFBt6parb0DhEVsomeUn3N5AqDOexhla
         gOMe6w3THe94VyjJgQKIcM9wuabBMDy2F03XvXytVHQ2s4ki0BGd1CGCuoyoUsy/uA65
         xHxNERnz/3h5GiwbB24JtZ2DiDX7rWejFucCNeHVqA3wcDFX6o4sLfuffpd9ffr7GzKV
         39GVwG2LgLBU6gVNWcExgq3DnJEmIb8EcZ+Cyyz9TNY+YixJsTprrw5KKCBjFDu9J7p7
         Ss82P9pmaijMYGEoBRAbUipxtHkjbJAScvJeciSl9VzO2AnJ6QOByQ+lQBsPkdJAmpzu
         r3QQ==
X-Gm-Message-State: AOJu0YyHmRcsT2ssV4veFtjsqtwecNG2LxB1f8nNRRAaIX0/AJgWMFsl
	W+mlUv13O9IHvJMG0sfZ6tRY
X-Google-Smtp-Source: AGHT+IEGFG/+5WBdW+QF3Y2B4MEmKQm1lHv2/KY/sKl8G6B/VvdbDTPntO5+kmWw7bf4yF46kQC8FA==
X-Received: by 2002:a05:620a:956:b0:77e:fba3:a7af with SMTP id w22-20020a05620a095600b0077efba3a7afmr6304092qkw.141.1702545171754;
        Thu, 14 Dec 2023 01:12:51 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:12:51 -0800 (PST)
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
Subject: [PATCH 16/16] arm64: dts: qcom: sm8550: Fix UFS PHY clocks
Date: Thu, 14 Dec 2023 14:41:01 +0530
Message-Id: <20231214091101.45713-17-manivannan.sadhasivam@linaro.org>
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

QMP PHY used in SM8550 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from TCSR

Fixes: 35cf1aaab169 ("arm64: dts: qcom: sm8550: Add UFS host controller and phy nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index baa8540868a4..386ffd0d72c4 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1891,9 +1891,12 @@ crypto: crypto@1dfa000 {
 		ufs_mem_phy: phy@1d80000 {
 			compatible = "qcom,sm8550-qmp-ufs-phy";
 			reg = <0x0 0x01d80000 0x0 0x2000>;
-			clocks = <&tcsr TCSR_UFS_CLKREF_EN>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-			clock-names = "ref", "ref_aux";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&tcsr TCSR_UFS_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
 
-- 
2.25.1

