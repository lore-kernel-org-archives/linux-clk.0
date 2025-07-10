Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91682F0C6D
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752168570; cv=none; b=AUlCvHay/ec8GfSkb3GA6g4Mw/B/mUAM+qCCtqRqKMapUW6LIFJbanI/ElHDkpEIXCXdYNW/Y2alo4Pb/Q0y3B6zYi79VNVpnkzSHhHrxPS3Jd5XkLtolc5L+/FR/FpoLw5FEpu2/JJLWKB8/OLktOmH+6pnQjoYHIWpCwxst1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752168570; c=relaxed/simple;
	bh=s/YLCQ1WUEbx5Thdmzoo2iTqS2C5GRU1mwSfI+X8dg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gk6LywY+agrPYSiXqeb/r0NWReLes1uph4ZARLVusWw9YQl7+qSOnclHCAZr1ZHkW3r3FsvV1x8wutM0d07X1iQT+wc/IqQAFlRj/NAaEASuueU7UKkh5N9TacwhJbjWLh8HZT1EPnzmrgC4/lWhFQ9NAqmaot+J1Tu7ZyUejqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fY5woHTw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fY5woHTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752168567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJJoL6RwVnNEdMkOi7cFEyIcZlkLWhCSUNH3ofBCzxM=;
	b=fY5woHTwn9xGWSf9soCK4nROdAuL49VTarKBXdyiVclFj/67qWGXgkM6UDedCMzdTcwfNJ
	tDhrn/gvuxFI3eJXnKM34yiS9PFPsJ3oN4n0aDNlZy+51mOnTxbXPaXR14HmIZOXs1+J/I
	WJlLdc8WJZOKIokFffCW+KiXl4AWmf4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-npPZAS-rObi6BJ61Jr2_1A-1; Thu, 10 Jul 2025 13:29:26 -0400
X-MC-Unique: npPZAS-rObi6BJ61Jr2_1A-1
X-Mimecast-MFC-AGG-ID: npPZAS-rObi6BJ61Jr2_1A_1752168566
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0aa9cdecdso99899285a.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 10:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752168566; x=1752773366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJJoL6RwVnNEdMkOi7cFEyIcZlkLWhCSUNH3ofBCzxM=;
        b=qeD8sIaHPeMbNmz7yRch1Mm/FHPxbnAoqwrwr31THg8JhhgZQvT5touVPINHh4dzNC
         +d5yx27e7xnpl2EUuq75HsgP3CGzEC/pdug65zGi/KwSDoiVNZdmcWMZoWNxSrYdK0Sj
         n59HuHYVhBtjvBdsafSq1fEda8+UnDmafOV0vnxKtUSPIz3kfyLb0Edy/+SO8chNZ3x2
         mJ5j6xo82xUtugqj+2Vq6AcanHywBzMxPb2ObdFq4Sjltp6ZLGp1EidGSyBn0Ie5mlhC
         9sUjwAuCiHwVG/6KlOBygsLe6qG87pO7f8XkP7WnYdgnNq5RcVFRjML+kqRl8DPJhSBD
         SwgQ==
X-Gm-Message-State: AOJu0YwefzhRS6il0Y0BDsIsjkHY0wDdjrc9IJQYdljnWwDVeOH/i9ym
	HFBvQAY+n8/8zg+K3HHAd6zQm7fHcS6NID3S7zYreaIvs55SmsZD+dhW73iJSlV2jcrx76ckA1S
	u3L79ot8vLLhWwsOBUx46aiTVjtjhdj/dU2x1RoeGXDwxbuoBx1YOu0NVE/0nOA==
X-Gm-Gg: ASbGncvO9lkY/wpbF5LPaevk6MFPTyw9iBO+2FLmHO4oLwn29Zbpfmq27kMa7mDxo9Q
	TvHWwre2qq6lxmLY53NpqmkmyWrZ9KHiiq8YutivF7XeQ4rBNhDayQXr+uO4lvbia7GAI0lgeoC
	w1gJTAIzyfnkEmVX91vZArQql2Im62RxVp09caexZgtAtnPyWFOKRrvi3TeZG0K2WlDOUiTPbk7
	PjLO29S0wyUWJif/2DLt2BRFTfXYnZgkoDTKBo6fO3bLr6xtNhqf02QjIwTxwgRFMafmR3abyhO
	o+3gtGqPm78BYK/EzHV/ticVEY7HvHs4h8MC2dE8cHeS+EProtLZvfZfundY
X-Received: by 2002:a05:620a:4693:b0:7d3:e868:a684 with SMTP id af79cd13be357-7dded9b3872mr49279585a.51.1752168565702;
        Thu, 10 Jul 2025 10:29:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeLVBCJNiWv+TdOJcgy92F+69qivtBOqriK/xEcr1evzJvT9MG2tlvBsnp0sn9c6T6loa7hA==
X-Received: by 2002:a05:620a:4693:b0:7d3:e868:a684 with SMTP id af79cd13be357-7dded9b3872mr49274985a.51.1752168565203;
        Thu, 10 Jul 2025 10:29:25 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde806297sm117728785a.82.2025.07.10.10.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:29:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:29:06 -0400
Subject: [PATCH 1/4] media: i2c: ds90ub953: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-media-clk-round-rate-v1-1-a9617b061741@redhat.com>
References: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
In-Reply-To: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752168561; l=1664;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=s/YLCQ1WUEbx5Thdmzoo2iTqS2C5GRU1mwSfI+X8dg4=;
 b=fq4IRV0vtqM0WqOsbV0TTA76SiWVK2ZbdskNBvTGPcs4JTYKRTfd+aNbbcqYe33BjMWFMBARf
 GRslIK3PdOvBk08jvg6Eho4UKQnjOca2mXtgya5BY8d+NAD3UwB3u0s
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/i2c/ds90ub953.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a865bfc895006464da0a0bedc90b1c26c4ec8d49..f57130bc6ba274ae8c7f69320791a52a8aaf0404 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1023,15 +1023,17 @@ static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ub953_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int ub953_clkout_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
 	struct ub953_clkout_data clkout_data;
 
-	ub953_calc_clkout_params(priv, rate, &clkout_data);
+	ub953_calc_clkout_params(priv, req->rate, &clkout_data);
+
+	req->rate = clkout_data.rate;
 
-	return clkout_data.rate;
+	return 0;
 }
 
 static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1050,7 +1052,7 @@ static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops ub953_clkout_ops = {
 	.recalc_rate	= ub953_clkout_recalc_rate,
-	.round_rate	= ub953_clkout_round_rate,
+	.determine_rate = ub953_clkout_determine_rate,
 	.set_rate	= ub953_clkout_set_rate,
 };
 

-- 
2.50.0

