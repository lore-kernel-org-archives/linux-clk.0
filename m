Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5A73CC7F3;
	Fri, 21 Aug 2026 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302389; cv=none; b=Cd5alzIuJRrx5JXUj2iRstsr5RlAIoe+zA/SfWsw14VanlSFXU+m6TmZoIhvXFW18Gu9w0rCKi8r0pXdgsxB02b6s1LI5oE+XB5Xq70NJW52TU1C4envbUmbAISCTcEqq/1qb3AT/4ewgthfx5DREE8E8E4aYvAVrI0R4C9PiL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302389; c=relaxed/simple;
	bh=bL7Vt4WOxuAc9LQzPkcAnQS8qZ/McedjYWszdtBF8lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lGrnuT1ij/93E9ULgmhGehbXK3j4Z9CRln83L0m9qdEVIsIuVfe4aNXJrrhVed1jHcTJMDYTEiCRAd6jiSVq7YvTpclrihUZYaiLS01jFR79VhbLv0/GAz7WPuRa7ocIot7cPXYBJMFRepJZ81rZ6n3oDin50fnBgPyR8VkbCuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BF31F00A3E;
	Fri, 21 Aug 2026 08:53:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] ASoC: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 10:52:54 +0200
Message-ID: <cover.1787239902.git.geert+renesas@glider.be>
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

This series is the ASoC subpart of Part Two, which fixes remaining cases
that are currently harmless.  These are still fragile, and may cause
future breakage when converting drivers to a different method for
specifying the parents.

Thanks for your comments!

[1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
     initialized (part 1)"
    https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

Geert Uytterhoeven (3):
  ASoC: codecs: lpass: Make sure clk_init_data is fully initialized
  ASoC: codecs: wcd934x: Make sure clk_init_data is fully initialized
  ASoC: tlv320aic32x4: Make sure clk_init_data is fully initialized

 sound/soc/codecs/lpass-rx-macro.c    | 2 +-
 sound/soc/codecs/lpass-tx-macro.c    | 2 +-
 sound/soc/codecs/lpass-va-macro.c    | 2 +-
 sound/soc/codecs/lpass-wsa-macro.c   | 2 +-
 sound/soc/codecs/tlv320aic32x4-clk.c | 2 +-
 sound/soc/codecs/wcd934x.c           | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
