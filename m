Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015C23E9580
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312757; cv=none; b=HszAQa1AwS2QnBk1lETfEBYfNCJ8JSFSOpseYiSOBK3RjnlUBQECxNtWjLUu/mU06xTUuLvYgEWS9wNr9OfGDGsiL0o5D5mWF4KFnY5tIVMOZKl3zoWGvQK/05krc2/04V5JCPM6LwKKjgWi/6q5Ys23fZGCTzCfL/TjDlS4fXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312757; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESz8iVYvU5R0pEaHm4SoX/IG0nLe9QLuN6UYd2SsFl69uMvoJPZY43kO3ZO1xQQBu83mPRMW+auTWTR8QrRcLmrsNjci+KZ0NehD2+3CEQcCvk+bX07hYo4TRv7rM7hWTW74hg5OsB6ICxfLoY3TcxVn4Fc7ImVlvSaeZik2P9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5ZVQvp6; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5ZVQvp6"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-794719afcd4so110567087b3.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312754; x=1777917554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=p5ZVQvp6TM0j/+XHmRcwDNTJPWaN261r7k6FsjHaTGeI285qLQCtHQJ9xgdScU6pbq
         RpNsQFtN7RSEGE+ccSPi54ek+KbCMYOH1YFuoZuHBs46NpR5Eo8xk0vC+LCdNhq4X+bo
         DTTarJZYrpketYNy2mA7zctymOEntvlvQhtitOu5ZHB8+8MGfQsFgVh54Vh4Er0AveP2
         f0u68oWeGx+DclCKgDfAj8M/8/xbGBaXYs1zXtUV7SMjrVMCHn0MAGUGNiJagr/IfImA
         JvhUohoOaU7lvLMwFTnJavaR18b3hdQhiod/hONYoGfomp2xXF9wglSoWCPdcROJgrX+
         iXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312754; x=1777917554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=bFl1O9weI0xXLTMlS6LQdOaWJz959kt1KRPgoCyai6kFZh7WCj1nWkFoLR1KtWbXon
         aZPhh0QYg0fz7XMr+tmIb//p0+wDxOAtHw0wQf451kR5m0Yz5ffnjWeEwP5B83/nFe2M
         Ed75TLi6FDoIvgMc+CiO9PNQJ+iah3IRnDsSoNhLXxNInl+pkGvEQ9BYuXXvSRv/zJjw
         zzZ4WCVktfoMJ4AXDTs/rvIVTVApPvs04Q8POA0k8x06L7RSK5ddlWbqKUhNyQ6v6c4y
         LGjetrPBh46dnzMRT2CCtVXmdI/b2yfFUfBWBBw2FDiwXZwGY7g66XECNL+dk9/JfwLa
         mc+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/McUUizO6BUaI1ofZzuHRV21JTtDn0R4hlIATygwV4tHyojeqmlsp19j3hK7kv/UD/wr+RSkkn11Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBcbd6idlCh8ecujSm7ONtgLKK/4KgwQzyWAmGWEfgCSmiZGm
	aVHlI0cjVpXBcjyB7LVcIAlEgAx+sVWCN+hGyzvCzRE+5I9mXHa09gIv
X-Gm-Gg: AeBDieuM9vE1Xib5nVeQBZdLRTWV9mv/lezQe/nidLDOsezFLE7aBomPeqBMEKtTJ0N
	yd97Gl56FMMN+4VdBNno/zCFbBVz/vbOPTZaDbZmFMGrb1Nf+bCl/jofR405DFG1+qgCCq9VX9q
	/BpNTjdXLxsUS5CoHTjGkSgkn1gSWS5NyKI+paRQYq1g5rlROnp6UmYmNnHgWUAkACoqfg6d2P6
	g+VZeyAKhl9Fkns7riIPVWWPEpNF7cUPdgJY7urg+zfOb5DFTGZWbBXAACC7rqp+vFICbpSTycw
	IvASZ6IsKAvDSOue6au2PreXYjjZN9yuA4Ci6JF6Bm3/67vzQconfJUUSBecWtYmf/TNr5iWTKp
	+MAFl3qpjDgT9Nj3ryc3mDQduo1yRwTbKVnYBRCMOm1v6EXgOfpvISocEQN8jfr2Q56HobVSstF
	2vIRhicuDL8G0U2dtGqtGYGvYxHnV8I+bCY74W
X-Received: by 2002:a05:690c:f06:b0:7b8:338d:7d7a with SMTP id 00721157ae682-7bceda1f77dmr4172297b3.14.1777312753954;
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:29 +0300
Subject: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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

