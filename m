Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4628CF6F
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909819; cv=none; b=GawXOSt2m/osWy55s/H0Q0gENjvzswXjyBsgcTqw81m9tK6vcjhVMKeafxIV0NMMXfru7CDGy6MhCto2FeNTHI2GZyADETixlzle/GwKRUE2z7tbrAdMFGeCLrOj1EskIry3B6mUzBXt0OgJwzEPS/UV4ar9eShB5dqvKOyxCII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909819; c=relaxed/simple;
	bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQVYHQ3DfT9N0zJuKrx6yboRz4Qn1VdBXh0qSb87Ui7gRN9weeGG+rDEhg2OMuwKZOsQi5mFNv+Cvs2SRFmHgQsLPPyYxfm2IqJvV6p2P4NpmUpYhdgau8G3mhx/bFjXi0sp71fHmyGjA6r+aR3Tc69aUEzSCnaTmz9I7fUNtLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUMN4dSQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUMN4dSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
	b=eUMN4dSQ3le9FS/Y+6Y244khcoOhLYX3ErDME7G3+JqrItrM3btxiZa4VxtdirKP6n+uVz
	bKdOfahB50Z39mmUTDcCmij99rrkoz/YQHYs97rsBTh7lYgC0fX7KFzWbQTg/8Dqn5Y990
	K+ndaUng1xI4r+jRbtzKOn34Udo47z8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-EPqm_aTdNwSZRoPOX--cWg-1; Mon, 11 Aug 2025 06:56:56 -0400
X-MC-Unique: EPqm_aTdNwSZRoPOX--cWg-1
X-Mimecast-MFC-AGG-ID: EPqm_aTdNwSZRoPOX--cWg_1754909815
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e82b4ed799so705434085a.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909815; x=1755514615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
        b=xQaS/Jh1KvmLJqIRCxqSUtp8HsAo8n5fwVerme1a0T+dwOmrQCpkzkat9RRP1cOyg+
         xrm9bYCXigevTKQEcnb46D2XcmUlLu5pRWaA+KYhCa6VDujLcl1NeEoKn4dLq6vqwgi3
         ynJXYtAG4kCyQeYYB0aDmFzxjBLl5Lm9uxo6v6+p1kZVmq1hSo4HUn9HsM4vic2gUuUI
         7lisepFHUx8NdMrFENqBCUjKiGQA3ZmMlC0zfH0xTRR7jgoRc0DSe5jbS3bmX+x2nIUs
         u4PBApYnTySSrZjEgAaYmjek1P54xZsAp8E5HoVVomYGRQwDfvxKNNnCFYcJobhmO3h4
         qyEw==
X-Gm-Message-State: AOJu0YyvCQcKYbp+c7SsvE6RzSaJbyjpzOAD6UjnKyWMaYRuj3GQJLGy
	+HjX+IiVkKeXWxa1qS+tjx9hkvQ+zekRkliuJpRGu60ns2EKWAjOWaJuVMpUotp8VMJdeViCNvg
	Pj0WKojSygw3LDTgwXl7IoDb+hbbmFWR4UT8KDEKx22psdqhSF+nu44KYJv9pEQ==
X-Gm-Gg: ASbGncuCLyPiarpi75FDl5HaaklfneWmusL9/qC1mVQJLm0ECRDew988KURsHgxs0X0
	6f4QoThRY6Og1vmu93+uPj1GkBhnlfpy9AEVF5Y1KwELpqUo+1jc/fj09aGGOgLNH/ikEGSWLZ/
	RW0tVk1aGLlf1hMKGAhEPPolVzlhxOZr/O5ZYF9gqedGl41K743q5d30fWTQako7fOaa6DmNqOS
	DyInYF1F4ds1C1oh/uZRdR8NCshDC8r5abqDKS3oizKTfFAcRTgrv6q0vCJbjfIkWzLfQVmo1IV
	BobH+KZDDZHvgfUpq+CKuv/8xdmYO8yqYH8TVmUw/XAaJIZamvdk82k55uhkSj0TQunKmy7f1KL
	ooYE=
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id af79cd13be357-7e854f76862mr91487985a.50.1754909815370;
        Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSii5P15b+af3L4E7F/cQGCM1Xz8KwmyfhCdGkZGKODW+eFh6Bky1dDzTK+GfwnJZiiMZJQQ==
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id af79cd13be357-7e854f76862mr91484185a.50.1754909814934;
        Mon, 11 Aug 2025 03:56:54 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:13 -0400
Subject: [PATCH v2 9/9] drm/sun4i/sun4i_tcon_dclk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-9-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2307;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
 b=j1ZnE8gcsk3YjO3zCEvUNiC5B3rrw/rsR6rCeLo5Q9BxZp8jvK69xEFMszvH1iDCwux2pSDHd
 eRkR0peMpaDCxDNa8Bi3chrL3Nda3ZZTmewCk0Eb5cefUz9pD7/Qw2Q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..4afb12bd5281f0d1720cfe2c8f79b80d97244ef2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64)req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.1

