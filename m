Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792760106;
	b=QIUbhdjM7MdmbJ9zP4q8tg3pakxchY49NnDm9Q4PIeOSOLZ+HSp0miDphPj5+zI5QkBP
	 zGvlfOm1Q2T2sHZ+0XzQqLAdwspJdoCy1r4zNGYrLpo9ermD5KRVQ6kT/vGDl6AIXLyyE
	 uaVu2yZUUtVpp62u8uBIATtLD/pKaQsm9aI/NUdHNfkhruDiQVOSfjJXwZmMXdgRmNXez
	 w+oyQh2RBilpbX3qys/1e5ifQPUcXtX9+iw5uNIM7sUqsJcakcIfkRWzYZtkXbk8IwfxD
	 uxN9/jE1qrAZYhah9bR0phDHwARKhqO7ORZMGBvFmtz8Rby30kclUeKQkrdMLSHbT0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760106;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=I/jsmKBkJGbIrBQf+3BPreEkWXD+Jv1M7QJlYJiZSu0=;
	b=MRnB2yP5UtEGAeTpKafpNWOfUbphEaerNNsOBTDRIWlLJ/v+lYTTDliXFD0co2856EIy
	 /aO6v2zSG0NmmPqpaN21Oq6WKmf6FRLJN4OKipHMgdz9GK37LyfkRwFcNrQaJgIA7hdoj
	 byCQ0EFAUHDGStPh5ziTRExhi7g8fm9pzR6InujepCf3pWoJMcp25QrPLzuyCaRPJQL8Y
	 JYZC40WIElJT+4e+Y62avmQOZlQMtjOmeXuR+07ofkspDiaSweKk/jvhHjy5K4g6T64G0
	 /uuuR4GdSYHpqN2oWJXfRhwjb2zKM6LrxO402fw2PLCg++oLQpnqT6qgTR41EIn6vYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1SKiTB+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FDC606A31D;
	Fri, 23 Oct 2026 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1SKiTB+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792760105;
	b=uUleyBB4dDgRenUCm8N99p37N5s+RN1R5oBfmIM2lLZ22x5OyRc+pMzdFmblsupT3Ymv
	 c8Bnvmi7X50LhOMDWYbbyXo0+N37d3IiSZBnFXMEzihOqGekfUwET3eVLMmCHnv64CTvf
	 YMGClasTH5Cyobb2dK2e51iygPWcbaSs6KH7GAomZLtfQQmBD3ytmZWs7AU+gtqFIl/Ku
	 EmmwgXxNqaVf6Qg1p0Q96dM+TpABnTNF51V1DCqCko/aK8g6brFiq5EildVPMxzNtqqoj
	 QB/LC2Hp3x4RGg7ODV7fiSZGoP+uQb9TmGahFHx+VkeNtDIwq+o0dWDPnpw9T9eFQ1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792760105;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=I/jsmKBkJGbIrBQf+3BPreEkWXD+Jv1M7QJlYJiZSu0=;
	b=asXR6nlBarKA+WIsQ+swPku9FTanXdqRcJGxOLs2iejsiATgImc0RRvZt1At80bg8M/C
	 pz6IX8aiFquI7l5Nwuz6weUGbKZcfNIrn6eTWFEz1cUcI0KYJ3N/lgGM/y+8CZm96HCBp
	 Ftvhnq24EncsoYvCEKS0bji1NKW3MiqbKbwMdqFzVc509AUfRxEEawpu2bOOlYWPu0KlQ
	 gc2wFWSP8xjI8EjI8lg21hRciLPxRhK2VlaiGAlmJvPz04CDSoEPWBRadp3nPdqYLY8wP
	 zurrylr23DM/ApjL0OkBBLE8iR5+7OmVx8YqmqMOno2krSTswePihKzt5wFwCWZk9TQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEB9E1F031E1;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760105;
	bh=I/jsmKBkJGbIrBQf+3BPreEkWXD+Jv1M7QJlYJiZSu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n1SKiTB+PUZxA6OgPTo2M9OYyJpGMedkYdoD+kte+7GQ/EDiTq8GfgChXF7nwXgWI
	 81m8iJRNnY681DpQXy9h5PUiavFW1am88sjw9VmdPRWXgdyCqpWCwrN7hquEd78Rf5
	 GtTWpOxRGn1uC1SYRjQA5ufS1q4NTq5Qf3GdIAlvCQllAc05mdxG2Cj1jHvj9LaBsN
	 Hrwcq0eUmnd4VCypCQmPv6fEYdn2CTnrQASrK042dE7EJPiAFtqaKYAwszFSvncR9F
	 Pnc0qpyk3yaepeKvAHf7z5yxSkPbOqCEB73tGHRhPLdjQWerGImxFQe7vuZoMQgfcN
	 kI/rCq6XaWUpw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6477E4452D;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 23 Oct 2026 14:53:53 +0200
Subject: [PATCH v2 3/3] clk: meson: g12a: fix swapped VID_PLL and
 VID_PLL_DIV clock ids for sm1
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
Message-Id: <20261023-fix-g12a-clk-v2-3-0b0b9b86d437@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=t0FIKzJfxpaKxPA7dyb99aPBQLhdoQUw5gOCwl7UOKQ=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9btSDX2pNs2x5n53oqo/7iSN/fk7M4w0as72oSulETNM
 d6rNu91RykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRZ1YM/z3T9+1o3bXNuF4w
 quPQhPN3FSbe/uWgGGYg4mvEWvJXkJ/hf96e4/Lsr3dIV4py6Grz+tzt2uCl4yVy9HLUYSbFPyw
 neQA=
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
index 0f8cca4a4caf..baa03d24e4cf 100644
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


