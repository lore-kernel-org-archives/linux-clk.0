Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896D5283C8E
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764626824; cv=none; b=ZkykuDlLXpAEtrYRxvQ8tNFlZzr4KXlMDB1x0jSHsi6xoZjAYr1+QaY7hnO0pqOToGgM142dw4+8i2bGxuEXy/QmJexrMfiT3XuK/3FrGx7ZACWOXfUTuhm1+/myq7UrL0HElW9yOdwkv/4YEr6sVMZJZj2202uoQRfaRRphozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764626824; c=relaxed/simple;
	bh=77IR71vazhMBo/1VoNxEizLBWQX33SJ3o+8OJafVX9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lu6AslNvVB4x+nN8l+rC27htNnSAkpQXS/KWARI4XHo5bNhMdwxGHhhf8dMy0FcXPSYbY3qsJ8U/YBQRdphq4rLPNwznwuWElzuNUNKzwqGJgpX6c9l+Ies1PPPxNUc/QJMc9iJSHiilFSG4fXGdRfg4WZw0k7spFXREWuzY/fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UJCseyTM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JvEb4Xvz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UJCseyTM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JvEb4Xvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764626821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=scXExgic2EXaygicpqyZLz/imYsLOFX9PqneQqDmIy4=;
	b=UJCseyTM9y9vCb+Afglc+sYs2deFUmTlLt35J9Zm5HUuF+1/crSduHUNRHdbtkEC7kXE4+
	4fXBk02uOI3Jqiwb0OwxnEarEp0Ln/gfU4Jl1h2DuvXxNoL4ZZ6TYdDUqiCjLtbGA1ikaX
	lv7FkQqygtifRsEvZNSWfGEMIutEyeM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-9bSMJMFjPsSSejGe4mxgpw-1; Mon, 01 Dec 2025 17:07:00 -0500
X-MC-Unique: 9bSMJMFjPsSSejGe4mxgpw-1
X-Mimecast-MFC-AGG-ID: 9bSMJMFjPsSSejGe4mxgpw_1764626820
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1386620685a.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 14:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764626819; x=1765231619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scXExgic2EXaygicpqyZLz/imYsLOFX9PqneQqDmIy4=;
        b=JvEb4Xvz+k7bqq1CmlzAUYWtW8XpaS8FfMCqDU8bqgot5jizD0Nv7Y+aZvflHskH7g
         l//SQQtFvKMhLHFt06GkcwMemEPfWaT/BTvTOXSvddxukb/aNyzk/kW8N5aJSprsaAqr
         U9HAbsw+m8vBa8RO91Ix4B/Ib1WnnakjWB/CKnjwR+vaygn0yAHmELZ5Y1y/tT0njVvR
         h44dBQY+OuxLZx+8gFzqNrl/y8CIy0NVmzaiL56mstvvPJzXSGOOkEZ4s/xk5wURIKvO
         Gnagz28kTroNlZWIF/tJU9Iw5HG+QV5vT23vfdLxKdieq7uT/z4EUeejGS3Hpb43eMNm
         6kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764626819; x=1765231619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=scXExgic2EXaygicpqyZLz/imYsLOFX9PqneQqDmIy4=;
        b=DvJwNqJ/Z1p77BVqdMPx46L8lohzKLO/R0mHrGHs9aW8NbQPBT8jnpsHaUir5q+n7L
         PnPvvMBhzCciD7yqnUch0nV/wdThY0ws+tz1fRzCaEWZ8naq8eYCk/gcX5gWHyNbIC9U
         CVFAP/ai0hJAkeoBaSCqSGTFMODCwkRkA2VQ4ykxI6xCyd/y1EM/sWQA72xBSaPl29R0
         IJ6KHz9OCTo7Qa+FZ/p0B3RCz6iIlgxRkZsnDth/spRZTJ0qYqxmlcAT9gGk94hXSQ93
         URZ9pMzpjv/YeUnsWJdd1wrhPPCxAAHh3lhnLwuDDOyDruu7HNXENgKIjN+FGD6Co5yh
         5spQ==
X-Gm-Message-State: AOJu0Ywd5W372TYLFkXhOXK5ykxKa9R+YcneqW5aLgsmtshqM/33WKzY
	6BeZdtLHnluK3jlM7JRRFXU6d1lF5vClSxkNjaSsoOBc30mwonK6x5Kyai/bbXeJsEC40kXZMvo
	gAWJBdvumOlpBpwmTHcNrLJ9OFWoUu6cb2fUsg0lbPUkD6/f6ewrt5Smm9mgefg==
X-Gm-Gg: ASbGncsMf8j899PysCGb+UyhFikrjZHEKt4A0UNX2Od3trB3djopeaRgw9BdI630zY7
	v2YavOngvqM7Wca0GT/CThEsxp/+jtglQXoDm/7JFpfRxzcWfDCaXsGwSUGl7FO1IsK5J5MaTR4
	JvvJ6oJfFpwIa2f5PkkZeWGrPA46//F72LPFhaR4zIWSNS5YlJOw5r0cxdwEIU9vb6uv1TP32T0
	80S2a38ox/mIYOYn1pZNR5IB46SYDwopeusJrgXvlFd5je3NREQIqRH3plytjvQ0xR5YncXLrlU
	mQZQStDsb2SGNg1vydnuRdxEFpCy7Mm85RE0NXtEaUXYNZR4DTdjQQNxwY2f8CtNibK77V8DEbZ
	0G0yls6CaFVEDb+J3
X-Received: by 2002:a05:620a:1727:b0:89e:baa5:c822 with SMTP id af79cd13be357-8b33d225854mr5087935685a.40.1764626819690;
        Mon, 01 Dec 2025 14:06:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkFqvc+nOoqniDujUfdBx+68TawJbQWz+yb3He2552JGKpdSit/958LX13hETXS04YY8IrVA==
X-Received: by 2002:a05:620a:1727:b0:89e:baa5:c822 with SMTP id af79cd13be357-8b33d225854mr5087933185a.40.1764626819387;
        Mon, 01 Dec 2025 14:06:59 -0800 (PST)
Received: from [10.235.125.224] ([2600:382:850e:4ee7:c142:114b:2df7:89ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b529993978sm944541085a.5.2025.12.01.14.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 14:06:58 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 01 Dec 2025 17:06:37 -0500
Subject: [PATCH v2 1/3] clk: microchip: core: remove duplicate
 determine_rate on pic32_sclk_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-clk-microchip-fixes-v2-1-9d5a0daadd98@redhat.com>
References: <20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com>
In-Reply-To: <20251201-clk-microchip-fixes-v2-0-9d5a0daadd98@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=77IR71vazhMBo/1VoNxEizLBWQX33SJ3o+8OJafVX9U=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDL1BOtrlD/v/Nq93fxRUaHUDpf+o4kKf7eJn9ZPyy38m
 771zazjHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzERYCRoclW6RMDg/o5lw+s
 X0TeLVs+/STfigerDq5dwx3wpu9DnwfD/ySr82+zQzPkovR+ZJwQDxFb+KZ9qYqcfsqdWwcyZzF
 +ZAAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

pic32_sclk_ops previously had a sclk_round_rate() member, and this was
recently converted over to sclk_determine_rate() with the help of a
Coccinelle semantic patch. pic32_sclk_ops now has two conflicting
determine_rate ops members.

Prior to the conversion, pic32_sclk_ops already had a determine_rate
member that points to __clk_mux_determine_rate(). When both the
round_rate() and determine_rate() ops are defined, the clk core only
uses the determine_rate() op. Let's go ahead and drop the recently
converted sclk_determine_rate() to match the previous functionality
prior to the conversion.

Fixes: e9f039c08cdc ("clk: microchip: core: convert from round_rate() to determine_rate()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511222115.uvHrP95A-lkp@intel.com/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/microchip/clk-core.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index b34348d491f3e1b576b2b9a8a66bfddd8c2296ea..a0163441dfe5c1dfc27dae48e64cf3cb3d6b764f 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -780,15 +780,6 @@ static unsigned long sclk_get_rate(struct clk_hw *hw, unsigned long parent_rate)
 	return parent_rate / div;
 }
 
-static int sclk_determine_rate(struct clk_hw *hw,
-			       struct clk_rate_request *req)
-{
-	req->rate = calc_best_divided_rate(req->rate, req->best_parent_rate,
-					   SLEW_SYSDIV, 1);
-
-	return 0;
-}
-
 static int sclk_set_rate(struct clk_hw *hw,
 			 unsigned long rate, unsigned long parent_rate)
 {
@@ -912,7 +903,6 @@ static int sclk_init(struct clk_hw *hw)
 const struct clk_ops pic32_sclk_ops = {
 	.get_parent	= sclk_get_parent,
 	.set_parent	= sclk_set_parent,
-	.determine_rate = sclk_determine_rate,
 	.set_rate	= sclk_set_rate,
 	.recalc_rate	= sclk_get_rate,
 	.init		= sclk_init,

-- 
2.51.1

