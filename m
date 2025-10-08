Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725D32FAC03
	for <linux-clk@vger.kernel.org>; Wed,  8 Oct 2025 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908714; cv=none; b=lDthJbEzxyNxtBqu5EfsJ2huo8q0jfyUfsTnSzRqJ3SiMieGxuPLoJKbPzaLJzspqK1iHpdX3HtQT4/Vt5VmtzqUTX2ylSa/kYUHI3e/1qBweZLmRTLZhdlj/35RoLWsEuN0i1fDDjkgyEzg3W/YC9lVCzwyEmPrIbR8oeV6s84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908714; c=relaxed/simple;
	bh=DQG+inBx8ZXDHcXJybTvBi9O4BMU38YbAkGRkU7JaQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsbxfAmZQv2FCQibz7E6WqzfwD0jmq2yVeRHVLVNooUv/ugLdxUnNC5OYHL0RfHRShC7dbSKAS4UsaC9M3V9V4NGHx1wdwHrpRwGavnHcpKUR5AOJSumWtvR30sCiXBgo3qQNsnD1jF6cDqLZZX3ZrG7d0RUuTL4cL3JLsIZtb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7+lWQWy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7+lWQWy"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57a59124323so2275101e87.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908709; x=1760513509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=G7+lWQWyryV9LtEA2h9Fju7xkySa19kVPCq0EdVTAxoBLBWbkS1pirZzs/4eu3elyk
         mN23d2df8bowdox3TOvuMVQMHK2Nia1knM5j+OG2by1uPRgQYhtR5TjTXxtBKeIL7br0
         S1FHVLlp6CJoC3ZUfBORF95/aRdolUBmEl08BoQdBzK4khmQ1fdOV7G/iDE4JdMeION0
         fIoAzmKGqAh+Z7fbQGakX9yIKzicjmVD8LssRxXjKCNyoLPU57f7CxK3NdIxSppciZug
         FTnW/tTHWxVhHFEyfVNdvC2kVgWWmZ18QBMEXYxZwuI39nQSlc1Q60F+IuZPzZKg5kyi
         73HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908709; x=1760513509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
        b=pK0uiwkVw2DHzX14jmYE9lCgjwgn14eBgfug0UdXvbogs9bLdW0HOBI2WzG7Zb4Bjc
         8ERW8If1G7ZgHWfJowpf1IF9DElPsSUxYALtt0FYvJhXHVCxvFBnCkz3njVqtNgZQJR4
         Zh+hx9gJ2eorlWG9Pt5BWCNkjYknG0nGqq5yVWkQhuvYe3G3O4U4kusJksoDNFC59LYy
         jMcNGBfS/l7XaU3MkGqubg2oIZ9g6hkZGJAtE2pQ6yL90R8FUaxFm3s5awPNp0GyUWj5
         xJJxTQYmFdx3XsEHj+eKkD5pq7eIUaq3uAH4vpP9oxFh0M3cpsEUE0m7zJq+PoLM/6aZ
         cUEw==
X-Forwarded-Encrypted: i=1; AJvYcCUKHh9ZQFuJL0TP23TqMWtFe83ezs1I2N5qGaO/9n9Bdzaq0crJSx9cip/T/XMAM6mz0+fnGn2GlL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ4W8lhb82GFvgeFtCbp6DTu42z3yf3LA4arHhhVQjdVM8idum
	vpi50Ih2nr/AfvbVoYQYdUY331pczsul80zW8ogG3TqHfoQYvGODBHOb
X-Gm-Gg: ASbGncuLbwhHajomYv7WdZRunkWfjkH2nLfYtEkzEXpkZiyfq4eb4jp+hRS7RAUMv/T
	kyQQMLbMZ5pPC5kgIaqzMdqpSt4B2FdI1k8rafhufUfOkOoHoERTbY8K0Z5y2KghnwwqmHfTSkl
	E43s5wiFmP7V7DCx4R/xA9bNBJaE1rSfE2RjOgoWqtSuBFjA3z+DfuQHofk/ZKlbLlQ5NoPcQAq
	exFaZH123PznzdmLqtsos6wa+8H/5XW0K55j4zXdxcARGEn2+o7E/xt8jPLLYMMZqE8VOewM14L
	maKf/q2g4vg8I85BcA3P9lcfW2E+gquNrY0NNwuQoU5dfjBiQi6aXGLbSkZmop2Z3vY7mZ16A1C
	Y1zbHpjEZ5xz0WtYW4UnwLRogpyzphWHK5OOlpA==
X-Google-Smtp-Source: AGHT+IF61Uf+7jyVQLbDjguFkflG7qNGvFKGa9VJbcmzM10P4AOV0pJo6kc07mp87QYBfIqV8TPf7A==
X-Received: by 2002:a05:6512:2247:b0:55f:4107:ac46 with SMTP id 2adb3069b0e04-5906d8a084amr687325e87.25.1759908708862;
        Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
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
Subject: [PATCH v4 21/24] staging: media: tegra-video: tegra20: adjust luma buffer stride
Date: Wed,  8 Oct 2025 10:30:43 +0300
Message-ID: <20251008073046.23231-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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

