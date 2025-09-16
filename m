Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966FE2641FB
	for <linux-clk@vger.kernel.org>; Tue, 16 Sep 2025 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758008932; cv=none; b=txYohVbXcUcVSHyLRzVHJqZ3zyMPfkzq0D09TwHBdi48/eOHzUpy0aZs2FPYhbuqYr1HbkZ8bmPOFt+kTYBdP4Bw59/eloGdjee9YZajoMLfTStWTdIdW/wh1Inj4Zp3poJjc2IKds7VjMSSq3rZwKFwvk4pAaDUYhSjEOX9pBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758008932; c=relaxed/simple;
	bh=EbxSoUUHARJ/26oz5qvy0rct4HOaMS6x3qf3UE5sAGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FNRH31nBN5o+mWWQqJ3ynHxCFV3A4MczNTCZmwkB0cPUdSK7tfDHQ7qQiYsRgDMFk1OoEudHz/W0y/gPtl2lcxY9HWB2BY377enNsZhKTyxu79ci+QTycn6+ohtqrlhI6b3XhXQp1pP0G6TfB8o6RnOaXIyBGPO82ZpkPQrpkTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDDBN0Ou; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDDBN0Ou"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45decc9e83eso55631535e9.3
        for <linux-clk@vger.kernel.org>; Tue, 16 Sep 2025 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758008929; x=1758613729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72mKaLpH8ZVeWabfEKgenc3kq6CKIlNYl8ZR1LugQjA=;
        b=TDDBN0OuzGB1/kuMKKjBN9M5+8Sykz6sDxOeayftXKGcWFXMl/jqls5Dx5BAB/C1rI
         WnS1HaqwYlP1x9SH0aR7BBkEerDo8mEhjOnKH506r2eeo/gtH0D9iphJCq+NX2aLs7VB
         MZv1fwf8brtx6eCQfOTd9WJ6Ms2b+bPm26oFKFcgEs3xjqwUM6hprX2sWWwYPkmPt6Bn
         XhUR4NGidwNyd0DmKEAnemMo5aCulwk6joE9J+i1yp6y+CeLlKG0XNVk5eX+auuqSFBm
         2ic/lr8/nZ0CcVs/+CZhNOK/qaP26BQ7iwJmVvo5jsfOc6sEgw0MWNXQxoM2eN+qVTOG
         w1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758008929; x=1758613729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72mKaLpH8ZVeWabfEKgenc3kq6CKIlNYl8ZR1LugQjA=;
        b=imhCQuvP9V+1Wp4xn5XGjur2HLW1qgS8tH0gYkGbX3KKV8BFcZvJkNfvL0HHTgVUrn
         Mg2Fejua9twRBkFOYG5I41TaN8zKBbSxq0COHxre7NpgedhRmo1lZxfWB3taHOF0MuD3
         yTw6kbyULmL463OExOub/TQvKZ1xWMAT8kLj3yzj0NUbKKN82SVKd+xG74M3zg6luhfH
         b+n4TY//ZY5YCGdzoGQvTw6kP1KC9qWrseX8q9nEPFYMlZw7b57dYjgt+7sr6L5i+09J
         y5+CJEdRzNxhP2bSr2BdV2ySXMr67ZPF4T5foWOJ8q7WNGx4KkEFIirJtXWdzlkgImdF
         e09w==
X-Forwarded-Encrypted: i=1; AJvYcCUoQrppA2ducZYKrAVpFAWKNIeemTpd577Jn6CmVvdTR2aB+86g9fHGTQkQElKPakXeemUlFFJg09I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR8k3FQmt9bGpy557zUxv/WL5TtcgKQaRKac4zQfYc23dNSoX0
	0rJgj3P8OFwuACaf2ZjTzAYKwZ3jhixnpt24yjXTPrz87xgXUgaFpV48cFRJNBW8wJk=
X-Gm-Gg: ASbGncvZ12zWGEDBg9kRW9CGMYuyQE7N8yOcxrmUcDdRSRvrrKOh9Fcr/i1p4jnsjQv
	IvKFBbKKKvYsQxVcZmNDTpvBWfciDLpXiYABeRPJXchxH/Bjuz3aJ60T76B/yDV6FkaeNJtEnlz
	HzV+MQFROS4vwzWG8RLx9/bKwwHL8n7mhsRUOt58tNL+naJGG6kffu6InYfqLzHlEnrPJ7xy2LO
	2+pExL4LdhP436GYvyLuHzLW+jE0OLqvocw8WDV++CcwDUmHyT1f2nUjt5rvBVqlxLfmJzEpUKF
	/ltveXvbk8V524VOh5mjUBhwp4b4pjKPlU7Y2Plp/f01bZshwEFWPohLXsO5mDEtrmlTZ+l/1jX
	U97qauJ72YEWiD0XJHFx/rms=
X-Google-Smtp-Source: AGHT+IEL8i5Yw2VUOhkEwwUUdverukoVgo0AoLaHUFR9LPgOcR+nlygVIx1c77T1ysbBtnjWFKJgpw==
X-Received: by 2002:a05:600c:604b:b0:45b:73be:c707 with SMTP id 5b1f17b1804b1-45f211fad57mr85880805e9.22.1758008928887;
        Tue, 16 Sep 2025 00:48:48 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm103220935e9.0.2025.09.16.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:48:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.18
Date: Tue, 16 Sep 2025 10:48:28 +0300
Message-ID: <20250916074828.9677-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.18

for you to fetch changes up to 14be8b7b6cbc0a072c749e46e28d66e0ea6d0857:

  clk: imx95-blk-ctl: Save/restore registers when RPM routines are called (2025-09-12 17:28:29 +0300)

----------------------------------------------------------------
i.MX clock changes for 6.18

- Rework the i.MX95 BLK CTL driver to add the platform data to the
  state container.
- Retain the state of the i.MS95 BLK CTL registers through both
runtime and system suspend.

----------------------------------------------------------------
Laurentiu Palcu (2):
      clk: imx95-blk-ctl: Save platform data in imx95_blk_ctl structure
      clk: imx95-blk-ctl: Save/restore registers when RPM routines are called

 drivers/clk/imx/clk-imx95-blk-ctl.c | 57 ++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 29 deletions(-)
