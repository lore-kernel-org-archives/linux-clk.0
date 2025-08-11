Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC962DE6EA
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916533; cv=none; b=jpKEVvQECTh+IkGxYJ7HSGQREhhQqYKy9xl1XRi698C6aHl85ZzQ19HGHiYLxvy/RV+oUrlePzIXve2d/IAl0o/7jXEZAvUPFyCAeNxrjUFyVmXlxwCvQmwdPSLLDTwa4d9vMlPF4yiTnFixjuziiwTKkDHxWlxAvhrqxNxyFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916533; c=relaxed/simple;
	bh=35dv85IMLqZUQXMLmdKz9Cv7IO7JQIrFzXOoEzRX50w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJpSpjyj2k9xtFSFlFIXbw0MEm+FjlQeWk7kjo/tALpnPBEYtHpRT/peerzdoeQr2TVFZSfz+nDru/FN4gBpGTjiBbO6KL/5kLZ4sPhU1w2y7y5Rl4ss+/0jASsiru/WV+27Ovq1xmoDvluXHiOsCweOGWiO/o1N24k7Lt5IE9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ERqRWZ1J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ERqRWZ1J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtyPh5Rep6ndb1ie2bs8QMsXOPj7v24ITj6+XUeoPUQ=;
	b=ERqRWZ1JRftZqxILYSSdVFrtPeE2XqMeQEL/zbTO+V3Gq68LKTrPkfn4xFG3F0H+mFQt8M
	Z8CyQSczqL8h5oYuWatgNBqMj95MI4BxLXe2OvTaurWRmbhuLgORGwLO0WFI/aZfGo/jxY
	CwqtnEeYpoW72bte3MtiRzc4ZVIUO3M=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-iAkILhrcMz6mKbdKiD2rtw-1; Mon, 11 Aug 2025 08:48:50 -0400
X-MC-Unique: iAkILhrcMz6mKbdKiD2rtw-1
X-Mimecast-MFC-AGG-ID: iAkILhrcMz6mKbdKiD2rtw_1754916530
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b06908ccacso103538071cf.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 05:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916530; x=1755521330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtyPh5Rep6ndb1ie2bs8QMsXOPj7v24ITj6+XUeoPUQ=;
        b=OBedEatcl+UgRrEg/6goN12K7GBEGaP3VUR74Vfu9rLtG0TUSrc8ZeNeBUcONPiX3t
         Md3LLK9FJWr2UHyhS+Y6qEa4QfoDS1B8zHar0ZIFfo+WJ9GQxY3FkjY1J3iaPtNvz8N1
         cu2a21WraL6kwmEOr43DirBUxO+zxQ671uQbxGgITkO8y3kQn26loh0MWm2jngXpXa5k
         urer9OMfYJ3PWM9m9JGK5m71VuSE30UjZ8w+N0olD+5xzeLMqpu1fT3CqvEUjH/3XHWo
         RbLdu40dGgm5DHa+bzUXNV9AFLAqB2Bk75y8LHx99a98uJYO4VXYqO/bbTHMC60vv4SZ
         4kTA==
X-Forwarded-Encrypted: i=1; AJvYcCXa4niQCOM9+aKORwG7pO+yYM3JIWr23ym1cvFJHOWEKOTC7U9BPp7KAmxGuPV3O9KHqxoMn35+cPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZLXoZ85acRmmFwAjkCinbRHXJsc/zVVckTn/A62iBB4L0XAe
	lidHf/U3vb4Rk13tdMlDRe99dvi2BeGNKCw8bi+XMSQ0/B0g08od8kUE5ucCW7pTzonfrgqLaPl
	o4J7IuM+8xzBDAOs3luQ3mXb/L2aRJW7DrfyFWn41BHh/QbouXSaad99OJw8FzA==
X-Gm-Gg: ASbGnctOtVIQXSeJlEgnAWXsrptyJJ1hIYaIoSHa4xUrME7ViC+RmkPRtQj9l3fPipN
	dTHp42fH85H3Be4RyVS1R5aBi2bk5PXmy5IJbevMCVYBmkYJ5Fnk/wqN96tc7KGVRAQuQVZeBCS
	CHrwEynRknhSp0Wr7YFqi72xG1zCIqns23DKnaxKiybK5pZbjIKD8DlqRtsHopzijblNfeFXNuY
	AWzKvwy+QH7lWx7BMdFQVmiwbLD436MoiH7n1iq8BGJebHybNwZxr3Zaq3gF5JHUIWHIABU+ax2
	G6sYuyBJf1pquwP+0MpJfS7EQMWAY5H7572BskttKwL9/V+Kb/L6blZFDGWMf6mv1Fjwg29Xm+5
	ob3I=
X-Received: by 2002:ac8:5acd:0:b0:4b0:38b2:3808 with SMTP id d75a77b69052e-4b0aedfe2fdmr162632951cf.43.1754916529283;
        Mon, 11 Aug 2025 05:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOFYaboytdNKOBRzhLoN9MZffA8UmKe9qe34eqfRP8OtsDONwuXkIVTkk9L+30HMgM/cyS1Q==
X-Received: by 2002:ac8:5acd:0:b0:4b0:38b2:3808 with SMTP id d75a77b69052e-4b0aedfe2fdmr162632611cf.43.1754916528836;
        Mon, 11 Aug 2025 05:48:48 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:12 -0400
Subject: [PATCH 7/7] clk: ti: fapll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-7-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=3724;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=35dv85IMLqZUQXMLmdKz9Cv7IO7JQIrFzXOoEzRX50w=;
 b=N25Ia/p/HvCELWsArvVY0UtQVgJ3XAaJSxes8tGYmI13Fnbu/6iFvl8iKyxqGdFoqRprtooUL
 btcrwmBZrFsDgLojbWvoFnBiuu79baJzYrO8uPhWQ0uNx1ED+hva180
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/fapll.c | 48 +++++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index 2db3fc4a443e052722d5c01e5ef38cc1417d818f..4f28138d2d8abfa63e13c23d6a7326f3a2cdbf86 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -214,24 +214,27 @@ static int ti_fapll_set_div_mult(unsigned long rate,
 	return 0;
 }
 
-static long ti_fapll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int ti_fapll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
 	u32 pre_div_p, mult_n;
 	int error;
 
-	if (!rate)
+	if (!req->rate)
 		return -EINVAL;
 
-	error = ti_fapll_set_div_mult(rate, *parent_rate,
+	error = ti_fapll_set_div_mult(req->rate, req->best_parent_rate,
 				      &pre_div_p, &mult_n);
-	if (error)
-		return error;
+	if (error) {
+		req->rate = error;
 
-	rate = *parent_rate / pre_div_p;
-	rate *= mult_n;
+		return 0;
+	}
 
-	return rate;
+	req->rate = req->best_parent_rate / pre_div_p;
+	req->rate *= mult_n;
+
+	return 0;
 }
 
 static int ti_fapll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -268,7 +271,7 @@ static const struct clk_ops ti_fapll_ops = {
 	.is_enabled = ti_fapll_is_enabled,
 	.recalc_rate = ti_fapll_recalc_rate,
 	.get_parent = ti_fapll_get_parent,
-	.round_rate = ti_fapll_round_rate,
+	.determine_rate = ti_fapll_determine_rate,
 	.set_rate = ti_fapll_set_rate,
 };
 
@@ -399,14 +402,14 @@ static u32 ti_fapll_synth_set_frac_rate(struct fapll_synth *synth,
 	return post_div_m;
 }
 
-static long ti_fapll_synth_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int ti_fapll_synth_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct fapll_synth *synth = to_synth(hw);
 	struct fapll_data *fd = synth->fd;
 	unsigned long r;
 
-	if (ti_fapll_clock_is_bypass(fd) || !synth->div || !rate)
+	if (ti_fapll_clock_is_bypass(fd) || !synth->div || !req->rate)
 		return -EINVAL;
 
 	/* Only post divider m available with no fractional divider? */
@@ -414,23 +417,26 @@ static long ti_fapll_synth_round_rate(struct clk_hw *hw, unsigned long rate,
 		unsigned long frac_rate;
 		u32 synth_post_div_m;
 
-		frac_rate = ti_fapll_synth_get_frac_rate(hw, *parent_rate);
-		synth_post_div_m = DIV_ROUND_UP(frac_rate, rate);
+		frac_rate = ti_fapll_synth_get_frac_rate(hw,
+							 req->best_parent_rate);
+		synth_post_div_m = DIV_ROUND_UP(frac_rate, req->rate);
 		r = DIV_ROUND_UP(frac_rate, synth_post_div_m);
 		goto out;
 	}
 
-	r = *parent_rate * SYNTH_PHASE_K;
-	if (rate > r)
+	r = req->best_parent_rate * SYNTH_PHASE_K;
+	if (req->rate > r)
 		goto out;
 
 	r = DIV_ROUND_UP_ULL(r, SYNTH_MAX_INT_DIV * SYNTH_MAX_DIV_M);
-	if (rate < r)
+	if (req->rate < r)
 		goto out;
 
-	r = rate;
+	r = req->rate;
 out:
-	return r;
+	req->rate = r;
+
+	return 0;
 }
 
 static int ti_fapll_synth_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -477,7 +483,7 @@ static const struct clk_ops ti_fapll_synt_ops = {
 	.disable = ti_fapll_synth_disable,
 	.is_enabled = ti_fapll_synth_is_enabled,
 	.recalc_rate = ti_fapll_synth_recalc_rate,
-	.round_rate = ti_fapll_synth_round_rate,
+	.determine_rate = ti_fapll_synth_determine_rate,
 	.set_rate = ti_fapll_synth_set_rate,
 };
 

-- 
2.50.1

