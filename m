Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9543168F8;
	Mon, 15 Dec 2025 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765794287; cv=pass; b=qhX+0m8KFVjOin8043XtLY9GeSVitacMsCFKVOu9ogOvZIZbv2bf/kr8gRXOI8sMHQcu8fcclwfMeRYgkclASWjBlNjp6t/b5GR670z3ricEOGSPMyBcdfNEXzkcw9NRuuxrZ8ZCNpZIoErqzV3xvL2i7uZP8N5QakpXclgpPRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765794287; c=relaxed/simple;
	bh=NmIUOt0rEOZ3PnRMcnQvX8xxxltSEUHm41Vx+veMZTI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IfCguxOIPiDcP+ZhbPddx69+TUZE7TGnNMdzzeU/U7jYHdy4+Z/MuMnhcOjUtBurnnUFRBwEMaVq79VzBz4p/Soz/xI8uEGfvxd12PKYYcT3qixq9Bqnfx3HCASybttYSogDrLFyMhzPHsarmDSLplI46ZpqRzNKWZ1yPvIJMj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=IP0Vvkg7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="IP0Vvkg7"
ARC-Seal: i=1; a=rsa-sha256; t=1765794260; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QLjlPj+tvZWRAjoGNAGyEoOpem8GcrNjacZoKbw2y6I8mcqEi+D+BhRCQEpe+9nW/4NaMetQNvL/wc/Tws0Wx7OOejSixtTScyLnvri1UeSPZpHvHV3+sMJqoxw8YvDPL5NquTSw5a6xbj1q+qpAZhdKfnQRHW8JyGEHx/ttr8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765794260; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sBsztCZvN1TwT/rBOoE+/nHWNkGvyC+G21JWeCvj0sc=; 
	b=THSRqDBximEy/ELB6IMOFF1tawjZhVMy/ImN9/MmQIan+l2RorkP4+Gi6Q2RrS3Dv225NYxnlIJZ51kq4M4PMCH1AA1UG8/5SX8BX3PR0IYCj+NpbpP9jfFS8RhFdKKxocUcMP9LwX80P7mSKBZt0/P9YJPbhTlTEVCvqxO2FVQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765794260;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=sBsztCZvN1TwT/rBOoE+/nHWNkGvyC+G21JWeCvj0sc=;
	b=IP0Vvkg70yvbd9j92sv04YVU94CqXrZX64p0QBosLPjHFwyM1m4WiRk3HiJCSsuv
	E2hxlye0IweZhvgoLWAIUAOnhH1SAaMIKaw/D+XCpKbNyBeJCxlPtnO3+pQuXsOxtE2
	uh6iu6rzhW73uLqrcse1zHJwDQdl401065frIyn0=
Received: by mx.zohomail.com with SMTPS id 176579425872939.55466776054391;
	Mon, 15 Dec 2025 02:24:18 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH RESEND v3 0/5] MediaTek PLL Refactors and Fixes
Date: Mon, 15 Dec 2025 11:23:57 +0100
Message-Id: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

This series refactors all users of mtk-pll, just so we can enable
runtime power management for the clock controllers that want it. It's
also generally more useful to have the struct device in the pll code,
rather than the device node.

Also fix up MT8196 mfgpll to declare its parent-child relationship with
mfg_eb, and fix the common clock framework core to take
CLK_OPS_PARENT_ENABLE into account for the recalc_rate op as well.

The reason why this is all in the same series is that it grew out of me
first modelling this as an RPM clock for mfgpll, which Angelo disagreed
with, so I did some investigation and it seems MFG_EB indeed is a parent
clock. However, the earlier refactoring to pass the device pointer down
is still useful.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v3:
- Make device_node forward declaration a device forward declaration
- Remove forward declarations of struct clk_ops and struct
  clk_hw_onecell_data. (clk-provider.h include remains as it's needed
  for a complete type of clk_hw)
- Move PLL_PARENT_EN flag to individual mfgpll definitions.
- Link to v2: https://lore.kernel.org/r/20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com

Changes in v2:
- Drop bindings patch
- Drop mfgpll RPM patch
- Add patch to also transition pllfh to passing device
- Add fixes patch to make CLK_OPS_PARENT_ENABLE also apply to the
  recalc_rate operation
- Remodel mfgpll's mfg_eb dependency as parent-child with
  CLK_OPS_PARENT_ENABLE
- Link to v1: https://lore.kernel.org/r/20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com

---
Nicolas Frattaroli (5):
      clk: Respect CLK_OPS_PARENT_ENABLE during recalc
      clk: mediatek: Refactor pll registration to pass device
      clk: mediatek: Pass device to clk_hw_register for PLLs
      clk: mediatek: Refactor pllfh registration to pass device
      clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks

 drivers/clk/clk.c                            | 13 +++++++++++++
 drivers/clk/mediatek/clk-mt2701.c            |  2 +-
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  4 ++--
 drivers/clk/mediatek/clk-mt6765.c            |  2 +-
 drivers/clk/mediatek/clk-mt6779.c            |  2 +-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt6797.c            |  2 +-
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt7629.c            |  2 +-
 drivers/clk/mediatek/clk-mt7981-apmixed.c    |  2 +-
 drivers/clk/mediatek/clk-mt7986-apmixed.c    |  2 +-
 drivers/clk/mediatek/clk-mt7988-apmixed.c    |  2 +-
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c |  3 ++-
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++++-------
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  3 ++-
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  3 ++-
 drivers/clk/mediatek/clk-mt8196-mcu.c        |  2 +-
 drivers/clk/mediatek/clk-mt8196-mfg.c        | 15 ++++++++-------
 drivers/clk/mediatek/clk-mt8196-vlpckgen.c   |  2 +-
 drivers/clk/mediatek/clk-mt8365-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-pll.c               | 19 +++++++++++++------
 drivers/clk/mediatek/clk-pll.h               | 15 ++++++++-------
 drivers/clk/mediatek/clk-pllfh.c             | 13 ++++++++-----
 drivers/clk/mediatek/clk-pllfh.h             |  2 +-
 32 files changed, 87 insertions(+), 59 deletions(-)
---
base-commit: adff43957b0d8b9f6ad0e1b1f6daa7136f9ffbef
change-id: 20250929-mtk-pll-rpm-bf28192dd016

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

