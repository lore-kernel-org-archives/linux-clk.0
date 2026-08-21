Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC04766BF
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306939; cv=none; b=l2nEHYsElsIw3rBsmHWmdf3x75pXRcqDv6ADvnrqCYv9Fn/poJogYJTJnZDS7yqCqMTm+gVBORiJWMpwVnBuFmHJPiimbGYPvOgqoiWAbU7U3cVwwl7k/bup8tJm5Du0LwIe/lAeYZi0vVFhX2/wz0yBKcLMDEaab3KtcazVfCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306939; c=relaxed/simple;
	bh=lIP17C85lcagdDuhSPuN6BFoP0fjRRcDdqrUirAQ8ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejDYjB/b5I1eOe2X52gVclFSos/8ssFqJhwUjHTk4pZDIJkeIkclGM0xma8Ud2KhzsbxKdgfa6fE4/K0pwasTqcrUVpCs8g8d6AEhNhIcrs5AtUidOSU+xp9ql/Rc34QX+PgbhWhbxWZNW2tn0vSvc6B9N7t+wMCgS8hx5e1D14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52361F000E9;
	Fri, 21 Aug 2026 10:08:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] phy: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:08:38 +0200
Message-ID: <cover.1787240165.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Hence this series aims to make sure all members are fully initialized,
to avoid such bugs, and to prevent future breakage when converting
drivers to a different method for specifying the parents.

Part One[1] fixed all cases that I identified to be real bugs, in
response to a crash I saw on BeagleBone Black.

This series is the PHY subpart of Part Two, which fixes remaining cases
that are currently harmless.  These are still fragile, and may cause
future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  phy: freescale: fsl-samsung-hdmi: Make sure clk_init_data is fully
    initialized
  phy: rockchip: Make sure clk_init_data is fully initialized

 drivers/phy/freescale/phy-fsl-samsung-hdmi.c  | 2 +-
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 2 +-
 drivers/phy/rockchip/phy-rockchip-usb.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
