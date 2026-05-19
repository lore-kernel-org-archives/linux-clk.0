Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64984E3787
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203609; cv=none; b=BsiR6SXunVUW43Tm5Brp/saiXrLwFSDD5pkLc60YXEp5VoSJi4DsZGUAWhLyYWA0B0SqbCnave9Kq+2OmON5xkMRjUGYLHefXa52s7Vctw1J+SS53lUqUpb3vx3Yra9gnOIPCdqJgcP83nMHmvRjQ/1kIy5aAwgZ3oi2fnkeq2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203609; c=relaxed/simple;
	bh=U2Bp/Xc0dTJFjq2uSqbXXCvsJyGOH0R6f9lCOAE7i+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNr1120uBgOMVSqIjbwYsxGF+0sLN8VIrRJgPyS+TGSblJ7hvplPtlR5Jhpsrc6rZHY+BkUPiinzLqhCV43ieuFNDDumP8+vUiunC20DhUZ6W0hF4VgfoYKIhZDq1b+9WAKD/PxdfBn362zGx0MqmLbwmw6NTacAby3GNAiDMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkOw7HDb; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkOw7HDb"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso8385073a12.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203605; x=1779808405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/v05q6UOvuJ4DYkluO9mWC+JtH7XndlyQ+TlGglxGQ=;
        b=OkOw7HDbEdUl7wB5wpkAQUXhhtbnB3+YiHNuBflnr2F5XYojoBmtx2DnCziaeuZ0YO
         4nMkSf7ncTPAl6tpPWHXFQbyFkFprzU4Xg84CuWitE97QYn65zIMUk9P5jv0PpOw445y
         eak5jZOoRK3wrPj8X37Dvf2a3tD78wlg3NPj2aW1yVFiagmTVyfUmwZA/dCe9jaWm03r
         o8X4fqhiBozPjwXX5AjW48GhwMAIoel1C/GwvymBSKLyQTM5Ch7b9xUg3B05o2sWV0fr
         nmlN8Ya0mgrgKiINVM+aHLf2Rqs2oc8t0aBvob/BHCozJjbcuAFMrzLefXHHvu6AFdX4
         JFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203605; x=1779808405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C/v05q6UOvuJ4DYkluO9mWC+JtH7XndlyQ+TlGglxGQ=;
        b=U2kUpRsOl0jx62qeVJqsny4DQi6UPN+JG+xT2gZqem1SsBvEjzyECIB5pA7O4mPqyG
         Kz7F8iTV+LxMavWbMwIUbR+TETSg/aPUo0EZvGTXITZW9/4tNAo/jn8np9bwePDJfj5K
         W5kIiEY45adVDnBuIjWW6TQbVex5VEDOaYYcfHCklXY4Zgy2cMRnsv0vA3YIcIK1lp+s
         I6aGaoOtJNdkLg6xmJI4fMM1KbTIPypto9gUfGBrbNtCuSVzeUh3RHI1Qpw3wwaroSly
         4jkzrpJiXZSTHfF9YrAzOAzMOoSX+790M1dYN26Pw9OskpBQil26NrI/oh3kzs5d9rvL
         Ggjw==
X-Forwarded-Encrypted: i=1; AFNElJ9Jcj8QUpHG1HeyRHTxULDDDVPaIWNvn9UjktK1xIi1fGfzKmJfy1OCzi7nuiX3G5fZdSrdF7p/hS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5CW/gX5sfyaqJNK1tn7KCzuyC0YBZXrN3vl8/l7H7qimIEy3
	RP6A4in4UzIIdChNCAY6T9ESOHYqky9BWzBX2QoefmCOypkSnS2+A8D9
X-Gm-Gg: Acq92OHkW7wc+XQwRPZFpLNtFOLr5sIvMbOclS4ug58NJebZ3HP5wHpLW0pa/D0Loby
	6J5/HkY5MHbbnipzMXQHM+Ycw8TM2f+qXU9P1pJnQWtI8EPA3CnRTvLgn+jeOjo6nLa3Rdt89Bp
	cWQHRXwIkCmbUeL2H6rKu/Q6fbsEih3MSZZErbl0n3hFlsFTO/wghzIVTFiVGx3xXU14Ln7u5ty
	D6bHd07Tiogmdny++FghURr4zcyeJ0WA6YdhAzl2+a8O+bb47w0fz58Q/eZ+84/WFPKPFRxqU30
	BisPnCtZDtVqPgFAOLcBsK6AKvZogBITgy0ttTNA52DDQsWDtofdC0KMPStfFTrXdM+WlBB7DWC
	13kZAeJpQuE2zD9SBczW8Uo5lLQygGEwe2kH+IBusTnyEeRMRE7IyLLjqkEGwlZopaRelPQyF1u
	1QPwhbn3CAqc+nh2RmzJpxLe6QOTaQgRkR+Nu/
X-Received: by 2002:a05:6402:1357:b0:680:ccda:55bf with SMTP id 4fb4d7f45d1cf-683bd095c51mr6997580a12.16.1779203604701;
        Tue, 19 May 2026 08:13:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:23 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:47 +0300
Subject: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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

Allow Venus core GDSCs to have their control passed to hardware, so they
can be powered on by Venus firmware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..243d31a32e92 100644
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
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

