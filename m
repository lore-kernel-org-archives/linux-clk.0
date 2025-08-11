Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3302D8771
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916516; cv=none; b=cs8ab1aYgfyrI4dq0yxMAe3T+FiCOogvIF0G+mxc31HhESkhwAt2fnUIX1KL4RL5nbSNsEQxdDOwYHZomrCWZ2bR00msW0tRywu/oEWRGDptW/O/sRXjdPNRDtPaTRFduTXeV+4lTGSz1H+PTb7AEQYewMaqBCbM1HzKGpUY4Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916516; c=relaxed/simple;
	bh=Z/Z8aNwjy/UKmGQb7dk5/C7R8VIWNkrG3ytaz73rEYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qc88PZJIi7tPUxNRxzRbqPorhKZuiBvUpmGdLAGmJwQ5Cb9Vz2hBxm2yyshbTUbxFdGJiWivX/pSTxZf1nE2zubGSVyRubq6P25FPfe+uzWhbJWzfUsbAlxkDNVqgGTEO7PHFpe/TdHyoW+XTL4VgWgJV9X/Mk/n/qaIO0bBn5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cUebUoAW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cUebUoAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BegFxwY4bB32r47TdTN8tAF4AdmY2JQsv44/XYcFCFo=;
	b=cUebUoAWr0mHr/zHYYFQCCwBX3bk9hu8cVIBRKsQYdwyqF8EbB5GUHup34ib0mx9ys6Lql
	IogW5KUTKJs8Ik5rMg/mzJkiwiLXwnJPIU3rl93W64pqHklBRwGffnQN4X6js3I5egHO5W
	R1QPUrYjuqkehWypjBu+vBTmDmtn+vM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-3uQbCAA3M4WBcCTM-qfJMA-1; Mon, 11 Aug 2025 08:48:31 -0400
X-MC-Unique: 3uQbCAA3M4WBcCTM-qfJMA-1
X-Mimecast-MFC-AGG-ID: 3uQbCAA3M4WBcCTM-qfJMA_1754916511
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af1a20cbcfso114430281cf.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 05:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916511; x=1755521311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BegFxwY4bB32r47TdTN8tAF4AdmY2JQsv44/XYcFCFo=;
        b=g4Os5xNzadu2hiWiXFlVbe3b1jJLx89bXW8Ij4f/dOnLiqJ8LaeSNzyD3FHFf4I8Nv
         v9jWV5r5YClSnzvEvtevtQoLuZ8PIE7btnfHuQbiG0AODiBkLLbAkL9rjOSgGt7pjfQe
         PZmRTXlYGyP1sggSPuZFNGYMd/XfAZxiP8K0m/jj3jm5znkg1HmFJPfffvhmzNKr02Hk
         JnFYMNCHThVcZBFo74gLd6IG2UBEwgZ4ZjnYGcqYBxMoMU5xRJB11+k5gDkM+RK4Rq9z
         zz2DMpdw3AW/zRQelKaKId7gk8vECPhcTvG9lRMd1DthNAJuLX7DYtDnKmvPXo3JmJgy
         YJhg==
X-Forwarded-Encrypted: i=1; AJvYcCVPhKZemJO54ZOzCjMQNOBNh6tfOpudF9ZRKM3VHqj6fFMgHz7QzpDN4uwz7R9VE8b1zLEteZgmU1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmT6YfDOSP4bkp12phmciQ4ya98c6Rq3GU4um+6GR8Cm8vTDXg
	Ubj/hdrWXOQ5I8NzXnGmS8sxLzyD60WA/OF8a1STQlW4N1kq2NzaAt525W7MxSFbryZkxQQ9+Kd
	Y4KUb06V1gdQUahI2RlUn1TZK691nBtYXn8quE+zbyD/gyembr4jVPNQ/HCoBmQ==
X-Gm-Gg: ASbGnctaVEnPU+vnK9DUEBlxVDov+WNwtsqHlFV2IJoO+9ofiHIkV0pbj8zAp86iuao
	GyxL2XSBXE97enQ05Po1pXX3WQpVZoY1xI0Q7uVHwQ0HixOv+ABW0wPGpEu+U0ZwGlmnNG21SBU
	FA6PtFMwhZsz7Qo59v/31W/MvR4WYGi4YuB3LhOOi/l/rSrYg27cVRBmGGpMdF+Xm2l/pWv1cyK
	GhoTECzzkCm58ccypRW5vnI7o705wVOa8lCQX6GrzIsbgHC8gVWkOI4bi63Tl36DypslxRL3dBY
	GIp+KK0+l6pPp+l/eg2naJWILHq0e3839lA8dDT4cPuKHp/IB2j02pa5CFBCRITsccEyzul4OCa
	ZS2I=
X-Received: by 2002:a05:622a:228b:b0:4b0:863b:f4e5 with SMTP id d75a77b69052e-4b0c97460f4mr78690721cf.33.1754916511120;
        Mon, 11 Aug 2025 05:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8iAqFt+pVv6B/yoMCzQxz/7Jr3wwJUx8Cr8upJaSFiLU1TK2hQD/TeVZHYoxHNpp07QBXag==
X-Received: by 2002:a05:622a:228b:b0:4b0:863b:f4e5 with SMTP id d75a77b69052e-4b0c97460f4mr78690371cf.33.1754916510574;
        Mon, 11 Aug 2025 05:48:30 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:07 -0400
Subject: [PATCH 2/7] clk: ti: dpll: change error return from ~0 to -EINVAL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-2-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=1755;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Z/Z8aNwjy/UKmGQb7dk5/C7R8VIWNkrG3ytaz73rEYE=;
 b=J9gUf0U1U5jq8sGZEfz6AEmIUDhkUmMSeIZZYSu0dbqaAVuS0vdyu5EjSZOZiuMAUcRlcCwZb
 Fe8jvzOxIOuDPrsHiJFffOGHuTTuNmlFlQ/8USEG6GDyc4rGrcWmgcn
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

When the requested rate cannot be achieved, omap2_dpll_round_rate()
will return ~0. Let's change this to -EINVAL to make the code a little
cleaner to read. This is no functional change.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/clkt_dpll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ti/clkt_dpll.c b/drivers/clk/ti/clkt_dpll.c
index dfaa4d1f0b64b8e3606d928af7cef701be3fc677..a8c0fc20f791689c74868b98810b1af2c78b18c8 100644
--- a/drivers/clk/ti/clkt_dpll.c
+++ b/drivers/clk/ti/clkt_dpll.c
@@ -277,8 +277,8 @@ unsigned long omap2_get_dpll_rate(struct clk_hw_omap *clk)
  * possible, programmable rate for this DPLL.  Attempts to select the
  * minimum possible n.  Stores the computed (m, n) in the DPLL's
  * dpll_data structure so set_rate() will not need to call this
- * (expensive) function again.  Returns ~0 if the target rate cannot
- * be rounded, or the rounded rate upon success.
+ * (expensive) function again.  Returns -EINVAL if the target rate
+ * cannot be rounded, or the rounded rate upon success.
  */
 long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 			   unsigned long *parent_rate)
@@ -295,7 +295,7 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 	const char *clk_name;
 
 	if (!clk || !clk->dpll_data)
-		return ~0;
+		return -EINVAL;
 
 	dd = clk->dpll_data;
 
@@ -360,7 +360,7 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 	if (prev_min_delta == LONG_MAX) {
 		pr_debug("clock: %s: cannot round to rate %lu\n",
 			 clk_name, target_rate);
-		return ~0;
+		return -EINVAL;
 	}
 
 	dd->last_rounded_m = min_delta_m;

-- 
2.50.1

