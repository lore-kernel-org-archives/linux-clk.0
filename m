Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD0B4A1DEE;
	Thu, 10 Sep 2026 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053628; cv=none; b=V2NuujtX5zZIc1Vii0e8FBWYGJB1L86ZF6TIkkTPlXnfkv4zI8J/rpKaZbvq34XihvalqERgqyych/OOTHZV96fKbCeD0UfLAHr9a2B8rzjLJUTyiAkblvFlQWwn/deqdhgAsuma/gc8mUBrAAd+vF91svxJfiN7SsI7IULg2fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053628; c=relaxed/simple;
	bh=rkzUcBl2k304SJJoPUFSmGOHA1IleL12TzXPwoRlnA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NRZdprBc9rfuC1KHXPJ148SP1pKWogipYvNx8nOIUVPW6eSFysKfQ7DkDPAD1XpNWp6HAvQQkSONhpynoaM6afzcARYybkEeoOSHMLAZgKKKjjr5UjC94z82jJt4wcZRNFl0ming6usbwVb/2t/xBuvcAqbCEMLAfAuw+4LtMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=byESV210; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="byESV210"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789053610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GOsVFvfs9abJpzfdv5FE5oUL6nD9+8KoT4TO3PIkAXA=;
	b=byESV2104IdEMzQol13nxZzBPLHwFMyELAO/DcR57rXlxvXdp/QuJP/mMg3Rhj8FMVeHht
	INai/IVH22VDGEH7qixwE7gBl7bDTk6a6ZhRuQTdz9hD7cgZ1Y/iOdv1xstS40QezxGHU+
	oKPf6Cwmi76ypnMNkaSKzlWUygRVKcebi7hFsIRmn3Mmj0KE8kNsLTxkDedie00RqvQ4Ub
	/sj6sM0PjxD6lyMjV5d7S4Re3FOBZCzLre3Rsn1S96xmrp0RrbeM84iAZus0ViEn4jO9Wf
	yEuA8UUSYiH5BmBKVCKqKiFUhjUAh9y4oGQ/gu+EmxUgVEcBoTnfuy6o2QtopQ==
Subject: [PATCH 0/2] arm64: dts: imx93-kontron: Add support for Kontron
 i.MX93 DL
Date: Thu, 10 Sep 2026 17:19:05 +0200
Message-Id: <20260910-upstreaming-v7-3-imx93-displayline-v1-0-bb9446e6ed6e@kontron.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTtJKVTBqxAWpYw4BmrTAQIh3
 N2qy7f5/wChyCRwzw6ItLLw2yfklwzc0/qBkPtk0EpfVZ0rXILMkezEfsD1hgXytNUF9ixhtPv
 InrArTaXIlNpVBlIoRHrw9ps07d+ydC9y87cM5/kBVviVuoYAAAA=
X-Change-ID: 20260910-upstreaming-v7-3-imx93-displayline-b4580e542c85
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
X-Developer-Signature: v=1; a=openpgp-sha256; l=725;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=rkzUcBl2k304SJJoPUFSmGOHA1IleL12TzXPwoRlnA8=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWvRqVkuxX+aZq3+cyiSvabnVHPbMaEJMqaKkkaXfK6Lz
 U5OUnHoKGVhEONikBVTZJHit3htaxbrI3+sOgpmDisTyBAGLk4BmMhbQ4Y/HMtiWsL0Lnvprnjr
 pXeRLdk06bn1Y81IWbWYcz9EOJKKGP5Xe02yNr7659TZTZGxp38xccpdcWP2rz7bkNl5/s37po3
 8AA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

This adds support for the 7" LVDS panel on Kontron i.MX93 DL
devices.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Mikhail Vaniulin (2):
      clk: imx: fracn-gppll: Add 350 MHz support
      arm64: dts: imx93-kontron: Add support for Kontron i.MX93 DL

 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../arm64/boot/dts/freescale/imx93-kontron-dl.dtso | 104 +++++++++++++++++++++
 drivers/clk/imx/clk-fracn-gppll.c                  |   1 +
 3 files changed, 109 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260910-upstreaming-v7-3-imx93-displayline-b4580e542c85

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>

