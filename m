Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ADF2FF64D
	for <linux-clk@vger.kernel.org>; Mon,  8 Dec 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765188846; cv=none; b=Zt6R/zHcWDlFCrxt9r/hEBiGOtjcj0f49FdSnVVSrzlFJ+F4vNwTq4q+X8abWr2ZaMqQeWYEF6ds8OsOxw1z5U7QBSjfEOoDc5tGhAOjqVLnu760+hOTH4eOxkgmjSjhjt7MfEU7aTEP+qL+IEXAdCxbrcsE1rWKpeBWw8k7hQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765188846; c=relaxed/simple;
	bh=OGUGoktCxv+0k4ONqo1t/yzLSpibAYrMGksQDCiuiag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WGamZKeSNifXf6T2AVFFIzb+Sk7lQ29rkjyz3F0P94rkFJRfcC0rMFjPyUGE1jWN65Qptl8Xo0SeSJYMZXkeRdSLLzCo4KMGDFcNgfHl07YOLm1N+m8Ugsnsf3lIoD6VqEdMrrumnu9RUyLdG0Lak41dMrWLpaNVXpWrfD+Nw2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abb7oYgU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abb7oYgU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64951939e1eso390194a12.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Dec 2025 02:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765188839; x=1765793639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrsDhKmOIR7ug90SqQaxVq0POQHtj2Sf0DAiQ8VB8DI=;
        b=abb7oYgUM3gjNdwDphwx0AO0zVm3y4GnghQkL5QgC38usakCoqVvqGcr6PyG3rmm/q
         L51uiKUQnizzYdJR7upjrP49FbGT4MDqZ9Nd+fByKNpHr161UjsNNBjOfQRZDj5mQVNs
         LK2jltdDxUjK1tyxXH6+AZnwclCCfhjjj7TkMS2TLVX9imWt/dxtfDR551L8SwGWciQX
         00RO/1V9Z154Kx5ZO6TB8f0IUEjuCDbXpYRq98cqG2IjxfoFQC+fDWVM6lu9JciZdoHA
         B5rFtDLgF525AfYN5RiqsPgAbk4ruPr7qKryDxBD0MJI73ybjUGZg4EEkXEIGcR0Jmo7
         NMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188839; x=1765793639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrsDhKmOIR7ug90SqQaxVq0POQHtj2Sf0DAiQ8VB8DI=;
        b=j8loarLvZQxZGfpLnNcgeSoqFhIcNFnB2lK33c+xiEBWcQYSZyM3naCIk1iiK2iQPl
         wanzCXUpybb1mMijuYRbxNIqvmneieEqHO8BmMGCr2rR/6S98S/RlcIm+g+cCPX/nJmV
         JCkNZgPe3S2XU8/KQfeXFkIrzbZJplBnbsrHD18ueCzUmPNF4SsVdKZ4ZzhGBku3EIcM
         2MBvVOfps19Et+lW8daykMI3N525KG/YRnN5JginIs85HD/iHozGtXI/tABKVLqUq64U
         H149c9GeRLU8Po/DmTmAYoyNqEmC3XdMa0Umns1/85nP0CdqrBwh2YLlH4ec/ALDegdv
         etmg==
X-Forwarded-Encrypted: i=1; AJvYcCU57HrhoJYhqxA+7JmkYf7CUv2SQWniD1uDyYMg7Cl7uDvMKnyh2BJ7gOg8O06CtRT8awng7aoFhoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqCjQaXO1S8l4134E3+9VCCvmmFZDfPy//J50DFGzZnRHGsFZF
	1dx60bVdEbiBCyJQtWaMJyW1K6wOp40cgGoOPsQHz1+r2QeVCjs/8ABg
X-Gm-Gg: ASbGncvympVKKoOXvzf65r/829ip1ImGO2isz84igd7DgOZrI6pNZyVqBc897G4Cdtn
	UQa9OOAV12etziBNFA3U1nZodp/KmGTAPDPZx7ZnmoZdnSFEK88XdoSIpahR0LSIWHFi43N7Kw/
	sW35bmDYyca8SjDB7PvBuKLEODu4VM0ErAfmGepvYySkfm9CO0f3vMAcpAF5dL3BLByXbY25pCu
	ZxzL/BH++wc2dh/+guBzaEhR04r98GrDrgZpQfQL80fj18Ij1vCRiVepVU/BzCvxfW3DNODwESH
	7TgPvhlGSxOKICATy0IHr5pjIwJu42ClKbVR+tHeYVReYOX6yxkX4x7V+As60HSr/oe0cXXbIEC
	kCstWX3oLlI+s46Sm2uJBbhfXNVeT72kYAfOH/1I9NMYFhMJIeU6VmN0OXbIyqiilj3PhiYhRPz
	jVnTrLSz6Vsut9PZ9ASkXxWH5CmYHLFF5lBbG5CRPL63qdLjC79iKeN9rrw8hGsZ6Mp19XR6/Gn
	W0OVnMOUeZQGLpdjjQU0e/+AM8=
X-Google-Smtp-Source: AGHT+IH2rD/pn61Su/h9KiPu4oiF4zA/ByyzaA9JgtRUgkihMJUMRcUEh402amntg+HsE8+/LFj8fg==
X-Received: by 2002:a05:6402:4403:b0:647:8538:fcf4 with SMTP id 4fb4d7f45d1cf-64919c10408mr6355625a12.10.1765188839288;
        Mon, 08 Dec 2025 02:13:59 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b413b590sm10547083a12.35.2025.12.08.02.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:13:59 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] clk: renesas: rz{g2l,v2h}: Deassert reset on assert timeout
Date: Mon,  8 Dec 2025 10:13:32 +0000
Message-ID: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Ref:
[1] https://lore.kernel.org/all/b417865397822176e83bca6b9d8094fe92ff2451.camel@pengutronix.de/

Biju Das (2):
  clk: renesas: rzg2l: Deassert reset on assert timeout
  clk: renesas: rzv2h: Deassert reset on assert timeout

 drivers/clk/renesas/rzg2l-cpg.c | 5 ++++-
 drivers/clk/renesas/rzv2h-cpg.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.43.0

