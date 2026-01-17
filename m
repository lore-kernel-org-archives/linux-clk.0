Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A776A33B
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768610024; cv=none; b=PHJx5CzZOJ8yUchIaQ0dYb26UZQAGB6wKxGcCLueP2ua786qrOazfDbJYV8gg4Dc0MQsUUPc64wwddunzzr5+XxZjccvs7puyErRJzjwLP94XPbGWCrZ+MlyBjY/9vMwzO9bGefJSwh+PIzH//KVrNO3gZucHLQBB9+wgytWZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768610024; c=relaxed/simple;
	bh=S0dSLB9PPtlW4v3x12PKUIXk9LGmp+kBGNVfXeGVVVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ERYZdqgy2EKAc35EWoC9W7nEq5Q6mhhUd8av0CWIKFLXQfuMjPpUaQYrPkFEA4ItpTahrdAuK/uJHlIkPo9Edq7GG7LJpeec4ZC0BMUH11i/jz6NExE/rLrl4Cm8D4G6tb3E3CJH0JxIHNfR7vWqh3rAnCRDlf+HANChRFp5bb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8pffeuB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8pffeuB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso17415205e9.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768610022; x=1769214822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJpxx4+wHYsiEOlQU+E5sFAAvHcwO1zDtrt605GkyxI=;
        b=j8pffeuB3hAu7ieM7dIWB6DMELJjs6/4IfZyJsXiH+cvtGdFZ0lf7n5OEXpOluZH/k
         II67TNHTQSBqrtbpeuSopEZOv19EpxQbbgKr+TrTPJG8VgUQMOAwsOM4SG8F9XL5MzUy
         3mVx5V8hlOllIuQWNNfPhhHop0sORQDdP3GtJK4o0cXq2UDNc4s/mcCvEo3uK7x0MT3p
         qMOODIUhvdWh5wE+szjEQioGmTlCLFst4Wfci6RGoa8VjXNYApQQdV61X0eVnrUkkYdV
         lDaSIXrWE5lU5tMHv04U+6qyX+p7lfNxf0viKrF1VEJ69LFIk5iykCD+U+q7K9qPw9sY
         erWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768610022; x=1769214822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJpxx4+wHYsiEOlQU+E5sFAAvHcwO1zDtrt605GkyxI=;
        b=nmhQTPl/VQ4fG/+mLHe6ZXN7NamETG0xTIsnDvtd6SnKW4b1yBTJK7UCM5WF+gx3yU
         d8ma3BRZsMD7E+Ug/6xoS1mrpIdxAWiz88hYNxfyRnu0bDzL3T1jFIDZ70vBpXdM37tH
         WrylC/m94na6kdXJclvaVBve/EAtDRDJEu+M7w+IpUwGprflpxE0cLT3hSKXe2kMNJfM
         b4fYRObDwjtDPfCSn0PdxPRGI8f+fbgRl5Ix9dRNBcSI98pQj6zITmW5wgvEhupv1SLu
         UnsQ0LPYCBF8cCVkbIZ2tomwPJkBByfony1sWJhIL4od9O74GHoQfN6qOCyVGHzNinL6
         wGgw==
X-Forwarded-Encrypted: i=1; AJvYcCVwhrZXYij4sd28vv/xeka+gAdX6en44q7hIw19fqlT+ND8QXo0Be6/MixobXpE5akHFYpK7SMkxio=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmPry1FANupOvtx+VgnBrkc14DUMrN+VbaahvqT6Cb14nzNMzu
	7/sDReFz1/FPc19D/3gY8F4zEgmWWtdk3Ahu7nddkrm2iCrUXcmd1BHt
X-Gm-Gg: AY/fxX73nQxeg9Ft4raNQnctdjd+1u+oFgKAeapTHSmMfnud6ZXfvVEbaAc+bSEU0KK
	Y4Gd/sggbYFW/R3YYen/u799pbwXrmdYAE/DCt9nbaRSBvTYamBHmnzW+izEQNAaG+PbnjZawqn
	UP8wUIKIdolfJUzcDoMRVDtwPnoosWM7y4tMe+OAwLTHEmX9WOyK8G676Z9wswK5RyrkIJLznhi
	BqIlov0HVcjJd/PvLhB+/YnRgzqHLNAVKF3/sbb7jFFtccmHOzopee63QHEhsLSSBmgcPYdZSbe
	GkbJXezWCFkN/8kNFPjKOemOtAYu/tUbVidl2BLC3PFyZ2DA34h7CcYtPTtI+KnX3sydk9m0kpr
	ILHK7nbk9aznD/N/oejKNQ/oBLj7Dn53XW3oYRfOPCvsofGmhuH8aO6529bRtiS9ixKl3Nxtb+Z
	rNfm6d0wqQnFRU3z7xHMz+bUJEhHqGTUvfbH8j/fNAAlyFxwlfmsvYvPOwwUKia1ZvPuNKscO/8
	ZZ3ALQ=
X-Received: by 2002:a05:600c:c0d1:10b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-4801e4a38d6mr42472145e9.4.1768610021605;
        Fri, 16 Jan 2026 16:33:41 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe74987sm27997325e9.8.2026.01.16.16.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:33:40 -0800 (PST)
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
Date: Sat, 17 Jan 2026 01:33:37 +0100
Message-ID: <176861001038.1704662.1663515837927668217.b4-ty@nvidia.com>
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

[03/23] clk: tegra30: add CSI pad clock gates
        (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
