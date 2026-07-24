Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7EB3168EF
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 01:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784857304; cv=none; b=IXWttQUVRLAQzKyvZ9AaO2kjsV8xfaRJyGBjUZpobUGgzqDOF7ljyNOyy2R+ZcqGDtAcV9YqIPLjqK4hk8RBUoWBWCRV9x+ovb/1396mSHNHMBBwwQxHLVKETcUJPvag/YhFDhSoy1tJwlEJpNCje39MI2jmV9uqvEe4mqDh7bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784857304; c=relaxed/simple;
	bh=DvBwH0NQHjvvw9ziWfdcW4i4bHx6yrf4acar/wnIfAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lg/ZFot7lqTfi2yf3a/WGt8ag35N63CYevEneiVLMdYCFpgLJLJdt9JJ9J+1l61NAgKFO6IWE27u1YK125/CX4l0cXpPdzSXGxJF9AcWbGMtohdimvwjwusFXwnmfUvgw6zI21uuc1BYyGLn269Z5AGcgACBk+ce1DfyvhMCoLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kafMxd3J; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kafMxd3J"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1336234a91.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 18:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784857302; x=1785462102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PshXx6UhghPZU9ZufEEpQoWo1ibLdgLZX+tS27SichE=;
        b=kafMxd3JV75WzclaXaB6I9RpPqVJGr3FhjniBk7XTXp2bL4LeAnGmNbkAq5vTzdPor
         y3GKW9Oz10rRtv+CcxWDFRDW5FDEwOxaGGIrGZ2rskgv8rGTWDlIpo45c8PFoSUQB0cF
         Wcf2+SRMlyNOVz28+JLjexcxBNKx4ZBLf1KyIyeA0t5CjvcAob2A+7hBIHhIHqclqx0S
         pXA3yKPmdtmtUzMQF/8jfXkC/KW6M8GD9pVmyXdIWK9V7Qw+DPsdtMp7vDU8nqNilagj
         sIjbA2V6KWL9T53wONZTqW9BeycfQAjHQ4EUF2pGdhA9Q6+WmlmrShjrUYsLbPlATiVM
         yrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784857302; x=1785462102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PshXx6UhghPZU9ZufEEpQoWo1ibLdgLZX+tS27SichE=;
        b=d7/czLRUlH6qORLeoZiY8A1tenK2HDlUBfC1gh6nG8a4oYN9sW6zn5UUJ9IorhYSqR
         qG7tL7MLz0FDbKJXikXndVhjBwNDsxGQ1h47oyRWUV6FSLNn9jo4mYs0lq8UqCbVdWyL
         VO4H1jF/MJujmvBl1jAKUhBf8Hiszd8JlRr3guDJ/ncBb1qZcn1Z/BFeR5MxeDfWaGk0
         IeetoKEoMF6lRJMJDWHGmrbojkyGMojEAvcos24pRH2zctTTzpfMbdm8jJ+bgvOgx7Oq
         89BprYnyH5XbyFA1chk8pzVlg/LCGopv2CiBj/15Hgu1J1Newtl2XWReRpjhfkwfVSQU
         hysQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrph/SRKrn3wyBqT5JnQ8f0yKvvqoduNCQA3E3XIXzvnoDyz5LcAU6AN5X5Lgx5VgWWYJN7mdeSVvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4V5pgZRs4FFtsuY7ggoHjEXPy3JJcXOPM/PxLjWWhxFEfPsD
	BdYgYVzIqc53LyNpkuVQcMY6kxmSEQhS8/20ELKrl8knZAQdDynVC2Xt
X-Gm-Gg: AR+sD13V612toP3Nay8I3J8rgJJWN0Ky5le3fFVVBlOe+PPYlcv/aqAV7VeZBCS/waf
	X2Siu2DlpjW9/UqsIgQMuQ88khnkBKBc5c4c1iYXBTCTQ5XeQoIdougLoBzItSKXtcR+iYkm6Ox
	9ze4qeGDRM65e2KXbg0Nymj4H6yh9oDPwS+mzU8E1Uu/9cjCKkx6nbNJDHXr0C+AfobRHL4n5j+
	UCqBTk7gbvLI5KhPvtoLuIhXPNANXDUnzlcbIUGOq1QIuVvemth7vwgkYnTDNMI1h+NyC4crt+R
	+jRn4I7W7lzrTs9qn11Ii/MAsIwZuWU6GpwNNfTeIAiBHNICkL2dwxFVef14vFhDMGb4OuqE5cf
	rjauisL0DXlH06N93u5z9h5UzOP9Ugaqd6SF8HefBgLcqDDcwp5eUu/FQt2Lw1b/XQaeQ7f5SH9
	MDtDpEapNIW5CVTXedSmf8hccHEaXjDvkfq0n1ArkoI6+Jxnz024z8/mBgbPw+g7E=
X-Received: by 2002:a17:90b:2d46:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-38ec6453ea7mr5581001a91.7.1784857301888;
        Thu, 23 Jul 2026 18:41:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm647015a91.5.2026.07.23.18.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:41:41 -0700 (PDT)
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
	Brian Masney <bmasney@redhat.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
Date: Fri, 24 Jul 2026 09:40:37 +0800
Message-ID: <20260724014039.1239552-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724014039.1239552-1-a0987203069@gmail.com>
References: <20260724014039.1239552-1-a0987203069@gmail.com>
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
Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
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

