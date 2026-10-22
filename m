Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792705989;
	b=SJv44DSLdLO0LKhKzkabNREY9nEc41gBLEyAGaB1rfNvb0MxXs860d1hjUxYFXmis5Ib
	 O5tw5Z7cuP13pExPx/AwuXVNY/384/MmOHNBWkAgDeAITVJFy5I4/2dYsREq2gSy/FuaT
	 AjyunKKwSLboesAwRZGOAdH2fD93lTm/nT31saMl/EaBcTGX9nabCISkFuS3l/OOHQc9K
	 OUSoWl8ONVoaV17qhtedhyDG2SBdmr1ltTj43cxUqh2uNJYeXBfcO1z/rdwsFQiRSWMY3
	 +DhIPI3Z2ztLYlvjrugoZL70ao1YgBBnEYfVpwo/I6szwi1HTk3tL478DeWhKrr34iA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705989;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nwMxmAB7zKCpQjoLCsCioWT9WOsoTyLEjiLRi7z7+AM=;
	b=sPa8+QbqTGD7Oet35jfs6rTc0vWMS6KONyzQXVyRwVSYxrWzkC8qvaLW/loKxL4r9E5k
	 YpMk8y48LbZ62/5ROFGBQx5mB9hN5ntiJbxqApMtcYnVytKVslzUpWNQ65rheu+N24fuy
	 1wua5BAGS/IedXjER3Zbnq/9PsZO9glugPZ/D4MwmtzqSMMVfDuKDuwN9pxCm1N+qwfyr
	 kT2SoOufMdtOHtEPJ2IiCWgtBR3WWpBfouW0TGxYoymWmCYlk2Q2h7uHijP52eJHmDj7F
	 qZE6DsRLRXAdz/TtCNQ/hueOPDJgOuo8yMY+BHzSKPj2lh5WvNY7PWS+14kMOQ56tMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d+/GU+Zv";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206C606A33C;
	Thu, 22 Oct 2026 21:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d+/GU+Zv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705989;
	b=w5mjGfeHGD9hctfHTCp6FMcjrbIvBFFcyScT7xlZdkZTBZoYqsW6/c8ZCC5tpvUDOcA/
	 I8SOtbm1Yv8V64OOYxrk1nl1FVflcmRcGp9QR3ln0qVthiF5ZSxNczQ39RuXnV3WYfY0e
	 4C/piG3l1hWnZQ9pfaB5URobcBRSawcetIl4NESzNBOVep8AsyeMVUwfj3eYM41D1zXt6
	 BBO6GNts9OsXUpTjsU/v6rI9V0t6dXoCP1WNjL4+Xu4EP/HGBEOPmuVmbtvtFJDskQIFo
	 y302/INPTHlbip5YT9ohEXHiBU1WJ6yc9ntSbXnEkP7xlcBa1S28gJ+Xw1l2dWMpilQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705989;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nwMxmAB7zKCpQjoLCsCioWT9WOsoTyLEjiLRi7z7+AM=;
	b=due8GBSK6kKNSSd+3lUDcGSDjWciO9xAG7mkJc2UDaBHIKCwLUgk87nOsFB0glZLUrBZ
	 C1rou37yCnihQdTJOIaHJ9a5QIlCxiVzTOMs987vYN5s4XPpRGJVYQE1PSy6wcZN+yWKY
	 phiPoDFaS68+jjHfPDOVt6hg/x9oD35blna5yfB6Hh6uBcxEZWbcv7cJyTpppk8a35PLu
	 yR2QdYH9EtS2tpeBVEeP6+SUByPtgMbkkJhAbF4uz7oj5XGxyw7yPco6eBhnHEg6chUTF
	 m8x02AGOGpZQfhJn6mKOcv/U4cnH+KX5DTo0IWb1C7znzOYkfRopji/aDcozIKkSYCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AAD61F031E4;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705989;
	bh=nwMxmAB7zKCpQjoLCsCioWT9WOsoTyLEjiLRi7z7+AM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=d+/GU+Zv9XcJhflI4ugnEoASJ/y9LaoIyzUlAKyJ0CsfKvUGFzke8MG2N4W/3KrAw
	 j24ip0dkkeGBloWBVbaCKvBnQvtiWVJZ1VfZix7eI8WV9LZbiEiZ7fIC07OE+M644i
	 Oh626I/cn4NLw3Imo1hIZ3+yEfjDgVjlmzz6rd5qosC3+FvRuvNqqhtPs5y3pQtwto
	 XGH4adH8zr7lOTOKHTx0m8WyjuCRAvnimqfbOR5+q9oBCnE/pWISeMmonF/5OeFwj3
	 InTeQHyHzAzOXW5djBlkLD1GjFFQHcl09cjRkJCxkiLtoRHUluqN3IvzMxv1mxBN3g
	 srH6JgZ66WyUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF13341F99;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 22 Oct 2026 23:52:41 +0200
Subject: [PATCH 3/4] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV
 clock ids for g12b
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
Message-Id: <20261022-fix-g12a-clk-v1-3-e2bd8f3f1afa@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=8rtE4N9DTIQOCn9hKMflNgrg74QraAIVcHNIzm/ZuJM=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1n0s9qH3l+eu4Wm6GXlp6aT5T9/8n/DwbMqtNSfj3
 fe2JItO6ChlYRDjYpAVU2Tpn2t54t3lo2e+7lFPgZnDygQyhIGLUwAmcpGfkWESw7Y2JtWzi/Yy
 JB8P2ZTEZvXz8VmF0K7WNfw1alv5j/ExMnSVMu23YbFfeEHhf/N21WM3+GZdD65abmjvvlXNdp/
 AVB4A
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
index 07105b2089c3..0a738c3c7fb5 100644
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


