Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42563C457B
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865683; cv=none; b=ICgdPKwwhFmEqeaNrUjaQQ43M1MDulT2acVAMji5vVZbjJEr9aMst8aRHntJYQ/IrNNH6XxlMS45Ad+O7JM82Sik94KMT/PL5Jg6CbN/5+kKXFJXPi0HOTzmfFbZi3IeDyTIW4f9CjC3/nOwmIX1orh6UnTN6D2tlglXFqgnaSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865683; c=relaxed/simple;
	bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LelX9a4JIHwUcMxplIeBcxR+xe1jBaQNwkXE/Sr+YxklBbG/eGY/l5Ug0hZcj9mjqFzDt9AdDYp3HifF26uMQhU8eG0UT85nUNWwvuMBu1mBLI2IBhDQYBzwe9Phl3AnLKObsEar5mCGSjRqUAi8LvQliVxEQY3ZO4a/sM5XtSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4z+A1fr; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4z+A1fr"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82a655cfab5so4032419b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 03:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865681; x=1775470481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=E4z+A1frgD7HbSHpoU/RSKkChYO+ZXoZztnuNsgGGb6F/iEX5+tceagHHeXwaIJ1WN
         dECc/pyPwbRFOMMX26ez68MulsSMOGk6DhPbdy/DI11d6yZoEDwsug695MdKkpW3uw4J
         9T4luZrjzcK091v18+zAHyBKpXHFmlCm2I43OKgl0YSbL0y8CNhLLzUoxplAMd8gxcPk
         gcfVO/jOVPFzvXvjYovdAf5kV1xUXZ5YVGfmcpc6qtxeXjVtZQXdd6w3ESpUwYToAshb
         RKz7XQj9LvOdPdQ/k/UcnsGoxFkgCtyrB5g5IbOtP5geNn5zuQT969OJEVQMLDlIH2iX
         EW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865681; x=1775470481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=qkrGxOyFnHvKH8KYND4Y2OHw5WqAxRoTZhnKyQzB5U/M9PRR8HhVUn2Leh2yJIuY76
         cVIUL0B3+kD8O6F3HoIP5epBcMXam+o1fSYN4kUhXts5Wd3GYELCitn4W5xTBw9KJgz8
         WRkOTJxiF4CZuo2RxaFlf2+F+v9MEc6ardwUCZjVeIqcTP6lbHmMvMdMuYkdTedbqpOg
         K1Mhg4c3i21pVV5VxQLTOyr6rScEoitgiTchJZQklAZPeZNiZKIkRTSLeLFydQ9GgupX
         7DR0d8NU+5+cI23v0Dlwe5ULFC7KhHG3k2FHcHexNvvM203rUYKfKkA7VA3T346efs1c
         KTcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg7zBUDcQSbsycqEIPtR0Kp8HX9ULFiocgnBE9lgX6mC3fJIF9sLL1zCKu/pOUcQVmG4V/rwk9z6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSG5Z4GduFPNuNPT5s73J5Qlf/Ik1Q/QfgqPYCg5wscQRrupmz
	JGkeO/trmTTYW/jC3iYD7jU+RrRGKmcX+WZUIYT61haff4N7lm2OWP0X
X-Gm-Gg: ATEYQzymZB9ZCPLZyUfJaZXnXoR8rC6BS/lijtbF5z7tGB/H0+4cVICN4zbKUaBd9X2
	b9FXqtkzqcLxxD6DdSGHvLWAIYbK1ulsj+TmsyMtThXIGEnALX5UWDgzT/Dq/OWxCjlviBwZZfw
	VM9PwntsA2QrZ5ehGgIyS7gTO6yeIOMyieRMHDCVszfBPUkj7m1A4AtzlJkt+wo/5CBF79fyXo2
	51nPeayF+/VVCOrVmUC+gIaz5ZDsVSL9dl7x30alZvDAPaEiCXm9ws6LFz5uHhsOwyV7d3xqWu7
	09QiRMvgFWp4hjWrkH0L7xznwhXvP3D3KuRLaINfSuTVzG62G/BHMLRABm1ZJRH0nVfkEDwE7kt
	Vb8Kbo/OqFobFBqlHvbO6T0g2zTOuEqqH2NTcJYIKqS9ZyTrn2rY6gTgJ85EPsaJq7P5LnOHKF+
	lHcI7TzA3aAZZ5fonDX27VC61wZUfFpDj1cM6UYrg=
X-Received: by 2002:a05:6a00:9a6:b0:829:86aa:e163 with SMTP id d2e1a72fcca58-82c95c16692mr12268865b3a.13.1774865681008;
        Mon, 30 Mar 2026 03:14:41 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:40 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:50 +0000
Subject: [PATCH v3 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-3-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1039;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
 b=LS49TNAgLyEV0MUfNYzBAWrsjMBXYW89M52LKh6tWjsnkPwI06uo8+pPm/rfZlnkSJ+nUrkiJ
 YfNIIlAMjLCCZ2/KOG1g59f47bu7VFvehWc3ihP1+UruyFKJPSTle7C
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Enable the vibrator on the PMI632 which is used on this phone.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..88691f1fa3a1 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 /delete-node/ &adsp_pil_mem;
 /delete-node/ &cont_splash_mem;
@@ -115,6 +116,10 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.53.0

