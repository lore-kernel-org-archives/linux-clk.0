Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792760106;
	b=1jj+Ulk9HPy5fv7Nn/v77LHvpmKlg9Hry894fkl3/v5lDFNENgGX/TF3CM7Z9xW8uzWP
	 0zr3rxRuic9EyKC8S9J7h3XMQL6+PCMZheLUVnVeSzkrzJNSbhcIHF9F+2uh++rnaZZRK
	 N6DlG5QQ9WeloFGrrduT7BVEoOoh+0T/nEQR2K0ZjmB3OJ5tH1C2pgrJjt+BnkIYduD0i
	 0emSP9Nv0yUjpNX0cdG0QjwFnDWOvIFqxRUCZSnk5bj2e+Hzo2AzmQph39TQkwqdtrfto
	 VwR4+A7967bRBX6u1SkCTb9Dqxb6HH7qGMqet02aU7/8tsUcbXNv425j7ZcAArc6rtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760106;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+997DNCqR7ECKcfajWdY1tQzietg9A83Oqx5Q3IXzQY=;
	b=Cj1aLyCv8LWanxhYNuDDb+zaBXqjAC+fFxiNLkbgf1fdtCfu/LA4hotrBvM3y6ym5sSw
	 GlTf3qxYfrTrJNYv4RCZ+5ri5WMmUVzEHJo5bcMu1yuCPYlJWtuLeravqhkwVvTMtNdV2
	 u+iEjreTi8/LXFlapFUJGvPSit6psDsFtp+/mLJ0lyJ9RnsXxIILABQd9wJF9JZxm0UZr
	 dUJLS2BlzPZZL+3U1CIwolamu01cUFVTYONMeYf7WLd3dt6bILx+Ad6m7584WBcyY5ljg
	 0xlKzhO6zipHtPLBgnxrPDGblMWZHT023hg3At/rdQS6+YlJaSBC4F+DQ3oQTtqExbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDwaCfQ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25090606A31E;
	Fri, 23 Oct 2026 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDwaCfQ4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792760105;
	b=Z0y/XcU6+7xocWqmVHdAobbexcTTxmna1K590qxC1Qvz7DwK0u/Sq79AXJ2I419T4O1r
	 +dEldyi+C0NQM489/0fvYhWIMptDfZWB1iK3OqeZBZq/V3aN2VpPZq0wyJB9btkZMtmX6
	 0B/ZCbE8DN2m9OPvM9KuX9nej+pL+jFUfP8pM7/N5IKQ4Dy/ls3yMb5MFD4RWWTvTHFsj
	 /M4C/+Zn6PbKSfQLAouXddNK6Srup2IdW17ApCsBzD7D2sGKLh1u+vn6tHq4ezEIhim1l
	 zwdO0u+ZTG9XngZPMXZTKyiVcO8vcibA+h8TdPBN9k7WX9IQ+ttWwp9rP+h7s30mMCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792760105;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+997DNCqR7ECKcfajWdY1tQzietg9A83Oqx5Q3IXzQY=;
	b=F1858SvgBMC0cT0HDWQoLy7vU3HSsrS2N6PPqiC1w0+4CNPy7UCWkGzVghX2+n2JCHde
	 1OAUV6+SxJBWXw1jl6UQfH/h2icCxsu35dlZaEtpoQxXuDRUkGZjWOQFIGm/gPC/R8ghc
	 YODxUcQ4TxTCMBQNJjnsX67nzPBManVGu/LuJMGSIJcB+JqynsWc8+WCAI807EU100VGh
	 AVZZset87mMve3YX8Q2NVKlMaGcpRT5g0RAvlGgET+YV58qYtdyDN5pTRYc9XOvSNP1hR
	 rhtHZpScpdVn9YvwPC3qgPZU18d0CZo9sdLijBdnBqULpyLJMSzDYDIg9kL7xJhQiBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE5FC1F01829;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760105;
	bh=+997DNCqR7ECKcfajWdY1tQzietg9A83Oqx5Q3IXzQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EDwaCfQ4f1QZnD0XAPgf5tJV/085B69uIZ9mEKpe/xC1m01GVwDojdn/iDp4uwcIm
	 bcYUdjgamgFyg+7H6Yem6Fgues4fauOUQ7lbaIH1zQRxnap386hkb0qGyjiMjzDwFL
	 z9/Co8KjzR5Nw1HZbOO3rtEKarptkI1jouNlyR8QSVgKdeLZ8lUquqq2rBRzDMlPGo
	 hy2MoXPNO/wc/Xt/LlmoIpoYre0I3EwDxJMsuDL9dBVE3FsSkw0RQ+nzTUhLi2AKJ/
	 nHgCEQ0iJttLYnOH1nTJsW67y/nO+i7YqcAk6+u6a/S4kF9ZPDkwYCp2w7KzjL7d8L
	 xSS5c0vxgcDMQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 54B6644517;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 23 Oct 2026 14:53:51 +0200
Subject: [PATCH v2 1/3] clk: meson: g12a: fix swapped VID_PLL and
 VID_PLL_DIV clock ids
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
Message-Id: <20261023-fix-g12a-clk-v2-1-0b0b9b86d437@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=2dFhwExwBBCr5nuNL1VrJSQXreYDqbsyvEBqlLalx/E=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9btSGVuZ3ONeevX/mYy+WN19cemgF9fm4Ob+E/IvTv+b
 vPXLzxbOkpZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJfC5hZPhScHntV127Oo9g
 Xbd7x07EHHj5Qu3q2tyXmlPz1v1d1AxUseTk0n96Ol9svUXkl07J27JSepd4yboVgjv+JH9kPJp
 yiAkA
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
index d0d4c7b6dc82..57fa086b9c8b 100644
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


