Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E935E1BF;
	Wed,  1 Jul 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917530; cv=none; b=tiN+wc+4C5GHJyvF/CKSmlzcf46cvip3S2qJwyTqBF6B1N7Dbv1AUMsji2FC6TB9IgZDA45VTwbrFEP0V4+8b3npYjd9ylhLqHZWrOR/abzf6TnkgLSLW0sqHCddU8pftGclxiiIC+eHK+4w0pfDmiUJuZhXpTFA7hau75+gaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917530; c=relaxed/simple;
	bh=/vca1q8opkBckH2fh34ilm8hmardMelgES/zJfNx0QY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OW9JBEltWvizOAQjQtlrk1X8k8RMn2X8R7eIUe/v0VRUgfBN+/B6oxmnXF1ECLFAJJMv95hEIkB039YAutAjn4b9VsVbvlYvQtto54jhvERtj+UUnR3od+9bUiG5ohFtz+KQW3xEAHrJoL/GVQwr7YFL6AX/dNEE/lg7UCmLsQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=g5DL7UV6; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="g5DL7UV6"
Received: from email.seznam.cz
	by smtpc-mxb-7dd54556bb-mmpkq
	(smtpc-mxb-7dd54556bb-mmpkq [2a02:598:64:8a00::1000:90e])
	id 4148eec25ada631645ad5740;
	Wed, 01 Jul 2026 16:51:54 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1782917514;
	bh=chPS+RNkrmXTe3ehJ/BfFYLgi6SC5NP1gcF9y9DGqgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=g5DL7UV6FPHPCn3HqHbGc6Nh/sepzpVNnNkIKicoh8tNSfDFAYZbWghZxi49h6bi0
	 p8zBP56bfm/idtkBn9ort878Kel9bJyPjiOTqPuBI+V7Jy75uFHQDD3k9hPn8g/3BM
	 jOQB8L5vGklzRRRGhXJvTMgMEr9tyqnN3oRXfljLwEX592QOUWfdw8etR/QTprMLDM
	 U6Pwl0h4ZqkV3catqt0AgqE7qPInshaNM24j7eIzaMBXGqFWEuk3A/yN9eDP68hM0A
	 VGKnEiAwFkkrgbwn1X+4WqZhHx6/StIKydi32tOHYhChJjPY4FfZaiN5DZK5rx+Ba1
	 V++b4p22ETKeQ==
Received: from localhost (109-81-118-98.rct.o2.cz [109.81.118.98])
	by smtpd-relay-f8b496c7c-jtrnh (szn-email-smtpd/2.0.76) with ESMTPA
	id 29c0e294-37cd-4f7b-9f50-5acea2c588df;
	Wed, 01 Jul 2026 16:51:44 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH v2 0/2] Add support for Si549 programmable clock
Date: Wed,  1 Jul 2026 16:50:59 +0200
Message-ID: <20260701145101.3932655-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds support for Si549 programmable oscillator. It's almost the
same as already supported Si544, except it uses different internal
oscillator frequency.

So new compatible strings are added, and driver data is extended
to carry both maximum output frequency and internal xtal frequency.

Changes in v2:
  Fixed obvious stuff found by Sashiko (extra unused struct member),
  removing unneeded data argument to calculation functions, xo_freq
  is now passed in settings struct.


Pavel Löbl (2):
  dt-bindings: clock: si544: add si549 compatible
  clk: si544: add support for si549

 .../bindings/clock/silabs,si544.yaml          | 10 ++-
 drivers/clk/Kconfig                           |  6 +-
 drivers/clk/clk-si544.c                       | 82 +++++++++++++++----
 3 files changed, 75 insertions(+), 23 deletions(-)

-- 
2.53.0

