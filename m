Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385451EE037
	for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2024 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731569386; cv=none; b=R1v1lBpFKw2jsqncG8vsLG7EFdhFYi4bUQY9t42f26GlQIFB2Ey6GQvP06Fly6vhYCg822jAAErEtzvYbMCZB22VvawP1PeW0lQrvc1EbYi3UdCIvDKBIPnqpaHZX2vuMMw/2Y8tmffALDeTzr9Kqj6QffSFzQvEaOWrM9FFdLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731569386; c=relaxed/simple;
	bh=acBptjapK7kzPOdStc8+QYj62YMc9TrANEj3tmzuYVc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HKY7OT6AN3V3nmSRmfDMV9R68j54na5L66qebLV5Omd7x5v9waZEJ5zxNgOm+a68kmYA4rBeP8GA9D0i3N1apVnCUmRhxLha2xlp5xtVe++s8wKwc1AEYSRC5NnkJaSnLYuFt7pqnR9EuUE4psp10Lc64z5B0yP8TM/8T21XUsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id KIQ00021;
        Thu, 14 Nov 2024 15:28:21 +0800
Received: from localhost.localdomain (10.94.17.107) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 14 Nov 2024 15:28:22 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <povik+lin@cutebit.org>, <marcan@marcan.st>, <sven@svenpeter.dev>,
	<alyssa@rosenzweig.io>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>, Charles
 Han <hanchunchao@inspur.com>
Subject: [PATCH] clk: clk-apple-nco: Add NULL check in applnco_probe
Date: Thu, 14 Nov 2024 15:28:20 +0800
Message-ID: <20241114072820.3071-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20241114152821c48c35476f4317224c4d5eff58881383
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

Add NULL check in applnco_probe, to handle kernel NULL pointer
dereference error.

Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/clk/clk-apple-nco.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
index 39472a51530a..457a48d48941 100644
--- a/drivers/clk/clk-apple-nco.c
+++ b/drivers/clk/clk-apple-nco.c
@@ -297,6 +297,9 @@ static int applnco_probe(struct platform_device *pdev)
 		memset(&init, 0, sizeof(init));
 		init.name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 						"%s-%d", np->name, i);
+		if (!init.name)
+			return -ENOMEM;
+
 		init.ops = &applnco_ops;
 		init.parent_data = &pdata;
 		init.num_parents = 1;
-- 
2.31.1

