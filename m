Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771937;
	b=qsszAA3mG/7jKTD6MoVOFkzUT53Wk4MyUTgX55YvaXoG9h232WLGtE6QzcuN/luBbhrG
	 Pf84ohAoiKihpp5SHmtZp1ayfZ4tFfsb2za7duV1wmB7ea6YM9mjjMQikeZ3FPx/83o+E
	 UxS8LBexaGV0snQ9o7428JPguING9M0HU5m37QcyGF7UfRgLxEv+7RQtpPwELJZnGUqrf
	 jQDj0dwxMWO9Ua1/uejx2LZPS56oDBUQdbtFQJKhWQqYnMKWk9Erf0FHWKkWqf+wbcbB/
	 02zj/IBLt2cY+i6zw7hxnBI4TJUv6Im2rOhfJRd8qIyY0M664W9+GC2KrIpy4MWV1XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
	b=wjZ9d/77JwLcpFwgHIgupNOutjURcxWevTlhJ+a3f5fAF0LATmecZMQZfeYxwb7H1vXw
	 YpekhYLRZiX3WxNSmost0Tt9XtktzuK0bkGlaAu7GiaMTD1z98k274+hCVVtK/Psazl+Q
	 jnUpiceDTxaYL7bR2TF+m42XMdL2EqvjdHqXh1G/TV3RwW9Lu6h92n22B0C7MWtwYxqMG
	 UZIDZtVb5FPAuLUCZR6xgBey2MzOxLVlvc6i/EOSbAVP1xvp8vl3rABVrvuUYHJ0COggN
	 neY82HYAk/i/iIPXH3zXInC9MY2N6XHGZsBdGQ3HHHh8qD1K0mBmI9V7Jia5FoYIVQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxLqEAZc;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33618606A335
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33618606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxLqEAZc
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso278899a91.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771936; x=1794376736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=qxLqEAZcJHUp/cY1NqTaJSKMpFvTnLBytBsofAopex9x+pMxlnZkcmmCCu5OrwRL1K
         CrAeHJhPbzRBfxVCYj7cdpfX2HWhDmadl2rp4oOxAtdBw+cGZyQuCi9Fs01WTSxGVJ7V
         8Nv/X7kIfY3JwNb/zsRuXaFlShZBoW7Jvjb8j9ngaktX9tQkPkNeE2cDHe7sr+grQk7w
         sOdXzKBkctZ8d6mUE3Lv9wjYkbBSndCH1pJ038t3kQx7AJUgCnA9LpQte8RjRzXTTZ/3
         CnHlg4EhxozVd8/RR0b3sZ3b1md4BBLJTqYxxNToKpSTFVu4HZ4C0TmRLSpz2ib7Y1X0
         QtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771936; x=1794376736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=mS1ygfJJ3dLjvuLVhgyjfgsMSC44n/B+IIa5c8/iLJ9BW7jRuFNaI41rIL/95rh/z6
         j2X3Wb7uksnvZY6wFkQ8AK/9bY0ZYYZOM6phSFKgWRwkvfY6D2U1lkTu0LlqeL+FMFGA
         6RisC2F4wHBCyv/mvPSZZpjv4lFuJBRwPrWl9uunJYpGhXafDFSaLQYiC34nrYW17qyg
         HPL4uvv3vAlB5Pxbx2qs6pNKImMvRcyj3kAaEalj3Ucy9mVOVuX2MygtbwIS3QF/ixKe
         OLtIeUH4NI85y7OU7F2eHSja+GVevAD6d45KDZELYdaR2H5DBYdeYGqmvOhwGnuRdaTb
         N0Iw==
X-Forwarded-Encrypted: i=1; AKwUvBx190RoSnRib3xeXGbkUb6xJPfrAbez39k23QlY8bfvHx9zMzeGn2+W4lhgHrcv0Gi8O3rdKGpb/fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JWMe0HIVb2HxNT9vLWL7GfA/hERDd9Koo4rKMOYdWpkvFpQXK
	iK7nV7haYnsMuNrcYf5TrAYzRIse4aByDqtF6Qs7yVuIeDaxk090GC8r
X-Gm-Gg: AYBFou1ddMaF6wyDNag2an7VMqEDwbXV+gdutDArU4gNC30w1cBGOIFDC+Gm5JyHEQW
	jyHjoTPeEScVoEguyYW1/pn7Eke9NFBac/LHZ10TvQKI7USttFMrwHDBzFX4zOaooI2PchJq3Pe
	3kAFpExbp8SKT5P0aGqp+eYN999lYi94fTrJDiD8xW4ICMoJD624o9BuEjwOZQQN8J5eu89grnx
	YKg4/Sw7IvgjSo6sFn0cwYLX3+5S12WOSr4TXSamLJq0RX2e34aU2p8i5YNniZMyeIQglpRXAr+
	vu63r6l81AMlH43GYvPQhuHz9J9O39d0c5xt5jM+DcHmwGplByqzYyp7+/+0rD1UKmwtCk3TTVW
	7v3j61doOYUAtjUlgab3nCB2Fw04Z64PbDlgBWy3djct/tUNeNI8cTCKcJeC7rUQ3S4l2ObfcPO
	Vm26AwkhfEEiviZqYwEzn0EqkF3Ojl/ooVHuZeepdQ/0zO5P7JCm5iIkZMvcSvU7w1RnF7NDXAJ
	QQCbbfosxAkX/eQZs8A8HMMfdIWn0qjgNShe8W1JA2JUlZOLYW4INBW8uamGK8nPJRUgt0Svuv+
	rWQZvz2/icaAK0FFTD2ktn05z7syUv9pD7Iq+0zogheC3onKKtA0vn/pJ0pHu2t9beblk+PX+Uw
	BiirG6TuHBS6xMpS5/ICHCrGg+BaJEHpyY93gqAY4hAiKPJSLCbNR/xq3bc5nYhxvhABC9LI5uW
	DVbQ==
X-Received: by 2002:a17:90b:4cc8:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ae897f673emr11389663a91.28.1793771936338;
        Tue, 03 Nov 2026 21:58:56 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 1/8] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Tue,  3 Nov 2026 21:58:45 -0800
Message-ID: <20261104055852.152340-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
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

qca956x_clocks_init() enables the MIPS timer interrupt in the misc
interrupt controller, which QCA956x needs before the clocks are set
up, or there are no jiffies. That has nothing to do with the clocks,
and it ties the clock code to ath79_reset_base.

Do it in plat_time_init() right before of_clk_init() instead, which
runs the clock setup. The order is the same. TP9343 boards use the
QCA956x PLL and took this path too, so check for both.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 10 ----------
 arch/mips/ath79/setup.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f6553f398..8c5eaa4ab6e0 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -523,16 +523,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	u32 cpu_pll, ddr_pll;
 	u32 bootstrap;
 
-	/*
-	 * QCA956x timer init workaround has to be applied right before setting
-	 * up the clock. Else, there will be no jiffies
-	 */
-	u32 misc;
-
-	misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
-	misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
-	ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
-
 	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
 	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = 40 * 1000 * 1000;
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4e18cdcf65a0..d9e1cc77ad04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -241,6 +241,19 @@ void __init plat_time_init(void)
 	struct clk *clk;
 	unsigned long cpu_clk_rate;
 
+	/*
+	 * QCA956x needs the MIPS timer interrupt enabled in the misc
+	 * interrupt controller before the clocks are set up, or there are
+	 * no jiffies.
+	 */
+	if (soc_is_qca956x() || soc_is_tp9343()) {
+		u32 misc;
+
+		misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
+		misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
+		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
+	}
+
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.0

