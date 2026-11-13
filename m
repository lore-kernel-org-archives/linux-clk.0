Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595378;
	b=y0lVVg4G5tuCBXKwZkE6nmMb1aPXa+z7oDEbfHaDsrdY3FCcm+GsEZBrLHfsKJxwhhwf
	 rxTXHoCZ8M+JPC6qUwFbBWUSfc8V1fjDSPBsMcNE8UzlHODZJsg1j5pAbUxBBpz9ohPz4
	 3ktrg9AZ3O/3BmLl5Nv3zYabNTotkwTMc0HDu9zLRAWsJTsk8B/IstXbLr4p7tliaZT+3
	 8RxMliqusAEIUw3Sro7jT5MiNs9qyXXgqzkIjTXGRfQxQB9uHgiTrrPOQ0WwHUAnYVE9G
	 iPgOsn86ywK21Bwu0HfTTJG6tYQK7bfhfVz6CBt2VJXEie8Zj8yA7qjccE5KH6/ynEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
	b=lkocvfAtyuQRy0CqKpowm4Q9sEJD6d6zPS3JhzvOLVp8Ygq/UzFzvXvsIVHw5x6x1Y7B
	 uVdNeVqOtq/MVw0KwPc8xn9AgdRVSbcuMcXHJ1waX6AQv6mAnBcd7fWLd37KzbZW3BXzR
	 EBnlvZz3BosX9URqmpHJdGhy6qwrXI/SMU6WCGJAtJHB7pVd47U1cg96RUL79KLWWsdCa
	 ZnRzwlmIV/X2xOAE+nFtjw5ffmoqUOeC4DXlje0bn/e/aOQ6Qw36qFdyYCtlT98sd93JQ
	 xgBpN7BP1cmBB0DP+0r1mdgys+A85bSXeNNvavPf2IvyXpNjNxje7lJJHd2p0NeAVAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLUfjCmP;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748A606A894
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3748A606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLUfjCmP
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so1638017c88.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595376; x=1795200176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=JLUfjCmPNspwfncVcLCqOgrOYo48PDU/oZwv/s2ScUY2tCi7OUgYTFuEpdqXPh5MEi
         kvByBIDETbxVN8UX0f2GGLDVuaupezMITaxV0VLZceNmvLytYmA3RJLqqq/u81gpeBdX
         kuRHLkO3glN1ZVr9zUjwO7AXuvoX4K8ok1M/rE9BssGt1InXbbL9TFqHE0JgnRicS75z
         RAdWayHaQi2mysXJHs2pughOLURwVufmdoAHYqry+gSShG9xvntDYwOxBIBNj6014xVT
         KD9mjYPdyrgrxTcdOpQKbuukeg3xxS2pnL9tKI7TQLVVTP+6yYP7lrsZrQof6oAB7PG0
         y5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595376; x=1795200176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=iv6Xv77yReNldrTUK4kiko33D9WwyKnFNEP6HXpwb/NcQIiQY+15aT/DtFHNAex1S2
         ZD3+VmThLoJxasiSQ+249YbbRG9/mIKp6mkqSulr4r0E+VDyb72ds3ZGBl6e2T5ZtWLW
         tlp4G6Xz7lido881RJCjMEQiiI5fQHXpkYAQHaPICZW/SKzI5p1hLQIT+i9imBemRjvv
         JoTm8WYv598bm7j/fbguMCZ+kw/o+lwFbwRAgRIhlKiWTgX65ylQI14UJ2B8pTRdF4y8
         0BBv4epj48SJOH0XawSb9CHvwc7+3fWqTBUM2QlHhp65xwW8idu5hQas+5eQF2x/mApz
         xOLg==
X-Forwarded-Encrypted: i=1; AL+hErFft0uEOKDc97TaKLmuHpU4juKOQj2nY9gS94EoYvU265E5I2nm3gNth2/Vyy+xrpUXFGjFRe6His4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OjUL4sQwKEuvPCIFy9+rBq3rKhJYUTVNeNvfdMfN23PPbpWBi
	25qBmNKaFzgTcdeSJQu3izrsD6dI/PQAnaSTFPgJbAXJM9XteK3CfIZS
X-Gm-Gg: AYBFou2B/CeBA/PiOhi/3z7C8e3dnJsATgIQOacTRJxU5PU1NGsvvkv8i3fiKCReUu0
	tKj/k6T73oz/a5gmkgGUG2KlzOqDGXPNjjrcm9ZJnlt2rvNNoj2x5wQ87ifYFDDBn8jRJOedEmZ
	u4ojTVDzqLltXTnL+nHxTdHHr2BaxhgT3Emi9UyeVnd/1HjSxDQbKOaP7mZY8yjQTjdDPPhEDCM
	SOE3f/x6zIuZbRFW1cZpwsw5dEk6aDBtZzGGneR75gYoGsRSz3tG3jUn7kRn/pZGvmELSP6XPYg
	vklChoJ7qvmZbliAjLNxYw2DwnTG/IEG5fISJfML6ykeknEwGTn+b8nix0w7soBUcZecObciZLz
	LjM8Px8kgQKIhzwdUZxSTaHB0PviHfjcDYqCuzFsvBRH6/KIEDSF80m+fW7og8dkJ8v/FIRs+0p
	60qX3Y5ViGSjTiwb0/vh3Xw73DAW+7P2mkW/fVbpFlyDzHArTGIL7ul/3iA64FbDHwWIcXBjHiP
	lUJrGRbcBi6vlkTNhBFFcxA/5QqewUsNsfmc4r8QwPoAjwj+W9DdyBPRKbrRSnshPOMq65rReW2
	XYKNlpYI
X-Received: by 2002:a05:701b:4648:b0:144:fb31:a597 with SMTP id a92af1059eb24-1b5031695c8mr3293113c88.47.1794595376420;
        Fri, 13 Nov 2026 10:42:56 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:42:55 -0800 (PST)
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
Subject: [PATCH v5 1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Fri, 13 Nov 2026 10:42:07 -0800
Message-ID: <20261113184210.470320-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113184210.470320-1-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
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
Changes since previous posting:
- No changes to this patch.

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
