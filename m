Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D061DBB21
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883973; cv=none; b=PzH45IOpPAeu18xlezGbNns7gDkxQJpTweh4E6YvIKt4uV0XI4w6VVj/0rSSrnA2NKv5jOkdNfVv5/rRAtf2S6mP/FA5lWx5W/6tE48GYQrpKuG8BpOmHGBgRKwSK1HgBUYIjz5uMNj2GkmlPa7hsLXyLVeySPtIjUD+E19luG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883973; c=relaxed/simple;
	bh=LtDcq5GNGdpLQi/gwT3VpDWdk4u/M9CX5RZIK3YonB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSZvR48B0DlYmxrUdB3vC/lp1HQ6oVRN/FcxKRhVpYk79wS+aYiYgYffW55YseQsolgGusTMevVVlM7FkzgfwZtXaRnw6lmtEMZ/UmmRL3N0VtetKtF+cE3IXsZdkrkPmyGdkndQilDDH8O2jy2yic+G5am/fowiB40mEbVIvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bzY/9+IA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bzY/9+IA"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a6b4ca29bso818907266b.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 01:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883968; x=1731488768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQGfCgtGxny3+etN5uPGt5VE9z/U2oT3XLy2KTaMLtM=;
        b=bzY/9+IAG4+vCRjEKg2vUR2P2hwk3khkxoYqPa/u1nDk1bTL1snzWVQWXxEERxk2yq
         VTmVOrD9HwwSRhzYlwP0GJoMfUJE/jUWVlA3jfoqsM2xuGkrrCFOahL/WQPdOqAOukG9
         YGV6fWldwCAT6H27GK7F+LHz80a7mjg5nXyQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883968; x=1731488768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQGfCgtGxny3+etN5uPGt5VE9z/U2oT3XLy2KTaMLtM=;
        b=v3kTgExRee+L6YNRVW5YMPcP2EDNbh+naS6CheXas2M2b5gnRM1FT2vlFulk8ov20I
         xuqksvog4R8eJ6jcil2hZ+ipMvbF4+TX3E3hTpOVtbllMEM0OH3gbPG+ZsUeWoLZm+gT
         EfJOYYtr28IbCtp71tlHn6/GdGqz4AA60Pijk/8llAB8w3YtDn5S6hWmx8aD2mNMj/l4
         bWrAOrpym6PsytZcjSD8XqW0N7+TbJXLptZw/H+tiraV7bbUvNA9f3OLgFg2k90Kb6hS
         oKdEW3Nv1SgoTnUX7BgCYpr3nsQiY27PeWJScQKEvQ1DOe25sErLO5LCUJmqUESTH8Ho
         qm8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV60Liz9+CRRJsiDbkUdGnjDrXsUcj3CnYBRvdF139UVTmG/8TYJBfGB0gufFaalqkdTL4lTdrTHU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxumm7uOpoBL1L2kAiL1GFj2MqWKuHTKrGwela/LPQzDKdLsRKy
	icz6H6HULH6RdVhekT/gU/sqy4eAvHkghmmnRsnBGm7JDvMk+szg64GTm5KtsCw=
X-Google-Smtp-Source: AGHT+IHS33PWmczfWikAhpAdNlCU+a9+IAsnRCa7MMogy1tCzBHrZ2XtY5RmjifBnJRTUzSpIvQdoQ==
X-Received: by 2002:a17:907:724d:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-a9e50978806mr1335979766b.39.1730883968287;
        Wed, 06 Nov 2024 01:06:08 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/8] Support spread spectrum clocking for i.MX8{M,N,P} PLLs
Date: Wed,  6 Nov 2024 09:57:56 +0100
Message-ID: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8M{N,M,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
boards using i.MX8MN and i.MX8MP.

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (8):
  dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx: imx8mm: distinguish between ccm and anatop references
  clk: imx8mm: support spread spectrum clock generation
  clk: imx: imx8mn: distinguish between ccm and anatop references
  clk: imx8mn: support spread spectrum clock generation
  clk: imx8mp: don't lose the anatop device node
  clk: imx8mp: support spread spectrum clock generation

 .../bindings/clock/imx8m-clock.yaml           |  46 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  |  99 +++++++++--------
 drivers/clk/imx/clk-imx8mn.c                  | 102 +++++++++---------
 drivers/clk/imx/clk-imx8mp-audiomix.c         |   2 +-
 drivers/clk/imx/clk-imx8mp.c                  |  21 ++--
 drivers/clk/imx/clk-pll14xx.c                 | 102 +++++++++++++++++-
 drivers/clk/imx/clk.h                         |  24 ++++-
 7 files changed, 289 insertions(+), 107 deletions(-)

-- 
2.43.0

