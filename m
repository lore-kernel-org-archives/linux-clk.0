Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4053A2749C3
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752161024; cv=none; b=NBE+mY2NpcqYOYaSKZ50LhheT5iwEcBOLxOOCmpJUUGIvgTqp6WeQ7FsHNcOM6e4+0sHsIbl1E4hpQmOS4KZ5YMRcz60VVnE4mb66Pj2NGtVYHARFst6XEdr/dZXGFJYps9wCVwJX9fYyRXsIWVeijfDSHnS8NlqmKH+j1j6/EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752161024; c=relaxed/simple;
	bh=4BgFJNK2KApAx8BvGXfufY73usovEfW4jGfRZpX6CSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqyceTttziD9N5PrW+PORtVODBeuk/e8bd113Bx9G3xYH3eqQ3SZw7WRih0/6FAaVXem/fTM4bQ3EpwCvySSimjPgLNKNXAH6F1IGWrXOEXA1I7fvzpIvJT9yHagUIPypGw/ONvo1HGO53KiNhEvfA0COIE1pqUlMAj/j5IU7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cgDD4YX5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cgDD4YX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752161022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epgV58m9AxzfEVbf4g4531apupWzR+R9RAW0WcCGVGc=;
	b=cgDD4YX5Fx3F+I6ioxS0xkkta9b1dvX0QenWHFTtCP/bfJ6vc6L/SetiB8uPGXeAdKmR7A
	6q1SCSqfXEGF9XzyrvFIHoeeoEgd7dExxU5eYkvsEFqKOeXddokmKyf+EGAsDXxx6zDBW9
	a5QJ1zXwGwbRCKHcPwMKMVNr4Xa0OoU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-JQMVlro2P1aaEoXMKdc2PQ-1; Thu, 10 Jul 2025 11:21:12 -0400
X-MC-Unique: JQMVlro2P1aaEoXMKdc2PQ-1
X-Mimecast-MFC-AGG-ID: JQMVlro2P1aaEoXMKdc2PQ_1752160872
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a9cce09a9aso23567951cf.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160872; x=1752765672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epgV58m9AxzfEVbf4g4531apupWzR+R9RAW0WcCGVGc=;
        b=Qat90A4exAyMHOshh31RS4Q58Htz5HWQTX4b5lsc7uEtKgrL12/7uBb8rJHmZriP8n
         3cFmmCL/I3U+2SwgT62LIWIt9b8OVErFvDk51CKWXm0maAtiBUpdkE1DYqgAXymNginu
         cw+Gvpyvh8qA2sHdb1Bnyo2H+ElrzZS9QtWi4+KUuwREz/6q5UfKUFZxrzGXe+gLUBo0
         pQgnuNi8DAt9amKQlu1Ej9ETUTfUIaLNerv+64QBYi1X6lrTtTSFX/f7x7UlOavJsMe9
         paLzWaxpzsJIE6yXok/VrcrfQFCrFRxV6eODpMIiljmBFX3eVOzhwSkjhThGrwX01dvA
         yTKg==
X-Gm-Message-State: AOJu0YzgPCaCXfLC6We5PV6obE6gwSE3CSHFfcA1Dkf31N2IcuGG61rC
	Uq5ybaoLMyODXwnyNMVKjZ8XZK7pT3Rb/DLe5MH2ntAqyce0QDR/ihmPchTWlRRwqFSA6FAELjQ
	5Pe8xf2wdjEIwQzf/zURlL3D4wZO69O9VkfSu7EkdmAR3IT19hygT/BR2B5Tl6Q==
X-Gm-Gg: ASbGncuABlacbpHQr30dpSU68MkkeF2tsVjVXaBGHBqLkz5PZpqmbpSV5AYyWxZ2Tws
	v4ePCfkulUCkvxNI1BIfNe9LSgrHD3oUfKDWo2LVVaX444C3o1z71CajnuaBJN8qnZrkia4VkC4
	sLbNTHGf7xgRVg7HwKVoBHYXviv/FFPwwA1knvWVIu6h8P3gv0+ZcNgqwNLAgh3bFXdJ0E5n7xG
	6ydpCesTj9nQSz9qhthGE18CeTW0pJWl3ycbTlGhz4J1XY16wNlFNwDJMh7udUhqhzp/zzzH39P
	PmXTnHaosEYbkG4WXoEfvu9IcPQhCySF84z28u068wTHjI1p4gkdKOv2CGlT
X-Received: by 2002:a05:622a:13cf:b0:4a7:9b9b:aad7 with SMTP id d75a77b69052e-4a9ec844349mr45147541cf.49.1752160871471;
        Thu, 10 Jul 2025 08:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLT1XiJrU+UqNY9Ntq3luY8jImtJ3Zw7F09c9Cj0qnJVdBHLwN1EIzNkD/8bD8ThuDgwCtJA==
X-Received: by 2002:a05:622a:13cf:b0:4a7:9b9b:aad7 with SMTP id d75a77b69052e-4a9ec844349mr45146771cf.49.1752160870836;
        Thu, 10 Jul 2025 08:21:10 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:27 -0400
Subject: [PATCH 07/15] rtc: ds1307: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-7-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1810;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4BgFJNK2KApAx8BvGXfufY73usovEfW4jGfRZpX6CSI=;
 b=gO9ysBDglD/2ypzU7AUASOweu+17QRdU21E2uZnqmFKCHQ+Uy7Pcv2JFbQadunS2Oz2cuRLHO
 oMy1rC7ws2ODWASKzDRAvMEp2urJXIZdGJLVZN2+KQPl6b+ZWpTWi8t
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-ds1307.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index c8a666de9cbe9163ab7e112b01b99d97c94970d3..d9d0e482b5ea9300ec9d7e77e4c3ec531b9df867 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1456,17 +1456,22 @@ static unsigned long ds3231_clk_sqw_recalc_rate(struct clk_hw *hw,
 	return ds3231_clk_sqw_rates[rate_sel];
 }
 
-static long ds3231_clk_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int ds3231_clk_sqw_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	int i;
 
 	for (i = ARRAY_SIZE(ds3231_clk_sqw_rates) - 1; i >= 0; i--) {
-		if (ds3231_clk_sqw_rates[i] <= rate)
-			return ds3231_clk_sqw_rates[i];
+		if (ds3231_clk_sqw_rates[i] <= req->rate) {
+			req->rate = ds3231_clk_sqw_rates[i];
+
+			return 0;
+		}
 	}
 
-	return ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
+	req->rate = ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
+
+	return 0;
 }
 
 static int ds3231_clk_sqw_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1525,7 +1530,7 @@ static const struct clk_ops ds3231_clk_sqw_ops = {
 	.unprepare = ds3231_clk_sqw_unprepare,
 	.is_prepared = ds3231_clk_sqw_is_prepared,
 	.recalc_rate = ds3231_clk_sqw_recalc_rate,
-	.round_rate = ds3231_clk_sqw_round_rate,
+	.determine_rate = ds3231_clk_sqw_determine_rate,
 	.set_rate = ds3231_clk_sqw_set_rate,
 };
 

-- 
2.50.0

