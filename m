Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956270;
	b=yHnVWqUA3k0crlLphd4nG1Ovw0HDvRb+NnsXXJLcfL2nY0qu5evz6FuztqPnUp23SXCn
	 gQrTqAwPCGYsuvgMfqEVXQbVV9mZ6xFVaQ/bXK0eGzdZOA9QUGI2RA0KoagfQcC/PfvvM
	 fS6axBaH9hecXcQBiY6ShYyGlsSqEBTOQOH/XHvbdSy1vgcVvnMy/Turv8OwXvHie8hJe
	 Yw9BCHCRpaUVhY126H9dFUsuBl5gaRAQMSxzqrdgTuvujREUYMW8Cous1rvTuGIeAcLSA
	 N/C/rPCDypnl4/kKsLAc0Kvle82jj0rQ6EpvFR5z5Z0CFg46LEINb6lZ/JKJTXAQt3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956270;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=NIeDseMKJyVvL1fXcLlTOdRUV/IjUHUNJ1TexeATk08=;
	b=p7xWFsKxG44FBrq1slLEKNGPbCqEjI4cHO24LnShtHk36Fu8vGXaGrZeYYm6O0WPS5Vn
	 DqIb2XC4ysbRPIn6Kpq2nYb/slQ79MTVoW3dzF8CG4QqEEfWYRa2R/uUEQxQ6IRiuRdd0
	 uKe79fLMnBXG56A8jswfOEAQQsQzyCsrtj+VDlsAOKAQW6gyijGpDRSMZfvbl61LyBUzm
	 qtWtGRJfYMp8fTgiRPo7idLxzrJtTl9rsumRVOCfHWs304CykJBbwXPiVH1bOrznDwgEH
	 J1vig889+sD2QMSWcV9o6QJsbdQEEW+RCAeWN4DZyTe+uyShoN9ErcmXWZ55lokAHKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Cz0g25L3;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD6606A33D;
	Sun, 25 Oct 2026 19:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DD6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Cz0g25L3
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJO5IZ518377
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:24:08 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJO5IZ518377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956249;
	bh=NIeDseMKJyVvL1fXcLlTOdRUV/IjUHUNJ1TexeATk08=;
	h=From:To:Cc:Subject:Date;
	b=Cz0g25L3Bzc7vojTcEyY2ynxGoIbDGhVVyEJwDU00nuhDHd2a0lm5kRQ8zeWqcj1/
	 9HB5zzC0Aa1QGvcPELskx3gsDN+qRhe0pfARUdwClVWyD/av5sfZ+PQc6GdIGWjfTL
	 99keGbUuvEZO4m5SS3UX1OjabmrDHUgMBwbJVKDI=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
        bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v7 0/7] Add support for S4 audio
Date: Sun, 25 Oct 2026 20:23:57 +0100
Message-ID: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

This picks up Jiebing Chen's "[PATCH v6 0/4] Add support for S4 audio"
(and the tohdmitx S4 patch) unchanged apart from rebasing, with
Jiebing's authorship kept, and adds one fix on top:

 6: g12a-toacodec: fix the S4 source mux read-back. The S4 DAT_SEL
    field moved, so the mux always read back as input A and DAPM never
    powered the selected path.

[ckoever: Jiebing, if you have a newer version or prefer to post this
yourself, I am happy to rebase the fix onto that instead.]

Tested: HDMI audio up to 192 kHz; the TDM-C to internal codec path
plays without errors at 44.1 to 192 kHz (not listened to).

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (1):
  ASoC: meson: g12a-toacodec: fix the S4 source mux read-back

Jiebing Chen (6):
  dt-bindings: clock: meson: Add audio power domain for S4 soc
  dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
  ASoC: meson: g12a-toacodec: Add S4 tocodec driver
  clk: meson: axg_audio: add S4 support
  ASoC: dt-bindings: amlogic,g12a-tohdmitx: add S4 compatible
  ASoC: meson: g12a-tohdmitx: add S4 support

 .../clock/amlogic,axg-audio-clkc.yaml         |  18 +-
 .../bindings/sound/amlogic,g12a-toacodec.yaml |   1 +
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml |   1 +
 drivers/clk/meson/axg-audio.c                 | 165 ++++++++++++++++++
 sound/soc/meson/g12a-toacodec.c               |  51 ++++++
 sound/soc/meson/g12a-tohdmitx.c               |  80 ++++++++-
 6 files changed, 312 insertions(+), 4 deletions(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

