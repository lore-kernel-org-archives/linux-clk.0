Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F9F15ECDB
	for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2024 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722272595; cv=none; b=id7pz/g6O9lgE52u6JoYdAZRQzp3ETFibUWjLpzcYAsG1BReZlLSOlblag2XPDT79C9LqKLPupcEksEaAv8WLANtRcV37FvfySga4J1dccfE882mB+siV7W36eYX/McrcSbHRC3IrtsUdXCWc3paZclUGWD/wFciSvn7KeftUzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722272595; c=relaxed/simple;
	bh=UHVNvFrTrI5pqn9bcN//du/ZwIV/yuivfOCu8/p0nUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QP75BeB9S6RXLmeoYyp5XaQN+RbUeR2YhYlBX+kqPIB3RIsadCWr0v5ZaNobF1D6VsjrqM7G4k+0DNy0qHaherMlquL2WojdkClJT/PcEpp9VJf997kq86iIFcw0o3lA/E4fjjLwfMFtNy/JWxXEJ6KWhi/6+pAVEhds/xmkuBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zmPT911L; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zmPT911L"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4280bca3960so19164005e9.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2024 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722272591; x=1722877391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY5TOx2hRF+eF5XgzHezi9Eadz0rgXiadgCBpJMGjfc=;
        b=zmPT911LMxADSPYsIsjEhWaLxBBnU2o7+PvVliShMRLcz+P7FKec8KNnPasQSQQwJA
         CGpqJsZZuUzx7DN15jkPKy/DzU6LVTvs81RWzNtUb4yYB3YxqpfjsnweWcUdXltrw+zs
         wDPfBHgSvttVbiA6quxcT/yBJdIr5APbBn5axLVJv6SG1YIrLbYAWiqtVJmB2hrBVNbH
         aQxS4qqR54AwrA0vmbYhF3eCpNkZT4RMNN1++iCGAROy9JFXDw8Wno+VmeFrExmILE+l
         rMy9Wrkz+dYdEWd/VS1LoDFKghq9853wW+Oavvdb+Kd67IEk1RsN0XF8kPJmptZ4sN5V
         fOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272591; x=1722877391;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NY5TOx2hRF+eF5XgzHezi9Eadz0rgXiadgCBpJMGjfc=;
        b=meTHB4XEtppiP98GkDTqvhb9Kd+NTNKf8t4JxFId1mkp6gaaTWqsg5zbWaYZEr/bVM
         ESvSsT3Mu0ZAqoqpHbMHt5J7d7mcRVJpY/rsrgwTcXtga7YNb0RatyZAooBvH6WW1IqE
         NQV7THPdPV8iOn/HkSgSYOoTEzJ0mvMpplFS5WaFlm4JerUz8cMqmUVCNNCRKUrumIID
         xxOooAteR5+FAkIF/f2BIIzrUDutlWoqalL24y6DJfqaHsdAj5c/fXXE3WLD3BFglAvz
         RZXC73+8kVZXRYqBFhnEqAyIVpnHHoBcXxpxoIXgdALkauOZg0YgLm85bEQhrkF9hLq2
         0ugA==
X-Forwarded-Encrypted: i=1; AJvYcCXJFBYlr86CE19GZUPeyuOE320+Q1/jOTF+tv9fjqFXCc6VkM07zj47eTrcDiZyQDddBKt9bjOilhSS6XNv6XwF+dC9JJCYkxCO
X-Gm-Message-State: AOJu0YxLiRwp34cqGZWzHm79/2tqv0WCsx82QhtfU9faBTZSyK1ZzVht
	AzjkJ07N9vIw7UN3iVV01/pkPHxgRtwlugU2nMFP5VF8G/4XnpWXpK0ol9LcRYE=
X-Google-Smtp-Source: AGHT+IGNPdzs0UIEPCwCmFyWraPBLzbyEZadx1Vll6KLs5CYVRk3p18pfByHR1j6BgOgSb7ZcteNXg==
X-Received: by 2002:a05:600c:154b:b0:428:1090:cfd4 with SMTP id 5b1f17b1804b1-42811df08a0mr56262375e9.33.1722272591104;
        Mon, 29 Jul 2024 10:03:11 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4281a26e1bcsm59809445e9.34.2024.07.29.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:03:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240719093934.3985139-1-jbrunet@baylibre.com>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/3] clk: meson: sm1: add earcrx clocks
Message-Id: <172227259008.348899.7822977439322261576.b4-ty@baylibre.com>
Date: Mon, 29 Jul 2024 19:03:10 +0200
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

[1/3] dt-bindings: clock: axg-audio: add earcrx clock ids
      https://github.com/BayLibre/clk-meson/commit/02672e609fa9
[2/3] clk: meson: axg-audio: setup regmap max_register based on the SoC
      https://github.com/BayLibre/clk-meson/commit/dd8ab39a8b41
[3/3] clk: meson: axg-audio: add sm1 earcrx clocks
      https://github.com/BayLibre/clk-meson/commit/4cb834703c64

Best regards,
--
Jerome

