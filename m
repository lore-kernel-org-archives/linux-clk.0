Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285098;
	b=t1VBUy68Jm8GsEoJQ/6PS8OJ2ZdhQiYTiqp85q+I+e6dulD5ASNgW0a18xMbpDVigevj
	 bm40tedHbOxnwCjMrSsWMAhM+oWZRIn+TdKbb9CtkUox6mlTCOpEpBOyGVwB0Yk9BeOis
	 UevcsojmcX608GBnOp9uGY8DrweW6Osx9v1i4O3cQw9UXZ2CRkVm/mHwX3XLWCcxxrmbK
	 Vt001ODFhwkDRpkmuYtXWAYmo7EZosgVfcqS1s6njDbXvd6epZRlJajOwuVGkRt+MUzgf
	 eLifLb1wmKWn+VMmxETZ2SW2JOnosOCKzF29m2NTcmwtK8NAAxeILaWJY1UoXs9hO8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
	b=Btjp+VAKS84wHH0h2D50Zt/9oWnvGmeLXDl8vCsRydOxWns3lNksQrJrFvWWypsCdu8N
	 kgs93lq6cv0Scn2MV985faZes6WqhCN4DPnjFWX2szzGf7W+aT0E/W/sxuBXwSvd1cCm/
	 yqMTxp7wejqkQQdLt8SGq3OBFcnmmQGdsF2Q0wPIsQImgv3np9tUUtJKpDEfDpwUcBpc1
	 oIzwbG3FdYNSNE3A4RQKQ46+8xGfCrwXjYtGe2SyWhlMVRUT06p4qq8zR3cN5kGvQwKLP
	 M/yZQoppnxcwD1OB/IBuXiWHs0URJA/7UD0mVsJp8QxpDB9sm5K4kEjzc3tJUFYwX3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cr+UlU0Y;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A2606A321
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 04:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cr+UlU0Y
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3183270eec.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 20:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285098; x=1794889898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
        b=Cr+UlU0YsbuBiK+1U8LGqZRzrg1WNx1QTf46Xfbo0OhrVBJ6QtuPbhqW4PYWL0C4Xs
         nf0SEfw3rq/0f/Jd+4TaTHMzV7Pdeu4XXuXwGGWcocIHFJEtzoQu2vTT6/CZ0Axr8dMe
         phUx8BIQn1Xqz5dGoU3e5DE6utanDaKJ9AqaNNY0UtyUtjDfZrvuMTN29tKIpcZNa43T
         KFQZK5rFQZPQOVw3DPAFUSSiKnKHMfNvPAfVdV+95wqHR2v7KGMu9z7KGMGQ8X1RsYhs
         ff9w5u5g7cBLj3+tIaX+kGtTFU+b0ikcdKGa8AYIg4ckgW2Bi0o9v93Qmq3Msu7VU6T2
         b4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285098; x=1794889898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kceWkIpj6qftJEKcjmO3ZNV1ihAxvI9do2C7loM/bz4=;
        b=YfDLUorzgdQijNwj/emeVU1Wqw+8XamUSYftg6QvVwu/LCDdDWzOQD6xJ5kQm/0zvF
         7uTi4Mn7iVzKUdqEMMCekljNG08lJNe4H1Su1uNHHGvoYwLtwKFV8D0xm8+mKY3Qtikn
         Gm/JxPq0YDk6JKxgA0JUm9ulww0NBgNnFTPFpw5oDSyxm5tuFrHhd5GSD0B62SvoqYDz
         BcxFBHd2aQLHiylgcP3Ln3BEvKGYz6eBMHMvwqiMPlYVunxbjf4Vpmba8HUlob4oi2Ov
         fntmB+rE+r810t71EfhHVVFRDIbo+6Ljk5otsMjidzSX2Fd+ugFg3jXSnaPNG0BaNXyR
         cG1A==
X-Forwarded-Encrypted: i=1; AL+hErGDWtCpizI47c5cqurQGuGe/r8aXqsmP+UWje+37+65LNc88tVfW1KI0xYaAdYujLq3722gY9tWdk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UGTJk+OD0t2qXqjO3NjQB/Py2v6Z84qHFHzmPg78tdxa5jfB+
	QInKOR8/SzpuchLDd/veObIVWmEQlOXNe4d710bcWuSHKv96WGdrOJcU
X-Gm-Gg: AYBFou3aT5V03ecYoA6O79azcDAaOws1mnXAh2DYLhTlY7X+Xs6IHkhSSoKdcXqC77l
	ZA4MQNILLn9QhF+F2ogPS01z5VLMPWOsaPICFVz5No4MQaC+TsIsx+oFpLbN9J9IboYSjnFvl/7
	zM3h/8DY2JbyZalz3PN5s5xGNVoZpnprATYB0eKiZrGsiCXoYy8Eet+7d3olyLiWsGeDWy8x1Zs
	nJhyzCIDP0Lraq19ziUktv6/akcRDYHTqoqG6VEuohIVwcyfE3lQeCrputsnpdoPxWyEvV3SAW3
	CLC+L/59GCv9aYSb9wGmuZ6wmQqZtu1ylcFn00zfHXm8ziZFKiHXo6JUCyz6nubEpu6/HzNsUmm
	db093L/XM8ni33y52IJHpiYkLY7sUaDGfrGwmRcIBF86StOpS73GYEHzE0gLWcl0bsMz2bKDiGk
	rkL0xUvNsHOwuhPwXbrzDIbMxOJ850+1tq60wRjgjO4yBB39ye2srgG8QW3ve1a3lHRM95qW9tD
	4itexgP/SUrUo/TrQC0TLHU7HWOOpgmwBeoe9ds4SBgbCmTCYO6wfd+J2b1FQoL1I0pSsHb7RJP
	SaK1EnCH
X-Received: by 2002:a05:7300:7f21:b0:35d:eafd:5737 with SMTP id 5a478bee46e88-3751f55f6f7mr1851301eec.22.1794285097632;
        Mon, 09 Nov 2026 20:31:37 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm3340996eec.25.2026.11.09.20.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:31:37 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v2 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Mon,  9 Nov 2026 20:31:29 -0800
Message-ID: <20261110043131.1985993-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110043131.1985993-1-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPU1 clock enable callback runs under the clock framework's spinlock
with interrupts disabled. Its readl_poll_timeout() can sleep between
reads, which is invalid in this context when SMP powers up CPU1.

Use readl_poll_timeout_atomic() with the existing interval and timeout.
This is a prerequisite for the JZ4780 SMP bring-up path. The original
CPU1 clock implementation by Zhou Yanjie is already upstream.

Cross-built for CI20; the subsequent SMP-enabled image brought up both
CPU cores. Development and validation used Codex assistance.

Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/clk/ingenic/jz4780-cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..f5983033583a 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
 				 !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
-- 
2.53.0

