Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CA02E7382
	for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219640; cv=none; b=Nd/QKVyDOhC0yoL8nJZf9YE+rf2HCJ5XaNUZrQa+vl+hw1BhJ2dviFg60gUkEwjFvxO2ONiDl60SJ1XrSmuFowRlpwG06xBCB0/IQmDOjf3O6DUyo78PknjMVCYbDP0QQbGDvA2dvlQvuJr3V++96J6UJGdolL1T3wtR6kV34Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219640; c=relaxed/simple;
	bh=L9AP7K7IS/BQIX048gXZafEbvq5i3LmZ5GjfHPcHmZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FG31BS0FgC73kjRMetEKMYRi1nfSeAVF4bdtbg/fZJ32hatCT3Lo8S0ixHGlVCTC9u6NQV70FkvzNUCdiZM7NxsBeiZwWuhb97BSXEX/gKX2sLgWDJ3vDdvzEqJtQo40e5R6hpn0cjx9pKwZThzLA+SZUcl6Ac8koQkk6dmYsnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1kJNNGj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1kJNNGj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490a765e68eso3063825e9.1
        for <linux-clk@vger.kernel.org>; Sun, 31 May 2026 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219637; x=1780824437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=Z1kJNNGjAxNY2MDRSHYUmFg5HRC2toh47FoBTvuTRF/WAcBI8NPZTTyc9UarLhWVDf
         XHhl2EThExpE3pWWC7a3upvSk55xlQIQedCOC38ZinNXV/i1z79EFB9VSkxwIxjc7nRl
         +pBDES1vo0DUaWptVeZ10YE3djhEJi8X7YQ3EFVRpLlUgymp8x2cDbx7lQAqkbeyym2t
         uw9xP22egEVfqG66ktUBN5h8YPAwC6OKj+MFDarpg47G01G3z2yqazDvPwT2/35nug8g
         tSuacz3aXApMKBSY502/g3Bw57PGr3JkEGxOubMztXefmIEvvwLIgSJ3I7hckmpSnRUh
         jcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219637; x=1780824437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=HJfvqQaJk34j/E7JVFbaNkORCt1Ogvn2RBKSI2lTo45oSnFC/bQjoU3jsFVJu+7e8m
         wv9WAFTq1rWbFRHngAx+ARGlEaIKEvdZ9qvBomXGf09JN+CaV0d5Y2qew12tBLrLehlO
         x0fVG9G8N7TkOeA5jZIQOGPWTs0nHXb5taTh9iF15lGjzyMXHfcVD5E7dmKTirNM2nXg
         TBkVJ6HRkIzRAOY8w/mxqg+DV67LwWtvgfK+x2MrZSorCN7xo9qt+4Ea5BuRpK35vdlF
         o0rlNxkxW2RJR25a8Q8tjR1yXPPLr4YKRqOu6Ni2KFTVS2M4CWO8rRWZ3XfAtO6+oTRZ
         22AA==
X-Gm-Message-State: AOJu0YyITiD+ArZNkJX9J1YolXAv1CSqyGxkJkFmy4wLZPxNCLptuXwY
	oUkJX2NXL3R3ebULkWo9ji0XLPzDdhX26myX1xMrQ6fi+/zcLBQz6LEkppz55Q==
X-Gm-Gg: Acq92OHd6fc99914T6sl88JV/tyGj039PxJCtgNGWz7NE0nL8o0FrJVK/wz93N6CQVz
	4BqwmE1TCgUUx49y55OlEDj2UZNiaTA2vc8iiN5fdumnO/9GblZ50HPdlVdHvcOL2xxYMUuF6Qt
	szRqBzCuqaIwIeC0igdSmruqHXpz9vjWwKMmybvI02yIxtUNUf7niaecCHp2pkQaPJQ4v4seGhT
	z4qPAEgTmhTwOGKI4Y9ij6WPfR+KoSuT9HQTgF16c8WMGQ0qkAplkbud2yFdvBc3YeJPR74R2Rn
	QLeNZNKcor62eJH5DO7NJbTX58p1zJVVF0J6ef7ICSXE9RQuvcy/bY/jtjTGq5gwKnSeUHY1zM5
	Ltjhcc/apW8AxhwNcjQhobLfI2x4sPTeFVfipqQGg77Rd4uiu/IhlxGjYdfXyNCB33ocT+ceRsM
	D3Obj8ca1ERQOglUE7YWZPnMA=
X-Received: by 2002:a05:600c:1d28:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-490a2988decmr123585405e9.32.1780219636921;
        Sun, 31 May 2026 02:27:16 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0e8c1bsm68462675e9.3.2026.05.31.02.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:27:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1 RESEND v2] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Sun, 31 May 2026 12:26:52 +0300
Message-ID: <20260531092653.12589-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  clk: tegra: set up proper EMC clock implementation for Tegra114

 drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.51.0

