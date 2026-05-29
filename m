Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F1F36F8EF
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 04:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780028459; cv=none; b=a5OZVlm73aFsdNb2pX856KQuobvyim9361EaTeJ+otK3UXPjVPfw8Rrhgm9qGVX4jTB80FKHm5vpVDpSxzhu6dsB3rUJWfQz1C8SSP0xF0bXgz4Uv2jSki8VL8WnaIxJorNdePmc1PWLMBo/ADAPSHelv+1Q+w12QrC0JEx5MPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780028459; c=relaxed/simple;
	bh=ghvC2aNzsNxfWfSR2vBpzCBRKYZtlmqRYZG8j55thR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fiE95Z/ZCJPQcLmphpNgCj5HL4fa2uY41IybC6Kcny9pwtgq9IKN4amRXXe5oSrf5rJeU4VNkELlKYFYbcYf84RM5fk7XUvjd7ReGXr1x8Ku5mJZi62w6FLRBYC9AfYIKzp1az8bSNMWDQT2oaPmZYTNlZ/CR9/vnd9khGxFUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIq2ttCw; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIq2ttCw"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-914cf9248ceso492855585a.1
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 21:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780028456; x=1780633256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkkJotVpft6x/vARkqnh9oEixNmMN2cX8O5U+VJWqdM=;
        b=pIq2ttCw2qg7vwJ786rYYmH8UlVVWGPpZT9XGu4bnxCba0+HVObPlVIrTfT9gdcL4/
         qcQX78qj7mqKcDf433U20cCX459QGsQIwYqO3VSKyd0muRgx2jOkw+lAaAcOjRU0IWhv
         p7XhocSPyyNwPsnPz314l/u4WrZEvxbm0bREOu5Gsc4DLcjHLItjLCcybbe41IKWFMzn
         RvmNj/+v9Bo8fz6PghCV43CaXqNpSOJnjgZt4OCwtnvbdBSjg6HEY5kVFPmO5RnrXOuM
         rYPK35pIHFHlWm8cuXYCRBR58dWNyF2kjaeGrq7Lk9GYl/tLw2Sq/bgEn4O+q87fxKjK
         r4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780028456; x=1780633256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkkJotVpft6x/vARkqnh9oEixNmMN2cX8O5U+VJWqdM=;
        b=ANS0mBrwwrxQtj5aL8UlT5g+t9+n571MCtEGWQJCWPQXjiVkpgK2mNvQS3AsyoNFM1
         yVO0RtrTMGxOC33uZ17XHYoddwUifJrlm4E4m8mTnrEtu3kldFBbR7qaQXSJerOyMcm+
         4YeCYoQt2V9xWPHQcbfeYwxIbheBfFdch3O0JOrGEkLGN/+Kt7Hd3wntZ9rc46Qlz8W/
         6CF+p6FrkBEEpLmXSz7T/+dT7HffXU1VYMhAUSrtbBz8k/Q7++qVgqam971rS1Tur0NR
         uWjPA1dCGKt1/9fBWoFVYla6j/okJpOgt23MGgmC0Fv98shZDtPO186xT5KITLAHWplt
         OTbw==
X-Forwarded-Encrypted: i=1; AFNElJ++5UxJyh65rkyWm6wJEoSRtuXG1D2rS5aocphqjkDhMk+AgHLT7yb9llmuDbh73/ty01pCVrzTlxo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0419F2DWF4lsenel//5MznJDtJY85WrCOtG6lenrxkd7If/t
	dYyco7+qByitgv5R2ER3DamiRS7d2OWRBpxTRtM0aoRxmSRW07O0I56Z
X-Gm-Gg: Acq92OEhLnQce8UgPJXnDGvLhabNBtQSbQzgSTmr+K6PLEeQPcr0jjLh7kY4OJytBZt
	gxOkPEPjwFxtzVvEtpARCCdPbe+pcfA8+wzFSIKURFrezlxTKo2XQSm4IxNE58fFZ1DJnDb9TX1
	KlVdMUupDHCdMKOpK3bNg6LmU9gw/PYPn6J3gYyGtgvbZxV/sijgLPxTXSY3alG/iN03WNarfUb
	9326cPcXMKXUvNnivq/Og2Qlhm5n6aAwlaTnhZBIMrFua1/9sBNefhUXv6x6hAl9JDMBw3vSqcj
	MKH2zbGMOlwMkfXnHXPiBt60EOhWImqTUaFHBNnj3MxT+0ZpdYt7NTlv9FMB/R70tNUEBHBddyy
	s6hUGCNe3XKeSJvJbWqzQLWNQtrtbdei3t6/0JC1zoRUvly/W8KtYUvJYsgJHhoDxlcHFY6v0Bf
	11/RU/BulDtbd+Squx0J+z5Z5jVbQ74irPzQkHeSk9E8PvElYM4GE=
X-Received: by 2002:a05:620a:6494:b0:914:c38a:4e72 with SMTP id af79cd13be357-9152fe13a9fmr153575385a.50.1780028455830;
        Thu, 28 May 2026 21:20:55 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532480ed6sm55661885a.15.2026.05.28.21.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 21:20:55 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] clk: at91: keep securam node alive while mapping it
Date: Fri, 29 May 2026 00:20:51 -0400
Message-ID: <20260529042051.1626978-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmc_register_ops() gets an owned reference to the
"atmel,sama5d2-securam" node with of_find_compatible_node().  The
success path dropped that reference before passing the node to
of_iomap(), leaving of_iomap() to consume a node pointer after the caller
had released its reference.

Move of_node_put() after of_iomap() so the node remains referenced for
the mapping operation.  The unavailable-node error path already releases
the reference.

Fixes: 4d21be864092 ("clk: at91: pmc: execute suspend/resume only for backup mode")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/clk/at91/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index b618a5e00b00..03a6c31d6aa8 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -180,9 +180,9 @@ static int __init pmc_register_ops(void)
 		of_node_put(np);
 		return -ENODEV;
 	}
-	of_node_put(np);
 
 	at91_pmc_backup_suspend = of_iomap(np, 0);
+	of_node_put(np);
 	if (!at91_pmc_backup_suspend) {
 		pr_warn("%s(): unable to map securam\n", __func__);
 		return -ENOMEM;
-- 
2.43.0

