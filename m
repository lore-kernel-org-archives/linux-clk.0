Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410E713BC0D
	for <linux-clk@vger.kernel.org>; Fri,  6 Sep 2024 07:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606679; cv=none; b=oljaXqPgpJ4FNNhoQDMW92A6x0ia3DSjUKGVjTxig/IK4dHGU1IUxftpNREm5GpP8JuZAcVvUkeWW45S1YnXPZiiC+X1+4XtoBb+daHMd1PJ/1h8nF1H8rt9bLzEZ/9C+iuXGWcC49neLgfo/eUpTuOeWFgvx73cYli+GemV02c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606679; c=relaxed/simple;
	bh=MAXYm/fj1yP8lVOTQpdtw+CtvCrS1ey6DECPR81Pfik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c9ZxhGZcMZ9meWoLCdKZ/E0Omz27VySKwzWD5092Us6QX1LIA/mfRQxX1asvvy3fYDfboyqHPxlYF5PCqonQuSfXDsDxw+BMV5Mm6zgFWaiSeFPqd8XqCXheJwrNepCNTJeu7HNal6zHlyXS6OJ+idMBmhGtUOlntP+1Egdrg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Gg/mr5XL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Gg/mr5XL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42bbc70caa4so12588365e9.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Sep 2024 00:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725606676; x=1726211476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBb1m70RMv6UJKegzoNSHZhoQzpn0mL5Ktd2C9pGgiA=;
        b=Gg/mr5XLF3GDW0gPVc31C11u6SPMeVJhr2sjpcyu3NtoYKSpr4dJmp3jNFyiYn4gW/
         WRrsH7BUK53WJn+qODNRiGsCVK/rqvKShVq8L13NIDFNnc6GwMJXV9r+/b1zdxx1XK0i
         T0hL2k6Ny+ovoNZj2jPchpGaCIjFEfvFj+RLjciVjiutEYU7kPpTkxix0wfSPqt8Prf/
         NMmVONswFxFsxEElbENi7MzHNMQwP0P1+nPaMnFV493HxA2u5QKLzFTTlmkBRcJBdI7R
         L9+87xqPk1BIpnuRXR2oyPCX3wVooDt/AzlksHT7QRwI/JZkttHUOr5lCfuzKnpIAuJH
         y0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725606676; x=1726211476;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBb1m70RMv6UJKegzoNSHZhoQzpn0mL5Ktd2C9pGgiA=;
        b=hafnkLOXTrAqEeCnv65fN2V0LpU0qapnx5h6hkdJmwLazPpgG/QO7hFHhF9CrplyE4
         VOL/J/XtRxMO+303gRd2x/SxdvwhYyF2c6q6HcNmcEXpJyrYGMxbXJz+Eed2G0yUgFLC
         FWvP/wKAkieBvqGgOIz0WLUfxE8B+rWw9LLFISe+Z//8ixCiwlaDhla3eiZpzDQiSszz
         PXxhJEW6qLPCoWtEUhf4Cq/5jveBoxAPmEP4SJ361Ti/a3LJV8ezjtMPisU5RTT4QAse
         NsshUhu7AIK8liKCRG6BKT6kI6VbJiSroPdD7GVA9nr5TZk8A/1t5CigDPOfNbmprRF2
         OQdw==
X-Forwarded-Encrypted: i=1; AJvYcCVTN8pcyVdyJHimWZatblHSqapOKbBy9EkMqU3nOMJuLi3Ss2NBwvqGRDgaJjhDh9IKvxh9/bnlYqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDN3mzT5BW90bi+ormpnBQpwVjJ9e0pegmLvyzwtC3NDRdOri
	3Ot3vPKFnKOdqcE8pbsY+ir2R38u7IYhJo41c4Yt6wWrsDwigIKp02lh6YZHYks=
X-Google-Smtp-Source: AGHT+IEqdAHSLSbZ7AHGnt96PMoqalKMoCEpht5Cea7Y/2LmhbcK43F8Fn45vpBv/QCzJQC9a1kDYw==
X-Received: by 2002:a05:600c:154c:b0:426:5416:67de with SMTP id 5b1f17b1804b1-42c9f9d7059mr9170495e9.30.1725606675422;
        Fri, 06 Sep 2024 00:11:15 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-374ca94e002sm12596485f8f.72.2024.09.06.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 00:11:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
Subject: Re: (subset) [PATCH 0/4] clk: meson: Fix an issue with inaccurate
 hifi_pll frequency
Message-Id: <172560667467.2965402.16362697378487101558.b4-ty@baylibre.com>
Date: Fri, 06 Sep 2024 09:11:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

Applied to clk-meson (clk-meson-next), thanks!

[3/4] clk: meson: s4: pll: hifi_pll support fractional multiplier
      https://github.com/BayLibre/clk-meson/commit/80344f4c1a1e

Best regards,
--
Jerome

