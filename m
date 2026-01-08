Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47B33554B
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907055; cv=none; b=RjHKe2vgzeXtaNKDB8gFEDBmUV+3sVJ/hdIDtJSwsrA7ZSqVqhWUaphOKSwAhaVoQGvF8kXJgTGJ8ufFBqOJUUOCUGPi7NkhA3aI6FTLwvHhlNA4hbuz2CQtgiBN294u1uKWTWYaxo3E5ThVU1DfZX7fY8RF4jbELjMoHrEy3rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907055; c=relaxed/simple;
	bh=oUlYy3bQgFH6fzS/3MtHKlbPpAXM91oV6I4JsmoLqZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=orbhzOv6WuywLiSp8cqb9jD4m1mxnQ3bHx/WdITYGZOP4W6XAU5o0+7FNO5o9o3M8KzWzXo1cFwcUcVJH62BzL6kThYBodAndiiifNmEJ0C3Qj5a2HaRZ1WzyP0wC9DNAT2NZwRCvoSMGfjvyCqochQQcVlfUYJBoG5aPt9l/hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ERgPRHF0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WVNlab0h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ERgPRHF0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WVNlab0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBYDw4jtntgqBTWPIcvzRYHJL2SPvYBI1QtaKE/TrD8=;
	b=ERgPRHF0pDlxKzYBIXFZw7B3ZVXIxXd7n0Rho4fjliRAuYo8nwl8XsHs5cKzT+WetDVnz3
	HsJtUYWSeiCxgEcKkyBlo/6m3JKL4Unpn09cmJs5epIavXUHP8WuQ+7txv7vPVuHRQy3X4
	myDy4YtE2tu9gs/h4X23Rt/9Zv3iB/w=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-rIHH9HztMW-h0zGyDVzLkw-1; Thu, 08 Jan 2026 16:17:28 -0500
X-MC-Unique: rIHH9HztMW-h0zGyDVzLkw-1
X-Mimecast-MFC-AGG-ID: rIHH9HztMW-h0zGyDVzLkw_1767907048
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f4ff789c5so10318228241.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907048; x=1768511848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBYDw4jtntgqBTWPIcvzRYHJL2SPvYBI1QtaKE/TrD8=;
        b=WVNlab0hQmOyRnylQ0I0cB5ZCh23vgsW6+Ce5lYGXWKU+Uca3DOr5KIZWKx7tIcm6Q
         aQlReKoxWAUf+wqjZySFp7obevpTemQxhSfpwT4jD39G3TQ7Fx3OweyhAU2knXZFwPJn
         mrxi9udmXLUIaM3MxYqnH14jvYyDdK1cfSRrCw1xCqjOLTHFC6vQfP//dAmx/aruKUxY
         CkcfM1/Pj8aJAU9YpcVYp1sd6M2LempjxT2JamfFwQVhS8ML1hhEf2E8nBwB8fP78pa6
         0T/AQhYZvv9ZnQZs/IDZttl4IoH+3mtlFFtTdHIKn/K5TP1xqeWWfSXHexJSn4paaUhF
         fRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907048; x=1768511848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RBYDw4jtntgqBTWPIcvzRYHJL2SPvYBI1QtaKE/TrD8=;
        b=M3rRlJWv99omeXRhtP4cavCuvNiuW7S+F5k5AuhM0au4PWBmbh7ecoKKQH4Q9IZKga
         6W9kFFo8MGd3UBd+of6subzmCSHBAFqY01I6z575X3PIRJNgsjA6tNGmbNEUqr8kJadi
         GFqwFD3DlidpdZzhOwPjmMkmsQEHSwvEGsfEj4MN+OeJM162+3rletwTe1lJRrkh4r1W
         M097xF9S1LO7u/CMqwT1NQ27RMAy1Qyvzhac5fWdkVh7Mv8IcHOfmi/eZu7wg4PW3/by
         B78JWHr57OmgPt1wSo3ftHTmVZxkcrwBs+IUa4Jleyzb4KJxuYmaGl+OKC+qo1cnQTcq
         iUHQ==
X-Gm-Message-State: AOJu0YykcOQ3LRXLuTsX2mvprqQinmYwJdWHgs3q1kNrLBVyUTXHwkGZ
	miET1wq+j8y+Q33HR6jDWuEonBkgeSZipNMxrMWI1T1N9yGuu/3B53LXzkm6XtOf/Kh5t92Q27a
	m+ptTHNXASibCSzNah9HaOvWiPyt5qjYuT60lI1fovQdGSzjMMuU8yY+yX6B3eA==
X-Gm-Gg: AY/fxX7KP02+uDOCKddWKskMnqPJwBLRBu7NcEfL2DBX8Q6ZgfZJoo4pNw5xhunIBB9
	YLsiJ2xTYRST25237W9ToYUgAEN2MNLOFg+Dut7Qjn+jsT68VmWBfwzEyqvI36Frxnw2zVhcjj/
	p/fyfcV/e0+bsdTri+/ZYHQRbN4WoPeeCYC66c6ezkMAFii8e5DSkSGYObSkRGctg3RioWOjvN5
	U5qbIAdj/RkJkVJpLqlKgc/HPUZGtWyk9qSJpxDwCkW6viQzaYKgBwcWivr3xUu9Qxxsm1ke3Jp
	mRl18JJnl6Et9bs+ayDOr2jiRvLwwPMpay6ltl7Bo0kxpYy2dcic2gXT2NDyxUlXGSXpBbb7CrF
	q5X6KgtVg2JHKL7Q=
X-Received: by 2002:a05:6102:f85:b0:5df:c33d:6e54 with SMTP id ada2fe7eead31-5ecb1e6f41fmr2971663137.3.1767907047324;
        Thu, 08 Jan 2026 13:17:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNwWf0onPsPTub4yUrXc/8gn5GVOhb2j2Ehx3Pvq6hJSQ86k2qUyrPeRzAHK7SxONIWAACBA==
X-Received: by 2002:a05:6102:f85:b0:5df:c33d:6e54 with SMTP id ada2fe7eead31-5ecb1e6f41fmr2971651137.3.1767907046907;
        Thu, 08 Jan 2026 13:17:26 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:22 -0500
Subject: [PATCH 04/27] clk: actions: owl-composite: convert from
 owl_divider_helper_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-clk-divider-round-rate-v1-4-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=oUlYy3bQgFH6fzS/3MtHKlbPpAXM91oV6I4JsmoLqZM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LZNVbC3CrDOT217EXJqI9Ne4XMhQefWP1OYu2P7r
 MOLjcQqO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI5BuMDJObVXpuGXl57amS
 l2BSj1vwJku5kld2uajlBmXJAIXsSEaGqXyCzj4/7VU/RbYxez003Hx3jkx+V8L/Ls+Vc//tyCt
 nBwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

owl_divider_helper_round_rate() is just a wrapper for
divider_round_rate(), which is deprecated. Let's migrate to
divider_determine_rate() instead so that this deprecated API can be
removed.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: "Andreas Färber" <afaerber@suse.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-actions@lists.infradead.org
---
 drivers/clk/actions/owl-composite.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 00b74f8bc4375a8f42e9b54c7bf1affe91e1074a..9540444307d6c960af200ec13e7c60abd47ffc85 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -57,15 +57,10 @@ static int owl_comp_div_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
-	long rate;
-
-	rate = owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
-					     req->rate, &req->best_parent_rate);
-	if (rate < 0)
-		return rate;
+	struct owl_divider_hw *div = &comp->rate.div_hw;
 
-	req->rate = rate;
-	return 0;
+	return divider_determine_rate(&comp->common.hw, req, div->table,
+				      div->width, div->div_flags);
 }
 
 static unsigned long owl_comp_div_recalc_rate(struct clk_hw *hw,

-- 
2.52.0

