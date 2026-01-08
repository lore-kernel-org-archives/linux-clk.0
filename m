Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A8F33BBA5
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907136; cv=none; b=JW1XaOjzVvtMpFYnCs1N+xyLhPoL3JNH3TOYbLpTOQQB8cPAPOiFLLv2+2enRuxYdA/5f6wMOBA98rhLWqgVreJM6/JdCEaE5IUZnTx6gHOib4IaPpznQivq129PRgavm/M1MNjjIA88oRdYLV+pIVo77gY/ipVK63GqSRtp7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907136; c=relaxed/simple;
	bh=HZjZ3HcnfJ6Gv1Fz5dnPy/7RL1U8mVqJINJWM79xQHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3DvohgWIj9clj4iUxlrczkR0V0lo5jKd2LszbRwcQBz6vbOcgzXDJStvvx3DgrB5lnjH7WRD3WGNuxGEIEZg3jwDl3TeS0PuxobVSIEO6ZOYffr+9krnUMUS+rlQD52MC8nVOHDppm5u7tappJuqpWVMtXsGb77st/ONcHLklY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GdghG0vA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nU1F+p/y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GdghG0vA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nU1F+p/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VJzg69xakfxW3VOCyLK7wumPwPeLQPf6YPBQqS8knU=;
	b=GdghG0vA29eBSTmbLZqAG+tuhKc+aHR2Wko3I440SuzeFSzOajaGrdsKlg5SrV6/k0+ahf
	RIYtVQL+dqnDcfqM5GrP6yKs9CINzlV8e7QkT4fPstvoQln6ZzQ2YC4HGdSP5XiA4uz9Z6
	m6NjxlEHdVWiE2QGXgy+D6sN179nQbY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-Qdl9TW_xOFKwsIARK_1YhQ-1; Thu, 08 Jan 2026 16:18:49 -0500
X-MC-Unique: Qdl9TW_xOFKwsIARK_1YhQ-1
X-Mimecast-MFC-AGG-ID: Qdl9TW_xOFKwsIARK_1YhQ_1767907129
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93f57cdeb11so3869372241.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907129; x=1768511929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VJzg69xakfxW3VOCyLK7wumPwPeLQPf6YPBQqS8knU=;
        b=nU1F+p/y73bgp8MsrU3ClW47XRunrquSBp2IITIDobTtgdO11RH5m5VLa2pAPIEh6r
         X3QjzaR1L+WiHF6iYedekEBAf+sYIRQJgIgHl+d6HJSsZ1nkUG6DMAFzHtpb6gn69XyD
         JMBQ9KGBrBkmZkmHPkd7xS9NEpxb+sjWyb3TysgGca2pl2J0bsjbgeVnorVYG6pHkx+N
         tNO1RfdxQBjn0xSwzw25COW9Dz4povKp1ITolDD8201ui19Sx1yAjpWm0MZY+EEFrLxy
         Fwq2Ga+aptRX588Mz9wjnrnBd9UStCHNmGOfBFMwHVaBZdaS6hRUI1EHQM1/AKvTsPNw
         bVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907129; x=1768511929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5VJzg69xakfxW3VOCyLK7wumPwPeLQPf6YPBQqS8knU=;
        b=o28c14vqQoLWMj9sBQOxOkYkTNb7aCloxxQpwwR7hMnQYFJF5cq06cYc4bcvBqNM0c
         6Z+SZHYQDZi1/FCUayFpXuzRWT0FbkU0wAmSz6qzdfFCMPGycSLC+rSc9UGpnV/E2w0p
         ag5v+r9+98u6CodkHvdUJjcuW/Zyrxj3qdaAdGqLt5/k117dyJpy2DGhyHtBeckxYIQu
         IQuG+e6htPEvIFli/qxkFKIhR2dMFRLVg1KGj7x0x8OSquIa3Mnc02CQt8oANLnzyflV
         9XF/FDHlS7mdT/cbvssO8VyPC0b+l6c8TQKfqAin/K/8XALoYLCZRl0zGlwZt4YFnRBs
         M0qg==
X-Gm-Message-State: AOJu0YzvkoL/HlVxAlfl4t6/Cke7wE+4TfQj7sRegCzG1AjnOtGDPao7
	Pgd0tKM9hFynZMKpEtIHcCVDJvbLfQXAXfEZN9tDVraqKeBFdeOZSrDvuKST8EQ4Covui2hS/4z
	es0cH1cvt8DCXVZSDSYTqjLIsn954yl73LMPxC8pmhcHmyLxR+fCaAUZB2+sUdQ==
X-Gm-Gg: AY/fxX4E41yZ8nIjXJlEoynEZ9kup6te+j6FP0B+oJQQKeFEx8rR41yeSlbcHOGmudO
	T8CB9LSgnRV9RVCzIQiWsNaqmOxJAMr94f3RHtQ65T3sadLaNUDGEG+6S/j0HGGzToMAjq7Bz8l
	f+NM04WzgYshCbokr3tEpBxqhl5z1mpdasPS1fPofoCKRd7Pg7eJid0plFAnIiW65+hSVMY4LPZ
	d+MFaZ2wYV6XnM03B2st4zh1F78Ml3KLwym2S91E2osyUqMuLlYFZqqbR4wGfrJryfWnXTwlcgU
	nkJBqNAn/JRh8ztrksAqCOhelw5xcgDKQsSw+iJdZuSEM8KLIgwb0YsaUFFrfcdveW7/epM1Sm9
	0XH0j2V/YoC8QjLs=
X-Received: by 2002:a67:e105:0:b0:5ed:f26:5615 with SMTP id ada2fe7eead31-5ed0f265843mr1992109137.18.1767907128954;
        Thu, 08 Jan 2026 13:18:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLX2O0KlmxzrMSo3tby5b/YZN082iMeszi4qbktrWtgNvTKagIIyv7NxGpAo9E2TfU0DUiFg==
X-Received: by 2002:a67:e105:0:b0:5ed:f26:5615 with SMTP id ada2fe7eead31-5ed0f265843mr1992095137.18.1767907128511;
        Thu, 08 Jan 2026 13:18:48 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:48 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:37 -0500
Subject: [PATCH 19/27] clk: stm32: stm32-core: convert from
 divider_ro_round_rate() to divider_ro_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-19-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2367; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=HZjZ3HcnfJ6Gv1Fz5dnPy/7RL1U8mVqJINJWM79xQHk=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGlgHrmgM6LOwEM19Z0uuBjchVDfhpfoJgJDmN/xDONnYVJb0
 4h1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmlgHrkACgkQt9LdJ11+wIfnBwD/WXtd
 f9bkMoE+hr+2zc6UAhat71CaYeY1QhFMrePNhoUBAOsjGZioUPoLJfrsd/8VSuM/9DruUEUcARU
 bPxSu5FkJ
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_ro_round_rate() function is now deprecated, so let's migrate
to divider_ro_determine_rate() instead so that this deprecated API can
be removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: cd1cb38836c0 ("clk: stm32: stm32-core: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/stm32/clk-stm32-core.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index 72825b9c36a4d3b8ba3f7615b9026c09ffaf88d1..b95b9c591fda7d900d523f50c8bd449398aba49f 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -369,13 +369,10 @@ static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
 		val =  readl(div->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		req->rate = divider_ro_round_rate(hw, req->rate,
-						  &req->best_parent_rate,
-						  divider->table,
-						  divider->width,
-						  divider->flags, val);
-
-		return 0;
+		return divider_ro_determine_rate(hw, req,
+						 divider->table,
+						 divider->width,
+						 divider->flags, val);
 	}
 
 	req->rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
@@ -455,14 +452,9 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 		val =  readl(composite->base + divider->offset) >> divider->shift;
 		val &= clk_div_mask(divider->width);
 
-		rate = divider_ro_round_rate(hw, req->rate, &req->best_parent_rate,
-					     divider->table, divider->width, divider->flags,
-					     val);
-		if (rate < 0)
-			return rate;
-
-		req->rate = rate;
-		return 0;
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width, divider->flags,
+						 val);
 	}
 
 	rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),

-- 
2.52.0

