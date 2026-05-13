Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8D357D0E
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663370; cv=none; b=ds5TWdbYBqFv4/Fx4RcXILiV/61hoiWnRkL4cktZQeMZYq+V3lyefKGMCC7Xb1aP+bE/s596qJV1R9jTm0yDcqIaJCUJ0g6nUD+iS81461cbMUul5kwFSlDYmYV/TaPthztY175L8ZoHaS1S/DnSZ6K/SUeVN6EBOa04f6Kavfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663370; c=relaxed/simple;
	bh=zXLDoiPitG4hQpATiZmFF2jKjG6+GncBlC6dn8b+3eI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cjde0MaI7KddUhcnncPWTBp4qkdM/1oKKrRHV3THolzoiQF6NH/D2Lq7V/TiynqqQhNxkgPpzYHTyucrYgj/g8ceQgpaL3hht/OxSNp0gBgnLgAKj+/hMbnMpnBpehzIWgmE1P1fD6X7IOazpeD7mLROhCXdO383+YzP+kXE0e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZiSoFKp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZiSoFKp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a8f97f6bso9191405e9.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778663367; x=1779268167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoYnG+jVemCKfDia3hV2uX7KnTcLeGcvlho/J2VVvCM=;
        b=UZiSoFKpowS6SPGgwu28XKcwpr0lVnqiOC6BVnHlr4BGf53dWQvbZ1qGtC4NyRmLWn
         WflWwmUs4S2uiGLNSGMmjjlEANhbVRDiQ46+4ElsyYucSCPE9MJaUjOCftXkP+COfevF
         8Lvc2ygumPe5DTQ+rzLz96pnzUL/+P00EvBxWwa9iLTeCcjCpmCnK9UqxFo0jvWCc0fM
         igte+DIQL7UMkLhJVayJz2rueg5RTLEgnxHoOQXYwB1mrko62w36k40cZhUr/ck66n9A
         z4diKv4igZxtNI9SMU1BOof/7KcnxXyfIUhd+fR35UhwkQ3IRCMgCjTPWpJJFyxth0xV
         qXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663367; x=1779268167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoYnG+jVemCKfDia3hV2uX7KnTcLeGcvlho/J2VVvCM=;
        b=gIer3VsJoUpCftmwrEO2CdrNby6DE1bHtNN4EnK5R2vRret+gtrtfA9nVibJBrqmhT
         CAJBN0CiZ24mI6pLnEmoEaWzLnqvV6PM6gKLabGWG5C6Lpjug33ZI4JGqmP/HrY+b4ZB
         UanLDMNO9Kr0MV9sq/YNlilJUClIpbMqmyuJbEso7O0LIk5F1qynWiYcCpo9LUM6k86q
         Gs2O/XG5TC8FY2xf4WJJm0J0KCKVTmHYg5a3saXedNYKDX3QKGfpvPZeKTdZmOvqWcA0
         f6oeF2d1qqzk+wmFJMqVfUA+up+V1cP63Mgwghonzk5lv5aN0B87IRaDtQXtEsjkjLrX
         sfnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Hkpo7LvDn2OTKla7F5PxdJb+4enXg6Jt3a6eSh2729B9lDD9vcy6gQlFNccUu00Om5dMgM1fvR2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypwk8ZRVlLAgXwVhtUNPE7kX2BB1T+7MggLY86GWwd2f02uM30
	eiu2FfW41wSDyqKqV9qIz6yljGzZ7rLk+qYiw906CjFstrzJX74oeLY5
X-Gm-Gg: Acq92OFL4W7Ge3sNOp82cGjOIcrKLE7otgyPtgPT34ErgCOsI09McPuYF3y4ogyKYKt
	5LsPjgHisjv05VPVFAMqfMbQFA2du5qH1lyL9QcwlZtKZ9r2UGJDVPcD+eyIXkMKUhNf32lVSwK
	UJkF9bGEuJdNYBKKce6l6F2lOVwpqblHigqM2j+DP2aqoHWZwv6VYc/P/YnPcL6Ks+0UWGhTISx
	c3SDLAp6xc/maM7oR5hjMHTCQunxO2DSkFRJUa/aK/od2a9Z37SrC9Lo0F8LDgk13WGWbYV1BJP
	zb4whvy7IGBxKtpkjGepcCAqPcQBbg1/0pdfKwGcL31qIZ5yS0vH9Fl9+2fqzUitGIWfwXjmJI5
	9ZqdZQUJm0dpktSz43V6b5GlcaQK3QAGAmxKo1t8j+dGQpi9gWm1wFwfRYklMO3Ei/+BDl8qoIl
	+dYgMl/vyO81n1ImfUK2cG0gSSynJ27YqoEbOg1sNUX9E=
X-Received: by 2002:a05:600c:1910:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-48fc9a09523mr17069725e9.1.1778663367456;
        Wed, 13 May 2026 02:09:27 -0700 (PDT)
Received: from localhost.localdomain ([94.158.58.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce065732sm30871365e9.6.2026.05.13.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:09:27 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: sudeep.holla@kernel.org
Cc: cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] clk: scpi: pass child node to of_clk_del_provider() in remove
Date: Wed, 13 May 2026 14:09:00 +0500
Message-Id: <20260513090900.5323-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scpi_clocks_remove() iterates over the SCPI clock provider's child
device nodes, but passes the parent node to of_clk_del_provider()
on every iteration:

	for_each_available_child_of_node(np, child)
		of_clk_del_provider(np);

Providers are registered per-child in scpi_clk_add() (via
of_clk_add_hw_provider(np, ...) where the np argument is the
child node passed in from probe). of_clk_del_provider() looks up
the entry by node equality, so a call with the parent never
matches and silently does nothing.

This leaks the struct of_clk_provider allocations and the
of_node_get() references the helper takes for every registered
child, both on module unload and on the probe error path
(scpi_clk_add() failure for child N leaves children 0..N-1
registered).

Pass child to of_clk_del_provider() instead, matching the
pattern used by clk-stm32mp1.c:2350-2351.

Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by SCP(System Control Processor)")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd..24cee7c9f 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -258,7 +258,7 @@ static void scpi_clocks_remove(struct platform_device *pdev)
 	}
 
 	for_each_available_child_of_node(np, child)
-		of_clk_del_provider(np);
+		of_clk_del_provider(child);
 }
 
 static int scpi_clocks_probe(struct platform_device *pdev)
-- 
2.43.0

