Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E763F3273
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616914; cv=none; b=TCd/fxFPsaBY1OMMNL6e8/eq54nvauNvnt26SKUBR/auPjszxqF9T6z2OUgkRLELIICbR/EatR77i/H4h6UJrIcFtX/sO6TlfftUQyNCfNHaVjrSQoPBSQhcsGk+qny1IY7WKLKTp4FdoNpATcf9xGfr5487q+Uy2GgWO1TLYB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616914; c=relaxed/simple;
	bh=EizzPFcHBTIh2Y7GKphJQqpoh7RMlGuXmOyHqJPayZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6jcp/gOtOjLy91N2gLlN1+WZRyBcj92zB6d2WoydZCUmEVVgPCyN7vgxam8TFJgrguUYQgYYjKO3/7ktlGEozatogOKddyNHUM117ZpoWw4w2dX1pi1zlJN/Nhq5aqESlvTGQVl80xwr9h3EDIDDjQ1JpRlpRyIID9iL86Ydfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAWHDYpH; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAWHDYpH"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-783047c8464so1562191137.0
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616889; x=1789221689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=ZAWHDYpHOMJ2pb1rznJGqWziVaas9dmvZpinpC8dpdVqj28oQXoc8EcWh4t0vpBJzr
         OfhyVTe5DH/gmR5zTbIvGvTij3vy5znr4MnvveqiDbMkf1FnVpTTGTs6pPzlKhmqp3sz
         3YkwoIj1bZPG4c5xVmHJvjO423C0j8ygBV7y8w96COK+Mrg6bjL66EJZ8f6zhaipTXCA
         shq6D7fnizDyjnuKBYcpdih1sLm8oHZjgJYRBxZorjypAjnKdQNVQabQdDtTPlev5008
         KLDjEmNRmj3wxviz0WV5c0/pYxoL+Vd+BAWA+ZhPGQWWDpR2WZGmObxm4RgatpKhkaDT
         jmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616889; x=1789221689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=jDD5IvxE9bt6Vb0BjAuF5Gq23wy3+h9aVQ0hf7Isim++tRa1hKFcp+Kh9QksYGjwuH
         dfArUuvS9VrDSlks3pxpSzXxfbIpLmAiMbiMTaW4ijxr7fHQn7TdZV0NHCiUhmb1cOAu
         vzC7CX3PiHxCuopJbcuOnuEl87LyuZm4HLW/R6r7X6bDdYwo4uoHy5LujjoX2EO8SM9A
         hRTS007yzlFbL7h3lWfSGJT1XkqS6nh2DxKKDhxUfwwhmbdq9NqfHI13SbYdYHZQ7w0w
         KAhyIirqO9MoXoxCdAxtLz1Edb3QbSqsjkOr2uCWph+8bAP8BVgcOPuPjGhn/wF/TLPa
         4nJA==
X-Forwarded-Encrypted: i=1; AKwUvBy6Uzoyt6ErZOu2F2p/llzMSYVmvMlFj/PnUHDlbjIKweqE7kD5A/5FCWN9y2hloV0cNOgh4ryiLe4=@vger.kernel.org
X-Gm-Message-State: AFuF++ni+FA54lpOghQUH4gcbn8qiutsVGH1+LN9HUWtfp1A7ytkaGW1
	bAUuR0IgdKIx1aqedg+kIOz6q3p28OfRliIKU94yW44ybLElCGalsQ4CDVEp1ptr
X-Gm-Gg: AYBFou23mwHwBs4YSvfbpWGto3RI+9g6Vp/RRN3FwCwAxbEjvKM8aIx6ppfo6eGibcB
	Nk5gTBws39HUI3xycHwo3DF/mzEgQHFpKj7rWxaUSMqdcXtVywfy+r66TnzZvFFCmY292XmKYrq
	4EY3GE2RrfSpNhiMjFXuToFPXQa8pVNBM+I4A3nlo/EX72cQ7XAG3ubbRmSfUrRW5LEkxqnDGtc
	c1hpGaOWv6KXn6OZ1rw8uaf95fJd4QFyChJV4Tj6PYsGtPMSniQGy+7ANsn2nLHWMAX/1u6B1PN
	SN0//QqtROGPBewu1tjJmHocDgs07QbzsTZ66qLmivzxwQeM/tQTiI1PwIhfE1WmgiipijG9A1X
	wDX2f6hacRpSuzTBXGmrivoeBzvW0aZ+gir7fnc5OOSeCuY9EqwUab5Bg8BwQA14XLniTWixf9G
	Hz/EttxW68pRHctWeDDnK64lkjGr2dvKIwt7Bk4zhu2pE79oNcBsXMGG3A59SXYJ6f3VGzDyOXh
	X8CFZZLLgQ1/btA+Rok4aM3iT66VV27
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a4a90fdd3mr5362480137.2.1788616888537;
        Sat, 05 Sep 2026 07:01:28 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:26 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 11:01:12 -0300
Message-ID: <20260905140113.21638-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905140113.21638-1-breno3011alves@gmail.com>
References: <20260905140113.21638-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..3a0db1be6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316) += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

