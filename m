Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5F3358B7
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907050; cv=none; b=SY/KWOTGEmJFd9EeyoYuR/35WC0WlhEb79pLH2FpzqAm+9uw/nLRuUSWyhXkZXWUH37SBUYgeJ4RyrTjqsf14La8QtsauHSbieZlMP88mGNrjRpjtVv/a6CyF20/Vj4EvZE9Qc3zZ4uBo73NjHdL7Sp0FWJFalPJKtMKyrUzhKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907050; c=relaxed/simple;
	bh=3zRP30fGHCdFEy8G2kANYis3hdN+Sxu8ZaRLGWZxIhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXRi4sXqya7wG/moBOR21/LZPbtxu0YaVTTDBxB2E+8vUfE8r106/UmJzGayREMBAt8L390fHF1DSkLJtmdOcT/YTPHDA2TUaF1iqZqGqBk0+jNNjbUlJfxvlerWJT3czwxakRXiIU1gkieMVgbpFYfLBSyCWR3JvX77cw7kBec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVQ38/+6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ckOz3j0Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVQ38/+6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ckOz3j0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=raRHT5WnuULt1ZgYEopiIagMqGInX7Y1nhkVtkDwgRw=;
	b=SVQ38/+65sRBFHI67JVqctYlcR2qzOi9lvtkPY6x+E0lZDQPM6/Fl3oLn1kj9iRDmzeqw+
	Xo/WoAgiybseVhTYkWs0wYhA/dHKzwxi/S/FFhmuL8jaXiQABl9/uiEIcv3qPJfNlRXZ4Y
	o7SuG/6bZoqXcgOsYt7PrxeCx3M8UQA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-c8x8W_wSO02mpNzSh89TQg-1; Thu, 08 Jan 2026 16:17:17 -0500
X-MC-Unique: c8x8W_wSO02mpNzSh89TQg-1
X-Mimecast-MFC-AGG-ID: c8x8W_wSO02mpNzSh89TQg_1767907037
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5636274b2feso679009e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907037; x=1768511837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raRHT5WnuULt1ZgYEopiIagMqGInX7Y1nhkVtkDwgRw=;
        b=ckOz3j0ZXjgqNve3qsE00viyFbaz6WJECLZIrXa2caxLfNedo8QPAMknWfXehN4zA7
         PVil+1VEghj5V6G8fnPWknFMhgQ0y8m2CFV4Dtbr+TPNI9fb58Z+jc0yL1LLjTbPjtSa
         60s1QgGZ9/Egm9cmGwRUDlh/ikwuvsLGmslEqqwKvxpuG0BOKlO0NqEprZTiqdHZ7niC
         z2rL8pgcMSm6Bq0DWNUnY7XwzgmyRvh2audw8vjktJpqevIpFE7GZbsiTuCTQrA6fON4
         kWqS4XiRfc1wrOUbZMfITK+3c294d5XgshC/U3LgdMQ/KQyRxjtDOwqheWqCG/DE/VKL
         K/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907037; x=1768511837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=raRHT5WnuULt1ZgYEopiIagMqGInX7Y1nhkVtkDwgRw=;
        b=FeDWttHkSEKREP+m/Vy6dAe2mBG3qB2toNlpT2rPWUunIlBWzvrIDjNEEKEB+ppYAU
         ftZ8N70FZwfMf0TcCzFncA9gzHPm+Ui3YSZ6k/Mn7wUZy8+mypTFQQAyqGrAZYNMJGaF
         37HsW6pSkEgG2obRupyvhbjLwfa7Xjp0kWioYpVd3XY/8kGcrYdzV/Ej0R+rcdUFdzLv
         ztnzFRrN3wYuDQXZJmWBPePOImOxWaWryFyo6CtdXpoLTLH+zmQUoU6qbRY7Ylpn4dnd
         091qxAZh47Qqc7eQQf1ulBZUoFI5fMfXkqnZ+uk45TWZYoA5pN4mtgSrcyfvt1YeS9gz
         6Xeg==
X-Gm-Message-State: AOJu0YwHpo8mLfisN3dBsFVKOsBaPb3XEfa+HLxbKJf2IsvgIPoWTGYm
	R0Y/SE3F/SVeI7Ddpj2JYPCA632XgDMhzqt+khsCWdr2VjnYfrf9TOnx/1I1KN6SQNRTcrIuxmr
	26qVjtuyzzBeC9xAxvOLxBikC8/TpZj6N7qloZDs2lFhYp8ZItFH4PKKjw5rH9Q==
X-Gm-Gg: AY/fxX5OViMuMAE/FhxcgA1Nt6WCAclIIpft0lVFQLHNjwjPoSYqAuzHfuYDq+b+jA7
	9CgVO5DQPih7unZeqhgAXXwH4KGs2xv7nMboedokqj48rOR7F/OULAUdQtrj0gtQJDtdx9f4iGF
	/O3pqT3uxNSPr/7Nfakm+PJwnywLTrvN0yX1N0PgMiSAsG4d9uPnu9o0aP7ss+CFT29BvsQFb37
	iOSL+o3lEHoobk96KdcHgjhLZjUMdNeYl3BSbHczFpq1yd/FalExBqPnT2iUqZNqA5NOL4xkQTd
	H/GTTdeiJWRaTP2cirSrIqtTrtfeYbyuyjfZBNn+Jf7uYuSbg+Nx6+cpMYsCj2rbMIW7eFmdq4h
	S08VCMyh8TcS7Rxk=
X-Received: by 2002:a05:6102:cc8:b0:5db:e32d:a3f4 with SMTP id ada2fe7eead31-5ecb5cb9399mr3364031137.2.1767907036624;
        Thu, 08 Jan 2026 13:17:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmHji8qpki9wdGlac1NUaaS92iNEPZxoc6SlN6mMqQXlfbPB9E4nsCuXLG4wlMPy3zayxjlw==
X-Received: by 2002:a05:6102:cc8:b0:5db:e32d:a3f4 with SMTP id ada2fe7eead31-5ecb5cb9399mr3364013137.2.1767907036197;
        Thu, 08 Jan 2026 13:17:16 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:15 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:20 -0500
Subject: [PATCH 02/27] clk: sunxi-ng: convert from
 divider_round_rate_parent() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-2-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13075; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3zRP30fGHCdFEy8G2kANYis3hdN+Sxu8ZaRLGWZxIhQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LaunTJPPLi89OIZoffbVshMiGn9+XnXM251xXLJE
 /VCFlHMHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEykp4rhn1KLNevdFQ1ueZsL
 b6V67jtq9CXhQnKU02uegOcyV98ziDEyfJeJYlAK/+86p2D78837fnptT2GXyd0eoCf0K/l90T1
 TPgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate_parent() function is now deprecated, so let's
migrate to divider_determine_rate() instead so that this deprecated API
can be removed. Also go ahead and convert all of the driver from round
rate type to determine rate that accepts a 'struct clk_rate_request' to
simplify the overall driver code.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/clk/sunxi-ng/ccu_div.c  | 25 ++++++++++-----------
 drivers/clk/sunxi-ng/ccu_mp.c   | 26 +++++++++++-----------
 drivers/clk/sunxi-ng/ccu_mult.c | 16 +++++++-------
 drivers/clk/sunxi-ng/ccu_mux.c  | 49 +++++++++++++++++++++++++----------------
 drivers/clk/sunxi-ng/ccu_mux.h  |  8 +++----
 drivers/clk/sunxi-ng/ccu_nkm.c  | 25 +++++++++++----------
 6 files changed, 79 insertions(+), 70 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 916d6da6d8a3b29240e086eaebbbc620346eef91..62d680ccb524b39d54f0e908c79736f0619f1b4b 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -10,26 +10,25 @@
 #include "ccu_gate.h"
 #include "ccu_div.h"
 
-static unsigned long ccu_div_round_rate(struct ccu_mux_internal *mux,
-					struct clk_hw *parent,
-					unsigned long *parent_rate,
-					unsigned long rate,
-					void *data)
+static int ccu_div_determine_rate_helper(struct ccu_mux_internal *mux,
+					 struct clk_rate_request *req,
+					 void *data)
 {
 	struct ccu_div *cd = data;
+	int ret;
 
 	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= cd->fixed_post_div;
+		req->rate *= cd->fixed_post_div;
 
-	rate = divider_round_rate_parent(&cd->common.hw, parent,
-					 rate, parent_rate,
-					 cd->div.table, cd->div.width,
-					 cd->div.flags);
+	ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
+				     cd->div.width, cd->div.flags);
+	if (ret)
+		return ret;
 
 	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate /= cd->fixed_post_div;
+		req->rate /= cd->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static void ccu_div_disable(struct clk_hw *hw)
@@ -82,7 +81,7 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 	struct ccu_div *cd = hw_to_ccu_div(hw);
 
 	return ccu_mux_helper_determine_rate(&cd->common, &cd->mux,
-					     req, ccu_div_round_rate, cd);
+					     req, ccu_div_determine_rate_helper, cd);
 }
 
 static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index 4221b1888b38da22c16c90796abe6ffab9dc6291..7cdb0eedc69b53aacc8bfb54e309f2013821377b 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -103,11 +103,9 @@ static unsigned long ccu_mp_find_best_with_parent_adj(struct clk_hw *hw,
 	return best_rate;
 }
 
-static unsigned long ccu_mp_round_rate(struct ccu_mux_internal *mux,
-				       struct clk_hw *hw,
-				       unsigned long *parent_rate,
-				       unsigned long rate,
-				       void *data)
+static int ccu_mp_determine_rate_helper(struct ccu_mux_internal *mux,
+					struct clk_rate_request *req,
+					void *data)
 {
 	struct ccu_mp *cmp = data;
 	unsigned int max_m, max_p;
@@ -115,7 +113,7 @@ static unsigned long ccu_mp_round_rate(struct ccu_mux_internal *mux,
 	bool shift = true;
 
 	if (cmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= cmp->fixed_post_div;
+		req->rate *= cmp->fixed_post_div;
 
 	if (cmp->common.features & CCU_FEATURE_DUAL_DIV)
 		shift = false;
@@ -127,17 +125,19 @@ static unsigned long ccu_mp_round_rate(struct ccu_mux_internal *mux,
 		max_p = cmp->p.max ?: 1 << cmp->p.width;
 
 	if (!clk_hw_can_set_rate_parent(&cmp->common.hw)) {
-		rate = ccu_mp_find_best(*parent_rate, rate, max_m, max_p, shift,
-					&m, &p);
+		req->rate = ccu_mp_find_best(req->best_parent_rate, req->rate,
+					     max_m, max_p, shift, &m, &p);
 	} else {
-		rate = ccu_mp_find_best_with_parent_adj(hw, parent_rate, rate,
-							max_m, max_p, shift);
+		req->rate = ccu_mp_find_best_with_parent_adj(req->best_parent_hw,
+							     &req->best_parent_rate,
+							     req->rate, max_m, max_p,
+							     shift);
 	}
 
 	if (cmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate /= cmp->fixed_post_div;
+		req->rate /= cmp->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static void ccu_mp_disable(struct clk_hw *hw)
@@ -201,7 +201,7 @@ static int ccu_mp_determine_rate(struct clk_hw *hw,
 	struct ccu_mp *cmp = hw_to_ccu_mp(hw);
 
 	return ccu_mux_helper_determine_rate(&cmp->common, &cmp->mux,
-					     req, ccu_mp_round_rate, cmp);
+					     req, ccu_mp_determine_rate_helper, cmp);
 }
 
 static int ccu_mp_set_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/sunxi-ng/ccu_mult.c b/drivers/clk/sunxi-ng/ccu_mult.c
index 8d5720f3dec1d4eb34bf22166277fdf5a270da42..3fc81e7de6e93d3b8efa1debe08566860617c166 100644
--- a/drivers/clk/sunxi-ng/ccu_mult.c
+++ b/drivers/clk/sunxi-ng/ccu_mult.c
@@ -29,11 +29,9 @@ static void ccu_mult_find_best(unsigned long parent, unsigned long rate,
 	mult->mult = _mult;
 }
 
-static unsigned long ccu_mult_round_rate(struct ccu_mux_internal *mux,
-					 struct clk_hw *parent,
-					 unsigned long *parent_rate,
-					 unsigned long rate,
-					 void *data)
+static int ccu_mult_determine_rate_helper(struct ccu_mux_internal *mux,
+					  struct clk_rate_request *req,
+					  void *data)
 {
 	struct ccu_mult *cm = data;
 	struct _ccu_mult _cm;
@@ -45,9 +43,11 @@ static unsigned long ccu_mult_round_rate(struct ccu_mux_internal *mux,
 	else
 		_cm.max = (1 << cm->mult.width) + cm->mult.offset - 1;
 
-	ccu_mult_find_best(*parent_rate, rate, &_cm);
+	ccu_mult_find_best(req->best_parent_rate, req->rate, &_cm);
 
-	return *parent_rate * _cm.mult;
+	req->rate = req->best_parent_rate * _cm.mult;
+
+	return 0;
 }
 
 static void ccu_mult_disable(struct clk_hw *hw)
@@ -97,7 +97,7 @@ static int ccu_mult_determine_rate(struct clk_hw *hw,
 	struct ccu_mult *cm = hw_to_ccu_mult(hw);
 
 	return ccu_mux_helper_determine_rate(&cm->common, &cm->mux,
-					     req, ccu_mult_round_rate, cm);
+					     req, ccu_mult_determine_rate_helper, cm);
 }
 
 static int ccu_mult_set_rate(struct clk_hw *hw, unsigned long rate,
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 74f9e98a5d355d6a26b1655c25e9e48da1f6f10d..766f27cff748edca73ccee610ce1e814600e6404 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -79,41 +79,46 @@ static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,
-				  unsigned long (*round)(struct ccu_mux_internal *,
-							 struct clk_hw *,
-							 unsigned long *,
-							 unsigned long,
-							 void *),
+				  int (*round)(struct ccu_mux_internal *,
+					       struct clk_rate_request *,
+					       void *),
 				  void *data)
 {
 	unsigned long best_parent_rate = 0, best_rate = 0;
 	struct clk_hw *best_parent, *hw = &common->hw;
 	unsigned int i;
+	int ret;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
-		unsigned long adj_parent_rate;
+		struct clk_rate_request adj_req = *req;
 
 		best_parent = clk_hw_get_parent(hw);
 		best_parent_rate = clk_hw_get_rate(best_parent);
-		adj_parent_rate = ccu_mux_helper_apply_prediv(common, cm, -1,
-							      best_parent_rate);
 
-		best_rate = round(cm, best_parent, &adj_parent_rate,
-				  req->rate, data);
+		adj_req.best_parent_hw = best_parent;
+		adj_req.best_parent_rate = ccu_mux_helper_apply_prediv(common, cm, -1,
+								       best_parent_rate);
+
+		ret = round(cm, &adj_req, data);
+		if (ret)
+			return ret;
+
+		best_rate = adj_req.rate;
 
 		/*
-		 * adj_parent_rate might have been modified by our clock.
+		 * best_parent_rate might have been modified by our clock.
 		 * Unapply the pre-divider if there's one, and give
 		 * the actual frequency the parent needs to run at.
 		 */
 		best_parent_rate = ccu_mux_helper_unapply_prediv(common, cm, -1,
-								 adj_parent_rate);
+								 adj_req.best_parent_rate);
 
 		goto out;
 	}
 
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
-		unsigned long tmp_rate, parent_rate;
+		struct clk_rate_request tmp_req = *req;
+		unsigned long parent_rate;
 		struct clk_hw *parent;
 
 		parent = clk_hw_get_parent_by_index(hw, i);
@@ -123,7 +128,12 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 		parent_rate = ccu_mux_helper_apply_prediv(common, cm, i,
 							  clk_hw_get_rate(parent));
 
-		tmp_rate = round(cm, parent, &parent_rate, req->rate, data);
+		tmp_req.best_parent_hw = parent;
+		tmp_req.best_parent_rate = parent_rate;
+
+		ret = round(cm, &tmp_req, data);
+		if (ret)
+			continue;
 
 		/*
 		 * parent_rate might have been modified by our clock.
@@ -131,16 +141,17 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 		 * the actual frequency the parent needs to run at.
 		 */
 		parent_rate = ccu_mux_helper_unapply_prediv(common, cm, i,
-							    parent_rate);
-		if (tmp_rate == req->rate) {
+							    tmp_req.best_parent_rate);
+
+		if (tmp_req.rate == req->rate) {
 			best_parent = parent;
 			best_parent_rate = parent_rate;
-			best_rate = tmp_rate;
+			best_rate = tmp_req.rate;
 			goto out;
 		}
 
-		if (ccu_is_better_rate(common, req->rate, tmp_rate, best_rate)) {
-			best_rate = tmp_rate;
+		if (ccu_is_better_rate(common, req->rate, tmp_req.rate, best_rate)) {
+			best_rate = tmp_req.rate;
 			best_parent_rate = parent_rate;
 			best_parent = parent;
 		}
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index eb1172ebbd94b5e3515f618390a4753c7eb5be4d..c94a4bde5d01604ac2b317babd4368151d0d08ab 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -137,11 +137,9 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,
-				  unsigned long (*round)(struct ccu_mux_internal *,
-							 struct clk_hw *,
-							 unsigned long *,
-							 unsigned long,
-							 void *),
+				  int (*round)(struct ccu_mux_internal *,
+					       struct clk_rate_request *,
+					       void *),
 				  void *data);
 u8 ccu_mux_helper_get_parent(struct ccu_common *common,
 			     struct ccu_mux_internal *cm);
diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 784eec9ac9979b22e8f384e0abbb5c1a381ae953..401fbb752479b787092c53dfd870692e9eb70dba 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -162,11 +162,9 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
-					struct clk_hw *parent_hw,
-					unsigned long *parent_rate,
-					unsigned long rate,
-					void *data)
+static int ccu_nkm_determine_rate_helper(struct ccu_mux_internal *mux,
+					 struct clk_rate_request *req,
+					 void *data)
 {
 	struct ccu_nkm *nkm = data;
 	struct _ccu_nkm _nkm;
@@ -179,18 +177,21 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 	_nkm.max_m = nkm->m.max ?: 1 << nkm->m.width;
 
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nkm->fixed_post_div;
+		req->rate *= nkm->fixed_post_div;
 
 	if (!clk_hw_can_set_rate_parent(&nkm->common.hw))
-		rate = ccu_nkm_find_best(*parent_rate, rate, &_nkm, &nkm->common);
+		req->rate = ccu_nkm_find_best(req->best_parent_rate, req->rate,
+					      &_nkm, &nkm->common);
 	else
-		rate = ccu_nkm_find_best_with_parent_adj(&nkm->common, parent_hw, parent_rate, rate,
-							 &_nkm);
+		req->rate = ccu_nkm_find_best_with_parent_adj(&nkm->common,
+							      req->best_parent_hw,
+							      &req->best_parent_rate,
+							      req->rate, &_nkm);
 
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate /= nkm->fixed_post_div;
+		req->rate /= nkm->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nkm_determine_rate(struct clk_hw *hw,
@@ -199,7 +200,7 @@ static int ccu_nkm_determine_rate(struct clk_hw *hw,
 	struct ccu_nkm *nkm = hw_to_ccu_nkm(hw);
 
 	return ccu_mux_helper_determine_rate(&nkm->common, &nkm->mux,
-					     req, ccu_nkm_round_rate, nkm);
+					     req, ccu_nkm_determine_rate_helper, nkm);
 }
 
 static int ccu_nkm_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

