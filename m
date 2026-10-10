Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFEA494800
	for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633368; cv=none; b=ceVG5VpgtP4eNjBtLHMYHKu13bOfD1fF3tGkmyvyIP50a4F+G5zNOPQ4wqMfoc1Qdf/pgHIoBxv/CAoA5sTuIy1dKjjKFa8i87si00BLlD3+MXHrp85eGfb+fm4pcNHwhZvXOSyGaExdx9h36tSlMkWx/9uLASJr/IrishayYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633368; c=relaxed/simple;
	bh=oWOjt1/BP/ZrdTdhWqbWJnrKsyEqrYi+/tyFuMPW57g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIgtHPjocFTcBA7zbYgYx9pL/rdpcipWIlcRrCL0/nTTznC240Bmt5pvFXVlDbyGjo+y2mHT6B6Smt2p6H4X+g55p0EX6CWl6Bq8S/xjD4LLsP5aF/UBG2n2TaAWTKuRKzzvKV+r+F9JdBUJ/kVZTsUGiQSkGch7hJvO7KGmnnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnmrbSx4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnmrbSx4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48870973bddso296110f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 10 Oct 2026 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633365; x=1792238165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=;
        b=UnmrbSx4gwCsF6GeA3tG7jLc9IjrJin8eP5Ex1FFWcTOsnL02w8GVhG09VYoz/vRPS
         BKfUIF5k+DD4gOUmz2TTfxUpiAbj6ib8uK9MRnEwzIPuuQedEprfE0oPq4m2aMujrkTp
         t6BVKVyjWYCHYv1FbSTH6J0wZtiO7sz2boIuZ+9LFuTKjuv7+z60mRO7DkVk62RJYRHd
         hCBn158uaBHGcYqRMwcUG1GW7cvgtayeUdetUW6P1FpNuhX03vVWfwMyl9Sw4YL7AZNa
         +odSCtIp1DTPqc54Rfad/NUiJVw6658nFgtriLX88ZcOUK3mrmk3UoVYxfS1DQ+V8Ank
         Hf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633365; x=1792238165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=;
        b=FreRnT0MNb7XqlNfrT84QvWGs5eYAW+/17uibQInZf+adFz+lrvipgnSxbROLcbN08
         BrAvd5m0X9dKApD8VB7TwKlNNv2SWgIChkzlniL7JRgtmc+O33ttFSHJf9MaEqlz6neR
         FCLZ3b+5+zAHmcqcGCQALDWReNW/hqrj41khidcBEntn0v/aF1WYluFanCXUQ+1zafXN
         0RdiphhkYx67IeLWZIluHyJMy7Gk0/2APkYUTrPaK8Db+zspxMcp6nTLi/FAfoqliCLh
         rgOtQ90O5tu+D+S5u72Qouc7LTQZzcwgIGGgdF3Tv5YuaaoPsWctuW4jBplKQMxZUD8D
         W0lw==
X-Forwarded-Encrypted: i=1; AKwUvBwd3ebohmJ80KwAZyyyPo5DCPGy5gGoSr5TO3oNxiV7Dt4o3oqmMfBfxsIIcQ14lE7f4akmhwDIEqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIge/lMTBWFFXtVF4GamwXG0/AATrjlWPxLGIW8qU3n7ioWirEB
	JZrMZ4WZL3VefObmyMj8bbKHzNyZsq0f4I6yBJDwlsXGVp9CS4zqVCzn
X-Gm-Gg: AYBFou0S6yH4t4+s9+vcjXr9aqJi7P+IHgwSZVQguq0UMN3QuQKlGxjqAhROK4SQnEA
	PyivPFOc6VvTnZ6q4xzawi3od/T46lZQ3+1UjpC9i0CyheYIMLGKYU0UJWkEAcE0a43WHLapu4H
	ntOXSwU7yKpuXfXP2e0bEHVJTFMpcIpG5Usbr7lbe2/eUCCtCqZpsAAhyUtP23jkMl37nsT85xW
	Vld0rKDJJgyVUBMQjxZSJfzSDgAxSRn1g9u4aG6HIERwy4sRD2RXPMzRQcX5t/3MVoPVrrRSeSY
	6c6CwUaetC0vbtuAFL5zlCLMobrwcIaHMlmYTqxDh1iC7AV0fcm2bs7T64I55QbCuJqmU1l6KxQ
	OL8uoINL18VbYBxx6Rnfmzh9Gd3ATeeeslFyA1utid3U8OSKv7IN5mZOSqkPZ8jwonfJp+MWhrr
	XmZMusrGUZdmjXnt10bxeIZi6VfqviBOlyhyYhPNuTBTEmB4amP8BSiRq92VHpLrzmKA==
X-Received: by 2002:adf:e00b:0:10b0:48a:fff3:f9c1 with SMTP id ffacd0b85a97d-48db9482030mr6898560f8f.20.1791633364955;
        Sat, 10 Oct 2026 04:56:04 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:04 -0700 (PDT)
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
Subject: [PATCH 4/7] clk: mediatek: mt8167: Correct HDMI-related clock definitions
Date: Sat, 10 Oct 2026 13:54:04 +0200
Message-ID: <20261010115539.9237-5-l.scorcia@gmail.com>
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

On the mt8167 SoC, the tvdpll_ck clock is used to clock the DPI1 pixel
signal that is hardwired to the HDMI interface.
The clocks used by those two blocks must match and they have to be changed
according to the mode clock appropriate for the display resolution. Fix a
couple of issues with the current HDMI clock definitions:

- The hdmi_ref divider references the same register and offset of its
  parent tvdpll. Make sure to flag it as a read only divider as its rate
  must be set by the DPI driver only.
- Both hdmi_ref and tvdpll_ck derive their clock from the same tvdpll
  parent clock, but its rate must be set by the DPI driver only. Unset the
  CLK_SET_RATE_PARENT flag that is implicitly set by the FACTOR() macro.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8167.c            | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index 3e8611991de7..a7d38c194759 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -87,7 +87,7 @@ static const struct mtk_pll_data plls[] = {
 
 static const struct mtk_clk_divider adj_divs[] = {
 	DIV_ADJ_FLAG(CLK_APMIXED_HDMI_REF, "hdmi_ref", "tvdpll",
-		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
+		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY),
 };
 
 static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..a14f0736cdcf 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -75,7 +75,11 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_CLK26M, "clk26m_ck", "clk26m", 1, 1),
 	FACTOR(CLK_TOP_CLK26M_D2, "clk26m_d2", "clk26m", 1, 2),
 	FACTOR(CLK_TOP_MIPI_26M, "mipi_26m", "clk26m", 1, 1),
-	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1),
+	/*
+	 * The tvdpll_ck clock should not propagate rate changes to its parent
+	 * clock so the dpi driver can have full control over PLL and divider.
+	 */
+	FACTOR_FLAGS(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1, 0),
 	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll_ck", 1, 2),
 	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll_ck", 1, 4),
 	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll_ck", 1, 8),
-- 
2.43.0

