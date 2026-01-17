Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAC919E992
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 00:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609543; cv=none; b=clrXCkkfhihZDosR2KjQanf0QhJ0Hv1tLcimtOUjnyDiuP7W5IJv6/JxqgT7y/64AM16sCkFTktXqrTAV8FfJk946gs9Q850OgF6BFd77OcVZm2TffJzQeCyRJES7PhNnalEh1OuX+cbLle81Fk5SA+wGfWwSgllCQ21iu+m3bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609543; c=relaxed/simple;
	bh=zMWrCZMndADSkg4s8xix2EZGPZMfvSP6VQAt0nAFJNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJx+C63Q+r7ex8tTG4hSMyI72Wk4ilbe74bidxLOAqnIMc2y4ShidMngLDQD7Dq15fL8DOvHH53f5bYPPp5IKmFhgNXadJ56JMdqd8e8egvq6xrLAawz6tEIhfHvSuZXhqLGN0Kg/jjT9E4nB/M2xbjfgMI08TopP6WS9eQ7M34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7qGEHfn; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7qGEHfn"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12336c0a8b6so5392761c88.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609541; x=1769214341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
        b=W7qGEHfn7+KVbeYkEa5SCSSN7O7DsBveNX0/+eFiqXIqsdDBoVHKyT33qWCG7HLHdC
         GgYAcvv9eNRD6QN74WoweNIEXlVd6u7Sg0kVlPPn5g8l5knsx+H2oTsxEAwUaY9qDT1M
         w9C+9HXJfG1ukyC7FaPzxr3WzLXDgFcxREbc5hGrkTNofr1vqpoAQSPVS+MI6xksoFwx
         p9FtRp0SLsYy22TdP0WeOhf0tfGWEH06mOEmldKFJUV8fO0ChV5TgirRZRd70QcISHdH
         psA77TBYpVwhM0hTMbVdxljABk6rQwgSXYnSC0rx1OE9wh1BvaX8RffwqNvSVyW+6wM9
         2aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609541; x=1769214341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
        b=Vf1GLZGraP2HX7xetzAo+KZAhnKAIwU/hTSJH2WrWss5UAWzoW2d+fXjktWOfoOqEp
         tJRGlW0CFGwBv3d7OYO2s7emnt/En9/oTF04D8Grqfruo0Zx9OY7/g9NOfuIHmvrFK5V
         zBqV3BJ9bUGT6gAYz5i1bex+yvR4wUGjLj3KSiUrT+VjD2CSiZTFfoLGwI+OkNFC0HMB
         CL+DDcUVnRCS2O+z1uP0lkb8bg7el8esBnLiKE/mbia2f4xE17eY5VgRmr6HVi1emWPg
         zZFE+ciKMK2V21ZS4SBL+lLQSVc1p0OGuDLP8ApZ1d2QdIB5jJGTnZb+L+1vCGs2IIWm
         DchA==
X-Forwarded-Encrypted: i=1; AJvYcCXwoaBu1/nYFmzK8ubhB9hqHQRC2/4ZASfDdtRJOWTUkYzJDYamOYnZGBdLjpbW8OZ8vHUJ/0wOeTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZKXz9hmD2gLNvzhhhrlpIDAAPdxCrWa/TO1YdNOC7uu1K2Ro
	vTk+r3S99NTrlVKho2hyodOWwbviRYuA5xJGeVjvIN2w4O1zmRX8nnZ5
X-Gm-Gg: AY/fxX4yGCSNEEVuzMTw0aPThi/M88S1KLf91tH7hf9361Kqqm2BLXrmgEep54QLjY5
	uQgNVi2Ql9x8QBHfrKUynX2xwZ7eQ8BxOtxHpnQS3v25KrHuRyAkfTnXC2WgLVaJfgM/6MXu5Ul
	JDPVLlG6xaq/5cQ9ZCO28f/urDgQuhsclDUkRCA99ofCUzM+rAJKVpEy+kUeoFdtfD0VdKJgluq
	8CDFZbFoTVvTulQx99Tb71tvuBSric+Hd6BXkj6IZiyK82R6InguSce0w5X3SWeLaxWTbBIobKB
	0E7MbQEaHALZ60SsnNXszq+BQqyGJFJbM3cOp8MrZG4Zos7FRoh/RYgc4IPUUOmgP3VVvjfbYDG
	kiGJzf98YEi2xyS1dwDwqTwSeluN2yzEjWxrhImUjRQlXxQFz/8pEVm1x+3Kiizd94CdFBwmIkT
	PyiGgsDh9DljPyDu+n8kyD89R/mMe013M6zgSdQTdpGTWGv2+D+CGUHcI54rueyDsmKGDBGNj6n
	A4UZC0=
X-Received: by 2002:a05:7022:225:b0:11b:9386:a3cf with SMTP id a92af1059eb24-1244a782252mr4273827c88.48.1768609541196;
        Fri, 16 Jan 2026 16:25:41 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm4287875c88.2.2026.01.16.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:25:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
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
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:25:32 +0100
Message-ID: <176860947674.1613073.11085159197676774675.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
        commit: d6e8b796d0d67699c74ee3cbc46601cf9ec925bb

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
