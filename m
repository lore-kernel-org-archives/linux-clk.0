Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F11922CD
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720615267; cv=none; b=O+IkDq8z5PYwKzLrPPiL/hXPYcawfYUTiZCYx5BlLg337dyr6gomdzEeoHZB3V8LAk6sz//u+pCZMtEQPILOJx9d6nRIIn57u9IylUPdWFtRDRkZ33zrD1HOhIGzKSNXxmuTWZnWnKzsXhqf8O33yvcLF0FaTJLUcMYPCg9Uzfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720615267; c=relaxed/simple;
	bh=Ool8JEcomupLYFCAVUceeyirLvgRl1G6dqSHkrYH0y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i9465dftGrdrzbkMrp1zk2/wm8/InsqZesmfxkug3ayCdYwl6QZGf2m2bQDrVb27nxyQs9KDP/H4KgMATh7gBKTOl5QfJDcwip4wK9eleOXcx5DhGGAU4v1IH8F3jwXxFbzAYuyJNuRolVqlByKQS/dLaAGJdHjhm28qTifa6+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gBKxwxnF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gBKxwxnF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso43325025e9.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720615263; x=1721220063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQLVDFNoFuKRZg7eJdxMfqN4N8nKsyXTgSDfnf3uLGM=;
        b=gBKxwxnFgp9AOzK/2lb/jr8A/NhFbZkPUvlg5TH0mYbtG80V2yXBxIIGQvh4g7ceFq
         /p8TADEAgk5hHMbeU8Tukh32d9OIGqzZmfx95mc6DLzqR8snLBQlJQCAs/BkM6qpK4Hp
         N6T2dw64rhaATV3XQn682pDmYgzZnjOyUe28zGdBZk9rtBdEKvAwBxUwtyxngbHCS4QR
         zL2fucGqKtrty8SgITaWWyVyRhze8rY5iLuZ+Q4jsuVNssqLydBEXXYq86zPrfcvVZKI
         3rTFR/GdzADTnvoVz8gMZo3ox3VRVv1SB7RBvQfcFu9D6CIOG9HqeYx5XbK+gFgGgdmn
         u7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720615263; x=1721220063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQLVDFNoFuKRZg7eJdxMfqN4N8nKsyXTgSDfnf3uLGM=;
        b=gzQlLKDx1Kw42rkAIniOmmIV20q9mNFL6tSxuC3m1j8nwZl5hvYo4d8BMz3qaoAE5z
         d7pUN/dljzF1PtbvEc0FYotmNHVo5+Nty4rPjmb77KDHPcwCkGR+qXd1GcvSShNQ/akY
         woZ8zUs2yvfDTpaJBSEj+JXxBznBV1enF7FO21fUF4S7uRKGLPFpG2UTob4/BbH4bnl7
         CZuFpTrOXgizYudBRSEAoeDRoIRMqPrZ76HfmhuBNo8prxsB+3idtifG0Rtj5tBML228
         U0Xc7gR7oN2M+rPxi3zWkaVAQ02IiLuz9qpyfbcOVZmt6rrNp8CWr/9cw/OOOKsA+Awc
         WIQg==
X-Forwarded-Encrypted: i=1; AJvYcCW+h2k2mclnxu3qnOsTFu5GwT4Ql/62TlkyrWWvrHnygJR19meq+tfPqdDBddQQtbrBN7jEasViY0BxmiFfbOnrw+xZ2EWzZbm2
X-Gm-Message-State: AOJu0Yy826oAI9IlV4d6jnU5fjKyz7+ZXhXU2OZGIJwhkbav4GVVZ9aG
	gfhcuVLI7GEltRguMltHlrjk+bq3b4dQcqiT1qlh+PeJPNx5TXanhhVTztLwXUifkKjkAS+/wlN
	VR8k=
X-Google-Smtp-Source: AGHT+IGT5ilXJSn/KNzsrB9+RCqhsbkJiqU3dqpEBIzoFB+Fcmer/Kih8Fhroy2GBRX27ac1gAp6gw==
X-Received: by 2002:a05:600c:6c51:b0:426:51e8:5192 with SMTP id 5b1f17b1804b1-426709fac0bmr30666695e9.41.1720615262749;
        Wed, 10 Jul 2024 05:41:02 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f3cc:df72:f495:3b49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367cde890f6sm5214025f8f.53.2024.07.10.05.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:41:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
Subject: Re: (subset) [PATCH 00/10] clk: constify struct regmap_config
Message-Id: <172061526145.2117005.2499091095196670705.b4-ty@baylibre.com>
Date: Wed, 10 Jul 2024 14:41:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

Applied to clk-meson (clk-meson-next), thanks!

[01/10] clk: meson: a1: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/4a7665b885b6
[02/10] clk: meson: a1: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/5c6ffe3537d5
[03/10] clk: meson: c3: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/af3e4505e6bc
[04/10] clk: meson: c3: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/11c7c1b94059
[05/10] clk: meson: s4: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/02cc1df92d75
[06/10] clk: meson: s4: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/3d0e8b6edd6b

Best regards,
--
Jerome

