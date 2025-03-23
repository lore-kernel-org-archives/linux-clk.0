Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198CC1EFF80
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769592; cv=none; b=DvQA+3VDy8l9VkOnSwsyQvMsBcgmfxQcxWliAGa3a0b755wkWFD7W7lc1Zt+Kjz98ukel9jXHtL2AFJlQ4lNT5W2E8LEaGPlHNguQE0x+jb4LaXcfyQ8y4r5ru4aotAZcYzrbZt01Ao5QaX+cmwPKi04EW5NCWvXTi2Ttu4RQQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769592; c=relaxed/simple;
	bh=4+DMC9tlZSVxGow8DqTZFfBGSmBCzD9dumGbvfgv2jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSFiHcH8dZItO96vuUk7w+h3nFZiKJ3p17g8Cl6QtCsB1/TnFcKB9KAyBbLEu4cdcALsuXKdBkDI99axln37hFa+7aRNYApSOG2jw09AU2UmkuF01IqLc+rY//3YLFVce1x6SQiuJowZ6m5tpBzDlUxATidGC96IafRqKBucjy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/adUMDC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/adUMDC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac29fd22163so654486866b.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769582; x=1743374382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFl8ti8LLZE4LPxCWkejP2QjcAENJxbtxTGfboQDJno=;
        b=F/adUMDCgeIQn48hezFMzA3iy9ykNsZxAZujlYI+2S5mAqvxAzFPzEBrS3DaHa2mgT
         K+RFpDFGFP927W2pvEtsJARxOiru3g+7gXLhda41gu2k28r8NIdvW15xjUlV1WU2Y6K5
         NNBqOGi4qlbsupsM2T83kv3uKX3q7ql+ZcWNvYBfIA+ajJP2PFCAuDmBrsldUl54fizf
         7EHB2dtdHXta9MuVueZ/g4vuUKVmlk73VYuYTzJFs9cRs6rmUt5H3YcZPckXthRH+EYx
         FEGUORCiF00Bpt199J+2EyueV4DIBgiDW3oe0uipdXmp55mE+jKN4/9pjm6nTatarjOf
         RkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769582; x=1743374382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFl8ti8LLZE4LPxCWkejP2QjcAENJxbtxTGfboQDJno=;
        b=CzK7ojW11FemAJIGKQU/kHTtcykK7VHRkd7QloXS4r5HeJcbvnaV7y8+sPIvGphxKk
         EwGyQsPpY95pv3lwVuCoB0RzvVGN+TLGAC83qgP02wzbUQTa2pLm9+Cf/sanMC67O16G
         zL8ZzONX0Hsh2LQMRe2bVbFOK0eyld9ipqvYSj8l9QNOqxlszbFN8B+qUrr3HbgtqUPR
         lLw8VRRkzsmSpIZAYp90iRQ0naffkKFTxhosmOkVlfakcMmnn5y2Vv0onP3ncWw1zyxy
         tql8OTStTf5fnJoAGhFxZd1TXXUMKtTwbNVwOPkrqHF0pJDo83so1h0CvsFFFYlyqWTO
         h/MA==
X-Forwarded-Encrypted: i=1; AJvYcCWvhIhRiUg1tUA5IV1i9aBrGdj5OIASbQN9bptw+12gD5rz030k8X3kkxgwBF2k+wW3X/LwOswhhzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/SXLj3UmDexQWiCYte/r2gcwQ35qnj2xDh4FH+416//poyViD
	SLMjUOuoZLdXxQPgrVQTVMBOV4lmQd0EFj5uggSKsXsblFMc9OO3cuNQHT1Thq4=
X-Gm-Gg: ASbGncuT1nCPSYrWAVdqE2o+9TuU4q5y0T1MOfS7fPV3mU4jJeSdUEyAFS69FpgL2O1
	dBb3qrLUL4oIrYbsYqeRMn5zY0yhntvxKjqZtj4bgTr5LsspVd0rND4mY9krYbRPye8hhk13Msb
	V85TY1TE7p1PDQ2SlkxU7ADkGUaWMM34E+Si7sgiT5gwk29Z23rI4L2oP4SzaXrFlL9OamxIn3y
	aacw62v3aEgk9Zu2dVMSbJndf4rl9t5fKMpAp1OUmw6MTyxbb8bvLeuJLWg/qzDtwK5/pPcmwPE
	nw68WYZp8see8r3244YforyuwawR2FmY28NLnBKy6c0RtHOpipAqRk3/GY9KAhJQj7b1FsNtouc
	xsAvTsLsXod1IZ30/jYOq1+oootti
X-Google-Smtp-Source: AGHT+IG4c/ltmFn+ZYM2U03LWJ2WSMibTI8JvVco3lTM01jqnuwgY40zG7FK43Yn/mRbbubKlLsYtw==
X-Received: by 2002:a17:907:c1c:b0:ac3:422a:76dc with SMTP id a640c23a62f3a-ac3f22b52f7mr1161510866b.34.1742769581788;
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:47 +0000
Subject: [PATCH 31/34] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-31-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 7b00e65bdd9c25b3426f92355f8ea36e66c3939f..e8e442c503064eb4e570af5bf7dcff6bfa7f4656 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.395.g12beb8f557-goog

