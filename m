Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771936;
	b=LANsAJl+c0pms6sR/R+IB++LodLyT3kC/4uA4JyV36r8krSeLKHt7sZ9KzdI7QGWFLgx
	 9LQENLGFsjAlQS5VnsTa1MP7UaRr6XIoR5nNOcEEk0hXdIMlDfjXGYeSj2Zhv0X9r+3DF
	 /UagHcDI4QByxs4hjLpcVXiJNVBGvSJIU2hn7Lrj7Kbc6vMygQq/0MgTtZpmLwEpducgP
	 ohCPMPHZXR6C1UlFHg4O/3zetLeAdie3WDnVmdepQZdiY6x3smUNJ8CBt8VRku/mfq622
	 xVNmiUmy1ea/pSNwhyhE9Y6tyk2tlXvHFqQ7yyf1WiFKRRGgFVvZuX//lEER/lWWFIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9xIvMSl489GZfxwmphM8YUW4yrYariUf7f4sziVKnos=;
	b=t8Ho8XGlIGW9bY1ijQbrtw5+tUlbtnrhDPPvZe1kN6zUWczQrT98KZxofgXtZ3NU/Tmd
	 FBfqWa2+YnbsJRGY6G7Qu0p5mTWrL4jOEjvIOVekUr4p5lf4vhBpBpQTKtFeG8emCyYQW
	 1LvpqM6qSqR6CzLyU9VyojM3zamon66tLUFCA5A0OdejkotoAYhES8pH5w+w656LRotET
	 feZz2nJExC62gwWGDsJAMxO9EKQfHecfpGo4gOf+SD8C6ROwFjSbUfYoHsWGWFuu8GSLn
	 GzoG2f8PcrLv3XsNRAvuqSR90HZp/tCbO7V2/zczXtLCVIfnmT5C6XFPlX/kW8Z6A+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8aLuJtt;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DED606A326
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8aLuJtt
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso227401a91.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771935; x=1794376735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xIvMSl489GZfxwmphM8YUW4yrYariUf7f4sziVKnos=;
        b=J8aLuJttePqvSGqoTtP1+p1z2IPE1DvFVdTunuPA2iw1VGMGh6t9sc7CQsJ8iMR6vA
         wyTmTQ3jWAhV51uB7jclKCs4WhNNSbpPJX0VLcEfYUSgm8h4WqF2W4rlCGimATh5KLpy
         FacvMpAMOx36KEre6UONSpxtmTSvko6Wpzf/syW18/pqfcN7t448/DtZNxuDmfJtX/go
         hZ4syqNqw66Guk6J8GGOC+wSPXvE4buhzzfqGxn+inHzd+F9oGoSA2QDLsaJejiLnl3W
         /mdfVocrBCmLJdcs8jA/17X0++i5bDiei7jWyDgJaRn1lMX98ETHRf/8obeVxExvaG1M
         rUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771935; x=1794376735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xIvMSl489GZfxwmphM8YUW4yrYariUf7f4sziVKnos=;
        b=sRk9HSnMjgo+IpVggM2fm48P8009zNTxWHp2fxirJBdDRHbb5f5az5WPwDSEpxVuNn
         AxlDPOJhfOLo2ClS+sshpcYmiUqCiQknVmEDy1j5proj4uwvkT4WQbSSJCkI6z5MmPMK
         WG4q3BNl3nat4o4BY6k6jFJh07ZGeFra5wdQpQ/O8dL4/jeEOAw6Bq7ZQ9U/lQ+3cmWU
         32vq+/QRk4TmSFzttsM/5dvx/V8sqbKkPuCMU76mOnkfaAMN8qhHkHOg1Tk83u7+4wCv
         tHkM3KLOQDNc5E7d0cohQqzYtSyGRDUjMIX1L/749V87INWsTjSuUWSTVw/YE1uQ3le7
         v7oA==
X-Forwarded-Encrypted: i=1; AKwUvBw98xvOolP47HQz/aQE3dm3DJaPHpeflMUxx0J3OQMTcYVIH8hRzeOK31yLmBRnCplBokT6MNgiR0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z96w5wLXHOdQ7zYdHh2dSzydTrxGMmySzbgPKe+bNEzbcWasB6z
	9c5CdajSWgUuIlUlZA7PSj1pvht2K867sqcXm+2ujH0gl8n6OTWH0abXh8fqXg==
X-Gm-Gg: AYBFou1bZmaQru0HXuLvk5MUe/PymPC4FPsAzjpsK4CoiK1bzMAABdMo/P+hiYeVxpU
	T500rE9A3QsQ3B+gU9yoDMz9fmX6LVgpOtUGCLXeyucOhvjFda5uVfkN6Km7FqWrSIepL756GwT
	gg0V/sXvJvYaxPkqhzukGOdJ6BLvp37OORXXoRRZaxJ1KI4WaYr86vo7M5/+wFjCjXkr/0Z7344
	gkmLcK0TE5MvTAT7RIPGGyelNHY7N2DzCatGgzEbTgUNYxErneCki5aKP8uAGsu0PpB3/uirvxL
	Mzk4gwK98g+ISlgZjrafc345wHtpNyenP+Q3Mrmdo3vNb1tE6HeIV4E+eO5ZHW6Kkn/Syc8S/hq
	9l4UnSgyrZ9Cf1/6bi+8a2qjIGWM3biimjhVfVekoq+9MRZJMEiMr2QVCTwrKwLqYQZNnuZM1Xf
	8xxPsYmS1qa2beCCS/+aA/7g2Kk4jXaYVsMamdqYifxrr7Wf9yq5McfyobjvQpy5IYEBaQkYTNk
	yJOCgnRJ7fRJbJc2XvIdPSYqVH6j+9+w0Xi/meZueIow2MHCvcPYd44HyZROtirAs9SpLlbuCUf
	4wadWEWMKEhd4rbEW8se7Vy05xAV9wP0s31N+oIs+d5kDmKlQH+u6SUePzXi9LME2CwgnUBiYQm
	iCLBVC8E5LzWey9LRVF+nqDnGauQqtMRTxRA5Hn+uzYeoElVch5BVT7us4FIiecHno8ey6M3ITu
	XlXA==
X-Received: by 2002:a17:90b:58e3:b0:3ac:80dc:f40c with SMTP id 98e67ed59e1d1-3ae897cca98mr12127224a91.14.1793771934974;
        Tue, 03 Nov 2026 21:58:54 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:58:54 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 0/8] clk: ath79: move the PLL clock driver to drivers/clk
Date: Tue,  3 Nov 2026 21:58:44 -0800
Message-ID: <20261104055852.152340-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ath79 PLL clock code lives in arch/mips/ath79/clock.c and uses the
arch headers and ath79_reset_base. This series makes it a normal clk
driver in drivers/clk and then cleans it up.

Patches 1-2 remove what ties it to the arch code. The QCA956x timer
interrupt workaround moves to plat_time_init(), and so does reading the
reference clock rate from the bootstrap pins, for boards whose device
tree leaves the rate out. The arch code also warns when a rate in the
device tree disagrees with the pins.

Patch 3 moves the driver, with copies of the PLL register definitions it
uses, and adds a MAINTAINERS entry from the qca,ath79-pll binding. It
stays a CLK_OF_DECLARE driver, as the MIPS timer needs the CPU clock.

Patches 4-8 clean it up:
- 4: use GENMASK() and FIELD_GET() for the register fields (the
  generated code is unchanged)
- 5: convert to clk_hw. This also fixes the AR724x and AR933x clocks,
  whose parent was looked up by the name "ref", so they were orphans
  when the device tree's reference clock node has a different name.
- 6: fix the error handling: an unchecked ioremap(), clk_put() of an
  error pointer, and panics or BUG_ON() where an error return will do
- 7: one init function per compatible instead of re-matching it
- 8: share the fractional PLL calculation, using 64-bit maths. This
  fixes a 32-bit overflow of the QCA955x DDR PLL rate whenever its
  NFRAC is above 107 with a 40 MHz reference clock, or above 171 with
  25 MHz.

The series touches both arch/mips and drivers/clk. Patches 3-8 depend on
1-2, so it would be easiest to take it all through one tree with an ack
from the other maintainer.

Not addressed: the QCA956x PLL formula. It ignores the NFRAC_H field
("hfrac >> 13" of a 13-bit field is always 0) and divides NFRAC_L by
25 << 13 instead of 2^18. Mainline U-Boot has the same code, so it is
no independent check. I left it unchanged until it can be checked
against register values from a QCA956x board.

Tool use, per Documentation/process/generated-content.rst: this series
was developed with Claude Code (Claude Opus 5.5). It wrote most of the
code changes and changelogs in patches 3-8, following my review of the
driver and my requests, and reviewed patches 1-2. It also wrote the
user space harness used to test patch 8, and it fetched and compared
the U-Boot sources for the QCA956x formula. I reviewed and tested all
of it and take responsibility for it.

Rosen Penev (8):
  MIPS: ath79: apply the QCA956x timer workaround in setup
  MIPS: ath79: move the bootstrap reference clock to setup
  clk: ath79: move the ath79 clock driver to drivers/clk
  clk: ath79: use FIELD_GET() for the PLL register fields
  clk: ath79: convert to clk_hw based registration
  clk: ath79: fix the error handling
  clk: ath79: give each compatible its own init function
  clk: ath79: share the fractional PLL calculation

 MAINTAINERS              |   8 +
 arch/mips/ath79/Makefile |   2 +-
 arch/mips/ath79/clock.c  | 673 ---------------------------------------
 arch/mips/ath79/setup.c  | 100 ++++++
 drivers/clk/Kconfig      |  12 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-ath79.c  | 593 ++++++++++++++++++++++++++++++++++
 drivers/clk/clk-ath79.h  | 140 ++++++++
 8 files changed, 855 insertions(+), 674 deletions(-)
 delete mode 100644 arch/mips/ath79/clock.c
 create mode 100644 drivers/clk/clk-ath79.c
 create mode 100644 drivers/clk/clk-ath79.h


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.56.0

