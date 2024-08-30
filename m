Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0A718FDA7
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725028586; cv=none; b=tAhbys9LwIzod1/Xdwu5H9USiV34tZbSZJKn9+/4kO7Uujx16YPUcckUNp0s/WbIPKrNci8+5UyC6WduV48YtcUda6YO13rqmeY0Y+3Dh4RxRbPTpPPECPqpE08nc2FYqbc/xQ4fH1uwALBxZC5NQxkBPQH/sQNVfEGq3QkpnQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725028586; c=relaxed/simple;
	bh=GFCUEkDPIjOI5rNwaSxQkAP+95sbEoW4PhLzke3aM6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MJGT19R38j5N8OlmvJw7WGdAOSbHN2s/oahFma5clBf0Z2EgdpzzgAIpGBQtHMZGxAdfLGMgBLvZNloy5VZbqS5ajFSyVmo9vbDm9kmOFOm/nN8MWophvU8112bJB4uL/MiOoEdQ+LZn47iM9TyqqmRMkY5TTbTUnKBQIkYp7fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fcZh2k15; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fcZh2k15"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-371bb8322b2so1125459f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725028580; x=1725633380; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UuSosbrnBUtyi4cgpddHW8blUXO18CxsgMRD2yInBj8=;
        b=fcZh2k15RXLRbE8Mnec/XL/x16rUSrv0NKLO27x+QFPkAMqKuMG6zLsU5bUbYOvY89
         NlIynt4OEwImLrCl2UZryot3+gbNkVo8piTyQI50a7INsySNkl9JB9YwtPbwQh4dqb2I
         zpAZxPns1ZzJL+d3lFlvMSgo3JlVuRegrJM6lZ2ki49qx8b9ZRQi0Eh/GTAuK+eT3uV5
         lRz2XmNrPY24fgjDV8FToju80Kq07Pku0gC8s0QXrX4lAkWwVX+tvAR9ysfsJsKmXQMG
         zIEDaPaO4tekan4TcFEzAx+8MHGKuPYhDUZSXogF+AcHENxTku7nTxa0ZoQB+SWGj2Pj
         su9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725028580; x=1725633380;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuSosbrnBUtyi4cgpddHW8blUXO18CxsgMRD2yInBj8=;
        b=hOQO773BLpuwc0/5SXhknJy7ZITwcK6sfo/OCJQ5yoaEGZ4NCzyhtie57I5auPyFBH
         bTDn/giO/BTNyh/bTtq2NrxvTkXcDgzYBfNRkuxsIEGYqnRHuv5TFgSKXeuObCqY+Tq6
         klR39FKBGTicbuI238f2Im+LK/o5kBMv+za6lDGxqOPxrc9pmZdf7fUDIBf70KE7KUg4
         p4n/9CWDWAAJv1LXs7Pgs5KR1cBaV9R9Fv7ohEYJcg//1KAV6mZ3Mqy+UbbEoDkx1AtZ
         ISxN59EIqidro5fYzyP2jbDqfYYh+6BH1sxkybOA3r1xR+/Ho07qO2ZKl3ahQ337aB8u
         X4Yw==
X-Gm-Message-State: AOJu0YwcSmQjQbsiaUYTQYYZrVbYWILm6MRdWEZ5dJIfdS6zpyPKR1NA
	vo59ioGTEPHCax0szCB5DNWDaXjC2b/FWJz2T5uBF6lNa9HXe3U3wh1wZUxv02I=
X-Google-Smtp-Source: AGHT+IGOY3gmUUaHWjnzPpOy6rYtfWsTIjelTWHpNqSgaEg8pikha9CveNRGLuxLyj8JxoMGmo1L+g==
X-Received: by 2002:a5d:5d86:0:b0:374:adf1:9232 with SMTP id ffacd0b85a97d-374adf1936dmr1170510f8f.19.1725028579627;
        Fri, 30 Aug 2024 07:36:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bd15:900f:f8f5:46f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efafb30sm4177445f8f.94.2024.08.30.07.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:36:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.12 
Date: Fri, 30 Aug 2024 16:36:18 +0200
Message-ID: <1jjzfyrsbh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here is the Amlogic clock update for v6.12.
Nothing out of the ordinary: adding some clocks and bit of clean-up.
The only notable change might be the use symbol namespace for exported
symbols specific to Amlogic clocks. Those won't pollute the global
namespace anymore and will not be accessible to other modules that have
reason to use them.

Please pull.
Cheers

Jerome

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.12-1

for you to fetch changes up to adac147c6a32e2919cb04555387e12e738991a19:

  clk: meson: introduce symbol namespace for amlogic clocks (2024-07-29 16:47:33 +0200)

----------------------------------------------------------------
Amlogic clock changes for v6.12

* Constify some structs clean-up
* Add SM1 eARC clocks
* Introduce a symbol namespace for Amlogic clock specific symbols

----------------------------------------------------------------
Javier Carrasco (6):
      clk: meson: a1: peripherals: Constify struct regmap_config
      clk: meson: a1: pll: Constify struct regmap_config
      clk: meson: c3: peripherals: Constify struct regmap_config
      clk: meson: c3: pll: Constify struct regmap_config
      clk: meson: s4: peripherals: Constify struct regmap_config
      clk: meson: s4: pll: Constify struct regmap_config

Jerome Brunet (6):
      Merge tag 'v6.11-rc1' into clk-meson-next
      dt-bindings: clock: axg-audio: add earcrx clock ids
      Merge branch 'v6.12/bindings' into clk-meson-next
      clk: meson: axg-audio: setup regmap max_register based on the SoC
      clk: meson: axg-audio: add sm1 earcrx clocks
      clk: meson: introduce symbol namespace for amlogic clocks

 drivers/clk/meson/a1-peripherals.c         |  3 ++-
 drivers/clk/meson/a1-pll.c                 |  3 ++-
 drivers/clk/meson/axg-aoclk.c              |  1 +
 drivers/clk/meson/axg-audio.c              | 39 ++++++++++++++++++++++++++++--
 drivers/clk/meson/axg-audio.h              |  2 ++
 drivers/clk/meson/axg.c                    |  1 +
 drivers/clk/meson/c3-peripherals.c         |  3 ++-
 drivers/clk/meson/c3-pll.c                 |  3 ++-
 drivers/clk/meson/clk-cpu-dyndiv.c         |  3 ++-
 drivers/clk/meson/clk-dualdiv.c            |  5 ++--
 drivers/clk/meson/clk-mpll.c               |  5 ++--
 drivers/clk/meson/clk-phase.c              |  8 +++---
 drivers/clk/meson/clk-pll.c                |  7 +++---
 drivers/clk/meson/clk-regmap.c             | 13 +++++-----
 drivers/clk/meson/g12a-aoclk.c             |  1 +
 drivers/clk/meson/g12a.c                   |  1 +
 drivers/clk/meson/gxbb-aoclk.c             |  1 +
 drivers/clk/meson/gxbb.c                   |  1 +
 drivers/clk/meson/meson-aoclk.c            |  3 ++-
 drivers/clk/meson/meson-clkc-utils.c       |  3 ++-
 drivers/clk/meson/meson-eeclk.c            |  3 ++-
 drivers/clk/meson/s4-peripherals.c         |  3 ++-
 drivers/clk/meson/s4-pll.c                 |  3 ++-
 drivers/clk/meson/sclk-div.c               |  3 ++-
 drivers/clk/meson/vclk.c                   |  5 ++--
 drivers/clk/meson/vid-pll-div.c            |  3 ++-
 include/dt-bindings/clock/axg-audio-clkc.h |  7 ++++++
 27 files changed, 100 insertions(+), 33 deletions(-)
