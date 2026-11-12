Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509150;
	b=IsKsrhFu3m0WkLEQv6cuFVdwuN27VBaHJ1HWwk5s5A54F7tvd1rb0CouFwtdA18rzlNb
	 oAo2MgoG/b4TCDxilXAKceMTFOwctVqXwdCnLcq/ZvzdI1ho6QTh6ZUbpvK8ti0YmXAUV
	 QQVPX9dI2P8u5IVPudCUpvURmTF2q1WjM0cbFw3caltywpE2N0LKzDU+B7zrX6jluL4UQ
	 h6LdKYR/KUgWi0lWULrtffkfqCe0VlHom7F2EguOpaUQSqimAsge5T6b+Tzn9taGRe0dD
	 P2oARQBGuQLu6as+Ndy7eoubQmLDsgihJMdiRmrqURJLxauqDnMOHLIFJBJ6Q2PBCFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
	b=EfUhjw2nRRgTjHQJgYPP23e9cLyzShi661k3s3JSdQ66QSTUIPXxyebJQZOsbmR2JGsg
	 HK62UdObWYXJEsJ34R7SGilupIuet5yspbRA9d2m/jr5sTSi2dBWM6JFIkVcPMYHSGaY6
	 W0cpyfQFyZ3iZDmHMhZB23BaTu7L8KxKv0CyBoY67Uf3cv4Pas74L8fnSV8Kf0IwhyG+0
	 57xEzkk624ODIxky592RH+f+sUTVXFziMoCWPyB51liz5mnpn98INT7YRhdzc2Qn7iHQS
	 1EPC4tsrxcrhk8O3GWtUwuLaShq/aM1pnmD+gJ+npAtxHGsdp70LqAPbGOsqMTPYv9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvqCJG4s;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1E606A880
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 18:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C1E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvqCJG4s
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-372bdb942dbso227180eec.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 10:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509149; x=1795113949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=tvqCJG4sadbpnO9DnV+uFosM78XxQbI81mrM9a+WHoU2qGeXvav0WbusoVQ6AnJpYj
         tZd/x4021EFc285UdhOKNe06ZSJi8txJuYz+iANhdPUat88400IL3CNIQotARvfES6NW
         Xd0gE5Imo8+N21hsoZJnXanCSCSrPvUJLWdLo4UpR4tp3qyu/CX+nfDV1R6iUrde4tdU
         6Q5cQtl8j6sngNzYfyeeW7QcO8Hn4RXclW2JVOgz3wpyumLZjbD6G3BcUkIkL+moEKOV
         xkUV0ozBi2XNL+QLf/EtSLKqXyJ9F96PcSaHiSd396HX2MyoK6sJJIWLdncNDXW7VihA
         TC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509149; x=1795113949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=Q9++o5tkgJprAL1zuZKwKdVunWGi9p4K8XalyP3arfAslcAwnb0uzStVhYPJEWBfDD
         sI1dqTgIEpQKZx3pkAy3P6PvW6ghqg3e6pSDvLSqUhW4cDfiRd6EpODivL9CfK038UZc
         jTd6LEpi2vZAzlL7KaWO9i87ulKqqyGG3yxHeXZzsEtgFRMxgak7rv8UGfVo2KUZmWSz
         48uCBB7uLQTIRSHGZlY3bl1WoHhS9f3+mPrOYR1raIjUj5OlzQvQMEa2Px9j6zLlMg6b
         /7PL1N+x8sdrvXDqpshI9lWinudu5HTcxwV9vbDKRdzSYdVxuoza1Zo+r0lMn888K72x
         aZhw==
X-Forwarded-Encrypted: i=1; AL+hErGqmQn+3YI5QBMiu6bKh93zSjiNG6lrtotA2weATig85bmMHJcSS3SlDve4it6aczxyd3HR77NjCzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AjON7xXFA22vH/GQAOupa95rHig29z5IXPg8co28YWortTGx3
	CwZRDMqzENtCDc5/md2CP4+sgZmgGviIjeVf7LDm341QjEMnCPxxRFzp
X-Gm-Gg: AYBFou1KpaUaWtzL83njbIENM53gqOoDr3llDovESCJw6uYX1OtJAtYhFHAzXmtTRMQ
	B4E1rjx4yk+OemA/JbR0mpveb8c5dpxQNWz87Y6gOigXptAqTO8na8X+bkDveoRrcQPHbbHfp2w
	6tz7ucTgeB6/NKOzDJu5xaoFWHTd4NgTPeowfgvyQYKMIlNiWd2XajD2uuvdTjabuhoQjn7jF1s
	bKWwIrKoPIdqKqKewuUJX+f8n/sfRay9POMKaqs/mFl4VUea8gru6UJO1+jbiTKTGv6KiPkyOKH
	+GCrwJaR+jfXcKDbQwRrxn2TOkPKm9ckCsysWi2PTEbnUN3LnbWYmPMvCTXRN0cQwicu5uBfPRU
	3HuGPXk+aX5P3uu7CeMV9mFZToBg3ivnvNTVglho86sVURapj47YxtwQgYGkMKGD8PQYwkJcRaS
	LdAXjWjkmgDKp3SP8cY8v+MHRUcM6L93MA8kOIcxT0Bqq4ohLRpBIpopgUO63A39kcEMH/EZVDH
	57DjenbHSJFGZUsHksysvBO/UiIC75HectI96mdnPbxbf2iIXV+5wSpK8SOaaGLwdp5nJn7fyqy
	E7kFDH5Z
X-Received: by 2002:a05:7300:d181:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-37967cde7c5mr17495eec.20.1794509148932;
        Thu, 12 Nov 2026 10:45:48 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:48 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	stable@vger.kernel.org,
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
Subject: [PATCH v4 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Thu, 12 Nov 2026 10:44:39 -0800
Message-ID: <20261112184441.3724150-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112184441.3724150-1-f.fainelli@gmail.com>
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
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

CC: stable@vger.kernel.org
Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/clk/ingenic/jz4780-cgu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 1e88aef7ac0f..1809f8859c7e 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -242,8 +242,8 @@ static int jz4780_core1_enable(struct clk_hw *hw)
 	spin_unlock_irqrestore(&cgu->lock, flags);
 
 	/* wait for the CPU to be powered up */
-	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
-				 !(lcr & LCR_SCPUS), 10, timeout);
+	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
+					   !(lcr & LCR_SCPUS), 10, timeout);
 	if (retval == -ETIMEDOUT) {
 		pr_err("%s: Wait for power up core1 timeout\n", __func__);
 		return retval;
-- 
2.53.0

