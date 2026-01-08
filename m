Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ADF33436A
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907076; cv=none; b=Zxy6v7ltqzaLj9AkX2z5rddzvuGbi2g46O8IQDf6QnBhu/681LAPQ9lZdkWZG2ThZE1aKIQhE0W3lgCp5dvgRy/2ubWkJ0G0DlMa/JRvRDDF+o6juXyxkmX4ZJ9J3pA+JIOuzXudnYI8pXIW34bN6kiFj42E/vYWwWjDEfh+Qs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907076; c=relaxed/simple;
	bh=MSrM/TUkLRXq2tgdjfiD3zxWVyaNpQZ9j3nooJ7JcDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vlpz5gLO14fK3FctJy5JQGwvmCCHIEGeWfnL205ae8HfBqlimyxxvxaL6BPD9CYuXfEB9077fIJeqmA4o37HM0HAI4BBhdt+pfnfLdk8Ko8Z5ObVLL8ChuYdQmg7jvHb8MteyWkPwaAPRNUMol1jPwPoagIcd2Mfx8EItoZmAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I25jlAzH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Klydh5X2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I25jlAzH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Klydh5X2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPAHExQLV/4v4yRgHXdthFlMDNsbV8sNQaYipBs9fv4=;
	b=I25jlAzH40uSfsMzhzy13W3xrFWJfkE+9mVHRLQ6qTHCx5ieygMkwALGnZUbq9bGP9cLc5
	x6mOoiM0gUDzAznpM98+jNKDCuOAdpfRtWaaVOcNGTFPCI5yYO9zaPWgSCMxQXucP7M5PV
	O1HJuOreZGlBPEOsfB2CEkfe7cm5lsg=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-RMz0HRiaMyat_3DysZ17Qg-1; Thu, 08 Jan 2026 16:17:49 -0500
X-MC-Unique: RMz0HRiaMyat_3DysZ17Qg-1
X-Mimecast-MFC-AGG-ID: RMz0HRiaMyat_3DysZ17Qg_1767907069
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5eea57b8dfbso1007332137.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907069; x=1768511869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPAHExQLV/4v4yRgHXdthFlMDNsbV8sNQaYipBs9fv4=;
        b=Klydh5X2V3RSqXalw0A+bq/7RZNoIZBDQXi0jujVvGAYL3JbB7IaHV4wZS4kVfd7Yg
         vjUhddBvnFB4/+E+h3/93b3dp2mKkc7lnOq/ecYBfjn5EORhblsIvnWGvmuKA0M9TaXs
         FPAffkjjXexFxro6cU+iGA2Qra8hYa7jHL8NWbNt7memE14Lk5fcRc0+EEYnmevnaqjq
         DcLKfjUtpPXl+GfEQSY0zYvdtwKBQRxuKXBW8cyjfhjhPqlM63Baep8e11/DpBkR7HH1
         2kO9QZHzRbNCeQIw5lSrXJ5y8NgD19O/0XaQqLQGeE9NuGzR03W5mCS/QnxUi4DiPZA4
         4K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907069; x=1768511869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nPAHExQLV/4v4yRgHXdthFlMDNsbV8sNQaYipBs9fv4=;
        b=BfS+J89yGDsDsunGebi6NsldkhAqzwAn7JbfH9IdTJHRDs3dWGFS/C6ewXwmzsn+AD
         5skKkHx+glYTTWrTnsENZzTharyrzhj+XYwUsHDu5y8CU61jKUnQF7c1PM/asgMCs45C
         oan76j3Z/DIZpuNZgv5OqNLNjZPi1ko7fkw31SNvIDE0X2NItQPgmtAnTYe9UUFzh5W0
         jIT1pUuNmpAlHQQ760grtymG3QHDe29HkKuKJjIoSrntlB++Ghj7t4cXn6XBBQhnKvVC
         ExKavAu4SL5D3IMEc/gXrHBU5skSJYmLnh4q8xk2yk/NxJkZjbh7oc3IPr9Vq94ifEKA
         tooA==
X-Gm-Message-State: AOJu0YxPEPHxxVYogmFBaGR5oRtQuFmHNiUiuXaGcKCT7J23dUcaCFDl
	yKM9fs3/cIZCVKfo2OVbiyOmDGd5Uv1cEBv9rW3w+InYzKznpA+vnUOezK8jtB+EZG3zRkJEz9E
	whW3s6QNrIxEkbEqtBghXDXTdcUeZPvZHdHVO68vFVz/6powaUiT+akgj9GFTzA==
X-Gm-Gg: AY/fxX7e9XKUZvX5bp6yJSEdUT6Px4m/L5jZ0QViJs9SVdBJAj/OLtm7i4KhjTYauRr
	7msMe+LLGhKUyf+mHPrcxFnmanhmnmjVwK9ErhyKnEftytzA3/jMD1FVxKSwWJrK/KNK3JsNN0m
	ewjO3VMO18I05tbzcWw2bEQ0bkmQwodoJwG53YgPJCXATXxA1+JQcoJU3FRiucbonj3PY9kPLil
	RGJAAb0DZmrvKxU98XAsY+7vSo/MjPCP0Fg0UtjlcbNCrEIyoRJYkZHN7d3fDIt8PpgrluSDdH7
	FjEYfn0FKgIGUxKF+A0Ez5BsvhaQqrdCOKsxluCFy1Nw9eO6uuoMh7g2In+KWD5V2gcLOnaAqDl
	fpFc5p+8Mx8H8cdQ=
X-Received: by 2002:a05:6102:f9b:b0:5ef:255a:22f1 with SMTP id ada2fe7eead31-5ef255a26b5mr4215137.17.1767907068746;
        Thu, 08 Jan 2026 13:17:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlGk9ZbVlxkIYtgYDBpCvSZPviZ16FulSoSKc78mQPR/dAm/bzhqYSgmaCvA38MGyAJAjZIg==
X-Received: by 2002:a05:6102:f9b:b0:5ef:255a:22f1 with SMTP id ada2fe7eead31-5ef255a26b5mr4197137.17.1767907067559;
        Thu, 08 Jan 2026 13:17:47 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:47 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:26 -0500
Subject: [PATCH 08/27] clk: hisilicon: clkdivider-hi6220: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-8-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=MSrM/TUkLRXq2tgdjfiD3zxWVyaNpQZ9j3nooJ7JcDg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Lb/mO2V8rTljGn2vGNzZ9y+F7DowET31Yt+MPC9e
 /PRdEf/sY5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmcpGHkeHK+XAz9QZvyTd9
 Xp1/N3t4zv8i9MVpIs9L3WuKp3/IVqQy/K/ovszv3iuSvF7LepvBSfuP368Gt98VzZ7hNFlM1yW
 zjAkA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 619a6210f398 ("clk: hisilicon: clkdivider-hi6220: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/hisilicon/clkdivider-hi6220.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hisilicon/clkdivider-hi6220.c
index 6bae18a84cb6c0e19dd00762613fd9051849fdd0..fd7ceb92d6515757f79cd0496ce4a8ae7220f321 100644
--- a/drivers/clk/hisilicon/clkdivider-hi6220.c
+++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
@@ -60,10 +60,8 @@ static int hi6220_clkdiv_determine_rate(struct clk_hw *hw,
 {
 	struct hi6220_clk_divider *dclk = to_hi6220_clk_divider(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, dclk->table,
-				       dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
-
-	return 0;
+	return divider_determine_rate(hw, req, dclk->table, dclk->width,
+				      CLK_DIVIDER_ROUND_CLOSEST);
 }
 
 static int hi6220_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

