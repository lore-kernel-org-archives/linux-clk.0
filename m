Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456980;
	b=bplOo7oN/JO+/GvY485QfZ31yi/KKC5I4UTEdAdojAz276IYC1V4IlXpdES1hPx757kZ
	 qd5mDIEZ/v+PaeD935La+RfUw8tlMqm7WT6o4L5nCvpnfrC2Nr29AxxYiEOwdf05dwz/V
	 8f5ghF2PmpoVeM9NLimgXtnVoVS23OCesDsRKYBRCPmw3d/3wPXM/dRgg622CutwTQT3t
	 u5owVNi2N995hBtVQ3KwP02qzOLlYessjHhkIToUnklCGNmUgpy8otBtZShx39aPkVdey
	 viUswQaKjfC3aPsmQs2Pv0PeM7yAhsXHvQB9pbSgu+srmrGCNL1K+4wiLFfDdUhtpDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
	b=E15rhk25QgcWS1psIkSec4iqb48MSUcOWVIHstJ21/928MXZg/WHUZF+SzW3mTcKKUjk
	 BOF2YBq3yoqWdOYkJQ36l18WZCEw9/C+QPtbvpOe3hf7CTm9cIBz9iTQCW5I4nJWSco+/
	 9PltOP4LNs9mheIbBEB9a/A1EUkzixxz3ZwJ/O1tyJFZw1BmWN/WrTfU8VUEmpsW+UIdJ
	 xjWEVOxErLmYyhJ+Y943Ck/So+lbL07EC3KSmuOeq5JBNZazhSAGMuymHS7ZYEsk7Gq+S
	 uHh5IESU4ZQxufGXjNRK6grreWYug3h0eKJwuH7Mcr0kwELutfWIlw+58542Lzgh2CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmJGZdJg;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B1E606A33C
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 04:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B1E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmJGZdJg
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso8141263eec.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 20:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794456978; x=1795061778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=RmJGZdJg942OY9rPhScQBPvnVkEnUGRlsngqVgdkiF3pKXoGg2y1cYTwH4oLb8CQg2
         5N585j9GpOm7a6X5s5k+2F0qU3kMRG0Id6ymOAWHgSX9fYdQTwd7cksIITmK2Y5HXVCH
         63sRX9aIvluSZaVFvwDpVH1jBUVkYrv3HZT7LIl4X8K+9c0goL5LoyrxNSlZxGIpHstH
         u5Mx4zbi0PpsGq/6RETVOripdngpUkEHMA0Wu60KDVQHebkEwI6X6GM52/sMvAY+MHqm
         KzyvfCC3pvLX71DTrsb4OBfQAZe1Nv3lTGMyOUnCGnXQ1MSUZY/8tyjocmoE0RMOf2x7
         gI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456978; x=1795061778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cx07ziGcA50aUj85Mm/ZBnVBryK8gFtKvDY2YMtoJYc=;
        b=Jl5EmrOTldl6Wi3LOmn6Nw64HLihe0P1Lg3SsPfjQYiK/dc6XCZmdr9j7YjY8+Br5A
         X9jl8L1h7galiob3xrKxDnHQQHg0WsolOzX7FfpsvBxg4f90uNXNDfdATg8+fYRDkafe
         nlF0R5KNw9A2hlJ4mm3Z+edBFVAVWoB9212769BmEuekXyT2WTgU5JJ4/ZTNJmL7KNxE
         /lM4Z6B/RgHU6z0xhEGFUSHrepQ1JLPqpm+2c8yarUfIY98DtjVOA5auIgciBqd6r3r/
         tPcjhmMt25ae3HJp10qkJTdipsBqecolH1Hjot/PWeRqXli4JmpMvvFZN8CghfBrNyAn
         dbbA==
X-Forwarded-Encrypted: i=1; AL+hErFjmj43SfvPB4OH38qKnCEiVplSMYP0P8bjGqRfSUCXJSZDvwX3wgXxpjngM5SPr49Dm/h0J40sG60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ouR1zyJvOFYKijPNft3DF7PWVQvsqYTZjUTPBzusATfcf8cMp
	/qnqy2ZaTw1CNLmmxzmCbfddIKdkpyoTOZJZ4NNcBVKIv13Xm68uMORi
X-Gm-Gg: AYBFou0O7SH5HBIz4+ghG6L1Ev3jM0L2vfPEBUc6ZmGKMzsO0lCUWOfgGbHscvINUvz
	37cem7uAiQb3lJOKMOiW05knlDFBT+hIxPUoMUG9X82yHVzx5kB6TF5vTZhHUpJfoG4WjNF6hiY
	NoZaPyijtgc2r5FvWqUtUBqMqI5PAcnH+q5abUP0B1rOekwxL1LS2+7Qw13LbOZZ68YoXBIeH5R
	JBN+ydakrcHjTCvQau36FFIKW9ssCWvViXbn6zEr+hxShDlqX/c59T+Fv+7z2OzCDEAjrp1FuvM
	bnKKgXZlO/blPzQKC0l7d88xDrzL2SjA2Xbpt+Hj+yqnOAyUoHB/USA1syY9VPrO7XlohHrhGBI
	Djo658folzqVgNB7NVgv9k9L353nWcFWPoZzP8/ywzmP6CYWm8Y5FZOTQdrf7QxvDj9sGaodNkE
	fINNabo9RTWF03rqWvcS1UeJFTeAqS0+EqY06LYYVnkaML8vrh3uYrPGuJJSMxaVgGnIOdBr4Pl
	5oCVy8duWorrhsO1ZjTLlehjuaIx1mUetSvlSeU/23Y1BfPzNV9nDHddIuodlCnQoCilcf0vt9/
	Ygi0PeXF
X-Received: by 2002:a05:701b:45d8:20b0:1ab:9266:f50 with SMTP id a92af1059eb24-1b3c03766d2mr4147018c88.46.1794456978493;
        Wed, 11 Nov 2026 20:16:18 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21300801c88.1.2026.11.11.20.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:16:15 -0800 (PST)
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
Subject: [PATCH v3 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Wed, 11 Nov 2026 20:14:20 -0800
Message-ID: <20261112041422.2997275-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
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

