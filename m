Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B652A27FD7D
	for <linux-clk@vger.kernel.org>; Tue,  1 Jul 2025 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390941; cv=none; b=sLwpK28oo4B2tUX0HR1+3y8C4T6V9pIsEGMrjimi0Ebz+2goZrkkSYKi8Ebv0yiLcBXBQkBHj+NknKI3HeRBgeG6skO31DsEQrYhvPjVSZRFSCHTEIqLyTHQqN7Htg+g356Dqi0hbsRmMPbn6qD9EjIwGIwIqBQE2CaB/iYjwoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390941; c=relaxed/simple;
	bh=lKLvoCVJRgutFe2R/Rd+FFb6y/96aAw7/Kdifm/nYNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qbp9klaoCbD2gXpkfHdeEIHUe4yxLNxhx+M/kXyW+zDcyl0sjA+Cn5HLhlAcUf4fWheRGDQP/PXL8/oEFLG7OcS6Z9GO//+1jvuTaEeOrxXPo/z28gpSI/0Qw/LAVwlk5sqVS8c7VWqauxM0yOh9V+kDR7oTNrjdTMRFU6q3BJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLiAdaZe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLiAdaZe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45363645a8eso41574945e9.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 10:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390938; x=1751995738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLYmm/W841t/0A2F0oIr72Kx6VbF3J/btLHJRobqvhw=;
        b=jLiAdaZeofVCHtmtvWsRHEwYNpFYRg4aDjMy+MXNKVX8dg5jDOuhxVrqkxGHOHQZF6
         Kkq3I1e2xBZ5biaBNKBAk9O4PD/q+xzxE6o5ty5bkVIReFjRR52h+UctDrtj2e9cwu5w
         Oc6ucocKQnittO07+M9Rhgscw2x1nJbY25YH6ePrd5iPLSR4LnhLA0ZFCDrXGJZd65KL
         vexvO6NBNbkpdvzKXW/TE9H5L3l80UsJObnRfAkqP7nWnydGWzrbxOztyfL5tErAu3As
         gMun5iX9PANcg1mABwj1yaIO2KJkBDsI85OzoMKlXCZucf/PZ/DrGblFlJvBUZzCJTAW
         FN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390938; x=1751995738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLYmm/W841t/0A2F0oIr72Kx6VbF3J/btLHJRobqvhw=;
        b=JkSUQI54YO8X9lnyVFCUFP6QQTDLt3hOBFIVO4YUqFELeyF3Ch+fgbEcKRhGO730V0
         Rs9lJFLTAY6MGUJFC3Y9RRGkWHQdhe6LVFSc757PASHar5XKOlpziUY1Rp9CD92sLr9K
         xWp9fFqHFPJwVA/kzPxrrWOlApIjg/+ZsfbUw9Q4+UGYvTzdFRJSv4RJK9vc/JmgwfLy
         daNOIs4iDyVnho2hsBCzyihXfxvm9KeX+kf00zrFXD1nQ65YHXITkhc+59fJkBtJs6he
         rf8dN/2nNxRDRBQRw1V65+fMDZpBYOZ16OEEiT8C6CgHlR91tKmKAdwSjlEH30cbM3jp
         iPvA==
X-Forwarded-Encrypted: i=1; AJvYcCVYaIctmcKe7Xa+R3sYaEGDWsYfuEzN6VMbxBzbGe4I9sqPpt+0Dxx7uYxm1Ottzuy7dZ2cAphCa9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX2NJ7I1Qvz4R+eloS/j6XI2z9G5jXNZMrobFrDr5LPfxQD2Yr
	EnNrgk+g0FfKxL/Yh8sCQKvdy78G4zba9YIr6epZ1zhPXD2I6C0HUwI8PlkGlCmKECI=
X-Gm-Gg: ASbGncv3Otej3aXEIBHjoJqNtreGWfCiO9vbcBl4JvFsVpmjMLcmV9pUEtSQRJpPGTi
	qrfNGnIdSnn0VLgjrVQvQ0PabKrWAVfV+B8YAO/84k2KUxqbcMBSlRPAVfSXtF0CkOZQBe3WiB2
	GY+W6jZv+PR8GH9JP4XTY2rH8H+3tOAYFk5FoCC+cjuTx4O3iuQU6RJ+PXtnLmUIVCxlLclAeg8
	8O68Iu4d2l8Mqso4GQul0/sD39lCMfXDcSwBbPN3m3igbJSJtY6Xd4MdM2hwYXyvLu99mwQKOlE
	bIJzDRtLvo2gLfpwVefPMVFRX4tSqmKFSfKiYMGUE7cs8OW3fQ/S/cSVpEmN3V1qvrXyb9hMNYA
	KDg==
X-Google-Smtp-Source: AGHT+IF4HQoWvaoo6s2knilDjvFtQ5l+MD7/ur7mX6jo8Z4Ek68Oqu5P27xeS+nao9YYpdCcOso2Ww==
X-Received: by 2002:a05:600c:699a:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-4538ee7122dmr218050125e9.31.1751390938018;
        Tue, 01 Jul 2025 10:28:58 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:57 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:36 +0200
Subject: [PATCH 4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 video resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing video resets that are needed for the iris video codec.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 include/dt-bindings/clock/qcom,x1e80100-gcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
index 24ba9e2a5cf6c31e6e88c682e6bfcc60490d692d..710c340f24a57d799ac04650fbe9d4ea0f294bde 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
@@ -482,4 +482,6 @@
 #define GCC_USB_1_PHY_BCR					85
 #define GCC_USB_2_PHY_BCR					86
 #define GCC_VIDEO_BCR						87
+#define GCC_VIDEO_AXI0_CLK_ARES					88
+#define GCC_VIDEO_AXI1_CLK_ARES					89
 #endif

-- 
2.49.0

