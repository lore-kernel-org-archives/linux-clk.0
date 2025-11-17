Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C2B2D3A93
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397472; cv=none; b=PBN3IujrG48YRMBM6JjfzsPKinELCQMrWVWkyJmqQFU1/vIeCyC2hx4NQnwX1mTyJAwS6GCLlbOhfIFNcw26qDGiqGi6j1oszlEHWD1n3vWZK+sEOgfNxwdBeo2xc7EnmeMpbcCzIvmiTIqsxuf+UGzIBBW/MWA/g/mSqWBi4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397472; c=relaxed/simple;
	bh=HlIiShYxhkLdpsar3rOL/ISs2/CV01wtKw99jYyG6Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F+vtYl/g1gDLnID503XMqdkJVewE1wM4stApIg7dSsLAt58tf5B5Qoye1S336odfYSJAmUqJkCFkPXacYD4nfrQ9d6XZi4NQmc3fqALR8IcibWWCVJBm7Nx1i8isE7b2pX3Hz3/+bnkJP3sh47moFeJ8tHDpDAHLKftLw3mgo14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h7vTUI+Z; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h7vTUI+Z"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso3682511f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 08:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763397469; x=1764002269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPBIXyGju7mBGzRaiW27P8dbL8q5t+cpUgoonxWQamI=;
        b=h7vTUI+Zd7yv2nT5HfZ67IUBERcx9fGxW/wo+EEcBpjcj1PVR90KOJTQy5fsRroGfV
         nORt9WcZFwjWcLk+mfY9K4T5i6pgRVYbrj4G7zs3cUdurkFLiEgGbGhu1Fh6PZsQkVK2
         PVmxpGdHKJm8nEppRvgd2mJFLpvhhV1Q9NIg/vup001O61d14631iI8+/0GeqiTIY3SK
         hjQ/Lhyjm0d2EX+nEcQ00FtQauvMpCuIVBIGk3G0rlUBUoJmi/wpf1bST2Qj4DQZiF8m
         +l1tCggbG/GMBZSKUqwps+IY50/2vJk+CP2rDiyyIiVVeJ9ZmMzemXpN7x5z99E0rABs
         SDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397469; x=1764002269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPBIXyGju7mBGzRaiW27P8dbL8q5t+cpUgoonxWQamI=;
        b=Y1scz6LJCLDAjff07x+p7ESuLz4ucgs0Qt/AzA+0QBmWeWWX4WazutrlBJjmr+ouku
         PBATjaAlm9KqJfzKIRpJCRzHwNAE9BJXexXUkM9PJIUX3DgfZ6dmlwPBmRH9Vgt+bAGh
         SNMiysDeso+OL0a+UfkpLLQ67ou2KJr8ukLFNp4qnhMxEk1l+0b64DzOEO4xJoUCyfF7
         QnnydgBF1r8HCXEuX1JanRGlWfhXMh8dKLSg88C6sOAke+OQO5nxp2162cZPG1+v0+Ej
         SpRVwIXLjx4dwsooZLx8e2DrWlCqYEx7oQLfl2I7VeFQYfNNgdFRBWwuc3t54bmRx/wj
         t4YA==
X-Forwarded-Encrypted: i=1; AJvYcCVxCOoX5SXXAgpZoqlWRPLcf/t52AVa5NoeX4hpjVom7D4cUjgBMn4TWAWGg1Cmg/DXAdvh5XKw230=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyyjRlaudgBgs9LNEq74nLxqsygy9gRhbixwpjHTYoQv8oNUJ
	zEfQ/ykbCUDs29wlDTYjxOwbYbrCJNADO8bY4hPTe8b4H7rirsCyOS4ttCOW7LtuW7U=
X-Gm-Gg: ASbGncsAzWRciE2kswhGBx1Fu2nYJUVM2nR9TNKTs6C9fYzlxNHc4N92PHb1nfztETT
	GhGN5SxkQfvabrJYhXLomkF6aJzlW6mXutKu92HGgPI5tL5tF9Xc6eTttTHiZFD7Y8tKD3FCzx4
	Aj74/+sgroGsk7TgUBXvUebMLi+JiGr1asysXDxmW5mgHykCd6g/u02QBk9jWr1IJvikjzPf4sB
	vfJXqVi2gi8Rtvko/BrFB2uJ/cdnnvt9y7rYvUTYi9VCUCFGyX9f84Ha8nzj8uFunGTowoCD2v1
	RKx+Srg9wzDpeksJs8Tvmt2xOEqXLvRQbeuCW7MfPoJRP6eCrvmwHS5PsfYBkLMIt4V14oMjmXC
	ZA5DIjN9bm8E5Z+qnySiE6z2LWEHdSFu1mRWgmh++TkaznLYYXgq59/xA05MU2nHOWURUE7wkfh
	d1mLNhmGmENxSw6PSrmQg=
X-Google-Smtp-Source: AGHT+IGjX8UeXo2kn+Rq/dpoeLzNhIaCwbw4kTdvV8tWs6WEA1Z8hJqnk/qL5zQx1UTgmBk1S06rOQ==
X-Received: by 2002:a05:6000:2210:b0:42b:2e65:655f with SMTP id ffacd0b85a97d-42b593499c8mr12766106f8f.19.1763397469362;
        Mon, 17 Nov 2025 08:37:49 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm27655158f8f.26.2025.11.17.08.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:37:48 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL] Microchip clock updates for v6.19
Date: Mon, 17 Nov 2025 18:37:47 +0200
Message-ID: <20251117163747.211922-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.19

for you to fetch changes up to 781f60e45bdfe351aad692ac0fa89e36f8bf4a36:

  reset: mpfs: add non-auxiliary bus probing (2025-11-11 16:47:24 +0000)

----------------------------------------------------------------
Microchip clock updates for v6.19

This update includes:
- convert Microchip Polarfire clock controller driver into a MFD driver;
  with it, the reset control driver was included as it now depends on the
  regmap registered by the clock controller driver
- a cleanup patch for the LAN966X driver

----------------------------------------------------------------
Conor Dooley (3):
      dt-bindings: clk: microchip: mpfs: remove first reg region
      clk: microchip: mpfs: use regmap for clocks
      reset: mpfs: add non-auxiliary bus probing

Robert Marko (1):
      clk: lan966x: remove unused dt-bindings include

 .../bindings/clock/microchip,mpfs-clkcfg.yaml      |  36 ++--
 drivers/clk/clk-lan966x.c                          |   2 -
 drivers/clk/microchip/Kconfig                      |   2 +
 drivers/clk/microchip/clk-mpfs.c                   | 227 +++++++++++++++++----
 drivers/reset/Kconfig                              |   1 +
 drivers/reset/reset-mpfs.c                         |  91 +++++----
 include/soc/microchip/mpfs.h                       |   3 +-
 7 files changed, 266 insertions(+), 96 deletions(-)
