Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E64E5325;
	Tue, 29 Sep 2026 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693144; cv=none; b=dqswYaok8M2QbZypq9CNXjbbBuAykO4oFrDYYUwM3W9sRlj9KQUgtPoOogB/OP7yqeoFUpjguVyVTU2tMk+RY1nWpoGhVOc+Rrlo4PzF+XqnKbdvrz+8+LfO+rms3Gnhd1J/GaZRtAQ6GBzB1S1XmIL5Z1VqUhCsGNH7CKZWpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693144; c=relaxed/simple;
	bh=eIii9aUNfpzAK95nUANXdJ5O3qMgt8Lo4KxFT2BFwxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PzRkxqMBz5swpgZF2IhM5rrlSq7gOkuVTQFgo0VK2Z+bqn6COeD+C0GzZ0FZrvaHERmumQbf8nh/zfXQ/S9soOFmQMhJqTi2RwIQi5lfLSuy1QSCjYQEyEJnN5Bwt03B6sQ9pWoyr+VSAkp1kJz7ddqpZxNBqjKGn0fmA3YXIJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jbMgpp3+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jbMgpp3+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0F2A44E410B8;
	Tue, 29 Sep 2026 14:45:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0420601BD;
	Tue, 29 Sep 2026 14:45:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A43310329618;
	Tue, 29 Sep 2026 16:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aZlwpIBPu1P89TNsqQjaQwwNOwTKaGY+iAnuCror2mA=;
	b=jbMgpp3+CmCzAMWz4y3BTvnTpdaRff9OImQbCK5MhapufHLfJt4D61Ve2nQfXVWlSsAqaL
	UUTuIRfKWlMyeJTL2bQr+Nsioep0XvncnbAaC4UQgJO5ftMz2+sQRpKaXfI8/i+jicbv/g
	dZtlCLqNPzaHtCetQPZG+BFl8pawfmLwYN9KLh/jiXI692UNj9QKeHzhUtoH5cNJZ5veyn
	bKNR/U0vkgpjOdzh2C7PW34ZYn8RSqQiiXAd/CmdzwjCPx8yFp6KnuZT5kl8IRCiVelUfg
	7aaGsQtU7f3wbyFhF1wqQTwxXZB0TR4ExB+R5AVdNtTxanwW+mhE47lnVYtWxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:44 +0200
Subject: [PATCH v5 1/9] clk: nuvoton: ma35d1: Keep the clock count in the
 driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-1-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The number of clocks is not a binding since this is a value that can
change. As such, in order to support the missing watchdog clocks and
allow the deprecation and removal of CLK_MAX_IDX from the bindings, we
need to switch to a local definition first.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517..6aa42a3e1be3 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -17,6 +17,7 @@
 static DEFINE_SPINLOCK(ma35d1_lock);
 
 #define PLL_MAX_NUM		5
+#define	MA35D1_CLK_COUNT	236
 
 /* Clock Control Registers Offset */
 #define REG_CLK_PWRCTL		0x00
@@ -467,12 +468,12 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	int ret;
 
 	ma35d1_hw_data = devm_kzalloc(dev,
-				      struct_size(ma35d1_hw_data, hws, CLK_MAX_IDX),
+				      struct_size(ma35d1_hw_data, hws, MA35D1_CLK_COUNT),
 				      GFP_KERNEL);
 	if (!ma35d1_hw_data)
 		return -ENOMEM;
 
-	ma35d1_hw_data->num = CLK_MAX_IDX;
+	ma35d1_hw_data->num = MA35D1_CLK_COUNT;
 	hws = ma35d1_hw_data->hws;
 
 	clk_base = devm_platform_ioremap_resource(pdev, 0);

-- 
2.55.0

