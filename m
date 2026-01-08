Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406C33986A
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907131; cv=none; b=WLf8RkYcFghreYB/ktvGTly4d7UzoG9Tuk3r/reIlz+Ad6a8L3LkPz/arU1AiviZmvowtdBRL6kq3wOg3jajGIuWidIML273jI/4olpa55DOm5M76RRNfqy1a/bky2bMcZwJmUCrhg/qt11coePnrqY23GOYaC5ikMePGqbF9hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907131; c=relaxed/simple;
	bh=TysRYy/gQQgM0GLhGA74IOLE9yMBw459UASltWTRaQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvSHPp7PZOqk1iRc26vhyWI1QUjGNX/eJSfIrgaLANNpjfUUX2yhqyzJiDHabttwMND4la2QyZItM/QfHdWh+TXwUXgYM/57aVGfOEf8BOhhmqy4vmRLdF0OkZ08ignd0xG0ZOUy5aKxPUajZGnCEJnMPjK2H6Q7AvhCXNdcAx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQBa1/xU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CxNy90dG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQBa1/xU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CxNy90dG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YavRr7tD53+Iqm/m2cy93MkIpaPScRdMDSAkvnUvvOk=;
	b=SQBa1/xUc3/ZIdcMQBSgn09PT78Ba4aVgE5TckRHHpKU2JUaXXWjoJbY55YhaOBGCR0RN1
	MZJumVei7rQ+glTKdtcuq1iacoGgQkILlSPz5sGaldLcrbVrjn6z4QznUylZhxoXL1rEcr
	TTHJ1kvUtRkwyYfMSsFupsbeJ099Ya8=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-ESkraFwTPoKIRdjuE85TJQ-1; Thu, 08 Jan 2026 16:18:43 -0500
X-MC-Unique: ESkraFwTPoKIRdjuE85TJQ-1
X-Mimecast-MFC-AGG-ID: ESkraFwTPoKIRdjuE85TJQ_1767907123
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f62c9ab4aso4170282241.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907123; x=1768511923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YavRr7tD53+Iqm/m2cy93MkIpaPScRdMDSAkvnUvvOk=;
        b=CxNy90dGXmlIXoD9/3Y4n65whvGlt5j5jGPXmpuqPbZ7uCl4tUF2ZMnfcSnMwwMDAB
         fzj/LFRnJpxLejJSxeHd67GOPHlSt0i/DKom3hJ6wyxaPSLTvMRPUQTmlK707j/IjKle
         gFGL0jUOBGOku8zo4iVYbhLO2SgOVAX87q9es6HvMYEVnVmALJk1EuPsbYXFjUGHR4qT
         tkZnMvD2TPJMv55NMllOt1Dlm7aNhnUUnJqkekQK422Yy7OipVKKknkDsS5ACBmxWguV
         gyKOaUhX1HQMVcpj34QNDVY1YY18+ThxHIte7ZoSWZGdTl3+kVx5uAxhq/c2CR/wXvsm
         cF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907123; x=1768511923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YavRr7tD53+Iqm/m2cy93MkIpaPScRdMDSAkvnUvvOk=;
        b=nHU9tP8jmAc2pcggNP0QmYDfi6Go93QpWGwVP8a5UsrvV2Q/37jetTX2tH7DzhH0pc
         TRwm96TwCXEeDwUWKEUHi/a1GN64KbbH+mfecfEHg28txuQS1UsuFCANSkkDGFPYat+z
         u5bB3KLmGqOAZMJMZXphZHFTAPiR+/iDTEKFabKMw5hR/o9kOhg8B4ijl56tBGyG1/Dd
         H2kV6VKJ9lYvR14+jZ8OacKzUpVKLVqDFIOpVerPGEkULouOHY1F58zUkXaPANaCN0Ay
         uWbBHkjbygHjy49e3TjdG8UnBA9xmLkTGPy84u1fMwbPWWkdJ8ym7A/GsqSIqWneTcTF
         oGoQ==
X-Gm-Message-State: AOJu0Yx7B95oIi2ktWLxBRzljpSDaQrNPmeJHyb19BiS9QEoxYEZUGc+
	94uDYum1H27Ezn4U8DdNvuUib9rQupt7CjeSab1rpb8HUkNpDzJjdMqRF+wOMc3IORbdewn5Kjj
	yRouK9EAryGaL9UU3FFR7jhro0c0Dvxxvakj+G/BK+r3U6BkSqC48b4ipet9oz1hscFzweA==
X-Gm-Gg: AY/fxX6sgXcURRQhRbTh40GWgDIqCDe5u7+TGe+c1ugQhwnPTzt6zgNpwoI8M6QQycl
	DJcH4171sMJEQmjWEdpcOg6nzfVgkRagF5PG5b4XgkXT7C+TgR+nZ+ohUuT9rJFOYM6llGPr/gK
	f2X7BcP2OetNhb31/DH1GRfWHaNlsy6D9DVam6fHBm1vOKdfJ24NJGRe5iVLqZsT8pL8jZgUaOe
	WGKY5Bt98ZdWhnE+EgTdOZ/4dgpMoQDzsauxpnuAkjUYrkmCAqgRfi6TTFk4n2Axh0WyCDynFuK
	LJsXHUIVGTX8h0/AE6LWSYNclCu/8P94sNiMjeBdK9EiIpSRfDostMBGFb+2djwn/AxyN6yeQtS
	aZo7NupELbMgoX3g=
X-Received: by 2002:a05:6102:809d:b0:5db:f031:84c7 with SMTP id ada2fe7eead31-5ecb6976443mr2887995137.30.1767907122831;
        Thu, 08 Jan 2026 13:18:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESRZY+xwGXEjtYBUr8nTePjn6rv0uzLYHmgbgzlphN/KzO+D2ZKj8n9L0dI2Lz7EbGBVfpNw==
X-Received: by 2002:a05:6102:809d:b0:5db:f031:84c7 with SMTP id ada2fe7eead31-5ecb6976443mr2887990137.30.1767907122345;
        Thu, 08 Jan 2026 13:18:42 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:36 -0500
Subject: [PATCH 18/27] clk: sprd: div: convert from divider_round_rate() to
 divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-18-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=TysRYy/gQQgM0GLhGA74IOLE9yMBw459UASltWTRaQY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hau6wvYNc2o2Hvub69jOZzR60od1va0R04yseALP
 3BOUz+ho5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkkWTAyTHXZWLiMefGki02R
 dY9stz4UbNp9ycGjseL/p/PG9w/xSDMyzJortZujY3+Gv+CpPtNfRR88lybP435rKzA3qYdnX+Y
 aZgA=
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

Fixes: deb4740a5ff8 ("clk: sprd: div: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Orson Zhai <orsonzhai@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
---
 drivers/clk/sprd/div.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/sprd/div.c b/drivers/clk/sprd/div.c
index 013423881968002d29c4e9536e7cd7b944779196..cd57163a7204c0b21ac081bfda3ab57cab28fbc4 100644
--- a/drivers/clk/sprd/div.c
+++ b/drivers/clk/sprd/div.c
@@ -14,11 +14,7 @@ static int sprd_div_determine_rate(struct clk_hw *hw,
 {
 	struct sprd_div *cd = hw_to_sprd_div(hw);
 
-	req->rate = divider_round_rate(&cd->common.hw, req->rate,
-				       &req->best_parent_rate,
-				       NULL, cd->div.width, 0);
-
-	return 0;
+	return divider_determine_rate(&cd->common.hw, req, NULL, cd->div.width, 0);
 }
 
 unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,

-- 
2.52.0

