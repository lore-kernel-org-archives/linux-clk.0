Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294EE4ADD8C
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347511; cv=none; b=tISh8PJoRnD+bqEFjULOPTuRPYevjZeP3Jhef9mkCHQODUj7a2soFDJKKiwtlHSts6R7hLWHWnyryKkgK7L63aRCUDXMQa92lfnfIz2cXPCInMq9XEo8qr+M6MDVj2gw/AVdb7NCujR+X3RZhjNZw06VuOmmAkHh5zVF1/fW6qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347511; c=relaxed/simple;
	bh=Z8klcM9ysvyUh+tnotHwYsf6NkAIdCG9lZBR7PYWapA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1wlX//WumNgf1YBWlCzMHO4lBZ81DN/S4ailFDl2i9QQqD0x1at5kyAZU2svxUcwx/w+JrKis5L42dFIwL2e8c4E8pXfw76j7V3l6m9xkKUl7IuqKm5zwFDmXg7NII4UadE0rM4Hzg0ioXHw1mTSkPSrfCvtlmggD+Dq1JGBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QK+2l5x5; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QK+2l5x5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D1E9A4E41077;
	Fri, 25 Sep 2026 14:45:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A44DF6073B;
	Fri, 25 Sep 2026 14:45:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B88B102F1E12;
	Fri, 25 Sep 2026 16:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790347503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KcIHskwrC2Qg1fZA3LDIcA/kogGfT36cU3FyQbNitOM=;
	b=QK+2l5x5e5Ce8jS7qijrknw/JWTIGgJMEQODH4AMv1B8HzJU4CE20W/1fSQ8iyBLV/oPGX
	KotLR0A1eobQlZPmGN8DQQvlnY4N7wjPPFV4Jv7T4qDwCGGFOvCGkRurRzFi9zMbJFCo3a
	CLrlT/oLROtFaTOtIyw9lbmI3B6cj/sZ8ulAeO3iCP/UjyRyEYteernlWE4QqQB5jn5UJG
	bBi7IZCbs++RrrhND9xRZHdZ2ERCsbIUHabXVPNmY4BI9W9+C5vPYdv+oOOq1QaZmTt8f5
	fTMQHAO/80H+Y5Pl0HIav7+oHnzPCOJNrrqMiVS5KcZVmAYVinNTWg+sjG5/4Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 25 Sep 2026 16:44:21 +0200
Subject: [PATCH v3 2/6] dt-bindings: clock: ma35d1: Drop CLK_MAX_IDX define
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-perso-ma35d1-upstream-clk-v3-2-ffbae7e020a8@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v3-0-ffbae7e020a8@bootlin.com>
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

Drop CLK_MAX_IDX define of MA35D1 include. This is not a binding and
should not be placed here. Value is defined in the user driver.

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

