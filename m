Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506175;
	b=5GpkzCmEpiMCn4afEJur/SON/h69PjLOdGkQukiAODE9bU2A9kkWyLuomM10rS/oQC0z
	 dbpdOdu6eorkCaRJvowW7nITBp1w6UdywtvkS5/A+i+FUe4ky9OTl6J5uR8XpVXT5T9lp
	 vKSPJIfNed5Ayojmf4IdlM4TxpsYagHApPVNUEXliTvovE1uQo/EduoCzkl4ofVywH2oK
	 AXxRYbWt12WIHyc/tpvXe5Q/NDZ1r1uK6YCrSfcQkAqzuTHfA6lCgDGjA9urWTYp570Qh
	 Fl/YtyTYlOuOl7xt2kELe4tdY++vaw/ZrEO+5s2PYJz3fzee1qb++6HkfbX35j8uYkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
	b=Mr1wKjZd9lAMFqAEYqwmLMfMuJScD9q2MAuYbcF+V1gPxtTdR3Gd3SX+zyTGKhmITtSa
	 dexXHjuEXRBtg0RQpJFQ8dblo6AJysis4KJQUrC/GIiR7VR4+uTC3WicuWTn/0HPnrngT
	 I8lZSfPFSMgNOk0W7Az5BuaBGpP2KlVECTjAl7lkInnyEeauP+J8iFwD1dI+dAV2pw5eL
	 oxqZIlHhU+Qvs8s7wCpJXfM84ofxZ5+deI8nt4L6PtyMGuSYoZffkSiZmn92JY7RD5oRy
	 Jvjr/BMjmrJfMBYo3XwQGz0hc4ROj2ad5so7HoM4VarNXrmcxRKd8dkwwcMH+0kRX7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K4R12YOC;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F460A2600
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44F460A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K4R12YOC
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35f036b17easo1134233eec.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506174; x=1793110974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
        b=K4R12YOCrAh6mzEDRtlBL6/07vYZGhaX4UNkSMg3BXcn7NbRyDymdAEsVPnvvCSV9d
         KST6fCZGU7xlroi4Ao9SMbbM3DBT4pV8XGiOxGPuzyPCcFC21YOb3sVbf3VpsgwrgNVN
         PG/Zt0mkYcbvDRCGoxXuKh63R5VmykTzVv0+ouK+whj1zF5H6QT0Yzp2ch/WWFXmla5d
         DSHd4UNMNqBmYXypAZX6T13wquE3m+WqtFQVD0pGsXr0RcCkLM0AdObeRfAIMkAJGHut
         5YUc1M1ihMBI6PkSrzt4aPkX2XsOTv1anpygsQUwZMhWjWFRSLYLT5TBJXlqgGv2lYC0
         iI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506174; x=1793110974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Po6NV+wXWi97vWY2tLsfy/Tq0VC6nM3yrCItfEC7uY=;
        b=kiGagDGTet+KBJzqWRQu8siM+th1iOuFbb8y1Kc6jR+ShNJpcPfOE6j40Q97yKoPHw
         znsqUBdgezGjKcK8ttBW54Yxxk8+DdA9sYpCx6jhGMivrag83CQSRsJ8DR2Nnek149LJ
         tuXZcyYX1eZ2tLyelAb5NWWg9LAK9UecOOZESB1vtWGxzjIEHT3HE1BANNuKyvREkKYP
         Ux6zzuYCCHEU04fTapejxWxxHvB83tFrXt0bFLgCULGDnXLAmOqj3/kgN4gyLpiaRStv
         ZUwQ6MHxys1rqUougyCDrEPM/4i6WyZkHReRy9s7SwBcCeC++636qxuX+Tt3I5XHVLYU
         CGGw==
X-Forwarded-Encrypted: i=1; AKwUvBzLSBN9KDZPnLFmrTlZaZcb3qnI7ZQc3OQtPI4nJ3iDETSJGiGaZWIMkDzhXggB8uD/czJ8jQZ3h/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlEaOB+pn2dLefpfcPrZty6kBBVK4JrEqTbWu3qgoiFc6DYFZf
	ba/+vtm1SnIvgVANOaDu7eUeW4OqBCyKJCYIYimKLkr4VrHnlmoCz4CT
X-Gm-Gg: AYBFou11jhCjEW0uWPZq/2W3XsT+69YNrHtabWNN4wXgQE3ANGSUsUq8HeV2ijZXpbf
	bur+8EdY24SUZenEr3UmAfYbzHlbsQ2gKDhGcGiyoeiJOVDAsaIjg3XI1V6uNaETSTawH/gI7qf
	XbnyTC7Nxac04gQV9NwxqW0t/MJL7lB44j4SP3P6UJ4f5yvPnQ3mG03vNjpmGe/+6YxJSgMIyea
	QbSZbErKhXC+MTTBAZlCVBYJ4Mi54zFOhu0VD0wk6GwdgPjzF2RpCCtSnRD5Tvpz+GrmaxgovgG
	uEqQspDwOMFAdKZX6pwNCH8qYTL/vAkNNqmWcorTCRm/WqNl7aUHEp2utWwsxFJxKhe+6HVtN/u
	3Hm+FeACOZy+Y698d5RYeVsCtNLL5HDyYelHYW8bwnJ1RJEBVuq22TEf1GsCd8RQoYdco2LNwEY
	B+VVcry5BC84Nm8z4teGA+jJ4IeYVYy3Ehd+psZoouPtze3djLHmOcLZ38WcyqkXtSpMEC1uftU
	tlElB4Q+HU=
X-Received: by 2002:a05:7300:d94e:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-361a1b52654mr15441463eec.21.1792506173172;
        Tue, 20 Oct 2026 07:22:53 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm66917444eec.12.2026.10.20.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:52 -0700 (PDT)
From: Sushmit Singh Rathore <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sushmit Singh Rathore <sushmit718@gmail.com>
Subject: [PATCH v2 0/3] clk: qcom: sm8450: Fix eUSB clkref and camera clock collapse
Date: Tue, 20 Oct 2026 14:21:28 +0000
Message-ID: <20261020142157.1749-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
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

These fix three clock problems found bringing up mainline on an SM8475
phone (Nothing Phone (2)): the eUSB2 PHY reference clock reads 0 Hz so
USB never probes, and the camera GDSCs lose register state and leave
RCGs running across power collapse.

Changes in v2:
- Use my full name in From and Signed-off-by.

Sushmit Singh Rathore (3):
  clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
  clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
  clk: qcom: camcc-sm8450: Park the camera RCGs when they are disabled

 drivers/clk/qcom/camcc-sm8450.c | 113 ++++++++++++++++++++------------
 drivers/clk/qcom/gcc-sm8450.c   |   4 ++
 2 files changed, 74 insertions(+), 43 deletions(-)

-- 
2.43.0

