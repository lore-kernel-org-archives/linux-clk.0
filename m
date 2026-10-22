Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792705988;
	b=sx5TVJEt4mF1MHF+F+LBjH1cTBImQMEtUirZvbBvSD0vuDZFAVbRCm32tLYZboFiZEza
	 P/w8Pc9xsd3KdDyNfWgZOS8IIrG9YFn5/ntWvXtijmea57Tvs22ULHji/7Zzp+of8ZhRM
	 7SWWeDgbPjiAMvFFgJUCCA8+BjPvluE69iHNrXykl7PmTkqHxab8JvHgdGT+q8oSYnNu4
	 X1qFwyl36QEf0CIZzIK7OzacptBpcaGHMEWQpjeRaMrGMbztEKjJ2ZC2ubpM5YyouBpAb
	 g1tzak2RJ2fEGKjxq6vWPjGXxBFiBuPOfLb4Htv5tyT1Dce00PhTezxfllOsvTnHpYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705988;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fujUEWrEN2rYxJUdidBu4N8nU2Vgv91LVkUCIG4oopQ=;
	b=PHjONBenpB4IJmF39K5jbBT6X+jd4CBFlXSZRa/rwfsqXBZlwiJoX13RCPGW9I4vbfg9
	 M+qHOILWQGJ8ew3JXQhmIU46Sui1lKQUqeSQZtqqL26y7Fol6lvWXKHfABzOcVuslQD50
	 gghYKpNUeqFOY5PIdCGgffsbZ97UwHSVqPfI1y8aQe8PNz47bM/uiCY3qUqMhnYgaGM2j
	 beevLI7zC2wUoQbWM8ITCqCXN77iqVv07PLomeln6urXVR6oeaQ353wNqBveQSXj72K3o
	 HDsAFmquSS/6jzhMD+MhV35kkEjTe+AiGoFXReo3yTG6xj8TXaX4dZjecwaESWnVcvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B51lJztj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2485606A319;
	Thu, 22 Oct 2026 21:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B51lJztj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705987;
	b=DjEX39ywdL4PiKLk65g69xfklLnhx7YpgZNnx9MoP9n7kg/O405E3xbyfN9xgN3IMp7c
	 NirJ5JjRnBXbBU2H8V9itAW7N75WqS5JS1BCupe7x2v6HsvnExHm/8rysac+sTMFT8I7y
	 TtX/giwjvVmUpGDGpnNyJRQMbsPD+PolyTkO/K+quKHaIoZnWbvgo1/iOzU2vMk9iULpB
	 J0hwQ/6iGjQ25KF2JvVAXws3HvR2t9SqPlD80oSg1jqQSn0uy7RNoGBtvMQZS62lWwGCD
	 dY6gquTijEwNTcSiARXAoiWiMNkA79elq/gOtL4t7mU6XmJPUr76oeIY5MMHAyKlk6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705987;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fujUEWrEN2rYxJUdidBu4N8nU2Vgv91LVkUCIG4oopQ=;
	b=WyRNSmEEUr+STQ/xlSkiOBelknKrO3GygxyjRbE+8b73Cy//ZitYX9u0XlT1ZqXIx4RV
	 CCMNktz2679wIuh9HhStfJyNR2wktoMwHtEyyCtgMFOeWbdriLDfp66wRcNmrtyEMP/dR
	 qIQwKMPsMR8uREqr4IpjlnJyjgSLUUe5JMLxfyxv8vyUOTN7wwQqaVs0dIwWTgASIrzoW
	 5+eQKNlgmVBOh/lAzI3HHjZBRnltzAZTNFtSAIi59dgcRFTn8iNLUa33y0RhmuxP2JsHI
	 xu2yITx6XJ3J5v8NQ0yzTtDC+XuGriUBvaR25au7g61jgdaG28cWRjYXz8VxRoCTArw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 561C01F031E1;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705987;
	bh=fujUEWrEN2rYxJUdidBu4N8nU2Vgv91LVkUCIG4oopQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=B51lJztjY+zo9t62hKlsE4gQksKfN5loV1e0/Q6o8zpzOF3O0aZbuTlWBmHPAXMnH
	 VPy20t9CRJXJ07sG7CJnWB1raObW8cOXjs0GSKdQ+/ZE7trq1OcTWMwY1LdEyFMeo+
	 7hTOytAGS7e0WGqn850MQs9Dsnhh2XgI6If71tyqa6hiO8ZyCU97TVcGv0bcJ0UMmu
	 EnPpu5NIW62Frh1E7IsH/qlXATAL3Gz02P5ZDKVbuOI/QE/XmSgQ+Ur4/UOxpHT8en
	 n8DMLVBKgvOpRYv9NsmCW2xwXICCi5cC22QarqBzrm0DuyrccCO8oBrjJEOHvuNja7
	 tnJP0QR3rz8aw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C744741F95;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 22 Oct 2026 23:52:40 +0200
Subject: [PATCH 2/4] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV
 clock ids
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
Message-Id: <20261022-fix-g12a-clk-v1-2-e2bd8f3f1afa@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=YR8frSm+6sxxqFo9ANrOruNDwaVVFJ61khzljz/qP2U=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1r126fz2QibRosEiwl19TzbEnL0cZaFv9YPZIpPtQ
 rjnp2cdpSwMYlwMsmKKLP1zLU+8u3z0zNc96ikwc1iZQIYwcHEKwET4uBn+Z0duUVv/Tn3z8+uX
 5AXCJN88WR9lpW5jOMtwcufHhayS8xn+u984/vPqXeXVJXz22w8bP9rb+6stTvxEyWrXFbdteNJ
 fsAAA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

In g12a onecell data table CLKID_VID_PLL points to g12a_vid_pll_div
and CLKID_VID_PLL_DIV points to g12a_vid_pll. So the ids are swapped.

Swap the ids back to their right entries.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4ec5f15daf98..07105b2089c3 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4622,9 +4622,9 @@ static struct clk_hw *g12a_hw_clks[] = {
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


