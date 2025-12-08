Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844762FE560
	for <linux-clk@vger.kernel.org>; Mon,  8 Dec 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765188845; cv=none; b=kKjdYA04CCznDJ9duTgkDh4XVqsCVNwhL3ms3JCCbXzF0em1wFceOsb+6/86eHt9l5r72zzPO5JD3Fdy0vsbS8enePPT4dbdDIy+2fcPv1iCbgvGd3JjHksx42p9raHrhvyVRbbfudU3+WYGF360up+S0bZV0JSTvPtAsHfWKw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765188845; c=relaxed/simple;
	bh=VApnJKeoRx1+pgCVPSPhVkgRhXFoV21X243vnE5l6cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfAXFbPnpQUNUfIHqW1aCPfWGqC7d6hGb/dN/q8Vj7XDbVqBnTgKyoAGVyqH+g0p0l2c3b1cqe57qVOgOQHe9kd0crltzUDJa7B9I0+9DdZy2qVXb8QZfHLXMWWQHBDm5omGNr0WOJmWJYGWvvpIPKSFZaQMLw/Srb7cJEcRmbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoAW8JSD; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoAW8JSD"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64951939e1eso390211a12.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Dec 2025 02:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765188840; x=1765793640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmF5A7A0YltvuLrpjk1h5ILIFxDk13KqteZYqwtd4IE=;
        b=ZoAW8JSDlmMNk7f8TjCjr6c1X3dG2WjjvQXLJ5MJyA9/2fGog3Gr1bWWhXsPcbLyiS
         MJ9u6ka1AO8hRfhBtt3Q13xC73C8ZW5WWJ+jPwCRY9JLCf8+KKUn49t+5MReIXptX385
         EfzdbiI8oL1cJpF3V4ciquOmCmTaq0sjBoefY7KY/2tYfERwmRajU3uT+IDrhLwhvdHD
         OgHdZjLPQtYdktHMSP9c46+LYJkoKpjLw89nSaeOB+YtdbJnr8IGYOrv1iQr7Qq5QvrU
         fDKDZ1feTwSCr+sBh59RVj79fXy5r9HI7LImBrIDzOcFjSWX4kgIRQ9rXzhCtzv3iVJA
         5LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188840; x=1765793640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VmF5A7A0YltvuLrpjk1h5ILIFxDk13KqteZYqwtd4IE=;
        b=Cbtq6YFcb2TOwao6SewvJYt0cC2w5xX6sdQQ23eJG4SSZ5WS0TYOhb2E31T/ALYklj
         8d6QRwgAyEsyK4oGBc3U4HgwyZDSwDoJCgkpy5lox+u5aNO1Y70exnvX2mlTV9vUV5YD
         h2eV/9Os66ZGzBGbssgKnTL5tZRz4HBugTF6bzEyTAyUHTMYBiuwExmwCB5VgHVzxNCD
         o3hQr9U2YXmCGgo0q4MEhGpkZ1B01kycU31dabtjvpvhJW3vmCnExvefWYAGPj+MYk7g
         po0Aj2BBdKUZpr4UeN2YeJzEsKvGo1JwMjQFQg7QfjMHngz7/yiBTMQkM+k5bvDk83ox
         NXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4n3K0mnQXFneIs8EYdaHosUUb0NBaBFKArBu9oxW6gr1cFANj11l6yV13n5HAKwShZX6EmTrggpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvN7mEr6IeA8pTJtS/46FdDkTIRm2O2oCEoX3gOX7BIsSuUpxu
	pypIOEerv1W8QqLHo2f4DBr/W3QPv+J4kZ/9/B9b0TB7QY4UPjnTSTeY
X-Gm-Gg: ASbGncsmW/G3n8H7V1tVRvCLVhNckC5RQJGKbiLmvRjjwo+uYzOkqQ6pBDMIeeTGFNl
	D7DMIaZgWzt86v8NWjGouIAd/BMyZUAbRuurfk8KU4GEVnSn83FN2n4Ht/FQ4/e5O0+LNjv0czU
	aaKhcv5Ms9z6k2RKa6LBG1ynT4QFbQTwqZBHTN39hg+fVNe5Y/C1gY7o0TETJBH8h/OnRTZiV1c
	T4HB7TEhbEYHQC4/gKnldhmJRw7wDpFrc9jCkRG4GcZjLwmxeXCmqhQ4zDAl9D7GxJx/5Aj+Fqd
	kCbJ7w06+l+6LdHQjoKn7AV/k2+KQIIGOt2r0cQY+XUz9Lut5Jvpbwoc7QmakBzn50C1oie1vKm
	Hzhumb2BpSjpCw4B1vWc0il6WgutiLjfX3bbE5pqGwcZlOZE45SKUUTabBgj3DcjisMW9jhwK9R
	yT1RZgwQ9HtxbayUNyulW1rE7T30jBNECLPB6zrPY5F2E744lU9we7ZcNVX+NhxSmbF0QiJjuKB
	s/AAOyjIPoND3tf
X-Google-Smtp-Source: AGHT+IHfKNBJd7WYE5ww06zmjwy+uoWXAkK5CmkwoKrK9UdMs9RYmupnX3+LnuHL0pQUfqTMASo/Iw==
X-Received: by 2002:a05:6402:1ecd:b0:647:5c87:8668 with SMTP id 4fb4d7f45d1cf-64919c1d230mr5735915a12.14.1765188839898;
        Mon, 08 Dec 2025 02:13:59 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b413b590sm10547083a12.35.2025.12.08.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:13:59 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
Date: Mon,  8 Dec 2025 10:13:33 +0000
Message-ID: <20251208101356.101379-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 64d1ef6e4c94..751f0340854f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1669,8 +1669,11 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 
 	ret = readl_poll_timeout_atomic(priv->base + reg, value,
 					assert == !!(value & mask), 10, 200);
-	if (ret && !assert) {
+	if (ret) {
 		value = mask << 16;
+		if (assert)
+			value |= mask;
+
 		writel(value, priv->base + CLK_RST_R(info->resets[id].off));
 	}
 
-- 
2.43.0

