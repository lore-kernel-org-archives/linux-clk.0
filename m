Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7B28B3E7
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495050; cv=none; b=I+ANyEBrnONvI1QMOfIJwIpvK5EJjyEJRKVKNkBQa25RIKfjsng/z8FzCJ7kfbv7v/02+efD6B+zepqQ8PhZs1/gvMIbMkcb976fSx+Y5N4bIc4rp6ef1wbNSOUkxX9XvOeY0FZZECwb7WbAclL/wrWl7+u9JCvH8RiPTCeaPqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495050; c=relaxed/simple;
	bh=nor1PtsS8pW+dX0xsLXLZpeucCjaBZDzA44P1ujZuN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmC/36X5pAYp1ySoP+FC7msBLPU/JE3p0tvjvSsRpua3OhbdE9UslG57VPdwxcf8QDfAMIhTOTMFiL2tiM43zB0H6uWYnxGjkGTFo/DLfILVpr/WP/+zIIBvw6kT779UEknNNWc9YvJPc37kiYuqyBJstLNbabySwwY6wPs0/Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dES7AK1D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mGVQskGr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dES7AK1D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mGVQskGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
	b=dES7AK1D8quNL4YrWGRRSaqET+654A4m0np0a5cCdNxj02F879+HhAbgI52bimzhNy3twj
	19v+wMNQdT9ziP4NpKrdrRoUpzd6CBqIcA3c3gXi7xH314DyMBnokHybXGM6/jEaY0gVR+
	QupuOiNN0rrJLGiaurhFxqA7jn9Xaeo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-gMXzTq_9PxSWnCaLzAEBzg-1; Thu, 11 Dec 2025 18:17:24 -0500
X-MC-Unique: gMXzTq_9PxSWnCaLzAEBzg-1
X-Mimecast-MFC-AGG-ID: gMXzTq_9PxSWnCaLzAEBzg_1765495044
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9ff555d2dso162811785a.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495043; x=1766099843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
        b=mGVQskGr2dWaFZ8FiuqvEW1THmqQ9VYMkCCuwvuFjXQCOIN76Sra6mtKO9eifRrDfT
         oNIjol5D9neXID6rJenZ/Csrgso+NtK7NAYxqmEmwI55k3QYNK1iHZKFq8KxSZ3NlpHG
         38T5Pv04RGr1HGBTufG4more5l80uTIWQ7SLElSzAE4ae/H01PMEEubYb036vE79WNOK
         Zp5yl2La7eEhNDFSyKnExuQtjE8mClPog1RU6AnyNkS2GxLzQW1vMvRliBtPj46f6do0
         dICZn9pBNlkNv2orxU9YoS1MsL8pgUbVr+3fv3w74Rxns5gJouqDvSOproi/mNjo/cLs
         +TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495044; x=1766099844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UOBVKGehGZ1UeiGLBGWzyHphkl52SdXlMLeqrDHm0DQ=;
        b=JyiaAnT1nWjU4D9jLrYhgTaYkgkcauor+0SRTBerJOtkCjiT8OP3DHC8jtNpCBImmj
         fUpDcyiXsHoLG/y1oSEduQkyoTZvjsho1VA6DHqrGaEyat0Perv4oPYV++YZYrEb5QQg
         rnp653FC/GcgeGSD4Y39YYt0ERsuDZf6VqHQ/RGjqog7lqaTUj+wUTLRdqbHHHDeQqPq
         cdSbO2c5gXR1I6xQxGFw03zQrDkETCCxO4FqzSG6O0UR1p59nFOh1lU/XFY7hHQrlJq8
         QnnqFti6+jDXHz7mpBPYzS0jeU8LHVqEEImUfDACwWYt6DPzjZkfbO5s9cHCTwkFHe0J
         RD+w==
X-Gm-Message-State: AOJu0Yx71VmUCRbLRAb86TmUOSpaF3DBvfAhRT2RihsQuHYRHiclI8p9
	VXUHEEweYlubTvXSWemfr1pgN09mMo5sQUEBUM3uR4bHY17wPZGVzedEB2D+d1kJejRKlXI/BPl
	JnwuBNebv/1im+INUfbBwsRCrxGTGkt4Pxk0yF3nOUsus1HPUf7u1SbnhLl/gEw==
X-Gm-Gg: AY/fxX72dZrc/DuzwEZxCazfWdRxeufBxJsPhLRrpy6gYFLO0uC8sJPOWfDZNc0ODFO
	hNHXYp8ZpvBNJvltdJJszq20fUmCfBz7SI3SUAuP3VnvEPE/1OTZRpwZFfaY/wv9iCW9JeNhew3
	NMjKhUHTLsjczQCLCh2S08BnAID35nc2HgjbCAXlp5fM3OzKVunThB78XPL4bWhgofdD+hdxN1U
	TiNho1DE7cPzgG6eCHojo0eIyoMhQ+QJ3idvjFDr31RKKV7TBNshNwH1GuNqaSS5aFMLhEzioWu
	fZHWXNjvUV8+r1WIqDQApN97JXxbJt+LGleiYVPibpc0+NcUZwzCkt29ycpHfj3OVLCajxxJYUX
	zUU6yqrjaIRsuXPqZjetJbFWtlj+qhexrmG07rv2ehPGbpfP1ziJxlw==
X-Received: by 2002:a05:620a:4402:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8bb3a39ef0amr29575585a.87.1765495043605;
        Thu, 11 Dec 2025 15:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEKudoWCpFXTWryHiRn7BIWdpxq1jIr+pxWiYKNOGd1R/M6vLU3ldrF09g/tRZdBf2bnSeqw==
X-Received: by 2002:a05:620a:4402:b0:8b2:d56a:f2f3 with SMTP id af79cd13be357-8bb3a39ef0amr29572785a.87.1765495043242;
        Thu, 11 Dec 2025 15:17:23 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:22 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:24 +0900
Subject: [PATCH v3 6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-6-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nor1PtsS8pW+dX0xsLXLZpeucCjaBZDzA44P1ujZuN4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5JPn9olfEuTvvj3tw1GWwBGU+VG8TbX8XtsrQ1s
 d435bd/RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNxyWdkaGhpmnjR5MTRYrET
 y9b6nJrZlTA1uHYXU6Dd9BPilnsqrjAyzK5fnHRCReH6NOn5sVMKMza551xlcVQ5G3RQ+MnShfx
 2DAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 553725e1269c9d7ad88f89367dfa1cf367aaf1ce..a54d44ef70ab49937d210f04fdf42300e8e5f2de 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -97,16 +97,18 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
 	mtk_phy_clear_bits(base + MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
 }
 
-static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int mtk_mipi_tx_pll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	return clamp_val(rate, 125000000, 1600000000);
+	req->rate = clamp_val(req->rate, 125000000, 1600000000);
+
+	return 0;
 }
 
 static const struct clk_ops mtk_mipi_tx_pll_ops = {
 	.enable = mtk_mipi_tx_pll_enable,
 	.disable = mtk_mipi_tx_pll_disable,
-	.round_rate = mtk_mipi_tx_pll_round_rate,
+	.determine_rate = mtk_mipi_tx_pll_determine_rate,
 	.set_rate = mtk_mipi_tx_pll_set_rate,
 	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
 };

-- 
2.52.0

