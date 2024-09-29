Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3BE1EA84
	for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630869; cv=none; b=E6dXxJnmI4V8fcpAn3zCDESlQf4BSqTbRf5jYjzvHHOVkGugEwZPy0Z47CbamOpcQAiAkoJAGUGINK5ck/T/usI+teB4UfmN321IYGCx5ax3xsfh2a/9PWX7URB1U0pARwmVEXRcy+x+Npnv4ROnvzFXefP770lWfItRvEx7Bps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630869; c=relaxed/simple;
	bh=WUERIKhk0ysr6XjanYIBJIslPRVSyrgdwPzHbxGARM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oz8Pt3YP6nqGIBmU1JOR14JED5AWNptXuZy1Bho4Q5MPuCZ8QRDag6HgsIKZOGjUljQXWmE0+dIWiCh45/lB2DAU41VLdQop9BJi3UEkG6bQGNt7NAqF6HRt7MTl9N5R9tkfSjq656YHlAji7kGsveK7ZzGY94xa2xoiKoNv/r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FR6NZGAA; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FR6NZGAA"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so856432966b.1
        for <linux-clk@vger.kernel.org>; Sun, 29 Sep 2024 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727630866; x=1728235666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1af6m0P26utxo00AsF/VQkLQHLRIxDCh3EYFZpR7sY=;
        b=FR6NZGAA3kMI1HJk892P0c8Z+mfm5ApKukLyvEsFo0vOyjnYaloPQFE+RzSh4e0ZIk
         rHwBdA1j3Gobh1dqlpmA+vBHYh2lffkdcmQWkp2rnr94mJ1/Al4RfPxnwjqcwSiazTuK
         A1JtToMIlhC4vOM2aULb9jmISxkna/0T7+I7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727630866; x=1728235666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1af6m0P26utxo00AsF/VQkLQHLRIxDCh3EYFZpR7sY=;
        b=xPFSOO966qCSOr/NQYJI6Fd42HsxywDAJ2uci4OIKfEwFmvMgyRCV9AI0IVfmJEEZk
         8iWpKz3kz2nP8bNilSHPp5Mo8pIaQKF3A5CbIV2+nihBbVItNSkVRVaFtxr3lc3heXRT
         fcDFIvFWuKg9aI4tVVGr0HMy7hXi5Dx8hbSJ8jqyU12bp3d/0hQ51z4f7LZVe+41sViF
         +8tKhxp4LvqMwsQzVT4vqKGADAbejFI3av0Qudab7/IZb2pPjZZ1FTtIuYY5ubK9ocBD
         RMRGhYK8wmkxtvh7RKmhh6RPTv+/BdmogYlMxax8At5xbeXa/HBdHwd2nzYfjyL7j6Uv
         rl7g==
X-Forwarded-Encrypted: i=1; AJvYcCXdBIkh+W1TGfacSIkGGh/E2C5lLSo7fdlEAZnosguLDeqXTOJfb6hwLmlHTwXOaxFCb7CW3Oa0Vao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7Y2XVqLmTsZJ5vfpaRR7CykwJ62QOkzHHwn/c/u/CYo2iG0T
	4A/ho1l6k/PAM9NafBOwPcce7NmDBh6I2Dr9E5y3s4p0/fe0n7JsOezMKFDW9Yg=
X-Google-Smtp-Source: AGHT+IHeQSLDDGaGM06C3DmT6DPfJ9OxZZEG7iZ3wShlX9PB2tTp0g7klku7UD5UU2zkoa72aIzLJg==
X-Received: by 2002:a17:907:7f26:b0:a75:7a8:d70c with SMTP id a640c23a62f3a-a93c3098a87mr1230197566b.4.1727630866257;
        Sun, 29 Sep 2024 10:27:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm403176866b.8.2024.09.29.10.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 10:27:45 -0700 (PDT)
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
Subject: [PATCH v2 0/6] Support spread spectrum clocking for i.MX8{M,N,P} PLLs
Date: Sun, 29 Sep 2024 19:27:10 +0200
Message-ID: <20240929172743.1758292-1-dario.binacchi@amarulasolutions.com>
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
a board using the i.MX8MP.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (6):
  dt-bindings: clock: imx8m-anatop: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mm: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation
  clk: imx8mp: don't lose the anatop device node
  clk: imx8mp: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  45 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  |  13 ++-
 drivers/clk/imx/clk-imx8mn.c                  |  13 ++-
 drivers/clk/imx/clk-imx8mp-audiomix.c         |   2 +-
 drivers/clk/imx/clk-imx8mp.c                  |  21 ++--
 drivers/clk/imx/clk-pll14xx.c                 | 102 +++++++++++++++++-
 drivers/clk/imx/clk.h                         |  24 ++++-
 7 files changed, 200 insertions(+), 20 deletions(-)

-- 
2.43.0

