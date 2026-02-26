Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF50838A288
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129893; cv=none; b=nMI76rM07An2UV4uC3zt20FNoJduNaFInX26qp5jyNCoTolTgIvWxqpSgWSPO0u9bqrvLyAt/uifEeIYudV8o4A2DPrHilg/ofyb5Umsvp1ch8Dz6A7XkeKh6EarkQWcYRP0lHd9CbsoZ7gtLgGUrzlfJ0/akAG8TyD1hAAqtIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129893; c=relaxed/simple;
	bh=vTSkb/uxps/JUNv0OVFO98AZpgX3dLaqxpAdaAyq/f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sP/jUJcWiJ1tlKPxxoU1wGOGXbUjhS01qie3V0Dq3pbdiAgc2J/YRilgt2TFo09eC0c9w+Brub6JW1cGUiPkbrx0C8yJa0+/gm/ycAbsDgFtd/d21JIGNEKyB4Wlmy1gmVByLzwKkyuIlQ4l2YqcfFV/RlXkIAoKfa48kgl/3ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGfZ6Zev; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S2Jhhr9I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGfZ6Zev";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2Jhhr9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rdwnz0qMT3dj+ycYsyT7/Q6vsDkg7lMjGirPWYhw7Ds=;
	b=BGfZ6ZevV2EknuzDxEOuki9VxckCiUbl0XTZ+9RyTNYJZGzVizibcq7nAXJYqv+JpnEDZZ
	rv95sF/YH6wJjZlL7N6ElqHpI8HLmqfwuxaUHlQKz/OoM7a3qUWAPF8juCx6rnfYqC67DY
	Kwj+6NfRWO1wAQ7PW/DgG+1+ZoUTqrs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-40r6FUyGN8q8l16tD1q0Hw-1; Thu, 26 Feb 2026 13:18:07 -0500
X-MC-Unique: 40r6FUyGN8q8l16tD1q0Hw-1
X-Mimecast-MFC-AGG-ID: 40r6FUyGN8q8l16tD1q0Hw_1772129886
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4d191ef1so143362185a.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129886; x=1772734686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rdwnz0qMT3dj+ycYsyT7/Q6vsDkg7lMjGirPWYhw7Ds=;
        b=S2Jhhr9IMhGDmd6c2vu8vRo/qeHnnIzCglyHgqb/afPz64th+C1/qurBY/BURgevBk
         TI1K2fgXfe+XdNHWKbsbWwdp5RUAwC/Yqmro3QLWNz7/CrKb7mk/FuAZYHNq7bBLL160
         QKdn5ro3r4NlRySYnpvX9UTNyKQSU4vYZ5F9y349w33v2eznSdvcHiZnN56HjuEoVLZB
         5i3/YRbPu24aaYkXYEKBx9li2oALcN4FkmJ7tJCluZRQebmP5fytEVC+bvCQnrsVZMkA
         P0vxCl+Ql/oZqgifxh/88gwr4vrb3G9ryigDUJRR9PLa8UlPrMJO54X7iLdMVem+jtUK
         5Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129886; x=1772734686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rdwnz0qMT3dj+ycYsyT7/Q6vsDkg7lMjGirPWYhw7Ds=;
        b=wK7cr2KTOtSB89MzrRKO8bF10kTYOBjyjVUFfm1IlBcjXN0QN/+HlbARNUS/jxmq+Q
         wm99vS/NRjiqw9RQdqoaW3sGUlfEsXuJ7vIVj1txTCgoF3vADDxw2GWXeHch2AUuczWq
         EPCrfwTnZCPhE93nPZprpn4MlxKgS/AdSurjAhl0J7o1wYCcqIUw7injlQm7owlJBOpK
         luLNc81l1Othtt45m4qX4V745JIe9xc2YP1h8vhwJMrwNYi/TltT+iR/XfDg0NVWAUzS
         nUx3J6ZQgKNySqQOuxz4DqKburUucPrDsg8Immm/f6032ZgFsNLxhAYJeShir4FN/HWr
         RYag==
X-Gm-Message-State: AOJu0YxDJRJ95GEmKBKwSTd74mSmmNp4zkur47brRRJq59ji0Vsh4wTh
	kJJ4S7OLbldw787mbRw7Yh3RyzHWuIOOoy8LeP7TYZWRleW+vtzzWVrJpl4V4xFB1yjs9pC4LbV
	MOW8oMypxNk2VH8I+yG8lpy3NnaoEpchmYSjzUyBJ/2HALPk923YWjQ9MfOSaqcr738m3qg==
X-Gm-Gg: ATEYQzw5A3PIcszxhTggb7wRaT+S1jJ0EJ5PW7X4dkrRPWrsOxCmTynJZBvxdalzItg
	dTE3/t7VWyy06XPdSnS3aewUrpPqYB0Eh2RRflcCE9gytbND6W3qr9bMEyWTxLauJz1iz4+qRis
	Z/WOMHD2tkZwgAgd47JemLuevDcfq8tNJhw64Uvr175hL3w6Z3dLZMtVIlrs8stIyE1gkwEsTBo
	nQplZUUG++pIcs0NV7ytzT5bmjPkKBbJ9yjjqcZmT+tnEah4vXgEWbTdvNhEeuv19apuQg/InDt
	gHXjdO8XCdOIbUTOooGWafun7fTkcp7RlQZWnVspW4mIdAY6QfLMvpVsbZynUaZSN1U4gIgROtt
	8xl5WWdkPZG9h1S6Pdzvxs23/1wSaru4SMzEt7nAj8gncR6TflaI+f+NNGB9c
X-Received: by 2002:a05:620a:40c3:b0:8c6:a51e:eee3 with SMTP id af79cd13be357-8cbc112301fmr370820385a.14.1772129886562;
        Thu, 26 Feb 2026 10:18:06 -0800 (PST)
X-Received: by 2002:a05:620a:40c3:b0:8c6:a51e:eee3 with SMTP id af79cd13be357-8cbc112301fmr370814985a.14.1772129886094;
        Thu, 26 Feb 2026 10:18:06 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:18:03 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:55 -0500
Subject: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=vTSkb/uxps/JUNv0OVFO98AZpgX3dLaqxpAdaAyq/f0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Jl4NDxjV5kzdYrZvfarIVsfPN74K/7MRFOn41FSF
 V5lnuFKHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyE9zgjwwGdP9LdSyLXrpBJ
 /+C2/Elc/ebaT9dPOSRcrd5e3nQy9yTD/5gdCWU26VMZ+TYYeSSdZn71+oh83vmNkbJBSctvrFC
 7zQUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/renesas/rzg2l-cpg.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3ba8a637e77662191f89a57bf1390..126398267e60d1f0fa7ababcb22a5c540884e810 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -938,12 +938,6 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
 	return pll5_rate;
 }
 
-static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
-					   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 				     unsigned long rate,
 				     unsigned long parent_rate)
@@ -1015,7 +1009,6 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
 
 static const struct clk_ops rzg2l_cpg_sipll5_ops = {
 	.recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
-	.determine_rate = rzg2l_cpg_sipll5_determine_rate,
 	.set_rate = rzg2l_cpg_sipll5_set_rate,
 };
 
@@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 	init.name = core->name;
 	parent_name = __clk_get_name(parent);
 	init.ops = &rzg2l_cpg_sipll5_ops;
-	init.flags = 0;
+	init.flags = CLK_ROUNDING_FW_MANAGED;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 

-- 
2.53.0

