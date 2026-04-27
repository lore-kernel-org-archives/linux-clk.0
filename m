Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D33B8BC1
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289324; cv=none; b=G5Kjrid3D6bZNkXEf8+HHY9uquCM3ZLaxRNBFGoYsCuqNuF+c5Btr0wKFkOeSM2Eflkv+62qoeT3F2RBguHuEZWpA6rgFTVZNuh1NbKbXtxGNhpJ/6HExv+Uq0PMnVcHnC2ru2c/vOLHeMvPHMtMkwfwEOn/pupEhp3JhDRMX+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289324; c=relaxed/simple;
	bh=2JKzYfN+MJGLPvHkAbxjuQEHRWIHSgPv4e/R/kdMn24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZ3VxCbx/WTQaqvEIwMpkwGS/Vq8aHZUG9u0FPC01A0wV4WbbcnAVcfCtF39rauZnfGp63QOzjGqDlwLWvHICVNyPCdBE4JmUGUGX10rIIlExTNlTBDvK2nvleTbuEZy5xL7k+xeisLBf5C8vdQvBibKGUxHlmhXD8gKhT8cWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu5eWBRy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu5eWBRy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso84472395e9.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 04:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289321; x=1777894121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVOzV4Uc10PzeUcUQ++usc4lm22yOkQ+jtrqe01beWA=;
        b=Nu5eWBRyVV5teBxj+6MDtrBUmM4SkN1abCwKimm++Dqk2asZMVvupy6zwMOIdI5dMh
         ZT7SZLGlAHhTkwVCsjEC1MvWuFnJy9YJmSVi8VwKLcrUxRRIlwp1PPk2wsmd0YnP/ALI
         zwIAU4dkW4O6ro4hEK1FUsXkSGMXPC1VtrTPBaE3Gf7HhRHlFC/7QPqJHqcVXv8Xc69H
         WSixYF0NoQZ4FlW4tsDZd3yP29c06IkE9KnGiGW18M4D+0PZraOhgPG9iq9aFuBPmWYJ
         UavQ8k0Yaogm1SR3AwCoUaW1j0ne5SI0MHfPgXT4hV1MCszpB67j4t7lWAYF6trBAFcl
         Y4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289321; x=1777894121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVOzV4Uc10PzeUcUQ++usc4lm22yOkQ+jtrqe01beWA=;
        b=P+CwkDl9R1+kP6G50sSG/9BDMdyVZKBie9tIm7UtVlmZmdG6I/ET/PhosgM51HBxAp
         r2ztZmMrYg+yChkahxRdtIymWPIokviyWnQf4suCjIhWJXKxT26VHk0ntxhz3ReUHBYs
         ns5+NCdVbFtEFAGq709D0KTNnWUOFUcn7CSSI6JaOCYcJKD/6uJbVCMBGE3oZxnTwpO3
         leEjna1m9Wk0tmEfRH5abeASPWlwFIx/5XMKT0CIFd7V8N+XdYqzuRKuSQYULYQ1XGS3
         jKPyMfPl/F9kacGe1L7LaZ446RjRulCD/BmBLhnmVDDvBEwl/S09vtFexAmWbkXVgpvp
         jsRg==
X-Forwarded-Encrypted: i=1; AFNElJ/+dv0HJeWtzAzR9YmWHvC6YaHNskTUBOU9AOlBb23tDS2Iszzwov43LBPd37e54o/EUmL1P61/KfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YydGZiR53XCRU3GaZzEyIzpw3TJ7RZk3jwd0w62PLtuwP7bcJxG
	tqhqoLhLvoR388zg+51kD0MmCrJQLpMWCmfuTJ5GfNAqmF1Pj/nItnlk
X-Gm-Gg: AeBDieuYT75uN3G+2+lrOUQB13UMe8EGZYEACb/IUGf1XecbN62rtpxhJri3jCzbrQ5
	iEYQJkG2gjTDGEmw0qBE41Avde097zLRr3ft3SCT+Ikrpddm7BDCcRryhqgMohGQf/mN+xISgo4
	6U9Cdavv4qcEFAvnuV98iK1oeAM4vGXYzAhMYQ3SFviSq8rvp9ZsDLmCeCfxM05WyqeNjI26hPQ
	d+bVCTPKU8135OP2Hmm18FB8jMT+qcXR/+f0Q5ccYStBfh4Sw0WsHkMWtARh8JZ/WTnuUAPChBF
	4LkwLpq6JUc/uW2N6hekptprPC69WV7BlzksTPt0CsdZwhmOTJ0NFVpoPgofvZfh0EgActPiNLn
	vLOAVShrYtv30Lcaf3pQXWsE4c2ixaXhpwK1uHmGvEznueZh82MtkBmsuYHjwjXqPCPoAr2a2Jg
	cVexH/A51ip6Mk9tWjklfo3UCpX6ZNBSsbk6Zc8WPC2cZibGhtpaJGuNPJPa7hzLhvNNZD3ELb6
	ZoHIQIDXjKgFbzga57rkxanTs+BgyZZXhITOHHsM9oIZ+frORqeiuJMjQ==
X-Received: by 2002:a05:600c:46cb:b0:488:a723:ea53 with SMTP id 5b1f17b1804b1-488fb744fbemr612268015e9.7.1777289321307;
        Mon, 27 Apr 2026 04:28:41 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3f97:a47d:8f30:c055])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm85759519f8f.6.2026.04.27.04.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:28:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add KUnit test suites
Date: Mon, 27 Apr 2026 12:28:22 +0100
Message-ID: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes two patches. The first patch fixes the
clk_divider_bestdiv() function in clk-divider driver to return the
maximum clock rate supported by the divider when the requested rate
is larger than the parent clock rate. The second patch adds some
kunit test suites for clk-divider driver to verify the fix.

v3->v4:
- Dropped unregister_fixed_rate/unregister_divider/unregister_mux wrapper
- Added entry in .kunitconfig file
- Fixed reverse christmas tree order in
  clk_divider_bestdiv_ulong_max_returns_max_rate
- Updated MODULE_DESCRIPTION() to be more specific

v2->v3:
- Added Rb tag
- Swapped the order of the patches
- Added the expected value in the fixup patch

v1->v2:
- Updated the patch#1 fixing review comments from Sashiko
- Added a new patch#2 to add some kunit test suites for clk-divider driver

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX
    handling
  clk: divider: Fix clk_divider_bestdiv() returning min rate for large
    rate requests

 drivers/clk/.kunitconfig       |   1 +
 drivers/clk/Kconfig            |   8 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider.c      |  25 ++++--
 drivers/clk/clk-divider_test.c | 152 +++++++++++++++++++++++++++++++++
 5 files changed, 179 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.54.0

