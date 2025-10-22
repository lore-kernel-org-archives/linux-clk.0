Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816D351FD2
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142927; cv=none; b=NCb13HxFpAzQxJH0Vwu5bVojgsU8jcvTFNzfxhlSKtcmm40JWcCtjtXqAnOIZikjplyq7XYP2GwgvN5FAjDGPuZuJW3BpNiGaa9D1FdUSxLSOJWBx8V+okcA4LfuKXLzKi0FBSReXlouprDeqHOIERnYDEqNRO3eBEVu2ieITeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142927; c=relaxed/simple;
	bh=DQG+inBx8ZXDHcXJybTvBi9O4BMU38YbAkGRkU7JaQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmbUgP2ypjWZeDoLnaE/W0AZFJRe0xO5Tkc9o25wy1LJInA4Vx5ygrBjmxDtdY3Fwd8CaXh5N+sFFOTrs0ZggQuJEa6HCTtci44GZwRHvGpB7e/Ok6bP6O/V7CGcpOAPbmAFxyKl/w8ZFFz2c9BzQaPEByNo5jYUEzwRA/t0ayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qhec2zHm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qhec2zHm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471075c0a18so73183985e9.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142919; x=1761747719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=Qhec2zHm/T7JsVU3osGmI8BQsS8DYjJwhZ2LaPla6qkzLZVXdli9geRpBg1hx3Km3Y
         DXAo8duRdrtM6bobPNMCnD/eqGrZ8/0NC53nil1Sh+8+DJTO4sCg6K4ACVLW8hFkse+H
         g34cUacGIVuq+U79Q7iDtKiH9H50MYwBICfseRsC/27lDZxCu0mcEBvQJBnDaP0Nup15
         XvPF82r6MVEc6kmp+It110/ikCxuFZhXN8I5DkJgQo2O82XxX48W7WLbKHsl/QcYoToK
         J44bFv6IZsARXD9yRY7Gg0ibCcNwUlHrU7qj8giUTJ9odrCeMrD+dIMhdWybum+HaP7T
         uqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142919; x=1761747719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=IrICuCszqCLEkJFa9QSHOU770yFDrChk8Fs1qrUuo9E8t5Wyo0RHYerG09e0RAdl1g
         4zgaaLYmIsFSae5kBZCheRG3wMCX6sFVy5JAwS0PYU8h5xOkDFwnurMqm4L0wwewjI3/
         j7fyLIxlhue6dcrOkobsgGPSMrGr7ZtRmpY137A6463fCLhyUzxU6jvHouPbh84XgHok
         Om7pO8Ps/UED+Ndv3OTWfQP6ISd1I9NFayPFk0gvzfduMAR4rQxnpVtnkf5ZPrbw33Uh
         BnYn5OrAfMMFyE9JVj0t+aScSISLoohPnzZwq1XdI0IuUlwzImqYS1MXw6slUFH+o7E4
         x0kA==
X-Forwarded-Encrypted: i=1; AJvYcCUTpA1WWrIBbAD9oEtkU+iQh2CSqK6Nu/mV0FBxuCFvMOuEjo8oG76TDViePGptNBxApEyOxDC6j/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyVMeYmsD1AucvGYKoASET3NZK+vsQtttXoqkj+SQVLlX+Y7rY
	NmLN44KcYH7KhRwNJqln2JPVJu6QHJluNVxzkpPdWYOQhDLYbQmK+zZw
X-Gm-Gg: ASbGnctO45j4iaTDKufmNpl39iSAVnpd47oRDYhQvndEy3hap+9Ev96uwl/u+4aX9LP
	bF36mPP3RsZdAfkDBiyPaCGdf8xxVGrWJbemEjJe946P/AvDsR1xH9xFfYiOWdv4DD5ijkUZTja
	sDGFYzAo2e6fuPwURZlFnHGnaoJfpBoIwqYS3BX1wXyUeKGL69yCeIBH1ZFNcDiww3V+a3INWfl
	pkWbdMoIR6xFFbAFz5j1jM8nNfO9VPAgex7vNk2zVZqQfmhCki84gqtW0+Q7xwpnhxV9q1jAZ/V
	NC8R3UHcAXczQVeuFZSIe4S8cn67WZd3cPFSUE11AUqHW04ANLWODVbOKKj6WXa0uQRPljXsJCh
	RkzOisDHDyQmRa19gKtRiEUrmy8qiTuDnkeW3n5eaYw2tsFBEvIS9h+tuJ1DQRGY4G9VX+3DlFa
	eYYA==
X-Google-Smtp-Source: AGHT+IHXd0IcgPPuddYC43FouBDl7JZ23qUq6zvhrCcNdJja7V9zzVEVqdzVMGBz5q8/P63zDQWKhg==
X-Received: by 2002:a05:6000:2913:b0:428:3fbb:8409 with SMTP id ffacd0b85a97d-4283fbb8df6mr11330113f8f.46.1761142918838;
        Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 20/23] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Wed, 22 Oct 2025 17:20:48 +0300
Message-ID: <20251022142051.70400-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 0457209b789a..626f34543853 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1

