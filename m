Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885A471249
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806406; cv=none; b=XBkJ4gJ/v118YiBEsnz5vOdf+NXfVxJ6xSKxskzn7AN0/VVWnAlMHq3zSDchOJp9/GfcBK/VgqD7YwYYwMLDbSWPapQRvYTE5Sb/SxFWlxUF9JhVYU37BNfSvfY3ej0dhR3sb6v8f7N98s53Rtur8wTKoBcbh4zNbv6G5IsGTBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806406; c=relaxed/simple;
	bh=VEJhzSBCAvjIGbrluYdUMnZeAPSBNrY0yfuKHbyU4m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2F5TO4iDPUFCT/dwpqO7AnfNHFBTFhLFQP7ZzmWAH9n23qlVz0eX1n5+vt5c8Wo6mWCLTTNznIDcU8gMF/MStpU1FQQhkFxEJGOROWVtejin0u28ycmVl2Rvu8f8baHJzcJUixPYgV9omRue0bMM3SdzTk+k/iLk0lEXnjOzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbMrh+uB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbMrh+uB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af27fe287so1544279f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806401; x=1792411201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUQ8j7L5J+v1f6vBy5IfPfHKgrGQLUIGvQhzU5qDhl8=;
        b=jbMrh+uBgA+AJOQG7krjucr81r8mlyalzL+mkBBxRkSNF3mhbfGVj6JpZGwmvEPwVc
         MAPwE+idIZbDGj2oyg+Shkl7Y8V4u3A/lPqdFduNaPi3nTpL0lasoyXLcu9Z0HNBYDT0
         nmzNMnSq1zG/shvwpHy/19/3j9/hEX7FybtqU3xftkPFskuDk1ee/dy8CNtENU05UTJS
         LGxWkTh2uzS3sxSfKpVXDDf+3LNlbNhiLImHEOVNAGkjyJJwEdDFH6dXb3zXSeFNw48f
         nMCT4Yyl/xAuczwvgC3ySP/uMqZJPjIh8u3xeHFI3N7ogIG7CZfn+nC4llY5bfP26WoL
         2bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806401; x=1792411201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUQ8j7L5J+v1f6vBy5IfPfHKgrGQLUIGvQhzU5qDhl8=;
        b=ScceG0pCnGYqbRnT85tXemnK4sBQi/TJadPhv2ndBU6zF0cbjTr6040ej9/uzZb9o+
         I6Ob76JjKF1V8hGXvRGjWvbOjY3yHF+UNF7ctSnozLjC8EGtxjv8sJA6LZw7q8aAZkwx
         0IxJgDPSDuA3jTZO4arv9AYAxux1NxTgMtk39DEHcykEilCKeozTLUJRsRWmTvf5gHKf
         nixu8Fqs7l5u+Hbvke3afLhZNOO59wLX4h/VgPav2KiJZS19o8JtPMNETugPp427uAua
         EN+Q1kYQcXklS48VP6ppTsNHcie03bH+6v0j6And4kg7VuB/ykh053JdQFmMqF1mGe3I
         bIQA==
X-Forwarded-Encrypted: i=1; AKwUvBwCDWtarGC2LeTWcjNUnj4o6QPOfbV9/wgE0t2kzkB0nSthEP/35WObZKgBYmt11GqmleqJ3a2Xq2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPspYXJ4ST/lMCzhks8hp8vqhyR15u9k6smeU1VmyvUNrfactz
	fEZ1kRfUXCuePjAEtNQR9NxWNWgaCJ9J32MaY5Urkj0P/Rst8mmp8U90
X-Gm-Gg: AYBFou1ZATuiGnE7QWHBiGU1TqjbB9TP+btIKmIeEfcJXW19/aLQ6bfOdihc6S/+EDC
	/mCmO6TuyneFv3yn2gTjns8yoTucVkVnu7SywTotvIJutU3/1X+2bnUXGGc3W+iQOOs/YMPlHmz
	ShLHKI8NicnlCOg3fbEcGH6PXxFUQUHHWEeBmiM8eRkOPJ71QhhTlU/vGQcckFDiFMOFtKNqaHI
	4qXwgNoResSe+eMe7PAkQjxNRbB/m1jj8YrNr7rm2uNAAZf4kWnZfsya2yqAfWFgKXvPmzZLeFx
	mogetXpBJlI8sjHXSwrP1ofT1pfPISS3dZGgdCwes000wHPoA3Vgbq2mryvNqS+QFxbkCjAaac7
	6mTJvGnvau566bqvKff7ruOc1w/DPMgcYu1ax2FhrCMK99dxPf/tDFVApLUtKwyl1tVUobsNxgE
	1k3Cb0wkj3FhHcHaaohqR8XSW2dKMLAVx+ZJFLOm2pcaypfqdNxGmLKplqXNr2pKjQDa74d2Wy2
	SvyXjUN5b8w7ugTUfHPTvKpHD5Oo0TrWjjdX3TjfilkgeGGdisCh94SzqqxjBLrafwveHQWjFTE
	qipZPq10ppEGRhTNQLmmIh4=
X-Received: by 2002:a05:6000:2907:b0:48d:c18b:d644 with SMTP id ffacd0b85a97d-48dc18bd66dmr13875223f8f.26.1791806400904;
        Mon, 12 Oct 2026 05:00:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20234313f8f.9.2026.10.12.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:00:00 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v9 0/3] clk: add support for Airoha AN7583 clock
Date: Mon, 12 Oct 2026 13:59:50 +0200
Message-ID: <20261012115954.92718-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (3):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  23 ++
 drivers/clk/clk-en7523.c                      | 258 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 347 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

