Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B32D29B1
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754864088; cv=none; b=C6XXBreksI46rVqynLPvpzOypuGqvbN0O301XE4RHtx8D48dps8JnHRr2URC1rCn5kuSd4R26pogqonPnS7W+OMf858+QIxaXMmqKqnXZUTJXneE/lfn19oAlyLcL5h5HupyhdpCZ2Rtk6gpGv8Q1p5G4URoH1x3J8j+S2paroI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754864088; c=relaxed/simple;
	bh=jz7/9LA5nqtTc8DEmJ3tySqiNMryRr+zseg+ZWr6gdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zox6ATm89KViXF/5TjLzuG141pdY7U4Dzf0On6cfnyICB6kKYScdqcMxqb1ok593R+JbjNqY/GrCKeiHgDQ0wQNJJZVQ/CHOOnC6pciuj2w2o+yuvWYYB10sFCHDVV+aWyi4Qgi9WkABd9SG5Y5MgdEU9EpZOElAVkwyq2NKuz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H1WNl17D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H1WNl17D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754864085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2GwKtVFUrlpaPE1JQwv83mROvsduJB26dF0XiBC388g=;
	b=H1WNl17DMVyV++8z/n7by23GwY/WGf+1fbW+o/WAjoI4+UYXcpkvyFV3mGnBoFpApmIAik
	idVxihdhBpp5+5fo6W9xpI8tN5VtIK4KgUeLmIvApC0O1idPx8hCYP8YLS6ZJELTR/DRyN
	ueb10GCB7Jyt2oMmcROFzMyLwLDajno=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-LyQ38K1XNMSyYU_XkHtBEg-1; Sun, 10 Aug 2025 18:14:44 -0400
X-MC-Unique: LyQ38K1XNMSyYU_XkHtBEg-1
X-Mimecast-MFC-AGG-ID: LyQ38K1XNMSyYU_XkHtBEg_1754864084
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e7ff9e2738so850525385a.2
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754864084; x=1755468884;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2GwKtVFUrlpaPE1JQwv83mROvsduJB26dF0XiBC388g=;
        b=CF2Z4icCx4UAH3/yCjCCIqNf/9kDN0rXZNEpM/slPXlBoMrEzt9/le0xynf4E43TP/
         XjOrWOvGr2ZbgI0ntvGvfyhJfubviELf5fTNU7n382A9r8WxBBuBwAPq3s7C1VWfzkD7
         EQ7vR64tR0144rce4gwRnDzEXQrTIOefNvJbl/7C7zAaYL5+1U2yxihT8lSjLDBC/wze
         2PA3YkTUtt2x4hw8MvP4Lo6lYIduHurnndC1rGOhVgOoffmt0xvb5jhaAaFCtG596+qX
         S28E7vXvqH0mKeU1eDTnmObfWcho2HC30n7KDZJW52O0wke7RbFGA6NVSdx8OYTUKyaT
         rEFg==
X-Gm-Message-State: AOJu0YzbIn2KHU0LlJnbBiVtczcTBSsSDjU7oh+DaQpGjS1FTIof/eQL
	7WlSLILPX2KnpdKeYTG9wy/WMnWOe9JVahyjMl107vRJNyIEOnQWgnyHNtWQ1Jyf9j1RqOwuIDX
	99RGvCmoHGGLkyuKvXu2wPIi8ZOXtlmXKi/KkQZkhmeL+tYK7+EtXsINLDvV/TA==
X-Gm-Gg: ASbGnctJODHHtAp5FfOhpZP1lX9MKjWFcDUnmqHcRgF4zfNvMNnLZf38LYt/0tbLqEs
	ayG1MfOVUln2ZI36Kg6S70THxEuMxAJogQuk6qYQjFxmSC1F0UzmOsC8K2ELnAwBHgewlmxFydW
	zLFvMKYsnRM1JBPxCKtmQz1rZNDBGW/LHEBimm3Y1JIoOFMr37ULQPfebJ5unAKU6Wu1L7hjQ3z
	/nykJuKkiYrfkneaDjXgbq2DtlZ/vS0jAOyw6emShHxHxj0sUwq2mrr97CjRpvfiab3rX9DuObd
	KpCtAXuxI0Y+oydC2jz/0pdtxrK8cJIjcsle1jbE9YzD3Go3QvYbyRx53kRTUxpbS6/Y9XCHTb5
	l2vffNQ==
X-Received: by 2002:a05:620a:4d51:b0:7e7:fc32:f07f with SMTP id af79cd13be357-7e82c69ba2amr1112914085a.22.1754864083660;
        Sun, 10 Aug 2025 15:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9NI96bWeLh5lxwdnlOadp7uqXcJhAUsM8BjFicctQ3xkj0L8GeIoemwkVa7G3O4MR88fcEg==
X-Received: by 2002:a05:620a:4d51:b0:7e7:fc32:f07f with SMTP id af79cd13be357-7e82c69ba2amr1112912385a.22.1754864083264;
        Sun, 10 Aug 2025 15:14:43 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e80c0e6ff2sm859068285a.30.2025.08.10.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:14:42 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:14:25 -0400
Subject: [PATCH] tty: serial: mvebu-uart: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-tty-round-rate-v1-1-849009f3bdfd@redhat.com>
X-B4-Tracking: v=1; b=H4sIAMAZmWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyNL3ZKSSt2i/NK8FN2ixJJU3ZQUi2RjIwPLpGTTRCWgpoKi1LTMCrC
 B0bG1tQAL24G8YAAAAA==
X-Change-ID: 20250729-tty-round-rate-dd8c3209bc5a
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754864081; l=5898;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jz7/9LA5nqtTc8DEmJ3tySqiNMryRr+zseg+ZWr6gdc=;
 b=URcjH7lCRhkpxA2IIBHqR/PqogtMFfXPxQTAFLohl31GisVmeaLicg7w7s+TwY8XZ5al4vX/c
 8pFak9Mvep6DkuHVlqdJocWOO3x/W5NkOV6arKOAHnVrZR5Mh18Je3d
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
appended to the "under-the-cut" portion of the patch.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Coccinelle semantic patch is below. It's large and I don't want to
pollute the kernel changelog with the same code hundreds of times,
so that's why it's included under the cut. For subsystems with more
than one patch, I've included it on the cover letter.

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/
---
 drivers/tty/serial/mvebu-uart.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 5de57b77abdb03f2fd46b2dc7f9bf7f00c34c15e..8e52be2b34ea20634bf45c26773728af1e5e150e 100644
--- a/drivers/tty/serial/mvebu-uart.c
+++ b/drivers/tty/serial/mvebu-uart.c
@@ -1264,14 +1264,16 @@ static unsigned long mvebu_uart_clock_recalc_rate(struct clk_hw *hw,
 	return parent_rate / uart_clock_base->div;
 }
 
-static long mvebu_uart_clock_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int mvebu_uart_clock_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct mvebu_uart_clock *uart_clock = to_uart_clock(hw);
 	struct mvebu_uart_clock_base *uart_clock_base =
 						to_uart_clock_base(uart_clock);
 
-	return *parent_rate / uart_clock_base->div;
+	req->rate = req->best_parent_rate / uart_clock_base->div;
+
+	return 0;
 }
 
 static int mvebu_uart_clock_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1293,7 +1295,7 @@ static const struct clk_ops mvebu_uart_clock_ops = {
 	.is_enabled = mvebu_uart_clock_is_enabled,
 	.save_context = mvebu_uart_clock_save_context,
 	.restore_context = mvebu_uart_clock_restore_context,
-	.round_rate = mvebu_uart_clock_round_rate,
+	.determine_rate = mvebu_uart_clock_determine_rate,
 	.set_rate = mvebu_uart_clock_set_rate,
 	.recalc_rate = mvebu_uart_clock_recalc_rate,
 };

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-tty-round-rate-dd8c3209bc5a

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

