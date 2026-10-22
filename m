Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792705988;
	b=JuPhWhHuT/DsTfb6T+QPtYXArygu6SjHwne0gsXlgwaEFdjoGUueLgO2h5kF+NGiFKdu
	 iA+Bfd+kbWiMsC7b4mutx71xAyZTE+PLk2ApKRJ49uUgVkp3JHsDMGULw7wmKaiZaDjj8
	 gbAxyWYIYmShkF0PXrhpnkEBeg1E8+3fwYCHKnViAcMkNsXxQE+4FpGFKr3Ioqt58ynmz
	 mMrJPeINHFAF6cH2MmrE9LCEX8UjDu+lAHXWC9dYmfhxKROyGtEX6DCcGgqnWae0LeBbk
	 vrvDiFu4/9GTt1G+5XL6LK+7q4Fg41xZH7azzZFUbBpBgSI3LzbtTQ1CT0Lgwh4rmJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705988;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VhRlbpXx8Iat4T8my29ywJmXCK35kE4E4jvMl2k3ioY=;
	b=uUS7rymPiTTVQvaYyt39hSkJYr/jwSmFeiMQqgL1mmMFYUZ1gWGMDcaI8kJ+gIrRNv+N
	 iEnDPDtTHc4IoflwBsEz117aHh1DvwUSe3F/4SXgQVj89huTTJCfhKky4v5JJ52jRvJ/R
	 wiBFrW+E8clNwP8Ev5L9+fUbh3CsTe6g3yvkEEyBViWoPIwj/p8hU/FISPgHZhDbGThQZ
	 jBjVM9ZNQiBVDGiAB12XTeoNniYAb28wydfrahbDbD+LvBDTkF3gkrz4UWYVkcNxpTyJh
	 V01sEvddXW8qWNoyFMhH/WOKVJ0VENwjHZ7KSAWyr+FAa4dWe7Eca64wMhhZiBYDc6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j/0qPl8+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2533606A31D;
	Thu, 22 Oct 2026 21:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j/0qPl8+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705987;
	b=2Llhf9kGFOKcR5pr0eipqK/lhxppnfkFeqkrrMB2y86kW3Em1erZ3oaQ32/JZpIe7qL9
	 9SNASWEU5z7Jrcf+Odm4UgEmulXVRUNARBpnAvN56TylCxvchLmIDlfq+RB09Q4z8ZjiI
	 sGMHBa10MDDUvpnJEunhIvAOGzrAT+s121OsTtIr3PHyn/WZDGV3mqCWuQL0pKESuv0ax
	 otoAqc4LxePDyF7BSK7otUO+Oq3dk6X6PHfErUOSQ3/XKt46wMjh0TqDDX8jhkqIqL+Yp
	 qohgcl5JaAc0Xo21KTghtW4s6Cr1Vc91P3wdtd3vDjy1KS7Q+tBqUOQlpe8Q5HGF/qA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705987;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VhRlbpXx8Iat4T8my29ywJmXCK35kE4E4jvMl2k3ioY=;
	b=YYBuqNHgN8xf2KwVQEnXFwzE2fdxn6B1Axru1IRORcrHoSyqxFbljrrHvVYj/gtpAdt1
	 eKWZlMIC3eVmoMz+00nVUDZ7uazCOp7DEkbkpYSPm+9m1Uzqr0Kx9CjmG/fOMt5FVz44e
	 4fOTUiDCiRoHGT2RMyzdi2Zn9yP6vOvdC2G0aO3EhS09EI/nuvy3C2S05AUip1XGodcuX
	 HUYziiQgPgAA/Rq/HhpHznhJ6eDbH/GyEGrBJy6imfWYyLtmPs92j78X+8EaRpUyhwiXh
	 bBhhKJPs7Qir1fXL5vBVWqbBeq/ctwhpT0rklOQIm5fSNTJ+gexMV35rs0GkDH88bdg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B2BE1F031E5;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705987;
	bh=VhRlbpXx8Iat4T8my29ywJmXCK35kE4E4jvMl2k3ioY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j/0qPl8+lPkvgaupVBWhyHl0+o2zC69HtzLsajis3Qv/7dz6SGLb+Iq/xSQTpH28m
	 HNtzYVz3D5lbIMIJ0BSJnhz1r0ekRsXLbDTyu7NZttE34jBdTEZrd9u0Se20aAUMPv
	 8nPV2g8joK99cXN8jSB3/b/JsR7AjSVEY1CTbtV5YarQP4VAx3ZipgXPMYIpIC87vQ
	 iLbPDmKpw/5YqiCZ9OSURyJy3i21bTLd9X6GEW97GbUej6qx8LY+qMekJSB3AF/ARL
	 SRpj0+ZknpV+ZVfKvcX1ARgI1h3agxQvkt7LgI/8J+t+QMio0EzFKorBq74EXGgyeo
	 KJvwVteJVwE1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D61BD41F9D;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 22 Oct 2026 23:52:42 +0200
Subject: [PATCH 4/4] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV
 clock ids for sm1
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
Message-Id: <20261022-fix-g12a-clk-v1-4-e2bd8f3f1afa@aliel.fr>
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
In-Reply-To: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=h5JtJvnbPtQe4PerBm4gkeO+nH6xIUrn66ppgc1aN8A=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1v2uJZNXTlttVcy4TEblF59a57Tb/z59M5wwpUfq2
 iRRtTkbOkpZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJ3JjJyLD/Icc9hjPx1dWB
 x2Mz93EVSKdtS07ue3DQ+kuh+74vvLcZ/jvXbhWyWR37PLly5rbJ64WfhkzYxOjkJHnNX/TQTH/
 XcmYA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

In sm1 onecell data table CLKID_VID_PLL points to g12a_vid_pll_div
and CLKID_VID_PLL_DIV points to g12a_vid_pll. So the ids are swapped.

Swap the ids back to their right entries.

Fixes: 3dd02b7334ec ("clk: meson: g12a: add support for SM1 GP1 PLL")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 0a738c3c7fb5..e18cc151f4b6 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5117,9 +5117,9 @@ static struct clk_hw *sm1_hw_clks[] = {
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


