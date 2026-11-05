Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910769;
	b=L/wxXn9jnWs9ine4yFtTKpYNlwQoTmoIAeE110bLijk/MwEXk7Z8SseVoEch9v9gSRoB
	 kT6E5hB7xPG/essNFQl4/jc2paj53/YaMimgy1PNxeXlWI7dJjfhEy8bqcl0EcRyukSPV
	 32A9xrU3EIxuUYf3Vt5+V0YuN/qMWw8L+LfWsiG5pB3Qbnyp1IvAl+8Vqs7GJ8mpIgpOB
	 RvRRDpxtTObaVtXAAlPn9RgtkGb/QwgZPlrmjePfDub2jq7ovdSIh7hpNuwHMnrcwrFfM
	 UzSDl8jQf3AU9AAHgpXzj8aEHVqodGUMo46ujdIS+YuFnGZdaSeiXSXtWpfRzAZ2KAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
	b=dNOLT9/O5rWIEeIGmJhaDH3NULY7EgxvIEvePN1j74hozjVubvlBwbHWNtT9m06VawBT
	 ucbQvEE3zytChssHaU+USYKQs6hLeFYWU7iaS+AD4JNkqaMIbs3M6BYcyYycVDMUp5I+c
	 +QwYiMZPJW6hKz6uzanjMQs5u9HPUyvQSWOZWSH3ACqEpeW9cS5n+w7FkUX9OxybG+zHY
	 +isBagJl2jsbBcHZfhFktbfuffMOyyghd54OYXR7sNm+R/fhpnRgWFkh+nFuPbKbVdSaw
	 RoCR5PRd61AA0KplYg9VWjCmLWoVUz5kM23KAUDSbpYncJzwlulza/4OY/toKbK0ozA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGmgdzyl;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820E8606A32C
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 20:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 820E8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGmgdzyl
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-353804b591eso4384636eec.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 12:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910769; x=1794515569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
        b=OGmgdzylBss2HmVL0wtcXd6GW+yjn8upmDIUxverqF9QvLbttFajMGBRXY0fqR9MPZ
         gb5FrW16QAc12KEiOKu3uGfG9oSK+V03BJcY80TAyO5w/Lq9GoIl6EqCNS/mGxfWmv3s
         odFZzoRMXjQHrucDfKnsoTkx5dAfjdFCaS4FlkDbA2BZm7JuLK/Y6rNmcJzOwpatAibK
         5R8F4/jugyHXPCxUm8u3FCqtjIiEX/7qUHolFHj5naTadT6g/xjedJsjbK0P1oW8tIHV
         E8TtrBgMBkekcf3r26r16onqoExxZL6aDNpaHjuO69U04ZXX77VKYG1gLlw38GdZCuAK
         OfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910769; x=1794515569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/sZwDULHUkiy8aVY/nozCvta0v8Hz7jxZdUOnEHfRM=;
        b=AtsGfZnruvOipAUkujUjjnDKZnBwIipmHvwH51t8NOHa7E1d+JJRuuiilhWU1p1Pmk
         kuBg5gHGj7lFLdqms7GQwCtfaN4PJW7Bnlk75K8JpWyYLXkUr/SCnZe0QNvwdAur4fKd
         jRRxFVOppql/qSEHCPVrlfOIKyB7B2W54bnhuvJKUVZ1mldGoTJ+4sDzeWI3ugo+yU9r
         jwauSsiF/sB5MpYCEKBgsFG5NoraZpyeAnZvdSWA89gMN72H4DjhU+ZCbI/3uOboJHx5
         ypVwNf7Y8WZAv/ikDkM5MXctMMYyWjOXJCcacGKCHVU7Hc2T7YPvm5Hqw3D8mvRR/oJu
         pslg==
X-Forwarded-Encrypted: i=1; AKwUvBxf7jSoSddza7163FiPnQ/4e9VyiPPOGCvmb2TbyV0D/5PnYFh2YVFKVsDMa/R9dh98Uegr1njN1SM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YeBmEAWboF9lnbu1OS1EO5qVdrOtTtG8zYKYs+5BARPBiMcJ5
	WZSwISNa3jPfgfMg/NZNqXNUCkXnixqnI98ek1+6QMqGFxBIS0UTZiw+
X-Gm-Gg: AYBFou2Bq9pRTymUeNAkD4hD/VXK6kEGsmq4R2ykXC1LslGhe2Kl7R7+YU1CTkIggOC
	IyrAz8Ex6t0hjA5HY49pwTNMBEFnFqu6LgNAj8wiW/bPAhCDrwLDuA9ljSDjQHBg/BSRZOsaicP
	X2nhZiHKFLlas3TRmN4Xjfrom2BvroJWIoRdsoT3sbX/+/slTcR1Q1z0BMOAWS4PtM2NWAl/fPF
	Jl1YQk0VA4YF6K6gs45x3sDzWCvAmzKQMCeKAla3XxufmEcxDc9EK0ELgTHzq66S6cRT39MkzrO
	X+s8bBE5f1TZYP7xdbvsMrV46sSHTldws0/CLfN89zCLdkuuOXVmjxPLFV7Q3/dFMdW+oC/Sx+N
	tD9M+npEYeu9W1a2kYzWCJfN4Cx2XC/9f/m0u1/+yl8GvpBvNY4TJsvWVLP5LBGWlQ8u+kTiYpE
	cAFf0cK/ycozy0C3xNlRkJMnKV6f+oqF/W/MuXtdmZXs2fzFtIXab4xZAwPHiBdF0IsfQ6fI4XZ
	AT8Re3l9+lzba0skwyeQKDCfb9lvjwstfr1L/R2G88dH12iRI0+F8phN0cOFmbX8pHbCjwTmhMr
	IGs962Ed
X-Received: by 2002:a05:7300:f3c9:b0:365:d42a:f415 with SMTP id 5a478bee46e88-36f7494d0bbmr318179eec.12.1793910768645;
        Thu, 05 Nov 2026 12:32:48 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm632458eec.13.2026.11.05.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:32:47 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	=?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>
Subject: [PATCH 1/3] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Thu,  5 Nov 2026 12:32:40 -0800
Message-ID: <20261105203243.2292647-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105203243.2292647-1-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
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

