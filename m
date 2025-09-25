Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78646301015
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813447; cv=none; b=PzbwvtJ82pehWeq9gBn++s6116l79TgiRO4JShWHUN1S6EzZh62IJxVeu4OIE2rEQTd/D96IWs2QX3pP2GhRSij29eKfxVQBNDGHEUecN8zBIRPDQWJkQ/BJSlCWOt2SpccWMfshdoDxmDwLe3UgMfYHPP8l4VdmfWL+SJ0f1uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813447; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQizSAPPONvTIYJ7WRf7CPXYQBMtMOjSk2NS6lujYwfKHGxEdb0EXciCSTJdrGbS595TYQetPJlQexQeDilcC+d9AG+BVwGTflCXHlqjqCHQvNVz0FremHSESqIAt3+1UnPxwStQ3Oqag8ctAaFqRosRjc2HHDozF+sIQi/9+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASxPoWgg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASxPoWgg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57bc9775989so908448e87.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813442; x=1759418242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=ASxPoWggU2jE6P99zI4CRqeV7JuShOT1D/mfEc2RqTFGTqRfTvoolVpC+su4R2SMBi
         uscAI/KyVs4csYRuIyhjwY1lGPJc5YaCnncVKxuBUCAKCB3b2pmvXjxtnYjIXB8Csmjo
         KWIsVNQvQdB8AyrwSD0El3/1UziL8zd+KKgE7UZNeiTfDuTC9s5qls9ath6D0PXvVNrJ
         wjTAwc43k2FkfBJrk8p5TMHt6TF8NAW6Cz1vFC1QnNko/u6tLDj214hUDDqBXk7bnCzj
         YHMkvnzLZj++BOxhVTxp6dctM+RnAu7PlIqBSOLYoWStJ80XFVnXXC42Q6BEns1e8BuU
         MPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813442; x=1759418242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=UWjbZN7iqlX0PyU4AksZbeD947FtGHxLWZyD8c906Cx1IF5e6iHo0+7Sahr1ypWG/N
         Vh+KzWalEu8+Hl/jOKzHtAPdxZ/DJOs02UeWSj5wSrq8THVWognYTafqTCNirITcEfwj
         cyn7i2Gep03B4fmiS3v2+yFFkOcCPXizvxjlyzXFgGsRrTlayDTXWtW4N0czq9D77UlZ
         dEwE/g5k3sBPArAU2n+4LcXwyXsCn93oEDXDerhAI9AM/EGeG3+UqoHzpqUP2lRzu29V
         NlfJmt484jQ7I3i6OQqVPU0irRKtkykd6Sj5VkI3t7AeDOFFQSn5LOiXsUD0Tr+iOTFd
         wOFA==
X-Forwarded-Encrypted: i=1; AJvYcCWDalrkgpd0w7G5XxxVCoE81abwsg+xmovfF6QRSDN+ujtrBsi1pul4ZxM+kwsLTvPn6PsTluTfycA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/T1+6JI/7WMc3pH/OtjsGBLnMa/N7QUO/8lzjSH1uWMmHzZXD
	XC1fTXDS9FnzgUgYVKyynhKvRJuy8+HLm+0jDwhhRgMCMzqfxGeX4yMG
X-Gm-Gg: ASbGnctwL3Rpb3wJfuG/hpWC2A2zm4FlYrXcg0olGJECRQ8UsGSItx345iOMmurue39
	ooUnZw4ulbCMOCCiFJMcIKghH1UcAbNSzAAPm4gMMbXNZPMvBi/mPetCcjqm2ChOqcKelQQo9ay
	3IF3KwVafSrtwAV2CRxnpyzS7DcuAq+yrJ37bI8I3r53mIxYAHknpGTfpL5CMEdiJFRoIAg79HH
	U/ktUpkwCzLeccVdIZ6/36cBpNXUi4Y5/Q+S/yXv/14Wb9k6tFl0j/GxS2NhJG966bU+l4iFjKx
	5A36gF/1dSPX/2g1OoNWzEmuMqxr3/OP80MI+YQS+tb06oOBgQ/Tjzxz3gbj19oC7BvbEuU9Wmb
	MSCWW+M7OqkZ5kw==
X-Google-Smtp-Source: AGHT+IGR2iv+Kh9ab2Gm8gGsLzPj15GIU7TA9oRp1epPRzVsSpV56VOyWvYjJkH+/G6EVhjFNycXFg==
X-Received: by 2002:a05:6512:6d1:b0:57e:ef77:699c with SMTP id 2adb3069b0e04-582d09297aemr1358949e87.3.1758813441925;
        Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 06/22] staging: media: tegra-video: vi: adjust get_selection op check
Date: Thu, 25 Sep 2025 18:16:32 +0300
Message-ID: <20250925151648.79510-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1

