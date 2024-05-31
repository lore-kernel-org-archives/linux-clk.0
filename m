Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61CD7710F
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717147639; cv=none; b=rRxdtBdhJxuwv2CYKrcaQCaLs+sPkSit3PUEaboe65cxyzEY3tRMPVvWg4B9dwv4cTU/JBCA2RM3cFLeytPuvFLfo98NFCfxuGELz3Ih8kxwATuA/DcFXtPlaVNlkAWYUT3cOvC/CaOHwMvqdeBs3HIliTa9SUbShDkPCCdllkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717147639; c=relaxed/simple;
	bh=glA0wCl4lQltSrWyYy62EoTfVe8JrGVFKzfyg6qHueg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZtP9VfeynxisZMrBlRpVobuQExLEkqnBlnwIOI2ww2dmMX2l45HfGTVTnY+cXA2U8jTNFNAV5/7MesI8ioIP7o4tEvrU2PR8ALyDBtRXp497PLJXEH1+DDOBRUn6sfgPJJL+onP6xON6MGlPneLLSEdSSL1l1zpTtFHevQDUx4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=otjK8zEJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6aqXqvwU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xpGW9aGC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=txGgbeyT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="otjK8zEJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6aqXqvwU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xpGW9aGC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="txGgbeyT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDFBE1F816;
	Fri, 31 May 2024 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717147636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=l+YfU9viPrCiXkQE3xw23iUZrKeBoEWHPl6GbE83aTY=;
	b=otjK8zEJYOsXZs7iU13NOjq6dHWj7HVpe/odLjXAOb8mmUxQHyJQ/p40p+LvVOHc1Z1GZL
	s9QwdN+3oseOi3anqw6xZsnvC/077wr79jP6GnrBdq1Fa8LvZgLtM6kWcPprxclu9pECo/
	/ii5v809lQFJtW7sgnIdxk7JN4JdGqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717147636;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=l+YfU9viPrCiXkQE3xw23iUZrKeBoEWHPl6GbE83aTY=;
	b=6aqXqvwUEO774rAB+i0PS2aiWhlC1C7L0FwCmtaLfWJdvnZxulHM4w+H8x5G2w0IxK3Mha
	V2KoSnPDi7xOuPAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xpGW9aGC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=txGgbeyT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717147635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=l+YfU9viPrCiXkQE3xw23iUZrKeBoEWHPl6GbE83aTY=;
	b=xpGW9aGC9fyBCASYO6nGYQXnIux//DHqeAJAEePFcHazBK7guNAibYIiOzSdJUfvFnvhy9
	uqDivi0R7dnwubTnfKpvIVAx5/TkCHlyUz1iMfL9HSWa1yGIrU/JUKD0yp3j2rTF9a1TZ/
	xaWbDA/h7xUm1f2TckAtlK8sXzd3RfA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717147635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=l+YfU9viPrCiXkQE3xw23iUZrKeBoEWHPl6GbE83aTY=;
	b=txGgbeyTH8gnWqRWmlAw/DBMo/heieqShagZreyL7/XBNYvnJmUEhP1HTkWNpx97eZFAxe
	MhNI/jT9iPPtzrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9092132C2;
	Fri, 31 May 2024 09:27:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7xGRNPKXWWYjGwAAD6G6ig
	(envelope-from <iivanov@suse.de>); Fri, 31 May 2024 09:27:14 +0000
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: sboyd@kernel.org
Cc: florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <maxime@cerno.tech>,
	"Ivan T . Ivanov" <iivanov@suse.de>
Subject: [PATCH] clk: bcm: rpi: Add disp clock
Date: Fri, 31 May 2024 12:27:30 +0300
Message-ID: <20240531092730.253484-1-iivanov@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.00 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[broadcom.com,gmx.net,vger.kernel.org,lists.infradead.org,cerno.tech,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.net]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EDFBE1F816
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.00

From: Maxime Ripard <maxime@cerno.tech>

BCM2712 has an extra clock exposed by the firmware called DISP, and used
by (at least) the HVS. Let's add it to the list of clocks to register in
Linux.

Without this new definition driver fails at probe on BCM2712.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 5 +++++
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 4d411408e4af..fabd5595e9cd 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -34,6 +34,7 @@ static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_M2MC_CLK_ID]	= "m2mc",
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID]	= "pixel-bvb",
 	[RPI_FIRMWARE_VEC_CLK_ID]	= "vec",
+	[RPI_FIRMWARE_DISP_CLK_ID]	= "disp",
 };
 
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
@@ -124,6 +125,10 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_DISP_CLK_ID] = {
+		.export = true,
+		.minimize = true,
+	},
 };
 
 /*
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 73cac8d0287e..e1f87fbfe554 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -152,6 +152,7 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_M2MC_CLK_ID,
 	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
 	RPI_FIRMWARE_VEC_CLK_ID,
+	RPI_FIRMWARE_DISP_CLK_ID,
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
-- 
2.43.0

