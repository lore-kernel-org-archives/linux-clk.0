Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2778DF4FA;
	Sat, 28 Mar 2026 00:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774656054; cv=none; b=VV1aeV0j+ym4XqTsQsrzBORHs62WMQ2/w10F3AS9sV+nf69X+kM5rHIyEm0TFWIzyY0Ahetnxi/YsirAHp4dFxVpjJkX07j0Ijb25nXrz1qmJyw+zj1UcEiyXT9nideJdY4Qs7QxGI0W9B1Sf8B6caNfLGhsmn4QDrp6q2QrTGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774656054; c=relaxed/simple;
	bh=xVfZoPe9f8CJ+iT8FVmiyMGFFwkR2pIdijUAdMLmwKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRnrDS6/POechunIA+NX8gnwbfpJ/LUng6alu3HLGvW386/PyXHewoYnaiv8Cip4HEViipiq+DELQbJ5TttiIPNMlxuB1NJZ4rD1YkWUmTlLiqM4TTcmaTMTWwaOpxhwPmksfyDrURc5WoTcoOy2kp4L+590kuadunZF4B2tRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JWj60bgW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gmhbv5g+; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JWj60bgW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gmhbv5g+"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fjHhy355vz9tgl;
	Sat, 28 Mar 2026 01:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ2XWEV2FATbgEJyCNwydDCXXSAIds9YSXBHTGFZU04=;
	b=JWj60bgW5y69OqXlUkH5KnshgLFHI6ITvPjSswGdv/yE3RzWAysNq7PdlfnnhhrZng2JhX
	4sxvS/meOs4VjJRI0Zh9iUncKkri6u4eZpu3iqPaEUySi6aXsR4TEI/e5pChp+wzx1ls6E
	UqD0stLHcMdV26My2BNyuUD31L+DDmkYJT2aKN/oqg77BgVDdzzn8hLXzyIJyTNJ5O1aBq
	0d4DyoQZjUd1X66xM3gJcSsQVzYBp8EY9mFnN6SP0/UyPUkdyzSigzJY+WqwPTMGiDI2Nn
	gZJZgWOQ3xe+g+CR5002C44ZoNMBfmjZGAQ/eKqnVeKYWb8F5CsS1xiY16xD0w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gmhbv5g+;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ2XWEV2FATbgEJyCNwydDCXXSAIds9YSXBHTGFZU04=;
	b=gmhbv5g+5wIwkyCuW74uvfEcHLDJvV4hdMK/jFAu7SoaCeXoxBAj4jr+W9i6jBSSfBnShZ
	Hyp8qv/F/zVtqgQwOLAUaOa3aP7tTkfXRssu/uCg/T8Um1sKvB2+wFe50L+/zTvfJcMIY3
	00yRO+keX589pNaR501gzXvsodU4FsJsgxYDBG1G3CyPt2Ji3QHw9/UX8YRokZATpKfUb6
	I2W0mHKxGCYznSY/euVn3zMkQPTgJdTiQMNSp2S17u3GK+A1CCpQe/mYIXrt8BZ4K7f5iy
	u3RN+UQDjgB6qD5M10klo05tADgN3BAUp7VVesDWuweqkYOpteiHrYmFY0RDQA==
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
Subject: [RFC][PATCH 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:19 +0100
Message-ID: <20260328000031.94645-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qsz9pumjndg8z8ztm568pkzihbkix5cf
X-MBO-RS-ID: b94a82c6cb88c768f2f
X-Rspamd-Queue-Id: 4fjHhy355vz9tgl

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

