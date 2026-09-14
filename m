Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406E44CF25
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388258; cv=none; b=MYz8/WOD7odOJ6sXt+ffFp6yUSA/RQ1b+/UR9wuyougCfV/9mG8fzYaI5rfqyEW0D4U6Gu1Ea9gXXE2kV6EtSMWtIvB7Z3pJaJQVfK4DaHs//+5CdMrSWBdIOd8/64tNO1z9oQQXB8Dc9gNjuKG15r8QzlDIPyCIc4AyUElx174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388258; c=relaxed/simple;
	bh=7Zb7OnxO7Mny/vz66A9/MBXG57/GuFvZPzerB1j/a5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+7eVgjZOOCcOj15AngdIHSNM6+As6OUNS5ETe9KOPZ57jMeoMnvDRer+z7XWcan4mtov6fwtZ9SERVJwOGMFj8ZYvsz/uXxwTGF+TKAwF8Ms9QOOv2G6wJYB1IWa+QDTpyvoaZUucRJKYRuoxuglUOsvbv9cHS5HsSzwxmZvq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f7TxN2xp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f7TxN2xp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1B6614E4059F;
	Mon, 14 Sep 2026 12:17:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4E4260323;
	Mon, 14 Sep 2026 12:17:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAF9E11C7AFD6;
	Mon, 14 Sep 2026 14:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789388254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4ezhkt5ekErlzxGHOhL+IX2dbEJfJAw1qa/3ps0UkOQ=;
	b=f7TxN2xpPa9gp7q9ivXSxOlOLLsZOKtKg3PrSincjcFCovzqUpdCbKM7F6XMNi0bf2Zk66
	C9PTCQNXNKONh4OcE3N55tqohiWWeRZFYnpGLeY+eY/+2CTanKIenI+WDdicvGfijFvFQI
	LCPUHypneNXnjBjdOv/3KLXHn5u2yiBV81lVkC+QCv0TNnemXd5bgMOoJQnw+eJ+RPQig3
	pkTV9M8ItP62pXOqABHsHwo1FCvJHkhTyOh6Pc32FrPKV+sY4C1yQFh0Cp058xm9gNlg4N
	En3TSgqtK1EQYVpGUIKh6OkSVmkBvBmqwKtZc/mEzlVl3BpTVVwJjvQtN8sBSw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 14 Sep 2026 14:16:45 +0200
Subject: [PATCH v2 2/2] clk: eyeq: Add mobileye,eyeq6h-central-olb
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260914-clk-eyeq-res-v2-2-687e5de3aba7@bootlin.com>
References: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
In-Reply-To: <20260914-clk-eyeq-res-v2-0-687e5de3aba7@bootlin.com>
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

Add an entry for mobileye,eyeq6h-central-olb without match data: its
clocks are all registered by the early init and it has no auxiliary
devices, so probe() now reserves its region and stops there.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 3662e6990bf7..b32f251614c7 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -1170,6 +1170,7 @@ static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
 	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqc_eyeq6lplus_match_data },
+	{ .compatible = "mobileye,eyeq6h-central-olb" /* no data, early only */ },
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqc_eyeq6h_west_match_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqc_eyeq6h_east_match_data },
 	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &eqc_eyeq6h_south_match_data },

-- 
2.55.0

