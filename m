Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B14536EA9B;
	Thu, 26 Feb 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112880; cv=none; b=eWAVP0aYfs7B+2rYiGGqIXGYjVVtgc1YrXH7jSGU+Pj4C8o0XI/8bE4Pqxl6BVCgLVHAhPld6mX4LU6NA0sEZ/AyweZi1i6zBSACImwAboUQKDJgyBBlbTmyAfRS5gshK2viS7wNjmwP0jo1iYUoo2l/5YJH4/x3gy3Jv7k6OSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112880; c=relaxed/simple;
	bh=HiF5B4Bc73eHsZAl9unZvix8uUjE2fsep39CeE6Z6ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9TieInIem+FuGmhBCmJM0lXZl1g3VIrrGOSqKVKdgHS6mNDaUDxIJbMDO4zGF/E/H9YsvuBGepI+s3GI2KkxxgLCNg3t2/Tba3v02Za5TpM2+oJaoOv0senp5uFrKgNzWNNQ8d1a9G0Xs5dRVmYO+6T2QejpnmxsX58suLX5bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AH1l4KLL; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AH1l4KLL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C5E754E4122E;
	Thu, 26 Feb 2026 13:34:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 958ED5FDEB;
	Thu, 26 Feb 2026 13:34:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FF6410369392;
	Thu, 26 Feb 2026 14:34:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772112871; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t13fTL38ybBnjcJkpfx+K3cUGVZwn08bqofOvp3rY/E=;
	b=AH1l4KLLPMyktOFWZ+2Z6SPEKJBn6p/HlIp7zSpNTfFZn+eh+Pt++DX3IdwN9Wn5EaNnXw
	4MahGo6lCSqWQ3Zv47u7h5NgFKeStmbKZuZX9ZVJnoC+p/FT5lAwGSncTVq61+zozrGV+U
	X2llSZdMjYiisEBU4Yy8DitwSbTI7q7UNPrPiRYfFsQqzIK5G3RIjyjgKoeq9sR4Jk9jXb
	0pIVEZDrHq6pdouRtmGeHK65EW6TYak8UFEQUnWawTXFzn+GP8MolGdfi7yDzkBFPWIoc1
	XSOysRW7hwJl4cuPYiqjXEDw7RRNROWzH8IxNsvB/iG4pgep2Z+iTws1JkMk6g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 26 Feb 2026 14:33:57 +0100
Subject: [PATCH v3 13/13] MAINTAINERS: Mobileye: Add EyeQ6Lplus files
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-eyeq6lplus-v3-13-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
In-Reply-To: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
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

Use wildcard to match all EyeQ defconfigs under arch/mips. This covers
the newly added defconfig, and the EyeQ5 and EyeQ6H ones. Add an entry
for the dt-bindings header of the EyeQ6Lplus clocks.

While at it, add myself to the maintainers of Mobileye MIPS SoCs.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..63048d5ede7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17802,6 +17802,7 @@ F:	drivers/media/dvb-frontends/mn88473*
 
 MOBILEYE MIPS SOCS
 M:	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+M:	Benoît Monin <benoit.monin@bootlin.com>
 M:	Gregory CLEMENT <gregory.clement@bootlin.com>
 M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
@@ -17809,12 +17810,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
 F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
-F:	arch/mips/configs/eyeq5_defconfig
+F:	arch/mips/configs/eyeq*_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
+F:	include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h
 
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>

-- 
2.53.0

