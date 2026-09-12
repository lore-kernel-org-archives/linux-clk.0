Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C5372B57
	for <linux-clk@vger.kernel.org>; Sat, 12 Sep 2026 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789195262; cv=none; b=rLuqr6KVYNjbFEItiQN8UMNGJSemRyVTIjgJ3siGg/GcXPZS13ZXbVwFhIHjey1v/TemfENQ5Ri7glRp5vEUSxmTkukkS9F0AmW/HcgCgUEHAaGxK+ngOFs6oVxADa1wQI/Jfgb6p1Mfv4FPnUC3Nyzu96pZ5csdrABc59fnNxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789195262; c=relaxed/simple;
	bh=Ql7C35Wo0Afw/TL/lX4BfvZeI5ogoZo8Mi0/Jvy5M00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwCZzUE/eNDFPu5UyDe5cevyvuTFj3NVELFDqJnWoWDMymAE97xIEyDWikcbsqvydV/zqIexSMrgnlOhIAFxrohC7+S3AaDcNkYrLIewgqTV0UfQBokpjDSPYCwYL/DUsIMAEe4ggjacax/0qVR091eGCWHFPjFkYXg8YnUl+tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObNTeGEt; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObNTeGEt"
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-8048c70daa6so197352a34.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195260; x=1789800060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEwlHUG6xxFLN3/abf2x6jxnqPKYyOou3o3CHkkGDKs=;
        b=ObNTeGEtKNC+bSGgwnrH/hQ1QUh2yUIQWp39Lz865cGBV8jL8lyzL/slJm26PbG7P4
         BxYIKlYmNj1b89TNS+NasHICHPbP1NLwmKGR5L9ToPYlFgjRT6U/xvD/T/SgrvDz4rK7
         7a+8xOQbPhMVQMtihImo6hoK+m8l0vMVqL9ilYM9HRg3Y8mIu3Eqf2/G5FyjHnky0Y8q
         bce7TUkTaq2qar5+nF1Mr2NRywjB1pcQR/5OZc+NNHwQJfcqbvjaI1dgP3BThf+ttbs8
         fC5UtzK1czIO9/jkbAet8Bq3vBTmdQp55xbf0iUc+T52f8X9SkCVquRBI1bw+7cXLNFv
         KIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195260; x=1789800060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEwlHUG6xxFLN3/abf2x6jxnqPKYyOou3o3CHkkGDKs=;
        b=ZcyIHz8pI5gD8Kf2gsrADyFBZTDjnsxQKue+LvHh6qcxZvieOgsVEV2C2+dk8oUUZU
         9gyw+6mSkl8kPSuH2n6Gnjg0Ad7p59Yl3anMAM17czpOYiTX7YsahfKic0i9VlWmx6jT
         yyyRm/ntqsI1Kkhssjwqy/Fcr1rP16LT0sM79N/5F68ZX4WOxClsaq8X82caZMDX/1Bw
         VBL4TJvUJBQcGbWmmQy4AsjqVwKeLF8MgvRAfUOWkLv1emzJpI5MCHsn8xGHUcb3J5d0
         RVRvWWBgboUro4OVFKFPZZvjrhVeUioAN9vsr1ud3TIH/cKyTnpb3VC5R1GGUohQBlRH
         xj9g==
X-Gm-Message-State: AFuF++mO4XV0Q4mgV57ccmGNJGaz6eWVmd4ReT1dAyaZcyEXfE1plNrn
	IFEDEw8Dq54hFfwzcELsaT3R351iJ4F3FDr/n7qQLbeVTwtPOMxF+8WkldQtYvO6hNI=
X-Gm-Gg: AYBFou1rB2GWijSg+S+A745Iy0HfRGNDHT9irpm6qwHMkwpaIla+Z0l1LG+G5/Ksx7C
	tfCwe8MJGOyCzEJfspUe4Cp6PcCmupGxy3ToElaqtPNGKYQ7LA0C2Eh+95gyPwKVlz9NKp2vQQJ
	t5crCDsW47zXoyT7+eEMtx5tpfMZ3vuKRno0ivvRg+IDbx6EvfKWSa0HZv3TT8MChTC6Y8WScMU
	fddtMVAf9oas++Cq0Gy9wdoXuRm9NuPbag76IFoXS82d3exRT/HgAyER4i+uUy5/vJgIXpwpdP4
	WxoVUNXm4uk+MqMAMUKA0RMJ1yTk/mAK5ivyFZl3wxzzKhcs0VWAi3xZ47v+U1ShMv9YzuIOWHg
	UzF4H0N7RmKb4g/GkVTTyBNMefB3X+hifp5rJL8d2bubiSq6br0ZDoPryWDXWQ+IOWoDETiM8Ir
	olmGtruZCE2GsaNv3vdI4x680LWdMwmMinbtZcGxVU+k60YN81Mdvbov56wMQ9NctcwVs=
X-Received: by 2002:a05:6830:aca:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-803fec021afmr5824842a34.3.1789195260056;
        Fri, 11 Sep 2026 23:41:00 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:58 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 01:40:38 -0500
Subject: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1440;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Ql7C35Wo0Afw/TL/lX4BfvZeI5ogoZo8Mi0/Jvy5M00=;
 b=5WZnSsxv7VZ//QziiPqa/hfbDelv6xL9htaBXcHAb3pfvm74cL65FXg1wRmpJjS+un+7XrxzR
 0b1Eg+HGMxLDS2ChLkM0XQoGJWSx9crrUYJwUWFswZOuImDIHOPypUz
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().

Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
FHCTL on for mainpll, mpll and msdcpll, with SSC.

Found by inspection while fixing MT8173. I have no MT6795 hardware, so
this one is untested.

Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..ff01cfefc31f 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -79,7 +79,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = _slope,				\
 			.slope1_value = _slope,				\
 			.sfstrx_en = BIT(2),				\

-- 
2.55.0

