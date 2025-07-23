Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43582287246
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267149; cv=none; b=lIhBn+csRt1H0+2+/prN4JkSsjuavTNkiFgk8Z+P+OQ5emrNEP9Q3i1kKBj+jvlVt68glUH/3TT3JUzAWCLk5qQjnRca87PwcR4z1kENlEPdFgHelXqNreBsdkevjWd/2MNbEKRQwDRKC2WHLt+Gb5q3dU2mE/oKTp39/DmysV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267149; c=relaxed/simple;
	bh=9WicMZ0FvlfVMTRmnsa6r0HX0R3VrCim8HjIAXHgfK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lGvqmcfJQm0NiXyxaQOaqyfjEzHEHGpZHbsdIwyVmT85Q/Xh0ONDYrBhJSwGnN6wo92dbGufnBRgDOUgNf2p3BVsZBVKKh+7v5eno1gh31np5W09ECMOLIbKNBtDyznt3yECLxI3LxTVelxnG+Ne8aFsqTxHcz2Dn5aJnJK0f00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aKxY8/rj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aKxY8/rj"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so10641531a12.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753267145; x=1753871945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J5iTEuPm8PXvAv97xyJNqssuf7uJW8wkgDFwGB5kF8I=;
        b=aKxY8/rjtR8+8K5D4WzWCfjKebpwL0U4ecg9FzszL1UADlRQubUbJfOGXmRq+Ioswh
         kxG5gPOvr8MK/A1NNZ+UZWmm7HQEpMk89rJXOkFj6GwK4ShRv5Ltl1ZwEA5yctwBbAgk
         KXhEiFb57A+AET3W20oUn8ifNeczmNJYSTc0CMGWpv1FLp0cvsGeBwAtx40SV0BLWxdJ
         m+LNsKz/v+GurNWg1Ei1qaRDwFvYKZ8giyZ5NagbQ0M5NbWKRKqxqedmlz2YUM2QjCl3
         S2iSipu6CBaH5Xd3qq+wkDLlWAXUtH9v+DHJyiicyzD1nYMFBIBqCnFlMo7SVLZag9II
         Tc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267145; x=1753871945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5iTEuPm8PXvAv97xyJNqssuf7uJW8wkgDFwGB5kF8I=;
        b=SNJCce7JUKpfp18BgK3x4pmZ2dh88kiKe1lpLcaRz01824Y/TIBQuCAWxlUIRjaU6J
         qmVZXC5wu9MvnX4LuxGwSw8FldVbGadIz+62FUfVlWtKLZwJEcxlTGcgL0LsyeZK/9rN
         IEEqJ4qbsi34uLoAcRQYA5dKwRl6WQZrnlxWG0+mdbg+nIj3i3YWT/3regbDr/iA1bts
         nacZjaC07DP8GpLYclGLag657sVMdgOpGkfB/X/EXAoxZvQgOdduT7WfvRo/QM0SoShe
         rpYw43CZzDuuAvJ5/sSkCQ25d4UmblcQXRhFgvRocFpeCXI5lDsU+4O2ED78rFukdZEU
         P/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWleWY1mHgHM3qPNh2+yJdM2aPaRJxQLMdh6R+OW8ju02eU9uAczBnUQPbe6dud8OEFI8uYSfGzZpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYuyZcAI3zOMFIWut1gH1Fc1y3+r3IDv6q9fvAjP3Psg2hytM
	1EbQ/rIQi+/VgoCMBph/a8V70SIb6qkyfop+zXc1HT2X2rKm+HIJPe4xR4P95e1M7r8=
X-Gm-Gg: ASbGncs+UCdobFi9+7Emp1OKVsybG26rTPgefHjFeYC643lgM6zTx2cPiDKrked6c2/
	delyr94MMchWmzawvxIzuO4jeSwnSdFBjBh+rZf+BWPMJ80vdtc3EtjpxuUD64HF1Yo9G7EucKC
	ZBCcSkHNhZ6KFmXP/iY5RWHIZEx2SdJZ3HEbM8IWj4bPKNp0EBR454uNwyrQZSdSUBuf6+zi4yh
	fIAsP+INVj355hDSkr+bZ60gHrf/l6qWQ7gBQ5UFw1ShWXsXvPBZt/18E4SUWRSFTvjpWOhojUK
	AvzD74UvMBb5KQFL1S9//TGWncvmBF7Jqbed9kUcoIPOk3h3qz7d6fACkYA//dea0FvWuvOkU9B
	q2NnwcbBbW/Hdl45fS8143UI0ioduXHE=
X-Google-Smtp-Source: AGHT+IE9kD3d46UGakbV9lDnsOWGYgjtTl2vVJnO3SnTKV+RHc/bdrYKZCM4+1r0ZRNOsbXZk/HelA==
X-Received: by 2002:a05:6402:5244:b0:607:f558:e328 with SMTP id 4fb4d7f45d1cf-6149b40d059mr2124453a12.5.1753267145272;
        Wed, 23 Jul 2025 03:39:05 -0700 (PDT)
Received: from hackbox.lan ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f5cf4esm8150799a12.32.2025.07.23.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 03:39:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.17
Date: Wed, 23 Jul 2025 13:38:44 +0300
Message-Id: <20250723103844.1641282-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.17

for you to fetch changes up to c78865241ecffaff7ce5db00ed5b71c1a70c0ff1:

  MAINTAINERS: Update i.MX Clock Entry (2025-07-21 10:33:57 +0300)

----------------------------------------------------------------
i.MX clock changes for 6.17

- Document bindings for i.MX94 LVDS/Display CSR
- Fix synchronous abort in i.MX95 BLK CTL driver
- Rename LVDS and displaymix CSR BLK needed for supporting i.MX943
- Add i.MX94 LVDS/Display CSR clock to the i.MX95 BLK CTL
- Update MAINTAINERS entry to include both nxp,imx* and fsl,imx*

----------------------------------------------------------------
Laurentiu Palcu (1):
      clk: imx95-blk-ctl: Fix synchronous abort

Peng Fan (3):
      dt-bindings: clock: Add support for i.MX94 LVDS/DISPLAY CSR
      clk: imx95-blk-ctl: Add clock for i.MX94 LVDS/Display CSR
      MAINTAINERS: Update i.MX Clock Entry

Sandor Yu (1):
      clk: imx95-blk-ctl: Rename lvds and displaymix csr blk

Xiaolei Wang (1):
      clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_dev_data

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  2 +
 MAINTAINERS                                        |  4 +-
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 95 +++++++++++++++++-----
 include/dt-bindings/clock/nxp,imx94-clock.h        | 13 +++
 4 files changed, 91 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/clock/nxp,imx94-clock.h
