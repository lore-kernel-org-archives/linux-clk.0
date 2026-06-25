Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0583769E4
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 08:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375559; cv=none; b=gBpQikYKMJpabXWu/AjjRgNIiz5IBSqZNpCbUkmIZQzgPQwLTR3yo8tZo8LsX6SsiYazFJtfXioWwet8rgLUJQeqQiU1qvnc4i7eA2hXFZYlzpEUPssoRpsrAvo2nQjcLwC3MC+NEeTxiEbZlPbCEJV1iEHeo+6Q5kgaHXaYGzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375559; c=relaxed/simple;
	bh=L9AP7K7IS/BQIX048gXZafEbvq5i3LmZ5GjfHPcHmZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DVSQEfPS7bCNm05d5SQX0bkjUH7pGNl4kHxLb2XgPjWp6j+jwkaRLAa53F5XTnwe3lfIYTe5OF003HR+GjkmJOts6WcczyY6m4wmx8vV60gU8CIaiUdMPGQpxLOWei4E/ypTNvB/nn+b4svyyFPaIsKP3TeR/cTzE+w3tCmuu2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBGDpaRB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBGDpaRB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so2016382e87.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 01:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375556; x=1782980356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=gBGDpaRB8VbNPk04r9+NFGT8dddtVHQuS2x3PTH61E1oaqZ3yUmd0ZW+YvbR/6KcFq
         3CzEl+641AHAUSZdu2t6mG+5hRcSLKUp0VEdZ46j2GwSIVI/EU6dpLqFpulXuqIxcvyU
         bQW93I25fOQWKIJcJwTlFYPS/LpFr4XlMEEZ9IAFbI4iPsQ3DHWUkixmcIVF4GUsqEvZ
         o+/RQySEQECDGGv5B+dpWHRVbwvOy+iESdxkTPuQhqzHcuGWaz5U4nrX+bUP1fy0zgyh
         3CZDDPiK7OdwCbSM1/vTwyi8/eqtxqH10GW46pWPZQl5qgGiO2rqC3Gb6FlqARQzkwBk
         tgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375556; x=1782980356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=cip+UNdvLWRkuBzfhu4ttO5NNDwp/DUvjqB9wLDpE+lO8RyNswmCOcMKcFfCrf+7Mc
         wo7CPbz5ZYve8fK4EWnq6trL5taLRWGP+R4z91HAU9tqTjK05n80kXjuWw8G8OdFydrn
         hz5WrARCXFgdK8JJ859XNXxdYY85wEvIPDMFFrqD1ce47KihcCLO7kWtlTc5JOeO3wIT
         nxQgaz/CHNMFianz2Xl309VxRNTrjBuOvX2Pn4ai0aBug9Nfx3/abxa0h6At0LZ1yB6N
         9aufqs3fY7dAzEs1Ca8Y4jo4hYvOUpkm4g1XF1gG31i0BUyv8dsMTLpzpfaiV2kwNOLd
         La6w==
X-Gm-Message-State: AOJu0YyHtlCZ8CCvDbrBnUosigf8H0zmo+lScCj9FLfVb/9SJ9oypnb/
	lpm0fgsRUWbzgDtBjg5J+GcBTqUzcJrd4jgDjvAoJZyRzs70WRhKgyRd
X-Gm-Gg: AfdE7ckUcVLW1HyUCqnJB9HjMqcPEGFZBI6aEQi6nItxC2B+BPj0gI+fHq4HemVopQ1
	bctkExVWVARLJ6r1VTX801mSpVt9o56Sw/IXKeWAk+3oZq8+QmpsYx+OWus4rIAhkVU6qYXTDGr
	U53ERoG8tsIthRlBHzWcZjbHkLFmjoWwZyrRtjrCc/8KO8COYndGzYk1mGBObQSp7EqzeopaKDb
	0+NIZJLujqLxabgz2FqRGAFntQtVJFJexTr6RlBudd2CaNSoA4Cfrrk3tAt1nOZ4yn+gE5765of
	0kBU7Fz4CVZkyGdoAbmEmGjIBLjlMlRvsoiSM7Z0vyspYpcoDwP75DlkogxFGGAd/S3ugsXXBl9
	sAGh1MpvDu8t1jDZlLuMOUpqXpSOWwP4xZ6Ie+4/9yie9GNZk/I+CLqKxsfaB+gc2VbckUY5QZP
	GfYsLM+t/+aq6TahDuao5ygMLwxsKJTOxjYQ==
X-Received: by 2002:a05:6512:234b:b0:5a8:8df1:61bf with SMTP id 2adb3069b0e04-5aea1f2d8b9mr481101e87.21.1782375556192;
        Thu, 25 Jun 2026 01:19:16 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a71csm2455548e87.45.2026.06.25.01.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:19:15 -0700 (PDT)
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
Subject: [PATCH v1 0/1 RESEND v3] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Thu, 25 Jun 2026 11:19:05 +0300
Message-ID: <20260625081906.39254-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

