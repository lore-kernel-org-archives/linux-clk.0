Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC8B390C9E
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 06:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526603; cv=none; b=os1pUEKtDbGdHnKfQLE19rFYm3AA5nT6cYqYNcFFOnxR4XNLOoFDFy7Gpa04oFGP0cfRp8bcKeGwCeTEf1AVsvgI9Cc9wfbRerwuvTPDbld8DJDYD71Qfoy9b9uxnxN8ZR02l4hvyMVk4jrh6k7pRZFStfkXvp5SVTWFKweGsv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526603; c=relaxed/simple;
	bh=RjCrlSCJfIi78Fj/A7WCMyUFRGca/w1QLsrXcqS44bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVex2salLL4Ub85yV67XHiJOXw/bJn6XenLqfxHOrW4Uuv0BAaedEvP/7p6YAd/AjWGkzvey2Zt5xf82jyxxxQ+8ylKwfngHSDsXunbQqd+2+4mg+vxy/8BsZ2/pH+5xRbTctTcIq8s2SkM+xoL3MzkcVDCgdNBbjwl+fIxxzwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aSJx3Pss; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aSJx3Pss"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so31535565e9.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Oct 2026 23:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791526600; x=1792131400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uf13mC8auXckg/x22icKiOE8QWvUnwyH6rsSLIpr82I=;
        b=aSJx3Pss2A5tRg9DsUVm0rcByLgIxCJrqrAM8a5BQLW9yuBBDHHOcWJhedM0M0dxA2
         mjipETxIgbmoHZrXjyeJ/mqIBg9tFT2kLq1XOv4JFbichncCe3fLvBqytWhaLMA1LquI
         JKKBedWjbYlwJ0sHgjkvVJt+/qlUxVfmgfUn/KqmQpYIJBVB9dv5qhdP6Evjaos6uVLp
         UeL2mthWmsztp+gHzRZoBEO+cVfZOjDQCE86yFBU2b80xHcihayfAEfD7h+JuJOX5jED
         3bMVe+u5L4MGMPHuyHf/Y9kaIdWd/oFzkNsed+rxDDN9n2EqTdzHAmmm9LVdUBuh7+m7
         qlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526600; x=1792131400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uf13mC8auXckg/x22icKiOE8QWvUnwyH6rsSLIpr82I=;
        b=tM7rTm+/mJnTemjbsTX2YJsavye2Hezt9ufK3pUmVUIrEgcIjBz1BlgJwji3JqUqLn
         brTtcZM5Au2KR6AA/AfgAq+YPdugf73MDTF+v5tg4+T/1mpsj4g6yAJs7eCkfANrLyHP
         yuzq+ziLln21neNldn24hbw8OMB5kroEAZ3evEz7f6yE+HVBR2IRqycAKYkO8HgJaRTc
         N44KF63qYmY00rBtPmevhXfyGCuBqUwFQnONXvqqUEAZyusCpaA+dc0IwNSIF1esGejJ
         DWNVkRTpjf7Vsk13o+oRCUs03zFmswSdYkRz9TzfsMcAU8MIHx2kVb/v4E+QofNfFrba
         kXyw==
X-Forwarded-Encrypted: i=1; AKwUvBz1QTF/2raRyzZqcIXFJLdVxa2VyIcs/6PQDQUTP4NvhmrDPz+MjhJj8Ky47Aq5zNUoEBMs716X/v0=@vger.kernel.org
X-Gm-Message-State: AFuF++ls0W34Y2OtMDkS5tn2rQyhgj/vWHnyJNXNrbLCI/+1dSRQfJCi
	NeRr+4tFfK8RKITxmfo3q5c3XtOn+ddPFfCgVv3N4oT96/l0/QTm6xTILBMA6yB4YcI=
X-Gm-Gg: AYBFou2YUyjciEyU0AK8AKeT5M1XmViMG6dVG1UQKSGg74Uiocs7DpUWM6sds8YY4C6
	5z2YpQZxWN6MJb9zZbwMFm8hZ51lM2ag6vbkAeeDiJizQSCjgo6J2EDSghTsMqBhxLmaeCWE5TU
	ZmTDrHP+s+x7HGayzPvLunXAVIrCjXGW3WbS2gPLdQ9qQYip6e/V8UlDZaBsrzh9coaWfbz0D0v
	puCsALc3LlsoFQRmRc2gyiqwfDHhhckMn7k3lVJl4GMkW/34Lo66DzJnGbAQ+rVjmORZgfhiZpR
	NENzkNQYBE5xYhKYZdWL3LSMWXt3W1ZjFw2uZuOHgN5WRxLTQz6pH/qp2XI+7FZ47Tv0ZDVdVWu
	AQh21NGRqhQd2FfVg/noWZpqlXVp497b7Ekz4UoN+ZT6kfU2+FNst4bmJKYvf+wLXyzv9QxP8TU
	BSC8oAnHTwxzyYv1FtEYGGOWsBxSq6LgqNyIfZff3yV8M8iafqLA2oOKVbGEzI/zqMhRYc4z2pV
	cMET26uSsy2QrYpYNfyT8wJIPfmkxcoOBLTSOfp6v4=
X-Received: by 2002:a05:600c:64c7:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a18e49c536mr12899995e9.16.1791526599915;
        Thu, 08 Oct 2026 23:16:39 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([82.208.30.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4a3b4asm46622225e9.5.2026.10.08.23.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:16:39 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org
Cc: alexandre.belloni@bootlin.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	conor@kernel.org
Subject: [GIT PULL] Microchip clock updates for v7.4
Date: Fri,  9 Oct 2026 09:16:36 +0300
Message-ID: <20261009061636.30104-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-7.4

for you to fetch changes up to 77cccf570d0de540d5062944f3555cade23b51f7:

  clk: at91: main: Drop unneeded cast in at91_clk_register_main_osc() (2026-10-08 23:30:31 +0300)

----------------------------------------------------------------
Microchip clock updates for v7.4

This update includes:
- a cleanup patch to drop unneeded cast

----------------------------------------------------------------
Geert Uytterhoeven (1):
      clk: at91: main: Drop unneeded cast in at91_clk_register_main_osc()

 drivers/clk/at91/clk-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
