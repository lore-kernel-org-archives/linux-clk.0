Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6429934320D
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761141109; cv=none; b=XpPiLp4/jkuxSUDCgyufdtWjXLwV/QYr96iXhhHXHfqJVF/F+LANiyl4es+2WfRsYW44nV5eWMSkS1NF2pFfKJ0b8ExZhVXeaPlvYBmommwAYrohFfkkF1t7eTtosNcye+KrWWkXEEE0/zuE3BJRrcM+ZeuHNPy/ZiXFGZT81MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761141109; c=relaxed/simple;
	bh=U74wioQnuceda/q2sXRx79FU1EiFVj6GAjFp3nVj0E0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RXxHMtfbJmxGENk27vUytd+Iy9UaEX8PaQ6GcQsE0QZCoqiufsC6McvS/ZajJEIvXAraTl+9CrMjmGVrbTHYtGB9XzIL3D3EUEUWPdImatfg1CoqAMBzakheULjLfXtvJDqaADVjJk3IRkdg2DQSLMLdL1KIB63z9P8OrQxlVgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tvNmJjLb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tvNmJjLb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4711f156326so54487495e9.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761141102; x=1761745902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EORvstfENo4plQ/h9GLmP9GLzzW3c5B2lznPYlyShI0=;
        b=tvNmJjLbBZ2+JlQmR48Fl/0BTNMmp6PIVUaaITrvF9rfyjsk+zC9qWXZ3qD5AWvqop
         6D1imaZuaoAMJoKiF43wF3PqtVOxDzd1ZdTTmHfBOsDOEyUQXQRVhCHqvplG8mPvIBJ1
         yg2qGZhh53u9m2jiR/GRDe6xMbEx8scZdzEYJoHIhv+74odaoRt7mmhmOGLYkFMlbQ9m
         zyXrM7xUqVrSoSXXu10x1I7OZgvowhNFhwxNmV75VtGFUlQHeE4bhC+TKcNL50SjIDp7
         P0ED39C0aPD5319YMZPzpQ1gNlrzky9R7T7hEGxiVg6g10OJzSW8FcKkosjkYWVX0Qrn
         U4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141102; x=1761745902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EORvstfENo4plQ/h9GLmP9GLzzW3c5B2lznPYlyShI0=;
        b=FQXUottgUedjYdViG0su2A73DcSLfOUfuZlzv+V4krGMbN3cuwLGcBty8pITpQgYK1
         QvqCyxyBVBYNk7ovvplgmAFvaw3Rq+oSXI3s+SiHSAhLzyvAl/EiAhA2MDUwXt/REJvC
         y1ZbKxclHIobVI4BTifpzcrQDxlh+K4QrnDfKXM5TEtLftkmn3Tk85KIL2X5J5sWtA5N
         bTgTXyBqLjb8wzUx+dwQCUk9MOJvOie+icHjQm2eMoANzxT4EVwb9FG0Baxc23QFFXHt
         Kc+EqHjcL6CZNTuEaNKJh9JkJVfOVjGLUXi1WmvT3JvbMtg6205qCP9tbunjeIhrrEQG
         /8eQ==
X-Gm-Message-State: AOJu0YztTm/R9+dNrTsIaF2lx6paJdBv6jbVZu1AajvnOF9ttetNbgYH
	zm5GbP3aOvXdqANQufesUmrHx1C/cqod08KxlKItSFECQqheII/84xpJ1sKq8ZZTDlrU3WrZqbB
	H4HB+1EcmoQ==
X-Gm-Gg: ASbGnctAWGKhKePAzN03TqhxeOB8G0VsLj1Fcm1hH7SKJ2UKhRqA+hR3LMizWbone6K
	q9PaxjZ/reL2vWeUnyy2AglesHFCEL+Ttl6RXocP1J5JI0FV2gUsQZtQIBzGaoPanfLSS9KihzY
	HyoJcpjAeSv4ccMKogfwHJMFpT/jxAkVl6Hlk4fhx32ffaQn6vQBWZxTm3oPAdkaZSTKUvFRKp7
	nZ/xjxth9+NIEmq5YBJiDI0kcU7tXwqSLtemluju8x7fzNDN/aW7JINsCXOIron7JRpLk3mRu0W
	R1eBDYv/I84o/kknVeOt9nRBOlk9Ngl3todX4WxpGUb30KMZbHn1ci4DETWaLprzz0lhGvdlLdD
	Q6TIyWNMtyK8Lcyjxc4V29ZytGBcRqW+Ev4x9DG6ytXD+N5r80OL0pfpaktEVazylAsIKZg==
X-Google-Smtp-Source: AGHT+IHgKrkNbpQTEKm9A6howyV8sS439Mh/bF1HfCO6EObvZ7XnGkbmh43ZP5i1Er51qjnFckLAxg==
X-Received: by 2002:a05:600c:4710:b0:471:115e:9605 with SMTP id 5b1f17b1804b1-4711791fc13mr149827175e9.35.1761141102312;
        Wed, 22 Oct 2025 06:51:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496c2c9dasm38474625e9.4.2025.10.22.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:51:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] reset: remove last remaining user of the legacy
 lookup and drop unused code
Date: Wed, 22 Oct 2025 15:51:30 +0200
Message-Id: <20251022-da850-reset-lookup-v2-0-c80f03831f63@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLh+GgC/32NQQ6CMBBFr0Jm7Zi2BLGuuIdhUekAEwklUyQa0
 rtbOYDL95L//g6RhCnCrdhBaOPIYc5gTgV0o5sHQvaZwShTaaVr9O5aKRSKtOIUwvO1IHWurL3
 xtbcPyMNFqOf3Eb23mUeOa5DP8bHpn/2b2zQqLC/Glco62yvbTDw7CecgA7QppS8eb6MvtQAAA
 A==
X-Change-ID: 20251017-da850-reset-lookup-eca37d2d7d9b
To: David Lechner <david@lechnology.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=U74wioQnuceda/q2sXRx79FU1EiFVj6GAjFp3nVj0E0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+OFjMB8dfknrX7tjnUQViDL236Lb5paODHeCM
 O3TzhGtOsSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjhYwAKCRARpy6gFHHX
 ctcHD/sF0P6BUcY/DGS2EQIZokY4U30syA3CkCEYxkAuHG/Ot3hEd+KjGsnQQn5pkGUzjYpH13U
 Gu/GU876AhEKAxyZrHOtPojC/B/eOO8yvm0AaIXOnEGfgq1Tz0s6Aj69h3cmbZpiRzY2SQlHPVP
 MC+POqRbEg4yZQhh/5ha3vLgv03hNWkejDiORn8x3zs384/WdIxAOwh1nXXLJaXdz5Y6O4Mz46v
 cYBQNwmupsjxUdTV9oQLGFwLKFOg4bnj1L6sv+oC1l/TrjPM/kiZGeBRSHGur2hCprPQ5XIcoy7
 QEo6J/rS8jmjJ7m1LSHqepQJ2YrZaJRESWVTr4yLY1sXKws0uObA3Y5ZImrW4oXa8LyPUzx6Ctg
 LFsU1NorUTVhI39hf4UKWKsgCsD+2K4ohqc1glJGM+h6073L6PUWGZXqSq2BGDEj13Om2ybW/IR
 ByrYvF5G4pbpmRCacoNQ15m9eNK5jXgH0CcqUuXC5HYDrbyXmpiCiSREgj+3qcBMmx1b6HBuWw9
 BED6Dwivqu5XUJO//Lk0UKnaweZlW1IDZiSHVwiM/qyMJbNYfU2Pzoya0V/GzAjhQiaz3FXM6F9
 rqlXBQRW7/vyGpuB3AQiabTECQe+NzT5EnMcvitPMqZLpu8PmKg93FPmpgirYjYYaS96M/hlAbk
 3lFNpwd62NwxuAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The TI DaVinci platform is the only remaining user of reset platform
lookup. Except that we no longer have any legacy, non-DT boards in
mainline so we can now safely remove it from the PSC driver and drop the
legacy lookup support from reset core.

The DaVinci clock driver doesn't see a lot of traffic these days so I
suggest a simple Ack from the clock maintainers and routing it through
the reset core for v6.19.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Fix handling of optional resets
- Link to v1: https://lore.kernel.org/r/20251017-da850-reset-lookup-v1-0-362a309a9f09@linaro.org

---
Bartosz Golaszewski (2):
      clk: davinci: psc: drop unused reset lookup
      reset: remove legacy reset lookup code

 drivers/clk/davinci/psc-da850.c  |   7 ---
 drivers/reset/core.c             | 121 +--------------------------------------
 include/linux/reset-controller.h |  33 -----------
 3 files changed, 3 insertions(+), 158 deletions(-)
---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251017-da850-reset-lookup-eca37d2d7d9b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

