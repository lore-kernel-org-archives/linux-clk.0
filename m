Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0134913BAED
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713882671; cv=none; b=Q8IApu9wCQmQP8by1mniLzyzIchXgD2lmkTWRgChSY39n575HRBJRFyQdz43FDA11AhyC5cWrYyko6k5kQHGIJ0GYqV38NJatYw/3xho6Kb+D9mSrh7XA+l9qHCS0AYNou74waFSa114lnEvgWxIwvHikBCMnvbj+MW3K/sckzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713882671; c=relaxed/simple;
	bh=+UavbOojFmAIVuDGknU8MaLgwR7F3N2h7Re+qQZJ5JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2YEcCbj8lPFLT8Lz7z5QZnaHlMRIUK3lxT2R0IdE3s8NrBXAFpCVH6SD7WvGMItSvcL7OjJRIbpPjtrwhpBhNSSy+cW8ZKVn8djf/umue69ewFHrBR2SDrUw6rj6ZFRYXtn6O+uN7ihiHZXNPVa618gTwQ29NzZSgA8BfDehTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uOs3Jeb1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uOs3Jeb1"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-572256b1636so410132a12.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713882668; x=1714487468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IDPH8aO0C/CgFOvGahjdiLNFhkL4WdyF17UbMtaO6w=;
        b=uOs3Jeb1PBkFtWHue3LJysWPE/eiRq3MCNKtsJxYiuc7IaJcbHK7/KErEkfvXtLgxL
         gFI0NuAzJuSCOzl+I01w6Wn3b9GistRxrPz2nuTa7g3Pu6tF2WBY1FB/tLJsVKed2dl0
         v+M1sI40R28l+M2ckMburiyRR43YBJx6qHf7AcjSNkXwXkIiEDpBMYywSRWN777x5iZU
         bJamRjfIZBhs7ytAWOyLS4h5JOi7UFf1OlCzIFnRmmvr9rdtQc8PiGrs+2/84UkjC5/y
         qAyYNA9QiiTltRX36BP/DaUeigB2ZkuFHe440azSRtN9aBKBAviO6o+bYrUFIqwEij+S
         lu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882668; x=1714487468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IDPH8aO0C/CgFOvGahjdiLNFhkL4WdyF17UbMtaO6w=;
        b=kL7v3BBSX3OLFcbauLGFirJvqrbslkBfj9c485ppIZlRLV6Vu75q0VjZEO1DbfWhVD
         5krhRoteOk4EHrdT0fVY2sUAEKM0VM0Qkrg/5ME4ZIAW6BLXCDQJRLzk84c8m/dVKW/I
         88/B6bAO9B2okYrekA1uBFHUFtHlVM08uLUesRGBkfgj0ds/OydArH7BdPUtpWr1cL/h
         BiGLr4dDa0rutpGDBavqNhqMKHyxnnk2E2Z9nUoBCLAV27C/+2w+EMFi0s2LTC2cy3x4
         XktVV5WcSKQDqOhaqpyzL64d8YjjkAZgl5IE9jm18yR0/QKRafjF26qhPWjur3uwJlVW
         EmuA==
X-Forwarded-Encrypted: i=1; AJvYcCVYKrwRbux3giZJibxVQkkmE5R/+v/L4bGg20O8dXUs6MWKoDqjfAIlAJ1GWPiSzJSIL2RmNaGH2SdNOk6rgax9Jesd48LKNzbA
X-Gm-Message-State: AOJu0YzfUrVXwCggEE7l7+kANuGEbPRGcqtjLhMXuMt0fr/MAZ7Q7wYL
	4w6aVJIoJODb9fmcs1CKwMwlcG6dBs1yw3ABtKfBf8a0rlJcEuYgE+y1trHcVfk=
X-Google-Smtp-Source: AGHT+IFYZf3kNXrbsNynZ3gGf77a9GhwGcDNyKdEdv42OO0DXfASpzIR/lk0VyJPU+3cTv810Ziq9w==
X-Received: by 2002:a50:d5c3:0:b0:56b:d9e7:1233 with SMTP id g3-20020a50d5c3000000b0056bd9e71233mr7620642edj.32.1713882668343;
        Tue, 23 Apr 2024 07:31:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005704957a968sm6708099edb.13.2024.04.23.07.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 07:31:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 15:31:04 +0100
Subject: [PATCH 2/3] arm64: dts: exynos: gs101: enable cmu-hsi0 clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-hsi0-gs101-v1-2-2c3ddb50c720@linaro.org>
References: <20240423-hsi0-gs101-v1-0-2c3ddb50c720@linaro.org>
In-Reply-To: <20240423-hsi0-gs101-v1-0-2c3ddb50c720@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Enable the cmu-hsi0 clock controller. It feeds USB.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index eddb6b326fde..9755a0bb70a1 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1247,6 +1247,20 @@ spi_13: spi@10d60000 {
 			};
 		};
 
+		cmu_hsi0: clock-controller@11000000 {
+			compatible = "google,gs101-cmu-hsi0";
+			reg = <0x11000000 0x4000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
+			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
+				      "usbdpdbg";
+		};
+
 		pinctrl_hsi1: pinctrl@11840000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x11840000 0x00001000>;

-- 
2.44.0.769.g3c40516874-goog

