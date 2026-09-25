Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D737F305;
	Fri, 25 Sep 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349067; cv=none; b=P37cLlYpHV3b8U//0d0N3CvOApgPaxeVq/s284h7/8NEQAAt14PAe/CqCtdDZdOlDLv3pVfoFwEz8eDl3Fq8arU6uLutsAlamit+gPqhHmYCwkODWUyPcmriQ3QuX8/y1L0MtwCYzsgZvRlapEllo7Q3tmh8HAE8RzpeCT1885o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349067; c=relaxed/simple;
	bh=Aveac33c54VMSoPoRazMKbEKgnALEPhfcxZHfFOh+H0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9WOGB95EOH3p+GlZiyJBX8dFg+m/yFvxPk6tHtjDBsRoEen+5iGQ5Rb5sk57B5hJ+q0z+d/3b0lXzkfqTImYk4nceOZ+MWi2L5i+zCsjpSCNoQX7lAU9Fg2hq3/71Gs0dfCOaEu6WIw7G1XxLeZ7ty7zOnPokhZhsw68ds+2f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V6fCVW5s; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V6fCVW5s"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 353AF4E41077;
	Fri, 25 Sep 2026 15:10:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0809B6073B;
	Fri, 25 Sep 2026 15:10:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89357102F1E06;
	Fri, 25 Sep 2026 17:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790349044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zjGwcQKp0/v2HYxfRrGpg1HQ5rLbf4a8yR8qugR11v4=;
	b=V6fCVW5svt5714a26fnbogEA6HRTKGPqYN7SRR++4eDATb8oy4yYgpbE7ZL8MUR6CzjRy3
	cx4ZR0V0PtESj6HaqGq15vVOGu5WV0wwtNgF5JY0jFPccSSsQ3k3RvWR3Cu+UgqyxjnWfF
	phKQtkzbdUeGwZa0u+pLlh4m2itgn9BtpgOPVy3Q6iOVnx+jFm1XIC72vVBXn6VUEwoTRn
	qT9ziIrme82RdHxPT925aKy6m5qnn0cM1oyPzssv7yhEcE0gofaJ82HZavRxdcjkHlu1p4
	1RyadU16JBrAL+FJ61xcgomX4nDfwlZiwDM1ay3utclBYwL5IpbIZNvmv+/HiA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 25 Sep 2026 17:10:13 +0200
Subject: [PATCH v4 3/6] dt-bindings: clock: ma35d1: Add missing WDT/WWDT
 parent clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-perso-ma35d1-upstream-clk-v4-3-f3697553391f@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The WDT and WWDT muxes have PCLK3/4096 and PCLK4/4096 among their
possible parents, but these fixed factor clocks are currently not
defined, even though they are needed to properly describe the clock
tree. Add them to the binding.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 2d6a44a7e55c..764d837d6162 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -248,5 +248,7 @@
 #define ADC_GATE	233
 #define EADC_DIV	234
 #define EADC_GATE	235
+#define PCLK3_DIV4096	236
+#define PCLK4_DIV4096	237
 
 #endif /* __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H */

-- 
2.55.0

