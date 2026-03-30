Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343FA3C4569
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865689; cv=none; b=I8pGGWdinqC/8txHlCA4SbkaBVqAyPJTUvvZgkSmVPlgL9BKtgZEpoNTbNNorOSSv8ePVw9GEKv6saG3zbVsjUucn1TJBaAOdVF14+BvfJM+nXeHWUGy/cC+5xtBl+LSl9TFQAUrTcfnOGnrSQZUbn+zhxGs+UMe3lJpHDvDxA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865689; c=relaxed/simple;
	bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXZ7/PZY1IgVqFWOzj2+QH+R82u2DyA+9iAyRgVXFJSSPy4SPjFHe5XXSgzPT/t6PM0KMtNfrWFfYySKLCSSjNPBQbGVXP24Eeb9GheGeLCsbn3fjFDyOFjsVb9udglK7LZbdmO18hdJexbkBAyNiUOcVABe4wB1p/tsBCDXbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOQ8DK7L; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOQ8DK7L"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829ac4670c4so3151317b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865687; x=1775470487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=TOQ8DK7LHT+dBVtzFpsT7MCtN4AEWwLZY5GekTQh/Lmq3okODfSpxJIUYzCFsNVchC
         +tMEt3vqHQmbltrfgqNux0BPC/LozqtPQj6C58of862FhdnxlyV5VcD7qviGkKErZ3/V
         5DboiQIwZgmsvSzTjsr4L+m5DT4Q9+ehzldZ7Bs//0xMqlGdtMjoqyyIrFWbPZjgQePQ
         qf5t5u0bi2LnNF2UrtbGTeYKRFeqp9Ad0bziRXSH7l3GDKuWwn2zea7XD45KYuLjzhl2
         R84IU++cy/QTErXZfQYvJC9Cnwbi3nAoGg/qGevJ0R3TKYd4Vv7B1l34EtwQdnUWgoM1
         OzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865688; x=1775470488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=UJVtAnWG8CUXfhalfekuRwyGLDSdvGDufKgU4rXBCHVwWrVK4rOEYCrye0wISUcptC
         Jy68UAT3KVee56VdWCZEp8C2/q7UV/BhK3CRaOLGuoJkAXkhLcdU7P6WfHr+l+P4insl
         U8i1SUB6RvAjOy9XyAx8qGUVjb0To32Cdcm8JpBVBw7XhYjEGaNmkcLQFGuf9Ojj9P+C
         4Ijp/s3mey/XRL0MRtlwqrWbX+X+0nn1UPDXJ1wuBbIGOjg3WOOxAyLu22S3zO7oafpV
         OBVlaIsQ9i7ANwWrbPa8PGH+2ogbD5cvz62xAKgxwY7qwPakkNdKMRPmmb2x/XM8UG1O
         ZIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHs9O/mNj9Yrb26loZ9NOBhelyhWhBVwx8MyvvHNphy1IZhPgcqqxbM3Pry3l0mxcAzmQCKexgpjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNMzWx1J3r2owH25pv8wrmCWYXg40xsg91kLc+AgM4kx7MqZzr
	s1rtdtLtnqrz4ycbsyO63UmGkqfCGtE0Nf2PZNkD6PbgE8waXfSmGlkHrzC5DkgS
X-Gm-Gg: ATEYQzwEaVNU8Q4Qow8AnW77XDKQAn2RTjiLKBcxf7DslD3jnU5VOCsU4PanU1SwHej
	Bew8sVHfKhWL/WlkwBfBw7shY4+lJnKIQuSsmroIiqhZzAELPC1fjoJsucAZP+QXqzIw0oEcohs
	grjUhyBauf//0slgxy9c+UiID3K6yk0LDBMwq2OTo9F71ryRI4eclAiGRIip8lyUfYNdT/rW20P
	92q+SjTqnoM4zbj29L/gau5a8nG6mnuyRVvgqsbN6oRUB+LRrQNc9gj8ngrr/IJJbS9nz/2qf9N
	JyfG7PkA5B43lG/1XBuS5GdWAvmDyFJdLn4/kL2t0OzX9vJfxDfMq0MM8eSBNEX1gBKIxdkwArD
	finnhMHFHCSd4YglDs37aca8q+N+EgGnz6sB0snTGVy75Ps4/f2ZUiH6+ozSyjOkR4aJHnL7S13
	jq5VOcL8AFv6wyCmRoyBauQvi28KYg
X-Received: by 2002:a05:6a00:4107:b0:82c:20e9:fa53 with SMTP id d2e1a72fcca58-82c95af2c3amr10551087b3a.5.1774865687558;
        Mon, 30 Mar 2026 03:14:47 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:47 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:51 +0000
Subject: [PATCH v3 4/7] arm64: dts: qcom: sm6125: Enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-4-c4b778b0d7f8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1049;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
 b=iN7WUR2JFdKInanyaJ1nA7GlY5aCbeqHHyFtVL3dnjBxgeZPO8T73QxVOJKURbwx2GR+gVJdr
 PY0C+yTcSTeBAULpEXuamFoFN1U6WYjq0Th+2JdlIdUJCkN76sfl8CA
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index a1a296f90f44..d26ca1637330 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1241,7 +1241,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0

