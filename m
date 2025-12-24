Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFAC294A10
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766595062; cv=none; b=tE1gP12TzEQxARj0T5SR1xyGjBf2uVUwL68GF56hpEtUjZRfr0xF1O0IB0aytOSwV+05DwgU+mR2chW5WH2HRY/smxMq3Rpfw7xholxHdd1yVeWiso6ToyeZWPdgND0NQV16a4xYvdVBcD8iWAsKY9MtDKLFc2aLa3RxReDCwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766595062; c=relaxed/simple;
	bh=czLKHCU5+fP1Kb0qEK97qZgCkIO3bC4SpISrL4lljKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMYPwTbs88/NdJK/3+k67Ins24T41YIVky4Gp+7SfjllNW1Hw0+ozBlD4VHjJLbjPqil5UFReR9+57V2EvM5hp31A8kINHbuwlOkz02jYRR5VWoGQ//Qe9DofdEmGunDjsfMcFvKXjf74dx3VVAZYPrCGNpZ6iXIaJZhK6TdF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkzJLsDy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkzJLsDy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775ae77516so55210255e9.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 08:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595059; x=1767199859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g4eRsHmASuGwyb/BaBJUOKdVAxYnEcEUDGaUnHd6qgo=;
        b=kkzJLsDypI66iwOtxlyowKWOLGtFdDhCJE64ZGOaq7o4hSec6hTyXQduuDAZ/mAABV
         Hhs4+9/VNt65lyJDgtsOPlw0/kVNtajV0G+V2WeIrUItnt8lDhZ6Nh8k0cuGbpfRF7wJ
         Qf+plP9fruLTifJ7z9v18Eg8uiWpZNllegojynMUKgQ/ZTBSHoR0LecAp/XuNxUJJKxt
         DuzkJkhoV8xPpdA42iToPaBkyt4VP4ew2ZxAhN/cGQk3S8cdfsUvNgSZ4l5tJBjuWTdK
         Pf8Ox7CZFtAs/6PU6ZLferO64mweyPzlMJUmFz9aYdHVP6Bs+OMHzmAdU2ybzYpP0eQM
         YCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595059; x=1767199859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4eRsHmASuGwyb/BaBJUOKdVAxYnEcEUDGaUnHd6qgo=;
        b=Mp0+HNDiV6FtsWdCfSFusA0HMYzAd4MYvszKKmlHflH3serQPK1D6SXlzNlsFNeI3a
         YVvMnk3Gj29mZgks1vJextU2NNpRDGo1+igd2yXMbZVQAFswxr1CCGEd/P+FIJn8hkL/
         JoJL9Ae4oF/lLUqmHXJIPoTc6yu8UQpN4j9XNckp4PUCdJIZ67nyOhEZlVaVBLdee7Jz
         Gz/BSPr9CFLjilQUeQ0U7K7V7oPCq7Lrdfv5LL7Wkw0D8jjlxY3fqPI6LgO1tNqh5E1Z
         J2kCu2L773ESj0guqt7bjGijbkAYietWTb6GnW9bMscJWVBY2EKv06lNnqm8sXyGfPGb
         eGHw==
X-Forwarded-Encrypted: i=1; AJvYcCXkiKVbb4E3ch0TZct06xMAGiA7ishkZQJLsLiP6neiIle8e9oDp8wisbGQQyiFRh8DqCc7MVd+ldA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Mkf9WiAZLX/Y9tiVOi1oEAekeHSz7/ErVKtsIguOw2DrCasy
	K3wPn5EdABDlxX2VmUfKIkad3FkYV4D7a3cTxHWkAqFW8LDGiqAaqnC2
X-Gm-Gg: AY/fxX6VRLEk1LYCpg/echA6UfDrh0UQncKueEwbefcGpztE5ov/Vss4xClj2s9kEtV
	t1UYhClqiuYGBes7FysymmRU406NNHGnbARfEZhpSq7ZjXQTKWVmIe75IyXXKji0ZfZYRD5ByDs
	VlA49Khf/8NRA+AD53uUuXA3SOSRd6hO935+Cci3v6wVxx1gLSVLl8q/lJAyXxRON7yTLKBLIqU
	TwRkoSOgpUKxyJl18gxK9rtt4o7TiMkroFQlorXn5wdWmdGBaqEkfRh4uPgVRYWbj2svLtCX5xX
	aQmVT2lGTjIqUYIcamNw5C3gtdp+r5dgzkFx00BUMFuOCCc4DR60l6mZVSgpc23XhIIxKZNbkn7
	hnxydcJT32jrasjdZRZVXrD/W5e+0E0M32FEExSYvgYHTDK0gBe/L5mb40zwic+2ByG6lC6gP62
	Y9ZGwLq3EK/gGLc54mbijx/MJ5pacpYhT9WRP/wtZuuvmmcJLh7EZFDdKPT3R+/4i1tXaHY5hkX
	z7oPRO9Gp0yfDCvGMcqSI2b
X-Google-Smtp-Source: AGHT+IEl/9OiTEZpBcYx1GBcVJZFF2FYtLewMgpxkdzBjzOsPnCkuhsZFwEaBxZj+b4rC/x1TmNzLw==
X-Received: by 2002:a05:600c:c08a:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47d197f67edmr141214885e9.27.1766595058836;
        Wed, 24 Dec 2025 08:50:58 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm136482305e9.15.2025.12.24.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:50:58 -0800 (PST)
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
Subject: [PATCH 0/4] Add CANFD clocks for R9A09G056/057/077/087 SoCs
Date: Wed, 24 Dec 2025 16:50:45 +0000
Message-ID: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds CANFD clock support for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs along with R9A09G056 and
R9A09G057 SoCs. The CANFD peripheral in these SoCs requires
three input clocks PCLKM (peripheral clock), PCLKH (RAM clock)
and PCLKCAN (CANFD clock).

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
  clk: renesas: r9a09g077: Add CANFD clocks
  clk: renesas: r9a09g057: Add entries for CANFD
  clk: renesas: r9a09g056: Add entries for CANFD

 drivers/clk/renesas/r9a09g056-cpg.c                 | 10 ++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c                 | 10 ++++++++++
 drivers/clk/renesas/r9a09g077-cpg.c                 | 13 ++++++++++++-
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h  |  1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h  |  1 +
 5 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.52.0

