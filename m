Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596924;
	b=PRRl3IUg0GArbzfgqviiHCAoUPdTltx8MtnaFCUpP9xD8upukm6zWqSPuPeHorYU9qYD
	 a/fuDAuFXv0GMODv3m0xyIanHZNZNTH4cRUgSnpOTozkFm+nvoOj4+OzjohgWBUeE5o4E
	 WosjM7jgaeHID7iYvL5HhcE29OICtXQs7ZBZZsopwe3YTwh2tCHu1iUs2RuL+weWGzlC4
	 q+Y9+TEu9zXVx+LpjCXxkZKM8H+Dqq15T0UB9EL/BAj44IBbTjzoN5qU8t/MbsvR1oda8
	 IJLek+UJs2JgpG/DzavEujHw0Qij1ClaclSYY4Dn7/XIsTCQ1MDJ6YaOdWJc2ZEpDAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
	b=1P4AtQdYwOYAoSr8+hGT6BfReTA+aoNjo49wvurqnGliLm1WM5n94AsLH0yh8bcmz8zL
	 8BGQmiKg/2tvV22VDhXYBcFXTCJZn4nSr3d7wiXfwfRCawNOmefqRx+J3dJGr9aaPKF4f
	 NIkNxEE5VPGm+oiTtbJ1BUVa6poBBlWpoIsyCv5Xqp+ZAuOickLBs4J8QHdqO9B3qn97b
	 m85JtAPla8YaSPptRnxQ/cp8YWLdXRCF2QJwT10YzjxjTIbdzl/0U57HnHBRQyjlQdWTb
	 bHYGVtATCmDUE2C/NRf3CAeHse+gW3aboRQg4Fr2vPUjlW1+U9SNcoyaHceQ2RzzK7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwDKDm9n;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B2960A2626
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 19:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B2960A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EwDKDm9n
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so3845290eec.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 11:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596922; x=1795201722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=EwDKDm9nSU/jTREYh/cxN3W6tdK7apu5/SNw9Sd8IdmwUrbor7u3aICaiXChfvL9OM
         VQycw7+qsKqg4eC90CZnMTRNUkY62Ia1g0AzusTqzDqJkEiwFzgOv/HLB946Nrhb3tRj
         s7DIXsl4bjbvz7uj6gON8JywTmnjpklHFULgI48JHqjSFlXex7kMr/nHX1qQKZqmhVmW
         GucmXILq0IZe2+Lt8woy0b7GjNUBvXnPu/ni5zSIYu5VPAkDZuYfSCXsgmZRchcH9CoT
         5MIpFADNyJaB+YsYZgQpdupPLYhj7naI4sqtwXUI0Iv00nORkHpOFwTsR2jFwlErKJAi
         gbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596922; x=1795201722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+cYsgzT2IYrnjn4UHawDYzQU1HcpnMtWbFIeQ3G3aw=;
        b=gQcG/3jlPBr2e6zWMIYNIlSe5Wu62oKT8SYPSW0KkSMhClcQrekySB3tkYjQVT1e8+
         FJfTXwerHSR0olIbtBCa37W6ycdYaW6svz2tRbgZlKFuKJ1vNw7fUhNtd2T0AJAnGdiZ
         3qkmcNnDtzomoyuphsekdKSrUd503BK5CXe0u50BWFcFie0jT4kHcdB2HpsTRosi/Bia
         ZwV6F8xW+5UvI4D1ZBUsA+iaGVsS0G4V3piULKQXlAMKtneOlg1qyFtoI0kbsBxlvOqd
         Sn69uID6Ek1XHuNEazBi4heEyNsBI6FWy3pvIY7wcWdek2vBT+/lo0WGZ58Vm00nKFIC
         QIFQ==
X-Forwarded-Encrypted: i=1; AL+hErHwZBf9Rt+IiEyPtuw6uPwzhO7rybK9mnswpODzbh9/3Ku48ocC22pU06HIUiDRY2yOv4maGjW6l9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/onPlhc1OYEDoZw+FBdvzTy5dP4JAVOGdjF7kNTps+O0ME171m
	RMwg4qxwXHKZjA+WTx9gLMU//kFdPNXz3uRQdGYRQ7t6vj1OZ7UE7cCH
X-Gm-Gg: AYBFou1c3rKGE4++YM6psXt7aEtKBz3U7wmJepjgzE+eBO1JOcos352UX1TpZHxYEu4
	uoB4HakRO0etKMB9EuIpx9oztr2jygnCBQwUyUEoIscM0YnFAWSs1zor7SO52na5SVADfQQoYZT
	B2iQ2QDNF20zG+NudiSAPj86HH1FH37zGYaaeXUJhRMIWFRm4pq4YdmuMgJ3tojDS3wxyhGSrQJ
	ZZtDSiaNfrSxsxGuyG9ZKEHn74mdGLwRPWNP8kw9V4uEwuayVzn3OOGR8W5yeEcyGjOEIfKfMao
	E8OGhvcy4TjlA+csl6eZo3n5YXXItncerMRUWU5FHVYGZ5Ffm8e3vBgBkK+3/XJXhUi0plOzya8
	4kpSuDYSRzSwIG9lwRBv4AyitLjYRlJiDYPXNtdvr124EvrURcZQhYb2Pf51ALr6fNoT8r7iMiy
	/Nb/qskxyJLIlPgPN1zLhWDJsxcuUmGN49yToBQiYE3kamb1DpA+Ot8/YEyb82DBPaUU170zFOL
	dSuebqeadXdb9ClwoX1mhKmmX4366vQcdBjyjvZhrg4EpRjDHG12h9PLXSr0hi+r7buACVnZwWS
	hvTG4MUDAOjIeKRoouvMPb25cdAYEg==
X-Received: by 2002:a05:7300:478d:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-379681c6a08mr4217184eec.39.1794596922321;
        Fri, 13 Nov 2026 11:08:42 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm15714037eec.25.2026.11.13.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:41 -0800 (PST)
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
Subject: [PATCH v6 1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
Date: Fri, 13 Nov 2026 11:08:33 -0800
Message-ID: <20261113190836.470937-2-f.fainelli@gmail.com>
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
