Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831E379972
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647893; cv=none; b=DDSaLL18WU9uOhspR5cMj6ZZjUbreWWM8RcKxd9uYp4ynb2OQh16O5D2qqGgDZ/urE5LDcYghb+yzR17YXtyOijRH3gaItHhcl2ZvmMHMXUOLjjKsyePCszgTC5kscRSsMR9moFvUObkVEUunZjqUvsiFQF5lUqJ1P6Ee+xCAUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647893; c=relaxed/simple;
	bh=gMs9rkyUtRGBkJwtTCnd6ntqEwwKjKQ7OEelBccwclk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQs59AJXC9zmT151Q4t1Q+NuosRnODWZ8DATJTZv+ajPlTdfu2SaI7qYSe8XoHWquDlo16y24GdFVqDuIjKn8oEDG0198uRjhXzsc79M1RChhjbA9Vs1/36pfaNXcTYkW+ltRXw2knriIw/5STE7JzGvVea6tOUzzx03BJ+fEZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBiY6Knx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBiY6Knx"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8297310ce0aso557171b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 10:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647890; x=1773252690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CAARsnlrqcfDm8ekZAoMmoCRNxm299rJHElT0uztVl4=;
        b=gBiY6Knx+0tK/SlWMl25LYjS6PYZFOZ/c0J7EANeXSgZKMs/A05qcq4Mdbc+KEU52z
         oAeUQhyFp1JkV+JAzxt9pr36qNZXPLH7xR7fdcclPBTqSA9V7X3ZkeC0UwjAJkJV+TCt
         swmIzFjrOYJ+SWs1r4l1whnO1b/8H9BUte0d4HY5WvpRTUeqxzTCkejSp5KWeoquJsp1
         rXnUaGSPCO083t5zruzpixiJXl/qBuhh0+rxrlhINGK2EBtzZ/E01uLWk+pBO1B6C9B1
         jhAlbniHfBmzJptnimVnMTHYM18Nl0K/T3mXZGr5XhpN4dgcCOm98bBzEha81k52i5ff
         8vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647890; x=1773252690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAARsnlrqcfDm8ekZAoMmoCRNxm299rJHElT0uztVl4=;
        b=dOqyhRLiuZnF4bPa8FSM4/QeQtd3bDuwRpZDNTqwyDXEmOYp6XkwizqJOTICcmiIcS
         9qw4z35kyvOew2T9zF2DkVsla3KSnhGF1xUjyk5gq8Bk3DAz3CSfKvl9bXeIMHnAsfKT
         Gmte+cF7rF9INhGmFDf5bajEFo4DSUzv7vEDtYvqAHp0wVQR2RQ/SvJGkPimR0kuYKxR
         Sq5QETHBnznK3PeGBFt3JniDybFOQ1QzzWVWRALJ2OYoGEqNeX47/jtMbzdoqVizagNI
         XXvG7jCF5lw5Psqs1XGbZA8SG35DtKhBBcC/FAHVeaUpggUrgmJ64JYUH8MPSI/iHgsn
         3L+g==
X-Gm-Message-State: AOJu0Yyw71nvAChhbYMuIE0bEt56MI00kLRM5HxIKM8rRrRbS4Xs3D7+
	MK+fs2C4gfyVpDQut9E0DGDIJ5oGWboCDX4tcDkToywKXYV1TYlJf1/v
X-Gm-Gg: ATEYQzwCp5MkSxmkh1QV37Pz58ao8A1IeFiAtdhNNg/sacbeMLRFAQ0tAHnMl6qMxvb
	Q2ydTmMKPlb5sYmOsbMWd2FEImjSoPIkH0QJDHE4QBbTQSq5RhjSdjfjQEzjB9tq+gWvM7XE3e6
	NULDXODEUgPlhDoDAv/njSYnMXYU2wUH40gsOQzFlLne3Oc4Wrk5YZ2KayF0+ElQWFGkJvm6Xi6
	3koZo+2yLyfY8NecVKbCuN812ExGZjyIc+9OCMnFiPCNRsf7Fq09IHdzlp0UtnNnHhIcR+AcALj
	g8dsxxJV4TxmsRv8OrR9kQWZW5dIWkgK+rufeV/bH6hs7cQNbm6JICi1XkWeN51qKNqfgweS31V
	llbA0LRCV7v9tNXUYm8kgzgQKvVbFELqhx+IAyhpU4pM2vuXDux/F/xCr35rCF++c5ZVx/orDuV
	zaupS4+McuwHJ0WuXFc71MUqjfo596OR7kM7kvYYKz9D7f5RjoeVR5RBaMSnxNrv3tFaJMJ3SNM
	dgS8yU=
X-Received: by 2002:a05:6a00:a21b:b0:827:433c:ba7e with SMTP id d2e1a72fcca58-82972ca0908mr2672299b3a.41.1772647890346;
        Wed, 04 Mar 2026 10:11:30 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:27 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/3] Refactor infracfg drivers to be able to use common helpers
Date: Thu,  5 Mar 2026 03:10:21 +0900
Message-ID: <20260304181024.738391-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the MediaTek clock common framework to support
cpumux and converts existing infracfg drivers to use the common
helpers.

Currently, many MediaTek clock drivers implement their own probe and
remove functions, leading to significant code duplication. By extending
the mtk_clk_desc structure and the __mtk_clk_simple_probe/remove
functions, we can handle these sequences in a unified way.

Summary of changes:
- Patch 1: Add cpumux support to common mtk_clk_simple_probe/remove.
- Patch 2: Convert MT6795 infracfg driver to the common helpers.
- Patch 3: Convert MT7622 infracfg driver to the common helpers.

Akari Tsuyukusa (3):
  clk: mediatek: clk-mtk: Add cpumux support to common probe/remove
    helpers
  clk: mediatek: mt6795-infracfg: Switch to common probe/remove helpers
  clk: mediatek: mt7622-infracfg: Switch to common probe/remove helpers

 drivers/clk/mediatek/clk-mt6795-infracfg.c | 70 ++++------------------
 drivers/clk/mediatek/clk-mt7622-infracfg.c | 70 ++++------------------
 drivers/clk/mediatek/clk-mtk.c             | 18 +++++-
 drivers/clk/mediatek/clk-mtk.h             |  2 +
 4 files changed, 41 insertions(+), 119 deletions(-)

-- 
2.52.0

