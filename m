Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792760106;
	b=lSuv/BWwCDfjFjNjUxK24qpFKEFHpoW1swZYl/7k/qtvbCjcJ5E/sGto1wM8CK1QDl2H
	 6lJ5UsRctGzWorTIqtpdIGKhGw+Q2zr1S0EXyx9cKaTdrRo69Mx5kbXKnSeoq1SjoBtKr
	 AM+/nJLFSoPjlj+mPC01gvgpJP3vo+pEQ5Fj87Hz/KITNxel9BcMkQLAMSLkraIOZJ2PG
	 mipRC4odQu+Cw56ytjMECBQ1STD6s80C8hsYgciEHuNl/S0tiPl9+g6cn6HOag1H71QD9
	 qwUwUOSXWKQmXWTAiUJYAfCu/asGaQKTFgKClclJJelpEz4GzlGjVG9Wv51Zv3+h+Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760106;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dkCw7hbi01uORZPcJo+jj+qWrgJE+/WCOjq65qj8Geo=;
	b=ZePjTvCPJsHbQsh386OKxHzQgBrmLJBma2OvP0hm2xqrO/wly8noC7P0jtvAPfHCoKDK
	 x7N6xYB6ITawtf0TuuCcPHXqr2kJ2KfoI1eKtaUbLCrGjQ1OeJMBI5LFOAvrz1JKC3h3K
	 KCrIWupTEX+yTU0We0ZMcG8UTyOUpdeDhisX08zWPF1nMPdj5HK/scgZbZUw4ZohvUjMK
	 uquJXc6l4wjviBafdBvGsxOcmd7tlWo40aUnRNjmLrKSNzy9TCc7djqbcF7CY1I1EE08R
	 WFbh+44whb3dzxbcOO5iyBQ1w6EKe3OtJxhtDoWWa0rGLmK8z/Rt5jSbhxc7fVqo7Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IN8OLGzU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B85A606A326;
	Fri, 23 Oct 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IN8OLGzU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792760106;
	b=oLrTutUKTTr3AyPbd/TQSgyplT9Sc09sNPzq01MlXCojDwlUt/ZrZKjiUuCqqrdH7lVH
	 ZZLu0iP9kDK798r3lYpMu+/jtSbRO2wR9k9DPY8S3KVfvQabhdFP1OV8kB1l2A2gQYGcc
	 6ISR/XvZqjVF1a3XrBxDnnbRSq2Y4DQc6aYFuidFbmur2EU7iZZrR1CRjur0P0Y1nRClx
	 NqoLr1wf28o7/ONZAHayIx9eKDz5GayK1U3tYhT3gs8GT77ZSLptvKmZxTTsfQpRqXZKj
	 XU1JEw1d8zGCnc5d83ElhrBoyh5uHMgWyEuQeiNqQ1OsEncAP+9U7pHzUOsdBGBWNXA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792760106;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dkCw7hbi01uORZPcJo+jj+qWrgJE+/WCOjq65qj8Geo=;
	b=LcSNeeTU+4wHXg1Et0BzWAsB9GsAno4zKEbQ4amnR10vZxTaMJ7Rue5XykeIrNbmwhR1
	 1WZARrWeIChK4u7GFZ+Mj13yfi/Ec+ZZeHFyVkZcJNuYQd7bJKrm401C2NYQMFtsKPlbN
	 +80AXs+XhUdx0iFM/20pm17d1zHpmMr6x2KdlaG5HuFpsSLKH5U3AXv1MFmWU9P9qf0xg
	 Doum9Svyj/shtvw5CRwJwsw02MDo7DOZqd7qwjoHfRinogB6RmWPB+LVBJI2aGdh07Vg9
	 3zthis58w0zsiABLVDx9jq/ugusLFJiGdOViiU1pG8dafouasJOUFGoWFQ14eCZbJHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDDFA1F01828;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760106;
	bh=dkCw7hbi01uORZPcJo+jj+qWrgJE+/WCOjq65qj8Geo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IN8OLGzUpbKdkbH0Ptf25Bk+O0mHr+T+yn26U+2AJM+GFyCo8tO/LSXr3zAX8oPBW
	 5Qwl7lKO/D9d7VxMH2o80flWnzDXSnuh9nrX6gZFhauaOGcUxeRUq0fX1dWIQH+imP
	 MqkAIDFwCbzDM7KJYvlxgUX1x1T3V3Vh+VmbxqRj0/NUV0oEZP96aw++QHFAZ9RiyS
	 C026bh+tpekZoNvyis9dUDa0qv2Ir3KtDq6Hba/eGAxrnLtgD2WrrLyNedzohS4Ib1
	 32HbYnPwA3Qa9o6FTZp3PMin3OEtYQpog1YRsEZexEPHQ7QRT4/od+k4CAyJwdCEJt
	 OFn32VJt9VZbQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5C8F244529;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 23 Oct 2026 14:53:52 +0200
Subject: [PATCH v2 2/3] clk: meson: g12a: fix swapped VID_PLL and
 VID_PLL_DIV clock ids for g12b
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-fix-g12a-clk-v2-2-0b0b9b86d437@aliel.fr>
References: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
In-Reply-To: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=vi9lulUMVdXqWKaJQLHldnMTagMly0/4fVgBZE/Y5xg=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9btSJV3c50XvD3D1pB9lLHh74c/14JvBH+IPXyiavJX+
 T+LAo3bO0pZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJ7P/AyNCwYkPbF8/IWTL7
 96w4ZTVXSWDjvKnG7edcXAzY777gWqTK8M/i0Y+Gt3tTboUUfL4ccac2YYuDapeTUvudpd7fwt/
 dfMsAAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

In g12b onecell data table CLKID_VID_PLL points to g12a_vid_pll_div
and CLKID_VID_PLL_DIV points to g12a_vid_pll. So the ids are swapped.

Swap the ids back to their right entries.

Fixes: d43628e9bca6 ("clk: meson: g12a: Add support for G12B CPUB clocks")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 57fa086b9c8b..0f8cca4a4caf 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4849,9 +4849,9 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_HDMI_PLL_OD]		= &g12a_hdmi_pll_od.hw,
 	[CLKID_HDMI_PLL_OD2]		= &g12a_hdmi_pll_od2.hw,
 	[CLKID_HDMI_PLL]		= &g12a_hdmi_pll.hw,
-	[CLKID_VID_PLL]			= &g12a_vid_pll_div.hw,
+	[CLKID_VID_PLL]			= &g12a_vid_pll.hw,
 	[CLKID_VID_PLL_SEL]		= &g12a_vid_pll_sel.hw,
-	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll.hw,
+	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll_div.hw,
 	[CLKID_VCLK_SEL]		= &g12a_vclk_sel.hw,
 	[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
 	[CLKID_VCLK_INPUT]		= &g12a_vclk_input.hw,

-- 
2.43.0


