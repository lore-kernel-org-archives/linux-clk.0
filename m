Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C3F227EB9
	for <linux-clk@vger.kernel.org>; Mon,  1 Jun 2026 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346111; cv=none; b=qUAWKsAftJHq4jzmGKHR6MjDM32R0b4LkWYRqPpzjmPCG0IG8ZHew/V6pywALYo0WdLCmm8XALGsnknqxu8/AJCkadqnW4gE5PRUSiWCr0LqwXNgs2FWeiAVXRvFBidOab5VUMwY1tMbLvO9GPhqL5L0ia9upiYdn9/tXUQGYME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346111; c=relaxed/simple;
	bh=3rFSBqk9jfrvXvTpbmwRd3YtrmqtLnaoSl5PtXVUEbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gTVF07QyFc4T7Kpq1qT+JZ3Chtbv4eYpxv4U0QmQ17OOuXEwNTIbkHpS0t5bxJPAPIT3WkuY4bQIUKj9s7ofuszGCqs7Wp8gp2RwEMuWbaG/Rw0+k2IJKVtM4S9Cvmnd8h1XBtn70+ib0lDfQFJuEOOm3axnFHS8rJeKVTX3Txg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theesfeld.net; spf=pass smtp.mailfrom=theesfeld.net; dkim=pass (2048-bit key) header.d=theesfeld.net header.i=@theesfeld.net header.b=iz27cElD; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=theesfeld.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=theesfeld.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=theesfeld.net header.i=@theesfeld.net header.b="iz27cElD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theesfeld.net;
	s=protonmail2; t=1780346104; x=1780605304;
	bh=T/ACLI/O+MEH4QMv4GHRPdBcYwgQV3Hd/E0FFNYu5y8=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iz27cElDwGo3nbW9COmb+WgyYBkzqtzbP53MaBBZOzOhS78IAQW+GyfPLtIte6mra
	 fgiU9rznEQYrQavt+FDUiLy5Bro9rlxg3A6pn15h8sTTprn9eJM6o0f4Rl0p8dSaq3
	 Zb+80qhgiLxxJWKIrmVy3tMS3feX2Ti5hboovjN7+SqBHCYNYDgcSL16ND4VjnAPxB
	 navHfKnXBt48SZ687WPALdDVHjcThNePBcrShxXbdgW682p1OjOmjcT4ZDK66OzaIY
	 lzltaOO4VTdhGhEnn0+3e4OPZhAmZnabRsOCpTybJ6yeeG7CFr3JV6oC5a331CeGrc
	 8/Q0Xsee0fJGQ==
X-Pm-Submission-Id: 4gTm122Rwrz2Scpl
From: William Theesfeld <william@theesfeld.net>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: zynq: handle kasprintf() failure in periph_clk registration
Date: Mon,  1 Jun 2026 16:35:00 -0400
Message-ID: <20260601203500.658135-1-william@theesfeld.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zynq_clk_register_periph_clk() ignores the return value of the two
kasprintf() calls used to build the mux and divider clock names, and
passes the resulting (possibly NULL) pointers straight into
clk_register_mux(), clk_register_divider() and clk_register_gate() as
the clock '"'name'"' argument.  On allocation failure that name later
gets dereferenced by the clock framework (e.g. in debugfs name
formatting), causing a NULL-pointer dereference.

Check both kasprintf() returns.  On failure unwind any allocated name
buffer and the spinlock, then fall through to the existing err label
which sets clks[] to ERR_PTR(-ENOMEM).  Freeing the spinlock on the
error path is correct here because no clk_register_*() call has had
a chance to take ownership of it; the success path intentionally
hands it off to the registered clocks.

The neighbouring zynq_clk_register_fclk() in the same file already
uses this per-allocation goto-label cleanup pattern; this change
brings periph_clk into line with it.

Signed-off-by: William Theesfeld <william@theesfeld.net>
---
 drivers/clk/zynq/clkc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/zynq/clkc.c b/drivers/clk/zynq/clkc.c
index 6a22cbbc1..777187744 100644
--- a/drivers/clk/zynq/clkc.c
+++ b/drivers/clk/zynq/clkc.c
@@ -186,7 +186,11 @@ static void __init zynq_clk_register_periph_clk(enum zynq_clk clk0,
 	spin_lock_init(lock);
 
 	mux_name = kasprintf(GFP_KERNEL, "%s_mux", clk_name0);
+	if (!mux_name)
+		goto err_mux_name;
 	div_name = kasprintf(GFP_KERNEL, "%s_div", clk_name0);
+	if (!div_name)
+		goto err_div_name;
 
 	clk_register_mux(NULL, mux_name, parents, 4,
 			CLK_SET_RATE_NO_REPARENT, clk_ctrl, 4, 2, 0, lock);
@@ -205,6 +209,10 @@ static void __init zynq_clk_register_periph_clk(enum zynq_clk clk0,
 
 	return;
 
+err_div_name:
+	kfree(mux_name);
+err_mux_name:
+	kfree(lock);
 err:
 	clks[clk0] = ERR_PTR(-ENOMEM);
 	if (two_gates)
-- 
2.54.0

