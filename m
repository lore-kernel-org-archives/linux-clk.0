Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44471346A14;
	Wed,  4 Mar 2026 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637982; cv=none; b=nFVZWcb0j4WKlQI4z1P4GQtSKgKBtpSDblsqQMDged7KP71itkqetOVM+jX1CN+WjQKBJoGrPI5AYdElvdp+Cmc/JiSErZycawaa4VjTKPjvtkuBG6x9ef4uS4Nvi+IHnZWx/C+/FOCz5f0IQTBtlJk4kjTzNVex3u/sUmgXvds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637982; c=relaxed/simple;
	bh=oeXM94kV6KHPAXahFiulkvM6OwqAeFx4teAXmvi9pCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfSYLv7yAuEKOpuj0IPDEpXoXFCV8mX3oAX3hzRxZsQ9pZOm9p8tekcwKKKgr0POUApdXw2MhbMYIjzKDggOSLOzDZHaKN/+ckWiSmOJtYWfZNE/1U3LfZkXD93vF/gLj02WTx7VSgO59Cm4OzBFx7Qsb5YA4CFEUd2UGy24pPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nSRBIKPr; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nSRBIKPr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D77794E42543;
	Wed,  4 Mar 2026 15:26:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC2FF5FF5C;
	Wed,  4 Mar 2026 15:26:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE875103697AE;
	Wed,  4 Mar 2026 16:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CQCPdFYuBjBjLSKu+vdlGdK6ZBcUmbZ+RsQ4S72GLlQ=;
	b=nSRBIKPr38NFab2uSfgMDC9MoRS9I59s+LdEf3oQGQKkDn0HN8XO01iZWimLJW7Nlsje09
	2UM6j7/J7yQ6xSUtS1y5frzCMAMcFsLnygVsuyJLnqmAWaz5/CprwtvrIUgpfDSVboQF+f
	r48gcaZ3VuJjTUPfq1TeivhuBzd43hGXDT8ZapR8ULsmAK252QL+Tqlgl553bBYEWTtSvN
	f4A26uDlW2MezHJbcfVbVVKt8iHTrOieVEn2+RcNwISMT+mOX3MgXtObsLND0E2ZvQkdtY
	8pz9Nd6eu3Km3jfsJVuK0+1uPCgkYtnyPN9FPrM7fqHna6vvIhKQnkhJ45I4aA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 04 Mar 2026 16:25:24 +0100
Subject: [PATCH v4 10/10] MAINTAINERS: Add entry for Mobileye RISC-V SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-clk-eyeq7-v4-10-9d6bd9d24bec@bootlin.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
In-Reply-To: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add Vladimir, Gregory, Théo and myself as co-maintainers for the
Mobileye RISC-V SoCs, and clarify the dt-bindings entries between
MIPS and RISC-V SoCs.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 MAINTAINERS | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63048d5ede7d..8ccc99b44850 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17808,7 +17808,8 @@ M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
-F:	Documentation/devicetree/bindings/soc/mobileye/
+F:	Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
+F:	Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq*_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
@@ -17818,6 +17819,16 @@ F:	drivers/reset/reset-eyeq.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
 F:	include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h
 
+MOBILEYE RISC-V SOCS
+M:	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+M:	Benoît Monin <benoit.monin@bootlin.com>
+M:	Gregory CLEMENT <gregory.clement@bootlin.com>
+M:	Théo Lebrun <theo.lebrun@bootlin.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml
+F:	include/dt-bindings/clock/mobileye,eyeq7h-clk.h
+
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Petr Pavlu <petr.pavlu@suse.com>

-- 
2.53.0

