Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207F634C9B5
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142899; cv=none; b=ckJ2P2+Q/p53l+a+WglQy8imi0bK624Wo1PL3+BN0b0MuFftwD8Y3oU73ZC+nb58qAG51eugfma8+1R/5qFf9ji8CtKttWuC00rESoTu+BZfpVDnv6NhACYUEsVGLRe7wg9X57fqiD6+UrSfKz57itgZQFh7Mjm7z5duOl+9pD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142899; c=relaxed/simple;
	bh=u+qJVWyapenrodgmMyyh5sdeoJQIHo+UHZurPNrBBEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZAoexYKR7PTOkiWKQDQrUjpK0ejsDlln0mX5rs9VWUaDDN+dahMVcKE88wp8Ketk0gH6O3vNvLzxaZlD4PJAfbT9N/12eGTtmxTFPxb3b0vYzmT42Y/rP3Heqgw/AMEGwIogVxqQU615bUPgdnM1sU6wntYesPBlPggLkrIndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRW3mYGu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRW3mYGu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47112a73785so53148425e9.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142893; x=1761747693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=dRW3mYGusnM/Qmj4Y0elfbsCR225co2bFqnzUeMQY71kxiDG6gIjouamI/pS8dbXZd
         PIEdkZzuejc/uJtv2auEXrEzBp2mVsXK9G9CUW1OLiXLnO++rxWZBrlcfJaduayjiLlg
         liqQDgRSbp9KKzUUbT8Ue/lYFtvanYlxk4nlzHl8VJy0XY1ABF1RsSkA6ENVigxnxD9o
         cmAUvpQQZAs1XvwHhnir1OXKqiDmtzh2MUcUEYtgwwg18EuuGR2I5RmUSbCMRXZA01U/
         xqlASVgBaV4qcyybRNHDTXbNpj6fwTAB24HY410dsaFcLiPPv4KwgNSC9suYdITcpus0
         L8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142893; x=1761747693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
        b=ag/BFntc+o7xYwwBQx0aNYJ9m3ySqLYkPe+cOZ7SKysswZuHJRGxYuYYSoCYhii6Rd
         EpL0biczkZdmuig5BMT9cnHfiILtwcxsenlxIhA4SwzDwBAXTQPtb4gyluQtMwtYlPYB
         iJbU7dk1FAcFGcIPB3sqG+3pvCaXk98+ACSQm6OeH5tyfZL68Kps/hKDTg1G7jemP8am
         jBZv+7fKSWfzoBTDdgYoLOqnMLEdfo+czl5Rf9bHjnQ0k/mt0RSy0GA5v6vBkBtjgd3L
         mGZ03NNAyBKPrWXPGDn/xk33LNIepbElUCAYxYfOjRSl2BMezdRI5HhQgOVOhPaPeQrN
         KIqw==
X-Forwarded-Encrypted: i=1; AJvYcCU43SgggWEAt6ITqAiYa3jVN4Hk+eELYHQJDUjzBLZ5WV4SkbXlBeswH2OnP/rwV9ioGtuZPtPVhhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFcqAYsVi/19H0Fhth10LoQk1d9PWN4IFUued6YAU8NaA3X1FR
	ESDnxVkGD4NT92WnqzhgphjEGL5ykiZpwm/GnLSju1I0Xz41ZjZp5tMy
X-Gm-Gg: ASbGncuMtvdT42M5oKhdTjfRGbySVv3ORtFaHShdVAfAHgftF9gO4r+nkqrEasKmRah
	8ISeUSL7vMr4dGLWZe5HwRX4pCvL+B1y7w9ubdsl8sXc9BMqHa99SZgwfJr/dIBhDG+SqdKLErd
	vOHbEkwhyOMNfZLkhT7G0RHGNaHXaWYYTzXVUBF79kFIYwLQ0/urxI8KCHCUUQazekp2ScZuktA
	TdU2Nn+ChrXYG3LY4Fg/hPsPo00Omz+zRPCFJSeHc8jhS5SDEOaelNAlFLKiS8AMdVULmSgv/yD
	hNNLyCkHzAC+kZKjCV7+zHer7i76A6qNEjSifJN9byJnohzX54IsQjiHe+4r59UFENR2K+cGmuw
	FErhzVP94BxS/8mfIBGs+93YdxyQ3VAyfY/TAnLTAoYsA0g4TPHBcWv2A5e1wuQuvMXK3YYQTLJ
	YPBXCXH2TO9rX0
X-Google-Smtp-Source: AGHT+IEnXWlJDCOikv9Trvtrnq+YEjaVZ6eiwnQHVodVjHM0wnLfQoIbLbeHL/Nmsexg12AMq8heQQ==
X-Received: by 2002:a05:600c:518f:b0:46e:4a60:ea2c with SMTP id 5b1f17b1804b1-47117925e1dmr162394545e9.37.1761142893340;
        Wed, 22 Oct 2025 07:21:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:32 -0700 (PDT)
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
Subject: [PATCH v5 06/23] staging: media: tegra-video: vi: adjust get_selection op check
Date: Wed, 22 Oct 2025 17:20:34 +0300
Message-ID: <20251022142051.70400-7-clamor95@gmail.com>
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

