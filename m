Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD02DBF6E
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916525; cv=none; b=XsvZ610OKcC9rrefYQRHNL7oszj6ox9vDITY06xENyAopIJkpCUiX5Vo9agb1+J0NRuvE6Sa19GwEKX44RZe4/ynsujoiPXL6kB+Ni30v8JS+9ZnuiODppZCr+JyYS2Gfh4vM/mbyMVVZrDG26ZPI5n81hWsqAJBr68Es8YoeYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916525; c=relaxed/simple;
	bh=d4r/MgwDOiJAMmN6yEZ45olvnlGBMIdC6u8+ioBthwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oAH1lfHA1iu84amsSwmaxWN5a3tq+npAmAJSgKsVSS7dftiszbmosLEKobBM3Zig9Wkd7jmYE0XJsS5I161tv0Q+jlfw3+kSTG5q+f4DbstetfXvwpUmAwNWgel+W7xCkHmUNtV1gxLUOB2raPq+J7XAavhEwIsV7kNkUw7ZObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqV/Npl4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqV/Npl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0FabGW93p0o5EPz68evGzI0JKQlCaJUZlHooFwdD+8=;
	b=bqV/Npl4hmVau0WR2bWNZaGTqsnJUiqRA2vXaaHuGNgM15FDk4J9AopetSFCFAq9GR6zv2
	mPsYJov0PVgi+jyWvuTpV5PeHuxyiPm1JhK2Y2lpuoAU06EHy6up+Flzyfm6OauGput0AT
	TJjk1UXe9E0pN7lGdHfKoIgpyub8sho=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-ZVG8G7zrOpuT5uMpB3IoqA-1; Mon, 11 Aug 2025 08:48:41 -0400
X-MC-Unique: ZVG8G7zrOpuT5uMpB3IoqA-1
X-Mimecast-MFC-AGG-ID: ZVG8G7zrOpuT5uMpB3IoqA_1754916521
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e667b614ecso940887885a.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 05:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916521; x=1755521321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0FabGW93p0o5EPz68evGzI0JKQlCaJUZlHooFwdD+8=;
        b=uvJWJWV+8koj1u5wWURTdJSA/UYMjduMnbTQoL3wZhVpwyvOavLXjka/vgUVSCtpqL
         hopcHaBELg7J5dJCLX14pwrppNJR2Y9Iww4HAkQTDmLBgS2v2eQGLdE9/0w72W3vSl9P
         SBHUpqDQczjaQau8zZ6z5TyI9pZDYn8qwn/tmq6cgCWx/UCX/aQDGDr0A9DxbaACi6bO
         TqXfSF6123YVtnmf9gPMwfixuFtukfpCxb/vvOkzBrCjVkf4ye+9g3/DDJypkAcjrm5B
         VW5qa7R6Z464FJrvyvPvtwg/skkjCzQrampfsIOyoxN8RGfsRVT5WJ0GYde/xqOp72jC
         GxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbWmxvMSGT+IfahTNkU/BVQxVo6Ysy5h1fjWX+XqZXkpNU+3ZmktU1RxaosJu3ORtBi+b5obZ3z1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEtYh08ZNEMt2rYJwrWoBlaw+vR7z40/FFNeTdKhraoNhstVLf
	GIOuu2OWRPJv9gt8h0G2Zcxeq6Y20xfiPuAcSaKONIpPgOGjKsJWBbiEerTSoot8QJkFDgR+3g4
	P4HKmEFd3xSbrXXhDFA/vFCmnMDAHFxQCuYdfH23cHkSwVF55vn3u2nSdyUu3Vw==
X-Gm-Gg: ASbGncssSWunR8qcOXnRIx1ev96/jVr6LW61jo1lRGqNYTnX3wSGFv1XQbdtHJwaH14
	d0gj6rCiQ29o+dTn/nxOsoJITpBg3DlW+OmIyl1rm3KGJ96ubU1tTPcx6RHsXi+FxFK8I42BCk7
	rbDEHh2H5ZjUQZEZzEEFqKfUIlzY5WwbhgdYbJITRavkrRrhN2e700dSIabUCNnuK7H4yfxHfIh
	KhyDIaFXgK/hsFMgZljJAeUFMKcSTu0MncZPAv8SgZspr8Iw1NAT83p8JiVFic4n4daQfXXGq+2
	w0Jf8UBQUXngdPI1LC9doJMgJni0+0eKf6QxR6M4OzGUNE0Cn9Ag9H1jOW+mUP0LJoqW+MuGhiJ
	ItbE=
X-Received: by 2002:a05:620a:4556:b0:7e8:34b0:6dcf with SMTP id af79cd13be357-7e834b0732emr1628906785a.5.1754916520759;
        Mon, 11 Aug 2025 05:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH5IG1XDFEMzQnjy90UyXWsCI+yyADgd+lMpmJS7oWuILs7scGAfZnwRui0gk7c+GtmHKWGg==
X-Received: by 2002:a05:620a:4556:b0:7e8:34b0:6dcf with SMTP id af79cd13be357-7e834b0732emr1628901385a.5.1754916520169;
        Mon, 11 Aug 2025 05:48:40 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:09 -0400
Subject: [PATCH 4/7] clk: ti: composite: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-4-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=1303;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=d4r/MgwDOiJAMmN6yEZ45olvnlGBMIdC6u8+ioBthwU=;
 b=ZXYI0k5UF214vcjvF2S5pTp2vZZGvwDBNbWPCyvcQChrwBFslhaaWy3Uye/F5OEI+WDcrXqb3
 bukwMYnrZdVD6xRhNkTv4k1shexBAsgCQNHEasZdWAnesixMa26c530
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/composite.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/ti/composite.c b/drivers/clk/ti/composite.c
index b85382c370f7e49ae320c6c47152a2675ca36645..8cba259188d412fee179efe0ffc5df627e42e3eb 100644
--- a/drivers/clk/ti/composite.c
+++ b/drivers/clk/ti/composite.c
@@ -26,8 +26,8 @@ static unsigned long ti_composite_recalc_rate(struct clk_hw *hw,
 	return ti_clk_divider_ops.recalc_rate(hw, parent_rate);
 }
 
-static long ti_composite_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int ti_composite_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	return -EINVAL;
 }
@@ -40,7 +40,7 @@ static int ti_composite_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops ti_composite_divider_ops = {
 	.recalc_rate	= &ti_composite_recalc_rate,
-	.round_rate	= &ti_composite_round_rate,
+	.determine_rate	= &ti_composite_determine_rate,
 	.set_rate	= &ti_composite_set_rate,
 };
 

-- 
2.50.1

