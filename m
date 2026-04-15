Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A559311942;
	Wed, 15 Apr 2026 23:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776296004; cv=none; b=eCeK0ZXwwE/LZJkMbxfs49UZwHl4VQd4OC+mmzclZe/M7cQsq88LakucdPgU95/ADXdMvYfIusvaSRWqlAUbz22zRcv8vEr5tdLmbGII7NUsvacV54uNBTLVDVm1kcCeA1Lx0BjfYBFMatUD50hcyTZxXv2Ldv6RmcAyKeberns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776296004; c=relaxed/simple;
	bh=bxQpNUw7uVZXoYGQ5R6bkYogHvtv7wR16ea9cvYTJXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPpBUFBC2P+Cv3jixn7F2hiiEYp560xLCr574M6ZYQy2WLkjneIZys8RR1sLomXpSgt3/sId6RTDbEvJ1BqM3O8vg4nrB848VCFnrtdS6rqnzDzN+u28sK+VMEKJ2qtRj0VVo9dgiEP75mQCjvgN+TQUSsCY/eRAa7vT/YcnrJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=M4vaJbL3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RHwUIsI7; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="M4vaJbL3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RHwUIsI7"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fwyBT3cSSz9tff;
	Thu, 16 Apr 2026 01:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LS7b4nt2CaxovI2sYJxZS8EFjpXGqCXQdb+UI5J1fMk=;
	b=M4vaJbL3qYavG6n1tXlhY4NwrZFTAQtVmdqTB2XwSBeXrP5VaYk7JmX15qY7OrkDluID2o
	Qg3/nQAlciMrwd1LH2veo/Zo+UoWyay+kZfsSR1VcT1lWAxQWyY0grJ4/uOuGzYijXG6ya
	qBwl6NRjfmaSX1S/gdlezUW4S5d9axK5K1EkGTQdYKrtAMGntxu1MESiJWiBJ2HkQnulAI
	AvH/ZCnqqOJ66TxgEYDtOn/7zNBGzdqOAj+/J1tFlArZNolW/MHzxHjAjJAgBFAgeJoZ7x
	FcLisN3pfd87MvYNqVbFgUDjiUg7eQZP5ToUDx6bnJ+y81oeDRO7RTFaDiokFA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LS7b4nt2CaxovI2sYJxZS8EFjpXGqCXQdb+UI5J1fMk=;
	b=RHwUIsI7iUHWok3pnmIKOMqlFhaQeSmNgPk5ZsN/i/HoToWuittMKSRyj4CaF8au5KvZAc
	vvwsU0c1Hr2GypemVO/rWaNCYh3rsswJv01sdnwbIdaKA7ZQRkF0IxEYp9/KzA9muHD44X
	hNLMyvzimI+SZVIY6zJ7c6qtKuQfFez37UAPsR5L0MJhLG5pFsn2TpiD/hlEdlS33o9Mmr
	XAedVizEBZ3RFzY730pzagfX7B/KKM6xG2kLlek4qQMHqxpmL9q6TF2fHZkaktJMPV5Hfp
	XntiX5i5Jp7feb4FpnlP0QUJtc2RqLcLn5Hm2Eue5/yxIm6wgM8Z4OHtcDS+dg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:39 +0200
Message-ID: <20260415233300.457892-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d868da50f061637a0a1
X-MBO-RS-META: fxs6xzmm1khhhrrnqynihxqqugr494a1

Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 drivers/clk/renesas/clk-r8a7740.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index 635d59ead499e..31a79674583e8 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
 	{ "zg", CPG_FRQCRA, 16 },
 	{ "b", CPG_FRQCRA,  8 },
 	{ "m1", CPG_FRQCRA,  4 },
+	{ "ztr", CPG_FRQCRB,  20 },
+	{ "zt", CPG_FRQCRB,  16 },
 	{ "hp", CPG_FRQCRB,  4 },
 	{ "hpp", CPG_FRQCRC, 20 },
 	{ "usbp", CPG_FRQCRC, 16 },
-- 
2.53.0

