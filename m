Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FB63A453D;
	Wed, 22 Apr 2026 23:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776901084; cv=none; b=kZmFiak4ahSMdoV4FxnY8ZJu7eSI++5DMxcg1JwfsJkEJyaqwoHU5duj434yTH5zn//BccUEV9YA2dpH//Eh1AU6qobunXq0MKHHjZzwDTi5kg3WdR6cbmews31EA7lZs6FSzU0pA8UjnDzhz+pCiLLgQVnKBSUPRESKxxASdqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776901084; c=relaxed/simple;
	bh=fPvjN2E/vJ1EqiIKuSepuYPy6Q/2yUUo532Rkvs86ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qHqCfBhAtuqJpiDdPHfrME1FgeAwAC8IxxdxWmHNgtFfLUAO77AK40Ld8BYd83oLMijX9zX5RJ3nDOXP+f1f8o0reSrsj7RhjeO1T5DQIDQJ3m80YC9Zcz+coxMHQlBBuZKHp09QrwvuxTuTNBpnlfQOFFLSkJxoLJBTVOwmqm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=F2MxnzWj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nC7PllBi; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="F2MxnzWj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nC7PllBi"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1FyV6vdTz9tcZ;
	Thu, 23 Apr 2026 01:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwLMu1S7onZGhcBEnPy37BZ83bFz3InaGZ5ATIAgs1o=;
	b=F2MxnzWjr/rjOlLjFLJ8lDcdUBJ29FAPq/f1uvVSSPdb0/oqAhkewuTeIgNixcwib9BH1F
	ufGz2bfdFUqDZkCvE/fhWHsTBZ4dOZUVJwLzeEROAYG1zuRwsURPvRG4HDpDo/LlFje19T
	Bf+WzUB6INHm7vlXbaVbJHoVqeGMmHMlGzT5t/nSkNoj8fjn+a/nv0CYEt09Ch+mcGig5C
	KjK6GdoQSL/SeIUnAhEPZVdRfFcsc48RgrwogIomyf75J7FT9xhL11UQqHYzXt1tVzxVPP
	DT+8ets89793rX9BLAqgYy4K84r272bsjtmKPx7GVdOBDAr8f9jNU/K5DFTF0Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nC7PllBi;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lwLMu1S7onZGhcBEnPy37BZ83bFz3InaGZ5ATIAgs1o=;
	b=nC7PllBi5zm8q4iK4aQ1ZqWpqfffTF0UOAGn8p92TVDRKGXcLr1MgSJApe3kC1AhdQjJNz
	VZqOmlx6giciwQn0oezLGcBjlSEn2Ve5YykcANjhNEKVyBu/Bn+Kdl88JbubOk7eLO4VJ4
	DasG9ipzW1jla7bGtdc3qPtNMVwZPrhtsEIRKoeu9O9IJn6VW9RyYc0nsf5H6o98rmAum5
	XQptR1/oMs5n6+QOMnzpWMhjK8eMuRHIm44aBaioYXmx/WEwRi2j+xAm9rTij6sHx32hm3
	xWd2lap83nZOu1n3KBQEIDuEVSTE2ISjtDYK9O8+m931SbUp3MDCE3ru/CjOrg==
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
Subject: [PATCH v3 0/4] Describe coresight on R-Mobile A1
Date: Thu, 23 Apr 2026 01:36:26 +0200
Message-ID: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 05b81d60baa4b6aab34
X-MBO-RS-META: stzf5gfauquz79qbem1ishg3nww1im6x
X-Rspamd-Queue-Id: 4g1FyV6vdTz9tcZ

Implement support for ZT trace bus and ZTR trace clock on R-Mobile A1.
Describe coresight topology on R-Mobile A1. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Please note that this is written according to R-Mobile A1 User's Manual:
Hardware , Rev.2.00 Sep. 2013 . I currently do not have access to this
hardware.

Marek Vasut (4):
  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on
    R-Mobile A1
  clk: renesas: r8a7740: Implement ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
  ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1

 .../bindings/clock/renesas,cpg-clocks.yaml    |   6 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi        | 116 +++++++++++++++++-
 drivers/clk/renesas/clk-r8a7740.c             |   2 +
 include/dt-bindings/clock/r8a7740-clock.h     |   2 +
 4 files changed, 120 insertions(+), 6 deletions(-)

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

-- 
2.53.0

