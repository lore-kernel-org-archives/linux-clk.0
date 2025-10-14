Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37EF2FB962
	for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 15:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454823; cv=none; b=fuf2qBFFAoXwjRR8L6rrOrdrWN3Tj3a+JZ7xQjVc3JPMXdxVIhnaRPEMDM40CX54R17vGAR5mjjfm7EHoRp5Magvwl3EVxjAWTvLZUIZPf5bCbVKm/iZIAODNIlVVNLRi/X6BVjLjdzgxrnDfb3wIewLXaSf4mEnitWtagrS1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454823; c=relaxed/simple;
	bh=bk+3Urmidyseaj7bEE31gjN1uAPuJrv5gmtVX98iJNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZNbIgPdD0PppfbIXsUeXGdKdZBPm9NqeqBtJNB/ugwM+kqBGiwElytki2q0b2bIhOgZ9hEI9iLiqa5UGJGzpC0YHckKuvZxO0ra32d0voKSZXxRd9tGQMXZNGEZrT7RZFsLCXeZACcz7mO0p1J5HsQS1x48BQzPt4sdcDwHLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQeBDQh6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQeBDQh6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-279e2554b5fso41944055ad.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Oct 2025 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454820; x=1761059620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8tOeziCnN4Ni2u4fQrMrmy+/9+u3hrm4KNQAT/jop8=;
        b=jQeBDQh6F2n3iiE33uKlcu8I+oKZ37aqghF0Q0wgZe4n5l2YvBMdJGBmNuHo/4hi5M
         T7L4Rb0ieRlzoKIfV7fsnoxUBGh+RPRTLbySZI96GQcBUXFbrHZO6z59ZLqQxnEDoiRC
         89GG49h5B2c9NCNY3zAb3dU/XVle7Bk/Gkkgunwue4quuDTshY/daTDRL/QzUK8l6WWs
         e95Li5yKPG6i6YUXi5PhhpMIpo2UOigy/kHf8iTmcOERM5hf8ANcE3wvfvVNLKaBnUqm
         PDBvntNwqxEwtRJ3tpSIZ6V/C4TOQhJAiAQCr0kFwOM2ftr55HyPMAtc3fX+eJN8ffRH
         UPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454820; x=1761059620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8tOeziCnN4Ni2u4fQrMrmy+/9+u3hrm4KNQAT/jop8=;
        b=HWvM5uQaiaRPSF3fY7o5jnEyWPlaPCulmyMAXpRDJFODG8YUPF4SBjlpD+0qQSEkNF
         1iQG83MI37NjIIxJz9g33a+bxi1BHheOUFCUGpSuVDXEY/4fTqW6gRXjBaMPU+BcAf1+
         58kwsbXflUesU8F0TFKWY1761Bt/Jabqay6je/f1a+4cR0MQPP9wcK4g+4Vvz35T/J7q
         f13Xp8MQ2aXTIPan7u46q88khY5Jzug1ZJLJY6bIoe2hGywy1zCjz3GzS9hjI/rdBelq
         PJD8jiuFoXjfEJjIT4rgH70gaVdOpQ8ZI7eZhuq9mwA+u9ZTkbzOL+zDjRx8fKpFm2vw
         tmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ZbotV+2URcO5b0n9GRYfTMN86VbPwfPKVIDRXyEpDKblbGWat5s3RlG2Mj0Xi4TfmV7ZaUmrT+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUWFbtDnPQkEvALrGcyUIG7pQHgkDmX6UnCF9KqiUtj4XNQ/6
	bP55sK95rf/HtxR370oCutx/3v/Ux+4BcES6DqP5S6Hs+u5wVygNUjcI
X-Gm-Gg: ASbGncsEvfVwtDaokpAnCU+3IxNQZW6v0ST0wVuaPrDgcC38vrj0l2nCzeg7HawWK23
	VJrNJkVcIrywHL6FCcRUJAB+BaUR/AbM0KKhXYGysvLu/g6j7cx+0+d7JFloc4ik5Es6lU/W6dN
	Squy5kevzoeBPg2I0lIfEnxbmnkSaGmr37g9wsdQpr1/RPURZwx/3cMs0PmXq/y/hg/qxm2sz1a
	UwCLsJHrNvDjejAvS4+WqDu1zKBwkrZ9jIr6VzCQd4u2r4CplBKjgiPMzV1lmgiY2JQkaqq30f7
	N4TpyfRLKI+HYxb+peRhcMYFbs5eZ0xWP76ZbVKcrzBY99RzRU0r3scFN85fPwtI22+KY52wVLH
	2WXV6XZiY235xKgns2WAFpH29dJ5cyKnWsiuPdCWo1xzNeOH/50j8qCwBO17qWGT20gbxER39Bg
	==
X-Google-Smtp-Source: AGHT+IEZNraDrsdlmzWt45LeJsdeKrIjLC4h1zu7z+ngdEnkAeoGnJKGbBlO93KLbkvtdV0gORV/tA==
X-Received: by 2002:a17:902:f641:b0:269:8ace:cd63 with SMTP id d9443c01a7336-29027f43af0mr311264675ad.30.1760454819718;
        Tue, 14 Oct 2025 08:13:39 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:6d70:c338:e681:47e3:e797])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9bbsm167171125ad.121.2025.10.14.08.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:13:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add XSPI core and module clocks to Renesas R9A09G077/87 SoCs
Date: Tue, 14 Oct 2025 16:13:23 +0100
Message-ID: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch set adds support for the core and module clocks used by the
xSPI (Expanded SPI) IP on the R9A09G077 and R9A09G087 SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
  clk: renesas: r9a09g077: Add xSPI core and module clocks

 drivers/clk/renesas/r9a09g077-cpg.c           | 35 ++++++++++++++++++-
 .../clock/renesas,r9a09g077-cpg-mssr.h        |  2 ++
 .../clock/renesas,r9a09g087-cpg-mssr.h        |  2 ++
 3 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.43.0

