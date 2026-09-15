Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3E47F3DC
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468436; cv=none; b=XIRfo+aYWqBq3l70ytXbM4H8LrzPJNcvtYmxEuxADB7zJbBiLEwentsTCwy1nFFxGhb8qknKyP7Rb77b50ZMO/W27gxvSFSRXfoySz7bvTL4ftOotcUSLc7uvxysZLT2wRswTvysRKsq6HHk6zJdlQe2cmIwEcrYfbUNJ8axQmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468436; c=relaxed/simple;
	bh=24iyB0qQIhRBRLcksSKKzm9eIHZVgNfeEOfit53HP7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDzSMd2n6h9/6Szj/a3Cm2IsADX9b3l/R41fEQSqLmpEfY9AkMBd8ziLmP0gWjnzdlMzk+ULNGdircflBLaAsQOjfwcV+6235F8WLclpp7C9vRcdlhW6eIYInF9mQbuJpGX0dzbHHtSqvmOdKdCY85VoX2SrRxZWZrUMMRLFua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0hxpsZO; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0hxpsZO"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa650c8so21518666b.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468432; x=1790073232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=;
        b=U0hxpsZOV2ZwRr8HuCE/aCrFM/LucWFFC6+C12Ye+qwO8JjW9GfiSc8BgMy+aAWQio
         DcB7dehQ6+si7t9BFzEzgW99jtBOtzZ7MYeA/5xDjxCEPe/bmYO2tFVuUEW3B0w4rOxS
         Bm8eSt1VPJPeV2wHzohX8z5ywXAcFDl/DAGhxx+KnNyQMEOTiIYDCjbye8NQStjQMW6h
         C7GW/xO9ZVxdIGc8W4xRwIARxbLe5RNYJlEXymRVvrxLogS20hnauwXGdzLl0jISPJav
         7MAZbXSIZj5QfDQjIlgJVA9s2Cx/p/mEh/jyB1M/ELEVhgOMOGg4Kyf3/Ndd1/zExlHr
         YcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468432; x=1790073232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=;
        b=jXD51/Q/cVp5i4O9i7w+lrkFMtif7cW7znExm13lJuTS24RjZPAIC30NOgr27WAKrH
         cir0VJ9qrfB5JGCFFBdT2jpZufFPc4F0k4+akReDDgTul04e71pfVqLfR7zk1VixQPN2
         +LqGRKrDDeJkPJFU7SazG5mKffPEqQvBgNUr8K515MhpgUaHe8i+5KqdqchK+UuIYViy
         7g9kHAZB1aYExFPbfzAnzBmsD2c4CI1E16nZAKHHPc3BDJHJ79FbMCmw24PhR6CwWwMy
         kRn5tdqB3dRT0exSQJqmBrTVSTkEZkjmO4GGpmrwJPlIOA8ljy3kRFRklFunFL9f7FBq
         sU5g==
X-Gm-Message-State: AFuF++n07xWMdjgpnFqGG5EjL48yGS5pL4nN1Ybo2Rf2bGp6ZkPlKqRm
	m0fMw4gWzccjXHJ0WdyKBbwobo/Um6iUPe/VfjgmBxiortXcCzo7qn+h
X-Gm-Gg: AYBFou1DoaleDo5nuFrwjysFQF7+GIahLhoPMme/yznsGd9J0+wWaarsJI23ZA+sj1b
	umesjFKrT/A8ODonw/DHhgRKpIivkzIK+eiahk38tC3AjOv4c6NkJ9DDs/fbGkKCw3aBTnvuqDJ
	zEHwxbDv/V1Dw4x6aHasZFha1KsuZtLMZJ7f6ozntoXuJwuayvTAuz+ls/LEZSdwhQtO5hLKOc0
	xeL3s7AGCRbdnxgYkhSIEgxVV49/5NW9g2DQ6rNE5KhsG2pu/2eXYZy+Cn6uFF0Q1QedmNRUcT+
	TZ0qm1GNDDCrpk2g51Kwh1WvDlUEgx04WMwPhQ7cpQArUCRBjEKNLbN05KeYKoQIJhudsR+FQKN
	h/zsa/PudTvuQRCaKil7Szfti8EZ6VsVG/JcDuLV56lCRmyx9ShSZvjP1Qq+4fA7mLjDiLVb6Mj
	GOf/g1JVPklmmTTaM3Opd3zsgbde+fPEhdoOJ9lHzP3e83Dr2oKj8VwKOpKdD+KyaTRNV03x3sZ
	nlZxvVGOwHntYNaskbRBFaFymcINfLkJPKmOhp5sSguEAAHbfCH3DCMNEAEQ+25AMbNaiPj0kW7
	20J2J9Ef/6JHIO0xGqIvJPJiZM4lsTux5VLOT2ertBnBzdzantsVSuFHrVe8dIAIUEKIc0y/F1x
	/13kSeMYot8jJa+RCGlKfvZAXfPIvBJLRQ7aBsdgcW1XzXxzR5aSrARRz8O7WtcF0cPnCmOCw4h
	ZRf7y09hKPXnCqsb/QFAiyR931mjyizF54aoAlSog90bI3dAvsXKTOf4FAWeK27JatIHFAQzLMM
	1wv1Z/olCFoYIsl
X-Received: by 2002:a17:906:7307:b0:c29:5a76:72be with SMTP id a640c23a62f3a-c29d78fed36mr38938066b.24.1789468431681;
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] clk: imx: scu: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 10:33:45 +0000
Message-ID: <20260915103345.1334-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915103345.1334-1-joshua.crofts1@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_clk_scu_probe() disables PM runtime on failure, but doesn't call the
pm_runtime_dont_use_autosuspend() function, causing potential resource
leaks.

Add the missing function calls.

Found using Coccinelle.

Fixes: 18a50f82cd2f ("clk: imx: scu: Do not enable runtime PM for CPU clks")
Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/clk/imx/clk-scu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 44220e9c5c2a..18f73e679331 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -525,6 +525,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 		if (ret) {
 			pm_genpd_remove_device(dev);
 			pm_runtime_disable(dev);
+			pm_runtime_dont_use_autosuspend(dev);
 			return ret;
 		}
 	}
@@ -533,6 +534,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 			   clk->rsrc, clk->clk_type);
 	if (IS_ERR(hw)) {
 		pm_runtime_disable(dev);
+		pm_runtime_dont_use_autosuspend(dev);
 		return PTR_ERR(hw);
 	}
 
-- 
2.47.3

