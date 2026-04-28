Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0C43A759A
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368716; cv=none; b=kufyW+M6fiMvAkxtQiurejT6TAZio8ncD770c/02ORR3PsykN0mPIgCapHG02tvljhlQNWjIhbYnLGfOBBRub7TbtYBj81WuDF2U3OxY0T9m9aXgl42ZAAZj56HZBFRKAYLRraYlbTm1HZzXMiMqdasf2V1gxt8eH2ZKCwMiEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368716; c=relaxed/simple;
	bh=I92Yi+tkT9CMsn6qUnkOf841AL79dYZlftu3M2rJuaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drQWZH084LncahAhgviBzFy6d7EacwMbH+k/ultroEKmSk4xkl2qLzUJrymXccz53Avv29KGsC7yntZkDvnnpf5jWSrPfLHJJLZaJri0anRoEma9zRdskoEPB9WcWO0KxTp10SoiVs7M+BaD++gDa2pmkXp9W/gFxC64DSJkRKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHdyNAeY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHdyNAeY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfd832155so8264802f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777368713; x=1777973513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87wpdJkdKpucr71Tqb7S+bFMIF1JvoBzWRG4dGvBKnY=;
        b=IHdyNAeYFYTbsBLfR9uIsKPXmcwPwCg5AKWdhRjA/rlyLbybcRwFMTIIil19wdpE0R
         9NbAFp5UnY5kPReBfgt5/dXQepymeGxgC7r1cq+cESu4OMPpWHnYNhUIRHmrdoOYPbQN
         2Bg53hUvwTRsQ9cPobsRwttuK08ixS3Ft7ZLnbjm4/1ki99sWvfSmbJMRou/624YSPxk
         lF5Rr3WGBZHeVGkSRuehqfDPcRnPRbdkT75H9u8SXXX1wF+3WzshIzsJX5cJBHFbkxcb
         b2eeM1yfg/Mt/VfftG9NuGOknLytDpRXw65dW/s0VgwKn5OhDXORQoAsVecl1mL5nKkE
         tnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368713; x=1777973513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87wpdJkdKpucr71Tqb7S+bFMIF1JvoBzWRG4dGvBKnY=;
        b=a43w9BcXNdW22NhFWOw8Yw0uIRUIyu1ldLrrqgHhpbLlyG9lP81KL/8kwDivAhpv2o
         ApHdTsoaqg8NdXnRfJQum9OSdJ+ta7RKHUr1f54xqo4asCrz4RjS+5CZyKbRJIJHZVq0
         CsdOGA4SKnQjidw5AWT0N5NWzL2GyVrQWkhERD+qWBzYrUwZeB/0Eg0OncYX7bCTeZNz
         OQpllJCiXIAQWXwYP7K1BHUHp4tO1I9kdIrjRBZJ7YIY61DmUN5FsIxw6mBzFzI1OrI1
         TKcKHH0Ve1hEnsd90jaaJqrgV/TbRm16TeWPzFcQ3KmV4eydTwBnHQESFTk9INtq8znn
         sMEw==
X-Forwarded-Encrypted: i=1; AFNElJ+YUErxpofOTRzHJdHqVbQ8GRa4ZthrnFhV99kNjcnXMXbi4Tr6tqi2PRB0hfqT+q+DZidq+impF00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLmQruQzpXCZgcNT69EnM+HM9SH2Hva+mYaWtXkIFzw6Kfv6x4
	VtNofLqzsIrOEHmgHvrNrqryYemxFdpPj/f8tENiK2BqCV+cM+R2AzE2
X-Gm-Gg: AeBDieuOMWH7J3LmK0MhiPwCWwf8bAwYbSZD+72M+acha7bpov9IiOgGKn3R3fOyWVB
	eBU+H81uaeu46LxmUMqYFCZ0maRUeesqxZQOelo0JbDo15DKTwSv1gsaxrf1l924M03LKw9YbHb
	IXOTwQisu5yVe98IDiF+bx1ilMdyw/cyd0voQjB5xhUK9xIQvdM9WwEr8rjgueEaLAqTkBE9Dty
	cLhLZasEIQba5KIkKzlScybek7iQPhDowKzebkPgQz6kfkhVo8Gy3vVV2Sxic8tOI1XINHleNae
	Y6CpmNqDKOpkogDnv9NMSSq9WaFFKO6cLm8dP4vRbJz7OAI6oH4yxX45vNF/0WEcLIz0LmvgroS
	WVOdS1CRtBTAbQH3oK6fhCkGIynpZin2TTuZoSFg93fjYZaGrKkEW0oG7G8m8eBpE9NMbLscI+f
	5lqs5bicow/rsaU7A1TwReEFZ4KgvAm33H1rCLdtmytIs58FixlJ8/jKMcVNShbsYE3Joh+mbFB
	n0Iye+chd8Y+vd2gEkiPXctbXFmb8QsJM1ULO6qhGvq1iczmTxkw028dAc=
X-Received: by 2002:a5d:5d11:0:b0:43e:b0f7:9ce9 with SMTP id ffacd0b85a97d-44647dd17c1mr4172953f8f.14.1777368712974;
        Tue, 28 Apr 2026 02:31:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8851:8e5e:9c47:30d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4464004ed80sm5389589f8f.34.2026.04.28.02.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:31:52 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add KUnit test suites
Date: Tue, 28 Apr 2026 10:31:44 +0100
Message-ID: <20260428093146.3171672-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v4->v5:
- Made use of KUNIT_DEFINE_ACTION_WRAPPER().
- Added RB tag for patch#1

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
 drivers/clk/clk-divider_test.c | 153 +++++++++++++++++++++++++++++++++
 5 files changed, 180 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.54.0

