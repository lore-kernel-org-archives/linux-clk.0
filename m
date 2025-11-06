Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F66833C50D
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 23:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762471636; cv=none; b=UsudJn41JIBbtpmOAe9MhdvBGHd0jHuLaFxwiou6eJNq9/dmOMyuzPlQKbyJ7YQtAEtD4uIkVzCRheLVgz2iyJMUSa9Xtz2VHDdrWIJ/iwqZN8VehqOIHvL8bNV6Z6iiErzuxM9pCeH99qxkhKlJW1tAt3xtoLhTUf3zXMb3FOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762471636; c=relaxed/simple;
	bh=XNrncR0wdrogri0mOccJ1j7cRKzm0SbJrI8uS65MUBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzSKJoYyC7AqWEUa/OGLocifwVunVUva9Jki0RV3hgZulEmpU6W3mK3BozliO4AZUXRI+4Dghx3Y1xVAddFgLI2n+4nZkPtDk7kI3CsqhYul56ReKmdKNVkVPh+pOOKi2zxAYhJoeCFuw3f5mUjEFjG+Ob0X00rYJplrjG0vKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=by/RSgi1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sEiSKdS1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="by/RSgi1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sEiSKdS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tBx/RbO8BQMCKJrhX3UVFzNDKA/fgJo016hiP8kJ+pU=;
	b=by/RSgi15OpAY9bfkalQPnabc9ZvyUSmjdhiad1qaAjbyZGJF9U4lDB3Cq5LMbb3AknEtP
	K88SJrWVjYlLkgX+4k0V4Ks/QoOj19pjv8Nk8pYe0Rjy01KsdjVGog3o1t4VHfNoaSCkRt
	xUPD+p3e8ZbsDNeyyxI5QhvyzC1l6IY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-WfnU2UKWMFO1EY0x41Ielw-1; Thu, 06 Nov 2025 18:27:12 -0500
X-MC-Unique: WfnU2UKWMFO1EY0x41Ielw-1
X-Mimecast-MFC-AGG-ID: WfnU2UKWMFO1EY0x41Ielw_1762471631
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed79dd4a47so5218181cf.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 15:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762471631; x=1763076431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBx/RbO8BQMCKJrhX3UVFzNDKA/fgJo016hiP8kJ+pU=;
        b=sEiSKdS1wO7WQI/t/RKVAtIS3aa8VrEZ9AGyY+ln4IGR/LcGLX7Ww2Bzncbynjt6eE
         BL3pAP4TCqW6qrHX4Vx0ucsbAnt5kSenTv3rg5sFJCRs0BC1gFdfUys6qoJCUim3YZdu
         kheKxq+KGHmHkRRYLHM+9E8Z/wqT7GVxzWXSskD4mbNohQ4sXPku8NU/AJAyu5YiTvZ2
         vSLZdyrg7aPtrIBHM8aKGcHh+amivBH5kiFclL4z4AZf7+9JAkh303190LRtd9EwSXHf
         4buuDpj35REhoZhaZw5OZctbmXCSr4uC4YlmB6P4MJGIeCubAo3YRM9GwMByeZGycZTL
         +dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471631; x=1763076431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBx/RbO8BQMCKJrhX3UVFzNDKA/fgJo016hiP8kJ+pU=;
        b=C36aN6vRy44C8I9yapxuh/iC7PW0l9KWc8veX+RanqSMmsrw5CbGzrvIfodTpfNiNw
         U1AfrEP7Sizbrajh72xtGJ9WPjWag1BX+oY5DI3N5iKacPFgm/WeODYYv29Tb8vQsqmq
         VwpW6G+5zQG2G1u5vDNPlGQIVlq9G/isv31fb6c1VUQCAM1xIwIx5Q+pWvkNvETeiUAp
         bvXZ5D4syBrXfVPoAIsHrrhFZuIL/om/3AtuDdSyFD/MSG2k+bLOGC3BU9il6FmHOVZf
         rx0R3oI7VCo1lelIoGvU+1yuQPWO78rRW37/baQLkgOw55xBctsn0rzhAOND090YMApC
         DH7g==
X-Gm-Message-State: AOJu0YyFqUIUSBoFEosJzXIlvjCsxpDDDNMNWU4tbFGu3OUA+6frbTFA
	BwPVfcZsTmQ80vFw2WWxLj5AorKL+Wr7IZb9kVkfXlz9hBeCoAv8MdG8XDVQGZfeFagWXXORUdW
	TKzCiCRBwFmLzOShcAx05FF4qa/TBy72FFfOwz2k49eySoHZakudJmpy3Q5H0Ig==
X-Gm-Gg: ASbGnctfDcp/U+IXNfncnMCE9FJfjK7ROlfdO2qgTg1CK1oAnAZjXObzdUIOy6KvrFt
	DJMDrOcZLyhekRT2cReyH5hyiCsgk4WK4nWamM0AMv0XCG0QZawdvpYAXeN8fgvY37k0dIuvmmd
	opH4gHxhVvBsPLe1vnz5wlQ/RUqMiSfqJGEd9sMM0QCJKoc05r6wgGkBg9VBsJBFVcIpB5eCLHT
	GaHHHKwyolmpS4hghknl50jxEkC6U2T41PeKfciz9bP65AsInQPHEZUzrVOY+T2qHq5fDPtx92p
	JQYx6AFg1PC7uSMHbAOE/FhIveA9Mjmhr+zAMcdIs9SOaTU3LYq8lzV9JbyMVhrk8Hzp5LNqdWj
	Yv/3H62zvRn+Q7WFyqRelM0WqfNnhYuDBOL9EWKHpmg==
X-Received: by 2002:a05:622a:189b:b0:4e8:affc:29a7 with SMTP id d75a77b69052e-4ed94a4c31dmr14935711cf.69.1762471631424;
        Thu, 06 Nov 2025 15:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt4j9euZosp2hZeGEJaF3Zc+V1HHaVy/kAkeKIc2HE/iGD894+L3jbsBB5eqZssh32fH0eaA==
X-Received: by 2002:a05:622a:189b:b0:4e8:affc:29a7 with SMTP id d75a77b69052e-4ed94a4c31dmr14935481cf.69.1762471631061;
        Thu, 06 Nov 2025 15:27:11 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:27:10 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 06 Nov 2025 18:25:54 -0500
Subject: [PATCH v2 RESEND 8/9] phy: rockchip: phy-rockchip-samsung-hdptx:
 convert from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-8-e2058963bfb1@redhat.com>
References: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
In-Reply-To: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=XNrncR0wdrogri0mOccJ1j7cRKzm0SbJrI8uS65MUBg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59RZa/lLcfPtOav3l31tLb3NLLrj9XuLfm2MKzO8eb
 lmSfiJesaOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJLLFjZFjls3zG0W8X965q
 XmO0fd3SSvnMpefLahKc57Dc3CGSpOjH8Fe6eEW0erXU1wzZ+KO6q++4quybaPjtwWm7bfZNNya
 mn+QHAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 01bbf668e05ef94e24a3fa11f96f219c4f942451..e5436c99a3c435715358a07da73b4d10d78ef1fc 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1868,8 +1868,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1878,9 +1878,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
 		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = rate,
+			.tmds_char_rate = req->rate,
 		};
 		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
 
@@ -1895,7 +1895,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return hdptx->hdmi_cfg.tmds_char_rate;
+	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1924,7 +1926,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.51.0

