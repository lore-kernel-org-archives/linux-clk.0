Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEFE2F6178
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275964; cv=none; b=aa+W+Q3Zhi7UmdtP96OTXHRm77fSGvWBhsLVzceRpSvbOWvw/y91V462Q7Mgkm2f08glsMlBLnrmprsTJ7hIwAG2+vAnDZZ4QRx57DtdfvTrNIAb4p0NuoPA59dfz5witUc2EPJCZfib8AOMJ8/IQ2bk2FA8j6bV2YwjVVoT20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275964; c=relaxed/simple;
	bh=OUZ9IG+km58rNt7HS8env5yNHx5mMi+2MbMDqULuRsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWdp5Qth3qMMDRq6BlPfPzNmi3QurgY5JBnHKBie9JMxMjrLKt3VPknsni1t/dnzhYwmmKa/bVCi7cWvFqetcBGQiaIhAPSL15/dNRWFh4ZgjFQNVyRKGgMwc+hURASy5XHVWP4oYC6MfAtCBfLDQMY5erj7YRDIM8CTjvrUiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PhZx8bOw; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PhZx8bOw"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fd0d29e2bso287483a12.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275960; x=1758880760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1GNGqseHGUM5oQ3biZBBX1kDZS/D/utgJSKJ0QYFic=;
        b=PhZx8bOwCbj6uddXoMcvj3L5E9ivOMXdCociE+4ZaUcQIxjiB6ShaPqd7UhCxAMZLG
         h1Ae4wUT1NVZaH2CCTVprf+Rd1JQdhG8IHQHFGulfujv6Ibhu6NQz4l48au739btb5fe
         v4PgEFcHDz0BODr48ozEEQ1pnexH5s31yUaUlSXAEyhqnnhrRKIUUHUGS9lWxKlq0bFM
         5WhWIW1D4ge0K0h/zUvgXQ3hM29eRGiO3W+jEEGbiAfBYD8mwQWsi5hW/Q9JNoirdGIZ
         eOXJz/DqcyW+290sGKiUKalS70kK1vAw83gV9Ccn0w8ElHy/EyNbZtMjH49lQcKoIhpQ
         YPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275960; x=1758880760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1GNGqseHGUM5oQ3biZBBX1kDZS/D/utgJSKJ0QYFic=;
        b=XnEHmoc5/a6+TxRJkzBGGPKGzLfeg3ciesOfoVLBFhCMr3Z6ZsNvMxV/vxFPGUT5PN
         pqKf/tYvhUHutYDYV0zwDlI2WO4e2QzLMH5Fp6j4HymzKg9o0xkqzr/m3XdeiZH1VOG4
         vh9/s9Ugm9bUNx0q3jNVZYDPI3m8STLClgag5jIgTBkQh4h7qF6doKk5ifi4fU7Z4o9u
         USaSit9dSS/GN4JPzZ9/qOxwJV9XRThmJ5WTD6QygfhA+R+L+V+iwgLNSm/AzP4TUv/f
         3T7egAiu47UafHNyYfQhCGKf56RnWpNb2LB4OMt1Ac9TCoz3K2tZCxUYEuF+O1AyfB/3
         h/0w==
X-Forwarded-Encrypted: i=1; AJvYcCW5l6Y/FqAiuJop/uh8Zw+u7r0L+DwGQS4k0LrZQyMuZ4X10enympMWIW2PyjclNflRsZ0sLX4e2LU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+1VVXHdSTg45BRqygTeHRTRe9q7QzNVzCL3ncdMO8C+KlVmPw
	+TME/c1sp5jCP/tc7gtJoFVjsxxQo+Hnwc/IcqwPxLpVfOmTT1BgC+y9emLaxkgnxJQ=
X-Gm-Gg: ASbGncvqGa61T5m6EOIIDqfj2LSijx0JA7I2tf52E+R7xbEX3V+OjNbLGLGTNnAMB6G
	CEm4tMF0raSuzW7JdAUh/1bQ47IcSm/J+zZpYrJSW7mjzVjfxuS2+s+R0Rqs9iavc74muHgk1o+
	wqi4dJBqDhOOAzIk2HnZMJNmiULmeimZwJ6okH4ono2kUuTT30pZV+8qHUc90phqL66OAm/aCuO
	ssbzcyHmcuuo5FMZsnBwI9knpYlsdSy47z2CHKunJ9EPOHa+08MHclzS5PdgUwFS+egTP0bA9E5
	cyewgTHs4XyTtyJO1Ttdz0cQrbGLLDO5faKGkEe/ubuLVEvUTp7Mbp8NCvvz1y9Eve0Jcis3oZo
	S9PtKvwetbKyZLrUI8yi3xKPj4lRUVsRXeD6DfsCRux2W8fIQFXlIb5AhV+cWDbzzPdHm1g==
X-Google-Smtp-Source: AGHT+IFHKKTi2KqgiASniTO0Gp9RLI9E4W0L4odjaW1XLQBKa1rfopUp5lUHyoEfK2xYfnHx3ihkQQ==
X-Received: by 2002:a17:907:7204:b0:b23:74d:b0cd with SMTP id a640c23a62f3a-b24ed887037mr267162266b.3.1758275960218;
        Fri, 19 Sep 2025 02:59:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Sep 2025 11:57:25 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm6350-mdss-reset-v1-3-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=960;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OUZ9IG+km58rNt7HS8env5yNHx5mMi+2MbMDqULuRsY=;
 b=itCMelDsenKT4NC/qIf87Yi9X7uzziQSnVu68bi4iCRJjxZ8ytLv2YOjIJ4rlkqTKGrcilOBW
 i3XJ6jjiISxDxjw32haNv0RDzcg5kyGbOW4ys9WXSkcGiROIp7JJNDb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Like on other platforms, if the OS does not support recovering the state
left by the bootloader it needs access to MDSS_CORE, so that it can
clear the MDSS configuration. Add a reference to the relevant reset.

This also fixes display init on Linux v6.17.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index ff1eb2c53e7b865350d00ffbfa82d7d1e3cc5aa0..929c8a8b2d446505228531bfc55f3350ef2980b7 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2150,6 +2150,8 @@ &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			power-domains = <&dispcc MDSS_GDSC>;
 			iommus = <&apps_smmu 0x800 0x2>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;

-- 
2.51.0

