Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813B277818
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746165; cv=none; b=Y7SpUgboERFq++i8tOneCPo0beSlfRTWaw36qs3aZ5RywdbnBXZsgPH2m74EoxnzEd9g11cNxdUPOCBVESqGBMeOvYfxGewpbRsoWj2YNueLupxjfkAjUODG91K7cRLhI3/ygrdBSGSSZkszciX6xywJIGiNf7klKIiKwYi/svs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746165; c=relaxed/simple;
	bh=j0EXgrYnvVA59AWsBuPviuInGMrdX8MUdYFnXuN3nj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcAe5DCd6VQ2lHNGo3PCTwjigOqppPnPmPyRzOTSH3nntG1l+12yv/Gb9zA6qBDLjS89tSXGg+RYyq4JB0EaDuXBimRDdrXlTnndxTi3U7Hu8zQRI02ZlXVa3lrAHbK/lbJ3xlrGJiBP52DgxCYotS1oHSZiwqBXMcJ7e17smqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjrUJgpt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjrUJgpt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b704db3686cso56062966b.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746161; x=1762350961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=kjrUJgptY7kUXvzbzgSuOIk3nRcChEkdH9EfIq2si4HVohLV9EHM2pgC46i53SAvHy
         OwZNgmnU1SoGylK5ZhcnUj92AVbTtOdThtWwEsrxAxwMwhudrBxYCZ+zARILVq02e3K+
         NNbbsKOm7GgHTAz9gGyQ3Yjo6IbuSbg5BPqmzOlaUqRjJDhxJKEVIytlly8S3WW/fAvs
         H4aIkky0fsvLtBgu92tUcxI0aw063Ns8kqv3u43eZ9phlonJ7SYdpPhMRhjA9KUSyoeh
         C0HhmFqLnYdmBZL5V+yTLA9QohOxM4jds0Jubwoe+nVLi4Hz0T16zh/L9lSkBVGHJPRc
         M3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746161; x=1762350961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=eIGhZxeXOA2iJTRY9lY1IR5t/r5sKJRdLHv3cKg04FqjRQFYKT0J/oDw+izW/HNDZW
         XbLh9Rq0CJ3rdYiQkIw9dCYY5x3KhmpvwJ5YmUSkOfBq+28gcwj14bUOOMrES02IOjNb
         npkCzrXr1T+i61AdVWr85M3doStBp6LB/fDukrT5s0cmFXrWdqGAU2uJAkFHwpiTwW+j
         QexzuKx4P8EUO71bdmHANAdr1ollj+/KVvMoVra9ColH7KCZnPtECaG/ofYUFGA989ja
         jM6V7ZwXGi25OZysg2B+gEg/KO4ELwXwe4otXdjXzquwKovJyNxOBBkKCm6fJdBfqD5C
         BU4g==
X-Gm-Message-State: AOJu0YxbXVt277gIOsUsqVfLua5ur8dYLnQlI/JnPPibCDsJUXgaKG4w
	pL9LpOB2p2ME6ahm2X91UneHOc/81tu1rD+LeQXBqGwHnWyb2Lf61eKn
X-Gm-Gg: ASbGncttPnn98bRIRXw3rZEDpHm5QijSxGiR3hjPVjuAg0Pf39P9CJts6IH/UuHMLWx
	VuSCNrLKOBRKJHVbAbUrLX9ndWO06tghCSFm/6VhCpb19H3r01Bbi9ph4uI3QhnO0494B1xP4QX
	FmKZM4lLz8JcfLvzGN5/gEYQ/6Ohk+xgqznC9XsiWngWiqPNsMf5iVgOijgRh6gZBSp9H2pNesc
	x04Mck/d49a8moKj4xUigjMT0phaXDWW2f/VaFDizoiRGShLivkbSHj7XtJqOW5HdfNzgYMehar
	AbYRvj1CI7+DlCPcR2e0aShIQINF+3oOrf3Rwow2vyTO9MsWdXqADpk7h761pfbFWn/ELiuUwB7
	61pAbwIXiHorl+1HRMxhQQHSveaTB+qF0vFwIJlj/FdK5CBF366/uz6CyTnd0+FxKH7HkxVKXgD
	d30wwu1/QKzbeePOECxl+4ScVQm62aKg==
X-Google-Smtp-Source: AGHT+IHrghZaQi+o1U9HBM80X1LpTX8WL6sxC8J/8ai0EXsL/1XFPVew5l5qwKEGLRSKZrM0eDMeIw==
X-Received: by 2002:a17:907:96ab:b0:b6d:c44a:b698 with SMTP id a640c23a62f3a-b703d4aeeecmr296884866b.40.1761746161026;
        Wed, 29 Oct 2025 06:56:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:00 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Wed, 29 Oct 2025 06:52:22 -0700
Message-ID: <20251029135229.890-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
"memory map", the definition of the EARC control register shows that the
EARC controller software reset is controlled via bit 0, while the EARC PHY
software reset is controlled via bit 1.

This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
imply that the EARC controller software reset is controlled via bit 1 and
the EARC PHY software reset is controlled via bit 2. Fix them.

Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
Cc: stable@vger.kernel.org
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..eceb37ff5dc5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,8 +14,8 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
 
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
-- 
2.43.0

