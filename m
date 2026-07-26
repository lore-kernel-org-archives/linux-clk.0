Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E064F9C0
	for <linux-clk@vger.kernel.org>; Sun, 26 Jul 2026 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045847; cv=none; b=dznnBbpH+hTuPuv7AN5kP9VCUUwSxVN0xIW2Pt+oiGU1acRlj2/tzk0VdaRxr1C24lsxnAXIYpoigaKWl5Hwk223yRCVPouA/9JrGPRFcxzyYm4JrnV8P9RAbIS5Ro+tLCD/4R16oXh7OPr/anhMdFEhMPwJmk5KzGWzSqSeCe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045847; c=relaxed/simple;
	bh=i0axAIOdnWy7kaUM9xsqDJz10jxvLmhCHlXNFaMbGjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fEqc/EioEeX2wvhey3/piksbVuFfp9/S7HXDN/cvQzypZip/+x2laoLBTETJx1YpvdJ8Q1SP34nXq7HIXnWAzSrGlKzMiz4Vu86SdNLFlgK2PDJ0o2ufpzOpG5CggIDVfOQl+Nqtj7A7Cd4S76xccSWr1YoA23CWz1szb9R7aaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq8p/IeR; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq8p/IeR"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1188766a12.2
        for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785045845; x=1785650645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+26Pgn5yyytqUfGY957+3+8j+6xWmgyw5AfMu8lBmw=;
        b=Vq8p/IeRcF3YlRTYzHkc+iEPb5GZgdcn4rURupRQ9uQYdIZOy0N7inxAnnGNf/Ip0a
         zB9AvypCD+lhV0Pj9nAW2E2LDFV3Tri/1Y5BTIAnrdEUaSjbEJudLrBWB7YxWa/xw6tb
         U02HlzdWPF7lsnkygpU8uEdBP4ibMaX2bZyFL5OPdBvXYswTAx3Z1GD0ubgGdCtSwlSq
         TIhvK/HTw9kwFQlimPFvJQ0SJCd87xKGjaHDjrqyRNhHjH+ZNnHFOz7qioKuHCKgDw35
         ZnmJ3AXRdzcsTRqzdiwKg1IGp7kwwT5uxjelXsa5/Gmq/dqbr0D27RCnYrCeHaeJcHJp
         hJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045845; x=1785650645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+26Pgn5yyytqUfGY957+3+8j+6xWmgyw5AfMu8lBmw=;
        b=Zd1GhtiI78H4h87A9TAOighihAfhe5xEVTaPjia8Mc/p06wy92x5ep+qlPtSANQ/J+
         wfwRN/D0tCYNwX6wmCl4jxw1ybv4gNL66ajQvmTX/dhph4TQeGJ8Gh1emruUyLEZwyc1
         QYLlevdKhES9t8yzQa+rWtZjfeSyVaTpWX3uDwyDxi5Z43BYLrqMde+wQo7iS6O1IEEh
         bXpxxN2relgP1ETSnZ9VuoGvrqOOSO0eK0Ii/kbMGC/QeSs5YXPqCjN2k5vkK9XeSvze
         bBuzHUoIBnsZHNgpUlA72MX4h69AcqVQ/95m+L1IBMo3TJzk3STAmXeJwKKileWYP4MN
         2I2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq400AM/zR0Bv+/B4HgOYXO2ANacnT8cflA/mky7eBLJZtI2VNBTtKgowz2OpQhpgLe4U+/2uYU5eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEFCZdCJskbZrcOgqb7GpJ/LVYQ5mlr4miZZ8tC6wbZDF4dkR+
	Cs/Apb3t7mxh7H1y1np9debZQgugCPfmqQSiD9MWs7vBZPYcbw9DK8Ha
X-Gm-Gg: AR+sD10gi+wBPwg2mHWuph5AqjQfHPvXG9/ea66gkRhY5Z+O+UpFfbIOGbZsI3oqA6b
	Ez+dWw8lUpgxFxr3PGCfbtu8Yu74cbpq9WZuJ3xFQm10Eq6QvvMEIZW35Jyc1gM1os6hiP8xqOw
	aBxIfdb1tHVRNvYp92yg76BaEEomeIisyPx9XG2JA7aqF7JbdCFoBgFJQTrTG2fsx/OJF/rbf2G
	nejGG5k02XwJP5bluwTCkSBNzCzj8rcaCERdnplHVtk2to0YKhVgOfulkhiKSKXoLItU7WbSmj2
	AZmu5kXtCvCaj0gq5TdIqkoiv09cmDoSBRWrZNCv0xmnkdH+Z2KvE8Y1gDX5/Aq0HgFOb4GvxZL
	9RdWQ+f1loaZYV+pt3YzHDMo3qMTHANvdXJhAwBompPqTHLTXSK9yChkpTnktAYejZ3CETsmWjH
	gPG27EdUE/ZkkboqWo/+KdGwnJWer2pYydNkgTOknxNIR7JfQZ50ocWytQ5wMS9tPZjlvzT8dMA
	pcLqfTJ0y6uctHEqA==
X-Received: by 2002:a05:6a20:9186:b0:3c0:9c19:65ad with SMTP id adf61e73a8af0-3c67e16413bmr4106101637.69.1785045844721;
        Sat, 25 Jul 2026 23:04:04 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb6623294sm1781164a12.10.2026.07.25.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:04:04 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: nuvoton,npcm750-clk: fix 'suppling' spelling
Date: Sun, 26 Jul 2026 11:33:54 +0530
Message-ID: <20260726060354.18755-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: suppling -> supplying.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 .../devicetree/bindings/clock/nuvoton,npcm750-clk.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
index 694dac68619c..b46b4ffb3501 100644
--- a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
@@ -18,7 +18,7 @@ description: >
   There are six fixed clocks that are generated outside the BMC. All clocks are of
   a known fixed value that cannot be changed. clk_refclk, clk_mcbypck and
   clk_sysbypck are inputs to the clock controller.
-  clk_rg1refck, clk_rg2refck and clk_xin are external clocks suppling the
+  clk_rg1refck, clk_rg2refck and clk_xin are external clocks supplying the
   network. They are set on the device tree, but not used by the clock module. The
   network devices use them directly.
 
-- 
2.43.0

