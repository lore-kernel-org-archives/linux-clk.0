Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D703D6CD9
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787177712; cv=none; b=dTspzdtRjDQ3fZEyCWVhHZHT251ZpxnBtV8ORDe1DBinzou7ANKHS5RfF4cKNnPx1xPfc2UNP1eMYRZMlJng2KttFEuyVjKH2xadw+dWdRFr7Av/H9CcUiftcpe+fEmtOrqWZVNr/6TY/6qUp8ejT6OQ+rPHBKsqHxKKBPFJfzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787177712; c=relaxed/simple;
	bh=WcROjL/haQz6g7cw3nuvCrVphE1LLE6SgjyUJ/kI2VU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A9ovmVSI4SvFrZlOVbQOjuXS5rEwniozLuPej6IHyIgTIaxAQKwvMvvWGYXlgXTj0In8qD5VGDGkWDVZ/ewEbYfgWnt4IzoD+7WghD7UnaXJ0qXVro1Lpn7Gj50Hcit5n3zBTRXTr2xoAyuD9qdz+qaMXsgTfYIkWJByfVJPYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qnf8HTv9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qnf8HTv9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so820427f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787177709; x=1787782509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3d3lr8bo9K1njPknlh/R/JyEzj8TOBQAUpyeAix5ZDE=;
        b=Qnf8HTv997cbCuxVsTlv5S/e13CLWXDhzwrrlP8M6lI6HcI9HmBjPxFg9CyAJdG1Io
         7DWs0F9JRdB4VU7GMNWRX7svUjpMv/7Y+ena83KP1XMVIkxjW7sMgxpa9vCt/SKQBQZN
         Vz/iBKzpYAyyQ2NaWGOwLoBS8GSovBQfA1UFAmB7K9FABTIQfoUJDaivrbReVH0PhIMB
         N7zSH4Q8N/asG8ItxsxKIjBL/GjEaSKAbwPcq9C1J1iRqMkuKGgreNMfbCnyfoW1Hle4
         vd3CbYX7AaRd5PHUHtTUGPnOtZLxkAblGP32FRuGMZB5+dylsrr4AKsUNM6Ao8yoOIz+
         kO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787177709; x=1787782509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3d3lr8bo9K1njPknlh/R/JyEzj8TOBQAUpyeAix5ZDE=;
        b=Z2gRJ75nuktHeSlvs15JUOmX/m2o1lSDi70hHRUVzfrenS3iB6+QHGJ9YZmE8MOFye
         6G7yenAvEyuwTLiIl3I48EBVTUUPLJiYfD3xuE8Qm60OBAusZ00w8au/HxLDxxI+klWt
         LtOyRd+0lPBFauEcXuvcCX+v6QU/hgKfRIJVMogW4A51grWnJrQ88i9+hE10I9/lsbxq
         9JwiO2GpEdtjKhNpzQONFypkDOE6HLBScKPrQuI+COHd6H1Gczo3xZtwC0jpT7lvQJL8
         FVOAbfSZDcEWPLrW1Z2dKADYqECPqtBdjiSNW2w3NWB8EZLFjDCTVFVhf+NXf3ASE27S
         DQOA==
X-Forwarded-Encrypted: i=1; AHgh+RoCbyIZL6JCzGNcPpM9WN6oH4Mo0VIw4VJyzfe6ypO0aqFlDpGBE4GMoruqZhoGTaiMFgQJWPDnYn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzDTuvQ05NyBjPhiOvUQk2S5hKpyCtB6ZXI8qseWGoSJr1SMM
	tDEc+uEp6rvR871JhASOA4Y53llYPNSV2HthKrS0Tw1R+SyZ5HNJEdPQ
X-Gm-Gg: AR+sD12FIjctn9ooMqsdSLHiB552syJf88EFLk3TvzMFRvMsrbkBshtca/QcEkPcelx
	oUekcYGUqyTBBS7eik9UxCmrfB9trn7hxnmnzPo3JviUD1idALxYmtyMLQM+EC0xBGjBWnndme+
	Hyh3sdUUxo5NzGduflmajGESX8QoU0t9i8BINhqNQF0Rguq8/GkYSBy27SkDOjrnbfP9S2Pyah6
	Cos454O4ouVAW3yV5GUqJqF/PEp+C4zyxFq8Q1hN+lKymHmN501KWep5nhTU49Dkjg8bhh1LE2a
	rYg+amwQQTZ9Cw2hNw7B3Meu+VWYWuJCr4utJ9quy9AL7xeq5tPsg41LqvHt2ZPhRPG0vzlh3/y
	BjlY7kw9iyFyIPAClVcQSpalBfvCIlMDojX8G5ZKt25EZ0DTHwG4jmfUXaDqAPemLX0Cyzq9bWz
	e5y8f42d0Qoa6fQP4tcfj7set2WGV8UjzK2kIC28cFrkWQsoWpRIYfWtneMNZ37QhKr5LMPGnn8
	frhUbwid5r0LVGNUKdXL6A24sTIWTpcAzSTiyP6kqgJEFetuV/whGE=
X-Received: by 2002:a05:600c:3b95:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-499aa1b97ccmr137923425e9.11.1787177708360;
        Wed, 19 Aug 2026 15:15:08 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-7-219.pool21345.interbusiness.it. [213.45.7.219])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm9732950f8f.29.2026.08.19.15.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:15:07 -0700 (PDT)
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
Subject: [PATCH v6 0/3] clk: add support for Airoha AN7583 clock
Date: Thu, 20 Aug 2026 00:14:53 +0200
Message-ID: <20260819221458.30040-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset

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

 .../bindings/clock/airoha,en7523-scu.yaml     |  20 ++
 drivers/clk/clk-en7523.c                      | 250 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++++
 4 files changed, 336 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.53.0

