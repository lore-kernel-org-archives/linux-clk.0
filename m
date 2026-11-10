Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269288;
	b=eubacwnpKK4WmlZV+ctnpSIlu9ic7Fv7ASuAbGJsuLagmWMOPZ9bJjwhgaifplhZMnva
	 z/KhAFU9feOZYGsVQUd/boxhVaa+O/Di8rmCrVXJ5roLLtEXXG55ZXar90tx63qyH4nAg
	 +3uMUONqawHTxhBauLmcgn91r2XTnJ8R4j8njT6eolvCYKzF4Up+0blHdfuPYWWdk4Mp+
	 O7y/BXnlKaFQ3KooUGHaB4rLKLqg9z+NfK/COJpZU7nYyn/9ofw+y7bh7TGLZvyeGWukX
	 xlP5l46xW/JuXeowc0n2mfDrxAHCAzSZHeNnRkzG0g1jf4j8w5BTc/mc5EFNMNzYgNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
	b=aur3q4hkuMspdR5svwlcDwGWw/0mY95aDH7JC1G7poDQnbQFvBJqXzx/AizC+y91fBET
	 xstVne94nxGA9na7IK1fpfzoPeEJCFgv/KM7CI6vsfM41MIFfjDoFAOLi7RR4jUN+0R+H
	 81JjCPs0QSFJpKji9ojZtmUxDeXlPv3FmksZA9OVzUUMq8PKxPICscI+bWIJ0MhEf9bM4
	 Y5IehX1qyF+vRWdPVKwANRQTC0LnJy0/N4ck21cREF/XwAxWNXBdn4JLBKfhw7Qo4ygaX
	 Nu5cnXTsjnwsOIi1UrnKcxFk8GqmDOO3JMenyegofwISgrKYt+b1DPvFfho/KnP0hFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL5+I0cL;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB2E606A33E
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 00:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB2E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iL5+I0cL
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1244649f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 16:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269286; x=1794874086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
        b=iL5+I0cLr+ATVuNDWPuu5e61AlHGDreEeL8uYqTJan6brOFqG81URE/GhFEPf1EXj8
         19SD+Z0FTubz4ms3PvY57QzZw7b+ObGHn8SoL9HrwcKy1++JPooTxj7pk9161Vf/vKIU
         ekhd8K3g54CvLJbULwkZx1M1mNfkjLBDvxOWAKLz71aQLSEg6hnozUNxcsh2YTRSPywx
         uS+RUOfu4IxObk8F68Gc6CHL60uz8I0PCEb/uiY+t2qH6Muh+YOzzcrsILyLqobYSFfE
         /h3j+2zTwDNASqYiOdpu/BJO7DMO6jP9ruk4rC6aMfFPN1t62vW26Vfx7364HCvw50gX
         9NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269286; x=1794874086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBllqaFspq6PXDfJKO7BEL1LDpbj0tKT551PveSJLv0=;
        b=t0i+FGjMX7nSe2KTUrf3qLbKEAFtyIzyo9WaDgB+4C1OpUjERx5q/Iwvc2H1r+oE31
         SQlI/kU4uTyfiOMYWlaHeU+8OaYJg9UQPXRfPpATf3QXh8J6NzFzU5qpk+tUU/d3VKN+
         2Am+Q+ATleuHH7H3LiRsYZIKNDx4OsOXYdpZfxxDbaJEfjzw2gYRliqfy2OvSoXANNi0
         weOPb0erneR0kCN3vLYPL7wcrgaTnOU9e6QCIZT3xeSCr88vMAzHijhkb1jU2/Z9Z7Jd
         ebBB1plUn9YP86dqG9iqUJXA2gPZEb2fwsZVpVgcreduNm4+WNtQn24cLtDxiXxKaufe
         r4og==
X-Forwarded-Encrypted: i=1; AL+hErHNcmw5Cs0irWO8BrdC+JfPLeGhL1sNvtvM0Qnlek3gmKgiRRKDoPXB68IAsuSqA/GBEpwBsD+nxcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qyW1Ntn5BYBFNgWLq+XsUja+zRfd2nx3sjF4H9UilsFHJ2h9t
	q5vCEeI1I0vfnaEPP+/yCsBZelYg9tqo/QztGzu4kptdeUSKOyeCJmJD
X-Gm-Gg: AYBFou0LUye8Tugc7BMdRZFFbgifX+CnGzkF3EFo5bCpPebvPvS0WkLfDvqm14nRmJu
	nCuL8bmdP0XtW7d6fm9UOwo8haTsUFc63a7ZchD/WaDrodoIDH7pVypmW/5NzAaCCrLyMB0l+rC
	F4dx55/3yDRtKH548WqQBncH3ye2SwjDm3j++jTguMenjcuUXAuO5neDgWR/PtF06eritGXBnJJ
	BPjavPuDAbmdUKVd0rR8Ueu2Zgb5zgWuWksgJcuMG19DHpOziOjxbLow1OE6ODQlveLIclOxU0k
	MR0pqqfN22UFvMpylWoz6sORdYQIBjf5rYokK2bC4hCHHzjrR3Zj4zd5s0klVHUBYY/nf8rcA1M
	sdkeeihivg/4519mfu0RQtKFqY45H5qEiQVB8faxIu04WgKYUBp2OXZgsILZpqlZMExX5nADELq
	1URtRzju/Nk7f9GQ27euOwFPrf2L1APE/PHxucT99veOVF/0tJw9eSBzRxro/RtPvGZRXPbRH6C
	bG+6Rhrybbsz2VNCSrDW9XGzUR3CwICrvyDsCHNfUAvLwc5MV+bvYKM5YZN0yU8xS7rzsYQGd7a
	wVN9jucuPPz1StTXCMCw4erGu7QBfPJK5JABRkb5Zz21/V2YBCIhjQYMSFcjPyKtVW4VnowBP7X
	jBl7eZTU8xIi0PAJ80QKE5ZLLaaQ9JZPfOTy0g/7R+IIUpi0G+A==
X-Received: by 2002:a05:6000:25f1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-498318067demr1350295f8f.51.1794269285946;
        Mon, 09 Nov 2026 16:08:05 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:04 -0800 (PST)
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
Subject: [PATCH v12 0/5] clk: add support for Airoha AN7583 clock
Date: Tue, 10 Nov 2026 01:07:45 +0100
Message-ID: <20261110000753.508-1-ansuelsmth@gmail.com>
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

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 367 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 448 insertions(+), 12 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

