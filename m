Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB821A5A2
	for <linux-clk@vger.kernel.org>; Sat,  2 Mar 2024 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709402890; cv=none; b=WKcBM1hXzsHTuG4NMfi9Nu4wrhCHy/y+IdBYk44K1h7yZqONykSF2NjbvU6vrBnrvpySKGJAyI+jUjX5C1bdHLAgQ3eF1u1CipheDhNgP4mFlgsUbOx6SrcSIkI4/1ZUGqiJuoZneFzGJmUUwKRHpCj6lskdVoDBzBBdRVISEo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709402890; c=relaxed/simple;
	bh=9ehYOdJ1WKxeEsu3TjXulCHO8H7sfOL9hDGT0+rkSnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IUoeOj7hroS4U5AfuZB0zRBFZwTqqDYLb4rMWbaVR8iKVXHxjHAL3OJkiOFcxrqOaEFRtrPUC2VsWmll733/i7WDIFJxQjyui9ER6JLOJ0QfI83Cyo1WRBCTPQWhjpb/9MzPUAkjbLJgP1YAAb5nYVdZIhpIJ5p+I7P3TdHnnpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LLmVXcgm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LLmVXcgm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412d537a91bso3578945e9.1
        for <linux-clk@vger.kernel.org>; Sat, 02 Mar 2024 10:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709402885; x=1710007685; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLF4zBiiy5eYRgAOdWp9waqGpl1ho9XW/EYUvyzsnOk=;
        b=LLmVXcgmYKMXNW6SJAjGZQVeVyzrl7jWZ/JW9/3Z4Tb0c7843ytRyWkCocnAxN5rru
         /++pMzex5Ff1xGpgomHTg52zYSBW6lADv7GufC0qE36hAN5iTOmXPwmKMG5LR7Lhx4+Y
         loskRxRBY3zoArKUyDulou7A1iCfJf9zTxeZImxoE1v+tJM01+eDlhvFFPAhG+oIKTrf
         zXaV7MrLBhxa8MNmGL3xMJy8H9V1ddhTba72IvHPkmgX7PiebgieU0jA3LtvFGEmg+Ie
         hNhcuWz/mpaYouOjgg1VCQAl90Fzh2BU+AAgJKnKwC2s4HlOKXs7U1XkSAeIjMSAvY76
         k2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709402885; x=1710007685;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLF4zBiiy5eYRgAOdWp9waqGpl1ho9XW/EYUvyzsnOk=;
        b=uuzaWI5mRmlfOEshzeBMli7PPGljb/IPuzO3MuUCVftO3O30xiZjBSV0VW0Hk5hklx
         NlD86vDznV6XtwWlkhDPjQj+biSJKQm6oRDL+OWnN3uYn/6zSuhiduOTlnZSb1cGsIQF
         MhIw3+7q1GLTLR5tjpGEgY1YK7glhaqoZGjliq+ph+/JM9jt3YV0Kto03JIRbMbkXwxj
         da9cxyg/G7dmU62uaUw3K+VjeSoGAGbZcFwQpmXKEyxzWM8Otf4Hass/DAOE7qMJ/znM
         5yq3nVaeqsfUsr1so5WC8ce7g/vdzC4W6SmztQIaqaeArUVZlZbn5UJiD5bAgL/Jhm1A
         CLHg==
X-Forwarded-Encrypted: i=1; AJvYcCUKUU+6QKuFwTPySsj21+iEatsKsTnfaObFrWtH9n3seRxsX03a2aMlnuSs0gh9szkNYv6AATfuvNKCM0gNIAKw5MGJsP/3O4hR
X-Gm-Message-State: AOJu0YxYjnRwLahy5kIJQhgdCILyJLXynDbP4oyDrZU1C+HfFaocN5e8
	QgPEzJQs6o512ejH4FfiaZniIeJnX8AM5oLSnidxKtV9lbkg/B01SsK0A9IBXyA=
X-Google-Smtp-Source: AGHT+IEbL3jTWkPW+uo1Ej4/lozCj4JVhQZyiD+Ne6++oEHswf94tzRS6s3mj9W8ZGpuyzV3P3Y73A==
X-Received: by 2002:a05:600c:500d:b0:412:cc3b:dcc7 with SMTP id n13-20020a05600c500d00b00412cc3bdcc7mr3266201wmr.8.1709402884509;
        Sat, 02 Mar 2024 10:08:04 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:605b:c894:d600:8038])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c4f8600b0041273fc463csm12496889wmq.17.2024.03.02.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 10:08:04 -0800 (PST)
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kevin hilman
 <khilman@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.9
Date: Sat, 02 Mar 2024 19:04:03 +0100
Message-ID: <1jle70se0s.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here is the amlogic clock update for v6.9.
There is just a single fix for an Oops happening on the axg when listing
the clocks through debugfs.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.9-1

for you to fetch changes up to ba535bce57e71463a86f8b33a0ea88c26e3a6418:

  clk: meson: Add missing clocks to axg_clk_regmaps (2024-02-05 10:06:21 +0100)

----------------------------------------------------------------
Amlogic clock updates for v6.9

* Fix clock listing Oops on axg

----------------------------------------------------------------
Igor Prusov (1):
      clk: meson: Add missing clocks to axg_clk_regmaps

 drivers/clk/meson/axg.c | 2 ++
 1 file changed, 2 insertions(+)
