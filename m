Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F889156257
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303612; cv=none; b=PxwoNj/ww2pckzuQ9Bbbg4Ii9X0NSNkjB4H/9FKhYCg+s4Px3XmwxEHQkSdtLb+TifCx3dKZVf1NFoHrHtCcfvY41xJmpIs3ghKHUkfzx4AOcMAmTAnJGBOfSkzdqBNCZv5QOcUaS9H7ZdVLoeXbcsMorH6QD7W5M4Zj8cVwvbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303612; c=relaxed/simple;
	bh=oVc93lqqN6htEbKJFN30aoPnMJWeYhgqP4EzmUGKqPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=excMFtIRU+vJNzqvaqOO1wJAuMESpELPuM/wE3YKUEJdnbxOpBe3Zhf2g6m2RmYZfleGfjISUoOyQCc3QTpw45djXslSOdPvLZRIKpQiCTth0zaj8PDQS36+cosN9vLyUbfuGh/9kbl7hdcWhzipEEsJfLhKs77qCGgqzOGXHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNQIDgsZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNQIDgsZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso52352335e9.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303609; x=1735908409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKZLDmgXnxDTvedApqeYbhb4pkfn3581HbM1Qj4Qke0=;
        b=MNQIDgsZqxysvXFWhoZOnUR4KRDgg6o8cX2dDjAp3Er5jkcIngp61s0nQBSW0t8RtL
         nTtI+VOYlaGf5wDRLxAjnmAjRsFNGi3n+GojCkM+cYf8q2gwMbqF/fAblgD0HGOK+7c1
         /hGi9gCA3e3V7Weuaxs1hR1FIyF0tC0XkcwvD0orJzQQfzrujaGE8ZW3gpjwgWvOqZjG
         MlwoysvEufm+/EIwMLDczAYsZSZ+gImmzVq9yNionvWxP3ZXNuniVZiXEsbUjm7+BYN2
         IlnvlkpLwkD2lEjfCjfPYaJezbFdbfdmTwKvkNaJUEWDhbUoCYHkmQUINyXGNkQMj7L1
         I4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303609; x=1735908409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKZLDmgXnxDTvedApqeYbhb4pkfn3581HbM1Qj4Qke0=;
        b=txuCFRW06HA1mrfTwzlsUPoFaEYEXapb3ZRpKWYFVQT8Yi2I3jyL+tmBdbHY69QCaX
         w52yVa2eBR+IZs4k6RxqoAYqnWkfc7qDDBrORj3Qm7v2RU+XVt2f8S/zqVJo+8UBDwYi
         Xv3VSBBDACqLRfNu67k4eYGmTJsDaplho3IfFdD/S6xa4Oek8As1SCBvE2wnO4/Prux7
         x7socyAL5qaiMFx/IdizcNK0H0m8eY/XFtiC0FlG9zL/WXINbWcRh/SX1c5stEECT/v2
         FVd8leSiE2nahBgBbSLVyaVqPa4vx8MPg8H3oi1jHH7CIOB8Qr+uNz7toZ0rCKMlxmPO
         z5Hw==
X-Gm-Message-State: AOJu0YweC1NpNJdElrmQqjTwc/PvROjOWLUz9mJmjaConPGaLBaTmn44
	UnAEuxsUhut6vig4PR1eTDwSMk5AycUGXrVFN0LjqnKoAdndapxzYOyULZw4IiS++Kid5yvy/75
	G
X-Gm-Gg: ASbGncst0OLL7YsXjyIQ5dn/zO7ry9Cp1odXfK7wuvj84fSut8qvyUswwkxPB/TwXAr
	9heGkj+RVclkWXTpin/2cLPEDSDwFZ1Gdz7ZnaU4D2K2Q34dywTGw+ijr6WkaruGS/LuP4K7OF+
	a64mvVxPLjxwIWETv1gha2OAGbCfPXE2RRHYiOlKM3d+zGJJD3P1UJMq54r5oVBCQXOXdIZRroz
	vlO4CVTzqtsq+ePu8HExtB4ip9jKPvL5HysXPiL0UdrWYMVuflLW85P
X-Google-Smtp-Source: AGHT+IHUGw1dRb20Q7tB744vdpiCFmHJR9m5A9wf0UJHlaCM5WPSJo762Y4NDRosAM8fszG7xNcx2g==
X-Received: by 2002:adf:a3d9:0:b0:38a:39ad:3e31 with SMTP id ffacd0b85a97d-38a39ad4128mr6360300f8f.57.1735303609335;
        Fri, 27 Dec 2024 04:46:49 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-clk@vger.kernel.org,
	Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x
Date: Fri, 27 Dec 2024 14:46:00 +0200
Message-Id: <173530350108.4140483.17886635259126245579.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112013805.333798-1-marex@denx.de>
References: <20241112013805.333798-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Nov 2024 02:37:35 +0100, Marek Vasut wrote:
> The PLL1416x is used to implement SYS_PLL3 on i.MX8MP and can be used
> to drive CLKOUTn clock. Add 208 MHz and 416 MHz entries to the PLL so
> they can be generated by the PLL and used to produce e.g. 13 MHz or
> 26 MHz on CLKOUTn output.
> 
> 

Applied, thanks!

[1/1] clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x
      commit: b7f67545ca9fa13f6e12debd68a92c1c664e2e3b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
