Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8512749C4
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160859; cv=none; b=u1FGKt2NvHaQrZszJYEi15u3i8tBF0e5xCA2VhKjjU40CQRpp3ugdtV9JEdRXWuFyV8opgQSx/jVHyB99IMAOcIXJA0hIJz5Vy6b4wvEDrUGS9oQ8fuLWEKfHavvhj9X0EiFM9axvg3rGw6DhlDNoH4pHkp60YIf4mjzjurhTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160859; c=relaxed/simple;
	bh=wnFIaXx40Vz/ClvnEh6f8bTkAdbeJwxG+N4rRNHdiSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SipKPUvxzrjBOleLcQFXtK/Mc0hHVY9E1DphQ2LFeu3KOlcIetn4crbBNBzGdqiu48G35X/UyTE4AMf+v1a2i4LXstZcbfDz8Unk2ZDeMxLIMpDnMqco0ziq/0JC8B6/JplckJzavkBh1FVmwOrHMZNmJjjZF6WkmpSjl8QBPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrkRxx9c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrkRxx9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHPBpe2ME5Me1EAnJ5XGIYrRbZqrmoRVe5YJ3r8jZqs=;
	b=LrkRxx9csUNkBQb7nG+NYro2dI/ar71p3cmElZ8B3yQzG+LMYgBBfiARhYd+KsknVoqy5p
	rgZV97kCxOmqUUM+Ri/w+HV1GamZskBLeWLwLGgey9PKkwMgzgJT4G29pt22QS5+/fCCYL
	SyzeNUX5PMRMrP0kXW1IIcgc46w1/TM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-7pI6rTVKM5aWzIiBLDHbyA-1; Thu, 10 Jul 2025 11:20:55 -0400
X-MC-Unique: 7pI6rTVKM5aWzIiBLDHbyA-1
X-Mimecast-MFC-AGG-ID: 7pI6rTVKM5aWzIiBLDHbyA_1752160855
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a587a96f0aso32192461cf.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160855; x=1752765655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHPBpe2ME5Me1EAnJ5XGIYrRbZqrmoRVe5YJ3r8jZqs=;
        b=Bm+a7h3nXHVVksGwBDVbulDb7zcDWyXTluKqmdM8UEHHmdAnMIiLZW4+PT01OfFWKL
         QkGwSTpnhDn21uU0P3xsd2ISWZzqe4mkXn+kQyvVuqSX/VJUT0NmuEcnwsuY6Qtmycj/
         PSv3CwD9FCnuPg+m5xbyah1yOKIPiV7Cs1SSyxKOnj6Xu55i1nN0kcoat37KRz/7zfHt
         49DlbArW8klBf52gfUi9qgdc8R1y/Xcp7f+pJdU4ev9zK0nzFIe0uipUgXV4oawFQSJA
         wcdSCT4zlJX6UT8WR6y8T8uRVVYWTG4LP7Abv9OYzdpQzEByImtu9lv7ZDdlYQ3pnG96
         IUUQ==
X-Gm-Message-State: AOJu0YzHMYSlsknvmfOUUK6sQnozQiDnKh9UXBuyT6AtetoQoA8kvAFh
	a+ZTuzxcgzXKuF/cjXX+Osefz30VSk+Y/aC1atMZQPXfvyUkur5fM5gPxBUasYo73Pqs0b/bTAU
	zeX5j1oFof0vFPoy/KkXUPgAO/JPsTdMSFmw9Y8FZCWBD+vRjebqN2xZltdoCsQ==
X-Gm-Gg: ASbGncsUWwZOTxXD8YsLLM3LoZsaBHM6z/7s83aMK0TexrtMY+WtNMA4fZpxyE99BG1
	+BPHFPOt/va0XPW8loiraGHps+TN61vPa99sVjN/EIQmJUBckEYA5eXDYrhTuF24D9ONhG2ofLK
	gzZkyuzMVrK4N4LqCCjx1xAualODLV+Wos/WId9EPM+Jb499lP/gsSqkpnJTWww1HQscDcMm25m
	5ey9pwFFMLbgMA3JoTLvOZkWm7t6b+74nHl8kQWOI1ox8tAtjDmsBQ+CIor6Cna2/YRYP6bUIyP
	KdWku5/AgC12DuqFszux/jmgphXiP7vMqCAZ3yTL73WbQOQdNNES+4D48CM3
X-Received: by 2002:a05:622a:101:b0:4a9:e276:2fb7 with SMTP id d75a77b69052e-4a9ec7ca38amr47392751cf.29.1752160854903;
        Thu, 10 Jul 2025 08:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDLcNv2lDHhPRuPa3PBLGRvRknazi0MkGkMJ3jjn/hzszBgqiL8MPXlo3Ug0921v1/TzKKEQ==
X-Received: by 2002:a05:622a:101:b0:4a9:e276:2fb7 with SMTP id d75a77b69052e-4a9ec7ca38amr47392181cf.29.1752160854435;
        Thu, 10 Jul 2025 08:20:54 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:21 -0400
Subject: [PATCH 01/15] rtc: ds1307: fix incorrect maximum clock rate
 handling
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-1-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1091;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=wnFIaXx40Vz/ClvnEh6f8bTkAdbeJwxG+N4rRNHdiSk=;
 b=+A8YUXgylGkUHOwIsLqyv4get20Ku0mnYqFwH3tYHrj3MlQDQaPOSNxpmXm2HBwGJcu7rJVBN
 2qwZqI6Hq0xA8ZZ0bQnzaWsxGGatsZPg2KaA+vl4sQUtpFK6xQIbwo6
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When ds3231_clk_sqw_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: 6c6ff145b3346 ("rtc: ds1307: add clock provider support for DS3231")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-ds1307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 5efbe69bf5ca8cbc2a325cf2797afcd14f3760bf..c8a666de9cbe9163ab7e112b01b99d97c94970d3 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1466,7 +1466,7 @@ static long ds3231_clk_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
 			return ds3231_clk_sqw_rates[i];
 	}
 
-	return 0;
+	return ds3231_clk_sqw_rates[ARRAY_SIZE(ds3231_clk_sqw_rates) - 1];
 }
 
 static int ds3231_clk_sqw_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0

