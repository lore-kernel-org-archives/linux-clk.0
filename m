Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E0243369
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670769; cv=none; b=NjP3oGastTaSpyYArdarh6JogwJ5/OcFsjvmQt32BiALmmuG+ExgNoTYlPUfjKqfvzgQ0YMlIdOn9o+XnY88v3l08OtMWWz4mcDajZwxN0HvRnL7cd74nePXwZxYjhkUedW8WcHiFWyCDsCW89HAUVp9Cqxunosv6IA/EzR+z0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670769; c=relaxed/simple;
	bh=OstHPLtut+rInIwPbWUGG5F4uJhc1s8p9YL3Yn+eQfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bYbtgIIeki062T2n3vqCiezKKHXd2gDIL2LKE0SZUyFDOO6TgG9buykb//B63VVLZFNKCBL3nQV5nXCMFIEe3qGr/pb+dDW8OwvNIeRpAcZ7qXCC58M45S8kgTnElKW/3Fd7MtonnzdpHNdOOQjYkfYHFSjhZU121ajWWyCq6cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0/vvPQJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0/vvPQJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so1282901a12.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670757; x=1744275557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=a0/vvPQJ3FYrLA2YsMerto3UUJnPQNJcOSWbV78Xf/+9Y8scEybfd9wx0+nCwPBjoT
         9/g7VDYzXVO9oOuheWQnlDIbcN/gyuvKFotrrLuYDNMTqHBxN4G/uMdq9/q/6qTA/191
         a/M61ijIigm/uAaspNgGatMc8MBxlgAnooBdaorUGW1MyYIO/s2diRzqEqhIL4zkp15w
         lPlxAocEKnkg3gRWneFoJLiKJLxH4MSsDNJJ8ygZwZzwHi/YCxLkJp8+dzFR4+iRh2JT
         Xy4DnknyNT/9pW8Uzfwn2akXdYNcWkNmA2LvEXFWAp4d7/jhXjk/K3UQCnU7eZBcHWFo
         BGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670757; x=1744275557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zOrAobgqux207RdFFKdVSyI3bSrdsl4WaNtosICsko=;
        b=qQ2B12rgeaolLRR9FSSIPqmiL2NjB0jWbKdobDE3KdeR/jCE1RkBH6ixjdmJc0OnZh
         7GnUScQIUTNFYUHCPfB4gsddpfDbjWEvJbU17XHlLBxMiSCaknAn0JUE05P35+1Q6WcF
         kyzfDuaWH+KK0x+g+u+ul87munCUXo22Gdpg83MWNgfggvYRwCM1iTknx+OUTg3tf/Uf
         u6ECIzeoqfinEF1c1rMgqzUimICf5T/b0foPXTyBu1dZXgcyXVa+jQsWMpqlpqUJptAi
         12pk9hKhIorL+h8YGKEB1L5Snnv8ilAGWTckY9yZA3xrb/EAOQlttUmnZyOwGMhl3rBK
         KFSw==
X-Forwarded-Encrypted: i=1; AJvYcCX2RkDljo3ftXliso8vAu09VWl8LChBmNOZ44YfAz8ZOwboJ5iRDgIKFwCHjKKNnTaUgfzukPJCEHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAFYSgKpUUlzhxL1BJnccs9t0iesJiOVM+hgAZGMdJfXsN/8hb
	up8tyH4H8g3A0kp0h92uZQ+ydf9Ux1TYwOLf3lHbe8l/+QFNz9b+UhsvbkTasBY=
X-Gm-Gg: ASbGncu64s3PbKS9akI1aHwnSCy9ss3M9pBE43nOjr9dwPcPdaIhn1okORU5b197mKJ
	UexRoGiAVHmqOWU2dVW72CfJHd9q6ERVukiq52iwMv27Dk5u7VaOzAZE+lNMcERyMFyDBJdo480
	bfBFJJsG3SZPfQkgRvTxnG++UfevI/+H6Kt8Yh+tu2PWhDJN+0XvkMWk7OQaYPswMCBPqDOVZe1
	S4wTbCjQzgkD57UAFvNlzjDAAl6cUmf6bsJL07PEww6DBuzm761QOCuTgXoPOH3Sc0oAc2y19ZS
	gdHnrYlTXccwdIincKZQyyvGuuWJI3AyTznQAJkVfUob2/wpElqH5cWVUpmg2t2tcoD3VK1myoq
	NO0oCvm0w3a24xUZZBUxENCX8eMRK
X-Google-Smtp-Source: AGHT+IHsXg/hWI5W6L2JAbs5tQ+hU9M5VZLzhEtJEwJ8sjShCEtp9J7Km89nFH/JtsSi3gQsvsWdtA==
X-Received: by 2002:a05:6402:5114:b0:5e5:bb58:d6bd with SMTP id 4fb4d7f45d1cf-5f09300645cmr1255191a12.10.1743670757293;
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:20 +0100
Subject: [PATCH v3 28/32] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-28-b542b3505e68@linaro.org>
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

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 0d8783577bab4f4ebe61050dbd68387d970773bd..7b00e65bdd9c25b3426f92355f8ea36e66c3939f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -243,8 +243,8 @@ static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
-		struct rtc_wkalrm *alarm)
+static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
+					     struct rtc_wkalrm *alarm)
 {
 	int ret;
 	unsigned int val;
@@ -451,7 +451,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	return s5m_check_peding_alarm_interrupt(info, alrm);
+	return s5m_check_pending_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)

-- 
2.49.0.472.ge94155a9ec-goog

