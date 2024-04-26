Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E9114290A
	for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125793; cv=none; b=I2g5MtCntzvQMephdVnFs8/33uK6kzM0dv7aDhMhi6sIL/du0qyUQn203sv51K6cCRkZQn8OECprRagdvIAd6FJ3ZXlqCYrQHjeSUIYwgbn5GEqIvnr+FJnCcvtuFv3BwO9Ntf9cRPUs1L7PragFxncee8f5WtVc/iTP9veZmhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125793; c=relaxed/simple;
	bh=c4GAR/VHXiSuWKUBHE7VoIKB62u9XWyDx4j4aLii5Og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQwWKVOwRcPVapfPlPEXC4TCG1zkyBxxn7E/a+DIwgSDES7pZOjy2LpaOE6nbD01WRKS840f42TBSu5i6ZkmMA/4wr77MDq0oZnJ63Tl0qwEuAInDhgFTM5i8md2Uki2v7uK2rT+CKzRvwb5Sc/TLin6v9PEFzqFTJImAnMOZmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyBhXGBh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyBhXGBh"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a559b919303so255543966b.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 03:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714125789; x=1714730589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DZKoeYKhsS0t9QVM1EShX7SrXXkb1dkzX7KrV4eN3Y=;
        b=MyBhXGBhDHwqeqw8NqoE4msFUH0jbFhPkVNdANEysj5UQsVuG/QjyyPMUB3x0jLLA9
         HmbKghfOaihTDbXjwmT+c0tmil1sUI2fT9XR2oYZ54bHqS+KXa49J/v1f77HBHo9mHZH
         1dXgJ8dAatqhXngo3Z95Sbh8MzhB66Z46adterRLKu5suQKWJWaZ6dEIq1KP1Y929lU9
         +QFCAkKORbclL3L3/HuouwgRat/0v15GXFeyXMHiyWnv9TjU/ZxqGQTaJHLFyOgqDBEx
         fbDw1PNtV/A9hhj7NZP+0Dae82beCiWh22LGLFDq7wO6uRqrtw149b/eOqWJC4YblgBX
         +yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714125789; x=1714730589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DZKoeYKhsS0t9QVM1EShX7SrXXkb1dkzX7KrV4eN3Y=;
        b=V0Pq4Z0yqBcvewx3heUzl94zA3Zu2DVKfLV8DBbXNuTcYNpSkk3195d9hhSO0+JMUS
         J5oTM+dWkS6evZacHQsX5HlqZws2+C3i/xbI3r8Jls/Ym0Mm23+SAS5P08C8MgPrhwi4
         oRsmYMKIJaSJEL2rWu4q1QoK9gwXFxo/gBXy7soB6y77g8rIHthbsh4UmrlxhkA5HqJh
         BuayhJrHUtYP1dm16Lu5nvBMhFQjhZ8YX4gfZDCycAojJm6PH9tJf0XhUmyYZzWbhXEI
         /tscPM/tuLI7e9B7NEdlnsc2KDx/T6zUtCbUQBCLy4CJSSp6aGgTY/D/lzj6lj2/lV9j
         EoTg==
X-Forwarded-Encrypted: i=1; AJvYcCVaj1qoAdYIqEev4NfFpkN7FGe74/HW6Qa6k874Ii4ylZYxgViGtHWEreGNbZNfiy5fhB2Foh6rQmGK24T+UJHVyb33Xmsr7qjP
X-Gm-Message-State: AOJu0YwWp4iBL+EWKq7OWdVxXf3rAX5BvsB7fjYmbarOS3U60F5Pf3ne
	yes8hlgpnLfwN7N+GGIOj0nKvm8LH6Z4BFAt3OTb79O9/ztpOEfvK1hQFqjVBTc=
X-Google-Smtp-Source: AGHT+IF8yC+P3Xjtk6lhWRIE+HMMTo1r+6sopk+vF5M8rRyByCwt/vcu3QmI793r4Uhlx7cGlfzr6w==
X-Received: by 2002:a17:906:c451:b0:a58:c54f:83fc with SMTP id ck17-20020a170906c45100b00a58c54f83fcmr1674104ejb.9.1714125788406;
        Fri, 26 Apr 2024 03:03:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b00a555ef55ab5sm10417289ejj.218.2024.04.26.03.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:03:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 26 Apr 2024 11:03:06 +0100
Subject: [PATCH v2 3/5] arm64: dts: exynos: gs101: enable cmu-hsi2 clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240426-hsi0-gs101-v2-3-2157da8b63e3@linaro.org>
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
In-Reply-To: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
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

From: Peter Griffin <peter.griffin@linaro.org>

Enable the cmu_hsi2 clock management unit. It feeds some of
the high speed interfaces such as PCIe and UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9755a0bb70a1..52be951ef4fe 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1267,6 +1267,18 @@ pinctrl_hsi1: pinctrl@11840000 {
 			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		cmu_hsi2: clock-controller@14400000 {
+			compatible = "google,gs101-cmu-hsi2";
+			reg = <0x14400000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_PCIE>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
+			clock-names = "oscclk", "bus", "pcie", "ufs_embd", "mmc_card";
+		};
+
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;

-- 
2.44.0.769.g3c40516874-goog

