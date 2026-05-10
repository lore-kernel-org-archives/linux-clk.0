Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7142D7D3A
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406480; cv=none; b=tdx2dobTFNdV8+DZ0aw/M1sHvtPZxdNm9Emysfjo3YRcrsGVOnBWI5jPh8/9bYYHU4EZ4cjICWrrX1S3rKHAOo012PWyH2qOQHaY+SXfynPzdy8VkugOV2ZJHyVOLIp6OZEt/Y8GvVBV59IjWO+iyMX/7d7s/wctlXKG40AtsHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406480; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6FUpsYEydFwxx/fyYPIg/rfSmQWXAYtRUS6LETMMzKUp96uDP2ReFC/R76gnbxHsmKytsiAfRjbEUADXPAKRJ8xOoR8XFSxgd21+x18G1ljY81EKcmbP6GxqFOXwtLLl+tjH1LlMuCEkZmp+/yQJQypP8MxRsjowl4t1tzHaTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgHH9C5W; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgHH9C5W"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso31708905e9.2
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406477; x=1779011277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=pgHH9C5W1r7uAze3oD9RXkq7C4L2qTkllI9j8NHOP5dMkE7QRBAcksEfIqDzZo41fb
         lWJE09f6krDQe3SMCTt8nSkVomE8m7EFF4qY34VHpt3UjE7n6EUneYGLIxBjVKlR8iXJ
         SLLnp0TiMMTIGIdo4cHH7DevFUKGO8+nfeA6/NjjVQolByY/wdsm8Mx1IgY2ziARgy4n
         z/w2vE6oV25FC60Dmk2fAYvJk9P4WXfFqSsXXzNPcWmH5qatiCVAJVi+vI7pVpVPlgXz
         Tcmi4uWKbPpJ77bHxWLA9UzlA/DPJoEmMPbsqAEoENNkm7DyuFeD8Vv4CFcJfIMXo1w6
         K/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406477; x=1779011277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=T7RMaMTGnCYZpCyMp3hIkVxq7lI5qQ6fg9aAbFemRocKAUccIYqU+KM2+NAVpvPPA6
         TTx1ce5RlItgvJzPKzdzqnIb9nW6R0KbsGlXCkM5bUAXYVn/3KWPWN1g+RTWsc8KpHLS
         mMENLms8Kw6WRkyFUCZLcHofPbdTca8c/BSKrG8RETWQ6I4Y0tkBaEMlP6M4hVJD0cl6
         3jZ4O6wYBgW51ZpOIJNr+8fwXaiAlG3F4k8xxThtylWKy9WBQBkD5xBSUC/2IYdYfKqv
         uy36zRHNMQh8Z1E424HoN75FP6y5F1ZHRUuIaqPT7UC6npWnoTOZkIwr1g3jP/u9GQaj
         W+1A==
X-Forwarded-Encrypted: i=1; AFNElJ9dv4d0H4wngN7fuxEDXAYaNedCF5BI1/G13ChJE6XEI9dstrVOSONIYRD5ryy6OUzW/3XVqP01ixg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpT0TtSbf9qRJ5WwIFC/FjDPuyIfyMtAUXpjQRZfxFVdMG1HMV
	UGle7on6iqxpVu4q0CxXX4EAa7Vk0f/440vE/06zBNz0UIFuyqvHzIF8
X-Gm-Gg: Acq92OGYz8//8OctiH2ZRfiBzE2eUJgOekgw2vUupdO7n32S9KZyI7Bb9W5TPDjmufI
	Ah1PxLygrUEBEubvBNTonF3BolJBOGtoUwdvrwCs1y9lQn9X3u6htuNxZ2NOc+hDEq3h4ql9fUz
	H5McjbeLHUl2TVOLiegGyQuWX6llq6aXC+EOX78FK3Dl8fQln2lhNinjh4uKsf7AlxurtYtqd5c
	1+n5KKeexs/6FR6zGdf0X86PygHEE5Tdw69f9Dqd14/j5NPx6jKQKlof4So+U2LgE2KmF4hS9uk
	v36UvzTJT/kg116xy994rpvuyhc389ZTgc00K1GRl7b4oeWeF7jUUJM+yKdpHqPWI5OQFNCiaR4
	I7HN4cEXCMum+2ZwkY9x4qvJagEMaWdVyDXxtnv/aypaSG4CLzsyulBy4CgPbQ3jDLe9DDQN0Lr
	MfOTqATDwIsD1SDn9Wuzl5MeyGgbYm1qkT+9hK2vk=
X-Received: by 2002:a05:600c:34c8:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48e51f2f85emr346982995e9.13.1778406477218;
        Sun, 10 May 2026 02:47:57 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:47:56 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:40 +0300
Subject: [PATCH v6 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-msm8939-venus-rfc-v6-2-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
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
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
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

