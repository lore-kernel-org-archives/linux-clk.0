Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747343D0925
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347086; cv=none; b=YqAGb4ug+b2gypcvx5YcMzeHgbmG2aDO1LZRC+mAPPqRhwR773RQjNG3cX6udPCLsTlG13b5wUnbRbcSwOit96QsoAXqU5WEnJ79aIq+6SRpwm09/DSqiQTojhB9VDVUkOyaLoSCFCjmEiXVshd3ridlja9VeT17Ns+ZgWbrV98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347086; c=relaxed/simple;
	bh=J7sL2NkZEJqTZ+HCRxCtzgI2NKoz7YhzKRP568/WqHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+mx/2OGFbWqfCmQHDMOwAr5SDA21bSIpw6fRIZ6LRt15qMcw+91A1lpSV1z5duCLc4mpyfj9E8CAV7/gTEs1xI8tDhLc300OVwl7GWYxDSdr8TXEq9cOTYOyN91qqzhq0GKbP+92wIj2atqCTW47Jluksn6dIPZP8v9aTDFnmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AV++Rqct; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AV++Rqct"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7982c3b7dfcso79735637b3.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347082; x=1776951882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVm9l0nqXtaLey0hcJAht7fACRxgOJUi3K+WFaTIsMA=;
        b=AV++RqctfEknEDf1kZXvEZXWKISTRNtx7HjvRPEZT8JYUJ0PrsGu/ehI0vbr//D4CW
         KG0yDUU6OelquoPRS9Pcu1I8P8wgyhXoB5kLX7XVmj4gI2lZwdaCSuElmAcAU51Oqpzw
         gKsmKQIm7H3eZ/jtR8Z1Q/LPdY1ufRiWtydvtMV0G3IDwKocU5F8LfHgi1tIVeL/YjQm
         +cCvZSDFbvWyUrbh9dADh8CYDKkwO/NbESqEstD5u0h4gtLgQDT/6I3ASwEvfvreCdXk
         Dku4GICizqMuDX6PbYqUEegkTDmbjSOoH32FyJey9Ya8vK2VZpBO7jFYzRYJjOr1wq/S
         MmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347082; x=1776951882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVm9l0nqXtaLey0hcJAht7fACRxgOJUi3K+WFaTIsMA=;
        b=S6yITD6un918tzI3fFsexnAT+eRFL63T5RuCoB1w77B9mRfMDSyTeVtwQRoVuBMFQk
         5Sh0o6AKoA01+i2TUDND8UrdumxOV5s0VoYYfsQ4u040SK8T0nUfv19L/v40p93P4TDe
         JAAUXB3IJne8Yo6jMMZ8WWK6isL15qLrCngLpB6lHrUmw39YRZNVjP/sqRv9yyLH04NQ
         4vWXo49oZ38ORBCsPTRxQDeylAGlarZlQBSWgTg5x+O174HsF3I+Co5yGxh3yvlcSWaw
         txtffPN7VIvilTz0VG62LndN8sbQqi6LTlC/AsqsLSi97qbwxbx5qsvlIYAA9c0MGO6u
         HqUA==
X-Forwarded-Encrypted: i=1; AFNElJ8vlw+xzWX3ojTrMX5vQgZS0w7j8dFeH/APoVoHbWD+mD9VyhN3iaU9736WYzDnhF3ykuZYhk+hlDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCGUBf4QF54/dAlzG/zf3rPZ7LTo2y+sH5I+QN55FL6pMCMEnA
	XcVLSE7ubVMs8qbyC8m7qscebxuvR+P4dipSOV+KfM6VeWW2Yo3lrnKw
X-Gm-Gg: AeBDies9e94I965yjLPPYuPteEY0XwEtaJVcCAA5nFeQW9+19moY1Smq5syrVhSBwOD
	MiJKPTXei3i8QB4subR1sUDPnRG6qze7MfMW/ObhwlISPeXSjQcZmMcUkIQq02tQdTFNHrx/ub7
	aIBDicowlQvx85Y9pxKuMhTrQrV0Rbvq+sbX6eAMFl8Q135X9cI4wi3ewkVXkMF4Ejh9n5lRFmD
	my1dvb5i3WnLRyKMvTp9WD6GFgXFFrwygbMd6M2VB0DVNDe8eF1dHc+Gv/DSBkuW+CKA2qrGO82
	NP8A1P9YyXawRYfHkfzfegCmT3HB7GqHW7DACmNQyitf/zLvNSv7WkLVLfT6jXTGWF01tjf+6Xh
	YN6aocP+wrhYchtB5UvWXtxEmziuz/wObHVRugiNwDAJwWKwBVRc50Xz/4oJd9LAtcUItVxKJCH
	3W9v1VaHiJxStC7D/1ffXRcyVzkg==
X-Received: by 2002:a05:690c:c4fa:b0:7b3:401f:2e64 with SMTP id 00721157ae682-7b3401f3ba0mr177002007b3.22.1776347081837;
        Thu, 16 Apr 2026 06:44:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:54 +0300
Subject: [PATCH RFC 07/10] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
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

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Because they can be switched off at any moment, also skip voting for
it so it can be enabled later.

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
2.53.0

