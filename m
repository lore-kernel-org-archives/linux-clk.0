Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F635DA56
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014534; cv=none; b=lC5ltggKuKqn0mo6wfqnK9Shzeuca57oaG+ujQLs5o9oJKHYzS5eigZx0qelyi9yIyGgQONJBHr2kDNMeogQAf2ajmn38hzhoqP4/wVGqfF+voippSQZ5YOWOs1SjfGMIi5Z0kMwRTRPQtUaAp5n5EQAd/ZHLnjBRvlJY9iruZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014534; c=relaxed/simple;
	bh=yZxjV6+ULEzVXfFwKMM55TezT0YyFiY3vaA58wvIX6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BktyiyuOl7MuHfHcNcM+h8OPKHWuvBaDg3+HlnbNudSRbFsi8cr32ZnVUXeoSZ7ohiwUu0KBOrBw9vbZvmFordfzFtfc2n+AI8TA/0dAhcONzuT4kXL2IOwduDm6Awk4sr1iSd1ddyHi5n0TVBZ1gy3cJLyQKW+s3zBXGbXDVqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3e5TYgn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3e5TYgn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so60523225e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014530; x=1781619330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFl46Ub2cVSIiuR2JnRpX4S0zO7OykASOPd86oI9HrM=;
        b=W3e5TYgnDzWSb13WdRcRy/ukRz9YwTOI4o/cND2v97mOYMioXPryrud4xPd8sFYoqd
         5uT2aqTXtUtUNjvsY0Tm90Pq3OeY77UXPe/F5hQbSBKjfCLdr0sBvmbpz8dreHpjv93G
         GMgvkQbicTlY/mg36CZszqTg7/g4wjIorupVebFC3pr3yVDzdB1ZECSTQHC2/FUOzX7m
         PdnhhAW4quxsRn81YbsXvwD2aTRr/+FVZvtbWVAtvztdCpQ4fVvCPH91vkV2M3TMfHjt
         Zq5eEkn6kiR26ETINxGz6h0ylEoxfeLmKg11JMiYtK68lKoS0z52Fgju/z5BL4Smgeml
         APSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014530; x=1781619330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uFl46Ub2cVSIiuR2JnRpX4S0zO7OykASOPd86oI9HrM=;
        b=sWvoWitv6wfKBSWaSWmuREpEfAiOcre/tJrRR15rK45Cy/rxMLl/efJFM5Aw0NUiXg
         5KB4u2FaeE8PSg5WU1VGRqx4izcHSSyogD53XLm6Vjeavl28OcUcBOnSx2cn/F+t121n
         W7YXAywaZDY+fQbxk1OXibisCZI77TokmaAbpKD2FMj28EomWIDr1An8zsz3zUyCsyLe
         H3Af9cFoKDE7o9mozwoEml0AVKd2VxpMLlh3+2OHEfmOeksdGL6wcw/ZgILsf5eGtW2m
         68VEkpN7A419ZXYDU8OKINFVqPoY+a4CsHO8U0X5C6xzrR/F0uYeZlOwxw8o7CcrbX9y
         6sRg==
X-Forwarded-Encrypted: i=1; AFNElJ/nzBTJIkuObDbj9ZiDAxG1j1dGsCVmzX6DWNIdShEJZKH+GSMpkcDT15vk41J8SEnMpTdZBKV35aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzivCKcvKg4NLomtIj8q28kRutOJ9k7HEzwH5y/g9kq7y26SXIm
	pFbKSSt2FZ6JtPUHgL2ZGfMWOnn8e1tECcQrd88wAKPLpKkBEHClspqDNrPPa780Q8mm4H2330q
	PvtvfHNs=
X-Gm-Gg: Acq92OF5fsto1aCK3MCqyS5BaE0MtFFNfSeoU99iTMksqPnLdmmVJf1hDQyvOXMB6Pf
	c6yvtO18peUmkDM45LOu0ep7KNKhCKXxAmC2fPJZMjoNLUM40dAlYaZs9eYcl+ZP31B4dq9dErW
	QYg2BQZgL8xjhmWFdObhBF5hb4Q4uCCJy2tlSYpZfUbjV4JRk7x8KDyM4h6XhWtrjDWWif4ct5g
	sKFZxk97OlWQ98rRNcpYyClscjYkInIINrY/AMqktsZxNQNHxKhxnsy3GbLj1qTg79QGznhvSLs
	ykq9nWP9cAu358/ejTgJjHQV+yWLmDftyG4Gddy22mmscOgATMl8jwoP/s2Mo6RjqAsAWhqGpH2
	IirrxJl2kgvloB/upGbeyHpjhvjx1BwqTd9CUNFGxqRgXTK3yPLh+3Y87g9kiLKHnQXF9qlXZJv
	w7XVTt2y8z9b83YUE9RvLIlDzSFcj1Ht3f4vuiLIWN4k6HpCE34mk6trSOoQ==
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490c25af61dmr328323305e9.2.1781014530409;
        Tue, 09 Jun 2026 07:15:30 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:29 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:48 +0200
Subject: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
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

From: Stephan Gerhold <stephan@gerhold.net>

GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
since it's used by the CPU and also various other components such as UART.
We also vote for this bit in the actual GPLL0 definition, which will be set
as soon as any driver in the kernel requires using the GPLL0 clock.

All in all, this makes separately voting for GPLL0 during probe redundant,
especially because the "acpuclock" in the comment is a downstream construct
that does not exist in upstream.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 0bd4c12483cd..ce78ebc8ffec 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1565,16 +1565,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
 
 static int gcc_mdm9607_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
-	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_mdm9607_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_mdm9607_desc);
 }
 
 static struct platform_driver gcc_mdm9607_driver = {

-- 
2.54.0

