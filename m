Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC4481ABB
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 21:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017586; cv=none; b=Yp8gqoj4ytoihdsfVDrhOfJKzas7DlWUZvCGngsNhShNodHSMaxSfh3olI9GMPQ7lkVxZ/ZrPfE9Fk7eALAf47aV1Muovo6hsNa4c1XNg7KQ0fV8TIaqsix9IcXw8++0UF0q3e7clXYmn1JmVK3FcTXldH5sGwtm7GSaAtBhrME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017586; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/nii5R2S4HNnbWWZ8/mmGZuhSIexUdqzsOaSOIYk9KVpXdXcWB/EkZmzN8l8qklLWzL50I9kp2yOSg37fovxGRWqx4+vqg4ulN4dE5IcpO0k9gpszabielZ8+JnwfYZ+i1JMK2EBWNBgKh2K2LOCZtLcPxjd/PaO1Q/IUQF9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5Uvygq1; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5Uvygq1"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c0bda7f15so5939255d50.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 14:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017584; x=1778622384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=S5Uvygq1FZKhtZ49BNJNEiSxKXhT+JmWafkSN+Qjnny7ap4+LfP08X7BUuF/ufaCgS
         /2fr1PLcIoGcv5sKHdvaTg97YjWhZNtIaKLVoiE9Tfuy3qQJZK4qTjpAnoZVMg6f5Tdk
         0gx3y6ED2bjh1ZUj8dDKfRVkEFr7b6dsx4wSGYHFiAwk1z3RJeyXeyFFICfyfReT18F9
         kCHnEC1v7Vy/8ba9UN2twYp54trvKh6nyYXpYGOMHe3d414JyCOYEp8OxtcDWSof/EoV
         3+TxVC4oTZq3gJFPSZUR1Wke9WfaNJCAl3I4eOu+UWFAQjTlXILZuerKTjDEpeiWvkTm
         PKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017584; x=1778622384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=nospUCDuY2tfkrPE6FhESvTvmSwb4yiLgmxvaNekD7cUFVzrNQ84v5BjSTtBTVQaIx
         kliEPLf2fYSmkUg3tEO/8ypshZIeFXdx+dEI/ftkHwCTzNrZDtFKNv80nU4tEWsL7zAj
         e1fxfxfxBomar2aUVoqd9vC98DIU9K2KCD7+zCtayruwrt6Lx2koujSyUQl6eU7PiLIu
         /PC/IY5oKh4xVZEDpaGUptDMg/UYSeddsLyJCzcErdBOAyF0OlaLKXZfGv7VwfMkuLpo
         UYa2bWHExS9XWPFFFSKCtWs6u8yH1hHcI8WHrCBr7a3kNxapydT1DvWAAYceWUbt96re
         6Ayw==
X-Forwarded-Encrypted: i=1; AFNElJ8dCKLyWhkK6SronwSX7yhACCUBX1MnOyx4B7gIrV7LzuO+UxVDToc63J/BT3+ykZvr4qFYji5qdgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSUfZXhEEPHUkVOyVx8REVsrMKs1mX683MaOaJKfI2bk2jgvL5
	Oy+p2L9TnJLo95U+T+qveE/jbTT9J08AQGXkX2ZqQF2NOxlaN/VBoaSE
X-Gm-Gg: AeBDiet2wff/yWFZrxrUUSWc8+O2/PZ6exkq8Fz19WzMTE6lF90VXe69ylFxeg0I0eW
	hvllRq+TChmsXeWtrOgZXevadl0KG/VBCSgXpkQ6fYiIbJqcoY0lqbz5y1xJTeNd5b/lIhSYkuo
	y7sLsNoVmwLK5kw72kYbK5EACp9Smf1VbFY8eIuz22wwTr1KavvRKV1GpyEKV3ptOMg2zUKJWZq
	o6SKSLMvFCDRN8KmW9jb2NWujfJ43HFfitPeun+37bWSOPidOMaH72p845bt/BIVdRtKAelqjac
	J9Am/zD8eQEqjUkwDIdeBam3T+DZyBW1UuHFjkNU+g8OZ4WX40yCTDSO7IKcX1AN+JfsJedFmlZ
	3i5t+tEkHQmQDJRLhgjriKmqOjOHXd0kbK5e/Cq+Tuz2qi6FuK1E4khfdJo8g5Pyz23N4ynSNzl
	UnKDe2XY+B4yMpuhR08xtcSRMvWHYGstZqUU1UG4cnR74cc54=
X-Received: by 2002:a05:690c:c50e:b0:79a:b1e1:49cd with SMTP id 00721157ae682-7bdf5eb3683mr13883347b3.33.1778017583808;
        Tue, 05 May 2026 14:46:23 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:44 +0300
Subject: [PATCH v4 7/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-7-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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

