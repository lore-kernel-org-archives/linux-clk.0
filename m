Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9EE3F1657
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352625; cv=none; b=gQXr/6jOc2Oj3kO1QVe4ApFmvZTKPwJRDXj/ddpkL2c8jRQpo454iC85dJgyFMlTkBrf8LGDYuMivBhQ0CiKkI5ep8G3wQ5shWRogkIuhgR+pc+XbhNVP9TzSQjYknEHBO6DjrLmTxVb/8sFzuSEpbA8ywj1RJNtCOFkYMBRr+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352625; c=relaxed/simple;
	bh=Xw5RFpWv75CNtpmH6n9yaeYAZIsgQZPNvujNLcem+T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UeS9yIlgmyQewPyFI7RwoWsO4cTw8p4MHduDTawmb+3iGec/vOQ4FcV8bNrsidAMvBSOksskhDFFHTkBWVUEkRxUsRUvNT7S3Z91f2S0b8l9Yw+37Obyu260Ms01ZfSVAyDTpDhzA3JRT4aldE4HHc2fMRnXcmnioxPyKDV3Ugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGhtw5DI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGhtw5DI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso20983025e9.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352617; x=1774957417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GxufccZL3VoF+NgVSCi/f2xFeWD1b9Kcts6koYMzRA=;
        b=KGhtw5DIHP9p0uOeqTseJXXYBaTVu7cBYBJdvnOZPycruQuO+LA6qien+qzrlf2MEc
         Mnc9+bEFoBk5pD0dSEHNq05PIoOSAAEGNs6FldcbbTrq+ECfUCZHyen4Puj++F/QtF7r
         qSEp2r5fH4mY+RuDnx/QNHY432gwGD8GIH2y3lVqU7LOerCuTZm00nfimA1nYKZ1cFW0
         aEPhAq82le5HCD4HMNNwT0CwN9mLPZkQPy++1mi6A2DhZH//OUza3q1oYD0M3TaFQoK+
         51HrxreIqJDNS9yG6i47/Ikon41DfkrhdOxXo+DC09Nam9K9OLEbaJnd8WFI/hMj+GNW
         r+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352617; x=1774957417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4GxufccZL3VoF+NgVSCi/f2xFeWD1b9Kcts6koYMzRA=;
        b=acjz7wD3cN+2FRCn/76S+B4VBAEDa0PiwbRN7lLyfRzSr8C5ZZ249WGrTlG7P5GrX6
         vnxxE3iPfKAj71zPcNPjyXSyzsvUfbodDd4+F3xo/3fubZeIvn132VUZwN3se0FOkQLe
         22ihKT2Yo5veHOmhPfCMAvnOt+bZmAFHk+zI21/wd3YzrJh+5mYpQ+hY4U3M7zw9HMRA
         bvbwrTVlbVp43PDefs+U9SVhiGwi0RSfALrU4OKIo5h/vKPAH98Jjfph5aTn0QFIq83V
         5inUpCeEPZYP6s7xtjE/9bKe8Kp7iv/2303YJp0t+gxTbkM8AftXLlFNfBlnVh3CzaWL
         FONA==
X-Forwarded-Encrypted: i=1; AJvYcCVDFqdoEtBsJP+MFkjKPptggTtwCVurO4O319qHulvbjsaVwmL0BkTijsCbB5mDXnwlfs9cs3lJoLY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk8dkApyJq2BCJgHQSKShowOsIwA2fsH+D9QaeIaoKDzqHNTcW
	e3k4ZxLQ2DDhMvef4L0ZaDG5VcdstC9niKZm9LXXD3MrFuhV2Kmvklz7
X-Gm-Gg: ATEYQzz2jVZOyJ5l4JvJ8JzH3dBmzZz8LQMpRRd1AlEJREF+pBjjwarCmW/6N//KeHU
	q/44qYu4oyQpyB8VevNsggCUO3U0wTZ5q4MOXbRrcaEF0DMmqT71e1kAeaIcVpOUDfHufxKcbBE
	eiSZrggnfz0fAKZU3uVah7mumuIFNrfQf2o0A0ruZqgTcpaz6F1939yn39TZuWkkQcXlIEYkfDR
	tmO8vMUG0xzHLEnb9w6dsi3Tg8mvf6GzvXdJCP93rxN2lqj4VcmjL4raV46XUHZqsTihhbYdi5h
	+GNoPhWnWU3trjQQGE+IWUZMRaOCys6/13l/Ijt+UoTW2NC2wmmEpxJjnJ0AA7m4AaUL9zOOZ/R
	AznNtM8TcCxA/b15hnbfGuxC2mB6+mIJTBtRCyeFQ+vgZxPs/dQDnijNPtgpx8FzFVQJXDRXI6O
	TcgdkNkQHCGqkZ94VHvAB9ybYvdiijLNMBJNh43OO+lz77WVuTiVm4jNAgg6g=
X-Received: by 2002:a05:600c:154b:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-4870f212c1emr45412185e9.13.1774352616978;
        Tue, 24 Mar 2026 04:43:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 04/11] clk: renesas: rzg2l-cpg: Add helper for mod clock enable/disable
Date: Tue, 24 Mar 2026 11:43:09 +0000
Message-ID: <20260324114329.268249-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Refactor rzg2l_mod_clock_endisable() by extracting its logic into a new
helper function rzg2l_mod_clock_endisable_helper(), which accepts an
additional set_mstop_state boolean parameter. This allows callers to
control whether the module stop state is updated alongside the clock
enable/disable operation. No functional change for existing callers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8:
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f9e4af7f49d0..a38401c18dcf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1439,7 +1439,8 @@ static int rzg2l_mod_clock_mstop_show(struct seq_file *s, void *what)
 }
 DEFINE_SHOW_ATTRIBUTE(rzg2l_mod_clock_mstop);
 
-static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
+static int rzg2l_mod_clock_endisable_helper(struct clk_hw *hw, bool enable,
+					    bool set_mstop_state)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
 	struct rzg2l_cpg_priv *priv = clock->priv;
@@ -1464,9 +1465,11 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
 		if (enable) {
 			writel(value, priv->base + CLK_ON_R(reg));
-			rzg2l_mod_clock_module_set_state(clock, false);
+			if (set_mstop_state)
+				rzg2l_mod_clock_module_set_state(clock, false);
 		} else {
-			rzg2l_mod_clock_module_set_state(clock, true);
+			if (set_mstop_state)
+				rzg2l_mod_clock_module_set_state(clock, true);
 			writel(value, priv->base + CLK_ON_R(reg));
 		}
 	}
@@ -1486,6 +1489,11 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	return error;
 }
 
+static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
+{
+	return rzg2l_mod_clock_endisable_helper(hw, enable, true);
+}
+
 static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
-- 
2.43.0

