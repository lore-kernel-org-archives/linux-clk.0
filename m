Received: from mo-csw-fb.securemx.jp (mo-csw-fb1800.securemx.jp [210.130.202.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE92FFF8B;
	Fri, 14 Nov 2025 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763110475; cv=none; b=hIrvs+4HLhXQRiN9unEEmSJFrToc0gT7aGC/HcZMYWFhx4oaQCRMNyD/aAgk1on49KFCMLUS+tQvF8dc+Lw+6dD1LFy+BZ1suvD74IJyjYNBE1V78Dhr/87cd6+v6QOAcKC2N6zsCsjFHHOeyFOxrVzbjCtyGLDHyBOQJ/JA6Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763110475; c=relaxed/simple;
	bh=FBwrMGwxHt0KLvPopuPdLsUhZ8WTHzQEQbfykQ+O80I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ocfOZI/cjMA2vBdfllZieTjGO5WnyymsswKxW0S5spFKYGka3gT+guZFmSUTzr67wuSZx2lQDSjqbAEkNCdmMWYoRV/4kik4ePtITBaTwP0gtcJ7blI3f/5zuWlC/16kS2NJDk5GrrhshEISeG0WI31T8hORFJVCnf8xGV+8vvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=LaVQ1hKj; arc=none smtp.client-ip=210.130.202.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="LaVQ1hKj"
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1800) id 5AE6xkTg2553447; Fri, 14 Nov 2025 15:59:47 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;i=
	yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=1763103550;x=1764313150;bh=FBwrMGwx
	Ht0KLvPopuPdLsUhZ8WTHzQEQbfykQ+O80I=;b=LaVQ1hKjenagJyFXdN8pLN8BJj7cVTvr9riuWV
	L3VfUHoNtBMMtUno3Fo9trqO35n5dlmJ9N83lK0YrdchqDIvaLepmTvz3S2uTvhrHrnEuJmUKlsa7
	2/TBtJP4v6QSTgJbXKRw6iIA4CZhJ2KTrygurbfF0TIRw5+gznQPaZaaVhj2mPuEjL2WCgVb35Ifc
	AVztaxdFeCvrmB4J++qSKO7b4T+XEm7IEAlsUhPpVae2z2mOAORAFq6AEjfwOGlFBTa8Rwddx5MFj
	IisHmj8lJSpfcy0+D3zeYy1XFZBJD8iKJLwQfov3dZ8qM/7yLFuDrqWj9UwYe7qx8zwFcKWvw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 5AE6x9nB2557328; Fri, 14 Nov 2025 15:59:09 +0900
X-Iguazu-Qid: 2yAafBYzAZJ31BNeos
X-Iguazu-QSIG: v=2; s=0; t=1763103548; q=2yAafBYzAZJ31BNeos; m=/V0bFjDZ9x29Fry2XACe/Vf73K+aaDIbQJnbzCRuRtI=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77KR4Rx1z1xnZ; Fri, 14 Nov 2025 15:59:07 +0900 (JST)
X-SA-MID: 54822485
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH 0/2] clk: visconti: Remove definition of number of clocks from bindings
Date: Fri, 14 Nov 2025 15:53:56 +0900
X-TSB-HOP2: ON
Message-Id: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the definitions of number of clocks from bindings because they
prevent adding new clocks. The first patch removes the use of the
definitions in the driver, then the second patch removes the definitions.

Yuji Ishikawa (2):
  clk: visconti: Do not define number of clocks in bindings
  dt-bindings: clock: tmpv770x: Remove definition of number of clocks

 drivers/clk/visconti/clkc-tmpv770x.c         | 8 ++++++--
 drivers/clk/visconti/pll-tmpv770x.c          | 5 ++++-
 include/dt-bindings/clock/toshiba,tmpv770x.h | 3 ---
 include/dt-bindings/reset/toshiba,tmpv770x.h | 1 -
 4 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.34.1


