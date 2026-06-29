Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC1B3F9F3B
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725616; cv=none; b=TjC4RFsc9rbnzC315WkyER4JVqlVAKnbZFaVvYKMu8zHuPsm3AQGR893rdJ6lMvm18eLVGU1jR7VIyQUpGFwD6/CTgBB+MDXlCgDx9C+w7fiuxKHZkbV1Rcg4GmhJoaizO7OdVM11qCEQWU+u1n049OVTM7Z4/V3QI9JTTUIrZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725616; c=relaxed/simple;
	bh=5Uy1dXTbauOTy+QyZiGIOiG703Ca4Z/b8w0fJPVFxPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E4WqpCMr4lZ1rm3cQa8ZsYV5L8DU06C0ps2lcBwkC5/vWx5SEtjfA/DH77ms+EWEYIJ0Le9qFa1YFbmKlGirpJGOC2fkb2Up3RHrRrd6838nhT0xvnIOmg7D04LSyTsuCdfmqtcmzmcLOlLKkzaX+XIx3rMOX3KM7CEJu/zk/xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JHEY8dLQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JHEY8dLQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so21729035e9.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 02:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782725612; x=1783330412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoxMGI0BVuk3x6WyDDntBseVyfJ89DBJ4oPAJpDJ4cE=;
        b=JHEY8dLQCcqgSshoSoEsRlOXeR0t7Bf+t+I+Go/QNTLQLkJ+ik0tD3mdRU86V2Fah3
         LTmMZoU3ion1vZSP/4RMtXsLOFNMr6oHt/oZRbc1ZTz4LrIPxk8iX6tqMNVVN3hkKXtY
         2njWBTvYAC8K6QYmPOKrMVdy27MrYunUdgBK8X0yhI9P3MM5kliVmqvFHbzT+n6x+iBJ
         vl9c35QqNp6XOj59VVLUyhakPejm2KYY4t43FyCMuxAWrwt5tdYGwkiRBql4Pk4k9jGu
         p5WWJyZJHxqBTcmmQyhFrQTdH9VpwJQdQMgaXyNOfAn/OVM2XEWjq8WdNiPadvuAEjj6
         hrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725612; x=1783330412;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WoxMGI0BVuk3x6WyDDntBseVyfJ89DBJ4oPAJpDJ4cE=;
        b=LoTgn8teIvCfHu6tP9Q59F87ZXKtDWn7U1kfHj31p6TwfFHXP/N+3o0W7A0uZuOPzX
         yxcIB5dLVblAwzFhZw5hdZI94L9Yemtqi8ofjJYs0UaYbh68aXO0DaUy8jLJKW8GQf8U
         Ns0/bfS9WElx8t8onPUIRY0iix8H72f/+T3u6CUcYP+gOveurtrvWWVFrzGlo/HrUOJV
         hBUUQZsGLk1aVOZt4vr8XCxfnBX2YW6PzA6HLnORXXoQCj2jaCYJcxdqqss0xgv/mgEX
         pKQflwQ6K3VbaWqLR1Imeku2wR1bcgUSdEPmYEs+7WqZHJR3z6Nep3+RUs0hQL5ErxLL
         6WDg==
X-Forwarded-Encrypted: i=1; AFNElJ+sqbC3mC+ZvjCjFmc7w8KYhmKwxNM3/kDRJgB0X+KJaIbHAmCyU0bwByHPVqpznekL3y6FNDyEpmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSfBYQKdznJXHJ+Z6qzYDtc+z1PqmBP64/l3oibLONTHLKiGRH
	YzUUXZfR5DokbYWw0odP2WHZWNXaZi4wsfYNyJBwIfFz0nemaaxX4V8t6lAJlyDoKHc=
X-Gm-Gg: AfdE7clY9VKpDfRuPa5axPmmToVHh/PfBe5eVvjBVbZX2ojZVoJnZVKxSslBQyYyUMW
	DdN34ZEyz5Du8j7xijNXDBhUu1XVF8km4uVcQ9N30vMnJADMaI3eCU4Jshx3kqNqMYS/yUQfgpg
	XDz2WYwsWxKiWfvinYWWfl8md7rKgX4Ka3Wz9rQ5NT5f+9DYHdMk8Cfhu25D91srTwTLOyyQ5zB
	7oN3o01Z6HaHQdy3OB12Nbhkj/ASE7zmQkhZKfo/kC7KkPGflzKCQ1QNlNwqJs0huQP1/mQ2BUp
	oEdGXPd0Kc1eZo0fUEnrG+lgIwgXEKQ7m2BY44ZG8kTu4pRX4V01Mtu/Voc5iC84CeJHk5CkIfJ
	xDOEA3l5FjrX3Doep+JMkHcISRPSGPno6jBMCzPVHOpGO4KlSTA18EO3GAQNwRGC1Yi/Gsf3OxX
	JImBZtxbTax6+NsG8xFH7MLg==
X-Received: by 2002:a05:600c:154d:b0:493:a6b7:cae5 with SMTP id 5b1f17b1804b1-493a6b7cc46mr73697705e9.28.1782725611965;
        Mon, 29 Jun 2026 02:33:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c2954efsm197764055e9.2.2026.06.29.02.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:33:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260623-a9_aoclk-v5-0-c7cb1ff9ebf1@amlogic.com>
References: <20260623-a9_aoclk-v5-0-c7cb1ff9ebf1@amlogic.com>
Subject: Re: [PATCH v5 0/2] clk: amlogic: Add A9 AO clock controller
Message-Id: <178272561000.2490611.2050441945204527084.b4-ty@b4>
Date: Mon, 29 Jun 2026 11:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Applied to clk-meson (clk-meson-next), thanks!

[1/2] dt-bindings: clock: Add Amlogic A9 AO clock controller
      https://github.com/BayLibre/clk-meson/commit/d425596035b3
[2/2] clk: amlogic: Add A9 AO clock controller driver
      https://github.com/BayLibre/clk-meson/commit/a1b4c3a63a7e

Best regards,
--
Jerome

