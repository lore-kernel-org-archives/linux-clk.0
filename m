Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED4C382F2F
	for <linux-clk@vger.kernel.org>; Fri,  1 May 2026 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627135; cv=none; b=Tmsgau9iSjChPaP1kAjgTAS0f9Fscq2z9JJ3CvZ+rtnHks1jT9cMcAN+FyRe3aBIMWId/A98Kzode1A6DNVBWGKQq+HJIg6ktbIpG901BrMAWqMF0V6h5TVTJEAUGLUFjbfa0F1PLo4rP1oJ46oiinlNn2nBusDihu01fZRuxvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627135; c=relaxed/simple;
	bh=XcfJhcCYTkjzBCvg/Cxuww7QqKifGaagi9xIyyI67cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o0MxbsHXWLZ1EPxlqyroUt1yTWnb1eGdeZLLVRdBb+Spi4aihED9XcwxLI6ZZS7OqvoHEoNKoqps08AfbVtaOY62ZBPpA6etw65uIxFro8ARjSMbkEScoT418IZjFXYod/ELhUOBZv6Kka2N2wyOVkblIAugGxLQklg9ZoZO74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UmFMgQ38; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UmFMgQ38"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1395076f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 01 May 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627123; x=1778231923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnuErBRIZTrfkelR+38i2qfJhgtaQ07JLYCEdmx/1ig=;
        b=UmFMgQ38nVJ/7i+khKEJsxD3GRutbNe3PNGcY5YY/XzZs/AE2Hp9KL50iJ9hPe0S1W
         NlwTiiQ7eYOMW/uRpxKHacoOu8xkBe1f0bur6yjdfIuCUTvEAMcMBXZi2zVathZbyIjc
         qW0GdJPpqhGq5dAGfL5gEh9D5hKTBantio369Yh2ThDrwHpFEzQgLXHfw9nBUKxyu0mD
         cmuNxQVO5CRhaKrxOcjyK8rVzAE2JIowROne/CiskazjT8W9iGu+cP/+rEPBAdsInZkn
         TFfWO8PHzgRYjqxFiLQzYUBw225rZrDdcRu5bR9OOS/tHShTVQhokAkAVzdHNLuAKLv+
         Q6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627123; x=1778231923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZnuErBRIZTrfkelR+38i2qfJhgtaQ07JLYCEdmx/1ig=;
        b=UvwHAML16SYUY9cChveqNbE4G+tBp3mAIS2SlcAjhTO6B+jdo46y4fgTRtZOzK8PIw
         UjFiQGUVnZzOiL+XdEFh4S7Bo69fY+UoCRPORwlEgzO7x/giAzixZQH4D/soBb1o7RNg
         BcduqppcXg93kh7wIWH4hNwVMMdqrsJMs/5m1w8gLno/RV1uET1eKLlnPOjTsPHwYQIE
         Bllw6I1kHxWnqraIdY3zLJhB4ou606Py8QIKJM2azu1qU50Svbm6Fxy+x0lFGV8EQwU1
         8qN5GjJH+e/mX9KzxhAA6ELXS2RE37T02Cwn5rwXjkFYGIAowm8bArH6kLVDm8KsXCDY
         AcwA==
X-Forwarded-Encrypted: i=1; AFNElJ/a2Oo72/4qct0z/fdFFT0cCz6B73x2IkehSfHaAUVqdPcdKzwpspZMjoOZAJQu4BFtdnOvzuxLl+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpuPM7fSvBRXTWwTTpVYSGx74RX/mFxe3/W9iQLIkALm31KT+u
	KoHE7xlM+Z7a+6LGqG/X05tIAvZ7PAqhlpYqhJHYDftCycLrEfNn9R2dbSKvJ0nGY10=
X-Gm-Gg: AeBDievOzRXy7SlRbweAkL07aGO6DnR17LtdY6WmGv4XkvWgftpm9LeFpWFrQgrP6hQ
	dUjAqHDElC3ckUxReOUVO8LwbMTjjxy0w3FzeIvVr1ldjFc3iosGt6Fu77LxI0OfRiL4slfnwkU
	vvKMd4pATSbUIalHzjCVj+yVrkEDo13teXe/pPjVRhBphlfSifSEErn85PNhMS2gkA+XRl/8IY/
	i2Iu5YsTV3Dw1FnEVDPhgM1zmOxtsmXArLu73+EOLuP0Y2FLWirPOUBU4XZ1HIz2epfAMr1bQwb
	Mppr4vUpDh0/Nj62tHOGU+1Vf259muaIt6447yW9/Z1k5C1h8yD1j+uoW5Bam2fSypRn+2th14X
	bPmpJJGz0WiRz+YRgJbZovHdMxmmaJr8GTxAswmnGgo80wLsxQMv/c2K9v86T1kuejtSDRvG9BO
	YKtobMUyA54YGdlAN8Nt8Yceg/qAU+vapC5YRQ6jY6+8qtPw2J6nC/dZqOEns3Jj+HKa0nIUEZ5
	XGBqmBd
X-Received: by 2002:a05:6000:22c2:b0:43c:ef4f:79dc with SMTP id ffacd0b85a97d-44a857c070emr3502853f8f.8.1777627123520;
        Fri, 01 May 2026 02:18:43 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:33 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: milos: Add interconnects to camcc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-5-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1001;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XcfJhcCYTkjzBCvg/Cxuww7QqKifGaagi9xIyyI67cY=;
 b=RVgZP6zl4igJW2UZF4EhCIuRsywJ8TJPAYhxRoM9TMx2tC4OgST/C3rBNwMdp80Ll37kF/tYZ
 MYGuDVYg64VBfwf+ZTJzwnsyd0MuFm5A68MD5NmQcV2KBVshRvgGaqL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.

Add the interconnect path so that this requirement can be satisfied by
the kernel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..80208bc33730 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1923,6 +1923,9 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

