Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E58355055
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141898; cv=none; b=t4NWpgjCv8zejSouGLnQmDLGffyS41zxMyH70X3OTpHd2mwtuby08HYsYOmHjRx5vgYm08YRG00nEl5EuZhJGgG7FmihlXyk2Pfci72HkfqPqQygLNvlrpzFBQpbLXBY1XBspJKrNdw10ce1VJ9E4VumqXDNCDYWPlgXGWYIqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141898; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z13dqXkdf0SzC4TOLK+P9G9s+cLJCi5S6Y5xLlSjOTLJuAam90x6WWzPGYtjW4iUDSuMZq6lB9YRuimrZbsQJAbuk7//SoYeJzPa6aXp4S1IBAGQRRuuZp27EKN0fsEHOPCg6LOz7kDybaxIuskwNQXbJf7+iL6y5v8jJPpeDcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrF3ZFKe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrF3ZFKe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so116311525e9.3
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141891; x=1777746691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=KrF3ZFKe9Um4Y3L4wnLDRe9n+wB8r67xgvFCC4NiAHHcFkHppT/aic0emKbhfjOr52
         iH09DmjVUvThCR3+G73rNsinQoTR8qrW3SormLF892Hi+xu4ryjXo6V5GavbTX5l8eXu
         BVSO/B+w0fOjFEUUlRHvSfB7FDw7rF6O42q+tXfVygchbQsG4y/Kc3SSsdQgN34OOftE
         mGq7AXjjIoBSfdivAtVSkAHVEqDY8wVr5laeU0iu2JZ4Wxg/EG3Lhz1DeIzPlHpW12OQ
         uMHldYFtefdqF5C4p3baji89Ri2qjAn3jL6oHekijl8ijqPNPG7jGy8gYJ8ImbxQ9qlC
         gHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141891; x=1777746691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=SqoaqCvomM1+m1HbXk/pM6URecR36+I0EcUHj9MwTPFOJ6Ix79VqPMV3Y+u7rACPvH
         W/bcNwBHAY8sBn9/dEbwLHbg47y1401sptcsHNFZSqhNssBH+Jc74NBGwSR7IIw1fuSr
         JzK3QtXth5MT64pcpoShw+X1I/9vwhHP+6JVYPk0oKSxE8Lm8RY/mjfMtbcT8ISwqhEa
         7dZbXahkkueWkD7NZbXkfVrQ7WgyoU6zKygd17sV3aoawiTqAEJPiUoEHak79vlL+2+v
         wGNOQ/bZIK8DAxg728UEy+AF2rbO5SSKzdHLADBBU6rjzBPZZ/8o3vO/z1k1uGwvtbNT
         Wl/g==
X-Forwarded-Encrypted: i=1; AFNElJ/HiuVLe3Zf0vvMCgK3BQKuqsyIbklI2yXxJk0F0XRD9wbYsZu6+lFguUYaTrWYWFr9mq+2qzztFXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA1CtfcqFTuZATMZ6dXlOC0b6tdvRKmhzMkreRpK268tGiAMvW
	/HhwRjcMPG0LTUqocnZdiqE/JF7WLrmJAjdeKoK3u9eqBW6BaeEtibZI
X-Gm-Gg: AeBDievrFgZnD6IdHw2xcp18sc0gOhm9WAu5uqJzL+QCdPMLbCfN4D1M9unvyFP5mUu
	yfg0+PJllXVq/SK/77bLvEVGiJ9ZYEL1Kaycudkk2kGhznBsgZhEam0l/TJpa8Jzd2amoy4MGm8
	/RKyNKEnCJAgIVUznYXqSECXSNuUm3Ch16MRYjziRF+xtsYXa9Ko8rv2wBHg0pgWFQUI2NqvpRU
	6eVaNxvDoq9OmXeIAkwZOFhLEW5nGmQoJPJ2VvFnVBiNjfaGVuK6Qoq/3zPzxcxg7DtAcyb7fGe
	ibC28moI7HvhSf83vmAzyiKy5B6WTiANQ1WiuM5OZDHU9WU9Byv/5uyWj7ax57oHSUIl7h0QCfH
	NrtBau8kUo2zjN7XrS2G7+mNu/+1Iokqh5caL6MBb9+tG06yOtGHIUQHSq2r5DjmCQ21bCV0Z+u
	8S0MCrM8ZSiF7mwe/jVfLILnIFLLRbfhZBn2uzuV0qYo5iQg==
X-Received: by 2002:a05:600c:1da1:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488fb785204mr579670405e9.22.1777141891411;
        Sat, 25 Apr 2026 11:31:31 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:31 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:08 +0300
Subject: [PATCH RFC v2 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-7-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are hardware controlled, they can be switched off at
any moment. Vote for the Venus core clock to enable it later when GDSCs
get turned on.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..420997b00ae0 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

