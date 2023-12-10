Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gjf5THU4"
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4FEF4
	for <linux-clk@vger.kernel.org>; Sun, 10 Dec 2023 05:57:46 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1c7b20f895so421548466b.2
        for <linux-clk@vger.kernel.org>; Sun, 10 Dec 2023 05:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216665; x=1702821465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW/HPfKMhok3sdax4/7yRdGspuPrVo40wKyVBvTDbfY=;
        b=Gjf5THU4+bCzUfxOKT4Z0AQ5tn8vUKINgBR7WyCDKCTX/f3+xGP+JNu7QLeMgwtzYZ
         YhPEMcq8dEgJ9DJrPlss9tEICLxgRO+6YAaCUVzL1XM4gfAgZmOwgfXGcQq7Vlnv/h0b
         NJsQgS5wlCMQHJX8lXd24JsBnI1Vaf/zRN03YrSJ6STpwsKVf1MM9xpSqAILgHlAwvEv
         m9I4FDCWquzbEoQWMEE+6t3liT7P9C67A3c2G1c6JYnnw29vdHkiB0f4DCUZIKS/Zmi2
         jiQ9OeuM78EmTQaDRvJZkmh7eKNF5L69OnsiVNVOgY5zCo9XpLo1DvzUVik9iCvyuCyP
         cK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216665; x=1702821465;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW/HPfKMhok3sdax4/7yRdGspuPrVo40wKyVBvTDbfY=;
        b=CDysj16MIvPRg0gjvLDV7dy2Jp0TBTKVI9dnPnSj/pyAN4ciVCjmzKENyevNqV2OsL
         XMhyRPnimchnmtcJSFL6EDNjzBjC+IxIPYkfQNE9PDxM+XBlNEvPJ+i8ZlG6Jt6gq2RI
         W2SYvT4NuYERS7fKMBMyqDBbE7MxleaZXoitAjkRMpvDAidR4ASLaSL7cDdQsERaPA85
         t6G+lcVn/5J56Ag7Ge4xaZjrhnDA6G4FyYAYcln/4hBu2LcfbnQ9XszNLj49UBsqFvX3
         X79fHdKvc9f/2r+YC8gN2lriWHntDhMWQPoR2WRRFic+cfwIHN4gNw8sV0S+X2a7B5AY
         H+/g==
X-Gm-Message-State: AOJu0YwNJGx/20iLwMLzyVFr4hkJJDauWJC2TxasqX6p8JuGbwo4vE7P
	e6XY0oWk3Y9XGb9LYCp1vrH2hg==
X-Google-Smtp-Source: AGHT+IEiX0Ga0iSCeXy/H7DeCARzWj52tQUW0/WK6+nGTq3Be9t4FyM4BtE4El+v2+woOUipXyOwaQ==
X-Received: by 2002:a17:906:1787:b0:a19:a1ba:8cd6 with SMTP id t7-20020a170906178700b00a19a1ba8cd6mr1495305eje.116.1702216665431;
        Sun, 10 Dec 2023 05:57:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vv8-20020a170907a68800b00a1d2b0d4500sm3442809ejc.168.2023.12.10.05.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 05:57:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231209233106.147416-7-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-7-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 06/20] dt-bindings: pinctrl: samsung: add
 google,gs101-pinctrl compatible
Message-Id: <170221666275.44902.3863677775174337941.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 14:57:42 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:52 +0000, Peter Griffin wrote:
> Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
> documentation.
> 
> 

Applied, thanks!

[06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
        https://git.kernel.org/pinctrl/samsung/c/4a2006d0c338c95352bf9f06e5b3cb8afa0bc885

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

