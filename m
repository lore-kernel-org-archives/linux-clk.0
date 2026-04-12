Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC71264A86
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998540; cv=none; b=oEAbty8gqnkNbRgGPeBzp0rDiqwJJYXuDPCr1bh4VTgy1f1ELdWfyBa8krOEtkPGM/4lX0TquWpDqB4q12JqLDwiowos808h4JibRV3Qr/XvUsUHMM6pQCzxnnbh4xTu8ztM0UOs6l1JdhiZjMkVmb1WJ7HbKJOPCTmx4vYdAGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998540; c=relaxed/simple;
	bh=YdktwupOCGYDsXBTCp/6UncgNDvXr/nreRmag7N1hVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGRo11VKxbyirp7XOu9p2V8c+gATD45ONWo8wcenvRnBhUDb3/5OlhomwlO6GJjKPYCW5dEE4n6ImQtaENmnjqxpRTV2xmrMojmhg0TeWfnIEpTxKmNkzvKaToANOEJZksUOzQ6Vp4Gixlx0mOmqkpOW3bL9avJ+zfzEJhJxYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVcqOo8J; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVcqOo8J"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2296461a91.3
        for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775998538; x=1776603338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxOe3LAamwoRd6++BiNK2MTql5chiY2Vdpn2Z4OwuWg=;
        b=bVcqOo8Jvoe1L6QXbziWmAhyWrgPxr9lofUOovJZ14okenwZV2HnMHI9rE6IidT/sZ
         eIyfhxKw7LZeSDrTcD5lNQa2M+7ietcMLu8rk2kpe/dXz38lWuvRPb2rXwM6WSinCS3n
         X9Ghg8oBlW+WzX3cQVtcMrXs8d2oriYceTQk9LSuQCxLalN3bhMkUBLcjhLRaiyFt0wn
         5RVpeDyfZAbE2qrkvM1QfpHV0hUOyqaSQfz2xL0jg+fLY+K5I1azMpqLbgbK/EAzBIPT
         rQKsSMFXL2e5buL8JxZ3aBlNwftpypvdmB0r47tIZ++YjWxsHxTbc2IomQJdjLhD7n8z
         OA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775998538; x=1776603338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxOe3LAamwoRd6++BiNK2MTql5chiY2Vdpn2Z4OwuWg=;
        b=fOJOxjssXmNayKmk5rb4phOKd/Chc6zs8Vgqu7oHh8HwZi3zhuNUJegeI6/pAyVwoF
         PX7e6Z3bwtaEiTSJ9OmmWQ3AokHOFJ0yXINCfFz7ofpZvxzgruNTvzhknKteWkt7CFxp
         wbICRKQqhKGKVyDXb1HvdP92ZEnhV5DCxM7CXjnbyfjDYlpNhMhGm7JOBY0TZpXnt5pA
         aHds0ejnVP4cQUgqommKjrwaSwHpRhGUJEoT/Dd1K2iqbiHmEhiL7e0yCzwFZ6WLyF7X
         2NBn5uPyI9yW1V5ULQ2T1xN09RbYoCdQdbyeyrK3E8UUSLSSq5nmXmTAVy3tMt8i9HKl
         91JQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UHQydVGPQFaJiswYVFQvHDjmPu4lrYMrjj5Ajof95mNyVQ8DJVPDtkwfMDGi8+/Thc83Yf+pk1Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDyXBTccCw+dyi1zXGaC0paMIPlsjzjEubMJ1o0Ltl8yPiYwnb
	uOg1X+R/hGzkyVPyB30dNsB2CaHysWEBFqOWZrGsLiaQ4lbQK3UHXbsP
X-Gm-Gg: AeBDieuJuu2kzXIZNceqWMd6od6nFu+1TMuXBTY56lpqS8yrQBEAQsHbPfPmcZonvmQ
	HBqE66lFhv4BaQsFw+NzSR9KESkWQcHOesy9weqqH5N62W/wScUtCNrK4Z4CbCTssW8zTGZs0vT
	LiJzDQy+mfagR+//fDSAxSqau4q5fn7JYICOPM4lP0E2ox9e0iNN5VEpLIxLHGh1WN1vErJMJws
	HTnCtvEqhEzm00VFj792SICOEl39H8eXkY6hEg70/12DlSbAOIrwQeeEzShNLUTQwaAUPAuDNE4
	SeZQ+9gu98dRWc2lADOzkewIaXIsvnbJeLdsYtlWlKmry3/9EVSqUJ0nBVKswDicnWS/ev1My3p
	OMyFfiWuszNdBgCRDvnbWYiWSpi1pI0K3iwEhnWLB6hffEA4JdaPxcxe4j2aSsNqITnUdoZQ8Ss
	Q6GkQEEHw7kzTmTg==
X-Received: by 2002:a17:90a:1089:b0:35f:b1ad:fdfc with SMTP id 98e67ed59e1d1-35fb1ae003fmr1164183a91.27.1775998538284;
        Sun, 12 Apr 2026 05:55:38 -0700 (PDT)
Received: from lgs.. ([101.32.189.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fb1ed394csm1481298a91.11.2026.04.12.05.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 05:55:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: starfive: jh7110: fix memory leak in jh7110_reset_controller_register() error path
Date: Sun, 12 Apr 2026 20:54:50 +0800
Message-ID: <20260412125450.2509092-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jh7110_reset_controller_register() allocates a jh71x0_reset_adev with
kzalloc() before calling auxiliary_device_init().

When auxiliary_device_init() returns an error, the function exits
without freeing rdev. Since the release callback is only expected to
handle cleanup after successful initialization, rdev should be freed
explicitly in this path.

Add the missing kfree(rdev) before returning from the
auxiliary_device_init() error path.

Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 52833d4241c5..55cd0ccbdb84 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 	adev->id = adev_id;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		kfree(rdev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
-- 
2.43.0

