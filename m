Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A83346A7
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907060; cv=none; b=n2dtQPr3wk0V+nUzBKAfIB65CQhtfEfrALogn+OFJBAvCbki9gDY6dlkERdNvGwINEnZ4xBDdXgduS4nCTrwzme5dmdfr7Zgjr2LleQlMz/tNbxf1Daqo9iDIYZruXxwpNoC0eiA12PC7d5FZQWjhJSJgbvAIQHchrkEAF/c37c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907060; c=relaxed/simple;
	bh=nzjUX2UpZ2i1eeMykuusgP1Jrs5n5Ls+16scH6BzdF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEMG5OUYyyYD7NC2FnWGBHNFK1b8tHAmx5BFb3Ek5RqQCeHOt4QNjFNpfjgsAFicQRuF7gxmCvguKyn+Gjt/e5OvCuRV7fktsFam0O/BBoH6Kd4+2IdEymN9xpWFKDDZfp++gZ5vXWULYIKkg+P+o8yrvRT5Xa8eeSpISFet12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2Fwscpu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B36QCKt5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2Fwscpu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B36QCKt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isTuYgACeBQ4FzUudAdIXG1/HC4FrJOsqYZ+hDA0p/A=;
	b=c2FwscpuNuJGFmM5NLVsLtmD0THAI9mWxqUh8T/6XUbSo9BYjCFpe2bA35TWrMFl8sU2yh
	lL2Auwho9/WBTcHVamFfASJ+0TalmuyUL5hJreTVqSDrHD7/W8GV8IMhpSDnQTvoKLc0MQ
	RJghBkZP4ERDs4xrBxVQmXwOeIYGxzs=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-G-tCpYyCMuWEXNEHpgK9Rw-1; Thu, 08 Jan 2026 16:17:34 -0500
X-MC-Unique: G-tCpYyCMuWEXNEHpgK9Rw-1
X-Mimecast-MFC-AGG-ID: G-tCpYyCMuWEXNEHpgK9Rw_1767907054
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ec38a3265aso6064413137.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 13:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907054; x=1768511854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isTuYgACeBQ4FzUudAdIXG1/HC4FrJOsqYZ+hDA0p/A=;
        b=B36QCKt5iuO3wa8TinpF6Cm8pVuPBQmK7ibIwQGrejBYLCR6+Kk1TXhLxGffHOS8j/
         Sxl1rJnbj6xw6mQrC4OzAoGFS8E6nPddIgpEdPchxyHsH64UMVwcYi4m8+b7NTdr5RIb
         MeOoN808InWuZqQtGWLp07rYWbOFrki+id8LvNKJkUbbg0pSuQIz2Qx9+cvJhO2/WLo4
         95CqBN2olE/JaWfc9qK15YJbJqYGJipAvlh4i3ql48kdo8HGB/ppGYdBOQsepdbsvZSz
         ff6q0/GrD6l6sAGtC+jQiiRixskBajQFNLA6/6jfh0T2l6DEvgPVvJUzlmS5adsi/6hD
         uJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907054; x=1768511854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=isTuYgACeBQ4FzUudAdIXG1/HC4FrJOsqYZ+hDA0p/A=;
        b=ZvN/8w7SP3cPzoxLWNGK+NxRbmyXdCw2DljcK8a6jRfuvY55s5DaVWB13rCyBpv+su
         JIY4HdEkEIb8KdUUzFSlI1PjpnheC2xl8d845cqA2zACQXSHmm5a8Tut4nzj9Tcaltq0
         2ThiA0Oy+B8oAE0JdhXmDB/zNLiDJiXdg+picoZD4LNvZxj/+ubi+v8Kvxjql4k/2Lfp
         uCBQvhCUp9g21oI6aS4Fl15xG+w+jGN8q/P9TEXy7FfuuEKHitV2YdvyXkhpiIENp+qK
         aASqkS4Njz1p6trhlNxucq86qsMU6RZUqKxbs5QqkixLluWx5SJ4nRaNnxP2KlLnqM/L
         v5lQ==
X-Gm-Message-State: AOJu0YyC/MQZBHISjlD0XCL6JOl2+9pwyhiCfk+K/G6GO8XidOsLEjIY
	A7Io/H1UhGAaWZ33APAG3M9OdrkKQ3Uptv7i8So4FyD1ELEi8ALHJ//8hekHDaKoZmv63dOsi6D
	/AdgBASJLLGLvc+peKTNWDTPWiyA6HftuzZmKXVxPheyLPkgz6DQk2QUvND31fQ==
X-Gm-Gg: AY/fxX72hbgf6EKBDgnBP8RbbCo1DuxIJKgSZ3xecTtaX9187DMLmV6QIcyL5ReNwKI
	agKHbvwv7cYfyLGyLSpgLJ2HQe8SHs3W+GpMIsYfBPwpvzX3ew2K2FPRVMuVskRb9DTCKJA5QDt
	u4ZRZTCF6tSkXzhevWPLFdiTbwzRdsltIJMmyDKl4x8HHbJ3kb5N6PcBlKDvAkIgoN7+uzgQZxc
	HQkEDvhuLPYPlIjHl8q1TwBZ33CMXJEdHO2TKyuVCIpv89BW2a3k7AetkUT/ZgHzZLqlGXD/5BC
	CBEuLRwImBZzFJ/fA6L6km2p2P9s/OCRZUOTy8G1dt5Q2dhmGcTvGHsqQ4VERXJrwKd576/+vFa
	8WvRrxDj4iIqCQpc=
X-Received: by 2002:a05:6102:604a:b0:5ee:9f71:a17c with SMTP id ada2fe7eead31-5ee9f71a37bmr1208261137.14.1767907053817;
        Thu, 08 Jan 2026 13:17:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4oKtCzCZndKrddm3vS5yqzMlQVx1nyfHkPTEyP4m4LPypluHrmg5ASUY2ZnBplJ4DMuaw1A==
X-Received: by 2002:a05:6102:604a:b0:5ee:9f71:a17c with SMTP id ada2fe7eead31-5ee9f71a37bmr1208245137.14.1767907053507;
        Thu, 08 Jan 2026 13:17:33 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:32 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:23 -0500
Subject: [PATCH 05/27] clk: actions: owl-divider: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260108-clk-divider-round-rate-v1-5-535a3ed73bf3@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=nzjUX2UpZ2i1eeMykuusgP1Jrs5n5Ls+16scH6BzdF0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5LapmYZvChNsD23gXmzdcGBl0oKn5atL5O7JN19sP
 HJYIeVARykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM5sYfhr8DqkoLHH7hmVTYV
 e5QlzFNaMi+pt4z/9w2ekzceXr6YYMnwz3zzo7IbEk4KAQ95bE4KXOZLct3+0a6Nj2v1C6ccoQ4
 7NgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed. Additionally, owl_divider_helper_round_rate() is no longer used,
so let's drop that from the header file as well.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 1b04e12a8bcc ("clk: actions: owl-divider: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: "Andreas Färber" <afaerber@suse.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-actions@lists.infradead.org
---
 drivers/clk/actions/owl-divider.c | 17 ++---------------
 drivers/clk/actions/owl-divider.h |  5 -----
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/actions/owl-divider.c b/drivers/clk/actions/owl-divider.c
index 118f1393c6780f287d26736b2547a8b43751655a..316ace80e87e3b1c22a4011e725644cf37668e5e 100644
--- a/drivers/clk/actions/owl-divider.c
+++ b/drivers/clk/actions/owl-divider.c
@@ -13,26 +13,13 @@
 
 #include "owl-divider.h"
 
-long owl_divider_helper_round_rate(struct owl_clk_common *common,
-				const struct owl_divider_hw *div_hw,
-				unsigned long rate,
-				unsigned long *parent_rate)
-{
-	return divider_round_rate(&common->hw, rate, parent_rate,
-				  div_hw->table, div_hw->width,
-				  div_hw->div_flags);
-}
-
 static int owl_divider_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
 	struct owl_divider *div = hw_to_owl_divider(hw);
 
-	req->rate = owl_divider_helper_round_rate(&div->common, &div->div_hw,
-						  req->rate,
-						  &req->best_parent_rate);
-
-	return 0;
+	return divider_determine_rate(hw, req, div->div_hw.table,
+				      div->div_hw.width, div->div_hw.div_flags);
 }
 
 unsigned long owl_divider_helper_recalc_rate(struct owl_clk_common *common,
diff --git a/drivers/clk/actions/owl-divider.h b/drivers/clk/actions/owl-divider.h
index d76f58782c52885a66c96e8bf13b0dea3ba51efd..1d3bb4e5898a3ccf729894533ae194ac4c34b6e3 100644
--- a/drivers/clk/actions/owl-divider.h
+++ b/drivers/clk/actions/owl-divider.h
@@ -56,11 +56,6 @@ static inline struct owl_divider *hw_to_owl_divider(struct clk_hw *hw)
 	return container_of(common, struct owl_divider, common);
 }
 
-long owl_divider_helper_round_rate(struct owl_clk_common *common,
-				const struct owl_divider_hw *div_hw,
-				unsigned long rate,
-				unsigned long *parent_rate);
-
 unsigned long owl_divider_helper_recalc_rate(struct owl_clk_common *common,
 					 const struct owl_divider_hw *div_hw,
 					 unsigned long parent_rate);

-- 
2.52.0

