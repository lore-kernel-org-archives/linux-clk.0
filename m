Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66433D9041
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965350; cv=none; b=tM3w8MkfgMatfQGzNOEGgCYdfxcQ/1bF9LDT5jHaXSmlXoha80frk1PgFfT8eVwiRJ7dBKY+U0dcHoLvZlWLVLJlkB4oIVqS105k2OMDl/0CeWR72aJ3EJj6q/hNtdC0dIjeU0gzUYWo79jl5oI42Q7C2to8OZUpot+qGWx3ZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965350; c=relaxed/simple;
	bh=okTpXfLVCDSn/wAnHr3N4/khcDgoUDYBZmBp4zJOgg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TiL5BN6Crlc1beWt1DBSy2RtvBmT273idlTIeDIW1qZJuTMZzykMSVHxZCKPy8HY0xHTH42vh6OkcBVZd0ZiaouGrsvRV+h160G6g6a+iARdkqQjF72KSbTptwYEjC9v5a+f0TqjwZmKj+HGD7OGRyEW8pcFqwaTAremgHhneOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbeSwQmg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbeSwQmg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ad135063so45859735e9.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 00:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777965347; x=1778570147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGhEOIKTkcJ1l9C7M/phiwDeHKIe8ujzIZQfumwHUsY=;
        b=LbeSwQmguxD3KU4I4YGYfEqV6O4F0Cqv2fjopUpyRjgHLflzCajqc6EAVThiBVOW+W
         ZHaFFkekCmajUem8fj1tLFQsJWaFYaKdpQ6qFV/QkThfb61Bssa2GcHSby/syhai5JLi
         hp4/Ogd5nnYorWZaXQD303L63tGY36hLWS1envJb4BHSEH/xRe3QaNiV0ZwVHYKu2u7e
         3f65MaW+1e+18V7bsLja+Jo9b8dOTArbKpq4Ec81/uurAyD4HNa1FhmGKfWKTDafMw/I
         Vj0Q/5cncQkoSELU/GfMY4nz1IJNsYtA6zKKhykbFlgjmurFid9jngL0d9FgLE2czN8x
         uoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965347; x=1778570147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGhEOIKTkcJ1l9C7M/phiwDeHKIe8ujzIZQfumwHUsY=;
        b=CSugVkCl3FKHxfM45VDbEESt9Hiusjv3m6nayqIwAqvhGzLVmZx/MLxYkBUDNS7V/o
         0JQ1H/Vvh+Amv5le+So4PnB51EvGRBQ5G7oxjGsz+D46y9NVAIfbD/YF9aUzzhREybeo
         VEw/J2/QXI0KdG/jwzCO9U9gsM0q2pj3AhnO/Pg9MWSoRx5Dvq3pi8J4YWOwHdV0wckA
         jKaUp5JpUuDkLH1dDyqzQ2gwWUvCPDlJd30SiWRunUrz4zX2bKtJ4+6u1f1iJ5l75KiL
         PY0dRGn+XZMRGqfNiQM7NyCW19h3yNeHiuoF5yJmmHyutOxaTR0xhCju69BL+67RDZ2Q
         ZO7Q==
X-Forwarded-Encrypted: i=1; AFNElJ876TBpQv0f8CUkOPiRw1xLl0pMS5ToHFDpPXBgdAZTb4Vnl/eLtP9mqX8Y9ivt71GXMLT3OtG/o74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBR6MXMn62Fgy7n8ix7m7TVuAWyNlXONkLfInMkYuP4fBvBD5
	pj0javus2VH8iwzuNTAFjK+Cf6+bf4nTluNAfu4qameySG8Vl/F76mXR
X-Gm-Gg: AeBDieuXUPpOBph0e4D3nYb791w7WqI9gez57XuEp2leh0Wj7wipNmTRAdi9FfCGJSk
	KMl46jLzjFqdInIAhGPFzPW/riTP3+XkVUhf3uYD5hsGdCOoFZE/cFMxZOT6X5CjT/imNbwht7C
	sk++iKEJPIoTYep7N+ePo1TRTglKINgg8bzyWRTQuV7u1tJY15PhKcRu8bT15tJjQhYe+YEr0rK
	GMlaRZefhWVmv5myDSUO7MmETNhdvWd1oRddO8gYpRHfqKaPlJcMxWuXGVt/BhI0UiIzSWeT8Dq
	QS962YdTvXlgWf0Yod0sk2x9JIThHAdKGD9XsVYuLuKmMLwJJXfW7b4VZNlVJv+VwnWgMDhLamt
	Y6sevOsz+bpzIomv8iQiTeFMK4UHxJZO7tlYmNvp7UDNkfJ0dDDGKDii4WEdZl/JfRk4SOXZaae
	RzFUvF7agj2sxYGMXFSgS1J6LLyHgritSXslBmkFqzB6X3dILJEHEe7cZ/yRY=
X-Received: by 2002:a05:600c:c058:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48a98874f6fmr132681365e9.10.1777965346710;
        Tue, 05 May 2026 00:15:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm352005845e9.3.2026.05.05.00.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:46 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] clk: renesas: r9a08g046: Add {RSCI,RSPI,SSIF-2} clk/resets
Date: Tue,  5 May 2026 08:15:36 +0100
Message-ID: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series adds support for {RSCI,RSPI,SSIF-2} clk/resets for
RZ/G3L SoC.

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20260504144523.153906-1-biju.das.jz@bp.renesas.com/T/#t

Biju Das (3):
  clk: renesas: r9a08g046: Add clock and reset entries for the RSCI
  clk: renesas: r9a08g046: Add SSIF-2 clock and reset entries
  clk: renesas: r9a08g046: Add RSPI clock and reset support

 drivers/clk/renesas/r9a08g046-cpg.c | 141 ++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

-- 
2.43.0

