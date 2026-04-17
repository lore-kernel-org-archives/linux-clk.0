Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA403793C8
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411439; cv=none; b=sEM13vDRcafoPxjXcj7IC1Hu/GKFRrUo4W3avfr+VVO7QB5bCvxdZZIhitSRdXUjlha1Z+ONb9RR5A7X88DtY8JwofBLdNIaALz84dgTwpVj2ATPxjHiQuK80Np4Il9Kw6ojlydFePlbVnLYRfr3/tU37u8u9hiFWLoWwrTaUbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411439; c=relaxed/simple;
	bh=XcTpqX3ydnmlIVYB2Pz6P25RXMh6Xhwymj4ICa/xzbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qg9P+khwFML5DEHb8CavytHipLoKwTngjweRrGlYkXux3ZGKKWZPaBx4JWGLuabh87PU7etqdWdQpDB3haKiIgcJPaBkNKY6DzNeCPoYntiTCVpBzLlSG3dx/bBxboB1NLpLBG6fZ6y3d8a9InruOHPg0sOBCdYeBEz+xJo3LvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISfRekBt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISfRekBt"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a40502e63bso422146e87.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 00:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776411437; x=1777016237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=314R3/793GME6eVVWj9ZOy0Jnf6xNE5QAaULeE1OxQM=;
        b=ISfRekBtRa4kVj+WYV1yNj7RucY1P+CzD/fx8sdg6cLDuzh196QcoY51dpjgkfBLrS
         puu9PuNPynTn89QXIeWFFcqbgh6PAoxgHT+uOTf7YM3FLGUMPpwl9wG6xqc3+vgj7ulA
         bIBBxt/p2x7pnDsiLIfhtdfX+H1gRbEQ41l88/dTLeGA7w0pbfhCxluwPAxCqXOASyRK
         EZSKkD5e9Yy9TjzxLw5S9J6H8KvDpDSVHv0cI37UaqCgoN3RnyurOq86VArkExfeWXC+
         dEsNgmVDDTp/9uBSLW2VI6T9x3d9GkHJOzLMJrGpIzgBClOmz65mvOf9/u3oTVR/eGJJ
         tW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411437; x=1777016237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=314R3/793GME6eVVWj9ZOy0Jnf6xNE5QAaULeE1OxQM=;
        b=SK/8RfwbFtffIQtisEHs8l0hsFNfq+bQTQ4cg4iowNa3thU+GhaxIm6VljzjE3fdZ4
         Cp2sYAjFjmsPqLK5tZQH/kaVyStFMwnUuq9IAr2NPs2A8ZQ4nz3TVpqjCeXpVOuSVLJH
         aw19Y+iljJb/oXiNfnHEPtug6quErG6hYRSjNTIFSg+ShD09t6R+5NyG2civf8NttSlT
         NcfU9Sr3ziDxLs0sgh9HCF+k5vLSDMqjUfRYE15iEfgoa2gaNi6VgAzci9SHTlf7u69K
         jxxTdKdAsieLfgIVY5L0kIP6raWArL8/NIWjTzNG87M2g2WBY4HdFcFpTWD+rXCrHUNF
         mEeA==
X-Gm-Message-State: AOJu0YzQwF5JeR8HVK+7cfIR81bKDSmdX33RLdXVU4C5wdCnYFFb1m7V
	3I9vHMOrb5bKN8luJR0fm5c2ijlUzbenbmpbOUu3ZKJQPlk04B2k93RY
X-Gm-Gg: AeBDies3DxqJ6NMOqNTtagQcItubN935TpfwZMJ7ILgMfUs+et7kdaLywyfG+taF5/J
	nRlRHM300KL23PKAGKKVw10yzzDkiYLLHnZhXAd71ULC/RJzlqBh88GlqzkTsaMvWWEL9eUYXqb
	KGlD7ft1JnS1uEKHijJZFJW3YtdfIyCyiKt2hE8XkWU3sz4Hb+71AvkjvCCWE5cpXcIN41gR6Bz
	WjHvVZ6UG547//NK0rEJuj8udH3pQlcd+JUlRp3GaVxj3Pg8tzJbprv2tZlrJWvFMNQzsqOVLC1
	lrvBhETXil/BBiuXfAbNNZgTc6MSxOKTLZV6sgqRrIslKzi5uw6i6rRfLQ84ZHN10zg0oYhTMlL
	k0lfDJ8+cs31+ebQxCTrCMAg3Ixm4lgTKZvvvKUsQqpwmOdyx7pbGYzjbsDUR9R5ytqGk4lV6gI
	EbUBvSnbOWNklysp2+d+IKMFA=
X-Received: by 2002:a05:6512:1295:b0:5a1:3d7f:8f99 with SMTP id 2adb3069b0e04-5a4172e310emr523530e87.33.1776411436614;
        Fri, 17 Apr 2026 00:37:16 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f64ebsm1692661fa.10.2026.04.17.00.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:37:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] clk: tegra: support 48MHz clock for pll_p_out1
Date: Fri, 17 Apr 2026 10:34:51 +0300
Message-ID: <20260417073452.23342-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

Dmitry Osipenko (1):
  clk: tegra: support 48MHz clock for pll_p_out1

 drivers/clk/tegra/clk-pll.c      | 1 +
 drivers/clk/tegra/clk-tegra114.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.51.0

