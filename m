Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17D81A9FB4
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 05:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758691456; cv=none; b=UEe51wdet6BIvj6Vy7cM0XllV9yfcRjpzEhsBmTfzmhOYxYpPwRcneBSj9W+YNLF8wRQwaEYPhJ0qo78Oovq4i8Q0IFEZkwJjJu678IAevw7hwEORv72+i0r2dAw/kG0jQOWDHaWWzF/MaAkQe6SoiRadmXk1LyJpVbHregIE8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758691456; c=relaxed/simple;
	bh=GLpcKO/W0+ajmA7P0EiMt4cna/wSKvBsyBPOdY354HU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JMkBcRN2xA5Ocp66joeeQA3+enms5s5xkFua6x4DqrulAWRvPp/R+AZPZ13M7C6ZnqqU7dzSy66q+8C8FcL/GrX96FXWp11AShaXcGtcpQcdkwRwHS8cE3xdGNG5HiSFKNluIQ6zNgTJZjiO/dv8pyDnDha/oLfYTPlHVLmUCKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hudXYFJS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hudXYFJS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3322e63602eso3639045a91.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 22:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758691454; x=1759296254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=noPe/4MDejwWFkb+dMNCtABCZ3x4I7fo5qxXPAOehWI=;
        b=hudXYFJS2GpF+s47SXTRkodb9Gwn16eedKD+SAD21J1ndqeLFmtDpT8Mc8g0zj74Ql
         uWvykvxicNyp7TDODk8qQvzVmxANjNuq/0ppoDpTlLaCsaUrVwyTpyo3NyQuQauG2M17
         O/9ZRZ36iiZlrvUgUbYQpHxTn2lqKZ1spMrABfQJZGsBeavTbixlZ53yJWrBvdK3lcij
         RPCv+AnqL98dzJGxgJnU66YwnDwk3v/GoopGg0mfkWdzWbL1+fRHsMCH6+eD0FyX48SY
         iMWjESudBxwMJEETRHKVNRsbRcDtmgRcvFe65v8XtDENWUZtrdaqJlzgyyWSIk+ipZ0u
         pNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758691454; x=1759296254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noPe/4MDejwWFkb+dMNCtABCZ3x4I7fo5qxXPAOehWI=;
        b=Zs8+jinHYNeAe8QzMGH526CffQ6oGJr/p6ap3C8qkbH0raXglzkz3Dz/kQahxW2vTt
         rCKqPVwh6MGKgcej/Ak0xwHf/GdIHa60b8/H6ItcHytCuGXHGVlbRXI0JH7ONb+RY+ya
         1bMn5yIwoKjDF+79GRb9M8aegesAIJzpIT+49WpRhUvkSMhWbmhT0c9X5zebSj/t8VxF
         +pZa8ZN+r2eGPu5cANyZjkM6AK+N2vGxHcAtCEi3MlOVF1l+cZWp3kC0IFlEhVuhsDSj
         yat1nZuWsGX07yue9eoIH4IpJ4wK7cCVQ5Fjmb9Wffc3Xlr4WTBannAb4JfvrOr9YUq4
         qbJw==
X-Forwarded-Encrypted: i=1; AJvYcCW3QRE/bJIE8kSHgSegye1KibeKDB8V/ncdGoN4EGr8VfMmeYwwtONVy1zrt8EfY4V6gOTOJ+Rp00I=@vger.kernel.org
X-Gm-Message-State: AOJu0YygnG83x9l+KkWrphnyPdGjyDX7PB5guFY910qdSPa9FP53MWjv
	euW3ElpCghbt76Wo3FR0uqE5ryo2RQguM2iYC2sAgN174eQyFm/NJN/h
X-Gm-Gg: ASbGncut6CkwW6dVne5raqMXxhh5E19HmIYP7stuv09GHf1c1cQUcBKB5IwlOvb9pvE
	Esq4RTmos7eYW6QhdAJZhBie3f1WdrDtAUU6RtFu6x/PnhttWqO6J10yo7HB8XUipUYjjfc3tMQ
	JOH2q5S2wD0aaGOsS5AgB/4+MB+eFOJtrKBuUwIaLSfOkdQW7FwbpjZeW2nyJ1rJBOaxFXaQmiI
	4l1+LMfXDVYaCp7Ehci9MvehZ/K61zWz91ClnR43+y4Xdyz+KSTPmmAHFANsSKJsB6t5rytwZb5
	sCIGi1a20dYggIbQ/FNe9b61Lsw2whm7sdKvkyesJloa+gCaXceSOYy7kz+U9tKxbEMva82FLzG
	hG7vBpE3Sz9tt9oEkN1EHMnlM/wGdP6VWs/hGJhXSKfHCpy7EAAQ1pXxYxGQ=
X-Google-Smtp-Source: AGHT+IFuJnZuEPigtlGsjCIYOwzcQzc+p8P/uIuUcX/dg/D4VjWbr0fvJSSNVvasfrPNhXbRbP7wwQ==
X-Received: by 2002:a17:90b:3d09:b0:32e:753d:76da with SMTP id 98e67ed59e1d1-332a95e9263mr6275593a91.20.1758691453823;
        Tue, 23 Sep 2025 22:24:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f31:8167:35e6:be:ecb1:9216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f3a9f6e88sm7631798b3a.10.2025.09.23.22.24.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Sep 2025 22:24:13 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [PATCH] clk: at91: sam9x7: Use kmalloc_array() instead of kmalloc()
Date: Wed, 24 Sep 2025 10:53:26 +0530
Message-Id: <20250924052325.48984-1-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc with kmalloc array in clk/at91/sam9x7.c. Refactor to new
API, for cases with dynamic size calculations inside kmalloc().

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
--

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index ffab32b047a0..0c0a746a183d 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -748,9 +748,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (!sam9x7_pmc)
 		return;
 
-	clk_mux_buffer = kmalloc(sizeof(void *) *
-				 (ARRAY_SIZE(sam9x7_gck)),
-				 GFP_KERNEL);
+	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
+					sizeof(void *),
+					GFP_KERNEL);
 	if (!clk_mux_buffer)
 		goto err_free;
 
-- 
2.39.5 (Apple Git-154)

