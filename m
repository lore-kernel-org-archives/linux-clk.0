Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296473;
	b=pc2oMmEpvY8FsTI6FWNuRRzjcuyOts/TlJS8FXX9bXlBLMyNGc37MjfiyxZbyjbw0nAM
	 /ib+20a7ingTBxsJT519BfadvEUGGiH3QLxpQOPk89/mIUx45+xmuJquOSW8So+rzecPL
	 ps6yVJXSIaprkPfWtAM3xFk68vuMaH1za8UWFjJyIOIJFhwufkX4mISXpHSVhhW+bpj3K
	 TiAm//p2OdcWBt8z2hleqqbjugdpyxHD115wUSrYCwOrkV+gdWCnwBLvHspzNpFCZNLGO
	 ByB+/zHi/SZU1VVckEzTtm86+zF+4qCJCLYllBVphj1cgTfltgg+2HqpFbnUI6xh6TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
	b=hMc5/j2zraOL0A2nKT9aYiv84hLM6nn5x8UALt8k9UOPuKESHro9XKAoS0W/OT78iYRZ
	 1g+mVcngHIPo71JrpOTnqr4uwHAJFiP6wq/mf+McDC0q1itfrChmDCmYzLi0GoadpH07I
	 S6xZiKZksUSqJ4oH3jhvZ/aVEUe99R4KqOr++XnOTy/vnojVH6BjJ4UnZmYqTEeKpHViO
	 UkTOM4vBgBPDIXez1OxTljH+lbBpbp4m4ie4bbvIJnpWcMm+miHGDdQyeh3XWjQOopX9X
	 EBFmJDXTxYVEIg+Lw63QFfc/coq1+glQrTW3tumYtMFoEk5UBA9rqSkIbOZhlagfbBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=al8q8kIV;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B2606A32A
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E58B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=al8q8kIV
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so24072745e9.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296471; x=1795901271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
        b=al8q8kIVCmw6MiMt65Iueza+XABxhPxX2xNL4nlblp71fgfW7crmFSA8Hp3q8CmhtF
         DIM1fpexXucynuyKElHILyjLatX8my/uTR6lEvTpUWGmFBxAw45nsRNmF0ZJ6Gc4zLL6
         58lE30ykrI7kQ5mKTQsiX9dvy92N+KI+an2nAkRwh66/tWiKXf/hSMykEJMMMHM/Ts32
         fawEkD+1Md1nVfYU5hk4hcZ67G4hxrGxrgVvOZ1SXoLBekwtHtL9FefZKNEIII4YDaU1
         wZEx6XmMfheqEiFvBim/U7PZ35vnAhHz2GdCd2z980XD1TzQ+o8fe3EsbROUnJWg66q1
         4ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296471; x=1795901271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8iFoRCsnLXiwnHCHjY4cuqwaLaLe2pBEmp7x1xjf4qc=;
        b=m9kbX/qrfAYjXt0rg2Obr4hRkw/ZzzVzNJ2aYZ5p/yFBa234faCCjZKkMHM6nCZZ3N
         ZMP9EeibWTyqKNxAVSGhSa4FxSmNDJLl6IQpFhzmkNnykjtly12VhDkIyCXTUhy5rIyX
         fWU7Bfchb83Bdj4lEUmYigJ30vg47LfobQJPg3P9ibM6DNWeDOjiVubdD4iuNJy0jYTM
         Po9ewj/QYNeW2kviROMHG6vAibCHvuUeMZ+19EEroCd7pAXrfAstnykSk2aznSfa/fZA
         TFEB+9tbZV2AWBhqS8wiHIQkngB2XMoZBNfurpi+ulYwTMK69AFkWflyan6tEUuo3r9M
         fEdQ==
X-Forwarded-Encrypted: i=1; AL+hErGRfDfaH4fmwN+sUP4kG4pBQYPO9n/JaB64DHwsQ/oieIIE0X+IsEfyjInPv5f/45oxtfwQRWiS6lo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zEvFlMONyFpr0cdZSRRYWEY/9IO7vdecpziILix2qSlzEyhjM
	nxE6xMrVuqVncrJnW6w2nZL7s8ZiR3/3f0KhWfkuEiwdPmxWZxHlXjfzOnOnng==
X-Gm-Gg: AZFdTZcFliccU0TKRlGEb8EyB4oYx4NbLe3TY+S0nkAzz7v428YKf8OimWEkiFQ01Zm
	uSoxVFSo6+UnWwpHEcvjlPMr9h8KhIf3hWhQcb45NntehLJS2I/+Dqwkh0afo8r8Npk+tAYcjOw
	2Xomm4mIc/qu/eNYEJ8Pbz9SfwfqZaAZyJ8M2hX39Ntn54s8xKvXp9AvecHmUWg0UIAgWI5a3Lr
	t1/KC14c2tn23Bj5gVn3CtgClxgVPTt1yNcq5dMi7aOvDJiFho2d95oykfaBH7MBinNHURnzCZN
	XOnZ/HWhQ87M7zg1PHMgg7prnLlihRFANTcBAzDN5nfFA7bngKWXRxCACC+EQSK5KSDztPxo8Wr
	3ff8WHABArulheVbclwjzPHyVlHCzbHfYp7+6AgSYnC/G7pQgVRKLmT5soDnuDBnnVtcREySE5y
	XyDYGUsOl9gfj+2H0iSTz+6GDW5xWtRsBU54yOktzm3bHuKCbxWJjHN7y97C3oTchd9NuJhbwV1
	rZXtNNxdhdc92q7q8UVZlbuOh3DC7+/WfenfkRbEuRkkuxsRNKGwwFEwN+Bx/IuxXhGFiPU8MGA
	1PRqKJOqegdpolN5HF65TdX6A20+2+qHQ8q8ZPt97ZLHs0XEr6YOOLk+PG37MLAgfVS7nrc5lbV
	SrZ5Tvhubc+jM6UV2+m1FUcPVNTLYPd3+WioX0lWuFDp2ZkV8pZY=
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr168468595e9.5.1795296471125;
        Sat, 21 Nov 2026 13:27:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:50 -0800 (PST)
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
Subject: [PATCH v15 0/5] clk: add support for Airoha AN7583 clock
Date: Sat, 21 Nov 2026 22:27:30 +0100
Message-ID: <20261121212738.170775-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v15:
- Fix num_clocks with new implementation for AN7583

Changes v14:
- Fix wrong definition for chip-scu
- Use scoped guard and guard API in reset
- Rework for better num_clocks handling
- Address some forma impovement suggested by Brian

Changes v13:
- Use guard API
- Drop spinlock on read operation
- Use enabled/disabled now that they don't sleep anymore
- Rebase on top of linux-next

Changes v12:
- Fix dereference on pcie early unprepare

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

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

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  26 ++
 drivers/clk/clk-en7523.c                      | 389 ++++++++++++++++--
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++
 4 files changed, 447 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

