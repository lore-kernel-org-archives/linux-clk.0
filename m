Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF3233893A
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907170; cv=none; b=CzscOMlwPRrWReAAalLY7j2GP2g6+MO2umYGUFAbteM1hwzN+ZRLnbGCdMhMuyfPQegiv1EufUrrNeLQbW6z2mK1aoGAO051zIscvBIKm72O1yHxFqnSXyYjM7O4kHIBLd7WDClq1L2NwYd0cd1ROAfeHU9IpANHp8JCCveIwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907170; c=relaxed/simple;
	bh=LzaLThjuJjdtJh34gPTyvntKRADSiE+8sGiCKAXic3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGfGScxO1alaaOqdhv2xO6w7DktT6wEPqV0tbP72vHXnCD+8IBrDMAKYsi2zfJ7fOpn7qp75UbQiwMdhvj5JHLlRckr1ebNH28KfhdNWC7bvbfyQqYYh8F2hrloCK6DajN9HnHeAlQxPeZAVSvC0ZFAQnqoEbqPcMljhPpixAbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UurNP7BI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uM4HDx56; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UurNP7BI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uM4HDx56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4peBw69PP8vhjHIr05jZ+uZJBqbGRcmM8VXQydrAoVw=;
	b=UurNP7BIrJVpDooRK41ypLBgkUB3QgY6ILc4rHtd+ZpNjG4jRVY4FIb7Ocgbkn13AYEhWl
	Jg/ao6iuX6GQ5OSKw/hkgCzoyzIoAg9PG1BryZG0VhtuGoaJ8JL20jWAzFm9m4oSp8t4/1
	/it29sTvuFAqJOzuIV/c0Mx6EiSod9A=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-47Yy5RcaNauOTwFPj7lz2A-1; Thu, 08 Jan 2026 16:19:23 -0500
X-MC-Unique: 47Yy5RcaNauOTwFPj7lz2A-1
X-Mimecast-MFC-AGG-ID: 47Yy5RcaNauOTwFPj7lz2A_1767907163
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ecbf2b9b2dso4613827137.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907162; x=1768511962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4peBw69PP8vhjHIr05jZ+uZJBqbGRcmM8VXQydrAoVw=;
        b=uM4HDx56JzCRwslbjYhoM8HBHSC8BqbLhnUHOxYhVcMOCQa9T9ejIS4CF+k7OnhTca
         Wi08vLIezmi+ZJcIsVYuoK/19tVhY2t1Ef1lJMawS0rBBFrN4Pfip+gmL3xFP7XqCRm/
         fnhnCtEwgqTsJ5VL7+gvpgO3ExBJ/5NvHzfpW31dVNQf2OBwWMUKhx8DWB4+GfFFuX6U
         UAbC8vtOTzRovTPloO+QrMmReH5r4taaVLCOiKrcHGLJSCWnJzmbNz1DA33uFtPl3t+g
         CBFzoCpeEDswNCflp+RO9ljT6fTZ7coutoQpiNRbVzFRhbTtOofbfGcq2azoqAdYWmAZ
         Ib0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907163; x=1768511963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4peBw69PP8vhjHIr05jZ+uZJBqbGRcmM8VXQydrAoVw=;
        b=P4HUqCkiaabWO4HX9zZgzpM9frdMz1hoDWtf/P/DGkSrI8N5r8akV6aSD5KTpPwA3c
         fnDcjKwVh39zYqQLB0ow7IAD2KXjOD9GvB8my2LShGSWz0Ixv6ANlSXPSu8VUq9SNv+5
         d86ZCmWhX+co+fgviV/VqTABwsZvfPZPDgCSbQzIbScOS5iillLGJbZY4jGf6+kgFfKZ
         yqL2HQ0xQllfW10fUUUQAz8jEYF3oS/fjTols4I1QD/2D0ds6cmaFL5R1oSSxGU5FFon
         i1IfTZLAS5kxHIqy8wJPK1HTkGJR8CeayJAF6Z9SYn6jKuFaj7e+2Bxa83IllyknL9gi
         OE4g==
X-Gm-Message-State: AOJu0YzClmTFE2Ouwrb5dUH3nvbYjr3CCb/5KGuP34+7DUq8NTSvseuY
	bRY+C9ZWczB4+EKFq6Nx20zAn6E2ZsBLiFrgdfYZ9vpv0nfmqeg7df8yirqPxK6eXzNqroDHLrO
	Pfn60ScDaRxMnoJLVDjsKJPD+QsswcWhh9pow8fDYa6itYgh0hjkDS+JqXWP98A==
X-Gm-Gg: AY/fxX691+UMNxJ+nzkx3rwmFB4nqUDFBE0S97R6jJi/GNw4Ulq7xjMMPSzOqkbPCij
	uAv0XcZvwOG7jp6KJb0SlIbS/VHAQlpd6ogtcEraVCWq3QiTIlhnIfzLddQG9BHX0Tg2Rswq87S
	+6YT6SlTZJ8peGvXZd5HVMu5jJBZ6zALlOthOBF+o0sN7gm0Hs144y6EOSk07qOtAPR5S0DtUd5
	RkyqPLpBN6KiZVUhWBvdVM6QFHFMzrqC3GEgrBNLzngho4Ictphjdzt1T9My/eO+H906riZF7B5
	CWqA4DGIH7naSDHKwXikJIq07E0IFtJDFnPyyQZsCUsYTf/E7lTUY/m9OCetJgmrRfZlSSQ3rHz
	ZTJThR93UVkWCMUg=
X-Received: by 2002:a05:6102:5706:b0:5db:f615:1821 with SMTP id ada2fe7eead31-5ecb1e9047emr2878922137.10.1767907162582;
        Thu, 08 Jan 2026 13:19:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX617rWwFP5JDkAG0NXCVTIRF1Gw7q7Tms3/TJs1fg+8kkPdf5GNQ0cmPYO2937oiV6debZw==
X-Received: by 2002:a05:6102:5706:b0:5db:f615:1821 with SMTP id ada2fe7eead31-5ecb1e9047emr2878914137.10.1767907162238;
        Thu, 08 Jan 2026 13:19:22 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:19:21 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:43 -0500
Subject: [PATCH 25/27] phy: ti: phy-j721e-wiz: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-25-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=LzaLThjuJjdtJh34gPTyvntKRADSiE+8sGiCKAXic3I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5HZ5r61aU2PR98NOoZ3h1Pop1Z/a8v0V7hmw7A0xX
 q1wbgtjRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOZKs/w3y/iUmSjxwW9bLP6
 OdvPy2x47fW2563qFwvl48qMd077qzP8D1ub9qLrLrODkPZ7g89r7B9cKWuZmDh76bPQfNkquW/
 G/AA=
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

Fixes: 27287e3b52b5 ("phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org
---
 drivers/phy/ti/phy-j721e-wiz.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 12a19bf2875c601c60ff5559e1554274ee215918..6e9ecb88dc8b7842745486ae8ad57f82563d6711 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -940,10 +940,7 @@ static int wiz_clk_div_determine_rate(struct clk_hw *hw,
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       div->table, 2, 0x0);
-
-	return 0;
+	return divider_determine_rate(hw, req, div->table, 2, 0x0);
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0

