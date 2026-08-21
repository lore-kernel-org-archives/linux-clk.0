Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CA34751B;
	Fri, 21 Aug 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306685; cv=none; b=WahXoBfrGU8xbwsJJTJ7ZN0ffidgs9236uGoiBO/lMx65y9LWnSLEL+660iHgoYI7yHu9WP9LvbGqHuQoj0y5oBZe7caTjRSVGccdjB4Jor6rZYclabV/tOe6Nz/h3wjL9Kdxy2cniDqedyrmmMI6lrTXvlVsEAC+qro0KjNxRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306685; c=relaxed/simple;
	bh=+FlQSyN3kBveePfQtCtWEi+puBW1z+s/r4GrexnV6hE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8+rLUepBOkCSlsXOkZ13HL90OOc3iY3Ejeha2IP33x1s5eCkaYZCvf922fIhs9CmC5pE2g26YAvs0yHMXhquhVUqGWaIbKJwKTfksjLCR4kPTbOU4gF35OmnXIj2s14krdcUDsfNeZijNdxa3y2TUl5nx8rc8gnv60gtS6yR3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD341F00A3A;
	Fri, 21 Aug 2026 10:04:32 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] media: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:04:27 +0200
Message-ID: <cover.1787240035.git.geert+renesas@glider.be>
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

This series is the media subpart of Part Two, which fixes remaining
cases that are currently harmless.  These are still fragile, and may
cause future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (3):
  media: cec: meson: ao-cec-g12a: Make sure clk_init_data is fully
    initialized
  media: microchip: Make sure clk_init_data is fully initialized
  media: samsung: exynos4-is: Make sure clk_init_data is fully
    initialized

 drivers/media/cec/platform/meson/ao-cec-g12a.c        | 2 +-
 drivers/media/platform/microchip/microchip-isc-clk.c  | 2 +-
 drivers/media/platform/samsung/exynos4-is/media-dev.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
