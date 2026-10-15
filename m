Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4385592EE;
	Thu, 15 Oct 2026 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080166; cv=none; b=shcM8UFNKqkjvRP9OLFmhUViV1fqcA2wa7EAYkvS+Fa2Ftqrtc/c1vUP8CIj/vdPJ/s2KGMoGyCMr/NWCrgVcfV3ZivKqXEq9lv8wN1Vx6WcjXQY/obAzsrRrBtPmPm0ympZHH0mw3Xt2pZ79HFA9x9q9uu8Ppg5FszQ/mh5uz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080166; c=relaxed/simple;
	bh=ntgI1uFoKmwC0j7KbZiA+1P/H021PU59ERAZPtAvuVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RhkYgJaWUaa03u23OY6sF8idqhLtBZgPg5o95ojbacQJnuD6kB05kDWSH827ftyWFn/Oo8S0a6m33HAPjgWmy89oPgAvA1oNLfheYotbKzTGepIIUDl8pIOpA6PSjBx2cCdFJ5CaXnCc85KHl6gHF5CjuqAhB51oA/yodfh/FGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KFhvYlcJ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KFhvYlcJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0667A4E41249;
	Thu, 15 Oct 2026 16:02:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE53A6075C;
	Thu, 15 Oct 2026 16:02:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 525A510328BDA;
	Thu, 15 Oct 2026 18:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792080147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oUZJWgh1jtbi+p1yrcW64LX48+HiL8UrWIoerSJqBPI=;
	b=KFhvYlcJ9F22guPUjZxJPxJYLAH9q4fjgmaXZ+8gV7KT68G1HOHtoBIeUiFh+ixPw3Roo5
	oFbNqrPTplqQq6xi8B/x2Urk3sfAVW982EqN0D6CY2+6iJ0baGIkhkKLbKLFofTbUuN2Uc
	Se1egGcwX1g2Tg9KvjMZs8klYroS2EpC1wlTJDQKbnHJYPHPsYteX25gKW4cNApXIg3zhQ
	H6iUIhiB3QkPHRwmJloogKIgpz4v1R/dbfE0nLObxtAgmBE3WzC3BdS+kIyaV8qe3lcABn
	giZHno8HDLemMMbzlZ/+Fb9cSVSYTWEbjcTPYoTL6iYRoTp6qDDzPQ7w5Gk4GA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 15 Oct 2026 18:01:21 +0200
Subject: [PATCH v10 08/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-perso-ma35d1-upstream-clk-v10-8-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
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

I have the platform, I currently use it for my developpements and
therefore I care about the clock controller driver and the SPI
controller driver not being constantly broken. I would like to step up
to help the Nuvoton team (not visible in the diff since they created
an MA35D1 catch-all entry) in the maintaince of this driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6977bc6245b0..c9f482b5edd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19541,6 +19541,14 @@ F:	drivers/nubus/
 F:	include/linux/nubus.h
 F:	include/uapi/linux/nubus.h
 
+NUVOTON MA35D1 CLOCK CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/nuvoton,ma35d1-clk.yaml
+F:	drivers/clk/nuvoton/clk-ma35d1*
+F:	include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+
 NUVOTON NCT6694 MFD DRIVER
 M:	Ming Yu <tmyu0@nuvoton.com>
 S:	Supported

-- 
2.55.0

