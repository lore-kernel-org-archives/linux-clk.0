Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370C41CB5F
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766703; cv=none; b=VrSIwQOkYBmXAV7Mwrr/215Bm8yrMRVUfAUwqBLJWXXwKyCr8X9wrSf3XTbHhHkWlmKXAA9RMJfQSBDPPE0jcd0gfxPIeqUOkpZLWG6Atd/XY58kXhu4u78IuT9GujrTQny2FGiLqqC++6Nffrzkg3yYjPZ1hdFPUNI8ZT1tOt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766703; c=relaxed/simple;
	bh=7Rica5RmypV66knB6rG/hTQtNi7fIHz5aUFNX0twg9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCOHsxWulk2PKSM0+deEygzaQxJWUMq6tG54YiHkv+NeykOg8g5pWK6cE2XTwAr+ly3RSqdu+I+uUT/Wi5+0Yps7n/pWrAdwWbY/c8u3EWJmq6v6GEe/Al6omRvr/9fGws4DDgQbtXTVx6hAjjTobbranxymIZBukcWGLskB8yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va9cee8n; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va9cee8n"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2285951a91.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766701; x=1786371501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtdT0P59ZGr7qTzol1F8y7zPoONH1lkMlm/Fi5J6b9s=;
        b=Va9cee8nP1DA+GN0G5QuB0DKK+nnbFlRgU1qhxCY3j/MW+eKm42S2mnzb5SilQUyXp
         Fre+9j530CqYHum4MoRuluGoxuXkfqPxaSdvTN5d/CdAXJsODfQwa0ZmC8v34PXKpx9Q
         8i9zb7bET6ZpZLcwxavcY8SwLAwYn7bZOGQd4/LpJ06MvRr5KVMiwif40QWITtB3h72n
         xUeDqZmwdkat36akvzPwO606H8mmVvgHAHxFxdGyxvNLgENPy0vq9t5L3xgnPL9pLXy5
         ZqdKZMPijkmtEd2B58Wh5HCZNRBMvbK4BwwkATEPwDKXRFwsU9gBSjIEKyshaGu/+HxP
         srkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766701; x=1786371501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtdT0P59ZGr7qTzol1F8y7zPoONH1lkMlm/Fi5J6b9s=;
        b=l8DpMxeVN/irb6dWqRvth/mnoaiujTViVBC+wFdWa4Da2XY3Gvm5ib4zugJOLuBv26
         sr5dN5gpz5joq6UT5nYBkfO0oWO6wbegA/AmbLIwtIiLmt1Ss/gW+qWWuk8XvhhizNk+
         jxD74GBOf2orqv73PelCIAWzbM5g4HYE0uRQrYovHpbZzC5rKSmrOc0O012P9+lpFEVZ
         jCa8Vfg53uFPqUOedWCfX9VVAxm7aKte4/vb+Hb+pJNdFdbnbPhGlLNlxC5wwInG9lwi
         N4TrXaE5/L0yBRE0NFny6CreG80IblSarWU/zW1IFaVlMnuq5pXrCeCX1wGwNp4onJU7
         koOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZ0jcW2jhbcBR2twoZmdmXgFB18leKPasUZHtTllXP+qNhwr/uMENCyWfa/HBgyL6hWZrlTzmQZrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8RBwL7hEz2E8q6k/DaV504TRHN9TKObwyTMb/OdorqoSrq/OY
	65/S3vClJKwkgBk2KHk0oyByFlGJrKUWMz+xYXERfrGZKIaO5KyBoh4W
X-Gm-Gg: AR+sD12DaLT9sp0o3gEraVdIVW/o+p6RAIEPnwIAXaDkoflhR/EQ94xCLSXdygsNenG
	MSPKyhiL6K80eUPPMyVAECgkI7wovrhRSeE8qaA1ZacRSGUmuzWZ7b5CbvZaNAWkn4OEQnHTlfo
	HwKsbkUoIaVlaDDskKaIFlgmy3knq4ZdJiOmOhEgjPUPO1rGYZYx/aGAluEDkATre2DdaEnlo5T
	g6J3JWpffNo76Qk/DofG3IRZYGhHtS+JQJ2iQxh92l0u1sjtQf1/b2u4rZkD5Y68JnYri1ZhjeC
	0G3d3UFiqz4DUFOx8v8laFzSZ9hrfLLhsIC/J5sKusCHKfRCKBL8VkTsT2MxyNjhmRLGUrW7Ssx
	ai/R4PIdb7kASK8Upz0IfJBk5TCFKc40ai/5qxP6wZWzI/zT5+bdGnMkO0bCrIJLtXNteDOFvHj
	ojeQBCBHL1vOaiX7x08lIqp9hwR4Iiv1Bn+4SsOOuZCnmoRFBabq5kzBVacOMzbSIa6C5qDD5it
	KYSqvSzwL1OFNQDDN38
X-Received: by 2002:a17:90b:55c8:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38fbc441942mr9078794a91.11.1785766701390;
        Mon, 03 Aug 2026 07:18:21 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:21 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 12/32] clk: mediatek: Add pllfh support to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:39 +0900
Message-ID: <20260803141659.559129-13-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to
support pll freqhoppings.
This reduces boilerplate code in apmixedsys drivers with pllfh support.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 44 ++++++++++++++++++++++++++++++----
 drivers/clk/mediatek/clk-mtk.h |  6 +++++
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 71d70b5a9990..e80ae497fadd 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -23,6 +23,10 @@
 #include "clk-cpumux.h"
 #include "clk-pll.h"
 
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+#include "clk-fhctl.h"
+#endif
+
 const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
 EXPORT_SYMBOL_GPL(cg_regs_dummy);
 
@@ -525,8 +529,19 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	}
 
 	if (mcd->plls) {
-		r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
+		if (mcd->fhctl_node) {
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+			fhctl_parse_dt(mcd->fhctl_node, mcd->pllfhs,
+				       mcd->num_pllfhs);
+			r = mtk_clk_register_pllfhs(&pdev->dev, mcd->plls,
+						    mcd->num_plls, mcd->pllfhs,
+						    mcd->num_pllfhs, clk_data);
+#endif
+		} else {
+			r = mtk_clk_register_plls(&pdev->dev, mcd->plls,
 					  mcd->num_plls, clk_data);
+		}
+
 		if (r)
 			goto free_data;
 	}
@@ -646,8 +661,17 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
 unregister_plls:
-	if (mcd->plls)
-		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
+	if (mcd->plls) {
+		if (mcd->fhctl_node)
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+			mtk_clk_unregister_pllfhs(mcd->plls, mcd->num_plls,
+						  mcd->pllfhs, mcd->num_pllfhs,
+						  clk_data);
+#endif
+		else
+			mtk_clk_unregister_plls(mcd->plls, mcd->num_plls,
+						clk_data);
+	}
 free_data:
 	mtk_free_clk_data(clk_data);
 free_base:
@@ -686,8 +710,18 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	if (mcd->fixed_clks)
 		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
 					      mcd->num_fixed_clks, clk_data);
-	if (mcd->plls)
-		mtk_clk_unregister_plls(mcd->plls, mcd->num_plls, clk_data);
+	if (mcd->plls) {
+		if (mcd->fhctl_node)
+#if IS_ENABLED(CONFIG_COMMON_CLK_MEDIATEK_FHCTL)
+			mtk_clk_unregister_pllfhs(mcd->plls, mcd->num_plls,
+						  mcd->pllfhs, mcd->num_pllfhs,
+						  clk_data);
+#endif
+		else
+			mtk_clk_unregister_plls(mcd->plls, mcd->num_plls,
+						clk_data);
+	}
+
 	mtk_free_clk_data(clk_data);
 }
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 11939e3e0b38..4e959ec68da0 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -15,6 +15,8 @@
 
 #include "reset.h"
 
+#include "clk-fhctl.h"
+
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
@@ -266,6 +268,10 @@ struct mtk_clk_desc {
 
 	bool need_runtime_pm;
 	bool populate_children;
+
+	const u8 *fhctl_node;
+	struct mtk_pllfh_data *pllfhs;
+	size_t num_pllfhs;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.55.0

