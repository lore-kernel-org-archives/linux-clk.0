Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4501F12E1DC
	for <linux-clk@vger.kernel.org>; Mon,  3 Jun 2024 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421129; cv=none; b=raGnzFjuZHtev5kn3lLye6P/H1troQdL76TwA/ZHz3LIGkjJTXoIBeSqkzDEo/k/M56xhOL2gTv1Fg4GnqVOHJ4nTOVpMbrboIh3BEWuU3kSDMu9RneToZf9JPP/V1rjTR8T9ep1mpXyAIb/agMvtIAa+SAhFEskousmIV+x2CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421129; c=relaxed/simple;
	bh=iELaW6UpZ0X+bfwPhQtUan0LM3FgLiyhDq4yW47Xm2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4pb8wvV8dRieofC2ecLffhCFteGKSS8OBtX34chn+q8g7bQj5njP9eDLK1fqOcXTUvYV96JC779PctenimgVwT7bSq0dofSwJH8sffYscvPpzNPP7I+7PMQRsM596xCPvcVkBPsTEENyflIUt+TrCvIOLiUOJmkbQvMXwD4x2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vMFfFVWW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vMFfFVWW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so24941415e9.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Jun 2024 06:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717421125; x=1718025925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRe54a93ahgd4EPoCHEhwLJzVTEQQXrct73Kw8IiENQ=;
        b=vMFfFVWWOHmaxxAXq8ToxeF/I2Sfc6xIFISP/WFonG+n+duXQysQpzU/v3zXWCbLj4
         hv6mmqvjhaBTnJOsL0w/1Kuq4EwVynA+65BC/qaUc9CF9dR0RQRWKhvEuLds65zTAHWO
         M20IcHxZh+i+dvljKM3soBveantpaB5KC2N1HFOtDAcPu2+CallavM0jlNbAuJyoCqs2
         KAZlt85Eh9CxImwQa0tKagiq4X8PUf1SkTwOb/XJjDMQlBTW6W20mr2VcNEVgoi0s8MV
         Uf3FcFGILmuVTmrpJZiaWB2losBbs4ygMr38EgLiGWxQQ/W4E1id+r8j9gCJTV6ZY4+s
         s1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717421125; x=1718025925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRe54a93ahgd4EPoCHEhwLJzVTEQQXrct73Kw8IiENQ=;
        b=fSn//yEnZxzNItP5q6pC3tvNrG+6WhlG39iaXcXXMdvDos7Q5MQVQulgK70m93Wej9
         RR2w/yrGtUnQVhjkMa6xvpWlBOZ/C3cHUGh7UhP2/icfbycOxBvrlAgelllZpZNoNH6V
         c12W455SbxC9GNwnI/+6x88SLhdisOtf2OIyz+VXPbCrfhSo0nFshZ+FYw4b6gMMOwjX
         15sQHC+AS9+QTnKVrwxJdeucNsW71hVHUSlSIXdc2gOObtVQI86y6xYbAF9+k6y5VpLy
         ja9B6mUS2O6KcOwwh1cxa7mcqp9h5ehushc8SAt1Qi8jx2eIB1SJXVF+MusfMhQBOw7p
         wJfA==
X-Forwarded-Encrypted: i=1; AJvYcCWrAMRyV6Q1z8Uz1EMc9/FwJtmh6lfwnj7vc3DepIMt4SdM90+EeX+41ep4O5FzbFUVD6pFLgZ5nwC7JmZUqOQebxJwJxvIf/Vh
X-Gm-Message-State: AOJu0YySY97Lb74iKQX2VSO8D131DvzEvAgAyAbWO+c+7VSMpMJ6Gcul
	lfhWI7LQVf+WSvTDJEBAMDB/iBcuL+qyVsKm1eb6npWxWpIPp6F1HtqBFv+jfsM=
X-Google-Smtp-Source: AGHT+IFLEN7Kw3Ie8Yzd2cCLNqlgMqANvOY0ptXyI3CXaA1r2wfTKpMAgXZ0QIY3SdFesSqXOePBOg==
X-Received: by 2002:a05:600c:1c03:b0:421:2b2b:c4c7 with SMTP id 5b1f17b1804b1-4212ddbc8c6mr73327305e9.19.1717421125591;
        Mon, 03 Jun 2024 06:25:25 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:638a:e591:7142:7b85])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212b84de44sm117381195e9.11.2024.06.03.06.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 06:25:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Yu Tu <yu.tu@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: s4: fix fixed_pll_dco clock
Date: Mon,  3 Jun 2024 15:24:45 +0200
Message-ID: <171742077913.140081.14785575209725989169.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603-s4_fixedpll-v1-1-2b2a98630841@amlogic.com>
References: <20240603-s4_fixedpll-v1-1-2b2a98630841@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (v6.11/drivers), thanks!

[1/1] clk: meson: s4: fix fixed_pll_dco clock
      https://github.com/BayLibre/clk-meson/commit/c1380adf2e86

Best regards,
--
Jerome
