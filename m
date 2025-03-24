Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96EC25D8FB
	for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805673; cv=none; b=DeM82tbFG+0KoAsz0rxm+xd0p2sZoNuGQL8HRlCI38Y/cSB6KkIYwNsD30yQOyk2MxebStOtO6qD2RwluL948skAsUZIBJa9LLJW6yMeg3zarvZiaBN5UuJ1WgOBG90ijYfo4wzJoxM6wF+W3vOABr0LKP/NHtN4Wy+btktnFCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805673; c=relaxed/simple;
	bh=AFOsIAC6SS0fPbzq7D7EjSpe/9E/6d/qhu5Xf6WqtyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzJaa6ymDOiEKVQsuDZi8Cm3/bR8+BSxLCFcazS81MBWVNJZ9Utn5Us4MMe9p47hOQc+MD4sH1QRDE93hjomTWjSqx+cyb0ihQd1aOmvqvMYi9ya7CxmjLnh0OVlLffGCaRx9HarRaxtQIaJg30oA2AtxkTPF3qVeG9lz/0T84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BQOc0eox; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BQOc0eox"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso697169266b.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742805669; x=1743410469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqyxDkKBXP2Up3UhH96Dx8TXoOJgbv9o3SaMoIVWQrE=;
        b=BQOc0eoxoA4tl5p+pK+LyTEKozxCWGMFmUZJttxNB7EXcd/fD87YBvEC5EoYL2vJWm
         HqJI/UTP22aCeaVl1igHjzTiKxb2A9ntxdH3T80xYpl0pNrLARnaNBZlfJkaX0Zqw/G2
         aoC2OPFkt4yJdQsEleObm0TGqPUWa4591somJ2ggRKwzIz+IeTpz6OcIaa717Fxnsqbu
         HAaf5sDwcgxW4ED7KdUZ6V5sAYDSE7PacQdlUxkLpk2fQRm4xH4YKDj6oyze8grtT2gf
         ZUV4DsYLKBrRIMpuUpwqDe11Nl92a6XNE4saUkcMjZ30DTSWsi2W+UtI27HuTEfv09KO
         t66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805669; x=1743410469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqyxDkKBXP2Up3UhH96Dx8TXoOJgbv9o3SaMoIVWQrE=;
        b=HTv8mc/Gp6UFR8pCH6cw1ZIVc4G0qOkJe/kOvEvWNs1s9mO79z8a4EJ2H9qolhT9VL
         AdzlzbKVGPVQB/kVZLOnIMeYhjodGaQQBUaTA+086QIhpPsVxV4UMrW+5JN/hdqDLLjG
         0YC1u5UCXErlHdPXrkw1DM0AVrjTU5E1I3K+sXN4jP6n7Bga9uFnI/3bMmRTtwNTGDLz
         HKf/FdZFJYTsDRTgbfLQL7u2ADNoqteEeqJnV6kJCvRg4uD+MoqSEQ76dLHd3AZNckg/
         BlkCiGPELVxmbu9sdGzDiUm73R+4HgtST75hl6zPyPxc4xO6UqhRoFxrw6LrBNA9W8vt
         2zbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsYCxyZbvMQiH3HjCY7gKxomfzorrrgRTvBFkc244qliSkHcpsMxw9mnP/p43B/pvpYrgKYYsYnDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9X3OURvgyooFHRBE9/NkhMSrq0eSoYlVC7WtubjRE6SivtFxH
	iMut61AoL16FQZBEoVGyxmpNhjy21IKS8yH44ZQcLZXb8qkmhOT8D9Wiva2yWHk=
X-Gm-Gg: ASbGncvTUEyhW3UUNMbYenFRaFTTtHTotbxjj4wX41MH9RWwIH4lpUsqPHQgHQhnc3u
	NFX6d8tXOCDL01d+Cnl0sQnLJ8hRiq/LHjxoMzCRaa9Q+JdTHSwOPxFnSQ5ddohkqmci5mTOpgj
	YfkM/SL/wlDJ818TwqzV6CVcHggnQQV9RtBFIH2rxjKjBF4YTxHlc87VhuGA1+ZSG65tUz1L+/A
	yNA8um5S86/uhmlSBIrXKlbHaYcSpzJYmPP1Eujov/Lb3nBwjD5/XH5Ap9mz6f5PktPtLvTpmFc
	IxUx6QbnPjn3DVjTk+0e6nTW1DywWxwSAg0ZleHsYTUSYGsMnzbTUzOlViGWNOXzqJWXN3XwfHK
	GixuQ5BAcllhXAUKzrQ==
X-Google-Smtp-Source: AGHT+IEIbECex1u2sz3obxMBVg9MXWDK5ZdDdAZm5/qlaOXilZZG6R+6m05Bcoh0lt+nXYcl9z01hQ==
X-Received: by 2002:a17:907:d88:b0:ac1:e31e:de0a with SMTP id a640c23a62f3a-ac3f20f7101mr1341850266b.12.1742805669049;
        Mon, 24 Mar 2025 01:41:09 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0dfb33sm5715937a12.68.2025.03.24.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:41:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 24 Mar 2025 09:41:04 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
In-Reply-To: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the videocc found on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
 			};
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,sm6350-videocc";
+			reg = <0x0 0x0aaf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+			clock-names = "iface",
+				      "bi_tcxo",
+				      "sleep_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac4a000 0x0 0x1000>;

-- 
2.49.0

