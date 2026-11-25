Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640078;
	b=MQVtmcBh8w6A+hTD/UTUWxANek7FS8tLoVEpr9JmofoaFUNpK6+gTS6xGuUx2YK+QumM
	 UfBpjO5W69hDd8X+w2kBJ503JIOBhLCFi/JeL0RMjcA/R0rR7NHapFb0BGxcC5ylE02O1
	 389z704b3mGElB3vAmBGe/em3VFOXU3Yu0kQnRzypJPlibRF10wfZx5/nV+x0Z1USXt6v
	 VGRqapJyqPkEU21tSTBIARgDRbeRvlU2CNKrMNWvacNewz9M4x9Ozld7AajRKiXM8IuUA
	 PZgkFNlY5410EXTHIy+R9xRiBvKw+2u/rYYSoNJpBwUgt0Vt7AV49726NhxLiOk1/uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
	b=Q7W8ejGUSwN5ihSDa4d8NsoTPmz5rRWcpetGvlTZelagJm4vgXjHKYZfx3grpJuZ/JVo
	 cnWVI24PVYYcr0NO2KMEAzuunXiWl3A18P5zXKkhEPwa+MRRrdC/2HNEXDaqCsy8m/75H
	 pL0bbq++rz9wJq5s4DV9f9YM6O/2lEuOBa8M6B3ciOOOeUL6yWBEU5kO1ho0QpJeZReMR
	 ukyYlzAOMw0J5gP9PUNRqh0NLbOn2HlZVAA8tNebelEtX0lOPTk36Jhk5jYWk/RWBybAM
	 RDW8WkcX+ioseCLB0c2D2x+8Jo2RZUiZQc1Kf6ZW5u/JmLBJY+L4tYSi/L6LCwvbFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRIuHIDa;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4711D606A339
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4711D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tRIuHIDa
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c00c727a26so512869e87.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 12:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640075; x=1796244875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
        b=tRIuHIDaAazSvAYxdsTYzbqP6+kJs7Q312mhnldXf2RHls+Ke/Q5o0jf4fLyNmjO6v
         cDBiBWaikLMWSflRvanN8DO7UXWMII/dHXhp2V6VM4awMBtUFJvidJ+6cF2gRbZdcH+Z
         Gh9/Vepo4RpRdqoN1Gyyp+FJSrTuSLiEm+tIOCJlKYiVTAxITO4Ve9g6+n91kgXMlIyr
         UOOhawheHZdMNW3IPQWFzBzpicQ/seSIyyihRuIVJ+qkiZZVmUhegLPaK+/vWrNhKGED
         hRq8KFXqlYjRZZsC+woHhx7sb6wMmAilIUs57uC6wFGdZjuczqUSaHz56ebQ41mhkF2u
         /rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640075; x=1796244875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=At893HOits8PlbcqKQMAG+x6VHDDd+yyVnApfOrreEE=;
        b=zNYje8PAClEUbQIGh05IUdW70O/16/tmppFT9WgGZDZUOz5ZeSJRXtVT22aGlpnM9J
         xSkMAFiGCj/USTvQEYzcqMa2tr4a3lbKVX5K2zgm+LJewwxVc64Sg0Cv+siziJIqMPTh
         MzLK2O1fQS0bU8GVdJCJxa9YvfUNYsAdoFpwlTmlbFu16P69e1ooREv0ZOdVjbLj/ipI
         uSJ6BB/GBDA18bnkorQC7RNNJN9nu1TL9MGkbh3oekrNoYBrkp0WUMd9Z9MXB/V/5MFS
         kiM02WS3hIMhVCdqBUzqcytVIncrTeW27kZ7x+v/+UzNTEKbX+i8XsAyqGP0YKWlfnV9
         7BEg==
X-Forwarded-Encrypted: i=1; AL+hErE8bJiRy/vlnYAnGBI6DxJ6RosTCx7nsdATZv4jneNvevYPRBAAJHdKQ3++1F9ud/VYIjzZJSF9knk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EIubEiTB/U9Atf+bJTGlQbppGk2gzWmCsAHXu58NNH7vbTWlX
	172bMdDlo23rgglrXaHGdsjMCyZIYbbziO5hj7d696N8r/K7uuMGHL4rAkBsDwOQPyA=
X-Gm-Gg: AZFdTZeF5Gt4NwaOJ6YIzunZxEG1osey79UGuGSYBjSaZr0vbSLwKx5AsjWiXx6M7mQ
	KSji75VfG98Jv/4YQPYX7f5syQDErXJuj7G1oeo67Xpntb78Z7bvbJe120ajOdSG8ly9uYQNNCA
	yOiksK+Y4xVMlpgd/YAnb4BsyQC0fMch1QxJ8lGClubpErmhw23UOkXQ8YWnT9+Cvkfth64BzRP
	WCzTYZAWl6K2s9y1WIKYkTncBsi4GcjDgLWdZVl9RayYPybPkOCeMb+X/2pH22UCRazt5qrYl1x
	dLNAQ+3OzHAauplk+eUCWRzWkn7gIaX0cDMZrA7QgwgFYkfQIpdtdvV6pmeBw8wdLYQ8fXAxVXh
	r8u05MKjNQgrFJ8nFXSX1IjCr5oNNKDq3dllaGovpl9NZRhlqSEeC5Op9KSTN6/+nkFDyOcdqW7
	42b9ah6bDAXogdQGPZb/5lcuBCgR+ReIXNT6OQu5lrKi/zCGIRBA3CjfjN5WOVlEHRlLCRPA2EN
	EJk8wi8HJfnm4PXyjhn8FYQ44F8dtMBiI11P7YyYks0ff7c5U9tUdM4L1kdjlTzwDBDu+AQsHYT
	nP38JEsUG9zuyQx55dIOE9HPAh79n/TRx/pLA3RIiC9DfG0Pku2vJb5z3Rbv8T8zCQDBYw==
X-Received: by 2002:a05:651c:c011:10b0:3ac:dfad:319d with SMTP id 38308e7fff4ca-3ae7f9d6f4bmr42526411fa.1.1795640075524;
        Wed, 25 Nov 2026 12:54:35 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805751f4sm50871441fa.40.2026.11.25.12.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:54:35 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: Add camera clock controller MXC vote
Date: Wed, 25 Nov 2026 22:54:17 +0200
Message-ID: <20261125205417.1437355-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
References: <20261125205417.1437355-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera clock controller PLLs are powered by MXC rail. CAM_CC_PLL0
runs at 1200MHz, the PLL supplies CAMNOC AXI, AHB and CPHY RX clocks,
and it is enabled on any camera use, also CAM_CC_PLL3 runs at up to
1570MHz to supply 785MHz IFE0 clock. On SM8650 the PLLs running above
1100MHz require SVS_L1 level of MXC rail, while the camera clock
controller has no 'required-opps' property, and the MXC rail is voted
at its lowest level only.

Fixes: 673fa9a42606 ("arm64: dts: qcom: sm8650: Additionally manage MXC power domain in camcc")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c8..af94fada15a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5641,6 +5641,8 @@ camcc: clock-controller@ade0000 {
 				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_svs_l1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.53.0

