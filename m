Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6886341
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133077; cv=none; b=TXSQpcLMZL4Q4nF2ECKO6jWYy1ZOFv8wn380MmET8yfpb9lCGZlfSJitNWpvi2LQyZ7oa5ejBHhV4zgQGCaDMOTNXLpBGQYTPb1vWHm+U//gd6a+SHLqq8egIDoBTF2mjL8Wjcttu7MjfV8t1lKhgjZSfJ2q4HwXHROaVdb4jFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133077; c=relaxed/simple;
	bh=XcqnFlVFb+q5pUp+ILYhKu8XvgoxFm9HCTOCAqQXxGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ajg45gIwF0Kvim6xw1s+cuU8DCVi2NMEAbsSLjpeOaAqAu4sVSLMaAT1rD0/0s3l/kllE01w7KBI1mplbi/JJwHrs6B/YI+7h3svvUOrNCqKyoXEFIXZBQkqNlZH2cFQaBGSPQ/932geRFV/PnkZyWkc/XLwxZEquESSS4hT6rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWV3F//Y; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWV3F//Y"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40427db1300so3580559fac.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770133075; x=1770737875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtQMwL+gjxGfGoTNzWyOYhGjyrQbkqCiIsEn6qxeGvQ=;
        b=jWV3F//Yyl7Ldu35vPSi5c1EIRZIRHvmbuJK00lRYo8mzsI021k0XUv/t1sYOTK7gR
         ElPD00ZVBF4PkdtxNbf7TaWlvsC4CRl/8Iv767i3QDcFUIqAQEFofuUl73YW9S8YMj8C
         csQzjIjYsTr/Y4ZOUb1txZ5Ym7G99tEgquMzphxnPt3PjGvsMhnYsnfH2UCGd0DoFe6v
         GjDlPNiFUoINKOJxOVmmbI19tNo4TukuVrCLjfMgv7RNG/AziNQBgqtc0hjQcO7i8N7/
         tYZyIvhNxp9Y7wsRNe4lDdGHt0jXmg1OyYWexsRBbtGuX82OfsbH3KFTZZv3xIpls/KH
         t0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133075; x=1770737875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtQMwL+gjxGfGoTNzWyOYhGjyrQbkqCiIsEn6qxeGvQ=;
        b=Pe/hJV+/ZAtmPDlyvzap6NeXGyxJj9Lku0L3dkx2B27FKqaa9gvy9RZIOoQ/y7ALlN
         HajTm4RzkmfDuuRhG8HFy0Z2DWxPvQozd5oecKIwuB5cgXVZ7YX2da8oNjE6zaLQvjyu
         640XRPu5yQciqlQZWcMrxlBwOIBukAYdcLU3K+FGWa0yhU8mwQHP4f7UDoeK96kIWjjO
         MIpvpLNy7GDNlduXr07r23bir4McQkPRvyd+F3a4+EKIr2bQB/IjGLJv4GhuoJLIyw/D
         AB8i0G9UnIq2Ao9tOpucvdz1xygVC8zXE+UGiTidDMs4qcIH/k9gUyh88Ic6B4CbyEig
         7d1A==
X-Gm-Message-State: AOJu0YxDy87lIdo+xCWbk5tJHVi44evfM970egiFLJNU1Lgpo1LI4Xp2
	yW0cPfnHx2EkFRWj4t3ssvsMdwPImA1maqPeBrSBBEKuQ6VxhUhQ08KVBRDkNMCM
X-Gm-Gg: AZuq6aLZOOnqTr5nWlJzbKrdhZ0oZnq40Q7qqS96XxghTJO6uoJbul+JU+niRlQMeWo
	XsZsuxVXwv7JbcSNQlf6tknuOIMl8QEzglfG8FWi2Udz/6nV6QaF533m9oybkCUid0cXWqYnl8D
	Q7+l9GR2Le4VfPYdbYjFRtZB6yufnkTo0V1zxxGTwH+zQjJmnk5+bOQz1Nmyk9jTUYpkqBsUNmf
	TNvFQot6kKbyiJdNG9cZ4mRsUhlfztsh/f7KdLovk2Muh893aTqXE9NNBIL/z62bS6jjFaCxuUL
	jc5xvHftXIxa0mvXYa9zGWB6t5FRmDcWPlLYirPgsjJzQf3+52XEXedi8qZW/Heka5vRy9tt/+i
	FC3CdRuZ9A25g4xMkemlyov4uM3D4NgabOZTRLlg/9uLT50aNHPQrprQvwLnk3QwaXsJiNu93Jp
	K4rr/gVuwQoHRicemWEgXECKMAvA==
X-Received: by 2002:a17:902:d2c5:b0:2a9:410:23f6 with SMTP id d9443c01a7336-2a9041026f0mr92040735ad.41.1770127689433;
        Tue, 03 Feb 2026 06:08:09 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:08 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v3 0/2] clk: imx: imx6q: Fix device node reference leaks
Date: Tue, 03 Feb 2026 22:07:56 +0800
Message-Id: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwBgmkC/22MOw6DMBAFr4K2zka2+VPlHlEKYxtYBXBiRxYR4
 u4xVBQp5+nNrOCNI+OhSVZwJpAnO0dILwmoQc69QdKRQTBRMJ4yVOMTaVqKN9Yqa6sqzTslCoj
 /lzMdLUfr/og8kP9Y9z3Sge/rv0rgyFF0MtMy17Kt8ls/SRqvyk6wV4I4m/xsCmRYsqzkWqu6N
 uxsbtv2A/dBS6rcAAAA
X-Change-ID: 20260130-clk-imx6q-9c4b8835fc26
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=776;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XcqnFlVFb+q5pUp+ILYhKu8XvgoxFm9HCTOCAqQXxGs=;
 b=9FwXxjEanYN+X2SsRmYYg5nYD3FjoF7puIvCUqknvObRBF9hSGgd5rmBb+yfTfG4X77VFQCXa
 zUXyP8e/jRKAvZ/07IQQn4uKCxHEPJrH5u1qmIMtlPHyQ2Mph+MdV9L
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v3:
- Fix Frank's comment
- Link to v2: https://lore.kernel.org/r/20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com

Changes in v2:
- Fix device node reference leak in of_assigned_ldb_sels()
- Link to v1: https://lore.kernel.org/r/20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com

---
Felix Gu (2):
      clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()

 drivers/clk/imx/clk-imx6q.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

