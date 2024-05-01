Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D6E1F176
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714574707; cv=none; b=dYeHj5B/ZWQ8dDlH/XMJNv+hXfHhZ3xCeobmwdWsX7ye9JkjPNcC7YGzp7fgCNHoFfitcc1bSRw+kFcthLancn2qAf8L9FBBtpUTmoqnkWB9rNs2ZCEvgCfm/SnZi2nB6rTeYaUAUJj36SFeFXz69L9yViPUImPTx/22we8avfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714574707; c=relaxed/simple;
	bh=OVCEA+sMHIn5t+AmYPlgxoh+k+aWKCTPEhOiftVsSw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hyitFG5Pq/3J5xliq15LCr13mU5/meb4MKmN+AiB9MKirwJFyCxscjXrVeUAuy1oH5O0D3oYhzR3Q3/4PlBmtAtHGzMZUuOicSSq/JbyfQIJ7CBx62UBBYngfaSvo17kATe/jTNksTyHMStecGwlbZox7cdDOjF/QuUwvug2Ko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgZWwbJG; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgZWwbJG"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso8888203a12.3
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 07:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714574703; x=1715179503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19fONahm4CwkvcFuKCjkaG9ywwBvaJs3VMjRkYN1PAE=;
        b=kgZWwbJGmyhgPBISUGTPFpfiDJYMIzjRKujJ6vhK6fR8gAZ3F1M43V1HvqYor66iUH
         bYvl007S20AvuYBj2qtS8hmf68adwXFZZrxZ/jP6hF0fYT8kwLZBoXi+ZaTkAaHSTy/+
         coBoTG2ew4powGY+ThlABkgHHGTiMOC7Jrj2gYviR4iubf6o/qrSjcpPpn0jnQfbmYdN
         y3YHuQcTWh8G54LMBXK9G62/4RVQmHtPjMMf0h6TKpngfx3kgbFEh2vK3fQN9/evYlEc
         Om0NLe9EaHU2WvONVn+7Klba8I2pfIUBNS5I9WvXIH7dSPShJtu6x9kUBVno5YL/d3t+
         jG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714574703; x=1715179503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19fONahm4CwkvcFuKCjkaG9ywwBvaJs3VMjRkYN1PAE=;
        b=ilMY/ItA5R7QBzc+bUuFz5fYq2I1zkRSbxwBirzPhdaKOktoj11VIy05cfcV5sRsFa
         dNGO5QiLsFxUr4q6quvvNmgoFkXxsmOA2vrNM35vDyjKkOvR3ihXKTMN8d7SF6LdcI9h
         97rmNOlMDG7NAlUYvLJPJo79BhHPZTcwITLX3/7qpYyXLXPI4iascyq+xNZAA8qIU9hN
         pDaqjvJEffLk9qo+US9ohpvlQdk9SHUN5WbqCp2R+pTRJFmJnnfVrAkbpx7lo5GWUdYg
         wQyHInDTG6zob6DdjGaUfFKYaup14A/ffYvRDGpI/uzxCpjCxb0nUkz6FK4vcoByF9J5
         QbOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp0ZnzLcLfhUf5Ao/8CldnbvA7AEQjtjvgGQXtVEGUZLsbP63F9SbF2bFt8JrFy78RwF9nUn7tnovdVSKXRT3GTKEmEiONRHi8
X-Gm-Message-State: AOJu0Yyr0dq3Vf1NfLJj53JD4urzIKljPrdps9C8UTFfZml2dR7Q33M4
	+brNkc3NyDarorWuyzjQ391siy0lmqNlNR39Z5Jh+rDMo5uEY/s7Cxi9gFFbRJg=
X-Google-Smtp-Source: AGHT+IFWw4+HYpsJ1jIgKWLbzvy0AN2twDF2ubXy00OLPY7mv44CBJ1BKi+rmI9iBBALYYUDnnI0BA==
X-Received: by 2002:a17:906:a0d4:b0:a51:fec0:23ec with SMTP id bh20-20020a170906a0d400b00a51fec023ecmr1764739ejb.25.1714574702588;
        Wed, 01 May 2024 07:45:02 -0700 (PDT)
Received: from hackbox.lan ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906c00700b00a51bf97e63esm16343266ejz.190.2024.05.01.07.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:45:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.10
Date: Wed,  1 May 2024 17:44:45 +0300
Message-Id: <20240501144445.892045-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.10

for you to fetch changes up to f5072cffb35c122ec85d91ef327fa8814f04297b:

  clk: imx: imx8mp: Convert to platform remove callback returning void (2024-05-01 14:40:49 +0300)

----------------------------------------------------------------
i.MX clocks changes for 6.10

- Add PM runtime support to i.MX8MP Audiomix
- Add i.MX95 BLK CTL clock driver
- Add DT schema for i.MX95 Display Master Block Control
- Convert to platform remove callback returning void for i.MX8MP
  Audiomix

----------------------------------------------------------------
Fabio Estevam (1):
      clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()

Peng Fan (4):
      dt-bindings: clock: add i.MX95 clock header
      dt-bindings: clock: support i.MX95 BLK CTL module
      dt-bindings: clock: support i.MX95 Display Master CSR module
      clk: imx: add i.MX95 BLK CTL clk driver

Shengjiu Wang (1):
      clk: imx: imx8mp: Add pm_runtime support for power saving

Uwe Kleine-König (1):
      clk: imx: imx8mp: Convert to platform remove callback returning void

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  56 +++
 .../clock/nxp,imx95-display-master-csr.yaml        |  64 +++
 drivers/clk/imx/Kconfig                            |   7 +
 drivers/clk/imx/Makefile                           |   1 +
 drivers/clk/imx/clk-imx8mp-audiomix.c              | 155 +++++++-
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 438 +++++++++++++++++++++
 include/dt-bindings/clock/nxp,imx95-clock.h        |  28 ++
 7 files changed, 728 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,imx95-display-master-csr.yaml
 create mode 100644 drivers/clk/imx/clk-imx95-blk-ctl.c
 create mode 100644 include/dt-bindings/clock/nxp,imx95-clock.h
