Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B79345CB2
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017569; cv=none; b=U0S4lFhwLw8AKfIJExYnZxWadl3149R5L3s0vRPqqzAIEmpRW218AMmAJF9LsZMwOQ7TBEWSN81wwRMZkulwukT4P3d1wXuOdvuPJ9pow+0PzgUW6bbmkDj+gpu9KH+uXRkO6B1Ig2zd9IWuGH+63TQmuf1JLGrjGTb0O7qgvOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017569; c=relaxed/simple;
	bh=4m526cz1cKf0Pbx5f0LjtGmUDeZ9tO/nddK2KJIgQXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTLtPWq8tL2X5QpcN9fxqxqG+Hsyec0f2e5er9mVwZAu3lJzm7xNdZqfIbedg2l1+JLyI+OnqF3ajzhImiWNhipBUrgGWx0dob/ucEk4XBnaIsm9v0Do3TgJj98vnBieW7UnBpXypwWH7hFPV8X9/F5zC5mB3am+XtcncvWmYYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHG7zdeg; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHG7zdeg"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a46260385so70283037b3.3
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017567; x=1778622367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7JxHCZxuN/7G1+ttfM7vLC8lkgSjpR9lBRe8UpK0uU=;
        b=RHG7zdeg1EOb64mBIfegf6W2x5R6UvPoNxiw6JHjqLTzl38JwQ4c8QSJPHOz3Wp1Dh
         CAr4m/szADmnTdXPq55gGDnLrj5DznkLO8ijtyxRpoGBc1p/+qgicfn9uUYFFmxMvo/S
         pmt2EGok6J6acWpzgKmyg6Lxvk+K/eyWY6OWHCMtVblvzUxf0tY2NjP0BmaFGryZr/Jg
         eXWRMZmkfeKwFGxSpo8JIEfxM61qftRY5xRpqUnyYiOe918bRnabVOagSJ0BGEHhCIY6
         JIn8NnYQ74UnVmn8yJpyhkxwpaxQPuptLFZSwqiHnIJKH7OppQlUTOcr5RN3qDVhS5bZ
         F7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017567; x=1778622367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7JxHCZxuN/7G1+ttfM7vLC8lkgSjpR9lBRe8UpK0uU=;
        b=FvGa/aMsjh9M03zLmwttTIMzQ74zc14ko6+qJmFvOPBwYm8Nvg0oYp7i4QIzFWpoR1
         N7SBW6oPZa3yqPSlomh2XWCT+8wOK0RGxgY47zHEqrunenOjtpefmE3LVF4LJCx6vErK
         WX9xHp8ItWHiKpoKFMaUO92NozlMj6YUOn9ClfrLDyuKo9y+qqeRlAg9pmAfc+Bf87EW
         0H3uu6e6JaUv+AkeLw5LhFBXRau5tepjj97ekCuqZU0OwY6oVC+QlsoVB59TFCOtAsRU
         cdBW1DNVTEflLKJ3PrsPddgtKJDnxtR0zupGM6F77M2bnzelN9nSA1iSQlVsHFwxhg8F
         M/ZA==
X-Forwarded-Encrypted: i=1; AFNElJ9UEWf4hr/V9YVXh/LldlPKyYYTaRBF+vnQjE2XSDCIeNHXXB4wk+hVNFmvnxy3vbcxGo0l45tDnc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTasZX/G/VaSvBKFUV8azYsUBIoyhUxVIUXWarpAV9NfzRt1+J
	ovcfoO5hZMewDO0Yn339FdRVKe0vPbQuNh/CjvZLDxDY7gZZUVyNjQIc
X-Gm-Gg: AeBDieuD74MNMtnQrPQ3cwWFlaGyXb9ZBdkgublmM7v+OPtxCcTiydnk8znR0ofkCEK
	tMcOtn87X3/qoq5JPk2nZuTFTt/00lz601g1mhOtJBR3fC0z8pYEqA2GSqbmKc0VJoR5sjanrXE
	Niy8/IS+T0QIIg+oMrYg+S6+IjpcfLz3V9mlBcsz1aUyZk9YriZvdGUkmSmLKjiZuGV9LyTDHwj
	glz4J9Foa2zh4K9ZrURUhL5QWSnsjYm2beqmbIzMHLUxGAPWkgWKGcTB0v9hOAsFYb4SEYT3MeE
	y3B3ysnue0pG9yNT1rJiMcQRpdviD7G11gvKj4hryDVabEmLTw48AZOxbnG4ybh4RcbRp0GjXgo
	uqOsaARQWviwbe6OnHx2jNyVFCm35SEOgNnFdrahwB+/UOm4IjtY59gpomEKb9vU0rBtwvyckwr
	HfafE2HR4ktMEBm6SSh6ZDnlcYbEz+H/OPJS91
X-Received: by 2002:a05:690c:397:b0:7bd:a50c:4554 with SMTP id 00721157ae682-7bdf5de7a8emr12316187b3.17.1778017566991;
        Tue, 05 May 2026 14:46:06 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:06 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:41 +0300
Subject: [PATCH v4 4/9] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-msm8939-venus-rfc-v4-4-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..cc6c4353497e 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,25 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core", "iface", "bus", "core0", "core1";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "core0", "core1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

