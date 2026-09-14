Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F9A3D1CA8;
	Mon, 14 Sep 2026 12:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388251; cv=none; b=ms9uTlvXPrbo12uQGRyV/+RXiI7SXq27qEGfCdOW+6KyRc3XWYxPR8YxPEpWL7KMRMP5JdpdZ7Rv4bv6SNFM/BqgII1oZuBwJDsp6beGnFNHGFvyLxbbbyHKUJAWUzVaL93HC6kc4mHHqjd//13gDosMxj/kVYb7TyqNL8u1so4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388251; c=relaxed/simple;
	bh=KmGPQR4S02xDOn2hhuDGTCS97bgDBDN+cTwq1SD2ge4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TTV/og5TutwG+Xt0R4n++t3Sz/7z5/6O0pWvQh+aIN/SBXV2/KHP1qzdvx9kxbvL/try2qDZfj/RDVI9YuT3FGVhlik7+Dn5ghFDy1jeN8cs6tSdm5VYalcIM9ba/jcnyajvrQbEIfrCebWL+5ej4usGyHzoA/KKZ+GhuTwPvKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bvM2ntJO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bvM2ntJO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9071C6220A;
	Mon, 14 Sep 2026 12:18:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A686060323;
	Mon, 14 Sep 2026 12:17:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B9511C7AFD6;
	Mon, 14 Sep 2026 14:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789388242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CUtz7Nrg/bGGDpfvM7FOkMnzlbWz7wOHrg63BF6Ex7s=;
	b=bvM2ntJOtWfiGF7gTdCCGXNm4N6kz1DEaR7UMFADNK3gfc+iezqLrUyBZNCULPE7Ivk/3H
	whNSsMhST8LTRkrDq8XDOm7sxB1/Gs0JUy2nCNiFbLezVy93rWsayZL9/6ZOEs/3aoJwMz
	BEJ6L6iINE4BczrNWUhlmAGEukEdjqsNHKEbbcYbZJE2w0oVYMTEmnNc56lITXoZtJIT7f
	1QDa336nkIUhynQFrqcIfiGwZF5uUq3LOg8T8jHwQkBlbzpxB7ww/wLSZDSnqJ8eICpvjv
	nnyLBChijleXtt/+BRIsQ6tlAt2cZcn80h89ZxHBG6XG6WSS+ARXN00jDKlvOw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v2 0/2] clk: eyeq: Reserve OLB memory regions
Date: Mon, 14 Sep 2026 14:16:43 +0200
Message-Id: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKvlp2oC/1WNyw6CMBBFf4XM2jFtqQqu/A/DwrZTGR9UWyQSw
 r8LGBcuT3LuuQMkikwJ9tkAkTpOHJoJ1CoDW5+aMyG7iUEJtRWlFGhvV6SenhgpoXPGFztvtXc
 apskjkuf3kjtWX04vcyHbzo3ZqDm1IfbLXydn75eW/+lOosS8NEJvtHImLw4mhPbGzdqGO1TjO
 H4A9qrdO7wAAAA=
X-Change-ID: 20260910-clk-eyeq-res-ddbf87fc4fd4
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The Other Logic Blocks of Mobileye SoCs are clock providers, and some of
them are registered early with CLK_OF_DECLARE_DRIVER(). Their early init
maps the registers with of_iomap(), which does not request the memory
region. On the platform device side, eqc_probe() used a plain ioremap()
too, so none of the OLB regions were reserved in the iomem_resource
tree.

Patch 1 converts eqc_probe() to devm_platform_ioremap_resource(): the
region gets requested and the mapping is released by the devres
machinery on unbind. The mapping is moved before the match data check so
that OLBs bound without match data also get mapped and reserved.

Patch 2 adds a match table entry for mobileye,eyeq6h-central-olb without
match data. All of its clocks are registered by the early init and it
has no auxiliary devices; bind it to get its region reserved.

No functional change, besides the region reservation.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v2:
- Fix early return comment in eqc_probe() (Thanks Théo for the review)
- Split the patch in two (Thanks Brian for the review)
- Link to v1: https://patch.msgid.link/20260911-clk-eyeq-res-v1-1-39b04542db38@bootlin.com

To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Benoît Monin <benoit.monin@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Cc: linux-mips@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Benoît Monin (2):
      clk: eyeq: Use devm_platform_ioremap_resource()
      clk: eyeq: Add mobileye,eyeq6h-central-olb compatible

 drivers/clk/clk-eyeq.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260910-clk-eyeq-res-ddbf87fc4fd4

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

