Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885DC50276
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OaeZBgGI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d098b87eeeso24954245ad.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 04:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901317; x=1703506117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvNQvdCy0O2wlOymvN0iIUEpRjoZ42RcAo4vagPpclg=;
        b=OaeZBgGId48TKNSt68mRweEao0G3RMcTDyEpl+QCMugxwzi8t6tusUauc/p3xkAoBS
         GJrdH/aax9MQE7DgFYRKJkAsHP4cNIYx3183Blg8/uvd4hJ2YCSZbczf83o/+Z6cadL/
         N5Ic5YbPIrUVggaxTbE+gyBb6d3gmg5Qhrbjz764t8DLhxAy3BuJurowLR9vznFUp9iB
         Bdi/yWxlcNXEaz2sqR8TkcfdmS7qG3shAeknLUW16G0sme0zbvpAkWW6sLhV7pkEfgZa
         HfOiqpYIFZVIR7jONwCZcB0AzsgR22WurWk0FsWMMNE75TamxeNRjbbqn7mvu9yU3Wux
         hs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901317; x=1703506117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvNQvdCy0O2wlOymvN0iIUEpRjoZ42RcAo4vagPpclg=;
        b=mFXVhDI75ObcZ/mabse+Ak7Kz++mWI9SPPKZCflJhUFL/7fJfwJj4olK0zly7ntfbh
         VFobM7qeMkObZeeBNqwETQp1OSM+BOVgXravBvCdTmS+58HRMCaKeLedoisJ/iizCKBY
         Zn2r9bB66NLUDgTZanKR6SPU4WFiVfkeP8hdvyNKnw66A/3IRgBAjR/WZR4Ly/dMK4pD
         R7nP1LObfr7cdmzOHT/aFsYQyGoeNipVpZ+ZhEhzU3zXo8B8UfOD3qGz3nNRSx70zX30
         Hv48La6vof0kw+w4JbPPx/JE8YI03XdWEO7t/Gd4ZAb5C1dP15Jj+z2r/Pgpel/3y6c3
         QB7g==
X-Gm-Message-State: AOJu0YzFBSGpWfw3z7yX5yfwJqUMXs47BxDi1XxXenmJGRv7SBgLdpGs
	NoFtriTgCbaYJF9HRZ90Bs/p
X-Google-Smtp-Source: AGHT+IEmFgwhty4eOC1HWIN6R/wmWkUmpHUAMlQfWfME+fkRcMzo7kKJtBRaeLQkaRQozYVIufi4aw==
X-Received: by 2002:a17:903:24c:b0:1d0:6ffd:9e1e with SMTP id j12-20020a170903024c00b001d06ffd9e1emr18461127plh.112.1702901316940;
        Mon, 18 Dec 2023 04:08:36 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:08:36 -0800 (PST)
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
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 12/16] arm64: dts: qcom: sm8250: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:08 +0530
Message-Id: <20231218120712.16438-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SM8250 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: b7e2fba06622 ("arm64: dts: qcom: sm8250: Add UFS controller and PHY")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c1b7f9620ec6..e47c515af6cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2486,10 +2486,12 @@ ufs_mem_phy: phy@1d87000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "ref",
-				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_1X_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-- 
2.25.1

