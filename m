Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595383;
	b=pmFq72tgbz0ilOwvPpBTL/flrahH+Su50vgSXV6BaJTJxhBlnoL11BmjFyxJixRZWCXd
	 gYI1tOkyMUdcH7qbr1oeaIJRUOWYFL270X6BsuIHESoJi/KKtifFtzx1XgVrJHCvDzaFF
	 hQtJjthZy0iBAPRIRrBidi7bTHB3gyHZZxSRMaG61RCNQERddVQj3tjAXyvqJajDUxW2j
	 RYQ8CSFAJnZoaW6Tu+JgMqbLLqPYJ5e7w7OfaMwJ2z0AJiahI2TTgSdNEdialrqOr6hgF
	 dgVHSqmr95HuGg8BKIfnQz6TxelWNWQGHFbo1SE5QcG5EPo+jiVOs3EdbKxFs6Ze3Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
	b=mef4diHMmoZ5QfaqSopov3iXEtbQwFUzx+RNEAky+6AjQqeykXg2lEwIxQRcvmvL5OhW
	 BbwV7QJwI7b4KdXdpGFabg4Qqo8GK6N6baGfn2qj+HavZMwBPJ+B/GHFhpBTr7idO1bJk
	 9a5+ynH6VWJjSderjaAceawJkuF1yHM9WGdJ2NrPtrhLZcwtgLUhC8AxmsK6TQ3EP5DGS
	 5a4UyF5pl26j6Cm/B1kV3R0jypOBcofzniSJrRjCkQtSXpNRd726FOZf15lWgwDZI/Zh1
	 Lp/3P64ef9qtVKntS21+FtsWwus+FStvnSbeALxdyrknswUB06xC7I4BElNhAni8HvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot77l8kA;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C38606BDC2
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C38606BDC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot77l8kA
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b244fb7fffso1388510c88.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595382; x=1795200182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
        b=Ot77l8kAzs1agEIFRF9lh1uIxqzyKXCn2BmjsOS5z8ttZwv2+CJkqw86jCtMgZj8Jx
         aUeA14jTTw0Bnz3FrgsWAYcbiW9HXmwFdXDbx0hpAzydvoXuymp7/xcq6r6tNJzaNjU4
         IjlGZumVQbUs6YQ2MhG7blszRqA28K1Rh2WiyKrf2oO2vXIsUe5ocxV7jpE5WKlobLGA
         X6Izt+RDiA5UFflTJ/9AN4mq/tHEXNoWK1Jpi0QKyWUFna/X4s6l5OePaO8wnp021Y4C
         8Yf/Hzxb18PLcvW6D9t7yCYIjVAzUaAVIgJOdYFeu53SaqY9BoZHGVlFtMJlw+C3qDkB
         n4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595382; x=1795200182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
        b=0Nj65JTpQwEyLXABrXPaXDmKKOnTRyzod2L43dLUHhgThC8Cwm1Rnj9hS3FGsqEWwY
         LthYsR0g0qgHHY9MjxupP/b5Ti/dbvY7lHsykUzlmXlTY44rMzGUeZOpjiWyRQI4WBp+
         gQX8Jq/SPTmmR6hav15B1z+HB6EIZnFuOpYvdGfQXuxTgcrcirh3clluHAB3puZqx/mk
         I+xCAQXyR5GWq0Njk/0APl/UHh7HNU2Ma//S5epQoIAw9QVF/ZQzxkX6YFg0/evP9Puj
         jbBP1y6opLsNvCvMYJXVMajRXtzFaWYsDSiAXiQobi/m56IZV19H9Gj3z4IkoDXftxqI
         O1Rg==
X-Forwarded-Encrypted: i=1; AL+hErEJl/lmb8oNrdZ2t/09gNgk2JgNBJ9NKk+pTTS4XcUcHD5R1oFepnbPt/ovH+Z/kz7Bnkv3d7wPKNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XDyy2WJDSf6GRhOsGqJ4v0jWxlEp4S/CMKhE2h7fbj3zB2YDo
	6ruIFtVVqgJIxRjpT9WRtHpKXmDJUb94MI+TEqEkMdMtzgh+bnXg4Ikm
X-Gm-Gg: AYBFou1aUBDB5/a2A1xI819ATjUb4YTMClUlPp/imdgRSsINc/nvLKtdcb9l01+Wux0
	QC/X3cX4CEtWlqT55C4pUhqUpTtSn4B8bDXtS0hsNoYbMTjCtd3YoC8MjZ7oQikXYa+r3oO3eQP
	BjnAV7tzYMV6Z8nWSvFId2RoS+waLMR2qqy3tLu+jWC/6H5qu4JkPnGbpXJSWg6IJYv4/BcvG0s
	id8KdqoOhqFVDYG2jeASPoX1fZBj1mPrIKKUbRnDqpHdOKklnLc/KTyT1A1WG5DoqhM99Ls/r78
	bpN1BIuydHHbtwGuND/hNGJ0sW6rPxnZBv8I6lqOO9pZi/F65D++Ba0qOJBbFWREwnFyOVUFeyL
	6c96eMP1zlsET3vOIHTwn3gmgQDdF7L3r1P6URxrERtyo0aeAXFKkXvYxSYOaz7l+UTKUt6Q1GB
	zT+03DppadtWz7Xv9Bdvhl4MVmojOUfba/KJ6C9Gl2JYs6XV6JVt+Hk00AKt3diCgTQGiR4poD+
	ckiDAwCg85bgCiZodmfjSp3EEZCJxQrcgbvjphgnQssjstYMNgd8vU7XpZmaZwOCeSCCInnL12H
	598+0CKi
X-Received: by 2002:a05:7022:7f0f:b0:176:a225:e364 with SMTP id a92af1059eb24-1b50312eb89mr2494066c88.35.1794595382432;
        Fri, 13 Nov 2026 10:43:02 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:43:00 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v5 4/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 10:42:10 -0800
Message-ID: <20261113184210.470320-5-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes since previous posting:
- No changes to this patch; renumbered after the IPI prerequisite split.

 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
