Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940FB351C28
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207078; cv=none; b=Q1J2+8VFi7p7qAiKBeRApvW01kaxvIVTAE1yBh6cgFzuMkbitgWoUxWAqigzFYD/DE+MhU/HNL1Z/oXGh19F5cnoUACwY+jX5dk691aT5jk22RMichPkaCB9TtM6++ER7JIrLOVLRtr5ccDogE3IRe9vWxhYAQefyRM54hE1OPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207078; c=relaxed/simple;
	bh=ioEL6a/MNP5hnz2FBcRKFQK4t3vMvou2digi3PAWQwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sdHns+M2OoT1Po5y7Hu/QO7hkb17Qfwe2vgitUSBiRPTpvkSmlRjFXMbwzng4vU4TEZxUGbMXC3N5nMGKLsWtQouH4RCrw5R8Aeryth4J8QoqtT12pbtSwRmbbOfkWprjqZ/ymXJhtFyueN5uDZhsLoTvqVlOgYKVPlL61tnnag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9oh37ht; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9oh37ht"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf1cda2b17so5600385ad.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 02:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782207077; x=1782811877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3h8QUd25AxJzBzM8TijEcxYosMBFZhDsa0PXbVO34Gk=;
        b=d9oh37ht18CaFDkD0bRERFgamlzsWW1EQyxj7xbsjdJEYONv8EXlHfoWyKWFIcq6lz
         LI0PVuxbVY2RT5hAUrsDL6N+1Fd4I0ZgCL/6irL6P8uthK+XRQCa6lE4hDyM1Ig7vdAk
         xNIk2yTOFAdwfNvE8coyP9IIzBI+vbbMMfHpGwpqkSGzChwcY3orPybQGm8jBGy/EzvL
         nQkb2PFb6imoJ6RBvlzBNgMU2zq3BW656YobUXeuvLouR4dMAkve6ZVja8p3sMWjWJ3D
         TvV5HsufnAcXTIIiEeq2VfDjJak+6dvARCL7kWHWLXrKlryg6gnq+i5gfFWKqe8t0sZ1
         72CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207077; x=1782811877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h8QUd25AxJzBzM8TijEcxYosMBFZhDsa0PXbVO34Gk=;
        b=F1pBmXJy0vDcL/kotxiTMLk5O5wengFgKztI2HhOZ2taYygzLOdoYFb1vpFKyMzrpa
         CpfbeLnHQsFQC4fnEMSD+1JUI9kfVprzGRvEYqEKuBwIrJaQEwAeieRNgpLQ4A6suoOE
         YK5cxIlv1kNJy6tyaoaZCq9yX3/SmcaZ/B44oNFd5V7U4aVC9SjmftGNMCNNZtzHhlU6
         FwxZgqqgY88Q4pU4g4/Nz51nbA2FgrRobRZTXEM7qOvu+YMP0IHoqxcJo1OlSd9BgCid
         5uUPUHZ4qxiAaXnk6V77fEwtG8RrE+avt66+9yKwsKFKNvYDwpGd2TLNdKD6GpegEFPR
         wTEQ==
X-Gm-Message-State: AOJu0Yx8zp3djoBQTv9sqYzCwVl1227vDvu1y58T9dagg48AQQnm8cqt
	zziATmiH2aL6ea7Ny18yS+u5Rc/0AI1EqJNRyqRwOfQScR9aR88tf5s=
X-Gm-Gg: AfdE7cmlar5FQ2HVN03NK9Tv4UtPiHlCPwPjRrmmnSBFNN3xEehJ7rwePUsKRqDv+LK
	WeZRpfDNkR3LNsejugYVSVHxQ8sI705cTjY0CLTgEOotWN6TTw63JNxKc3rVrbq+TV3f667zyWM
	RI+TXnKThAvNP0L56GxVVfETLYqbvXWC0e6GGKNAlozpAMydQATG+m/8IdYLDdJIuBBGPXcZyHl
	hh6ybcAwdkfdmTg/an398oCapQ42FKo7IVQSafl3PSKbjKYnagv97XGg3M4Qf794cetTe+PFHE6
	KYeewvW+yJv72qmJEaluQeTq7PYpVfavG762/U0Py14t5QVc9iMk6WqfcjrGk3H3IdEigPjt/5t
	XsXNxdUTxOZi6GUz+Pn4RIvxGI7glEnhnICxw72S31BDZ2+9Gr/XlC3KwEZDYnO0o2EvZz4vjUu
	MDhDHofgzbnpn4LRV0txoAjiaYOiIhI4HMggkzl0pwRCjkKR53n1Yqsq9TJ5/c6R9y
X-Received: by 2002:a17:902:d547:b0:2c6:6425:b343 with SMTP id d9443c01a7336-2c7c3d6b276mr24713785ad.6.1782207076718;
        Tue, 23 Jun 2026 02:31:16 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436d6c16sm104856865ad.23.2026.06.23.02.31.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 02:31:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] clk: versaclock7: Fix APLL clock leak on probe failure
Date: Tue, 23 Jun 2026 18:29:49 +0900
Message-ID: <20260623093110.78312-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vc7_probe() registers the APLL with clk_register_fixed_rate(), which is
not devm-managed and must be explicitly unregistered on probe failure.

Most later errors already unwind through err_clk, but a failure from
vc7_get_bank_clk() in the output registration loop returned directly.
That skipped clk_unregister_fixed_rate() and leaked the APLL clock.

Route that error through the existing err_clk label so the fixed-rate
clock is released consistently with the other probe failure paths.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 028ef9c96e96 ("Linux 7.0")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
 drivers/clk/clk-versaclock7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index adcc603e32..e3a36dcd98 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1197,7 +1197,7 @@ static int vc7_probe(struct i2c_client *client)
 		if (ret) {
 			dev_err_probe(&client->dev, ret,
 				      "unable to register output %d\n", i);
-			return ret;
+			goto err_clk;
 		}
 
 		switch (bank_src_map.type) {
-- 
2.47.1

