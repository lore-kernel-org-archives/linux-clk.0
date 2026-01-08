Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962684F29BB
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875679; cv=none; b=CfL/SC4w/DG7dfTYvCgNZOym7zVpaoreZlFrchUm7JEuDUzZY4SEcPjhfSWvogdS+pFU85dPEhKClxw7V2pSx2//lrnIuGFXjFLKqSiIAxhbMEA4486Pw9bTKa3/JsCz6vrlbbdKNkXNozv31UIMgJId4CXW9VdcFIeulwDmHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875679; c=relaxed/simple;
	bh=F1x0vYfegBL7n3iJichIb1PGAil9viNpxvOdcjfDOjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liUn3u3eaOrtbqew4zzp+XsWCizmHm1M9HBTmnuE1Jb5Zqf4c4rSpO115hJPWyUIMJlZ82nAmK/vm08pcs/vX7jb522I7prJ2yVwhgAYub1/peeKDwnMBKzuK37MOR5mo46y0BiHrEM/J0NRJNWmzGobZwJSeZZlE77Q5GBNNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBm0FK7n; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBm0FK7n"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso457450966b.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 04:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767875676; x=1768480476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxA3rCi4n4Zd11T4YjtWJ+fLfFPU0EDYmXEJgipwb9E=;
        b=YBm0FK7nhFpRjm14qR7F9a3mNpJpnA8FH8kueIg4n6zYlybC3DCkLmjJCl5xR1o4U/
         lqW/kNaWnsjTuSd04FGdK0RHZMNdnQUj45ixrJXrN7Wp8C+pzoWBwYMc1BLp41YBDziQ
         AZkU1jQPMZYIqAbsauPWENFFBQl6sPKR68cIza7LtNc+sNMFLJvNGnVIEFIF+BMweJm/
         vbyL2a/0mT+MR+e2aShGCzzjovXoWDD4LyvDmG7bWipJ2ewvH4cnzxPsdyu7otkjMij1
         moZSDnXPY0sjILrSQZIHKlN+KQWBjmHaMz9ok9KdgvFP57C3N60PsZH4yAPnnORhI9Le
         D6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875676; x=1768480476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxA3rCi4n4Zd11T4YjtWJ+fLfFPU0EDYmXEJgipwb9E=;
        b=uaUxr9SuT5fbnyyddkjsJrIEtnxW3cjf0wXO7UnCgcfoS0COBDtmI+dA/PyDSg+Qqd
         5y/LOEiP78GQ6IGq/7bhxBlQy2gWNtlVR2Hnvnq9y7goGigSiu1beon/fjX2YxjVdkQ2
         +olP8R7Wt1708zpPbR7HE4Y3C7WNafuB+JORrL8F2bVOoRoqqJcMqv85a+vzj2aCrEk3
         PT6F2eLionq4QgN/H60zLkkSB5eJPViA8G9CY00/jodrbfQpxByhcMhrji6VC+WZVXBj
         ue7yJu490tSqEijGKVDw6woeKSCbxcKHvMrhQqLSunUWKQq7Li5Rezebc5SigkE6ZXdr
         AkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHtPYgPt5cdTBgHuB/OgoVIRaHNSy1gyqxK1cPO6WacBT40TqzfE0k5GMjTH73NINmf11lDAIcLAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPAbXohBFaxmGdDrplIeKSK3GTZnL6TDQLfC3Fh2IBxrjC3ccL
	8E29Y357tqIjDnHG20MokDXnPnkJtHz2vWLHKbZNFYTP5xMFR6ZPTesg
X-Gm-Gg: AY/fxX51Q8SQc4PUP+0JdShHVueq+mZp0/jpPNkTUFJochk23u1mp7dLpiExK9ZUxJy
	GKhX7BA8UdqpHez6ywLqpXHj65DhEJDh8G7P6bFI5Vnkj2nEHdDK2LIOfLF3bsaor75TM5OD70Z
	jsEeUiDXThnLMvLqfIaRjP91068Zcge+MD1HWIqS3eYc/msHkJYkU4BWTs+RFsqTRHAPJhLlFne
	H9vao5ZJPCfmoq8H2MuxzzzzAzbquj2PrY3zXj6ngqB5swFEvg7cla+DFsvbijnj30YuznMhcyT
	94SWhvA/gPePyriwjhEgb3KxDvGDWfXNWnbu7BiuM068pN9rTuvUkIXdsIYtxxUkzeIGLOTY4RT
	N3N9pTs4OkewSdYYGqdEFmJMPqc1znYsx1FYzsjExZjD1PxqWOvnSaJjAmqNKwKjWrVtji6hTSH
	yxbEeqwdNE4c7EsMMmcsLYagBx28ZN/KXNDuk=
X-Google-Smtp-Source: AGHT+IGDYWBzdLP3GPBfT4boWtLi0Nz7sIczo+oyRUwJh3nn+ZhSgyvvzjobNVrE7I2+mIZQNWdOhg==
X-Received: by 2002:a17:906:6a1b:b0:b83:3294:af63 with SMTP id a640c23a62f3a-b8445031bd4mr517614466b.1.1767875675518;
        Thu, 08 Jan 2026 04:34:35 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a172:15fe:21c8:edf5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56db21sm780412166b.71.2026.01.08.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:34:35 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] clk: renesas: rz{g2l,v2h}: Deassert reset on assert timeout
Date: Thu,  8 Jan 2026 12:34:26 +0000
Message-ID: <20260108123433.104464-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Ref:
[1] https://lore.kernel.org/all/b417865397822176e83bca6b9d8094fe92ff2451.camel@pengutronix.de/

v1->v2:
 * Added the variable "mon" and used in readl_poll_timeout_atomic()
   instead of reusing "value".
 * Dropped the assert check in error path and simplified value using xor.
 * Added Rb tag from Geert.

Biju Das (2):
  clk: renesas: rzg2l: Deassert reset on assert timeout
  clk: renesas: rzv2h: Deassert reset on assert timeout

 drivers/clk/renesas/rzg2l-cpg.c | 9 +++++----
 drivers/clk/renesas/rzv2h-cpg.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.43.0

