Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D9D38944D
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021700; cv=none; b=kEN3IYw8I9Zr1nh1SQspZZC6mpQEPja0HLmg7gxMXEUSr6YMah4NahG+QVo3swklbECyCagGMiUeU/oRg58eIRpp3HvaOhQh4jsaW0wjvW7VUkNn7hWIQSqknuHQdBvbLiEnAsizZFxx4ZIxR/ze+BWz7YEs/BtZf25raTJAHwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021700; c=relaxed/simple;
	bh=cjheP4H0PwmMUZGzXHCF/PwWHjhyTfpHFF0F+eUTSpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqVY4QD1ZQAZf/IuxPjmkNdp9VWE2+u+CqH2eFZXj3mA9jFzuIHRcs0y2sOfD6Rk1ochBdiyFgxQ4wf1i5EY3fGdS5IhQqJc5WdGKG08kSWzh6qEeR5hhJd2bLWuVd+Bl9536tEq+s/druh5qxW5U4NJ9r7fRdqYxWJee34h+2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mlDGF99K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mlDGF99K"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so88496805e9.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 02:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021689; x=1777626489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cvEvBA/4PYjw500G7t1DTztuhJdzXFRKOSaHuj0ipo=;
        b=mlDGF99KcGwOLpXtACmP5C6kzloTPzvAFzkVXKBRFkDDhnfmh5akSCHo6LkSG5g544
         A5RJG6Fevvwbgf5jyWq3iZ79qSYqSxiSvbJXY7ZPJLujxyBgZe/rxKzBPakbgsLZSMCX
         r4w4Ezk3Hyl4eQrVMXWfH/AtFO+UEyIRPWvi4c1cqv0A1+TJTa38VymL9oaFui4Lg8S5
         ZtnZtqS71LAP4V61eQuTrRnOoexpAxj35t4i2v4NRxeo27RxStRWJ+rSKgJNdRGLs+ub
         aMbS206qF/UtER/aZKUfzQYVkeeI0JX30OWyaqIIO70Go/h5Y0jOtDHJlOqXjLrMgeu7
         USZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021689; x=1777626489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cvEvBA/4PYjw500G7t1DTztuhJdzXFRKOSaHuj0ipo=;
        b=TaUZcwhVzdL3S4QTooOPtDJHAi7ZDZ56arXUs0ut49K42lugcmLClxe2iRBiBqwN2x
         WW9Z18XXHBiMoHnMs7UIi9eAg1rGDTI5nUtZUuNbx92BYBAiYq1RlY+xSooR7kHRllAg
         gZm35sX2je5uUgabfMJM9dOC7qCTMdOlBIxG6qq2NVrVAJKfSKF5YjFE+8/J1gPsP2wH
         70TSN16PXIu4UVn/bsslgTScBRdEyCNY0Stm5n+IqQmr/CFRtUvS4EdiuSxADTriqUoV
         DYP8MG77mf7B72bIhwWiPsUU5tKhvQHHjRbdYbz1Eh22hpJk1MYK7nfEGzPst56SV9Gn
         mfLg==
X-Forwarded-Encrypted: i=1; AFNElJ+EREZ9wKl9oj85aneLcv6gs2q3KxDKxXQf9wvm5GnpxuvsRCipYjYedzdvD/F8NoYFgvCUDTWfVx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsU+J6IJR8j+xhasNQgL30ZfvYyAQzsCodsQPbeHNGfJzgCKuH
	sK2Z0my6l0vEI1S6trWUESECtDOu496AY1ZipjhP3IDDOjARiT/VnevgPLkhbsAGYtdeOxQ1+3n
	vQSPguTA=
X-Gm-Gg: AeBDies1EELBVAx9iN6mzKpSIZJsQF9en9VsdYj2MbVBMti5M0tBpKk4Ilp2pCokDLY
	CgkyAMackvGjylmZ5/7eSNYBSvLuWm+2bdLN0LWnNCKOOMUZ/AaarXAY8NpUkhxsaHVinUPKGWR
	UJXW7H2zEmiGdTdW1zhnUjIQSQ3PyTEuB11HG2L6QyuIz45q+LN4LhH+aGdM4QF45NPOGHtpgX6
	xJc/EYSSmxiylIKI8e5RZrIl8mESp50ljdpElc2fwm7HDQDmF8OxOEfbyyAz3g7kydk0YJ2siE4
	CmB2hszzeobiwPtzBUiLHjp/CqeScwyGPiuR4eLDdRFWqRrQFuJzBjRCJf9bSqporp8054cgXKj
	hkDDinp14c4bEdZ1ATL3Ue3AyMo0voABO10YM7Byq0vDecV5+YXdYo2QdamaW4oiTfAQGy37KvG
	ToGQh4z+wsds8UrswKc+rF6g3mJsH2lCHGDA1tP8GVItrJOJYqS/AmZ8U=
X-Received: by 2002:a05:600d:8447:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-4891ff5efe1mr218788105e9.6.1777021686901;
        Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:08:00 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm8650: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cjheP4H0PwmMUZGzXHCF/PwWHjhyTfpHFF0F+eUTSpI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLvNnJdZU5ZlYNnUi0u1g2pFQCN62UQfj6XSqYM
 Id9mGZOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7wAKCRB33NvayMhJ0Rj7EA
 CAcsyGSldN2J0xl88Vcgleo/lbKWR1Es8VCnpI7KMVoLb6cdNgLmyqsB7NXnbIZ/Z93aLcAd+sNDgC
 2Crd0I7zxhjdI16bbLlfBGI0aiqhoXIu97na2H3zgKZzyCv2p7t/RWQfNKBw/Lx/pScpFPJPTX4NJx
 eiSbwl5fFzNAY3At+RXuKX1G+IN2/M04537m6gGjdWwEs13OmzZRwd2E5wDzp5Ay22Ew9v+PbudBV3
 rx8BFyIQakWkCqy5lASkv/RotXy5nS1Zh/RNf2yfNe8Fs8q7Eh6hS43n4/+WbyCxxb5za9YasNPAg8
 1ZHd5WZkn2Q7t8OMqFo/vvpY/yCLXBLj0BhmOoCM0d5vW/AaU/b0GycPjZMtQoYb+RR4p9E72eB1YH
 BQIN9+gs7KYGN652Eewy3APavYyMgwk5oYcv2QKF9CKfm1ELgbqOuqyasrtErxZE2mpoobKabR8e+g
 kVGbwaNQPwv8BHtvQq7QHaHRsBFhfKXcz1Bcb03yv3pq5gx/Ylh2mfB9n9hRmke151L/15Eh5szKUb
 igW/TcyhPCi8IkzUFlSp0zxMg6iv2fX73Ea4Ex0gveJ1SkzdIQiW7Yz3WgXA6kdHdjb38sHeFSjjpF
 8WTjyT1O+p4q37fUv7NQEJx2+nzvtCoVIs3U5EfGAGnB2MFXNxqer23hWb7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..adfb737afefe 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1963,6 +1963,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

