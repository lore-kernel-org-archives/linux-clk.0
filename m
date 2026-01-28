Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7487A26C3BE;
	Wed, 28 Jan 2026 16:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616333; cv=pass; b=CBxOUR6ffRinNxDdlLxa00UqKbeWof1KuvfJdQgrzl8r0GuvO2Mpo27eTja+QXaAYClH53l0G2W1QCJIPZnT8dPK7FCglVrY0hiPggp7fa+ra/7Ol6cPDR7qrf7YSdtRNEumRaMAsv0fj+JKXL29hc6jAHCRFersKAvZ7EG0cfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616333; c=relaxed/simple;
	bh=uW8xm/86NnJ1WMU2ynQugELE8JZ7fhLOVPZtpGIl5VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lwVmsQCf9sojHzbEiNeUD09bjtiu6LESZSsnRt/WsvWxXzwl5fy2AIFgzLkoWJJQfLE3Dvmqzi//HcqdrcHIKgwlaso+35kysGcQ2FW+l0syRvjm1CiGWiNAt6iX10PRz0dN4UgCI1oX1Jj8bO9GdkYaUDFEWWxQsFKsKeRrtyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=UF+V3FD7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="UF+V3FD7"
ARC-Seal: i=1; a=rsa-sha256; t=1769616302; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pvqg3/gTn76an7M2H0plJ+A/j0grY9QpWSR+zfMFtvdWHwgv20NMo0gexCxzJcmX+dqeRI7/aqalvmsb/Tg/38Zy0Ej/J8l4YWq1awgBRqWF3CNnnKfHadiC324aoDz05ruxQrDDYBylbQ0uWQOxznCSx8ezv4O7dF6NIwbd5/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769616302; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sb3AGPYrr0/fo4jbw4irixmJe3vsgCbc9Ej4of+Z+E4=; 
	b=huaMjNg+D8TELmKporfZ8/M4DDDtQz4QI9YmdjJRBq4sxqm/zQg0mKsVbJ+Ve6mufwVyq9itV8Urlr/z9CDAWj04iEhgyWs1aA1JOH8Gg7E1M7S9DKLTwmiEkuI1ZZlBxXG/X7igu4Uo7UAjjGCcIFypz3WRgXb7R/lP1d9W0/c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769616302;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=sb3AGPYrr0/fo4jbw4irixmJe3vsgCbc9Ej4of+Z+E4=;
	b=UF+V3FD7yc6+2BlnxYazVLbjwN7ep+KvPNlM/7z/vII5PVMAjtlM4PnfBxYw4sfa
	SVZL0HcDwpQVzVXTZ8FhHpKjU2nisCjqpLlNPc/EGgQL0ZEajUfL62bAWTB+Hc02OSb
	Ntiv/tE5rO4TxW2gXfWEYl6Od+8dTiHrEyrMKmIM=
Received: by mx.zohomail.com with SMTPS id 1769616300860635.7323383170847;
	Wed, 28 Jan 2026 08:05:00 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Wed, 28 Jan 2026 17:04:55 +0100
Message-ID: <3745487.e9J7NaK4W3@workhorse>
In-Reply-To: <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
References:
 <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6678782.DvuYhMxLoT@workhorse>
 <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, 28 January 2026 15:47:08 Central European Standard Time Mark Brown wrote:
> On Wed, Jan 28, 2026 at 03:09:46PM +0100, Nicolas Frattaroli wrote:
> > On Wednesday, 28 January 2026 00:14:29 Central European Standard Time Mark Brown wrote:
> 
> > > Do you have a debugging patch we could run which would say which clocks
> > > are impacted?  I guess it's more of an issue for the platforms that give
> > > no output but for at least Avenger96 I was getting earlycon output.
> 
> > Try this one
> 
> For the Avenger96 that says:
> 
> [    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
> [    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
> [    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
> [    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu
> 
> https://lava.sirena.org.uk/scheduler/job/2412562#L563
> 

Okay, on this one, there may be a problem in the clock tree.
ck_mpu is marked CLK_IS_CRITICAL, but its parent, pll1_p, is not. Clock
core doesn't seem to check whether any children of a clock are marked as
critical before disabling it.

I'm not super familiar with the intended semantics of critical clocks.
If we need to manually mark all parents of critical clocks as critical
as well, then a (potentially partial) fix for the Avenger96 might be:

---
diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 2d9ccd96ec98..6bf3fad1e0dc 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -1783,12 +1783,12 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 	PLL(PLL4, "pll4", ref4_parents, 0, RCC_PLL4CR, RCC_RCK4SELR),
 
 	/* ODF */
-	COMPOSITE(PLL1_P, "pll1_p", PARENT("pll1"), 0,
+	COMPOSITE(PLL1_P, "pll1_p", PARENT("pll1"), CLK_IS_CRITICAL,
 		  _GATE(RCC_PLL1CR, 4, 0),
 		  _NO_MUX,
 		  _DIV(RCC_PLL1CFGR2, 0, 7, 0, NULL)),
 
-	COMPOSITE(PLL2_P, "pll2_p", PARENT("pll2"), 0,
+	COMPOSITE(PLL2_P, "pll2_p", PARENT("pll2"), CLK_IS_CRITICAL,
 		  _GATE(RCC_PLL2CR, 4, 0),
 		  _NO_MUX,
 		  _DIV(RCC_PLL2CFGR2, 0, 7, 0, NULL)),
@@ -1803,7 +1803,7 @@ static const struct clock_config stm32mp1_clock_cfg[] = {
 		  _NO_MUX,
 		  _DIV(RCC_PLL2CFGR2, 16, 7, 0, NULL)),
 
-	COMPOSITE(PLL3_P, "pll3_p", PARENT("pll3"), 0,
+	COMPOSITE(PLL3_P, "pll3_p", PARENT("pll3"), CLK_IS_CRITICAL,
 		  _GATE(RCC_PLL3CR, 4, 0),
 		  _NO_MUX,
 		  _DIV(RCC_PLL3CFGR2, 0, 7, 0, NULL)),
---

I just looked for CLK_IS_CRITICAL clocks in that file that have the
CLK_OPS_PARENT_ENABLE flag, and marked their PLL parents as critical
as well.

An alternate approach would be to skip the parent enable/disable pair
in the problematic patch in __clk_core_init for clocks that are marked
as critical, because if the parent wasn't on for a critical clock then
we wouldn't be in that function, we would be dead.

Kind regards,
Nicolas Frattaroli


