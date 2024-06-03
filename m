Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0385512D210
	for <linux-clk@vger.kernel.org>; Mon,  3 Jun 2024 13:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421130; cv=none; b=uCTK51bqMg+zXM6mC0nan4NMMV1x4m4W2DYygVUIj4MUmNnASXOVvZ/k3MJhPigk+J2jAJ/KEYGJvOY0ejr1/0CM3qtOrukiefzZuC9b0ze9cnKlqDWjJhBZ4xZpLA47oxf/QTp27fG02fiY0E8FmUSsIw68Wh1alEV7ixG7mko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421130; c=relaxed/simple;
	bh=jHbFEWNzUZ0phj/jnjRR5KRXnUJ3RgKUe8Ef8YfiHO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ps1FgGVi5EI5qmkmclHtFZSKTmiU0qHBybtj7NCDxDNosKFMo0Aav8Zu6GUjDsCJ/oFJC7w0QeI6DeaWm7sjUi58FhWGpXzdRJimwzOEd6J7wJR538o+6FDkja+ZcQLVFd/d5gNZ9edF2w6Y0d0JDlZGzuq6kqNs+hOVWWlZ/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zbk8qT2v; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zbk8qT2v"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42121d27861so39097115e9.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Jun 2024 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717421127; x=1718025927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db83b7gtmge2A8js55gVAy2SLJKXwGxS2NmZR1LN6rQ=;
        b=zbk8qT2vkCjl64UqrZz6W5sPDqdRLNanv5CfA1L9IYn+GkZJa1zlonQ2ZxEFQK70jm
         92udH9VqMocARjyIwkzPTOO5TsY4UvlK6o+nHKspPgQje9aQsBtO7BzFSSUv5ous1gJc
         9l9+nxi9rkQny+zsAW3vKuVSCnUuXk1KsCQLHA9U81rAfxrytI3zOOPYGxNunE9FUZ2j
         Rl3MNZuC3b6aer0C4Q6GXB8uB9fmT970agwvAJHDiXNPDorDVrtGDrhd/wYn+JY+ZAf1
         oEobo7Z+R7LKBRL/ssYK26pTzhs8QjW7KAyAsw9ba1rqwGizsdPKTmDjT2XBeVSbyFlo
         NNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421127; x=1718025927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db83b7gtmge2A8js55gVAy2SLJKXwGxS2NmZR1LN6rQ=;
        b=qYJAXjfjsJwP00zm2BakyewPggRwIC886hopYfYoKbeMfS7xY7Kc3tr44xjw2rrHwS
         WDZPFtwNeFFZs+paplJs7feAeNobeyg3UIUqgEOo8mmpTqxdYDvuPNZxmxB3h+8dviEV
         3XM8+UInYoweaRAcBYqv196kdq4xnFrydrUwzvQSrducvc99XzYSoBcXPhgWmI32RV1v
         o8g9OvI+2Cg9p5YGdROsDZuzAkes8fC2YmBwkskL2lKCHMlr2lXW0GSxLFiULaPpLIM6
         3Myjq8F3uYCwxEpi534GSjC0oaiVtJzZzpqkiHVfifgnEIU6wgBMR52NyPl1P4eygsNl
         FQOw==
X-Forwarded-Encrypted: i=1; AJvYcCWkE/F9tbNtXGPoo2adGBvINmhRxqVNZxocMbSqbJNaxYnw89OSL/kyIWSmAb/nIsU0y66S/cIa6AZ3Mu+m2ujkap9N7EGbyqrH
X-Gm-Message-State: AOJu0Yz/UkhQZoK41BHBGuImGZ4yTEV2leDVqYBfU2CsgRoLF0Nu52TF
	1lryt+1f+KYQ0gv6q5mzIF4BFn0+2ZpqwnMbfz5vtIw3h/mXYLqLFT01+HJUpd4=
X-Google-Smtp-Source: AGHT+IGHeaI7RxPN2zI01909WUMu7NTmnnwuif16mRfbLRfurATUUS9YSD294/SZEB/sDpFHAOOXzg==
X-Received: by 2002:a05:600c:424b:b0:421:29d7:f87 with SMTP id 5b1f17b1804b1-4212e09ba44mr67922705e9.27.1717421127539;
        Mon, 03 Jun 2024 06:25:27 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:638a:e591:7142:7b85])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212b84de44sm117381195e9.11.2024.06.03.06.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:25:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Yu Tu <yu.tu@amlogic.com>
Subject: Re: [PATCH] clk: meson: s4: fix pwm_j_div parent clock
Date: Mon,  3 Jun 2024 15:24:46 +0200
Message-ID: <171742077913.140081.16988283160317117182.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516071612.2978201-1-xianwei.zhao@amlogic.com>
References: <20240516071612.2978201-1-xianwei.zhao@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (v6.11/drivers), thanks!

[1/1] clk: meson: s4: fix pwm_j_div parent clock
      https://github.com/BayLibre/clk-meson/commit/c591745831e7

Best regards,
--
Jerome
