Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAF2274FCF
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160864; cv=none; b=WhHTI9e3fHToouvWhzO6Cb/o+mMPu0pMYx/ZBR9gz2kYyFYYB7sqUVuYJxVBJ5wvJ6JVUz4NHc/hLFLcU6/0HvUas9O4uiUXLTZ6bg1MnNHZ1KXZeGKDoRV39YQ4sulDJKP5xJABGs5rCESLE/RL/lnMrIuuHHdmF61tfgfF2ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160864; c=relaxed/simple;
	bh=5dhSXbabSOIot1EwSUx0tN+/kwz+r3qTKvgei/0M1C0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h535EGTXWRN4BijCeiEztophKJ+Fw6eWItdCHLJNH3FiKRaP/OFM8oaPc0NMXpFx9hZP9AppEd0uVTFecPtpFtmx6jQIvMbuVHRv6cCqUVfxCjrQH6c0B4ksipOQmHyxB3bbuBEqY6k2wxkwaGdjtrRrlS0C/s7BQGRbCZq+g0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YMd2yIQ0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YMd2yIQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfAZifEVmiDYokEi8qaAJcFUVRfsukjdAyRsQDueIBE=;
	b=YMd2yIQ0Fw6Q5kdEgkV8XWxJfrhPyUwiWVEgMzVgBK/IkNixBoq1Y4AOUOGpWcJnec26VX
	BRWJyJcFtarJLSctALPPGCQoRHblUX5+Zx3Qg8Z+BaGsMTHVDT40Vsb7fXyW5z7gyrP8nP
	UE2bgWJhTbY8fpmag7Ih6SnkEFnk8tw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-2dV5W3gJMJC_iqSp3qE0Vw-1; Thu, 10 Jul 2025 11:21:01 -0400
X-MC-Unique: 2dV5W3gJMJC_iqSp3qE0Vw-1
X-Mimecast-MFC-AGG-ID: 2dV5W3gJMJC_iqSp3qE0Vw_1752160861
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a9764b4dc9so19937041cf.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160861; x=1752765661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfAZifEVmiDYokEi8qaAJcFUVRfsukjdAyRsQDueIBE=;
        b=gAjQiaKIKrXqM2H6HV6INIt/PTM/K8s29E9b3sLgrJ6SM9vsHVxb8FEFnUEFiSFJSH
         Kiw3XMs2PmgkeBTXvc7HICHkmzQR25Efv+TJlnlKknenocUQKa7DgRfCvY1SqNUGOcIc
         r2yq8udAJfgskDqIjGQ3b42EIUKvM9y4L+Dt5fby6JTtynyK9/7txOwodtjOYIQPiMcm
         pfMWGF7sFzmwn3nXPZZYMvPVNS1IZV6TeI0JsEDTAg9diHly4MQWlF4h/7/gfCoj/8aw
         Ca4TMy5GN4UHhP/RZbOCLv8y+0VNdpUTboflVaQJPVvl7hTcWvkOQBcZGEfcJmrx+661
         7+4w==
X-Gm-Message-State: AOJu0YyOukv5JyNW3L764c6TNAgolDDYjELJaVmRXmI1oESTDKdH5Frh
	KXI8KxQSR29KXOqVgEswAbCRJLTuQI4AG768WOYpa30PNmTGFzYsgMao+wVRHfc8k7yt6s30Mgq
	sG1ZcSdmk/hWWH5ntdvKjOaZAu/LhPCwTZjn07UjJSPymScNtQZKKfOeg8RQHNA==
X-Gm-Gg: ASbGncsYMsifvybnMKNHZzwSvZrawqbSKTXCCcWHjq5IAKNQx1idzTq/qn1+f5oqh8y
	78UyCRHPuv4EjZoo2g3ZblOqcY5oNJgIckXLMZC/vij4TUN45L3VgloFQ+ZmNvn9AS8vyN6QMUN
	CbvRqCQajseTmU0DYlPLGp9MmMsF2qXtiru37a199f+9nKgO61V5hW+HqT0MKP6GnkM09HMJUWB
	0xsGPuGHryuHfPOKALaTSWX8WET1euyfm6TLiD/w+qknvkLYVei8SP75iSIevRqJf3gy8ZqzPtg
	ozl2Ome0/ESmle+kmJ2f/0FLMuW0nmjIzVhGEMOTs6qZuecDmCYKBtqwnwH6
X-Received: by 2002:a05:622a:2a0f:b0:4a8:2d24:72b3 with SMTP id d75a77b69052e-4a9ec8152c0mr54126571cf.39.1752160860742;
        Thu, 10 Jul 2025 08:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZg7tT2TKkLa812dOO0cuVbNuTqTsuTm9YCrDOkt67pP9zNi/06aVHc55G542WY91jCJtYaQ==
X-Received: by 2002:a05:622a:2a0f:b0:4a8:2d24:72b3 with SMTP id d75a77b69052e-4a9ec8152c0mr54125881cf.39.1752160860286;
        Thu, 10 Jul 2025 08:21:00 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:59 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:23 -0400
Subject: [PATCH 03/15] rtc: nct3018y: fix incorrect maximum clock rate
 handling
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-3-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1069;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=5dhSXbabSOIot1EwSUx0tN+/kwz+r3qTKvgei/0M1C0=;
 b=Z+eHnE3yFv9Mc/2pw97GUAxK2h0eRAwimIQZHOw0PqyzYENQDmyX8/9qqzMvrvfVYCneaOqS6
 wbDceofTElTBQ1umKhp9Jwiwd5C7UTuyCYdg3bAtiY4LJ8MkwhDIFRV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When nct3018y_clkout_round_rate() is called with a requested rate higher
than the highest supported rate, it currently returns 0, which disables
the clock. According to the clk API, round_rate() should instead return
the highest supported rate. Update the function to return the maximum
supported rate in this case.

Fixes: 5adbaed16cc63 ("rtc: Add NCT3018Y real time clock driver")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-nct3018y.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index 76c5f464b2daeb59fa8367bff3ad261ed75dd937..cea05fca0bccddc6384c462cf1ebdc59b377a24d 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -376,7 +376,7 @@ static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 		if (clkout_rates[i] <= rate)
 			return clkout_rates[i];
 
-	return 0;
+	return clkout_rates[0];
 }
 
 static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.50.0

