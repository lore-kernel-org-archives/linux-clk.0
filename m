Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0E3BB669
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786631; cv=none; b=RZGRjDkWTxGdoVXHyHuRgBBpxCsKTgDSKWVl+RgxjzM3XlPmpMVujWX5TbjxzXteceHrjYqrpiLCP4RR6BbrURVcZUFz8+bViOVUKd4rPyf28qBaVBRRvEv5V09zpfbpH4A/9PZ4rV2yx7IHM6UvcDrpPPhMhzsSNxeurpYDx7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786631; c=relaxed/simple;
	bh=kush89tfYOU1JxwAwJZIfZQ/PzjRzYKc1rNwZWy+i0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WWVs2NZmjMLOccDi7DQ/1vUL3Tghy7/3GN8j66IOpZ/B5L4wwEpC36i1a2txgC5HtrHfIrCdJ7otivUeNf0qfA0EYRtpEB4FX01MBVUK2iOhN0TIenLAHPhjKmyQpW0wM5bD5et7QvPzdrWK4kQ5Sp7JnITHgSdHwyUy12hy6D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpalgfql; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpalgfql"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e5d0ee1951so10058495ad.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 23:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786627; x=1792391427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8rQgecj5WAhhesRJhsBD8MQuFYaTQXU6UTGWDxYrLM=;
        b=gpalgfqlg2ASHX+JHmMWbdQc4nOR2W8+l2hVj7icGP9jaYIa1gLlZz+ehy8332HtXj
         uomOSbaPwg3V2ERKiKsy9pYL7qwW+ih7d2fVHL0GbqZSNmUxwd5C4i6Mg+HSzTywM97K
         BLz+cce2jlPgTWTy2T354Qb8/asXcO93Qw+COiOEtK4R0keNYvVqcerrCPCPrpUksh/J
         RNplxc6lcwl2v41kgZjXStJY3JkHgpQO68+cKYjyY9Fz8IOuhwGs47Uq/RE1iUr6bg3V
         p5jPit1e6ingWejEUy5kcZ3UMmWAVsazHa93MwR2coshIqX4eidqZ8h814aX7E52Qbut
         K+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786627; x=1792391427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8rQgecj5WAhhesRJhsBD8MQuFYaTQXU6UTGWDxYrLM=;
        b=FalhCP8KpsGBRIT5nmxtx5stqZvqYVt49AUexKDmWY5n9VAbwNq1FBi8FaZtUERoxu
         DwP6dl1hnNwD/yB31WTuX3Sx2ExqlRlWs3Rt9PhSy7HuscSinK6wQ55qrmIBxwE7HP4Z
         Tk0tzBCNHU7IGX1oJyJppL6sFW2nqbb6qRtcNfPicqslE4fR9pUMIsyPrL/3W5X8tmpc
         lkPZmCgHUwtHihXHsAr/11lPSIVx3hsuVesUIBkNl1/NACUGBEVD8pbh74VeexLwdSbb
         IWQ85mfdAH1Vtpe+4smsyT+oMKN8G1YlpJE+t0qUGaLRYBUW6fbREpOoW6LSbpBv4AGE
         THSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBwvkE9Rq+/Grb/TnlFjT2paUAyZsS0iX5XqjDL7IP2LJtybYUfFQDrtlgLt/nfG1CkNShMhND4/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfrniKUvP/FsnnBG7kHcsn93ywUFSHkN724rICEb9D9mDKVxi8
	EqnUJnRlOE57E5aftjFFtaFGvWQO0DSB6jeunIbR7IMq7XFBb5rtPsxd
X-Gm-Gg: AYBFou1lhe3OisMFy+KlwPTtLeiJGfh3UMNYMZEU4VCflX9qfWFBE64lajrS08sno47
	1Ya0flxZGF/N0AUxoF+P6W6GHLf6AGaeZm1DihZmZ6dnJgLy5hopYj0q9gEKc/n5trlHiCtNSs8
	4QUXIWKTR4EfGEHTEKglKnX/UNVJ4SERJETAUG5P5W+aWuxv/3oHqFXgJfTBDqqIwTjmGDxfIzy
	f3YzuZVUo29I+BIP2ct+nIg79Fh85zwLU5/Xak9D6fLfW0z1rTIo4hL14X2qd17Odm4GYuVuImm
	DrVBDRCsTtIWsVduGbhXITOCisrpixMiIPWkqZLgN8Rm3BPIUvbN3K90L2rbeJU5WJyIuyWZ73J
	ElvfjH23RTYHSdoXZW4LFn2vam1sFgMI9TkqMFA3sZeVZFU5yYn/8vEzg/w7iv/KwlKpWKOxDIs
	iRdxsEJB4KqYQ6IrlWMYozYuBexF+EdIpkafjSvugj92CgzO1Ce1gXOca5Iq5xUhmqrzKOr36px
	AB7XQOyjjKz6EL3XfMsn5veXWqPOXN5L8yQeXyYt3IqOhK0ehGZJkdlqtyjyfVtYsNCn8s7ZQ==
X-Received: by 2002:a17:902:fc4e:b0:2dd:c170:2d4d with SMTP id d9443c01a7336-2e842abcb40mr85581395ad.24.1791786626975;
        Sun, 11 Oct 2026 23:30:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:26 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/3] clk: nuvoton: ma35d1: fix parent lookup and use the generic ADC divider
Date: Mon, 12 Oct 2026 14:30:17 +0800
Message-ID: <20261012063020.3331443-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parent tables of the MA35D1 clock controller were converted to
struct clk_parent_data with only .fw_name set, but the controller node
has no clock-names, so the firmware lookup can never succeed and the clk
core only falls back to a global name lookup when .name is set. As a
result sysclk1_mux and everything below it (hclk*, pclk*, and the
peripheral dividers and gates) are orphans with a rate of 0 Hz, and
clk_set_rate() on their consumers returns early without programming the
hardware. This was found while testing the ADC clock, whose divider
register was never written.

Patch 1 fixes the parent lookup. Patches 2 and 3 replace the dedicated
ADC divider driver with the generic clk divider, as suggested in review
of the earlier "use direct formula instead of divider table" series,
which is dropped in favour of this one.

The earlier series:
https://lore.kernel.org/r/20261008064307.2757324-1-a0987203069@gmail.com

Joey Lu (3):
  clk: nuvoton: ma35d1: fix parent lookup for clk_parent_data entries
  clk: nuvoton: ma35d1: use the generic divider for the ADC clock
  clk: nuvoton: ma35d1: remove the unused ADC divider driver

 drivers/clk/nuvoton/Makefile             |   1 -
 drivers/clk/nuvoton/clk-ma35d1-divider.c | 133 -----------
 drivers/clk/nuvoton/clk-ma35d1.c         | 269 ++++++++++++-----------
 drivers/clk/nuvoton/clk-ma35d1.h         |   5 -
 4 files changed, 135 insertions(+), 273 deletions(-)
 delete mode 100644 drivers/clk/nuvoton/clk-ma35d1-divider.c

-- 
2.43.0

