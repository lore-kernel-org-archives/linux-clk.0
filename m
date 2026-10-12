Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18A83BBFA2
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 06:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786635; cv=none; b=Yo8TU4/ESC+tk+MF/x+96QRXuyokn2EpUFzC78amkfaEQyifW/dvzsOtNAV0IkTi9Dnk4R3YsMz7NTlMUZvCBFD0WbRDcYOkz7AwOyFkZBiErk7drhoy4R9uFJM5riK0ND4m3SSDVhC27rs15LwcBAcUCSPgfOE/fe0oHWFzhho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786635; c=relaxed/simple;
	bh=nTmkkQ+srYSH1qSInry/EXxTspT5axi15V9RfozReIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qF0AjIE7r3m2pUvXcHI96Z4gGV2eHt6IcvNUFpyslvIj3jnLD1GDBJnHD1wn/FTz+RzWxKs6v3EJh61dEAO7ZatDteS2y388qcm0oVk4V/sNX8x7NRPmqmchdtcPbg//QVWubc7JlJX0T1sj9ID3PoX1Qio4gJtvs0Kp/BfQVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyqV0QIL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyqV0QIL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e623eda81cso8842005ad.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 23:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786630; x=1792391430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEUI0qMUoX7WI41VkLWV4LHhhLkoSphEWPjNV+Kx3hQ=;
        b=hyqV0QIL9r3u3JvdhDEEOzriKxuMRaS8Glsow1UGNL+rA5QSY5lGTApFZ6V+cyc5PF
         jnoA4ge6oHFkVCtkcxtQeXq1RWNqBz3AAEiWOo4U00RldBzFkWniO4hePypyojirnrEO
         dESigyp3g3Qkjo5a3Wi0eHiccgA0Ua6AncvVMoTm5SLFssoSGus/xi1O3lpd7qnSzY2r
         Iup/AN7au3I4PWa5RVud8f6+Kfs0BGphAfJYn2YYjRKAmPQ3Oug7Uh8NnQmqTCXiKsPp
         BfmZBIaFuURghuUv0nH0xlF4qybCRXWje9GyIWddNbheMHrXeI0Ft7BVSrAn63DpkoE8
         9V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786630; x=1792391430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEUI0qMUoX7WI41VkLWV4LHhhLkoSphEWPjNV+Kx3hQ=;
        b=ZFMf/4tk7N/cgoFLx4yOV1rMSHre1LUe8F6vnuQei6aZJiQsuj7L99xtNP4v5oZ8qB
         e8zDYO3sL7TopaQ1i/4jPYfF9qbBHtZbMjlKGMyQd78Zy7dvUQyK6hbCxhksydtWvi+t
         nR7N1r2r3Kaj5zucfJOPee5qWrCaxXvBQmWcAygSS1EQOqrTtWtVuUC4x/El1L69fMG+
         8CVrVzoukpaDdrm87RYRhZzmB6SROyheNa6ytsSeijaktj07S7BesX0F2VI+f8rSyfCy
         +apuRovKV4lCgGR+GZyvbGfzDOohUAE0miDO2JIbvomb2BkNk2borgOmmbJASfGEqVil
         ELVw==
X-Forwarded-Encrypted: i=1; AKwUvBzugoXJ2ObolYKoTdIxeexWnNns3v1kZ6YiRP9X9NWz6Wo2J/mTtdjPMwJo2qFEObaQhpbaGucBMxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcWQ6dRdu45ubJofGgUiQyaiKSfTeZITEJFLsuv7v2oZyC3aUl
	migMNbAm/n39SrWwyTbz5Zy6BtsIcOZFqN3ZKJUVVfH3F/RLoORXQpc4
X-Gm-Gg: AYBFou1Bz6nJjioqQRZWjPPpyOH7Akyc+563mvgjt/fDh9WokKEaXoKY14Ws5gQWcZd
	92/kN8blpw9hHQsPYNSdchXgg2JsQpcCXzMNMVuOFWhL41iOgY4snyx5nrFHje0YOQ7zqlZ61J4
	gkq9EqZLymM2DsHdasv8EAltDnBXmeR90+Mohjv6gCIf1TmVzaF+2oepDi381gpNsgI2NfYr6Xs
	KywkSHkEsr37Gb3hd1ZTkcAPoUfzDRX1CufZV+3ORJOGrkt/ajstLJ+rRBNQeE7a23DeeHDCsWX
	9IhVuDd9s2Dwdye80jEK53Xafz6rvn6R5VBvJQa0U7zUqaSwkXaY7+E9XzdvtMvCUlAXQW8eFqe
	ApQJ579i50WSNLLW5Ty9mx1RFkWoOOU2TpPnF5JI87Eg+FnhqLIFwkgXWWwXr4HGpDrN0xF1NM8
	zTgKJ2Ufcomq4a0+8owLgyFst8zxdlZyU6Yu12RXXz4eKqimMHH9yAv83HvjZDOHB+H+/0QK9e2
	itUaI6S9e6cbQaqq2xL9em4bneq8gM3/sJ7HgrrErpyli/onfGJRsSW1EerSTyB33gqzD4QxxQ=
X-Received: by 2002:a17:902:ebcd:b0:2e2:c773:a37 with SMTP id d9443c01a7336-2e842ab68c7mr74795165ad.16.1791786629963;
        Sun, 11 Oct 2026 23:30:29 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:29 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 1/3] clk: nuvoton: ma35d1: fix parent lookup for clk_parent_data entries
Date: Mon, 12 Oct 2026 14:30:18 +0800
Message-ID: <20261012063020.3331443-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012063020.3331443-1-a0987203069@gmail.com>
References: <20261012063020.3331443-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parent tables were converted to struct clk_parent_data with only
.fw_name set, for example { .fw_name = "hxt" }. The clock controller
node has a single "clocks" entry for the external crystal and no
"clock-names", so a firmware lookup by name can never succeed. The clk
core falls back to a global name lookup only when .name is set, so these
parents are never resolved.

As a result sysclk1_mux and everything below it (hclk*, pclk*, and the
peripheral dividers and gates) stay orphans with a rate of 0, and
clk_set_rate() on any of their consumers returns early without
programming the hardware.

Set .name as well as .fw_name on every entry so the lookup falls back to
the globally registered clock of that name. .fw_name is kept so the
tables still work if clock-names is ever added to the binding.

Fixes: f50a000b4219 ("clk: nuvoton: Use clk_parent_data instead of string for parent clock")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 260 +++++++++++++++----------------
 1 file changed, 130 insertions(+), 130 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 9f65d0623517a..09e6ceeb2c556 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -63,298 +63,298 @@ static DEFINE_SPINLOCK(ma35d1_lock);
 #define PLL_MODE_SS             2
 
 static const struct clk_parent_data ca35clk_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "capll", },
-	{ .fw_name = "ddrpll", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "capll", .name = "capll", },
+	{ .fw_name = "ddrpll", .name = "ddrpll", },
 };
 
 static const struct clk_parent_data sysclk0_sel_clks[] = {
-	{ .fw_name = "epll_div2", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "epll_div2", .name = "epll_div2", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data sysclk1_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data axiclk_sel_clks[] = {
-	{ .fw_name = "capll_div2", },
-	{ .fw_name = "capll_div4", },
+	{ .fw_name = "capll_div2", .name = "capll_div2", },
+	{ .fw_name = "capll_div4", .name = "capll_div4", },
 };
 
 static const struct clk_parent_data ccap_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "vpll", },
-	{ .fw_name = "apll", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "vpll", .name = "vpll", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data sdh_sel_clks[] = {
-	{ .fw_name = "syspll", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "syspll", .name = "syspll", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data dcu_sel_clks[] = {
-	{ .fw_name = "epll_div2", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "epll_div2", .name = "epll_div2", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data gfx_sel_clks[] = {
-	{ .fw_name = "epll", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "epll", .name = "epll", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data dbg_sel_clks[] = {
-	{ .fw_name = "hirc", },
-	{ .fw_name = "syspll", },
+	{ .fw_name = "hirc", .name = "hirc", },
+	{ .fw_name = "syspll", .name = "syspll", },
 };
 
 static const struct clk_parent_data timer0_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk0", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer1_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk0", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer2_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk1", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer3_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk1", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer4_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer5_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer6_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk0", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer7_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk0", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer8_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk1", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer9_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk1", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer10_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data timer11_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
 	{ .index = -1, },
-	{ .fw_name = "hirc", },
+	{ .fw_name = "hirc", .name = "hirc", },
 };
 
 static const struct clk_parent_data uart_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "sysclk1_div2", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "sysclk1_div2", .name = "sysclk1_div2", },
 };
 
 static const struct clk_parent_data wdt0_sel_clks[] = {
 	{ .index = -1, },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk3_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk3_div4096", .name = "pclk3_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wdt1_sel_clks[] = {
 	{ .index = -1, },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk3_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk3_div4096", .name = "pclk3_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wdt2_sel_clks[] = {
 	{ .index = -1, },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "pclk4_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "pclk4_div4096", .name = "pclk4_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wwdt0_sel_clks[] = {
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "pclk3_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "pclk3_div4096", .name = "pclk3_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wwdt1_sel_clks[] = {
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "pclk3_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "pclk3_div4096", .name = "pclk3_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data wwdt2_sel_clks[] = {
 	{ .index = -1, },
 	{ .index = -1, },
-	{ .fw_name = "pclk4_div4096", },
-	{ .fw_name = "lirc", },
+	{ .fw_name = "pclk4_div4096", .name = "pclk4_div4096", },
+	{ .fw_name = "lirc", .name = "lirc", },
 };
 
 static const struct clk_parent_data spi0_sel_clks[] = {
-	{ .fw_name = "pclk1", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data spi1_sel_clks[] = {
-	{ .fw_name = "pclk2", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data spi2_sel_clks[] = {
-	{ .fw_name = "pclk1", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk1", .name = "pclk1", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data spi3_sel_clks[] = {
-	{ .fw_name = "pclk2", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk2", .name = "pclk2", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data qspi0_sel_clks[] = {
-	{ .fw_name = "pclk0", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data qspi1_sel_clks[] = {
-	{ .fw_name = "pclk0", },
-	{ .fw_name = "apll", },
+	{ .fw_name = "pclk0", .name = "pclk0", },
+	{ .fw_name = "apll", .name = "apll", },
 };
 
 static const struct clk_parent_data i2s0_sel_clks[] = {
-	{ .fw_name = "apll", },
-	{ .fw_name = "sysclk1_div2", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "sysclk1_div2", .name = "sysclk1_div2", },
 };
 
 static const struct clk_parent_data i2s1_sel_clks[] = {
-	{ .fw_name = "apll", },
-	{ .fw_name = "sysclk1_div2", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "sysclk1_div2", .name = "sysclk1_div2", },
 };
 
 static const struct clk_parent_data can_sel_clks[] = {
-	{ .fw_name = "apll", },
-	{ .fw_name = "vpll", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "vpll", .name = "vpll", },
 };
 
 static const struct clk_parent_data cko_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
-	{ .fw_name = "hirc", },
-	{ .fw_name = "lirc", },
-	{ .fw_name = "capll_div4", },
-	{ .fw_name = "syspll", },
-	{ .fw_name = "ddrpll", },
-	{ .fw_name = "epll_div2", },
-	{ .fw_name = "apll", },
-	{ .fw_name = "vpll", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
+	{ .fw_name = "hirc", .name = "hirc", },
+	{ .fw_name = "lirc", .name = "lirc", },
+	{ .fw_name = "capll_div4", .name = "capll_div4", },
+	{ .fw_name = "syspll", .name = "syspll", },
+	{ .fw_name = "ddrpll", .name = "ddrpll", },
+	{ .fw_name = "epll_div2", .name = "epll_div2", },
+	{ .fw_name = "apll", .name = "apll", },
+	{ .fw_name = "vpll", .name = "vpll", },
 };
 
 static const struct clk_parent_data smc_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "pclk4", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "pclk4", .name = "pclk4", },
 };
 
 static const struct clk_parent_data kpi_sel_clks[] = {
-	{ .fw_name = "hxt", },
-	{ .fw_name = "lxt", },
+	{ .fw_name = "hxt", .name = "hxt", },
+	{ .fw_name = "lxt", .name = "lxt", },
 };
 
 static const struct clk_div_table ip_div_table[] = {
-- 
2.43.0

