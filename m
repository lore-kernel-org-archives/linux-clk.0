Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4137D328600
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484163; cv=none; b=T7PbDDAeW+2phE/sG4Ovv0v6HKo4U73ZyNfoNfW/MHvCSoMSVs5i+XwwGu2gOXq1FGXiWd/UpUVmyUDJtHc7a4mLLZqAE1LACntU9+bivIUMQrRnPKPvyfpr22tB4Tg2+/2ejCyJjQ9lDhjBDteWTEFAsOOz6CX2eAW/Sc3nTew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484163; c=relaxed/simple;
	bh=H3w2FgxOSJvqVuj+SXiEHLgoCWFljus4cGldBzKIl24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4RtG9c2cJzJPtiaQrq75BHQLlRE2CD4+/oR6U6IRtUfKO49wiGx23NLY8V/j+ixvR85jXIDESr9CMfHs2YmJaNFqj8Jbk8EjXH6binpKRD4keXba6rOSVZ65Blgkrevxy/iJ8K8gp7/B95Nr0e7YWJ4V5FAVM86RnbE4ldJLAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DaMMBtMZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DaMMBtMZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E2DA81A23A3;
	Tue, 23 Dec 2025 10:02:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8CE960716;
	Tue, 23 Dec 2025 10:02:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68EB310AB09B8;
	Tue, 23 Dec 2025 11:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Zfsq2Q0KKHFsJh7C/6RUmQNJurLVBsixLOXVYzrljE=;
	b=DaMMBtMZOq1VXdZpP2Fep0Fzf2JTO+qgHfkdz2TnPJIwRRYUbfCdMkv982SUUY6UlIqYcw
	klLIarVn/Lf/tQ30sUTLc/PQfJpQxsaqWgXCdeuP99KM+vWfmb5zajq3n3aNDpJ2vxn+B6
	CHXcJ/7N01cu+D66tUUkT5N2iIGHKhQ0SctWHrPgcyPKMSHzIuorraxbWTRFwUus8DNccj
	us5RkMlsOLsk/4/igRVCm1Ejbal8MZbRd8SiZCSzegQ5lkbHVKlITGBYn7lj4vmuFc3Mya
	ludidOv2V2SIL0B52y67OAWybbHXsPv8LQQX7uMdSsJBEqH1vcqBp5NYZD+SjQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:18 +0100
Subject: [PATCH v2 03/13] MIPS: Add Mobileye EyeQ6Lplus support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-3-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add the EyeQ6Lplus to the group of choices for Mobileye SoC
and set the kernel load address specific to this SoC.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/mobileye/Kconfig  | 3 +++
 arch/mips/mobileye/Platform | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/mobileye/Kconfig b/arch/mips/mobileye/Kconfig
index f9abb2d6e178..8a4868d2e28f 100644
--- a/arch/mips/mobileye/Kconfig
+++ b/arch/mips/mobileye/Kconfig
@@ -12,6 +12,9 @@ choice
 
 	config MACH_EYEQ6H
 		bool "Mobileye EyeQ6H SoC"
+
+	config MACH_EYEQ6LPLUS
+		bool "Mobileye EyeQ6Lplus SoC"
 endchoice
 
 config FIT_IMAGE_FDT_EPM5
diff --git a/arch/mips/mobileye/Platform b/arch/mips/mobileye/Platform
index 69f775bbbb1e..93b533492b58 100644
--- a/arch/mips/mobileye/Platform
+++ b/arch/mips/mobileye/Platform
@@ -10,6 +10,7 @@
 
 load-$(CONFIG_MACH_EYEQ5)	= 0xa800000808000000
 load-$(CONFIG_MACH_EYEQ6H)	= 0xa800000100800000
+load-$(CONFIG_MACH_EYEQ6LPLUS)	= 0xa800000108800000
 all-$(CONFIG_MACH_EYEQ5)	+= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S

-- 
2.52.0

