Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1057C3FB7FF
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162021; cv=none; b=uuks5y29cvLHqSbd3GtrO8JuIlQIMck/zVDw7GANQi2Z3/E+d5umIoQX4HlWbb7gz56FtIjaEEHfS1gN0tsO/2MG4PdE5Tne538out2MDtUwDQkipCXVnsZdaHT2eXjO12gZxFcSIb1S9eRf0XkwO7TV7MQPCo0C4jzG/pRAOMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162021; c=relaxed/simple;
	bh=L9AP7K7IS/BQIX048gXZafEbvq5i3LmZ5GjfHPcHmZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGAVYIhkYdUI29Seh3gSmJyORWRXRcTztMr2jIK2ls/vkrwUGx3aB5gAV0hVxVDwU6FZFSY3Q776eCP23qjYp0RCxyI+JSZVQzZF4oIahv29iG3b0OyPNgDr6LWqZibV+dABgQCxkAy+Ixl85xQ49LAspSdPdX5LL/AC0Tn+dIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7z343mY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7z343mY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891f625344so10340215e9.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778162018; x=1778766818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=W7z343mYO7RU2hEA3AmVm+rctv1+bJdUwB9uk7jjHeb8jpnuEp0pgg8dpgrI5pfmSH
         /AxosvDQuWzkbxDHQpMViC2YupJ9X3ZhCEKAqrgWhh5eJNdsQlSbWzYZSWTOSNZ+1Vf6
         oAXGO2xifexFTbTEST5AGJxPMc580CreoWVd9sSKznCrqZpiLSC6ODr9er1rF4zYunXj
         YrthltcUhq5K/lrGDR4iBvJwoav8GIri8nGZQJj6TGlAVrZDgPpBsLovx1FtFBSOwlcR
         o4AQZwZHgVtp8RLuZjF6Ix083e1WQvJwWDSwJrCmRF4L116wEPx3WXeZlm1GSic39Y5/
         Vlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778162018; x=1778766818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=FT40a51gdKd2gvCNlud9lwgu3CZpX9ilUF+KzSURQ+3UbVBapN9xUJjWyJJ0heVMAr
         9Xex7dQcUkeeAbgOd4G81k/nv5EHKH2jo8IiSX3x1+FYaOTkFZLKU5t2vfKnIXtkeSlI
         Qtpan/YUS5jdTYjPUdWFWj4Y9RZCMPTZR26HRHJL1E2G0FzSKKt5+ZDDH+pNqH1zz9Kx
         ELnQKcNi6MvBZyGxy+FYllfURzCMXvlsL3d8qM9VL3EUjlLxxExOjd9jSLiS1OOcGWf4
         2c7pNNtvLBPMfZBBwKGHzhn0blYWqimVLdGrGEWW8HJ6tYWTgHOjp5JWXv3nA1KfkJx4
         6jTg==
X-Gm-Message-State: AOJu0YwRUwxR9mgu9ZZWl2t7hvtUS45cBqP3mcdWKcZA5ci3XEvXIox3
	e+F7S66ym8bncyJTJ+TXaahvK2PUD+a+lqeuWj/wFH1E1U/WazrxSRTy
X-Gm-Gg: AeBDietja4Yk1V/nOCfP75qNK/yC2NF7S48iBzNsMRUgxkgaG9Ai9aTzuVcu0/7awXv
	NuJ6K6pSXUOb2XI/xINK9iYWX2jY7FW8zVjH0QOUV2aqHLIehN4EJcDd3TItcfk50aL4xVCwXdm
	Gw3aOp/HSlnt0EQ3BqEgHyxHTEtXMY3I1BZ+6qQz4P9IdRDwTpDXOYwyqZunbE/tP9Om6dvnVrJ
	On7xSSAKZA2A8IEyESw0pkZOz9qfCyF83yhmq8PPG7mku1bNMifTsyqON0V+KKyu0uFl9iionIh
	Qsfzz4A7Yo6jC5bXna7g0xxvAoLckldFHuutFfLJtSXuLZAKgye9gKeiNkpArR9h9C0qbeGJXJw
	VMG7FCN9K8mGfjyWDn1zK5z0Ddwq9P4Vjj3Fek9nO7YuKxzjUjkqL7MuAW3cMEv/TyxaIGCXvnu
	G6htA9LAq7l/t+TQvRGKrqNWU=
X-Received: by 2002:a05:600c:8b6e:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48e5dfcd72emr49319315e9.2.1778162018318;
        Thu, 07 May 2026 06:53:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538fad5fsm137882125e9.10.2026.05.07.06.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:53:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1 RESEND] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Thu,  7 May 2026 16:53:13 +0300
Message-ID: <20260507135314.76817-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  clk: tegra: set up proper EMC clock implementation for Tegra114

 drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.51.0

