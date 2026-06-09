Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9448A34574B
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014525; cv=none; b=gVi16d3TjkF4XZiCguGmjEbP6RRlnJ3s56af+beq4+tGfH8VBgmLQkyUwTfcn+BrDBBNm8/oT/bABW6yRFiZRzb8vnPkcU06REswVzamLG0Py+Cxv7Hkt1cdgShUJGNr9Qzp3zuVwsmqgKsgw2fhcikkvpZoVu/iAK0oHPwD/YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014525; c=relaxed/simple;
	bh=ej9p/9bQNkiwdVcT+ypbUdG+Fj4hlOWg+YTcRiul/pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hQk0ypurbmXF0Y0UCeckrrclgm5WTiGKqOBmsTCRDMovtnyhUANw81jbhUDbfPxVNjXElIWX465PodeL5ZW7M94TFd+tX8d3eT5jEobZBrlkY2K6QZLyXtAfymJs4uE7vA9nHS7GR1HvbeJQwDxVkkMb56lVxSD1MLfmbg1BtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=haXfyvEo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="haXfyvEo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3637b90so48336855e9.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014521; x=1781619321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pglUIua8WjARODUMozEmu5xUT4qkmtEixeHke4+/IOI=;
        b=haXfyvEoH8CVLREOabADEEvTn7Eg99oPzBveh0m4Ur4FboZFiMEp07QORYaWqpj7HW
         cRCAbeO9TZSgNco2N88XXFSaSPL0p8P+ADayx31LaBDkZsjXYZR9ZxJM/9wseFAtQcG8
         K4XUoj8XATwQGriCfqm9MoyEV9GzauBuT5vGb0b7aNeWoxZcSRp+BR5B5bCY+wc9Zatw
         szuucvWSMAOdFuXEGGPZ8cD4uRjv/sSrSoiDYv3KrdhR0JRd4nk3LlZroeDJSib5RvB2
         BUWICR89ep3t3v7Q3A1ApXyRfCVcRd4lzpqjZHeCNexy8YfpU4LLAEcT3ak8QGqykToA
         i59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014521; x=1781619321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pglUIua8WjARODUMozEmu5xUT4qkmtEixeHke4+/IOI=;
        b=GgE3sErIaZDVmcwg86Q6cBbVPHRsB4/DNEYqNoIUz+ARVLaYB9WSxInjUhpQrjmUCM
         vvbUyHXy4QDNh4L5TxObJfrWOJsXGym7hJLdZhi8uD3BebyfTHWMdziNWEsIltJclVJm
         AKyFAhUhoIj6Oxl/KdUYRIxgEmUd4Pi1x6UjLxwOD94p3/ntNjqswOQz4X/Bvah205qV
         FnQpXZ+jfvpdFbobdxTf5SB/RzMK378THBksnrbrxo/ryc5h1uu/zu1ndefFZBcrpIKs
         RS9QneYgpEObBUGJB9qj4iJH8BcCXycZcjVOPcoSppQunPi+gbslhDj06J7yOYyNiQTE
         9BIA==
X-Forwarded-Encrypted: i=1; AFNElJ/LcksDR6Ray8Pbmjy13/B3zGepdb582RhI3awW0rRs9+sxmuOISde+WrA+GK0OBqukFAx3VIdDJnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+0OEOzx5sDUrOhehiiVLPta2kH5xWBdOSJIYWVPbt1CcRAps
	XQ6/33ArNzR5ad6/nFNC80+KELy97T83wMMAheCHkVKygVc6jF/VyU/HbYv7iIFmbQw=
X-Gm-Gg: Acq92OETFg1teD9czjg6uw5x6zfM7qOnkA5oK0LKRkjQx+pu9aJepL7ywuIy/wFYzT7
	fyj3o/wOYfn1DjfKstKG+OE/s6OWh36zympxDb36NhMG2Bw6I44obZb597vlWWsokuPvdpXMd0z
	UzR8D4zsNjoHHOhfHGv1rjsCtFhDZmnF+ylFAxSjgJ8Aqj1qK7TlrF98AlRrpqjXyfBgH/HiECf
	3VMx5gCN0fiMOqLj4CtVwWQjBsOaM8hESjMELZs4Rbyb7q0rQR6JD80XnO5Jr8BbSk9i3oOC3+0
	jRwGSCqcuiIx2KBsV2e21DEJpVWeT7K/bM9/7tyKAx/Avk5AGicuO2lavZ/QhoRq8pv8p+adRHA
	pi2H81Y+sVR8gakgTMU/Msg2NGEXLa7eVFpERg40avcVCGhOBi+byLYu3z9jgEJ2wnJj9q6dhvc
	fEJOjGRjXk5p/9Z3njdYZs/AE84dM/8Lcw69ur8I3pxi41RuQ=
X-Received: by 2002:a05:600c:45d1:b0:490:b9c3:6c62 with SMTP id 5b1f17b1804b1-490c261007dmr322915635e9.28.1781014520941;
        Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:41 +0200
Subject: [PATCH 05/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-5-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

gcc_apss_axi_clk specifies a halt_reg of 0x4601c, but this is already used
by gcc_apss_ahb_clk. The correct value according to the downstream driver
is 0x46020.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index d0b08b112fed..8fc3ff2559f0 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1463,7 +1463,7 @@ static struct clk_branch gcc_apss_ahb_clk = {
 };
 
 static struct clk_branch gcc_apss_axi_clk = {
-	.halt_reg = 0x4601c,
+	.halt_reg = 0x46020,
 	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x45004,

-- 
2.54.0

