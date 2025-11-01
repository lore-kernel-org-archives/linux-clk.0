Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF934D3AE
	for <linux-clk@vger.kernel.org>; Sat,  1 Nov 2025 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973246; cv=none; b=j1C/EBC0lgDm2TO0/slHXnxjpO+aeAR1SgnSnsCF5RooIrWZEIr9KAz+XQUiW8HllbGXT+fhvYfhqCYeC98G+6ZYymZxd4BiXtCuJ+eDet1p6r+HwyAIgRh6/CLKS0EIOvcEcXGJK6vxni7waWVJIs8WUn6faEiJ+Z8SiPcvAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973246; c=relaxed/simple;
	bh=Oh44UZjHsMc/rfrWX2YnpJEvv9Vn65qg079kLT1V5X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGInxl7xGrZ7FmXCXXFJ4ovAqU+WvwhgdJgFl/SnfegtTsd9BXx0zpFL3q+80xYD+sT3GlYc8ao3w+TLfhiFvcca1sFfT3t+43nAB+CTvweDbsepFAiRqDfY0O//wMCo3NvA/RnlHr9v0m6TSd+3lwQ9dqIXuGHvTS19rhKWNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3C62Da0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3C62Da0"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3064846b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 22:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761973244; x=1762578044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIwIO+j2mO8maDFel6M1v9YStfB+c9Y+ZJYZAlcF5l4=;
        b=K3C62Da0MiW2n+FCH7++i2JfNn9L0KD7y8swc8xt+7eNOTCsy1PHF73Cl0F0jjEijL
         2GyQjTeYRkONJKkCIdPkbKnEIM0cm67/EIb4ZJBs6FfQPQdJjddVZv10I0K+pE9MOeq4
         MmijoZG4OCbeOkutGtJKd5Lbr1rC6XFrmcc1xemrSIvQsvuZReQJSw6mCNyr5upeylJe
         GkkCGLo44eNjdybxR2cGzo5TyHHn9wRE5Dh+Ty5i5KfhJIFE2Si306VRoFBhrpXCnZsZ
         YXg3SzvcwqsUZEGTVbVxxRh3zS7cLaFFh9IMMPAPLmZytdnnq14D93cOv+o6/v36tgYW
         EAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761973244; x=1762578044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIwIO+j2mO8maDFel6M1v9YStfB+c9Y+ZJYZAlcF5l4=;
        b=hbIh4u7h66si2SN1Pv0AOvxMDqDBkcxvIKFWRRJtK2+nmWd5JmREjqGV8GnbxNMh3u
         m9tzrIknFnkxBzEy3XWS4o6weDybSy+rciPeLeG45nbJYzcNHsF6X7xGng0/AnuoqlEn
         hjhACBH0/Kx9ZXNoK0DB4czyMrbpu6kneI0NxS+eSy24YUIWgbuvIckOScf/ueCuiMPy
         XJ8m2HRiu6aZVeNJp2yWBterqXpWVBaZc7buzNnsNKDJHoIhF3+lhiNbBRZObhvtqFfM
         pDeMJqyI1N6khx4QwmepNa5lp36EuTgy0cSrnlz+axCJbdFMkr+BB5EAKFI5gYCn6qYG
         wjDg==
X-Gm-Message-State: AOJu0YzVV3WyE4L/BdNEG7NG0MytgR+bld7bB0c2ttq9JPKfCDZENXqU
	Bc4QhSFvPJRBh96qW1OLC+OE2ygPNXsc+BPYW0CzqL0tbJ26+kmXyxDh
X-Gm-Gg: ASbGncsrDEwZmtEH4lc8fr4Kcw4kAWd5QzAR9De/jXvSul/PMTxq3aL1fkcxwP3e73w
	6U6K1ixGura7p2HtgcwHobW9xOuflQIFnsbw/TWBB341+vKqgrK3XsMcObh44s8qLTfi4M1ILuk
	PbRS6uNsSTgPSve2Pkj+2iYgL9F7OBrku9U9ihbeLR8QyR+cWf4X1VgWS56G3kKtqv8UZyddW+l
	wQAVlkA6xHE+S9rNGbW4rXpLuy14U/h3W4T9ZP5nGnYBaOOAiDr1w+oCTdmjAPweI8RKJVlERy5
	S7rqbXgvC2tFwZ/bKQmhZV429uZypr4UwcKir6wXtCSo9BnX3dJ0XV82ltMUG3SpPud020AmKep
	8jtbDHlfwzpZBMHwYnpw/FsRdSJoExL+SJhQVNllE6MdDoT8Hz6hOnmbWcFPeoOeKjkrxBtyDr4
	cvgjdbzA2s5Kzr8TwLmtnVZv3ajath12c=
X-Google-Smtp-Source: AGHT+IEMhJ6NXDRyaN0YqS139CnyyfuTRt27C2a8e3X3e0TG0+kZ4vhiRrmxHXesFyCgHskXvBB3jw==
X-Received: by 2002:a05:6a20:c916:b0:341:8609:3bad with SMTP id adf61e73a8af0-3477a5c1395mr13547881637.5.1761973244223;
        Fri, 31 Oct 2025 22:00:44 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ff1sm3761095a12.14.2025.10.31.22.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 22:00:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add USB3.0 clocks and resets for R9A09G057 and R9A09G056
Date: Sat,  1 Nov 2025 05:00:30 +0000
Message-ID: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds USB3.0 clock and reset entries for Renesas R9A09G057
and R9A09G056 SoCs. The changes include updates to the clock driver source
files and the corresponding device tree bindings header files.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: clock: renesas,r9a09g057-cpg: Add USB3.0 core clocks
  dt-bindings: clock: renesas,r9a09g056-cpg: Add USB3.0 core clocks
  clk: renesas: r9a09g057: Add USB3.0 clocks/resets
  clk: renesas: r9a09g056: Add USB3.0 clocks/resets

 drivers/clk/renesas/r9a09g056-cpg.c              |  9 ++++++++-
 drivers/clk/renesas/r9a09g057-cpg.c              | 16 +++++++++++++++-
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h    |  2 ++
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h    |  4 ++++
 4 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.43.0

