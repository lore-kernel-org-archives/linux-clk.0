Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33572391501
	for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628442; cv=none; b=Bg0/NXGQuQrDeZl5JcCL3P7PrpFlnLIj/pExXmDZFARvy9fJqE7ziQEXlu6l7qwr3kAJ+vOx5ElgDmySElTcPO9e9m7znBjfolIbXrttQDAchNOSFmcHa49iM8XXDQNiMga40IQfbiwAUutuRcymW54SlL/b3QC5P5MVC5vLKag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628442; c=relaxed/simple;
	bh=wGNzlCHvzlwnAIj+zHbs0ITocqVJSpRtaZKTraawJJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKHLCDVpj7OHLTpRwTu/8LToei6Sev/EVV1xUeqPogz1e8zYGyf3BDzBVkGpuAFmHbGGWsjVl5gZ/MZur3fdY31dPeEC5UsjdVAABAhR/D6mfpMDJLtaUoeRV51jiM6ZTul1bvNRhO8EA7hj0EdUGyp2XJJ3p0IXHCtL51gc5YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9E8K4gn; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9E8K4gn"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c8028fa6039so5994298a12.2
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779628441; x=1780233241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpkOdUQXFGxFQhG6DWzjgHAT1NVWSs4rv/hq+MavDrg=;
        b=c9E8K4gn/LV0viofmYhGSLzuP5aiDTChD3eCA0l9k2ofNWkr0MAMl+XbmJ60216Zcw
         VM1ZtKSW7Ety2AiN4DyOyY91bwO2gVZdEnNQJQm9CeAIwQCOz8vCDBOktkz8or414VWA
         mLuaK8lUhoHfxe3BF0Mi/nv/MVNMgWdwk3+cgkUX/u0QTHTxL+WT17RGzn4nk/bNMWdL
         dV4SX5oxFMugGV7C/p9DYEZodPtfj9aJezlpFIpSdQxvSEsE2Rjn5G9IyCOtnQlqeK5K
         Po+IrB8LQvD8Fb1qKGafj6nQPGHEwi7HOmyH/thA3MAve70I3LUOxLszAtDoX5mEB9yn
         fD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628441; x=1780233241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpkOdUQXFGxFQhG6DWzjgHAT1NVWSs4rv/hq+MavDrg=;
        b=Ysk7bUg7kBT/PN1MkFP+h9tY4elW469S1MY86G1NH3Elme5R7vc1Isn4MwhErlsS3i
         g0pE1I/oDOtMOyADZEkkZW353UEkjg6IryUq+J2SW/qtWfFaMaIFfD3SYSea5vydWaqu
         7duoEK9J+LlSOWZNjkgA31FtARVnCkfNpSCr+cmhFouOa/5Oyh+EGQVczPplRv4OdOiJ
         VT/qctBemL67MlugyMprCcBTS6eMDyL0woPHqO98PqrEk8ApnFjXiBHPm+FQ9+ECrnL4
         t+OtFEtN9E+CIjcpjF1/BKSo9HdtpYuj2Gdw4JHqECW4mRoUmkfDrEWNFImkq8Y395jY
         frzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8L24gZ4cwhCv8U7oCt9pvX97AKXnNwuRXOUMWTsKAqUwmt9VSNrZNzOz7n2oNzhTqSdvY7No9Fy5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BRKlALqPj+eZ6JnhK3yAo11ad7QP3leV2JGcasSOspkdzdID
	rjYjeBcVNPhx7X6gyh88V7wU2v5B5jhldJxZGGTCtVjpd95gzONQdBja
X-Gm-Gg: Acq92OF2j6SnamxWPIVXBlyTlA6Sfy0zoXFsv66GSoK0F5qprGyzmMl9cbgS9hs1C/A
	7ixxGcnaPoDZrH/8RTb8ZED0hqil2m5+298A0/Xk0ERZQG3SFrNWVN6nzwzirg8QVdRPoLqU/kY
	nnofgrL4gdsSyZhKUh7L1OfoBuTgLY13cbu+2GH1IXJ2SYc19NkKQuT4EZnkgA70rc36kPW7SQi
	xr0XyQTVIOFJZJPtFY7juIeT3kqL4JAytudQ2mk7HVBjv//PBPeZSwC++bv4frZPb8JtXWoLLfc
	/OC3szbBTT2TyDhwh4J6kIbIOyrTK6hj+fcmpB4Vm3aWb/a3lpNF4jzl0oK4Xvcj6+UXQrk8kTW
	yawRO7QcYI8UNmmYL597aZmMXAjUnsgeus5lZ97S/lcEq8Kmut/FYwSoMntGgT/EPETWatMyH2S
	EYbYFTWkbOvLlGjoBC7UAs1wkfpnI=
X-Received: by 2002:a05:6a00:298f:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-8415f3fcafdmr9374677b3a.13.1779628440534;
        Sun, 24 May 2026 06:14:00 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.159.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb28d5sm7163128b3a.41.2026.05.24.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 06:14:00 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 24 May 2026 21:13:06 +0800
Subject: [PATCH v2 1/3] riscv: add Siflower RISC-V SoC family Kconfig
 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-sf21-topcrm-v2-1-4527aae05c3d@gmail.com>
References: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
In-Reply-To: <20260524-sf21-topcrm-v2-0-4527aae05c3d@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Yao Zi <me@ziyao.cc>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Siflower RISC-V SoCs, including SF21A6826 and SF21H8898, are RISC-V
chips with T-Head C908 cores for home routers and gateways. Add a
Kconfig entry named ARCH_SIFLOWER for them.
Notably these chips uses ARM PL011 for UART. ARM_AMBA is selected
for its driver.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/riscv/Kconfig.socs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index c174ac0ec46b..7c412b2bdbe1 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -37,6 +37,13 @@ config ARCH_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SIFLOWER
+	bool "Siflower RISC-V SoCs"
+	select ARM_AMBA
+	select ERRATA_THEAD
+	help
+	  This enables support for Siflower RISC-V SoC platform hardware.
+
 config ARCH_SOPHGO
 	bool "Sophgo SoCs"
 	help

-- 
2.54.0

