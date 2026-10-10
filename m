Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47A49A3DE
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633376; cv=none; b=C/p/zQjwYgYQ90aEaC8pou9p8hOH1q4h5ytdga7oqyMcb9IxtFQQI95s8y0rdjr36aUwKMaQjYjBRNVg5wLBZO3mCy22+1SlivyC1MYxhSOKxmeR7RU3BFiWl14aiZVLD2O2jAtUNV6F78hEhAP/W4q02JJiLb8sl9KiDXpk6NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633376; c=relaxed/simple;
	bh=FsWmx/ObrGOwpry4gMTdMfUvKRBXwQpqujcqAmfgbec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSNduZs7RZjhrSg37XNwNMWNGLYPz9JqzrCJJATRoWW1TjI2B1YxdddEjVIMvrvK+1vfkbgr/M1TEOy0oCuf9nesMYOddJmtC9hkmga5YT7GChH7VIgPIclq1QKWYl/yS6OwsPo0wJfnF+ncIEsREJgLF4jACWHPXNKcdXBlxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyOOqCeH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyOOqCeH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so4788635e9.0
        for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633373; x=1792238173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=;
        b=oyOOqCeHYt2nT2ehy6mS9StH0zpUWaT2SvYbcrfvAXtfRtW5MDgUJF9yTovZ1o5nKu
         fDbWqh5wGIk/ReEqi3R+3T8pJ0YyX6LBw26+UZE8Mlp95TmSxiPKTgzyMm28AzCK93wD
         d6WCZH31PG/9vvvg47RBM8KJ9uGUzv2W1Jxpxb8blOm1KMS5eLnL6DnhnP1RH9Fx9cet
         DUUVpA5z/+1HWvz8yRLVigM1JFK77RZghtEXllqkPjNwZkycsgl+OyAroMUR/U8c91fv
         94LIzYusyjpLEeWs6aMrzUNtawZ4WI4n3ttfQe8R0TNpv3UWGUpuAkcBsJWWhwOnlyvR
         kvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633373; x=1792238173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=;
        b=P310D7JrmMyJgurnXWP3ugh5Ws7fJlBf9HtjnP4ct9QEAX/z8Z3A+a/y13uvOwmwfy
         9jl9zPLKfPnA1wIWeE+jtQa5FhZ6UXvZc4yRtMZXx5cOxemyfeCfvoZXHzhsirXH8S02
         YaW0s8Fb95RQ4LRs9sLiH4RHoSAKPHHP4KhP17qe44XT+dCuinaP6GG3wd70CDSnMYDm
         c2RjjKa7jxWJkGTBR7jwgigUb3uAZ9ONw/Za/Mxz45gCDCJwDInA5wBnqPCDvHJMueM6
         h9Ppub0O4DjDk0UcpdE9QvFnHMnp6b9O4QRK4bu71gWikFiVpsCznp7YwV99tG3kzN+C
         dDBg==
X-Forwarded-Encrypted: i=1; AKwUvBzZWan0dESGE6FVPRgK2smb3m53EJ2T51IShcKTXSho9+3/c5Gy8bnLBwDNeR549dXpginidQBtYwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsOoCpWCyANHaSjAYzhmI8Dl5uFu2rLG0gAEaQ9wQcr0cDOJMz
	Xji0D4CDJrFguwI6gMqu88oABeu8prHFz0Lk0SkGjFvgoobauCZa3bbq
X-Gm-Gg: AYBFou2yaIc/9rPGNe0f27ayheJQio0mo1l4uGBF5OrHI4Y6txhPrkkuNMsllgxBiCA
	yXK2LB8WhUyBWS1jYAydFq229c0oqGuqqp99wWxGhpS4aDeQoAVWSGccnlSWglqg4TzR7Zflb2R
	uJzgXyyLvZJSqjc+ZUsL/o2T8vu3aZWdtq83aXjynXxj0tXkNJqfiOq7NOIfgnvL7lf/9TKX13r
	YdU3Oj33sSs1JBqyNcr0YjUAc3tn/Guo7dt2A76LYLXJR0hqU+/E51jhZrihh9Su+AKwKM9cO0q
	pH9B+3qTLGOuzHLkzoiJ7nc7UUM7FBhIL3PIy6SHJkBF6d8TOzmlZrN4XYLY4aX7FgwFlT0vf+1
	+KPJQk0TgDtTLUneveqXIu7bBGEd7tLgIhHfVK3hZCcEd5Oik4PKJFI6tAFaG/tcSghTn/9DVIW
	eyc4jbhhwmsXZLSwi2g67KndxA5F/gXrwcQ/S47culVP+xteQsgSFXYFPEHaUMsomrpA==
X-Received: by 2002:a05:600c:6749:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a18e49d633mr79294265e9.7.1791633373147;
        Sat, 10 Oct 2026 04:56:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
Date: Sat, 10 Oct 2026 13:54:06 +0200
Message-ID: <20261010115539.9237-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The secure output control bit toggle for mt2701/mt8167 currently sets
bit 0 (DEEP_COLOR_EN), 1-2 (DEEP_COLOR_MODE), 15 (HDMI_PSECUR_EN) and 31
(HDMI_PCLK_FREE_RUN_EN) in the same operation, but only bit 15 is actually
controlling the HDMI_PSECUR_EN bit, the rest of them are already being set
in separate operations later. Add a define for bit 15 and clean up the bit
update operation.

Fixes: 0fc721b2968e ("drm/mediatek: add hdmi driver for MT2701 and MT7623")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 9896eaf81e7e..781177a1f190 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -63,7 +63,7 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 	if (hdmi->conf && hdmi->conf->tz_disabled)
 		regmap_update_bits(hdmi->sys_regmap,
 				   hdmi->sys_offset + HDMI_SYS_CFG20,
-				   0x80008005, enable ? 0x80000005 : 0x8000);
+				   HDMI_PSECUR_EN, enable ? 0 : HDMI_PSECUR_EN);
 	else
 		arm_smccc_smc(MTK_SIP_SET_AUTHORIZED_SECURE_REG, 0x14000904,
 			      0x80000000, 0, 0, 0, 0, 0, &res);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
index 2050ba45b23a..e0c35277c553 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
@@ -219,6 +219,7 @@
 #define DEEP_COLOR_EN			BIT(0)
 #define HDMI_AUDIO_TEST_SEL		BIT(8)
 #define HDMI2P0_EN			BIT(11)
+#define HDMI_PSECUR_EN			BIT(15)
 #define HDMI_OUT_FIFO_EN		BIT(16)
 #define HDMI_OUT_FIFO_CLK_INV		BIT(17)
 #define MHL_MODE_ON			BIT(28)
-- 
2.43.0

