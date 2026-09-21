Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F13BB10D
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986330; cv=none; b=kGFPfoLjoZVKKqu4snGqnWHtIUy+PXFP5yEcRmvKmk95uDC9isMaIoS9EB20UYyqVSZovoq4N/ty5+p8j26kB5XWDU6rgLzzENEVh7lW2bRhyWX4hMdWktUNJDc7o3TyYIQSDK0gWwdvg0G1BxqFg+3kPVbTCv5Lc9Bh36PjLhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986330; c=relaxed/simple;
	bh=2eomYsKhtyUjg78mXiDsoL3CzLp2fP0U1GQBuUbeoJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbyAYu2Bj4fDSsBglPAmHaBiQ3CC8tBIpGik9dhY8mY8Tlo+hW9LgUlBX6TNLt94Fku4rFxq6e3hUAeU2pYt6xhope0UlzqR6gfh0Yk8IoiIF72hCqLv0XAmmkxgesnSuz4pUnP8DQOQPhPLksfFDNBfOJAK2xiVSLDrCZQLlbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXpvxE8s; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXpvxE8s"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so2651549b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986328; x=1790591128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=;
        b=eXpvxE8sBD4ik3g/WHokPk6zdAIubfdm/S+e1wlUY+AjGnsaKXmwiJ+g4A9C0iBjQ8
         kRR2X+hCX0A6sI0Qgwra4Mu1O/ComapYzd+CBMv3aYJ0OE9F4x5O5V/8m8Tm1NSWPM62
         D/DfnudoHRslKf6bdso/0Oh4hwNjhpKK0pLiXls5wX6bC7ww/S+Y9/DpBRqq151ikxKz
         GOliGE8XVzgt0Xiy2/pb7jehsZytoSwcnrSyM0phGDQHB29cfTyNJ1N72kEtVfOMsJvx
         DeKHJMZDXhHGHaVWAjiX9+/Iph3yl9cYKj6/QcOmMEsMQc2YmdzMglH+RtDOoGl7EmTb
         OyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986328; x=1790591128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=;
        b=01xUBg5f0BvqV1RRllzwUlGhMAjZVGUKHmGtrWeM+ZEI5qHarEawc1k83gzyuyFjsC
         AIlwmUEIDsSSCOcBV5FzZWzgJYUNrOCufevo42hUJWCF1+O1rAhA8yN5HfVMH3JzL43P
         Jc5jaZWtSWOCTKpXJVlUL3LOHYS+juHz0Shq6Jvw9HTQ9kQ0JeD//no0YUvWuMstLneM
         rSr9+hAbcIADWPy35o4C3vxktwfLwpXfC0HjT6MvGgEi2kD3SbY/3joFk7AYKgRKieTv
         g4vIGTGybz4T6Bw7oBGYraDlKfzEoiTV0qPfP0495RE2BZpUJx2Oot8kw5JAgyRjPZrV
         +Msw==
X-Forwarded-Encrypted: i=1; AKwUvBzVCAAxOuXaubH6v9yV8COWzpH0fiTDs0h5OyX+wN0ZujFQ2IHGON4o0uBV2/KZzJ3sDXh1pWoScWk=@vger.kernel.org
X-Gm-Message-State: AFuF++lvoeK7OO0XIx3hMrttHsRRqF4awYie4QO7aSMXxK1N1uj7nDZR
	3kofdUh3R4zKgquPi0Nt4I/QhST6NWkx6Y1Bkqu98ec8b9pzKFO3Z0La
X-Gm-Gg: AYBFou2Js6hlpxBMkmVZ002DYiiOrTJXi+7kTsvL2kH3scidtP6eEJLI1TgfZgHPopf
	sHaNj2ZFjt5P3DVfwlZK99ixHhaNIhtFY34866v83kOd+b3n4SODc8JijlXm+0NWK0yLBTwevFH
	wbCMzAScbXmg+sdut23kcX5aaC336a6KbQIoi9uia++gzrwK5THiE5AV/L8mFslx5bN1hwbIm24
	SqjwXRyyb0QcMfeIHVuqAhpeN6MDt0kLtc0GGt+Mp4C1NVIplBBASbkf0cx+GD33f07qIHA6FnO
	/GTYgI5TxnS8Sd9OjmarCXC90zy4vGFsuBsyrBslWmzj36EwUrWCOHAbTGb/K1/tieeTh9CgjS3
	JncSwgrWs/Mdb8XACm1nrN7OK1GKAyO71aILkz6ycVvbZf0F9Q8EhnSGIe2lyeso3OavSHo76o/
	XppvbsPS00iov1aYsJFheu8BzJX3iAQg7VT8FsG6Zt28pB/3K60lTTkblBTI2KOyk8E0/G0t4MP
	UTkoXllsCJFnpDGrZSNXK0tCzPU
X-Received: by 2002:a05:6a00:1911:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87834e7a3a3mr7459656b3a.53.1789986328468;
        Mon, 21 Sep 2026 03:25:28 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:28 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/6] clk: mediatek: Fix descriptor clock ID allocation
Date: Mon, 21 Sep 2026 19:25:16 +0900
Message-ID: <20260921102522.1640072-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several MediaTek clock providers have clock IDs that do not match the
size of the clock array allocated by the common descriptor-based probe.

Add dummy entries for missing IDs so that the allocated onecell data
covers the complete clock ID space used by each provider.

Akari Tsuyukusa (6):
  clk: mediatek: Fix MT6779 clock onecell IDs
  clk: mediatek: Fix MT6797 clock onecell IDs
  clk: mediatek: Reserve missing MT8167 clock ID
  clk: mediatek: Reserve missing MT8173 topckgen IDs
  clk: mediatek: Reserve missing MT8196 MDP clock IDs
  clk: mediatek: Reserve missing MT8516 top clock IDs

 drivers/clk/mediatek/clk-mt6779-aud.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-cam.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-img.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-ipe.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-mfg.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-mm.c       | 2 ++
 drivers/clk/mediatek/clk-mt6779-vdec.c     | 1 +
 drivers/clk/mediatek/clk-mt6779-venc.c     | 1 +
 drivers/clk/mediatek/clk-mt6779.c          | 1 +
 drivers/clk/mediatek/clk-mt6797-img.c      | 1 +
 drivers/clk/mediatek/clk-mt6797-mm.c       | 1 +
 drivers/clk/mediatek/clk-mt6797-vdec.c     | 1 +
 drivers/clk/mediatek/clk-mt6797-venc.c     | 1 +
 drivers/clk/mediatek/clk-mt8167.c          | 1 +
 drivers/clk/mediatek/clk-mt8173-topckgen.c | 7 +++++++
 drivers/clk/mediatek/clk-mt8196-mdpsys.c   | 2 ++
 drivers/clk/mediatek/clk-mt8516.c          | 2 ++
 17 files changed, 26 insertions(+)

-- 
2.55.0

