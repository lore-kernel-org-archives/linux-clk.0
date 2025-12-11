Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016362BDC0B
	for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 23:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495035; cv=none; b=cbEkLVtJmJIIteP95O8F4nsGyxI8N8GrGQRAmCW84Qq5FxYUAUyiV6oqhkMctjVhmHWmGWjUEI8DWqqvuEclnGVlYdLvuvVFuuVHxYXYE1FWCiRjL75Ej3w6LPzOVctCOTlcJi5o9JHIt7frzmwoCvfQNFuYPWux4/d7pXl9lFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495035; c=relaxed/simple;
	bh=9Rby/gTtrwRqsiL8QVGL8ZbeE5p6/9ylnJs1vpPUAak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2+w08pOTDeDyveqGsDy2aKrYR78rUfjUluLfJBVVcRCC1UYeW3jjpqXltBerRABQQLAJhimCOOcQ7e6wz1MIxZ7cKbSADEf18KkHfucTU4GJBpvABQLxVeCG7xW/m4+k2kMsDP3u7xoUD77itQK0zKmDu2AlGY6lhVe1vn/P4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gwrXM5yf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YMciRsdK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gwrXM5yf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YMciRsdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
	b=gwrXM5yfZ1I1+JxUpyglj/vhGkULa1TE2o5pE/0cwK8BxQrAHiOOh1xwsVoDgVhoBbFOOr
	Q2ZoNAp3D9HIuzEqWdScCQ7VdrIhYebmiI9xQW1F0Sp1qloK7/+p0R4p5LaHKUV39ZKjs0
	IjyChzogMdkErwTeUTrMcmWxE2AIrIU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-6D-jjYsXMdurOX8tNwAuGg-1; Thu, 11 Dec 2025 18:17:11 -0500
X-MC-Unique: 6D-jjYsXMdurOX8tNwAuGg-1
X-Mimecast-MFC-AGG-ID: 6D-jjYsXMdurOX8tNwAuGg_1765495031
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2217a9c60so201633085a.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Dec 2025 15:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1765495031; x=1766099831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
        b=YMciRsdKi6hr/x1T6ACxq1NyCkgK83buj0lzt7swzPPKQTSvoj2zwrpTq+U0GObw4L
         cuAYgyNmUh22pymIAeAHLMmckN61rglLXA9EaLfH3UlHeTfx/D4ne/e2zByr0cy5LGVG
         taCF1nH7YRLcmjFsw6mCkSceEJ7PTRu9rC9QBvzZspdnDJbjRLrS1GyOPW9OF4Fbku0U
         ovpXnpONJmGd1YES5P4vXW/Y919sa3THF8WPnGYvzpMegp+5RK249B9XSv68sEvZCWMz
         aJowOrZ/OJeZIwIU/M9f6ExozPvQCUba7cqD7Cf5ttIvvEv7MdXJpbJJh5Cl/PXG0DwZ
         2OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495031; x=1766099831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bHDjO/kgoaGYHTOpTXBh+Ta+qpEREkcfpNn1mOnGExc=;
        b=fOh1PdF3bpf8NW7tAW+BbvaIo4yGfnQMOEGaSGOuKvul3UmiRaFlNJl9GOh63ta3LM
         Q+AHm5HzBG9cVyPsEIoCHpnk5wcoWMUBhtPfkgpyGwmC7/R0KxX9FFd0MlODg6HctQ+g
         d06zU1YiarKFP+rIfxDTVVrMYUUgulDAW74tpbUyT5UL3LtTfmHGO3ue3XcLn043pFQv
         FoOpZKWG55nhCvx12VKaIHUEyzTNcGYYCxGhN8AvmwxhfEnvfzXka4EL8RnmLztQnUwR
         O5iF1ubeNaZO4nwl958k2ff40evepkjNm44t8Q6p3elwXFowzDbUxxzL5xqgKbRIV9o3
         fJqQ==
X-Gm-Message-State: AOJu0YznR/wgFTmy6TARilHDGZUajv+bp1gv+yn5REgYVeYJ0WiumagA
	lYFMgHEgYXlVVU2GbBZdtDZfMEA/tnYtXz5nJcyvDIWfJmmD7+gRoNXqv4o4yBeeGJqxFlSV/9/
	IPKEfURSRydGq6E+wHaUrmd9eW1A+4+SMtahj4TeEUdQonMK7oJWNm6dEYfgM6Q==
X-Gm-Gg: AY/fxX5soZB8e+k6nPEp1shpLoYn4Y0ejx3U3bM36JiMzs2r4FkCR0rg19E2mei/+Zq
	+hgkSsk7+hjkzjr0tftQfZW93BcQA4xL4bSUZNrmCwp8fZQG0HHHSxLrknUKA5+LtaW5AH7qd30
	5eUyqWU/aa8n2O6d49EpI3cmRSSe0j6R8wgT8q4RQY77b8kUGqGYgYtv7I9k4JFD6Mtv1UtwtlT
	/j5eJXQo3o0NOmgNqcunchuzgPSdIAYR0A4HO9stUuwPbfIrP2TXYxpJg6Wrea6Gec+AAqvHZmV
	qzOVcHCZLvTrItElpVLSg0cdIbed/ioGmPo+FUKNDF5jo4PEctm/jtXXTPALd4G7y1g4irUjX6N
	sDWbabQBxaTZzLhcWq8lA0p8RdqVCa0OS4KbJrHChVZs+eMDoF38+pw==
X-Received: by 2002:a05:620a:319d:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8bb3a39c0d7mr37232785a.82.1765495031251;
        Thu, 11 Dec 2025 15:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOzc1K0inF9u8pzCleS8AGBiFhiCFwZWvQwaIqfiguX4BE2rhrbkOrS1UeTFCK9BaNhdqc/Q==
X-Received: by 2002:a05:620a:319d:b0:8b2:74e5:b11 with SMTP id af79cd13be357-8bb3a39c0d7mr37223585a.82.1765495030371;
        Thu, 11 Dec 2025 15:17:10 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:09 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:22 +0900
Subject: [PATCH v3 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-phy-clk-round-rate-v3-4-beae3962f767@redhat.com>
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
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9Rby/gTtrwRqsiL8QVGL8ZbeE5p6/9ylnJs1vpPUAak=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5NFQ+IipFUK78RHpdWFHDi1cVcbxE26yeXHc6Vh
 O+zE1XtKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCJ+VQz/K3VcuHa+5pQqd10Y
 WTnjKhPnpr8+1w5c0w2UTf/PFv5UheGfooXXh12n7AWuedZrRn37XS3jEh45cYbfFtUtZt8rQzp
 5AQ==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f7725738c44f19555 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	return rate;
+	hdmi_phy->pll_rate = req->rate;
+	return 0;
 }
 
 static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
@@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.52.0

