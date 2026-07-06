Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2A380FD3
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350180; cv=none; b=eTMItJQUw9lwmc48Fajekx0LX9H+L0ICcJSAax0b/fkre6RIWdMgjHcVnQ1Vupqw2dXB77pryouR7luh4GdUKrhMNDVRGHyHX1MZsSPLZadqUrK/CDVMpHrOVo6hD62fAdEQAhpwzxBAKLmUM5EMK2DI1Co2QI2AQRRiDIIc9yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350180; c=relaxed/simple;
	bh=5azZ+o2bh9EVMF7MNU9aAP6q9dQc7Ln2kbE9ynYU0qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIBQEQ0OQq2kqyhn3QtfrM1zdrMZ+tK/DiAkWOWbPVH3sGGoFRdDW6JRZiTb4JxgCbYxgFH4HY/UM8XtKNWpk487T9CH2yI/537Qf2N6rhVAU3KfoEUfdmdC8xihnIU4fc/igyUeiPr+69vLvAQLW0CoM0WcOxJCOKCdegqI9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ShSnTQy5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ShSnTQy5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so31573595e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350177; x=1783954977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcv8ineC8XwKKlGwro/pXww2q1g4p+cuWTkpuzvIux0=;
        b=ShSnTQy51OZ7dnBIIXK/NWUqCKc79VWUYASqIf6pOVQOC18Ug9ZvNtrt9tK0yBeDZc
         GSd69S8BPX13Xcmes+UZ89Lyh/w3mOaRNefGCmoVImgCZRKOPBg5ONvLZEFyYM6dUXuI
         ahDu6H+cX5+gq213dG0tbM83OTMtCcsuRQ5VMJ//Dlnxx2jUThMRKl1fX90LC3qV0H0g
         S7tjNXBb6FLBAT9rGTBKhJFfJMbj+rof2ZnwDK1h25B/ClMq0FSl1HRLesjlZHftTMKN
         VkS95o02jwpGnnbrzBt7+6CHbixodWPPgmnef+93lwCuKgz4ZK/18mNgabmapTexDi7g
         f8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350177; x=1783954977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcv8ineC8XwKKlGwro/pXww2q1g4p+cuWTkpuzvIux0=;
        b=jQo4v8pfVaIPRjVjsec4ZN7OQOSKqzNm7ak0JyBr11EOzR6wE42BcEv/hSEb7x2Uof
         gOptn239Uz7oREvjMFh6bzOGUKrz9KmTNytMBIrH6c0x7vM3n40SR6z2bZwV8KTIz5LQ
         E2ykeSOAQH6KcS0wqElhep6iT2LSHPlPKDh08k2aEz/WfdDjVU5kP21ui6YAiYT+cDKK
         qDmKGNAV2GTzpAlIUvgUNq9bmUHWhVyTQh1by2B9wV7+ReUj0jtGBUlQ54/sRWrDaj4u
         rsC4HSR/lvlE2Ccy0VamFrJKcbWqAoqq6j8sAedp+ai3yhZyPv2JwNnh0AbIO1Nvfkca
         Kthw==
X-Forwarded-Encrypted: i=1; AHgh+RpMsELjhOAMYeg2LwN0Nssgp6UcsNsq9djf+CstjTvZn+D+U3vEpHn12ZTeGxeLH7cFpI49anDVyGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5oujiF/UFUBDyDkItfaNZaoCb2ou9dzeXr6Ss8E9JxJgE7KUl
	xBJi2e9ra6yIYQbKEt3qbDtPCaIr1LA+lLrwhnE445ctMFoEUV8U+4ow/xkzKKTOjFw=
X-Gm-Gg: AfdE7cl24l2/+x/P6l2Qd9rBJxz1E+Fmjm5hFMyoAZ8ziIr48hiXkpQKFt6IlBrRyV0
	vxN6hgSayj5TFq8QPPKblimQtsTQEs7zsof0TEDNvPr92yZQf1vQHBo5lv+hqg0WQxzk8LkoXgy
	5YQYIRNV3OYBzZ3Td5rgH/obmw6+cvB9cyeQurjJeuyOk0+w4OOMsbxadLKlPS9+/f0Ngq0MMMY
	BcFUaT+1OxaaH43vBR3+RTFZzOJseMukXQIZq5E9oXtixXB3np4SYkw/VlqCo6xVSLgGzKqka7w
	5K96Wp1QXwfdstW66wQsRqSU0boPRrMDb70scCV+n20fTwwNzeWrjXN7lxx47csXlIzaTS9vpOV
	7cYw2M+iARqG8ojX5oRo1bZAWxM6WbIqiRDvIB9We0yj2cYtIWt9n+1fGqWnXyVEk86DcELsUOd
	dDF3sZyfJ8FN91e9rAPlqhC71rrw==
X-Received: by 2002:a05:600c:3b03:b0:493:b243:8ffc with SMTP id 5b1f17b1804b1-493df0a0271mr10545975e9.35.1783350176643;
        Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:12 +0200
Subject: [PATCH v2 05/12] clk: qcom: gcc-mdm9607: Increase delay for USB
 PHY reset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-5-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
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
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

To conform to the specifications of the USB PHY, the reset signal should be
asserted for at least 10us. Guarantee that by increasing the delay for the
USB2_HS_PHY_ONLY_BCR reset control similar to commit dcc6c9fb7128 ("clk:
qcom: gcc-msm8909: Increase delay for USB PHY reset").

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index feb91e1fca1f..092076a5a0c9 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1568,7 +1568,7 @@ static const struct qcom_reset_map gcc_mdm9607_resets[] = {
 	[USB_HS_HSIC_BCR] = { 0x3d05c },
 	[GCC_MSS_RESTART] = { 0x3e000 },
 	[USB_HS_BCR] = { 0x41000 },
-	[USB2_HS_PHY_ONLY_BCR] = { 0x41034 },
+	[USB2_HS_PHY_ONLY_BCR] = { .reg = 0x41034, .udelay = 15 },
 	[QUSB2_PHY_BCR] = { 0x4103c },
 };
 

-- 
2.54.0

