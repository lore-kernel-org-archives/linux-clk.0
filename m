Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEA151AFEA;
	Wed, 30 Sep 2026 17:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789141; cv=none; b=aNZGYArz4234NAhPyvW1LvHi86scWxRrORhCgXrRYDk1Z1KoWslI0702zmTPS4EYr9cqYoPu03DVkfRCrhw/pYD4nKqRDN4aF6E4TvNNo8eTAOgE7/AgKOGz/MJzW2jJ0KOjjmtRLrrEI/nO+g1Uo4lwWFhk55A3GSWIg1byofE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789141; c=relaxed/simple;
	bh=IeGP+KKpriV8FefDDiit66uxhtaDWHtsG/9ADL1Wsl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQTxfveDtkKFx6W7FP+jkBTxQvDedJBbgACmM5yJw3vjMWHadAzPtOgiX2x89xAfEHpgsak8lyY/SJ0cHdTCTMeXn4m/1WvL0hSvgU1gYq8odnjLTrRcgkZVPu12La5NssYZoMT+tZuh3WyaKUE2vKSr92ZQucfpZ//Kt3OGKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W5IRmjHj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W5IRmjHj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E8494E410D5;
	Wed, 30 Sep 2026 17:25:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6C3460749;
	Wed, 30 Sep 2026 17:25:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8C7B1032968B;
	Wed, 30 Sep 2026 19:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790789136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QUVwPAQqcPJEXSHcvyrm5SHBCzZnkZ7JUl+/bI5Vt0A=;
	b=W5IRmjHj+yo6juCpmMM+5MO4vVfcBLCwvZveroyCeJBV6LW4BvNNajt79J3bsZf+s5Jrar
	DhxkFI630i540xFnDB1w0zEr3NzEwYs4pns5xRL+vg70yTKRtPmvmtGEGbWCuROJA01GOp
	IJeEBx0kA890ZFlZgnkTyPq03OWvHEL7zgzrMoo5HARk20p5a5TColjHEd8531AaS550/f
	f/XT9ryS64WCagoWVGPHq5KjthfLT0VyKZ/cGAxKlxo7bvNcxXFb3eU+cqHppnl4LiI5Z3
	8sztprQmaOoouYFSG0TaaEuHX1vyp6videHpWzR9piXRijKqvQZhqcZtsQQ+6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 30 Sep 2026 19:24:49 +0200
Subject: [PATCH v6 03/12] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX
 define
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-perso-ma35d1-upstream-clk-v6-3-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
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
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Drop CLK_MAX_IDX define of MA35D1 include. This is not a binding and
should not be placed here. Value is defined in the user driver.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index ba2d70f776a6..2d6a44a7e55c 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -248,6 +248,5 @@
 #define ADC_GATE	233
 #define EADC_DIV	234
 #define EADC_GATE	235
-#define	CLK_MAX_IDX	236
 
 #endif /* __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H */

-- 
2.55.0

