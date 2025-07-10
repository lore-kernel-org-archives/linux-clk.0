Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B254D2749FE
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160874; cv=none; b=cdZBu4lVsxHdHX5i73IrdfUce2zHeNIYrccWazwTOGJrw2xKI/4qgPCM3vDrpsQUt6upmf/o47piW0aG+c58DuelXK648DCGH3Hx5YbYriygeWnsjxWsp0uhH/U2dsnH/ndYDYuUrusT6u1K7jIIW6GW57xymkWLixBDNi4Orzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160874; c=relaxed/simple;
	bh=y+AZFWJL051hZPxzrLPHAl9zoCHqdwam8bIR61IfRhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qmt8j2/bc6A9HVvWtbPKDlKvGtzEd9IDnWwd22pIOzSSXxNtuZMaR34J+PoG5QkFGdfsSCOjeV5wSmyuew2Y+AZpxeZdovwar6Cyoox1UuwmtNI/Ajb+Xm55UiKmY9iudaC5w0x+clv8tlJA/e2SUmqtiYYUL+j7+76fBQmN/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OsR4exhg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OsR4exhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSPmB88QF1UNyRARNUEoZz86JZ+YjWuFEV+8k9Qdm2c=;
	b=OsR4exhgTnVq3VC69wQn+eztYZHBvFsaIYSZa/Qhb+x41wsCdK+zvpg1C6PxmDjjx+MveF
	3wVAso1QSYzQVZkkECqwMHGkA/CE68SQE6K/fKz5aCaNS5qoX0MyhcUsj6d2Qn0g0wMKos
	WjuYx1zJ6y5pumzI8UlZVKqgueNa9wQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-2GEpZrsKMwO18l_y6g9cbg-1; Thu, 10 Jul 2025 11:21:09 -0400
X-MC-Unique: 2GEpZrsKMwO18l_y6g9cbg-1
X-Mimecast-MFC-AGG-ID: 2GEpZrsKMwO18l_y6g9cbg_1752160869
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a9aa439248so13781011cf.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160869; x=1752765669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSPmB88QF1UNyRARNUEoZz86JZ+YjWuFEV+8k9Qdm2c=;
        b=pXXgmiEr3t5TUdLwtcCa498fXhoEEgpJTuLVKIeCglgdGt20Srb/Meo1BCVjso70Ab
         Bgs385tSepJPRerQbgS7uzC1VS6Tcx66VTzYD6Gwf4UGHf/xE/zv23enDiVwrRkgqjgG
         mXZ7XxI1zJkVXbCkEO1vJmpDSnj2U0VPrth6a4OFD1BduU5LHcwUmfrO/Wy8M5ked9rS
         uWiGVWjQrJYYinCwzW8qRYJTefYDqiQ83YgAKJTaywLdf9JqZw7Qyfo3DzR86o4QwqX4
         KwE8o493qACU+bF1GwtRg5kEDtDkgArmBbPx6IvuIKgCtA6kDwY2DaSVvS2qCZKGQdtr
         t04Q==
X-Gm-Message-State: AOJu0Yy8tRCOpj2rZlcpSA7T2HB+N53CJo7FJf6QPaAd3lpwmwE0rRHl
	TyXBuXEBfh6Mb06y2PspYDTlLfr3SpKp8p1tRe65WbMyamU9X/iSXPUkj//HvqgrbgLC9qPOjiL
	eBgMjd/RbZPorUdaLIWRJ80asoqid9zuygeiUxuJK+wffj+ChkZc7dYLPY9Oyvg==
X-Gm-Gg: ASbGncs+NELw6xdwev8ExwkuLg9VUtuNoGddZnPPUlmJzPcAx11o81ZNg+IJKoTlVVY
	CW325Akhq6raLhN7LKEumpxNipflSeCn+gN600Z5P6iyBmKZ7cGLMSHdxfiCNwoEmC9gBP79/Vd
	MEOZDceJ0YdGImSIV5MFe5t2G5BcwhtRBp5kPQ3jXvfO/OkeESlBV4OKi+k+K18jCo2R/4mC9ga
	xR5OJRh8w5xX0T63DYcacwKajWp9aBnjMNGyNIu85oj8bRAVuxLl6Vk9QqXvCgvYgfligxD4K2o
	53MeIjKSVv4X6s2kFfDTX7L831evYhyTQ5U6fp6N6l8Af5QevY6ylveTPs00
X-Received: by 2002:a05:622a:4110:b0:4a6:ef9c:eaf6 with SMTP id d75a77b69052e-4a9ec7fc1a9mr45333511cf.41.1752160868725;
        Thu, 10 Jul 2025 08:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuCfhZPQ7Idmvh1qtK7kQPM/uffYT3OzQJBiz87ujd30b3ETbzpQriwnIDdG+tuY1zMSqkBA==
X-Received: by 2002:a05:622a:4110:b0:4a6:ef9c:eaf6 with SMTP id d75a77b69052e-4a9ec7fc1a9mr45332871cf.41.1752160868384;
        Thu, 10 Jul 2025 08:21:08 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:26 -0400
Subject: [PATCH 06/15] rtc: rv3028: fix incorrect maximum clock rate
 handling
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-6-33140bb2278e@redhat.com>
References: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
In-Reply-To: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Mia Lin <mimi05633@gmail.com>, 
 Michael McCormick <michael.mccormick@enatel.net>, 
 Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1044;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y+AZFWJL051hZPxzrLPHAl9zoCHqdwam8bIR61IfRhQ=;
 b=0KJSbBt0DCZNkUMOmwxns1NITMSVMXCg2QJNQ7+FpDcQdwXvMZxfWyFb+ZQw34oW708cql8Z0
 8ZzDlOPfUDOCuuTRShwnoG3D5ui88qCACdqmSjcf+TQTW6jSrQvcPZi
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When rv3028_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: f583c341a515f ("rtc: rv3028: add clkout support")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-rv3028.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index 868d1b1eb0f42e8cdf2895033c24f0d2690587ca..278841c2e47edfefd339f04bf5193f6970ba0c65 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -740,7 +740,7 @@ static long rv3028_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int rv3028_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0

