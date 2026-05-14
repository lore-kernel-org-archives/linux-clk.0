Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E6C3D9686;
	Thu, 14 May 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761527; cv=none; b=tDkOKL3+Rw9OCL+wHx31gLkcP8NG6/n/h0z1qXY0+f+TBUM0AxgDEES9o29HNpEgnbEXefYrWCYQpocdOWjLjL57gbohOrYo2qt6l7E3a5emnx6bkiq39i+LL49H1XlGGxyaVfRpdQto23Lg87R/3GWS9VRC8oQpbvJhq2gjXew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761527; c=relaxed/simple;
	bh=KX7cPNWNQV3tTJGSzBFahn7mQVOVPuP673fOrBp4UxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hxw/74CqWQ7eJGNoneqbOE/kXU3i6M/1N65mQUrbDWCHAI6WM7FC97hBk8Iyk1SttKgFC2e4SjWJ2G8+1pYlsqE82ieMeZ4XvB08uD/IenJDYkOT1ift9+r7G/NWuRitRbijPdVkOZb49XB/VT5NXKxrKYNfhfTiTs2UjYJmAF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R4TbKiR+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R4TbKiR+"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5733B56D;
	Thu, 14 May 2026 14:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778761513;
	bh=KX7cPNWNQV3tTJGSzBFahn7mQVOVPuP673fOrBp4UxE=;
	h=From:Subject:Date:To:Cc:From;
	b=R4TbKiR+isuwOI8qDg0VeWHNUvma84CNwvHgaQRTKP6UwGvW4bwhotarVdExzrJiU
	 8jarJyoR4F/DHJOrz5+/jottgfew6S8iOtJP/GlwhF/PPvl+t5tE403CNuur83CY8Y
	 Offd89ylD8hHotWRtL7bfOBwPdaUpqVTnlxVWRsk=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 0/5] drm/rcar-du: Add support for DSI pipelines with DSC
Date: Thu, 14 May 2026 15:24:52 +0300
Message-Id: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABW/BWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3aLkxCLdlFLdlOJkXRPTpOQ0g2SjtFQLMyWgjoKi1LTMCrBp0bG
 1tQDj8v0gXQAAAA==
X-Change-ID: 20260514-rcar-du-dsc-45bcf0c2fe86
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=KX7cPNWNQV3tTJGSzBFahn7mQVOVPuP673fOrBp4UxE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBb8qu7RLSJGNdiijIDGQ9JxOiApet0G3sGId5
 zUiW6KMH8eJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagW/KgAKCRD6PaqMvJYe
 9WH9D/9CKruh2KnftyraPjOg9Z5+PkKDTx1ltVakbcxFbP3UGVyORJBeYpbecx842m9Vz6tsQ6Z
 opO8luYLP+533lPTrh/EbChdfvnxPJrnhfMOgSRhEvXUI33vsiZazNtZSQ9fBWUA3stHgrpL0VD
 jf30zKmO8p6b9Ld9oBCjed0hLfD1ixsEJx9UsMXrjjcFxK49zL10gCn+fd4/AqlkP+BP6QBlrNc
 wKdvTeBROpl67zCEARgRO739l+2RPrZUYlI4jqsa3WfNtv1IGrZ5E+TwS2xat+UKpXbWPjfkBuL
 HyhFwYj3KlkSBkVBbpjYZPg7uWmuNLDqi2R9ROFnTzF5yBdFyh/tNP32yMbp4ruJnh98Qly5PMa
 ForrrdereDmeOBDYJfiTtBUHExIGcm9bbIj2JHaUIMG8zVxZHlOWQiuxLUkD4s/ozY1x6QDzj5u
 qDGZ0mKVZwCAQs4achaSGb5DwBbcgCyqmffd9612sdaKdtTT5oSkpX7V3YO3RVwcgfs4rDA8QE+
 OeQ6HG4pGSVxU7Vv+GA6UAgL0Xl0Dc94dCsGg0f5F2PSjjZwhfevHTQ+pxbhY4kvRJdwJy/PKDs
 t1jQBhmFAtU1Bupx47XyBsvuGgYsHLz7HNHhwCkycuuJs4NROCFJYRc9SjWao5TmbnACWhLIN7B
 qCo74GwwkCGA48Q==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Some DSI pipelines have DSC (Display Stream Compression) IP block
between the DU and the DSI. Even if DSC is not needed, the IP must be
enabled for the DSI output to work.

This series adds a basic DSC driver, so that the DSC IP gets enabled in
bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
the DP output comes from DSI and sn65dsi86 bridge.

Original series from Marek.

Note: I see that not every run of kms++'s kmstest gives me a picture on
my monitor. Sometimes the monitor seems to be trying to repeatedly sync,
but fails, and the screen stays black. However, I see this same issue on
WhiteHawk, which uses DSI0 pipeline, without DSC, so I think that is a
separate issue.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Marek Vasut (4):
      clk: renesas: r8a779g0: Add DSC clock
      dt-bindings: display: bridge: Document Renesas R-Car V4H DSC bindings
      drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H DSC driver
      arm64: dts: renesas: Add Renesas R-Car V4H DSC

Tomi Valkeinen (1):
      drm/rcar-du: dsi: Support DSC in the pipeline

 .../bindings/display/bridge/renesas,dsc.yaml       |  96 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  31 +++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |   5 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |   1 +
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |  13 ++
 drivers/gpu/drm/renesas/rcar-du/Makefile           |   1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c         | 163 +++++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  36 ++++-
 8 files changed, 343 insertions(+), 3 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260514-rcar-du-dsc-45bcf0c2fe86

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

