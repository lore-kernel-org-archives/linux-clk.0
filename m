Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7959749C4A5;
	Wed, 16 Sep 2026 12:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560565; cv=none; b=LmHA9FweEMREC7Dcuq79tZ16Uf2toxSgcyxx2m81iIRtKPhn8ncnmATdCsp6QutwV8n/r6Bkqt6wTh1wiL+EI+nQPxqPesYhhAO/8zmXoP/XVQeYmDMYXO4h0MlGbd8uaaFl2Cg577yGtzUhJZNPv/EkyNalBTtuzfJj7UXnm1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560565; c=relaxed/simple;
	bh=VRe54C6FRbPvoEQSP/yy+xFeaC9/EYg71u6oRhkux6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FgIOS0ebXBCuQ9MeCBoL3ARgrF0RxxhSXludqGkeyh8xq4rjJTkHxc9ubj9OPCeqwTZ2dhDfqsaRTRvas8WjJWf+QcPwDD2t/v6kp76qrZ2aNmzrHZUAUGrJFq98mW0EHbTkQYPz3zOhA0MCWW+N/2D9crd577vpa8kE/LWaS9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lhOpG2yv; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lhOpG2yv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E8AA1A08AC;
	Wed, 16 Sep 2026 12:09:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3193860337;
	Wed, 16 Sep 2026 12:09:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48FD911C7AFE8;
	Wed, 16 Sep 2026 14:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789560544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tcfZBexq3+xx1Uv0GA8D4XJxPbWL0A4ePxUkLHqPiW0=;
	b=lhOpG2yvAGqAL98qnU6wMMLzXxGWLSsyxmhVDtKwTtXBBrbgaq3LYFjY6PUYjX573xp6i/
	jW8HVvVJcWtImiWmebt8UIZCW9uQRariCkoo71TwOL6TpNhnQJn6QKxlzNaqkxYhbdO3m0
	3u/VUBPMJ7itnIaKrTjI5yAjXi4HAQSju8Cd2dWrY+ix/YhYOMjh7JNo/n2kMVGwYGrvOV
	yLiBQC1wPM3qiwhKV9hsYf83BVGPVGwnrNInbCR//eFpt8KeqnrA9OgyKiT8uvCX1NFehq
	CTzQMIso0p7z0XMfrX1VbsNhya3M+b5yi8OyPOn5Cz2ljdO4x5KkocS1dCnG9A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Subject: [PATCH v3 0/2] clk: eyeq: Reserve OLB memory regions
Date: Wed, 16 Sep 2026 14:08:53 +0200
Message-Id: <20260916-clk-eyeq-res-v3-0-93a3b831a5d0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANWGqmoC/12Nyw6CMBQFf4V07TVtKS9X/odxQdtbqQ+qLTYSw
 r8LGBNxOcmZOQMJ6C0GsksG4jHaYF07QbpJiGrq9oRg9cSEU57TilFQ1wtgjw/wGEBracrCKGG
 0IJNy92jsa8kdjh8OT3lG1c2NedHY0DnfL3+Rzbtvmq3TkQGDtJJUZIJrmZZ76Vx3te1WuRuZ4
 5H/6uJP50AhLwvMNKa1rIu1Po7jG5mjrCn7AAAA
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

No functional change in normal operation, besides the region reservation.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Changes in v3:
- Unregister the clocks if the clock provider registration fails
  (Thanks Brian and sashiko for the review)
- Link to v2: https://patch.msgid.link/20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com

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

 drivers/clk/clk-eyeq.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260910-clk-eyeq-res-ddbf87fc4fd4

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

