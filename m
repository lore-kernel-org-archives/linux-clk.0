Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980AC3CE49E
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347075; cv=none; b=bY4x9m3fxxkqwrgXMajDt3wROdNVcovkvScYXP4FlWH57nnM1sLA3FdxyTqwyYQEDNCvWpvr/Yw/GqjJuMIjhQQndcSRuNUd4yO7k+pVijn9oVjhy6PP6we9kX21Pu/Yy1PVGyHaq6HnkyfsErSVSAH0oHGETA9F5ZBGWGpUPGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347075; c=relaxed/simple;
	bh=m0hAwjUa4hKV/coo6hpUGbx9jDVDQYsKSjHk22/b9Gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/uCI/oTruXqcqcc4tS2GGNZPpK4c/00F4j8XOGXCxtpi9upl92iD9NEM9Mm7xgpm3m+qGliC8zrAuXqP2dCKK6IBYI8Ao5zY3jomqRYA2ncBX4Prb2qZqsS9opMEFOpXYjyjs+4Olo6gq9DQLa6dE0XODXt+I///3a8feYHA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBLDYpXh; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBLDYpXh"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so30532127b3.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347064; x=1776951864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d2nbf2g+hlQZgCrTOLd5o3o7R6PUXkz/sJenAfYET8=;
        b=GBLDYpXhhJoiGJxK64/GVAB6bg2YQ5czccTCjtFQ+PqiAjsMOTNxfrrBf5vEUFwdqh
         oyk8IyexRFbC1L1wdn8rXdFrKGKGGADcNk4fWyTF8dr4KToC0r5ynQqUIERiRw1qNOxU
         F4DmoeJMAnCqR0xe6oCnNOBD5oIoTSTAtoSUh9yG4XwReuPpG50wD3pTtrdmn3dq5wMo
         jJ6l0fBlfcc+LPmjoW27GXnkMlFPsOAPinwdFgoXbbGvxYDJ2mOl2TsDkS/kA4BfD92C
         tCfJ6IrjB8hdAd74xXMNSxS7NVl5Rc94OQZM7lTazILZGcN67FWuUk4grDmMl3iftqr4
         OVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347064; x=1776951864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d2nbf2g+hlQZgCrTOLd5o3o7R6PUXkz/sJenAfYET8=;
        b=pD2nent+DcUgYAblo0HsIECZpQK63Jz/wXH2Z96TBVKZOeTJEFVCHspaK80sr/5qdt
         XSZYHipAVqkqOiR5rZLYvVPxbyNPE6BG7XrNTYKfmiGxGYt05ISJhJlwWvmf0XfCgeb/
         OW++TtLJoKy+K7SW48o874ComDrIoIpc0W/Vy5nMX3hG7xdN0482Fn98I7n74qLeJAbg
         pqmEB5yUwmkztNs8IcagO4+flNCHbRnY+PFMzmXupjBhPy6A3ZkKyIn6Z8hFnnkB9vAj
         jRWgd0bqi+EYd1qhJHMTzmApRfaTvFLLO27wgUZlfMQS7q0WNyGfjtq539074OVLB/Dt
         F/GQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QUEGKUHop75D+iGTQWd9dkureWYmKVXEmcydKDLTCxEpm0AqAiAQhAPtaFeJgaFN6GULmh+XXYDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkdtJzFKxuWrd1xsURXSOQFmvegG25XLVYl+FbIxYP2smnVHi
	3dBxt8ZVLh+OLz0oqewvS3JD8luptl7z5J6RAUOXeKWQzUp6dP/uc4+S
X-Gm-Gg: AeBDiesBk01r9L1CFRHXHvGGxd3+/JvDNYVbFpGZbVGqK0TkBfAJZk9X3A5p0/hEdP8
	eeMUecPCfl9/FHynOoCFXWUBtqV0rWfJ7/L3aJA1UbCz+n9Ljuiwctv/FJFVnfFSLklz4m3d7kg
	TJ4bW4s0/5RTK2GXFCR4IhznsWhY/PTpYne6tnnAPr2mFl+O1G6G5XpXlPS116vbX4gc824aRQ+
	z6wT5TKHtbtvN2Q1snVV2fpowxZo9AHkrTeN88znaTMPK39lmSGEEms3ASr+bnG2Uo4Ga8+1Um3
	o2en5wv0L0yc28qomtHwKKhKm78Iot+MW68xBmBy6msFDD75yRrqf6ys7E+aF/ta2pt7wANUiUD
	LFWiVFm+6DboseUk9ohhZ46ojIxDsf/qb9COgukI8iExAERaub/S1w8TQabkA9v3tOzZti5LcNR
	EpW+b4vX0oVlCDswzwKp7WVeZM9Q==
X-Received: by 2002:a05:690c:10d:b0:7b5:b474:e988 with SMTP id 00721157ae682-7b5b475118dmr110507387b3.50.1776347064060;
        Thu, 16 Apr 2026 06:44:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:51 +0300
Subject: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..b7cfd289d31c 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,30 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>;
+			clock-names = "core", "iface", "bus";
+			power-domains = <&gcc VENUS_GDSC>;
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.53.0

