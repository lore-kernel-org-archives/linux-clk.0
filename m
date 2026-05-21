Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1AA2F9DA1
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327758; cv=none; b=RBwH05HiLJrvEc7AXsp8IoNMxXzj2Nec0v1NFHsm5UFLwVQ8Sh8CpN/1HIzT3OQVFzKseNw2fuemeCIeP9W23YsK9cR3mzVO5RXxxvBq1jbkVbE+heWPbM4lLYyORNj2+LK/j/JRCIV7rijjjDQfTGe+qp2KEmtg/X1CDCCvGQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327758; c=relaxed/simple;
	bh=6JoQIiAIGXqqZ0vwdOHhCj00rky64V9x71tQ6RgnMRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t088ehAFqomRizOfQndSh5OqPbkUP+Jr202I9KNwhgVHzcsYj93in53H4RhoB8B0tEe5RVvOjTOLBRmFJqNEEtlCOGiHsqVsEldAkBNMvMHndDtCFlOeIgIL9oBiWLZ/8XHDiUnsCNIwGFUvodwCoRDTxtQY9v+J9czZ0Edou7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahX57yQc; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahX57yQc"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824c9da9928so2296882b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327748; x=1779932548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvAmAAUyg29fjUnqu9RUZPsKZgJ6HPQPiJ0VSPtg5Wk=;
        b=ahX57yQcW8++OL2hyFQ0cjTHmy77YVQHG6ZENvC9uk1ywVAcSkN9ifRiU2Cbn2bXKJ
         EspqkjzjsRVn5XwQPbmpGN+KQDTmfsr+qEkw7FG+9B6A8NG3EPIXJDGE+QBC4CfVxlf9
         qRTDuUq+xM3uJipLhosx5BIqdpZGNahs4TgsMaT3Ei5qproWi7GUZILPCfAQxVfhpRh+
         tyTd2iIImK23FwcimovZsbqt8aAEetNdvzKnje/BJ1NB/3VTtOMCU2rolV1gut2JriNJ
         cqzJHvAGwdcA+lFsjy3fqxtHJhBXcuxxNHCVYH44geGMZHqgNj15Bldjg0QeWVTndHVH
         2lzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327748; x=1779932548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FvAmAAUyg29fjUnqu9RUZPsKZgJ6HPQPiJ0VSPtg5Wk=;
        b=Ebp9qxael1yZAz7LrLMRGoVidKFrRRqMuroWR1ACJhZKQs7clOi3/yiEVPJkGwOzMI
         4BFIiaWBbRzTQZnMAI3CPZ2T2jj9DrVNCGHv7PyxCmdgzkDB3d/HZom+FXcmJMCUA67A
         /LFQ1BDyA6VTyeafdy5EtFM4kJXgqNjjEcv2ZfjWstahfxoqCMhCGW4EjLCzXNSWp6pG
         wFDRqbHNVj+O9hTY6L/C/oZqn96rIKEzU0zNgvg8wwZ4B+zgOpmKAkcQVcR/wdJkVP2r
         UCdKvZWF/uGEb/JgqoWLEqcM+AJJo1BxswegFpWWxh36+j8q6CiSJO6OVzZgsMfoYOXW
         kIpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9STgJCoV8V+7wBPZaY6dO1qA0+lbPD1/PsacdCswpNb2DdX2oseGF1Kx1aevueWhU1ETWm596SVoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwOi62AXaWoIOwoyBu38xx78Ee9hskifsi8lyQK0uryvjwMEP
	6IHdijsAl7xYgv3jDk+pZGYoU4Wa76vYICINIjT1U1B8OufsKXgOxZxd
X-Gm-Gg: Acq92OEXb0lwNHRqbI80fliWCfYxh5E4++EybHH/UTHBlPTUA/oPmQHmF2oGn20xBS2
	MColf+9MMScq2T53ZwY3DNFGKjFlBVfnVWdtJXecUJ0EQe58+NBEnv4my4m1rQT9M7X60Yct5rn
	RYOe8KPD8ZuA93TR+5iNvbtkm1hn8ehZlpw/yVcJPs7b0RX2PlIh8aaEloi65+clL/UbHzZ7wg3
	nn9qk2Ri1ZmKzI/bLyNCxMk9S64frkr/kS0t1Jrz20NL7jbC1foYtxbLnkFKtC8zQWdOIG/bQeh
	juHNZqeCeQZm/LZi2iqUSeBY/e9Mr3IAkikPs7DUOkNoLOI/a6MPIlRnC3vlW7tctVotW7jlMSB
	dCDXfCq4cCfFbdgJjqtl3ACe2UdV6tzfyiVxgWP2WafFVNXxVVd4jzgCmRkvbWd0gxW335feXWo
	AMxF0EW8mrkoz6i9eSONq8CxT8VctJtqwsk1H0w8ZvT43hPyX2fT4LktRTlr4PvCtS5UirCUTqb
	BKoD5+yfhOzUosKMDBIrJI=
X-Received: by 2002:a05:6a00:950b:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-8414ac97e9dmr829518b3a.11.1779327748515;
        Wed, 20 May 2026 18:42:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm26411475b3a.61.2026.05.20.18.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:42:28 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
Date: Thu, 21 May 2026 09:42:18 +0800
Message-ID: <20260521014220.77955-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521014220.77955-1-a0987203069@gmail.com>
References: <20260521014220.77955-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

div_u64() does not modify its argument in place; the return value must
be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
called div_u64() and discarded the result, leaving pll_freq holding the
undivided product and thus returning a frequency orders of magnitude too
high.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index 4620acfe47e8..bfedd45bd04b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
 	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
 	outdiv = 1 << p;
 	pll_freq = (u64)parent_rate * n;
-	div_u64(pll_freq, m * outdiv);
+	pll_freq = div_u64(pll_freq, m * outdiv);
 	return pll_freq;
 }
 
@@ -110,7 +110,7 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 
 	if (mode == PLL_MODE_INT) {
 		pll_freq = (u64)parent_rate * n;
-		div_u64(pll_freq, m * p);
+		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
 		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-- 
2.43.0

