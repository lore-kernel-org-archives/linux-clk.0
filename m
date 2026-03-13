Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7473B3C6A4B
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420255; cv=none; b=O+lXs1MIGNCWYqdttJ/3BcfwaeX39GZR2DwfF9UIF6+rjr6BXpJm5ePQ1QLUZwDky7lIgpPX3FmqI24QEmNflagYxAlGzzHvChN89fB+iR/ibw/wlw87cnvvUxzVZIRix9RLG5t/c9CNmTIOj1vGFHtPWHwSdLNfrNlx1Xgds4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420255; c=relaxed/simple;
	bh=zKXv8T0pDXUYDds5ohnk6vvqdTfTZGnDkfT+a9khpbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWenD6LVDdAIS5qz+O9FJEByJ3ONhqBotoE02oN8swH8mVLFIp4VnA5hcScBP7ogNc43Ru922v0GAF5Qg9WhILxA6BvUdnSPJFcO2IHRAsd+vbpxbk6/aBoTH8Hip3g7wbVpqlCMGPZmUHoSfiU4z3RABgP4/yfwSwMd2YTMwTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EfRazvJi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lO1p67eE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EfRazvJi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lO1p67eE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773420253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7o9nICmnF+pv2eZHHgydcv1nErNi/k8Gi9G8qTuu2DQ=;
	b=EfRazvJiSmPejRRQeUmxx4Qh+5QmQmqevtxhlhyb1o6Tf2vpe1t2pvEDw0lJJmhdpkCrSy
	+e08+N68HGTZlCDdRaEzEJ0A8jsaLABhEv+1vHLqOmcjcdIFVtPRnMyuuC3vFzQWGjF4So
	ItMC/Uo++wsZcCuTGvEwoLNripDbMic=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-WJP2rIz9Oiudbr2Q9MjR-A-1; Fri, 13 Mar 2026 12:44:12 -0400
X-MC-Unique: WJP2rIz9Oiudbr2Q9MjR-A-1
X-Mimecast-MFC-AGG-ID: WJP2rIz9Oiudbr2Q9MjR-A_1773420252
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso355650685a.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773420252; x=1774025052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7o9nICmnF+pv2eZHHgydcv1nErNi/k8Gi9G8qTuu2DQ=;
        b=lO1p67eEiXOhvVTSVO4/8Z7XOaRqIiGmvrs+x6j9sc1K0pg1evSS+cGXTSndiJ0djO
         njug1c6LLH1Sv2wfoGkj4kDBQqVIyu8zzrBePeDcn8tErx0ulGpeqzbmh3vO+sHrRQOX
         fBhCV7/B1BeteVvmkJpqGmwzRW3csw0kZwkFG7CXMuOdvzPopZLOdLbXvEGg/fJRaaAP
         /jf2qkXfdPtGpsgQqe+nyNVY+YnWJNPmqZXtUG3LXtzS+QysTA6vohQEGnrfTZzHF7TZ
         uDdcMN77VAVOLw3hNgpFWkEsDhwV+mGBZdKWcC/der2UNz6Go39DSb9HCeqBTc5VyFb+
         8obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420252; x=1774025052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7o9nICmnF+pv2eZHHgydcv1nErNi/k8Gi9G8qTuu2DQ=;
        b=e5mvdW5qsO3TywAZKkZ2pFO4yju55ZCxQFk1E8IIBoqEq0+2/H0lXQz9L/9OuXqLAv
         3zdLwXLJF7/DAvJFHoFbVMKMKPCVq6AR5jIJHOpGN5+gk/5G5vRlLtDOGK6Hxgu10AoQ
         LqjjDRfFHKQKhrqagmBS2qWM4CvcASgdIllyhJj50Tlo5cf5modd2leRh9QiBSqr4E6F
         mv4ZgKhRFdibDv3abp171qjoOpewu7/SpcaINbkmXhDam79VgZvmuKboqBx6S0G0Julp
         3RJ/5OPru2nvuSdUc0DZmn2mJP8eEIRel00PaXOMj7XRyZ5fu45AdXTmGG6CO6tq1b+E
         dL8g==
X-Gm-Message-State: AOJu0Yx7fxyg9TvUYlx5sTZlrOYO0E6XU4JLXL3bhSCwuCxMzh+/yPtO
	cXZ+g69CFfRHoGbk1z7hDavgcDixz7I9P3hFKlznQYUndtptVYvGWLdqpy+kBirIC1GnDtK/3T8
	XuoeOpTMa826TsNQ2wpladZcNKe3ZToTFgy4BqnRoiUFJHd/zGTUVEfjpsI3ivxMJZIo6jg==
X-Gm-Gg: ATEYQzwahIs6dG4Kaoq9N4+U5lBoJBhM0J9deCMZIHv90kTcufAp7w0gYGYEn8cWUTq
	D69h61z28ZS08/ROFf9STZJm+upqWc9Lax2rWRsvecxDVPu9O9tPt8rgGrx+LOODFV2DM2wot2h
	Uxx9rD1km6WZu6mg19/w09FsJ1s9oq0tOVIUmRRyHy4ghOqMMxxK2mTKAZqzgj80HrRasbYR95y
	QGUyKN82qrN161UHE9tuFsnENVz7XZASADVdiVtatxzn4mpkZdJgo4cJ9drcL97wziIR7iqz55z
	lhssxcvgcav65v6QmEQdXuogt8+HJIpHFxYwRKwvHTUGXBeZ1mbxzPeg0ZT3jtRMa9v+kMXRqSs
	dJbZxpd9/EPqhfmJ1VpkFYODIcNDn3gGdYDY3da226nTCCZP/q4ZkQV1POFtD
X-Received: by 2002:a05:620a:4013:b0:8cd:a3ab:352a with SMTP id af79cd13be357-8cdb5b54005mr570804985a.59.1773420251651;
        Fri, 13 Mar 2026 09:44:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:8cd:a3ab:352a with SMTP id af79cd13be357-8cdb5b54005mr570799985a.59.1773420251191;
        Fri, 13 Mar 2026 09:44:11 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda215c2a9sm587964785a.46.2026.03.13.09.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:44:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 13 Mar 2026 12:43:13 -0400
Subject: [PATCH v6 6/7] clk: divider: enable optional support for v2 rate
 negotiation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-clk-scaling-v6-6-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
In-Reply-To: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2617; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zKXv8T0pDXUYDds5ohnk6vvqdTfTZGnDkfT+a9khpbQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDK32J1dyrM1SqkmKL9+rVvBHW6WhwymiWsVekQUVoZO/
 hExYfaqjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACbysYHhD3/yiUdpkaKdk3gs
 L8zOFdsgfTPGfH1Hs/9Vowo1hRfS+YwMG/n61ztFp2jnuwZoJd48cmBF3JvZSjEaj4tPFj9+rsP
 IAgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

If the v2 rate negotiation logic is enabled in this portion of the clk
subtree, then use the Lowest Common Multiple (LCM) of all of the child
rates to determine what the parent rate should be. Make this change
for clk_divider_bestdiv (used by clk_divider_determine_rate), and
divider_ro_determine_rate.

Note that the v2 rate negotiation logic is disabled by default, unless
a clk in this portion of the subtree has the flag
CLK_V2_RATE_NEGOTIATION, or globally on all clks with the kernel
parameter clk_v2_rate_negotiation.

This change was tested on a Thinkpad x13s laptop. Some clks used
this new code, however this needs to be tested on more real systems.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 45e7ebde4a8b4d6572aa9d867a6f12f6caf8aae4..17646a06420e099b5fa3ec99d92175356c65afa0 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -315,6 +315,19 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 		return bestdiv;
 	}
 
+	if (clk_has_v2_rate_negotiation(parent->core)) {
+		unsigned long lcm_rate;
+
+		lcm_rate = clk_hw_get_children_lcm(parent, hw, rate);
+		if (lcm_rate > 0) {
+			*best_parent_rate = lcm_rate;
+			bestdiv = _div_round(table, lcm_rate, rate, flags);
+			bestdiv = bestdiv == 0 ? 1 : bestdiv;
+			bestdiv = bestdiv > maxdiv ? maxdiv : bestdiv;
+			return bestdiv;
+		}
+	}
+
 	/*
 	 * The maximum divider we can use without overflowing
 	 * unsigned long in rate * i below
@@ -377,8 +390,19 @@ int divider_ro_determine_rate(struct clk_hw *hw, struct clk_rate_request *req,
 		if (!req->best_parent_hw)
 			return -EINVAL;
 
-		req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
-							  req->rate * div);
+		if (clk_has_v2_rate_negotiation(req->best_parent_hw->core)) {
+			unsigned long lcm_rate;
+
+			lcm_rate = clk_hw_get_children_lcm(req->best_parent_hw, hw, req->rate);
+			if (lcm_rate > 0)
+				req->best_parent_rate = lcm_rate;
+			else
+				req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+									  req->rate * div);
+		} else {
+			req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
+								  req->rate * div);
+		}
 	}
 
 	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);

-- 
2.53.0

