Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A82C0F7A
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769460265; cv=none; b=Xc98ZwCZLX3nrLB3qTyBVti9xNIIdxTvO5NvLvtojh/QsgXAbnL2eu6PR1aQ9aJhb1yYnLw0LQ67qsG1emG12lUhlI83ibds6Gq0nbBlCbqPQN7auZsu+eNIbM4PVNiKPqE1GkUSHQek4BKh34ozB6+uLBTabEpYeNR97fq+j7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769460265; c=relaxed/simple;
	bh=L9AP7K7IS/BQIX048gXZafEbvq5i3LmZ5GjfHPcHmZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHCY0ZIpHRoaQEmrU5+lyM6/jOeldoxlsCJFeFweYVzbfoWrlFv57GH2+cHdtrDYYQjlbUq9B9ZMmq39TwQHtwJQsCfPyaYQ8o8QlxKlzNmDrsU9rKuIsus7j9NzPiuSBjOuAW0V6iNmmZBKIQ0pyolFRJeBqPfKwWrxHmlUE5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkR7ZIch; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkR7ZIch"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so7664507a12.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 12:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769460263; x=1770065063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=VkR7ZIchUzw2IvxinDF+djOkvPENIRLYvgiBNtjI2F2z+7icPREl4+kobjooPMYQjC
         jhe4RXucN1zf8wQSU0mFbiqh3Q9ZyQzVTD4NhCgYSMiCisWMw7fwqKk+gwZ3Wh1Yk+7s
         WkVY4VNUi13N4zEKwBR9FCiMl/7L1S3sZFS4WY6vhilvVRnhLoq3rXMp+oQRTEdJ1N/5
         aboqkPCYDkSeN8BPhCPgt6tYj9kasHjchJyQ7tCpRaM5RgcW32odjMFIU4cJ9oA1mPpk
         X78sKcMucTI5/0kVA4i8H/Agrs0fxRu3+ba9mPllbUfO2DjgTiFni8SXxlyfc7tRRAJS
         YmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769460263; x=1770065063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=uEj8tAeAJ01nkPMgU/U/xqloQOVY13QOP32jWtIdnfbANHZQZiOhI8Hos2o9OdXrG8
         gOta64QHdA9pH8aMfurf9CuIcz03keZox1eln88AnE0pb3/BusDbvGOCXn8KN30QvzXu
         BO/KmiqUikt99aJ/ENd+TI/m1cg3PIeb8gb3aWhYuSsqUJEG/QL/fDPHaqIFSSemXA05
         keEmIhMF6JExdPqI6iQe3GRbi9Ia8xd+lj0PMyMb3ay3+5ja29D9mGyIdD3RFXqS5Rqz
         WK7t8b5IYwWWNvWmY3wGFxzP4qWmRUr9Lw9yy1RPCGTrcWwX2spgW2vokIFeWYhIR3Zh
         nJ+Q==
X-Gm-Message-State: AOJu0YzGm4eq0K0fzeTKzJ+sAfzbNvY5C8tnbV+mE1aAUD9qF8jpZTha
	jBboVWj4GmdcwLzkWjCHVAjJuYIj4EBuLwLMhPXlyXhb9gIi2kiLSszS
X-Gm-Gg: AZuq6aKwddK9W9/addGdbOEOXB5ZS7poWK2O1rAp9elXF7ebw3pqIma4QuxNX74/nJV
	HIXixCIXStDgKS7Hj0NgarH5I21zxYT83KnYUbknRWc/4AYGtXb9WXjmKD9gqwzymm6UPCwWAla
	+ZCx0kQXo/f7WBZrupivhLuxAdSsvcjwwgp6YZSOnyg/Jr9qN+EHNaxCcnW18mC5+/CA9F+PEXC
	PoZrI4jSnmMk5c5CkujxLoAaQlZ2ajUK8UynPuY6n2TxCll+pSFM97GQf09ZBnfXxEZ4TLsoA0E
	sCVmlIOF6sbOgWA4MwR2VAuzN1C8S9JYdzRSb56MwBYjUiGUe72GNwTf5OvkLSY+/wjFnG59V1g
	4gy0d6TA8DBvbGqR6athCOho7Oovulw/hqJ2XKcLkj8Jgu8YtasNWiJvclVpSL6hBFJi69huqBx
	Tw
X-Received: by 2002:a05:600c:4689:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-4805d0690c7mr104124775e9.35.1769453909695;
        Mon, 26 Jan 2026 10:58:29 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c3732dsm7296265e9.11.2026.01.26.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:58:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Mon, 26 Jan 2026 20:58:17 +0200
Message-ID: <20260126185818.78003-1-clamor95@gmail.com>
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

