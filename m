Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF97DA66
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 00:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609903; cv=none; b=fCOEO3yLAwqyTpVWcyWGc28CS+beQ+PdSrgCIKL6+z6Z6A3Lc03ZWxMJQJmutAp3buQGXoovOIlLVl2/wh+RVsfh4zvMt5W4gzX01TIzYAnK9kMpm0O9ezjYynWKeXP9i/k4h5kdRo7A5b7Mosmj4UCZrZJSfxWWhF6eWK8LPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609903; c=relaxed/simple;
	bh=oYQI2hBpIRcvGtuZTojZuoMSi1NBy8aQgzTCzObvMzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XEdRmMyiq1pjBxw6qxFEJnkpl6Mnpfj+vP8lA6+UPrj03bJPqqL3Erli14Di82gJB59Lhpo9wjH07ptXT7bLkLT/2akBVPfwCO72QNF2l+FCpyBGlqj5thpYXEk6o257mPOYIQbHXnbVIjKZgwyHB2t+2PxizTCorxaiIeZD/JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3wNVdwy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3wNVdwy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso17410485e9.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609900; x=1769214700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
        b=Z3wNVdwyvc69g3580tyf5fWfsc14h+xc/9Vg7PNDraGOG69INSVBA1CzQxPpB4YuJ3
         PKbJ2HX869tVWnNxczVuxy5XUMmrKH6RCTC74NzjWEyITJ8wsFDhSwVO8qFXS3h0nF9l
         zLlMXJJKycuP8R6ewUNsbElXbltaxzQP8B/ylWOmQA8B4ETt5tcgPQQS8iPBTAyRGshV
         y6qj+5YBywUuBf+KdejltrIIANh5VXj9HpnpopRWsjGMjwmUrClqhnzR5GegrUfbYKUf
         EH5Frf4yO93if/0XcU64VQiyErG2KMsxhElv0qzt8UDUcQ+yUMVwWYeaxNCTnnpLrYHq
         Z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609900; x=1769214700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFv214rAmnxy+ZWfqYzxoI4aXe7hA3FW0xG43u2wRxw=;
        b=Mq6V58MPL6A0BEpvNhXQ4UbfSIgzoRrp6neZbJaKu5cZVzLGAVJtkEuGq/vlvbhZa+
         1eo4EJoTOA7FoTVCSl3zwHceMwtyA9nRcBAyvxQnVdCtfXLXVIlWC3BGwXEwIkLVeNys
         yhe602/24ifGF1uNLNVFxjug61qQJOGFP7uf0rW3r3fCzJ1wLzrOZBBOSugcr4CmvQMm
         oT6koWmcyoy0SNZSQvCWQNgssKawL+VmvcmdwfrO3kF1wP9cRqv2/QPkeQRg97LQ7tya
         QsRgmOGgrA8f6UYh4wvV4bq5cwBkv0+vkb8odkeRHEEdA5IqoIiB3Pih1xHwY2wwwR79
         S9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVOJcu/j47L2chFixbjD7OEDfMtcZiGv6EiHXATvQRypmjO3THwVX+omkUNobPK2nNqzzuVXii9Uy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIR7cXLpHwbd09koJDRlW7nq+lRDAiOxFg9DQeqI1Ztu4RxEy
	+JbrhNL8f0xursGANzDdP1sRdDxL3iwgnJw7/GCL1pHxogBeudN2SMMW
X-Gm-Gg: AY/fxX5cYBcvwpe3njE/zw8kiR3JxQx6C8+3f1v+rAuD9nDwaHQBmuyYaasDZJ/FTfl
	/rk/NWUlO9+cbttPeuKPjjzWYPcQWnsOhSXt7Qm5BHladFKq04YBQshAXJr4/AQ//ytP5IN1yhf
	av8jHzsxB+qEpGbPbjvR2e8uhiQN5wIgBp1Kr4qVhK2adDUVr4EeXSGUjVYR5rvbfmk1MGMWLo6
	DrlW6fHrL+bQBSMjvEM1QKXqs4lT5og6k6hP4pH3Xt6AcONnC91rNCGorbnbv0KAk9YKSe+7FW2
	fAbezgzeosrrhp1DaDyUsRVtfCHGdXgiXLRjO0D91tQ3SqJ4WX9Q4T5pVnukFP+G4f+vfv6XQ99
	bMaq4/weHAkOazQG06S6pCfF+CObwYiSES+k+UuvUIax8Z9tFNgO1O4RnHZyuKR4DQb/fTehRtQ
	wCOhp7kOaLmY2c9ciTwb5iDmLFYSQv3k2h20yaeQreQpLTdi3/fGRyCZNuHHKldGfcmdxj4a7JE
	hJUk/g=
X-Received: by 2002:a05:600c:3b9e:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-4801e2a5861mr63784045e9.0.1768609900200;
        Fri, 16 Jan 2026 16:31:40 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e9fb193sm27730315e9.6.2026.01.16.16.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:31:38 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:31:35 +0100
Message-ID: <176860988748.1688420.11717122647073678.b4-ty@nvidia.com>
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

[04/23] dt-bindings: display: tegra: document Tegra30 VI and VIP
        commit: d262d030baef287da33344a932639aab5f913c3a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
