Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215566;
	b=J1RBhbX1r11pcSygf77rRdpgQtL8oSoOCO62/rGNEFgenL8L6OUIJbPQjpUsCuxofjxv
	 fWR+G9vcfREaQg+Ieb6KyoC/pgvYycgn0TOosrJFqAjyLt9lG7bwG/BVzvH0iQ1ZV3W9v
	 9VqzkfVTpctS7oG09jZ6Hiwlk+09vaht4GBfhl74sQ/G1u8eK/iu+8pVjr583TCtbZwN8
	 EWrMxCK3+3U13mx3tCX4QygHPDA52zMTMEU6pCYdFoH1tsQNswLE6lew3+EmRx4bPGgkJ
	 vkxfz5ZPxguATGabNYjZzGTsL62O2n7Bf1bNJnrTrcSrPUCaRL0YG73BKvP4coXaKCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fF1B59mCp0PYq608fjNaIBHCrz+N3kLf8xoOEG6ctmc=;
	b=BKSNFe3pOjWutk/+vXCPWgBSwXxdq2XmlTiEMc6ufKmHUk6caIUj5zfQdKVjOurbGRZ/
	 CUuPXDnn+/pOezbK2g+M70Eu4Zc65CGzj8ryPgvsxM5F4lAMLNGNAcoLdYwq/tYq2kDO/
	 YROu8O2n4SZiGB28KnZxNJzJ26LLozBbty86lOSvp35lCi438h5krE6bElkhj8+GmRpAg
	 1qsl2v382US3fEUDsnwcW7g1XCo3l/O4Kn5Nw3p3cC17eSShKX2SV9hMLNGGU9zbWVpO5
	 +a7oUkgPzRrzqbE4gApHnHF3ndDNk8Hpt9Y6smIwE1+tvvqTWDCwLMm0xTtTMXqXzUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gf7WgDe5;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C7F606A687
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 22:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C7F606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gf7WgDe5
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so11238625e9.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 14:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795215560; x=1795820360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fF1B59mCp0PYq608fjNaIBHCrz+N3kLf8xoOEG6ctmc=;
        b=Gf7WgDe5jkX6FQg+HrF/VZBjigqcPWKyGv0xb3FDtcma7UePAi80MsHXQEb3MU5bZP
         ah6N5EE6BXfvTtuckrD8/QRqWRMPLMDwIiG1V4it6a2ygEJrC0l2HBUR3Y3RSjTVMgkD
         iuFF/bgNnqEdGFSPUnsVsLtfCaeIkGJXstE5wbIXBiJWQisV5cRnGhmwppE8FeN01RYG
         Lh4Heaw4l02sp5ou7pOizU520fZUOsdBzdOyRlZL4UV13x7hchXhVHnM0R1t+wTRqDvB
         t6APcpNEkqYsXXpXtivDNE6vyfnGHSy+/0usP5IwTaeTfPOSFzlUirrEL2bvLfJil34T
         0uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795215560; x=1795820360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fF1B59mCp0PYq608fjNaIBHCrz+N3kLf8xoOEG6ctmc=;
        b=Q4teO9hr9i1rX69aHn++GgPive8vLOoO7pPhqXdru7S7OYrZCXS3DYb+c6I+LNX6H5
         UCW/0KeJpTcrmSzkips6lcnqz9zrOIJhsYRFVPix6V9m6BSFYNl2Mueg4PPGqJvlr2kQ
         FNQOfBrjWFsJO93XxLsPQ17o/UkQ6xTASI2T6QPJ7TSyhv5s5J3FI5h5IYUZhp7kqGdH
         2zIu04oh7zNmJoU2/cEzE83thNCO+HIJ0T5BI3Bj/P+peAf0wJwtun1MkpbeaWdId5Cj
         6tutpfD59e6Qk0wF9pRbwyVl7LdkoAtS+g9SuhBc5yLLAV6tFoNi90ueV27m7OYGms2u
         1amg==
X-Forwarded-Encrypted: i=1; AL+hErGZxMsXjUMQx5YXjn5igcAdRbSe2BkKSh6GTvMRZDaMAONh3XCb4QcHuf3qeEYSSfvclByiDcggPV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wHVbOa1stPhrtcLrcUymsPbRp65tnDhqiVgy/bwQxb57cW4Pk
	idFMnXiX9I6qRluwxmdvqcNt96pJH/WN26zferejSfE7KdVcaoS+DJX9
X-Gm-Gg: AYBFou1ih+q1dycemOUXfC7HMMe50UDc/Vne3rckyzGKzRkJMRAZu3NZbVwVAg4Dymu
	AEDuNk9w4AeMSl/1XK5oRV/WqYLT15WM2hyir9VLxOoIkdDZXW9WafdydJ4/hPOD8sb1l7Ahkfi
	AYTSsxnmYu1nmrgV316/ftz8YW+T/O39u39uVFrXmOt7eG0ZNB0x6jJjc6k+z7E0TQ1NDlGvZlQ
	SoChIazJ7Q7J5htkfgGZiIOG4nK8UOTKJsgKjaJqJo0+yjplSCmQBiwIpeQry09Y45IDPVDNK0m
	frm6ytA+PvuVrw9nw2ZhJ93tZn1h/OaiBv2wgAephB0E6l4DnKv/hjtbvz6W2ExUQ6tBAKwbYXh
	5mj1aDV7ADihcJUKgyTxd8Qhz0+BQvKOguD69geo7loCw1vv7jGuzy1Hv85rzRGBhVnTX6KcnmP
	tCVEkIq/uvHQC0jIWL1YbQBwJPBSVcDLq0qVpcSj+SiRjCoyYhfPMhUxiQewhJc3/FFjcFcmyCn
	Niy0A1c55dkVrkGizIDehtqFjafX1DYJd043/99SxodWJmD7qj79Ltd02VXoKijd4FHhbrqK799
	dDP1XXHjWDUOiYf/Qtn0ZuccjBcI6/hH6XnFeRSoV/TfE98OQgvkbciH4+YV+4Qi3y1lh9hpem+
	Quv/XvUCiwwnh+2U6iqzg92WTCrq7iRwX/cw2YEZ0D15NdZv086yr
X-Received: by 2002:a05:600c:1d0a:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb8880ef6amr109412755e9.14.1795215559533;
        Fri, 20 Nov 2026 14:59:19 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm125915915e9.15.2026.11.20.14.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:59:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Fri, 20 Nov 2026 23:59:13 +0100
Message-ID: <20261120225916.158641-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v7:
- Address some formal improvement from Brain
- Back again to register clock returning error
- Actually round rate on determine rate

Changes v6:
- Rework to use div_table entirely
- Switch determine_rate to calculate best rate

Changes v5:
- Handle requesting 0 rate

Changes v4:
- Fix regression where base_bits is 0
- Handle divider_get_val returning -EINVAL

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 426 +++++++++++++++++++++++++++++++++------
 1 file changed, 368 insertions(+), 58 deletions(-)

-- 
2.55.0

