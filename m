Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F46334366;
	Thu, 27 Nov 2025 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764255498; cv=none; b=lNSHnOQC5hEQJETLIgBlNGzZINpcdkaFnY7PNCwsiLd0FN1vnoRuZ+/CHJragBpr6UvrbvZBN1H9RWx9tjf1E/I5+fHQY11eKtUdkhmix+8qWBZK+xJgosiJLxdAoH7YwKI2govFLTXLVUcAfQxOZ7tf4oZSQiudoG9Jliusdoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764255498; c=relaxed/simple;
	bh=Udi7InBMBwxI7V8iwexVaKFOom7Fh+j19Ht6V+0WzNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ktuDjLopmNDwDe45ld3bRiADhRFKFExAX6aT+5qtGB7xOuUTNML+kX1BrWHLI/bEdNfICdwonS87o9CkLluLQBk4Tbq2vFczxbINj3Nvc0FEyG/lEHoCa8/ETmJOENSNP+/yk2oLYPOyh4fNez9w7ZZPiWH3KZY6x7iA9AvwOss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: AXxd4m++TIqpbb3bcQYVfg==
X-CSE-MsgGUID: uHBEQEhTRL6hPnkTrS7CGw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Nov 2025 23:58:06 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.189])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B05904010075;
	Thu, 27 Nov 2025 23:58:03 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 0/2] Fix CPG suspend/resume on RZ/T2H and RZ/N2H
Date: Thu, 27 Nov 2025 16:56:52 +0200
Message-ID: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes an issue when entering s2idle on RZ/T2H and RZ/N2H, as
the register layout in use by them was not accounted for, causing
aborts.

See patch 2 for stack trace.

Cosmin Tanislav (2):
  clk: renesas: cpg-mssr: simplify pointer math in cpg_rzt2h_mstp_read()
  clk: renesas: cpg-mssr: handle RZ/T2H register layout in PM callbacks

 drivers/clk/renesas/renesas-cpg-mssr.c | 46 +++++++++++++++-----------
 1 file changed, 27 insertions(+), 19 deletions(-)

-- 
2.52.0

