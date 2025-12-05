Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D3333438
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 19:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764964013; cv=none; b=rqkZIZSbGNvZaHm46yKOjmYhzGlKKedKl072C0JvNeAvNNP8KdZx+LGdE6BnVFUO/Uh4K9iHAa4k2fAt7FT0n4/KMyowi6r7ukTcBgjGKNzWbTd0bMO9hvJxXXBE0vJtyMXCUyoZQGQWrUW6pbtGCvvqJqhWVnKKwFPjZ7zPfZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764964013; c=relaxed/simple;
	bh=z65zBnwhMmCjmLXWrNn9LKYrNxyaLvGh7xymTom1ePE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2sVVrkQR1l7GR4Sah+Y24h6x/qGATVrYjoHmNDoqHobJvCde8gHGhVNEOGni9kJZIdQNC2oaip48CBTL+MtiWjVKe3M4KFpQOxmii1jzGc3AOJHVtDkvJYXfRgcjYdneLfEXkSZYvFDwi9mUtZMRYi61Hs+WO1gJHvpWTh4z+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lgp6Kpf+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lpftIMb6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lgp6Kpf+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lpftIMb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764964010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BGaiOZiILglv5QY7owOlN6f8B2nrOEGJxkTHuhIhr8A=;
	b=Lgp6Kpf+wgligjAIpBuD292PuFM0tRiRRUC70eGB8ruRXcxh+1tm33+c9MtehrYM1/T11n
	ptyIg45dfSaRMBkPXbdgsEyDWS+ynkyby68mYmcK+D/Up7VVWMPboIJyMEvITcDNhlwXIn
	8hu7B9es/i5nHek8ubxDb9ysjIE1Y3s=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-RevEHwzzMISo5UAboQXxrQ-1; Fri, 05 Dec 2025 14:46:49 -0500
X-MC-Unique: RevEHwzzMISo5UAboQXxrQ-1
X-Mimecast-MFC-AGG-ID: RevEHwzzMISo5UAboQXxrQ_1764964009
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-63f9f128060so3027344d50.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 11:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764964009; x=1765568809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGaiOZiILglv5QY7owOlN6f8B2nrOEGJxkTHuhIhr8A=;
        b=lpftIMb6OpT/KEqhW08GJSzoDObGnoeSaZTgR+3rbdcahuoupHTd1AlJh1LascZ7nB
         vd+zFPMy83nG0/xTUrHIGAj/LVfWuA5QWwqnpDUMQSFiAaGDwhdvDuJSZsLhmUf4MQTu
         1wLxssB8ojaUQl9172gjjr+nQDZAJh/WB+YwleFVTKIEYmHSZy+khnSKYcAyiK4T3E2c
         IHcs++anK8GUEqoMaflLlGmbHAL9OKBpfbW/6qfLfXdr/pObj5tR01f9/RXYE7Ii9GdX
         rxAXkRpUfyuxe4NqeMTdt5cVm4kDj5t3aDjnVXaNFAdSpz2e7t6VAjZWWlEYOZOOyE/R
         7Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764964009; x=1765568809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BGaiOZiILglv5QY7owOlN6f8B2nrOEGJxkTHuhIhr8A=;
        b=vgXO3G4mxdq1fhtT3gohThRpqC/cnccLAntMf3mZH443zjCrjCS1HSwhoHCE49BUTF
         eiO/wEtI8FsDjjJkQ8O5a0NiFoHHeaCLTsM2WvDlUN/jmzIN1EOx5huva+v07dB1r+ig
         rcvTjrdrBln7S6xbKQ43iqR1zPNgvVVizVzGTg5cYM6XLqToqf/6uPYPMjHAks9iUpHm
         MZ5hqciiMQ4ASSLvwBDlC6J7Hrh5tpwRE7jspQSWBP9qF62/y7JlIA/Gboj7N/keGNWn
         MzjEalc49l0GpvBq2CRerzFMYxCdD/0Pb6LwFi2i2iEB74ZqFx+EqXiVVdVtWX14gF61
         v/eg==
X-Gm-Message-State: AOJu0YzYoc36fVKvgRdoxi4M/JVnUtUAHC2PwqoeZPOfXSSbNqKTzL6V
	t93qycQtLxZ+TtfFDZypY8kAxylogPmYkarYfYWm1S+qIbOrghenQprAC60zmm4B+CKcMq2txJ1
	1yreGjGT5+c9PktWpgDC7O7EkyO6vRMWpWGnb/YAFwIc9c5u0o2VpCikEmki1Yg==
X-Gm-Gg: ASbGnctkrt3jS6NHIoJv01k/J4LX0VJEMgRRmAm+T1+StkY7a/dhXCUJ4Ny/ZlwAlW6
	zE7yDpH12ds287PJrCFV02OxqnOh18kjmkuAh4n2qqhywAjugYmySy1EqqW0QYAtx2+a76SiYvy
	CIo+lRHtVIv6y4WcXgw44WUaqhdy69XgD8z0Cx5yAd/rP+JmQU7JlP8wBeCQtJEi3RM2+prWFrn
	4AbJP36Ghc83UZ7K18LEzDiUHRrZ7pZ+sTtmgibWLP+0T6/DD5R9Fnsg8xknSFj4TSC5jGdpzGY
	FitxbH7HlfkoxePknkf2NeePglupZL2xi/rrwxdb3lQXB6neI/Q6oQc7932eoB6Wox6s6E298e+
	HnEmnrjHxXdXkgJIVviDOSVPhguA/pNRYQoM6szt5shKsChu2
X-Received: by 2002:a05:690e:1510:b0:644:4798:d6b6 with SMTP id 956f58d0204a3-6444e7f8cc4mr70510d50.85.1764964008975;
        Fri, 05 Dec 2025 11:46:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRrPKQeyAGZ7gsH4A2HkvfFNoHbJ+jEXsogz+iQYBIjj4ujepqRNZJBRnmqQxR9q+IkBDA1A==
X-Received: by 2002:a05:690e:1510:b0:644:4798:d6b6 with SMTP id 956f58d0204a3-6444e7f8cc4mr70495d50.85.1764964008627;
        Fri, 05 Dec 2025 11:46:48 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6443f2b80casm2151181d50.9.2025.12.05.11.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 11:46:47 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 05 Dec 2025 14:46:27 -0500
Subject: [PATCH v3 1/4] clk: microchip: core: remove duplicate
 determine_rate on pic32_sclk_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-clk-microchip-fixes-v3-1-a02190705e47@redhat.com>
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
In-Reply-To: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=z65zBnwhMmCjmLXWrNn9LKYrNxyaLvGh7xymTom1ePE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKNzZZ4TfoyvWCL9QRtXoeVf+102S4tmrv007W3G5JWi
 udldi7R6ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiK6sZ/vD7qDhvO5O/NOdX
 scF/YctlCjIHo9x9JG9dDf/neuYSCzsjw1Gto0VFRzNs7i5j3HTtRqfYrK+tFn9dYitS/xc88HT
 N5wQA
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
2.52.0

