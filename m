Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D23EC687
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883862; cv=none; b=iVuH8JUBsb/zpIOIjP3xbnrfg24ZQsvUuskCDkhbxGWe1SuQMuo2Guzv7JQCDaEM5PJWXdbgQbnl6s93CRfAsmXJbpBbYI836VaARKaDidbUm5scx6VIh+X2C1IvCgOj8Op31IVyMG2nmPAgFwPz6oYClb8VfMr1MshuMNeGPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883862; c=relaxed/simple;
	bh=c/HyNkuMW4z6Zoljb6+iJsr+eONkoiQ7+lwzLTi5cS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT7PNXPtWsGtMrnCay42jFq1CSzchx2l3nJ6Jg/lAH+S6l+FKrgM5buQwdtflpPRzKGFv5sgMDUc2meJB4JhsT0aRPqEIt+R2Ulift1dfET2v/69EPuSktmQm6Jn/j7wAdNjBPthnz2YmuSbezx38axWlpyXF8/EDc1Nl3O6L8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KnpPI6ay; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KnpPI6ay"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f84023916so214180f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883859; x=1785488659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmy1hUJRw3q7Ic7Vi7VoynD2pQqL5T8Kb7uNyjYlj78=;
        b=KnpPI6ayep6sTgfKaukD7VxQ4Nla21VYH8uCz7uebb0QbWpmf0FqyV2l09TZH0EufD
         76Og+0fDWs3tOxpN+quZknMXYnJnseZiQGB/zyTe2MYBuXRWv+KBGHezflrMSby42ixh
         93gYxX8PP2bBBTFv+qPXLo6PCL7CuNVZZO4+ofezFboyPwYITAle89Zz22rH118r8uNe
         /FsQqS0NonR8fI3+jWJQ/V6ONJK3fPRT2Phmfg3SasgPnv+yB1KmvKukpL6tS39mCLDD
         2uN91zDPInYPf7C0GIUDBiB18XgboelhzdB8C6tDtueWeSSGtYvn+BpU7scI6fiu2vdK
         3qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883859; x=1785488659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vmy1hUJRw3q7Ic7Vi7VoynD2pQqL5T8Kb7uNyjYlj78=;
        b=tLOI9FEfP86AgSlAXXfKW9ifUoQIrROm/3Cxzd2FXjUpB3iXNzwp5N9v05kiFWZ2ZE
         cFyqv1L6kKsDlz85jfTim3NuV+i+SQz4wnxFBjfrE96eGz6IDBfWQFrDXK66yrpfEiVw
         7fY0ZmsulokkLAKhHiin0IMy9pDWZwmgKQggRVkkh7Idd+Osrm5jOqMwE+/sEomaJOA6
         fYcr3xm5U6fOPNE97sHOPd4Ix6KTSDEijZipF53Qz2ETGwaov4cIvqtcNHu0d81W1o3l
         HiAorSjB1phcQpt5P93T0xD9TnxB3MrDQoxL2ECsj/UQv9NIoZ1CZQMTcp0W2Ixpjuwn
         F1UA==
X-Forwarded-Encrypted: i=1; AHgh+RqavKFOyGY79xNXuCKyAIR21+rhz0bnrlHnd22+QvetWfhqXGAZhcPm0U88WiGBg3o0TtZVk3XJE3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs2tkvqsTO6+ZrOLFf8ld+fsYXxqYeRnZPx4+yHJ20mxjMHQIg
	b//R7SNYKPdZyUPjy6bN4LTqqWii3NuLQ82wZ70cXg9Ry94oXepjI6BwIOGjW26hEtk=
X-Gm-Gg: AR+sD12raR2FYivTytdueD88OdaQBZGzFtXn1KtC7a3937HzQ6igqfA0hFGWhfXyyMd
	VhffWk8OZASai+s0q6R/2oSLm5bada+CVntA4s6JW5JrrzDhBH2aYYhiAxzJmA0lSpfcIRZAOAC
	o3nE6lNPXJc45vhfIkq+zsBJLyr1uZ8IYe8nZay1j0NWHpKC9QJ57aNyavRe2g8qwVh2xtvxTHG
	x+3VD9W901U9VsDWnx0TUVIRFlQvECTQwC3LxHJpWuvPyQVMFEGZiwDFHh9FR0z4CoCvo3OSLuF
	d5KNlJbmBbpaz21CaxfJ/vEkHHAJ/cvgkQb6wcR0fFy/HxutzCFRhxqKpEK+GrIQzs52GhGMtr2
	k7Vm3Tx09mWuj0h8tqCAxX9++HBjymamIYJqWcw4Yyxw7e3zuS0RJADcqSp83yB904Q3JOclnZ+
	JM
X-Received: by 2002:a05:6000:230e:b0:47f:7b85:b883 with SMTP id ffacd0b85a97d-47f8d761973mr8352142f8f.47.1784883858984;
        Fri, 24 Jul 2026 02:04:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c66cebsm21940318f8f.30.2026.07.24.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:55 +0200
Subject: [PATCH v2 4/7] clk: rockchip: clean-up simple provider misuse of
 the consumer API
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-4-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4291; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=c/HyNkuMW4z6Zoljb6+iJsr+eONkoiQ7+lwzLTi5cS0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqBk+IBpzMF96bigh65kKM8JR3kcYzjychCK
 YLz8MopaNCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqgQAKCRDm/A8cN/La
 hTcYEACzcSp51w21pbh6PuxyNr24pZ3Nv0ktAmcU30YtrNSoWzIKyhG/R/BUjOJjBIIM5fEjFsc
 I9Ff5FAQ47iojQ4xWTuMQEcie071jy0QoM8sZvfgO3exSwBl/WWTEC9l516DlVG6FykYt/yiYG0
 fESTr3eLuPkGhtarCnMF59QHA1lB+1HVNk40mVHJ5dz+EME59MdLhbrnh435AVGYxb21++PrMvf
 fXl8QabMo7nUrBlCln+T+1yUy0aHgunlcb9vIs5Td97hFAR0L2q6tIwjv3K9bYWeYcSYrlSV9Wc
 gt5WNE/fchVqJZI0ZPhOtLKzad6Cu6aXOLhv69hNyKT+9GIwIwyK+4mw+ISAGRd8zb3vPCllp4U
 /pQ4MOOYcf6oi+Fv0/Yn3ZOckXomugCwNDcfDb/TnWO5TiUXdvF4oYQZe0C7lXTJIhFJX1zuX+9
 WoWxbbbYLUVtPOzsJhyfWuvhiMv1GGbXU7b2HIhPdIfKSWDWfQv6VnD2+xoIlyX132umga2yB2Q
 v9w5RJfsUI8Vc6vB8NBLI6MioQO8IyScg1hUX4E1jxa4XOV45O+oij5ex2/lBBPbc9Px4hdWu9j
 28R5oywcHI6hLv1xI5uaq5AXKff7NgVRPDts1XPF9B1jzy6mEX3cCtFYAE7+KpznmpEfEWXEK8b
 5KcVQbKkgbR7zJQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/rockchip/clk-pll.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..89a783204f0e 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -259,13 +259,13 @@ static int rockchip_rk3036_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -319,7 +319,7 @@ static int rockchip_rk3036_pll_init(struct clk_hw *hw)
 
 	rockchip_rk3036_pll_get_params(pll, &cur);
 
-	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
+	pr_debug("%s: pll %s@%lu: Hz\n", __func__, clk_hw_get_name(hw),
 		 drate);
 	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
 		 cur.fbdiv, cur.postdiv1, cur.refdiv, cur.postdiv2,
@@ -336,12 +336,12 @@ static int rockchip_rk3036_pll_init(struct clk_hw *hw)
 
 		if (!parent) {
 			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
+				__func__, clk_hw_get_name(hw));
 			return 0;
 		}
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
+			 __func__, clk_hw_get_name(hw));
 		rockchip_rk3036_pll_set_params(pll, rate);
 	}
 
@@ -743,13 +743,13 @@ static int rockchip_rk3399_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
@@ -803,7 +803,7 @@ static int rockchip_rk3399_pll_init(struct clk_hw *hw)
 
 	rockchip_rk3399_pll_get_params(pll, &cur);
 
-	pr_debug("%s: pll %s@%lu: Hz\n", __func__, __clk_get_name(hw->clk),
+	pr_debug("%s: pll %s@%lu: Hz\n", __func__, clk_hw_get_name(hw),
 		 drate);
 	pr_debug("old - fbdiv: %d, postdiv1: %d, refdiv: %d, postdiv2: %d, dsmpd: %d, frac: %d\n",
 		 cur.fbdiv, cur.postdiv1, cur.refdiv, cur.postdiv2,
@@ -820,12 +820,12 @@ static int rockchip_rk3399_pll_init(struct clk_hw *hw)
 
 		if (!parent) {
 			pr_warn("%s: parent of %s not available\n",
-				__func__, __clk_get_name(hw->clk));
+				__func__, clk_hw_get_name(hw));
 			return 0;
 		}
 
 		pr_debug("%s: pll %s: rate params do not match rate table, adjusting\n",
-			 __func__, __clk_get_name(hw->clk));
+			 __func__, clk_hw_get_name(hw));
 		rockchip_rk3399_pll_set_params(pll, rate);
 	}
 
@@ -992,13 +992,13 @@ static int rockchip_rk3588_pll_set_rate(struct clk_hw *hw, unsigned long drate,
 	const struct rockchip_pll_rate_table *rate;
 
 	pr_debug("%s: changing %s to %lu with a parent rate of %lu\n",
-		 __func__, __clk_get_name(hw->clk), drate, prate);
+		 __func__, clk_hw_get_name(hw), drate, prate);
 
 	/* Get required rate settings from table */
 	rate = rockchip_get_pll_settings(pll, drate);
 	if (!rate) {
 		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, __clk_get_name(hw->clk));
+			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 

-- 
2.47.3

