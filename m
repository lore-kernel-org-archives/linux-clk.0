Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27982158D99
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712738680; cv=none; b=QQRkujh0y2YNEEeJkZTTklMC0SnH7Nx/z6Ajcc6+4xahrkRS5L9ECCc25GWsyrOyhdzDFtjNL5NkqquhxqDL55XWf3vpRZoKbPYwJYey5ei3ZzXZYRWN+nanwUNERoyHF/ycTlreFeqoh4yznv/VeJIizzzIgK/huQZPFdmJ6hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712738680; c=relaxed/simple;
	bh=HLM+siIzI9gfsMuMCjbFCwclreaT8/ySNQbMMaZri2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ecNtC73hs4kWvrslwU+3cpmF9BvdPIqH5D8g8pU56o5dSXojSgFHxbKcRemo1Rxj3iZdBB8/FDvctJRQAbj7evCOcf6kuBYaqKBIOxX58p0XHWrlAEsVC6bqI/e48HGxO2c6fiXOV4ct/H886hbkR4W43OAxw3HHmsfJ8lgQsFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SoozskmI; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SoozskmI"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516ab4b3251so7372070e87.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712738676; x=1713343476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL/hejvPD3PbqYhLtjIKj09ojZVksO+lKOONb6rjF+Y=;
        b=SoozskmIwmd0XLG1Yzd0so5rVJekNiA8f+RjH31FwytRx3kAH1deufV/w4iD8VURt8
         RXX3xHc2QYdXDQ1Ff+ajJ2j/v8XlKyblI/IKE76ovcMOsdj+0PzOnIWs79bm5WcemUfv
         uKo5gd1Pxesj8ftB6eTDKxFn8lDP9khlRolh9UK5GtXGaIRvDl7DX6gyKb8N1li/MjKm
         7lRHZqdt+6HkmqfFiNYhFbHOmMFohaR+VoAylsfHYQ0SPkNPtblAKiIlgYqLBrfrZ7Ci
         tjShVNQLuQUHQpDnWFURaW7Wi1rVkLPVdNU4bMMJC3rInfG5kL2ZCpCnrt5WEtOaLM/m
         uqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712738676; x=1713343476;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tL/hejvPD3PbqYhLtjIKj09ojZVksO+lKOONb6rjF+Y=;
        b=VW7l9SzpTlRdEPCQDY48tCnlK4Kln/eSHawsnI2KGKfnF0i5Lke0tnvSjSD3GpIVmR
         ILjJ7HmKCDasy5CW9BMv+UDqdjLxhXKuC97t3uGH/qkCdxVsyARX7cnenTg+F+8edFdR
         C8IgrkZyYlvn7crgTLoeVwLPG3rW1rI0k+GjStVno5EM2Tc30Im2mqkdxBDfelc1f9Ys
         Kvwf6BizPH7Hh26FaYEcwLK4WtpWXvN5/RYWfTvRSM89qqoF/UL3XTxJu2tYYQKnaFQ0
         pM4AaFc8ElCkzLYyqofcLTghoVpMDKwfsZbEmlyinV8GA+b/cXJ0U3l8CpBzVhd8zMvP
         F0rw==
X-Forwarded-Encrypted: i=1; AJvYcCXSnStTPv2LogS7gIHfi8llCKj72r6aTqMCamih0vCGPar6U3tPBEZqUo+gWkNJ3b4/dc9CpPB0lVLfRxCi7GU6Erco7rZX/QKd
X-Gm-Message-State: AOJu0YztUJ8a0buOYOAHzGo9SCw+lPJs3t5kBlCOBJPrWOEtajYw1Ois
	0hRsaeHpAiRDrU+4/5nNKxafvyckaHZ0Gs7lPMntYuTVhu9mRWclFWZV/fHQ+ngfeche19p7JAp
	6M+Y=
X-Google-Smtp-Source: AGHT+IF0JtJINjE07BONPobTqgkLaueGpS6HMGL8AwC9YGgwC7b9srjrGwJa1zSxM101ClsmVsldRA==
X-Received: by 2002:a19:751a:0:b0:513:c757:33d9 with SMTP id y26-20020a19751a000000b00513c75733d9mr1507262lfe.53.1712738676249;
        Wed, 10 Apr 2024 01:44:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:49de:129e:d25e:c803])
        by smtp.googlemail.com with ESMTPSA id t1-20020a05600c41c100b00416b5e6d75dsm2066078wmh.1.2024.04.10.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 01:44:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240408-amlogic-v6-9-upstream-fix-clk-module-license-v1-1-366ddc0f3db9@linaro.org>
References: <20240408-amlogic-v6-9-upstream-fix-clk-module-license-v1-1-366ddc0f3db9@linaro.org>
Subject: Re: [PATCH] clk: meson: fix module license to GPL only
Message-Id: <171273867547.2243434.4736877056369076935.b4-ty@baylibre.com>
Date: Wed, 10 Apr 2024 10:44:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Applied to clk-meson (v6.10/drivers), thanks!

[1/1] clk: meson: fix module license to GPL only
      https://github.com/BayLibre/clk-meson/commit/e0892cb47351

Best regards,
--
Jerome

