Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21561F37A3
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305791; cv=none; b=KLgcr61MnryEJPzPxziIW9Rv15RWaTdcLCIREZdCsfU3HNTH5kSev2lCF/EZ/HYrTfCy2/K9s4McIvRk230dQF2N6EpXxWMrsPYpUDLtkuJHJR1xjPt/AXUdK4h0RKpB0ukQXuJvTteOKb1bpaZa2XjCi04OunJIJAR5+WDG5iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305791; c=relaxed/simple;
	bh=UROKsWo8V/DaJ6J2DFxN+2VsMsQXZzObgoBQA6JVAr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HEYQv1MUP+Q0ZXeq4Ed15gcQ9iywgQzfVmGDpYmbNXK1WQDpI1pqu98Y1sPJgxBfNOM7GVeEyqsBzH3zoeqjC8QBvVRltDn448v0JEAfwzjAqIL2R/LLmDPRhU4ks240RdMpH1qknK24jxKwsHOlAYYqvwKoWPDtBsqhY8gUq7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdyU6FcM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdyU6FcM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e27c75f4so5278297f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 05:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305788; x=1735910588; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pPz3HASoQs0rkuPwc8L0u5tnD0VG/E5QMzIms3zXL8=;
        b=TdyU6FcM3UVEYzc8esEZZ2LEh59ad58nBerabRq9l3HSHRmFU5NmijL0vV7PHRx53/
         HkDu9MjHZk4JPH/PR9iL0aKAn4khTwcySC6Q0jQCMxBH+CjDvRrqPCBTzyjGlJkXmd+S
         xp2yvLJQsd/c9m5h2dsIlF1s5b6FgdyZr6lb7oJeO7LTDGvuM397ReIxiNVZeVgbyUNF
         b7jGMlm2UEujRk1yTcmQw3B+b4fg6Zb2uzfxqGMzCaUqx5w2wiRtbucxAutf7Tc8dspE
         cp+7vuO5g8V2lkm/j2ybphMS6Snl8SpSHu+5D78j3j4Mc2k7B1rhW0mVmusnGR0hHkGm
         yIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305788; x=1735910588;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pPz3HASoQs0rkuPwc8L0u5tnD0VG/E5QMzIms3zXL8=;
        b=WGDGHPb6HEhSuY1j1ii7fp5Yqde+Y7aWJgYDTvGLzRBUcxzeUTTycNtp0bjdYKYXs+
         2y6zP7kY6Gynob8zpe2WpreYyZB+OUKiD3qrq8qtzUXwG39AsLSMF8LXyvQHf2TlSIao
         16DfS2m/mNtSgq038q5Ajx5HNkg7Ws2l5bLrQuahzJqK/vbdyJwUXuunhx6FC/4ul31P
         2DGGHju9fB5cXMfTWWQWpMvwQmiKuq4zSIbYd0InNefIAYwopw7JrQ9L3/zHJ0ZfNk09
         l3st9LF3cGoBXcgpal7KVx06V3+dJjLkk5EA2JyP8kf4uwapgl7/wOoY8KAgwUEHASVx
         khYA==
X-Forwarded-Encrypted: i=1; AJvYcCUmC5ob9lzHiqSsmhn1i8tk1hyuU6XH/DPqi2om5C8VbNQM5Y8ug3IzJeaUOvDXivcd5imgdhCWOhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQRUFkh0rfd7AUV3Q3Gi45LwKL+RM6B9Ue7jVSfpUlSEgAZLU
	3VCztJ2SRk7w8MPCbrDWUbNfVNyGjH0P8FrlZ6L56YcJ9F6nt8G4K/yFYaj017o=
X-Gm-Gg: ASbGncteh4pTA3CIz0NhW1B/Y3DfXGDLj+k0zKCrsRofryhd8Oiq9kxpSnqZ29R1zC7
	UveL/fRbzuH4zU4fFxhUhnmVA7hZLJfn93N7AT7Bthp8wFBe2FvAyLkB6MsFTF2j2SsD/ocU/1R
	7ZkwqxJQh9ZFTN64uJFw2adAJ17UK1TncjLMHqSp5xope9rzupcW2Fr7yGW3lWB3OFUHIyZ/OPp
	1wQTkijsAJjqO0wPKsX4mNd9OF3UeEgiIurJaSvRTWySxu1SFiuNFRKfSMaPnVxTA==
X-Google-Smtp-Source: AGHT+IEjpwtleDRAsFoWWjEMocwdDG5Pf19DRszPC5L9KNcPLxBjDj/EVABreunnYQEmzDuAMYB5sA==
X-Received: by 2002:a05:6000:18a3:b0:386:8ff:d20b with SMTP id ffacd0b85a97d-38a221f2f2dmr20697869f8f.27.1735305788138;
        Fri, 27 Dec 2024 05:23:08 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84840asm22149627f8f.61.2024.12.27.05.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:23:07 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 27 Dec 2024 13:23:03 +0000
Subject: [PATCH] clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the
 parent GDSC of subordinate GDSCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-linux-next-24-12-16-titan-top-gdsc-v1-1-c96ef62fc307@linaro.org>
X-B4-Tracking: v=1; b=H4sIADaqbmcC/x3NQQrCMBBG4auUWfuDmQarXkVcpOm0Dsi0JFECp
 Xc3uPw27+2UJalkunc7Jflq1tUa3Kmj+Aq2CHRqJj6zd8wDRo+32qfCpBawh2O4C4qWYCjrhmX
 KEXGYox/7awj9jVprSzJr/X8ez+P4Ae/9JVd3AAAA
X-Change-ID: 20241227-b4-linux-next-24-12-16-titan-top-gdsc-c7fc4b38aa39
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6

The Titan TOP GDSC is the parent GDSC for all other GDSCs in the CAMCC
block. None of the subordinate blocks will switch on without the parent
GDSC switched on.

Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
Acked-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
This is the second patch of this series:

Link: https://lore.kernel.org/linux-arm-msm/e19ca61f-894e-40c8-86b9-dbd42df4aa46@linaro.org/

I've since moved the CAMCC part to a standalone patch in another series:

Link: https://lore.kernel.org/linux-arm-msm/20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-2-06fdd5a7d5bb@linaro.org

Fixing the GDSC parent doesn't rely on the CAMCC yaml anyway so this one is
safe/correct to apply standalone.
---
 drivers/clk/qcom/camcc-x1e80100.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index 85e76c7712ad84c88decb62ccaed68533d8848de..b73524ae64b1b2b1ee94ceca88b5f3b46143f20b 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2212,6 +2212,8 @@ static struct clk_branch cam_cc_sfe_0_fast_ahb_clk = {
 	},
 };
 
+static struct gdsc cam_cc_titan_top_gdsc;
+
 static struct gdsc cam_cc_bps_gdsc = {
 	.gdscr = 0x10004,
 	.en_rest_wait_val = 0x2,
@@ -2221,6 +2223,7 @@ static struct gdsc cam_cc_bps_gdsc = {
 		.name = "cam_cc_bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2233,6 +2236,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
 		.name = "cam_cc_ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2245,6 +2249,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
 		.name = "cam_cc_ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2257,6 +2262,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
 		.name = "cam_cc_ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -2269,6 +2275,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
 		.name = "cam_cc_sfe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241227-b4-linux-next-24-12-16-titan-top-gdsc-c7fc4b38aa39

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

