Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259003C7E0C
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084562; cv=none; b=SS8Mky7mHPiu7JCbj27GFIVXgjRSnpNlPLlVRcEjCidvQo2hX/g7KZNtVMlXheS//+Yvs8RQm5JH3689t8VfWfQ2Gd+DOFEe9G5d7yhrk8B3IGCTBvawluiGh1VanjS9YjD4cZNCrPEWE2eg818TU5UR2ZLUrL6fzabLUlz9KfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084562; c=relaxed/simple;
	bh=VwbgQIaq3OLeFJ6TuVKcR/q4kXymk0heOmmzGHImahQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+vEpPvMKcH+wvKn4OquQ9ABz69uVhpmrrm4TyO+YV8wW1ZSWNwfS0/6dOls70GbJk94QP63FFYVcnTxdvvyfmZyS2UfnkX6o60PpndD8gUSg0Lib7/U6wY3k/IvJTNQ1oZunIbWg4eekB5UfgS3qmR0+LDELDRcwCuDVnfZ0sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLRjUbPS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLRjUbPS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf906b007so2661472f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776084558; x=1776689358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSP2hPPChRRMgpsEd3cMQjakL+sjPbtFmawJfDI4eN8=;
        b=YLRjUbPSe5dJMfqGZ5tpyR9f439RU5Ep/0SNL2adjyDKXVDhWUYxECN7r7H6ETVz93
         l1XMYFPcDB/An/xr00Tm6w7QcPp/fkRu2iEdXevP80oZPWlxIrOt5SnZ7De0bg5rttsv
         NzoVBcio6qooukfJVDO++IQHqQ+UNvPmLb+tE3ZKK60/w1pJIpXVRHx/83jrV2qEXe7u
         lSdQ7+pNK+gWPutZvhW9ItvtRMolY8ifrBslC+HeURQzpAIOsYpXjSCa5CFR2uJckxe5
         LAdC+NSjUKoJplULjf10/9Hmz2brUa0FVKMPm7yGIUuxhi921vpY+5iJiK6l5ABBDifj
         F1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776084558; x=1776689358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSP2hPPChRRMgpsEd3cMQjakL+sjPbtFmawJfDI4eN8=;
        b=bvNMM3DBARFj/u01+8OPPOMPIhYTQwOun/8zl6lOhJKsoaYYeXc2174iZ7H+4+Aj84
         eP2QCAspiotpZ9hDFAw2p+tMD8CqIDiydGg46qy0xpNvFc2uaIjGJUs90VLtXB4IOKhL
         zn4oEGCzB8ciMKTjY+n+JcbuhZGux3MerNjoGUU0VKoV1K77lupsvx0EWXkqfpsBzY1z
         GDfOoWu6GkAcC8WHz1ow71vmwapk2cu4sq6JEg+PYAJMGWQz9yakE9A10/yjdTYbHdAg
         sviWrwu/e0SDdnLk12wFWb4kA1R1GNoHXLAXiwgmd6BB0CK/VmeTQ9Gr3pwV27m7wcCW
         MVgA==
X-Forwarded-Encrypted: i=1; AFNElJ/6JMVmDoSG2mtG8xmxX8IUknq030o3XThT1Es2kU7j/U8oxSij8OpjOrd5aObgIL8A4IRDx3rup9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFpFvEjTmO1Xy+M5Gq15ixfimFZKilXcFmycMJthNTohcKKor
	PUzg5U9HmSy5hIVqh61nKtDivL3ljuqT2kbeNvBCgslcRTCAQfJoAR/9
X-Gm-Gg: AeBDiesYGXy/zEzug7euJhACQBvFbydXlAUBkIg9xd8i2z9Zgqj560f8vBmZr8XLKgj
	YC3He1DkNmXL9xA6xK837agIeLGrm/EHUhdxs3bPZV6UXAzmMhtd4/tNofjL4HAVP7CwD/CxceU
	wXKLaA916BvPJ2BNDsALlr3l2IqaeEg6OvvjQCDAqE2pkNUTfClzLmaMV7CQ1G8TO7gayKdi1qE
	jovK1D+ALEo1gYRH+yEnl5ruKiTRv3ynEw3qZta7cQt/1At5KGq3FiVEknE0DemKJVx2RxbAv9Y
	HMb4V/Teyp/94INQCZDpyvepwopelN2G/PdWaqAbaTgukdlKCpILxOvnd0m/7OmSonrYbPR+qyg
	yoFci/rjZ/v6pWe46zUswoxdq5tPUzFVftjrkFlID/gqGNEt962ozQLwPvYN0lbBoVGYd7F1HC+
	fD95LvUE+XAeYVSVkn7virA762a6JwozBZ9bV88aXljsI5Zjp0TCBoNqgmhu2vObIHZ7lcvYkxs
	Z72GF6LEkJNcKYEwnY9YGOvnX+pJ/nj3J48tunslx3NqNk=
X-Received: by 2002:a05:6000:26cf:b0:43b:4212:2ee8 with SMTP id ffacd0b85a97d-43d642b9daamr18907213f8f.24.1776084558434;
        Mon, 13 Apr 2026 05:49:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm34634318f8f.27.2026.04.13.05.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:49:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add some kunit test suites
Date: Mon, 13 Apr 2026 13:49:10 +0100
Message-ID: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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

kunit test case logs:
case #1 without the fix:
------------------------
[   44.288459] KTAP version 1
[   44.291655] 1..1
[   44.293844]     KTAP version 1
[   44.297411]     # Subtest: clk_divider_bestdiv
[   44.302575]     # module: clk_divider_test
[   44.302583]     1..2
[   44.310280]     # clk_divider_bestdiv_ulong_max_returns_max_rate: EXPECTATION FAILED at drivers/clk/clk-divider_test.c:71
[   44.310280]     Expected rate == 1000000000UL / 2, but
[   44.310280]         rate == 125000000 (0x7735940)
[   44.310280]         1000000000UL / 2 == 500000000 (0x1dcd6500)
[   44.310705]     not ok 1 clk_divider_bestdiv_ulong_max_returns_max_rate
[   44.341802]     # clk_divider_bestdiv_mux_ulong_max_returns_max_rate: EXPECTATION FAILED at drivers/clk/clk-divider_test.c:134
[   44.341802]     Expected rate == (4 * 1000000000UL) / 2, but
[   44.341802]         rate == 0 (0x0)
[   44.341802]         (4 * 1000000000UL) / 2 == 2000000000 (0x77359400)
[   44.349940]     not ok 2 clk_divider_bestdiv_mux_ulong_max_returns_max_rate
[   44.381047] # clk_divider_bestdiv: pass:0 fail:2 skip:0 total:2
[   44.388922] # Totals: pass:0 fail:2 skip:0 total:2
[   44.395783] not ok 1 clk_divider_bestdiv

case #2 with the fix:
---------------------
[   22.077769] KTAP version 1
[   22.080931] 1..1
[   22.083168]     KTAP version 1
[   22.086739]     # Subtest: clk_divider_bestdiv
[   22.091826]     # module: clk_divider_test
[   22.091835]     1..2
[   22.099869]     ok 1 clk_divider_bestdiv_ulong_max_returns_max_rate
[   22.100612]     ok 2 clk_divider_bestdiv_mux_ulong_max_returns_max_rate
[   22.107902] # clk_divider_bestdiv: pass:2 fail:0 skip:0 total:2
[   22.115589] # Totals: pass:2 fail:0 skip:0 total:2
[   22.122473] ok 1 clk_divider_bestdiv

v1->v2:
- Updated the patch#1 fixing review comments from Sashiko
- Added a new patch#2 to add some kunit test suites for clk-divider driver

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: divider: Fix clk_divider_bestdiv() returning min rate for large
    rate requests
  clk: divider: Add some kunit test suites

 drivers/clk/Kconfig            |   7 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider.c      |  25 ++++--
 drivers/clk/clk-divider_test.c | 151 +++++++++++++++++++++++++++++++++
 4 files changed, 176 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.53.0

