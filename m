Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF93A89B6
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 22:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121438; cv=none; b=uZx7OrddqPYoEv7zMlcOjikEjhWtgzyRQD05HnAcR4PgHisXaYPorqzgIGKhyHFKqCRRzwEngAN9w2X9Ou1aXHKvjBdq/QhmwsulSsIwXl5uso6ziQ9chzeylSK0mxMEmOWu5R1lwE7vpoolWj086Em1Buua34e8nv1pK0FtDd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121438; c=relaxed/simple;
	bh=cdJdxkh5bVfDEuJdu/cUdhAZrf0bAcae4F4u51uLNsg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TqW+BGlis+ADzV0L+t0f6CowSoiDIQfHdIG0RMVCWAybKAn0JlxIzOuViQu6qPnPII/M6sakc6HZqes63OSd7WcVNi0G6oJFNIwwjzsxkvcJ6saRdKDimGQKZJ6XmQgwue2PgDaPkrC7j2xCFI3UIIU9eQc7ZRSQwjAeN302F4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=gYcWw2+0; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="gYcWw2+0"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-648ff033fb2so1676776d50.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 14:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769121427; x=1769726227; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJFvGWecxblPWRrtOP+G/pbSkfENKjUxaykiz55+f6o=;
        b=gYcWw2+0d0mGaXlDmZWsbn4e+mo0LktT/pHHkRPnWKLR0bHBTdgh94V6WTf0VwBJsV
         IyBs8vgkZAaUQqEAOv/Vuu2VjAFLDIAiXhzNhMf7EjYthOSn2u2091SWUmE7UliMnTlw
         IZEknZAlSGWXAKVv4Q9l7hgtFf/mm56mA9OSxukkpTfgeSf86vpvOpdqGNeW+GLqKL7G
         71n9z6WeEVpP35Luz6gdGUbrWafOw18zTVVggL3VyOCzzapIq7r2zjCUnMHVUsPU81DA
         3+Omtqekrhj+dzURFPkNC7KU4RzCex7JFMxWuE3oaKEIUw4OdZsyk5p1P9s7WeY9c3aq
         3I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769121427; x=1769726227;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJFvGWecxblPWRrtOP+G/pbSkfENKjUxaykiz55+f6o=;
        b=bRNpGppY7xqg0Mlxg/F+KNac35N2lNnbZwMSXEwFs2ZoCh4ydCwvDcAnX4/jHjrxly
         4UohpmpTsQYOyknD+3pRzaEKS8h/L1kJb5GF7JHa0jxJxkvovXw8pbWyd22B9zAcAj7F
         oheSvtfuf/3Rr1HkxW0hRI4CHFh+hDXakhN8cxTGSoX/aSVYHstn4H57C9INW8DqiH4t
         F9MWTk1FRNp3tXy3+4vmqeyWt1UDOWnfmfjjet5sfyu0KdikatMKJCHyAcgfVoW1WCs4
         DV3AKuBRRTyoqbvPu4/xUlUDYeD0MGnwK/7MY0tM0NGoeDu5lvs+oPMP072fF20rKs3G
         ccPg==
X-Forwarded-Encrypted: i=1; AJvYcCXMLmjCHToepubRW33d/XA25TeQdd14CVJy4KSyUEgWF0d1bgX8xg5pcRmz6PRyl1XQg2gp/I3ReCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsNErMAyexQpm0bxooSWG/PYguiKSckqABf+7sCxv+y4kefmt
	XGJT1HxMcGwpcF0KkS05kinHJEt+h7fioOM707f2rgaBYxjJ7cY1BHmfz2Wz055KS8s=
X-Gm-Gg: AZuq6aJSV6kHcjp6dAJYsgmU4FWfi4yDGbA2xgtbbWGP+K5KaFCXJqr7Wck4csoBKUa
	d6EvrhyANdBDFlPxGGJAoythYFhPuPEV/rYjvtZIURTk9oRiN/tk96BfT209H1Zh7V8TXlL6RlL
	VWqLr/JJayZ3QzUt8WtHncR78wu2EP0+g3hX4PItfRUiqWbLBSByB7h+a0x2fEHoVLsBbl4st4W
	CBsikLLpdS7vHQF0Yeh7x90SKpima2SpPGxEugqxwVikUBk5GL4p9KivBdIp6luBOKXMDzWCkZB
	XcT6kPdrhfUQXbJ1lDfWFTFETzzBZIMAh38uc3Ov3KfMrs1iZkhZ6qWHz5cDJT1d5V16bfLeVAa
	fwVgHvGbJycVE/CVGUF5JNNPQtsK4cjzBC67/sL5uA4TdFIq6qKxRC+Hhl+f3ScNZ+lcoqsCWlA
	rA2FxW3ANffv0nISPokBeoFdmMpan2ZRRf5okLNyoANfVGCAgBlc50q6FvPsdHKtoLDeP4Y44=
X-Received: by 2002:a05:690c:f15:b0:794:c2:5e55 with SMTP id 00721157ae682-79439921fb7mr9492697b3.17.1769121427320;
        Thu, 22 Jan 2026 14:37:07 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b01b09csm2766167b3.15.2026.01.22.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 14:37:06 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v2 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Thu, 22 Jan 2026 16:36:36 -0600
Message-Id: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSmcmkC/2XNQQ6CMBCF4auQWVvS1lDAlfcwLKAMMhFb02mIh
 vTuFhJXLv+XzDcbMAZChkuxQcCVmLzLoU8F2Ll3dxQ05gYttZFKadHHpXeRWNjF2weLSbbSqlY
 OjRkhX70CTvQ+xFuXeyaOPnyOB6va159V/VmrElLU58qgqdWkm+HqmcuIbicCulha/4QupfQFy
 UJOd7gAAAA=
X-Change-ID: 20260112-atlantis-clocks-f090c190b86d
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3

This series adds support for a multifunctional register block
(implemented as a syscon) in the Tenstorrent Atlantis SoC,
whose main functionality is to serve clocks and resets.
This block is instantiated multiple times in the SoC, with
each block covering clock/resets from a different subsystem. This series
adds a driver that covers clocks and resets from the RCPU subsystem,
which covers most low speed IO interfaces found in the chip. The reset
controller is implemented as an auxiliary device of the clock controller
and shares the same regmap as it.

The first commit adds bindings documenting the syscon block, along with
clock and reset indices. The second commit adds the reset controller
driver along with the auxdev definitions needed for it. The third commit
adds the clock controller driver, and the reset controller is created as
an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Changes in v2:
- Improve the documentation about the syscon block in bindings
- Implemented all clks using custom ops
- Removed custom lock/lock handling functions for regmap
- Addressed comments on header file ordering, newlines and typos
- Removed code for mux parent setting
- Squashed down multiple commits that added reset/auxdev separately
- Link to v1: https://lore.kernel.org/r/20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com

---
Anirudh Srinivasan (3):
      dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  90 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-ccu.c             | 939 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 158 ++++
 .../clock/tenstorrent,atlantis-syscon.h            | 101 +++
 include/soc/tenstorrent/atlantis-syscon.h          |  53 ++
 12 files changed, 1377 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

