Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D024166A
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670743; cv=none; b=HnW4PMa4cXbIUXaTV+R9k2erICtAgbeAt+gK+mjcUjG7v7n/CQgkL8VI1EfzrGdoeBOE3kXV2wmwV3AEqyPvyiUFTX6CSzUhM+uJBzaETpnIPFkzrDI4tO0HarsK9GYVVA3XbajHxIgDicXWVcCn0pHxxnWwXso5XavZL/sfMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670743; c=relaxed/simple;
	bh=GY5aflUP8HyQZVCvYH781i7uGwHWsWCKLpX/UgZ7jiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wy7HFAqmmF4aUWBRmqRCwNqlITelcJs6DwkNHEd/MkkQpup81KYnA8kKFp3Qcuj5YqHttHE+ZsAifw9fgNgzp7HxkAdUTrZUofA4SiWNhcQGHzFKcsLhlhIuM86G4bjl7c4+jen8jQxvvPcZN26HMLYMXSXSY2542A6swdx2uzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMfY6vZo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMfY6vZo"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so1241056a12.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670740; x=1744275540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=zMfY6vZoeD+0C+rJjnkjVt3bDkOAdTXIiZAFKxQECBujQ8CEzEwgH5lM0KDR1GVhg4
         IB6RmNOQnmB1sPJrzkIm90OxheOn1KBdZW4O6gcT9IQRszdJq3QbhfSPRb+w197+l3Iu
         a3hy4Hc+uX9th4a1/y+FVGMUQhI9w99XhPdBkO/osh+phqb+VxYZZm5Pxj98h/nAOCvO
         OaORvxhY3mmS/EX4ipCng5roXPVOyd1MQo9IEy4a4tWLFe2l1ghafJF/fQDb6XKhroYC
         jFPC4YbidkKnscT7zB4iO/RfH868ambV3SjiY0o8GTdLWFeeJQwn0ZZku+rhwcPoLpSy
         fzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670740; x=1744275540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=ITdrX0vgLCnz4ancFyt65ef4sR5t2te9oF8e5O1GaDq4y6jlojbg0xX1mfsDtaiLOE
         X+T6NOyc7X6zK/nuq17t5B7yYiERg4YEDredrPrWv3ePU1EYtXLT+GPT3rkonzOwI20c
         WcS0BAjVKOVVuEkBI6N7wJAKVZ12b+AMXPw9zR6fAwo3Uq5Ff+8UUk1oL9/hXO/tT9Kh
         20fSuqBB31zhXiHqSgwy36TNMCDkwc2uhOLGvMfRhyKQTxyo5Kxi+Yj5MhTh43OYxkd3
         CObfSUyqOewRRwj8Oq7+b2Yq4DAJkFaXBXsfMDFAaKGOo7Ot+oIZnQZUCNWwC5/rnZRx
         pdVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK6lcPRU81vDSjMD/soCO7D6xU+cSplQmKNvBEjv2XJv8fEvDFxvjJVVoOMO52MsBBAC2oT9Pbw2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZ/f4agKwNXjFCvQznqkwrwmc7mzd2KL+FvEbqBS6+DPqEBsO
	7notWPAs7G6lz87k71rq5pF3oPkc5/+jYiaQ6Mq7FsB3393DN6MA1ZJo0pFudzo=
X-Gm-Gg: ASbGncsO62aZwUX+mCzwc4EwsC/4S/ugAPjQvApuILY9uQ5Y39rKkxxV3Ip9441Crsc
	dgg9jZ7mMEnF9zdraJ3OpDsjmLCtemtCXEiAmFYKtGeTcT8vKE8G7RNNm/rmpIh/+/5VQWGvstr
	TNrVsqXHBteKrzYRgGS3MOGTy9WW3tSfle4/bgqLgsgSNuTZVKS4d/cWe4BYju01E7rCBVZxyhv
	0tgKKDer5UlXp67ryvprZi/P2Ms6V9+MigEWrOML0+lJ0zwGrepe3vLPoqFBHTdzkjdlPs+PDW9
	tLmHey2IKydXjd5WOmD0VjB+SXevKrWe+GqqiebDd8HQgYH6LeK7FR27qDAAvtMfOHUmVqCeQLX
	aKLBgTmshRJsBsnOZlMX+auAfhmq9
X-Google-Smtp-Source: AGHT+IFpNCgTUy3yn5kNBStSgNtkMlYeVkvi4R54YROwAonbhkdXCkRSsgfQeF745WZBnvMJR3nP5A==
X-Received: by 2002:a05:6402:27cf:b0:5ec:958b:6f5a with SMTP id 4fb4d7f45d1cf-5f08726ef19mr1525065a12.28.1743670739930;
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:58:59 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:58:54 +0100
Subject: [PATCH v3 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-2-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.49.0.472.ge94155a9ec-goog

