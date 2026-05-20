Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3FD3F54DB;
	Wed, 20 May 2026 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299819; cv=none; b=parfXsBo5B17L1YlD/dEqA//NH2xuJZyNUmVLJCT7WF3oCcYJeRSLyYHNlZjtVl6IqVlPapFzIsswR48kCxqcT/Od9GZEHQdNMebLKPnWkvq5lyzxl42u+CJpOVsyhyV+dMjDt02vSTGNOwdcmbJnEKKHGEPyEu1t9FsQmDXisg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299819; c=relaxed/simple;
	bh=HiINtu7xk5Hd/gfZP1vBv9F2KUFICGVhIjDayIdomb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BkZ1DB9OMcUdA4aU3JMprQow/hYzpjw166RgwSgu6Az6C3sliTzVzGdlqhOv6cG3MmXVO8+NJcXxi4taUPjdlCjbX47/c5knc12rD0n2SSWQPcjR+1m9yU65RyhAb20ZlsP7hchVTfUdbWDJtOljX1ezgroOVVvfbzeb4HrtUqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=WaH1xHxB; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="WaH1xHxB"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=HiINtu7xk5Hd
	/gfZP1vBv9F2KUFICGVhIjDayIdomb4=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=WaH1xHxBHC3lzlXHrot3Q02lvc2OiIAMSPLittTbKOFXfiQpzHtE
	NWyGd/6KSAKnY1nfXoBvEAyb6pxWAFy7SwQRZc8BBlZudOXJBhOikSQUpiv7Fg2H6rfa+Q
	jqp/b6tlKPjbbY/zShQkkVowswr94Tm6XKmNJy4egklJ86yX5SLScB7kwVRnEisgyJi3Oo
	IDFmQIQzrPA630p1wru4NghyUHyoYgBnC/h1qz9Xjdvu93XwIzvMEpgQ5RRHUwNXtLujgZ
	zQRXCTmtmU7aUZheIEgKmvXBmyzSBLANFjtTVostzcb0/JQl9L83nDGq033B3z/IH7/aPU
	KiW2wFLyhw==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id de9eb2c3 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Wed, 20 May 2026 17:56:47 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MOXA ART SOC),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: moxart: fix refcount leak
Date: Wed, 20 May 2026 19:55:50 +0200
Message-ID: <20260520175552.537603-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.
The values here are used only for error checking,
but weren't cleaned up until now.

Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/clk-moxart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index 3786a0153ad1..7e191b1481bb 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -39,6 +39,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
 		pr_err("%pOF: of_clk_get failed\n", node);
 		return;
 	}
+	clk_put(ref_clk);
 
 	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
 	if (IS_ERR(hw)) {
@@ -83,6 +84,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 		pr_err("%pOF: of_clk_get failed\n", node);
 		return;
 	}
+	clk_put(pll_clk);
 
 	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, 1, div);
 	if (IS_ERR(hw)) {
-- 
2.54.0

