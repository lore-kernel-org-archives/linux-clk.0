Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548FF41C2E0
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462066; cv=none; b=Dj5rDujWrHy8mfEuLIjOL0+Z3uqiDhxqyaPgoZb+bHt87aO6iJLZ3waptdKgL0rhDDdjsM/LrCFAaPS8glsAXWq3tYLK4w/V5fifEH8DX1VpxM8K/nLOPfH2lKXukJ9ORYl5CwQd27WvyxmZpj0h7zBbisZj18VGouBeYghO/20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462066; c=relaxed/simple;
	bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgexM6WpF0zzLQd7iOq9TyCGvIM4CSZnWog/2EZPNPdtjLvBFWp4AWmKy6N/7V77L0QTDXYZKWyUOvi9l+5i8JP+ICX6DtLOtaXH+/6Vhbzd8fFnwh/2hhROk9PnHA0z6uBJea/rX0O7eWnfN7rPVWzj17pvaz1+goCyYomqfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHYIqblN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHYIqblN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad617d5b80so637305ad.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462061; x=1775066861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=tHYIqblNKibm5cLUS1Idiub9GVxPrqxSVVf1YfG+4c3zcQ651oYjnBA4CspMQAM2CW
         6/wfbGv/cBor2JhzvZTzC00XVL2n9GdeYFtcJO6THQunVkKlLCK82tfQpE9fFxMNhCjl
         vB9HT5aenL6QkixQmnbfOU3JEl/mvZzjCLHxyuQOvwy2wuLXFkB+sG7tWoXGr2vrBLSb
         32bnU59RYITv5/wPfN2Gs7LhPc3hko7HexqfRoDmJZy1yDGfPb0DDtv9T0Uoil28y1eE
         CF8imw/m6+yJESFyDc/GiSf03zfewaSiy/MJy5PWsV2wFW1oozWk9KifrFhzv7/KE5e9
         Dvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462061; x=1775066861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=DiIekaj61fJJaGLQ2pDZx3VPXOJOF1VO3LtOfdLkLml6HBzARE7SJEY31l5efGgUr8
         2NjyVEzxPqKQLj0z0NUNCvMD1MkgdL+KXPpRie/6jBMScWXLxi8fBEPqnNWds56DAJ0K
         2bil9NCFcaI8Rt1G4dv91d2X8I1ezBkA3iStYDvU1m51GbQfPSlS+4MTr6gCjkOGnkI8
         Pze99pcxYVj8VCLC7Rqnj6dwAU+UjvgWRiVFmjpxJZ4ZMjFxkcfdYL+nyVeQxGWNPTGs
         qTDmFCLRB1uhERUhZfXLTpFCQv7PFzIm7IJiFg95Tc2SIGLqWV3TIQgdibS76AEHZwLg
         jk9w==
X-Forwarded-Encrypted: i=1; AJvYcCUdGVhbWhBEhFzxYG5VDRthv4Tg5TvcAZo5Uc7ATeWRl0hcAdAUJ8wSi7PVIBy7ZNgdnHu1WkY3cIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFGyabjvE9s/t2fDukxneLuPcMWb/5Vk2LBpV4hd6DfE3wWjpI
	twqcC3THJItcRhzgseaH8AEEqguWUNqnWNjSdgoZJDQraR+Nrj6mY6pH
X-Gm-Gg: ATEYQzwlKImVsO/WWX+wI8WSGMTctKKxGZHNvb/03h6wG/sKCZFeStIYZlPI9iBZJ9r
	pygWkHjJX3Y7SZvNRLPYZkoi/+zRi7OtHz3lCzMpmCCWTEJvAOYuTCt8DcSe1zcpwANbjW5gxDo
	MOxlBTHb59nZF9Ob9m/JyySNUdcilH25798YlBy9Dai6tu7MJKVw2H1wer/bMeHVCBrH4job6FH
	hMDBGdD+9MQteVDST21IkoyPAHb+/shJ9paluEEHjjzL52NCpANI+qtgxpyZ25hiK0p78QOqVyN
	4Q8SNnZ/dDxcVINE/RD9pE2/gUOUnV8iv2sW43nVwkvT14Mp7eXBtKy+z3p2KL7dkdNy49voDwm
	8zMkhYqjsjmazQZvvig5uI2zJ0xqVWApXvnOjyVpbNUrfr8oTfoAKTkDgE8/7iTSbWjWPh+rurk
	vemvgvrIZZkYu95BjRXG84K9dLP+LE
X-Received: by 2002:a17:903:2c0c:b0:2b0:60b2:4dc with SMTP id d9443c01a7336-2b0b09cf4e1mr49434745ad.15.1774462061252;
        Wed, 25 Mar 2026 11:07:41 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:40 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:24 +0000
Subject: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=909;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
 b=/L75YqmElCivRnT3k1uY+DoU66iVUSy3psZfDffVjcwjfbXXx3kMslkg/jC4xSt8hIUlX+8px
 cr1phXGHRqIBjatTcmFRu41sIUd4E18nCR3eVSb9rAUz6oAxWXP1R+a
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Enable the vibrator on the PMI632 which is used on this phone.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc302..88691f1fa3a 100644
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

