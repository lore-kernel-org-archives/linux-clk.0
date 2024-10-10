Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AF1C175A
	for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550507; cv=none; b=gOhqfQwOj5dUZEgUV7u2o5l4QxNpQTte3lc9lInhVivs25bitKUqJ0HgbLrsJnN6A9KS+FulREbblkpAt2YpXlPaqGFXRaENZtUWqH+CTv2HVJ2FzUmAvuIDu0Tzp6IEOSAI+HJ7aiZxQNy3kZjef9QXYKEooN9Lp5Wpu0yYMTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550507; c=relaxed/simple;
	bh=iY8aopICQoWPiqFUJsbUkB4R9fuhwsODp8QLLjEl8jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIoHMj9ntWMZglXVzTPNihIf0qweHNSEKBuklzhA2kye3fDP+82flhSdtE4FdEW05b/C3W8LNPgQBjxDPtre7ASd/GJ//O/NqaS4t1srWzudxp79kmEvZeKMPfaqKMKeNs8yYcJyIuNkXnxgb1b2vL/8AXgpKYpz8UVYKFvM86k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yygm5MYp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yygm5MYp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43112524af7so1172365e9.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Oct 2024 01:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550503; x=1729155303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZoeoLyaT4YRoqM2k3JYahsyNXowkzkznux6otl4oRk=;
        b=Yygm5MYpq5tzjRBhlCb72ZZvMNjxMABQEQLR5Cr8Ml04T88QDFlJHKPh9foQd1dmWc
         JYovDgrvR9xIHLcjV/vA9V2fjlTzW/a/X2ezez8c7YGCverAVkpmtyYvC6bU2mreZNy+
         CU/0ZyOEmqIDO+gZ9T4oT0ILFs6J/2wzwi89QT6KvPs3xZ29r5gw1JkNZEsdkzYUD+9h
         36W6UjLYWIEAfPFwO3yNzpKMx4Op60iTxXOq8GTxEDyGbzB93qDrGPWD84wADnCR4szm
         BWReqyctiZ99Xh7S2wbK3aAKivsrAtGgVllxgGbD28UWAwOSDbGtFM6N0NJ9B8WSDI5G
         DLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550503; x=1729155303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZoeoLyaT4YRoqM2k3JYahsyNXowkzkznux6otl4oRk=;
        b=Szk93HQXRlDgYvEvUJywuj+etINYVDFv8j9R1+byRJOELs+qs/qnva8l+ys0gIgIDw
         irmHxF+e4SiouJnC38BeJO4YhhisWBu5jxWhz2I8z5IBsMZu7280OFIWD5h10oyn5t4J
         MctRbnlW+0/CAS6X13gDPR9SDOU7OXCAJAEcUNiGUcDcFbyfkNt2ZjHL2v9Ws7z9Uo1y
         1g98RJjs52P28TAIJw7zGJM7Kd88Q+FW3wGP1BHc2O7XpA2o5fRFuyhIVZVItbWCDyd9
         FMpTJE7ubmn+xT6erK1pO1EfDufcIbcIav/GXSc/apDHIvitDr4pm63UYAhClxv3hahs
         4OMA==
X-Forwarded-Encrypted: i=1; AJvYcCXJyIWbmqskpvPXtVw1x16oKWJ5QqtHXEfTq0E8McY06Qqa2odxGLIwhta3RA8r8c08Z0QBbBniqpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVPIKVMJLl5UI9sn5T/KS+E625fFIjbGwQwRQlNSUVqIUaRNG
	PtXz0el5DDC7XrAEVyi1bJ0l9X2GKsMVnL/N5aKWxHs1xBhgBv5w+v0zgSqeEbs=
X-Google-Smtp-Source: AGHT+IGk1KFi/rYwdfni8WZNqzNSKZ9LyuSxH0t6IsJ9UlgEWGBga9ugCWbAkGF24Zf0OWUkISu91g==
X-Received: by 2002:a05:600c:444c:b0:42c:ba83:3f08 with SMTP id 5b1f17b1804b1-430ccf09175mr22246155e9.2.1728550502737;
        Thu, 10 Oct 2024 01:55:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bcf5bsm902012f8f.32.2024.10.10.01.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:55:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock definitions
Date: Thu, 10 Oct 2024 10:54:55 +0200
Message-ID: <172855049020.142350.3418121034279449808.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009042110.2379903-2-sunyeal.hong@samsung.com>
References: <20241009042110.2379903-1-sunyeal.hong@samsung.com> <CGME20241009042117epcas2p3fb2eea9d2618d36f6f9d6e0bb67a09f5@epcas2p3.samsung.com> <20241009042110.2379903-2-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Oct 2024 13:21:08 +0900, Sunyeal Hong wrote:
> Add peric1, misc and hsi0/1 clock definitions.
> 
> - CMU_PERIC1 for USI, IC2 and I3C
> - CMU_MISC for MISC, GIC and OTP
> - HSI0 for PCIE
> - HSI1 for USB and MMC
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock definitions
      https://git.kernel.org/krzk/linux/c/440e3dcd7c739ba5b256196a89e796fb7e59c755

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
