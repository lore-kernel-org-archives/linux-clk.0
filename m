Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qFJCuyU6"
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3253811A
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:29 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-77f35009e78so461372985a.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545148; x=1703149948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvNQvdCy0O2wlOymvN0iIUEpRjoZ42RcAo4vagPpclg=;
        b=qFJCuyU6nQVzvG2wpCz13Aulg4B8OGz4fdU9936pZJjg+FKouAuS6JakTBXdXAW6tr
         UwDWxmDUnX+8sYFLWKuAbl2Wu+Nkbh9fcPa2aIb1C4qRPn76gx6dz8qYVFVabDJEIWvI
         dQSe2toz2PRKRFDqavmuaalTejJ14jMV7HCXM+IPspYiQ0bbzg9UAhu19LWiZ52sbg8v
         7motWtxG+1r1opEJc7BKn4+Q/LRrJhzn0/9D3B2dbIV8BlWn66PBWFqXo5lbarHmdEcE
         rhOh3PJLnSD9NIUrKwM6zKfSNtCw7Vj3B5OvFme27ihn6qk5im8/w9JKI1WEi1glY1vg
         QrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545148; x=1703149948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvNQvdCy0O2wlOymvN0iIUEpRjoZ42RcAo4vagPpclg=;
        b=bO5hC7ETRwaLfkV/HZGvJ/ORfxnBFPtq4QU9gl+/ilXT3Uv8aJitcEJZmZrHwJvii+
         a/2pA/fvvZQGWUgE8mExr9VUGJFVM+D1cQMkqHGj3Miu3greIlLchRX7iZMwblXVh8qx
         m3ZQ+8kdbHvXoTcOhDNDhPKm8VQ9MwtS4jp7k09qMk8Tcws+iQ3+rR7BY9UtGKxtAYex
         wzjF8OCtJ01aFG0V3aCL8o66FRlB7LWnSVck1oX71fhAUA69YOVc1ZY6g6dVKKj8/kZg
         V3Iq2pRj+gR63I51tRZ0xABgEmcwjPzBuhZa/6F3/kW9w/LofP33Ps5zwdbyjGQ0AUgO
         5i3A==
X-Gm-Message-State: AOJu0Yy2sMQvLWETLnUEAg/pohLvtdX5gdBKAzMZBHQFHgKDm57BhBVv
	d+D1GhOfmxch0hugL+k5SFCE
X-Google-Smtp-Source: AGHT+IHKV2g0kNYONFuj/bO3jVZJAPZFJ9rV4Fa7zy4o4C1WAr4wKwvCb2AiIaMwbW9Aq+iM6pw/6Q==
X-Received: by 2002:ad4:5ccf:0:b0:67f:4c4:e8a5 with SMTP id iu15-20020ad45ccf000000b0067f04c4e8a5mr1792743qvb.24.1702545148371;
        Thu, 14 Dec 2023 01:12:28 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:12:28 -0800 (PST)
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
Subject: [PATCH 12/16] arm64: dts: qcom: sm8250: Fix UFS PHY clocks
Date: Thu, 14 Dec 2023 14:40:57 +0530
Message-Id: <20231214091101.45713-13-manivannan.sadhasivam@linaro.org>
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

