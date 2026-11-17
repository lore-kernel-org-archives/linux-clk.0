Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939893;
	b=JF1hj19u2Fc3hEYcf6MVqEMLIQMg6qSAzbByT1nmClfHisZEeuPWNzdpo5sPokQbovFG
	 V/5fDQ0S1Sszp8I1pnNjDbQ1DdAHGnJ2dfVjn6ATugvTxcHBRahia9Wyj1oVQVV/QWV4m
	 npZA3JgQGLarLEfrdVQ2I4bQD2wN2yHXIhdPhdayapRk6LY9u0MmMYa0fqgwCxYPUS4zh
	 akOCvpabaj1f9Xi1tVAZA3WgU4KDQMlRwHVkk913JjgF52bIag9iUacoGxImqFYdnvvrj
	 G3by8QCQbk04znq8TebUqNZNfl+fkU8sz2xhL+iROpvfm4WXzwlsiSBabojbgP+sk8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
	b=RnkBMnmdiFHFwnO7pSV4LzUzj0Bxa7zIozqQFldyQF0tUehIdfilKnD9NaD+kTyk3O1F
	 62k1rwQkc/KQCR3p7MCeFGhfApD/lCAETZvQO3si1Pl8xHR8aoUQqm3ITmpUPc7PccvJS
	 pGm1AR2tE/UehRjzRYaoQRyrnH+IdW+o/eXmFeTJBaAeODO6+skznaTA1QgAMpBXBBMN3
	 Qcw6j1bZin9/46dDztA2SPPcmdUfADNg4ovaTGrmQysadRSSaLDMVRM1XEPslTf9TV8P3
	 dfmc+QqWUPHXc9awvw3gK2HfPeFISAxF4zrb1CrabrqfRyit2nBQBFErZ8dT228PYvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5HW2ZWg;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58428606A31C
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58428606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l5HW2ZWg
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49465892f7bso55197f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939891; x=1795544691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
        b=l5HW2ZWgz9xyPWgg0S1tlLErSqqC51e8iDSks1fsTDM6TtJ3AY04ouoT/b82UUrqcY
         qhFwBtzg0GoL915Xzvb4eLZD0pzQKVXkBVCukTzSO7QlnAnDjm0DLKhA37Sg6QlvnAew
         jMnTFjY9w1UkCudAocf7xPLcHZmx9J+WexCLQYhdptzuaroFwxhr5njiOdgczPwbtx9p
         Yir7TVHCMFUadSJZboQNtP62fa55acdCfzPSMWgJJNb4bMjvCohr7yRIyyHuF3uQwWuL
         yGjPMmxXnjtQysvqAXAtrcUkF3RBkzRLxs+JEF+PObX5L3xMZ1KleKYvo9m0+T3WUL1V
         pV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939891; x=1795544691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uauKJulT6iX5aOegJ7RlAT7SdLqthvZsOrekYr6Uj1A=;
        b=lNypTAbxhEUVeENo9w59pFZyHmiIqwNpV9bmZBKszV/qLnC6IFJwhql1pOvo2jvkBT
         Q86xJFqHiRFPtYhlTAEKQP6vkuR+Fn4h+r6HwIVsl2YeelhwBpj7dretgDaRAPyOi3lr
         IxClaUg0V2jbReFqXUqvTQ55POvaDJq2N3KV7ZA/64WGICW/04lmSMA7kp5kImw30UTy
         viehm9s+98xPGZ/QB92IS6QpZQGSyaG8V61t7KErUj4oQdPNhhqAyqdIs/kXjRP7fQ/C
         uwhvnWniuxRCqqfkVubvD6cIc/dSqnhGKQEu8L+S8564hTPxL7iII65o7cMxcmULG0sq
         8gjA==
X-Forwarded-Encrypted: i=1; AL+hErHBhr0ALLOVbhskQqHKdQNyDvgHwVUgwYJDusCr4i90Bazk4UWkTWrqMHwQ4kEMA3b5w0uMJGL6FJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GpIPgY77tjTuA5fOVyO5hamUsM1yMKlIY5NpXbUCWdInp0j+M
	PlA0vwsGDU7iVq9FKiY59F5idgn9xK7dWVxFGVAXeUGe9vbWQVog84bU
X-Gm-Gg: AZFdTZda43x3r6NivHGhUbUbcFrYK8zqPXVpE4euA3RX0mada4sR4Aqs5+nqZaxpVAH
	umRKNfyUIPHsPY+FIGJ9USG9YSOUn+vmLgTpBVoPCD9gMuSSho8HQd1urYechhRv7iZBdAuYHUE
	OoZTL8V2QTcTmXleHt2GZs1oAxLgf6tdEhTZfO9VwiHU3Bn4sp+I8yhrfzbjC69O4GWcChG5NdC
	3j9Ir9dJ5kdrYbHskPHn6pEQn6YklDc100eAYIFlTZ9GcHyM96XncUpRhC2lknEYTrvs3N+jIzK
	cBqe5K3ihCCytr4hJdPB06+7gCL8y/9rjDGmYNoA1GpSveLYThipB0lOtlE2QtkXCF/jTAq26kI
	JPiLrK51lk0eJ1mwJk5FEt2LglsIazCMX25emV/wHxSfYvXZmUjXhg8yEuv0cOjij1gXySVhueO
	WN33o9x8Yv/0dSHhPqJHr7mtpVa19q5WYn222w5rzws3mwRuoFRtqe9tZBUPwt6iRHXevtETqCC
	rl5A72WvDweovvj2M6wCIul9ynCYPWKRzQhsjvM+htgtyi/iMosBDJFZ7IOCJcfzjahCB77T/vF
	H93QjNuBmx4ZtkTJojQ5CCOtlsxEecQ6xLHN1Zanu3DTIXhpK+GiS7APTomurWckihBiOL58Po7
	q1QWmwzIo7+ARbG76AWnATuYogoQioRubMg==
X-Received: by 2002:a05:6000:2c05:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-4a6394761aamr659338f8f.18.1794939890592;
        Tue, 17 Nov 2026 10:24:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:50 -0800 (PST)
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
Subject: [PATCH v13 0/5] clk: add support for Airoha AN7583 clock
Date: Tue, 17 Nov 2026 19:24:38 +0100
Message-ID: <20261117182444.103123-1-ansuelsmth@gmail.com>
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

 .../bindings/clock/airoha,en7523-scu.yaml     |  25 ++
 drivers/clk/clk-en7523.c                      | 340 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 ++++
 4 files changed, 422 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

