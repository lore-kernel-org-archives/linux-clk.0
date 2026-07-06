Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A241382F0A
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350179; cv=none; b=a55eOkdiToLBiPQtAzekKZWJN5Lq/h25cs1CWiLqWbIIB2HfuZ2Ef/Il/rHogVHrpyWIMiRfmf+oShlOI5JX9WZXwtqQFNsEqP7iZMsN6R3Ks3nXyjxGhbslruz9HL/5taIaVjoOOxkdGlJClx0lcmLaisI+lc7u3cgoAic9E4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350179; c=relaxed/simple;
	bh=R9Fw+Pg1uH+OC0GfijpP9rUnUjMHiXLCQuQgFbL/+9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDEPPU3E9LSEEAFe1Zs7MJTR0O5Bd+zLl29qW4hF/U1/S8jB5M14UzOd2I39j5DQila4hVGZZTkEUoIKyQIw+xKoBo1CKq9RAzDy69tIkZk8DoyKdW5+rky74SCGrC7S5nmyA/bnEb0Bx2s5h+sMyhFI6cWm/jYimCCae66Sz6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsNY3A8L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsNY3A8L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c83474ddso28829625e9.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350176; x=1783954976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRgZZe43859RqTvZMgy+FZ1y/OLRK86PE9Ay0ctHm1o=;
        b=RsNY3A8LdONCaZrGx+NUqcnyRGhDdoT/aWm7SXzKyGlKHNiLoem9cy2Gh7nbloKwuY
         HROaAhDQPdgw8X/fkfG5PZDoueoNv31EBk0QnQ4BsaJ2PmrWtc2jGpv93t2gK25P4ip4
         Sf8pf3rX+Z7mMDpeiyXfA00BzCvKtzlQ3HDgctB5fhkatdTbeqofHJIet9FkJnfIxj9H
         JS8GrYZ+6EGrz/SKDJ5o/uiKqWrlUr2LMu/sWdH+KN/fvF2LCpECqa2O7duUls/9fCUd
         PpX6WYXGJcKzZDZRhUAsxrgu26luXo5GqfHxkI7aWxU0uCaWFMIqc7bmA/ucXR8zCwVV
         LvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350176; x=1783954976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRgZZe43859RqTvZMgy+FZ1y/OLRK86PE9Ay0ctHm1o=;
        b=hYikOh3DILgcH8TU9EhIhfQGwUKH9gMAKCW44hnVREAaA7BREQ8LIFBd87pKHcct3j
         3MRHcbAAqRLv8AJM5Fa56JtO400WWSHKia74GgAoxJqyN2lBMZIyPMO0hNmVLjuJWYiL
         e8oXag1qqrWfGToZcE7rCiFySMJiOOEmlMYLQx0fqzSaT2ZrkpxHX4QLcqfMu/vlTyAp
         C8VD+efkAoGI7i1Wih1bYyit4AEWOJ2QQK9BM6GR0PfZFQLc4agGwMPQlggrXZwYUluH
         Sw8nKW+LHoRgMjm/AVy2wfGpIY3lCggyEwzeRzPaqkwOztHCHdl8ksqhtPedxR1LaAKH
         HFsA==
X-Forwarded-Encrypted: i=1; AHgh+RqcTtuWg44yI4u0Q4vrAwykYWBjs1xjQkUTkuCTk9xMvwSgK+0+HFSxXZz+Cbey78pRktf/kwO5264=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyXc5PWRTTkw3Gbd+SffbH6a+WTCBBS8dEH0EQolh96kK+A01
	UCA0oQPkPoBAqkD2X6lalOtXb7EN0s/sz+R1gU0VCTDZvf0hciXYIKymb2PGoLyagq8=
X-Gm-Gg: AfdE7cnlWF2ZssLlZyVGJskEMyCKStv4Nn9KujOrkC8ku2YMtZFhm/Ww4r7xZ+7rGWA
	7cT3TuFqpNMNmwC7lDnU8d3eO/QwtrnxXLKYTqlf4kOHA7kVh9cL5V1elmOmbcm7+e853mAIJuX
	zyDg11IdRDXg41HgIqsec4DbYhDs5RusYWCZfkJSTVNeLxhELI/2yAy6p6scwGRPvH50r7ETNXD
	Xw9tsAqUtnYeG4FOCZGzpOb1JIas9a5y+YlVYwTLpDiNg0xQ4YgCSNFITQAgmKGYCK6yhmd2xA9
	2adGSI5ygZNA6Dc7xrMQarXlrTU6jpWON/r1qb0pQGyiErp218MaZU7f2BS7UY3bKTHTN3awr2N
	6Om63JhTe7NLGaP5Y28BqM90Gw6pLK1yZV6BTjDL7LKU3OnC3v8nnLqfXYQdahIyea+YnkdyYpO
	4x1hGYHMj78dsa0yzIrAc8m6VP/w==
X-Received: by 2002:a05:600c:8010:b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493df0a6fbfmr8883475e9.39.1783350175603;
        Mon, 06 Jul 2026 08:02:55 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:55 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:11 +0200
Subject: [PATCH v2 04/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-4-745565101869@linaro.org>
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

gcc_apss_axi_clk specifies a halt_reg of 0x4601c, but this is already used
by gcc_apss_ahb_clk. The correct value according to the downstream driver
is 0x46020.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 499e0fbbfab9..feb91e1fca1f 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1460,7 +1460,7 @@ static struct clk_branch gcc_apss_ahb_clk = {
 };
 
 static struct clk_branch gcc_apss_axi_clk = {
-	.halt_reg = 0x4601c,
+	.halt_reg = 0x46020,
 	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x45004,

-- 
2.54.0

