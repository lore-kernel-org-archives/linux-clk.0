Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3EB3168F7
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764099629; cv=none; b=nkLkNf0a/e1gtvtP4X83xhR58AvZ6DMammBb/WSDHweOkYjClqDyobRHEnzjOBKsMCOiJGal2aNR6jQofMqqih07PY3bK1Ti9aC287Yyu2Yul/YDC+VMq5xzyIXKsF8FrVhy9X1ULDRN28KUPH6b0TFZpNxAoVLLNq6ESj2Jtrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764099629; c=relaxed/simple;
	bh=77IR71vazhMBo/1VoNxEizLBWQX33SJ3o+8OJafVX9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWDIpfhBQ2Av7cFQKldm17WwLarwQ1Eq8VUoCm3QYNSXl4zu1lSIKshj6jFZdG6dCCMWXeN4SG9+uQw+7GsrNQCFIUtuNc3SGi1oTqLpIL3GWC+O2If/rWbnirVLozY6p8YX2oBXjA9plVbltRvQaG7jbCZuL8uQc/RceNV1wBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gVz1rz54; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SW7lvy1u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gVz1rz54";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SW7lvy1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764099626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=scXExgic2EXaygicpqyZLz/imYsLOFX9PqneQqDmIy4=;
	b=gVz1rz54ZV0GQKRzVSIESXMuVL+ieXnNhF5DljCgtCoLaGl+77kP7VJTf+EHcoY72BCC11
	bkZ7J5lGISSXrT3oFopW/AH4cMi2aEdb2SPcqb5U6P7aTg4iCbzaIC8OOr6qlxsYugmPuV
	QAFKg+F+cLlPCVa2Xg1+8vr/YZmpPpM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-AiRMdFaXOuqAgQyFHN2t-A-1; Tue, 25 Nov 2025 14:40:25 -0500
X-MC-Unique: AiRMdFaXOuqAgQyFHN2t-A-1
X-Mimecast-MFC-AGG-ID: AiRMdFaXOuqAgQyFHN2t-A_1764099625
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b245c49d0cso1613095385a.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 11:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764099624; x=1764704424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scXExgic2EXaygicpqyZLz/imYsLOFX9PqneQqDmIy4=;
        b=SW7lvy1uPjw2Ob0hVTppvzewEgadH+YRW/q5Euv8hog2Xe5o8fb5YovQyATdXiNeto
         RmebK13sFqNBZJkFf+kX+aIyPC4OIlmHl8y9MYdNI1pVBTRK7mLP1DRSSmz3hchDleua
         NcEIqFG5FSGm5WnJtfcsHHm6DkSnBzGk3KQ9QaAIzvxB4WHvgLPqDnd1PetG6SnJQ4XA
         LP66PrTqPp+RMypgf9U63SwAeDNTOvbmD9o2M6ZAtLuPlPnISJCIDYToK2WC7nChTSIL
         V+r6+LcGMrBEebRX8Z8lxpU3oS/HNKCbqK2JKsieez+yxtOQWlAkCpHV6SqsdRgiEEkE
         XyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764099625; x=1764704425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=scXExgic2EXaygicpqyZLz/imYsLOFX9PqneQqDmIy4=;
        b=nZtrK0DV1Ct0dtjzUfJCq/FN2JRjmjD+lvo7rLpL7spbk/gzfwt7Xjbs89YoNXQUCz
         R6f1/A3OoeX/XC/C08URKu963C1Ujj4+tJyO2wTw6NBRD3QgtpGYS0HVH+8hPj75jyM+
         rdRw37hHGAPXeeRhq/aYziYcHcYznVRmVdDFZX12OIFVM063v8Qld3GWXTDhUk0YODyb
         DZaGTZ5haKFy0vNt+ZCtLRwxO2L9zKxtyvOke1G9Q4CPivL175g3zK5nIK6PIhn9yi8l
         n77s/GlUyFRvfSobt4a0qhvsAZTyOuv8HB5ys/SLe+hN8TrIhpgxw8rlrmJn76xToZ3X
         pY6Q==
X-Gm-Message-State: AOJu0Yyb/lqzTolYAmyKIfFWfLewOic/P+3lKT0Og65R1kAVpxUCmacH
	WVngmN2VfLtHgGjbTI+tCDruIW3J8hRuDkqQMOxdbhOOC0JSA5ZnlQWkqXDBmfuqB9HiByco9FM
	bHb3bu4BE+JKuaXc0fY/rjDAwW9zjKlMSazivciuGABeFoiHiMqqBfjNYoM/48A==
X-Gm-Gg: ASbGnctFTUPle3XZwhmJJlb4Qqi6vqtnMAaedqqGjjT/CrW6xs7hc/zjTzCTURooy6e
	IiibLeE6PcK3Vp1VLBbOhy9lMd5SldEl6LdWKIVGN4E+r5pS2UQfaJ3E/eq+ZNExzOSXI0hzkbn
	4oBVT668UMMra6qyfiY+jC8irLuq6WRQuFR4zqioOOYSi0VW7yHk/lck6/6pKxwzGKt/nOmPsn8
	5owqoSSeOwiiEdfzNbX0usmTqbDRxyHFrAXpGwBKF1j73PCd0QdQrtg4LW8R4J72C/0LBEOr0mW
	gPow75DvZLePnOPHpNr2w6Ui8X4NeD8dFyclXLHb2dsFqYE+mFchBglwSls+Ff3ieHVniLV4akV
	8QtOsgtzww/IKMGj69laOBZLpUc1WhCrZx8v0pD4TPvqviyPw
X-Received: by 2002:a05:620a:45ab:b0:8a7:2373:1c75 with SMTP id af79cd13be357-8b33d4699afmr2326876585a.49.1764099624679;
        Tue, 25 Nov 2025 11:40:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOyU3t7JAaPaS5idARIdZinpSF51wsCbfrzAhI9/cn8JDyowp2Va3JIlgz3UsSUXdOBRsGOg==
X-Received: by 2002:a05:620a:45ab:b0:8a7:2373:1c75 with SMTP id af79cd13be357-8b33d4699afmr2326872985a.49.1764099624320;
        Tue, 25 Nov 2025 11:40:24 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295eefb6sm1236272485a.50.2025.11.25.11.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 11:40:23 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 25 Nov 2025 14:39:54 -0500
Subject: [PATCH 1/2] clk: microchip: core: remove duplicate determine_rate
 on pic32_sclk_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-clk-microchip-fixes-v1-1-6c1f5573d1b9@redhat.com>
References: <20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com>
In-Reply-To: <20251125-clk-microchip-fixes-v1-0-6c1f5573d1b9@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=77IR71vazhMBo/1VoNxEizLBWQX33SJ3o+8OJafVX9U=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLV2FSfp8vZ/rR2Pmj3wPfuX4+PN95O8z11UP7AqtYLZ
 5ne207a1VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEflQwMvzd2jCt3P/RbOs9
 x+oqLR5e9S97qcEoFRVibjovT8a5r5bhr5jCEdaAxT+P3g29dHJ6cEKefpr/hraS//8KpMWqn03
 7yQUA
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

