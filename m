Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD238AC97
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173282; cv=none; b=fXOb02ATdJ9X47sK8oz6vgxGOa3LHyGivOei6QirBjh1S4TmYTcbeoK+ahThIXtS2MIg/DW+Tnta5+2958aEiLDct322Rt3Mlw4iRyOuHK8VA5UsXYEtXW/Gdo8mCRYQh+cukvobre1qvufbu3yOTOA5X5aJEx2BLTWsk6pZw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173282; c=relaxed/simple;
	bh=9d3M04P5hh3vtHgHDP9HgJSDpIkeRrho5tcgm1urPt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2JO1PhOCo7xEmvHIY5X9xWMw4h44O4aAIdXoyDFF5141P2EVmkrXGewjQ6M7UBj27MSoeoAakGUW/Qn4wdhAZjb0hgC0w2vLCwv8690jwaV+Dx3xBOztJCAPhzU3lC/C5lrs/EqtDe5wUv4ejUnkvtwqDouIkRqC40IqBe8gso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RayWaRZQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RayWaRZQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso9978425e9.2
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778173280; x=1778778080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oDyvw0L8OYXJ6cX888dTXA0t+K6akFsCVQtR50QGsSw=;
        b=RayWaRZQHgeK87hsSsRd45dsi4ujfNG0l/Gi1nmYB62Ntc2yQwzWgCcEzzwu0ugCYk
         x0RNtOGcxj5ovTJXyYDZqR5+8Yo+i0eBrTBaBQrRdrtt1MgSpNnsK65IgP7DJp2Sa96L
         usJAaykB1opolizHc2QTkYsa+hPTdym2GEfW2xFrBG7oFFL5zwXM+akWmnANwSHWeqjM
         rwE3olssEGivmXXcqE7kV1Tddi4cjlkmTlKFQAlqpWwDEUYjbHOehrXDG/cxu1ICf6d0
         XJgpIxdwlCN4Q5H0DWJojXSL7N9kwtSc65rqYzGYn2VwFoA1KeZYEe57a0r9gnb+G14L
         Dbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173280; x=1778778080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDyvw0L8OYXJ6cX888dTXA0t+K6akFsCVQtR50QGsSw=;
        b=s5TVHVwbBymSF6/bF0znqJSBZupMT7p0MtwGtbEDqQO0wGC5Q1BWsGWAXDWaXu2M7k
         OA91IbCkRXUU+OymBjFuaWIQNRiaFDdPO0QyDdJuegH1QE78o7P+xIb3zmlSESjduYXy
         niiVmMDOAfyk+xzXZzbkAvoR/3P633puk0zXDIo0GsiWQ4LUwHqJftFYIKKgrDKdQQVe
         2KxPQbHYUppQnqNfmPZ/UMAI3Z0EJPiHGhu9Jcs9HV49cl+JkqON0TRj3IGeVxY3yYc+
         /kW/lHlUPlLa1sruzqXZcSIoExBngU4PhE7mzCl4rNTZuzw0PK9YKm6CAl7374tXPyEZ
         Tgsw==
X-Forwarded-Encrypted: i=1; AFNElJ/pMoysPzx7XXZLGgF44u9I8OWf3IC9HwvQVtvzIhLmNgAh8M81xupiPBN/zwB888gCg9NOB6fOXcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YykIH5xde5UTr1v0zaF52nch4BViKIqdqjQyvxG7k0tmJ0lp5Lb
	mmknmOG7kbwkznSdxVPjK+tP9r8pfRXs9CRqcutsY0VRY8O6L9NiE75LlCbb3dso
X-Gm-Gg: AeBDies3hwQclp7uh0+q7JVG+nv6DxQCLPzL8wrMiI1Lc7bv4ckkFx3zy+IhZfSMpUB
	+KEgPYpwOL/rhpnVSkdQdQ7PsILd2IX3mBseKP+bhj+Zkl+bCy+N8h/A/MefrsZSMD4oj330OEd
	UOra7DqNZz4oxXpX6nkH9zx3rmgy3/GLN38NcQfw1J/niFeABK7CLd2GwfRLU7naRf+B0eoT1cq
	b8StmBv6xTwWwBxEcFRt8THak2D2v/Vm/9JBNpbpwj+IoHcbCLKyDg3sVNp4TlDuyfYjtlas45s
	Zl8X9OCEoHYhkKDkYtbei7Qxq9XGeA83EpJnjcIxkLdQZQhmHjGpfk4DEgiWYW3hIZK0yevatZR
	p5YBdiCni5m4YW9KbXCEWccdcAWLUDjhkL+3eaXPM9gP7VkPylMcOQTP90lPd0TVg6MoDjDafWv
	4kiTkWVpJrn/L6+OzN+xr6BdsaEj+bfA==
X-Received: by 2002:a05:600c:8485:b0:489:ecee:c4ef with SMTP id 5b1f17b1804b1-48e51f2f874mr149807555e9.13.1778173279572;
        Thu, 07 May 2026 10:01:19 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538c4ae1sm131912545e9.12.2026.05.07.10.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:01:18 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt8167: Fix orphaned mm_hdmi_pll clock
Date: Thu,  7 May 2026 18:00:46 +0100
Message-ID: <20260507170107.88248-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock hdmtx_dig_cts, parent of mm_hdmi_pll, is missing from the clock
hierarchy. Add its declaration with values coming from the Android
sources of Lenovo Smart Clock 2. Tested on Xiaomi Mi Smart Clock x04g.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..df9f9dd1bfd6 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -27,6 +27,7 @@ static const struct mtk_fixed_clk fixed_clks[] = {
 	FIXED_CLK(CLK_TOP_DSI0_LNTC_DSICK, "dsi0_lntc_dsick", "clk26m", 75000000),
 	FIXED_CLK(CLK_TOP_VPLL_DPIX, "vpll_dpix", "clk26m", 75000000),
 	FIXED_CLK(CLK_TOP_LVDSTX_CLKDIG_CTS, "lvdstx_dig_cts", "clk26m", 52500000),
+	FIXED_CLK(CLK_TOP_HDMTX_CLKDIG_CTS, "hdmtx_dig_cts", "clk26m", 75000000),
 };
 
 static const struct mtk_fixed_factor top_divs[] = {
-- 
2.43.0

