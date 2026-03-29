Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC40F84039
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 04:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759711; cv=none; b=pxFs7ZEERNb/X2PzYvobUgGENsfsxzOlhM9aDqNkwpLsD4fO2Uy0ffJLlZRzQgXRNkm3H/tOp7CmAEbyXOkpQ05F3mFCHDj8iXKszj9ujlWNWTFRTtPn+njmAc5fbD7dtb7h6rgKwmBP3WzNM8Ko2s+MKTGyNoQx8VRN0uUg08A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759711; c=relaxed/simple;
	bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JhgvBa6hSoBq+sCbAe4S/vsjf+d/sGMK2TdztXn2OfOBQttytZanUqMBPAq8Z9T1UlDnQTmvcLALxSU2+mKuub45AYKHjlobIgxTR6UmrtPdksr7bzljlIXU4Nn4eV7Bwzct5iOpYJlOpYHZD8xso+EqlZo5xPxgFP6fm2gIK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiSFP0Nh; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiSFP0Nh"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c70c112cb61so2195441a12.0
        for <linux-clk@vger.kernel.org>; Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759709; x=1775364509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=SiSFP0NhBAJmtHnRK2BBtz3Go07NRQ13nWKVqMWzf16AJC/Z0DSvJAbFA0DXqed1LQ
         o0OjDbJFjinHM6gFTxGD5d7FxHXM2q3dsk0Ze21Ba2RoNG1xuyHfyS27f71iBfgAeFDa
         +gNwIbtZ1ONfXllgQRStXkxJvDU86ABwXNK+iENAUl7ybpVAW45yiscaJaJwu3VIK0zp
         cPaZJOYKXzm+omic4bL3rxD/7TxFrNHqtll9zsubjqn70t6BcQYMPJ0gPo0MP0KFafSM
         3C+q4GtoTYJOBAqLA481D3PoaBsOOI1JWarW10RSdvjgzLtdhCicR19mxKW1JpzZKfHW
         v9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759709; x=1775364509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=DkWvz+fe5z1Uc3jra5vwcW+dc26o/QPqWmTqfNRoDIEWlUWupBiowehMlfkoGgievB
         W1Eyq0OxrWIxEmgNcbiyC0pjsu7nS/FWFhOFhpHMogR5+VwTH8159OQF7nQ74Myd19T2
         +rCLl1UKfZ0CClhkqxJEECywNeQu1CAoGWw/1lZdE6F1MoSHYksetSr2YobKBOoH5N2J
         YqAvPjxPn/pKVCv2552hWVPoOCzeO3pXnUjmUr+35Nzs7wIpP5lXuKOSD8hO+K6xMC4r
         YVk+uIvYrlyjHKxj2jPE6ZqNObirNunTyzlDoSLKAklxSEchdDkaakJDJr1+C1eAMgC6
         FidA==
X-Forwarded-Encrypted: i=1; AJvYcCVZEg6O9fsYI08ayWWk61XI/h2mszuKquX0ZIKnoEhuZAw0NH0liD7vOzCpI+s4cfzod43qOUadPlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXibRsiH0le/abSK0V9oDF+bmHDuMFBECblxJFIPWBS/DBgH+i
	7RMtVNiH1R3Uy0Xegp6AsSYI91yiIK7+Y24hHuN10uJnPgvK7I1ywT+7
X-Gm-Gg: ATEYQzxu+MOOugERmgifQXjH5HJgqizbP9gU2WuAbLLphpVKHdkgpaFvjZO3C+7Gd0G
	yHdaAMihV5CbHjXCnjpazqShgOcxCk0cqX6wCRN1oggmtni6b15wKCL/UHWNRp1wwzhkRoLfBgI
	02xPTgQ+u4WgIaynks2028sXW+BbAtC4F+ajcEYaiWHE7Jzkbvm7UDIrSAunDBTaQnRt7/q+x+9
	1JcnPpEzO+tV/jCUd9CTtRTDckuwnBtA5gFmpeVmoHYB5wxEYcSccJB+Y1HNUKeqNK1f0ZZdKuj
	l63tDAeW9eBkXvkp3Ng//bPj1wIRjR34ii2sWQRnpe1X4ioSMoS2CPoX1P3vVxY3rinl+Hbl7sB
	gmr6ooNNBjesYGma+dIWAzI9PYjxMWCdWHKY5P7MT5TAB9AS7Gll3mpibNjMezFVdZk0GkvKrXh
	pTuT74ZaLrloy0eyFEvXC9n+MxmDLe
X-Received: by 2002:a05:6a20:9188:b0:394:6344:e5c4 with SMTP id adf61e73a8af0-39c877ea332mr8300548637.3.1774759709300;
        Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:58 +0000
Subject: [PATCH v2 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-3-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
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
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1039;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
 b=ph9fTagfBVXtK331HF7XaRKTIzItjVo85alsUFGqPrhIYNQAXctTJbC9AbxZpAXzv901QbdE4
 v03zR55ULznCzUwTjppN1GV1PAgNPMg6p+EkNIgfHXbZXAuTkgnD9xj
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

