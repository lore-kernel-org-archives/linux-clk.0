Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596924;
	b=vC8owp27/92aLYSSnJRMiF3fjs1xX6hvHYeqDleigmmxAndmNjplZBM6jEtCrhvjOg5l
	 s7eTAxwP0qidUhwX0gtd0mR2ept3XMLNLyQsuygJXop0X3FeHiZr9HtUtWzaXQvwijU7k
	 RzET7oV7NRpcHlFRjR6hTVPUTOt4cvMCPT8IxB17sAzrVtKwjGtr8B6Uwv2b+TgM898RV
	 CIjQ5JUvwGcNZXaX2/jcRUz6WRPe6XXz/owVPT2uIiQF6+VZsTE/qdOv+1witA1MmgAly
	 jKeokLMDGF1ixSqEq+hF+8M+ihUhTu5S4tymXl40BIWG6KnDsxAom/0PA3BIUDvDZ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
	b=s16+O11kGPeOuUlaKT7KmLDTBlZ9aW66++vZjWpxBT3+UzTEqsTCK9nDD3bUCLmoe0c4
	 ONW8xJs1xyzAA1PYIavw/+e/Lju6BNbxyibj3+xPY+xUtPu2cWSkO7By/HUhTf4gmKZhv
	 VJW51RX2eJlBlO8Oz+L1ewYc+VsatKVd6jcKsy7jhSKGyaLsVJ3bXaxUUIY/gbOeg1c+d
	 tzEwPXVULoPl8BMD5K8gEDoRoybqb2n9U5M8VMqrf+zVPfWo4oo3I3JgOuXFzD448EEjh
	 n5+Wzesb2hEhm7zaSQkXOEkW3UJVAl9NYrC+9cun8uYhr8RbnA9kbvIAKcGdMOWXLOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1GT6lkI;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9168760A2638
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9168760A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c1GT6lkI
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1548873c88.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596924; x=1795201724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
        b=c1GT6lkIeEaVDry1XrkHExW4OiOorkGfGdECtwwnP7GxAVa8Ph1vHb7cWWaLhQPU8c
         egMQeISJRKAyadcCfJauQdAp9wkMmQeCiqSJInggJtHaHWr/wDQVPTdXeFKGSD9Sw3wV
         jxD6ArkkqZySAAzIbTZG4QlYB4NKpU8Z2mHTK/Fwif/BFHhG584U+c/uiVBHeGUq0Aqo
         I7Wv9z0Ukt1CprAgHnl4vA3rSqBa7A6tGcaCyMdp/y75Q326QY3K08IzwKlWYWpVA95N
         SZNP3b+vAHt0dNTKNA2uhR41sKhZOfUR8zULbtsEZGaNGCZwjVeuL6haPH7hBHAWTDJ1
         JuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596924; x=1795201724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XKR4KyQ+ozPV5QSp1xG4V2JkW1Zm8NpJlTHghw5WZA=;
        b=Q3A8A4nQxFYYex2VUp8xbiu+Vm259jRJCoBWv/Z7/QZ3qi0v9gUGLtlpHnsWQVqdT+
         JhH3htw5KgSQV2EHrvq2v/uKd2pS42Ajym5zWbjS6BXPFgVP52UVzxW9d6jb81yF124W
         FDizNenPmalVYJAuqJqO8omOC6WxlbNk38tyQlHl0+kbc1luTrIA7YnzlnOou5dQWEhY
         l8Lvgxp9o+WTvYVk48ivIF5Aa9T1Doy9lb8a7yoqeSd/HM5pHY745k43Mxe06ve4eE54
         /NZ+pBAgsqL1uoQc90YJHl16Cp0eiiG69o9KQygbOFXP0NdHJP5sR87Es9MMY9q9SyyI
         eihg==
X-Forwarded-Encrypted: i=1; AL+hErFYxsVMJlZ8QNOc97sr633cL45MyLrXOg78f9KK/rqbGmvhwT4MmKEZ0yGrEczRuJMhAiYVbhqAgQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/31zKXa/lnw9cYV8AazpEA75doqQ+W333k2OwQnvdLCE6DfoIq
	9ql/Ugr0N90qtMlPGgJO5Hs1ZUudPR4PRVXUW2mbKLKvBLbvqxd6ZNtV
X-Gm-Gg: AYBFou0d2NIyB9kvPPi8S1NHoBCB7wQ/XE7SFvHri7n/1qo42/rs2zL27J/2ydYydX9
	eb8xJfktW4Vpih1cVVyeVpwDWWXEc60pzGKBTaVV1tcHm3tqMgx27ZaSroBjI2YEQO00eMBUv5n
	2T+I10zOsv0MFFRe/XVo9C4u2oLVNiIRnO6oapP3S4BMXONow1UEul5t2geg7/WrLJ5poCvInu1
	XzJbDddBwB3mooxewpOq8SMHddfh/8NVBqj7nLqcALRV4O2XFedsjBTPZWaqYAthB/1D8zAHnlK
	p5zNKbyBceUYeNA0Y2cLHPgkARIWvD/b6vYJJWUP6h7VpWl9EZEr0XoyHOB9Tq7RlbRUFMoIevH
	8HqpH6KJ0MN9+atQAHCxhOMmGq9cgbbfp7eJhGWL5Vrea+SegPhOmVZOa9Y92q7HeQH+LQVED8A
	wVCQV6s2QdYiibrxrkxSsl/UWL2b8CfoOp6fUialT7pmUe0o6ZwKBKw6DPV9orNl/BHVdqxrapB
	Z9eyDyja3Gd+wBb+zZQHYUpk6hY77Ro8U2hbHrHY2srpQyABHj3vMhafE+ZEC6Tk/m9ddJH9Yxc
	0G3tmQFm
X-Received: by 2002:a05:7301:a22:b0:379:7bb6:9c4b with SMTP id 5a478bee46e88-3797bb69cf2mr2548474eec.39.1794596923743;
        Fri, 13 Nov 2026 11:08:43 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:42 -0800 (PST)
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
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v6 2/4] MIPS: Skip generic IPI setup for platform-specific callbacks
Date: Fri, 13 Nov 2026 11:08:34 -0800
Message-ID: <20261113190836.470937-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113190836.470937-1-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
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

A generic MIPS kernel can select a platform SMP backend with direct IPI
callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
mailboxes, so generic IPI allocation would find no domain and BUG when
more than one CPU is present.

Skip generic IPI initialization when neither selected send callback uses
the generic implementation. Keep initialization when either callback
uses generic IRQ IPIs, and retain the existing single-CPU shortcut.

Sashiko AI reported the XBurst integration issue; Codex assisted with
the change and extracted-function/build checks.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v6:

- addded missing Signed-off-by tag

Changes since previous posting:
- Split the generic IPI initialization guard out of the XBurst SMP patch
  as a prerequisite, as requested by Paul Cercueil.
- Add braces around the multi-line condition.

 arch/mips/kernel/smp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 0f28b4a62e72..086298146dd8 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -338,8 +338,12 @@ int mips_smp_ipi_free(const struct cpumask *mask)
 
 static int __init mips_smp_ipi_init(void)
 {
-	if (num_possible_cpus() == 1)
+	/* Platforms with their own IPI callbacks do not need an IRQ domain. */
+	if ((mp_ops->send_ipi_single != mips_smp_send_ipi_single &&
+	     mp_ops->send_ipi_mask != mips_smp_send_ipi_mask) ||
+	    num_possible_cpus() == 1) {
 		return 0;
+	}
 
 	mips_smp_ipi_allocate(cpu_possible_mask);
 
