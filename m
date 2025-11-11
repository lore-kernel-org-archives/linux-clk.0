Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC5C36B059
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876594; cv=none; b=l16Ydg8zrdl3UaMdAFreXhFTkt10vo+q5WcjlPSrnrTgHMc/xjEStJaVeD9bsIf9lEIqsDCo5YsQZqujJtwQAJBp3I3qcYQR2n0FUoxTn9NoNS8XzbtwvfgZRrEt9M7d0ECHcH1Ki4nCDi2W70w2QxqMYZSJjDn9bQx9GQN5UE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876594; c=relaxed/simple;
	bh=R/BxvRnYDhmJfrosntBUW73LUr2aXcwvJAtyfPOFZHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ni+5dodP/33C284EeN5r74OGfJuzRId0s+jnniaCEeNLdK4CuK3RPO+OfI0e4Meo5nt27UMyGq57177WfLlK481UaZCblG8J4xrSR/dPP3Gpz43k4Ci9kQW1ApCKkXakG+cVqCNm+3nVjN1o3btZeUfSDCKUiOTXfwhyZfbW9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqaX+XIi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqaX+XIi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b32a5494dso1350231f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 07:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762876590; x=1763481390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wn1gmvaI3HpYNhR73OUUMc76SwfBuC0tr7WC7he5oYo=;
        b=VqaX+XIixQFuymwyNS3v2erA4attzBLFXoOwmPv9ZvZnimenfEtc/JIvX8J3e5iItl
         gNQ+GoHnNSi/dTBLnc1+ZtLvc9s0PDVnmgpnrSRpGG3ftPCNJpARLTqYGw0h0SNtSK4p
         jnwWc8sWxi3pYuNI9IGw5EHp0Bi9vDUbwwUW9dMGxMD/T2Bqwy/jnppxO6pXdG/cT64x
         9/6vyJDq1IgK9FBoSARs9a5UOcD7VHp7Di2QD5loYuMtFctYdYy9qT7waxPEYRlWlxi7
         Qy0OprpeIJ/MP2wFmVuBTdhT7ddNl5TIg5wLozH/2G1UGR5ewyrfiYtxJ6KzuIta5iU5
         wIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876590; x=1763481390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wn1gmvaI3HpYNhR73OUUMc76SwfBuC0tr7WC7he5oYo=;
        b=DP4P5HSZyBxTWX5YmGnlWJTVNsfIZtVGWZvnClMARVRNVci6cQrGsyvpdQto1SV8bW
         CcQM/wr6HGcyaXsbkKFIb3I53hYWCP02RnDFpPynOeTFFNmtK7bcQCs0bm4ZW3s7dRaM
         TPY2+JQNitxlRRUxekcfcT2GzYU1E2N/hOLOQ9Bz47ebMwdqr+h6Cx+KKdAT7ZTkqaIl
         YO/vQoW68k8ZazkE3n5xyNVm4uYnKQXYOxV2PdqIyxJdvvFz0Xtmnw78yuFRXUUkb34t
         AAhIYysCl7dgchYcC/SKUX81ePk0C1CDcUn/PurViUOhNskykVv6KDwuhZF9oP8XJkez
         F3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUcWzkWpSUby0orr58A2h2O+xXDkC3KcNdKM2GL56Ay6ZArIrWAFCBICN40xxyrTKaUJnw8ImpxTMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPVuHQsiZjWhgIypRSKUnbqbG+937NKFbzuaESUQaHOIdWeJor
	EU5vJVYWDmR9mikfIsfYt1l4pyeHorCpy4gN1sPDVxXCShEaRI95FAMc
X-Gm-Gg: ASbGncu4d5VgZfkwERLFWAXa7YWDEYW6y5EfIXmU/ooQQTJn7tZB1UjF7rv8Ut6aEgZ
	4WST5grnXhcd7IwCUzjo1HBRWoD19qz9h8r9Jt0INu1i0ei0YdA1ei09NS/uCYuwHddxlK5uIyA
	qHehOwX868yvD0SmVCBxzI/Of3ZbN/+f8nxkeaIpasNFV5nA5QEvkrSvcU8KB9TV/RGGpSZkjjm
	TCETdek5/SpZ0POFAMsn8+yOmd5v89xuuHqHQTigOgaMcxcOJVYgTiy/1RKoO3f6mmN6gqEa0gC
	u/e5UOOyvry7Tzi7c+tpoIiNf6o0+HETTj7bO8EAXngGVwnVLCJ54Amo1JUfmH+SX+yOHPsAd7C
	PTO3dJn79NnpdXdkNqFqUb4L1ORnevrixxt4+KsCiPto8zmN8x0KgZAqv50WDFH1VrpHvhxtH+0
	Zo/tuS+xKhQsPRWUbKVxclF0UYa1mSYjkA3L11XZHn
X-Google-Smtp-Source: AGHT+IEWa4s/O/cpurErrQ/yBB0qj+qI8Pv0XJdBicVTkdR1kfMMMCiO4Ga983PAXfh6QAJiVG/gdQ==
X-Received: by 2002:a05:6000:2302:b0:429:b9bc:e81a with SMTP id ffacd0b85a97d-42b2db828edmr9435347f8f.0.1762876590240;
        Tue, 11 Nov 2025 07:56:30 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm28676766f8f.19.2025.11.11.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:56:29 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 0/5] clk: add support for Airoha AN7583 clock
Date: Tue, 11 Nov 2025 16:56:16 +0100
Message-ID: <20251111155623.9024-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
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
  clk: en7523: convert driver to regmap API
  clk: en7523: generalize register clocks function
  clk: en7523: reword and clean clk_probe variables
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |   5 +-
 drivers/clk/clk-en7523.c                      | 538 +++++++++++++-----
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  62 ++
 4 files changed, 468 insertions(+), 140 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.51.0

