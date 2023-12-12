Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjIIFB/l"
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A91FE4
	for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 11:39:26 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so21052125e9.3
        for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 11:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409965; x=1703014765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzatjt4r0YJeTezf0VgwrU2TmLicfYhSYlspY5uEu3k=;
        b=KjIIFB/la4MtWxibPv4m7qimINy3xneZAk+kVP0PEm/B/jgPIiWRUox8JBrJjPodWx
         8wkuDdIMOL0rVEDNQazdxpPG3T7BKmJ2awyqkZjwzvMLr5KqGl1FOSnfTS2K4SLOQTvy
         /8tpXRjPFFy6W1GFlFloE8ANa8P3iSZ7YqFFukVby7j6RyHWA/aErULWG/ZOC+I8z6G7
         EpEiIAhDDnK0+4I13ea7HNJATMEcPchFlRgGYrF8KrHoUW5XaQx04IpdSPnl6RywCukz
         6Bkzbvlt6USP5uVridUxX2EZEkOXHlcInSo1s9Eu7yTOAH4IK+gBDHNE046ZH3JU38Rg
         nf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409965; x=1703014765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzatjt4r0YJeTezf0VgwrU2TmLicfYhSYlspY5uEu3k=;
        b=R+iR1yySoVCPCC56uIgzguq6lXxFkB+tG71jYqSLjRGxfQkCFZkMUxJ0xcLOQoG/VV
         2Km+TyP2Z0FWy7ZceOWGz3NiK28MDitwBJEu1KVzNPbbc83ZzwYLLkBbEwz5akEasAkG
         +97EWCckPxdfHUhf/CMM0eMbxhadbPvxLNXQX1S9wrm0DSpTwXoUkYlJO8T6yFHhPml4
         nVm1SxHx6YqmowXu6R70ooxlHncOeRXn9F3J5fghVhOsDxtKj7AwF1ebld599Gd60ufP
         Z2bm+oig7rb1KglKZqkZa+wE/rB3zJ8KoS+9iGOY6nqmqcOR/TZ3HiPX92SVICa0GKvo
         A6TA==
X-Gm-Message-State: AOJu0YyrW5eBroeMW9+tDOXTGohYNBi3URYNahyisvkslGNAIFIoQ8Pv
	oaEYsR8hDAaiBfRNLLIwIIhgwQ==
X-Google-Smtp-Source: AGHT+IExqguIxesNEgHsaolxmotlLbzMQysC3FbvqaGIWeGrARbpAWQMYBHhwo+guartnGUfkSkRuA==
X-Received: by 2002:a05:600c:1393:b0:40c:4b43:d98e with SMTP id u19-20020a05600c139300b0040c4b43d98emr1834457wmf.84.1702409965061;
        Tue, 12 Dec 2023 11:39:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: Re: (subset) [PATCH v7 03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Tue, 12 Dec 2023 20:39:12 +0100
Message-Id: <170240988143.242356.7915762427739298874.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-4-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-4-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:18 +0000, Peter Griffin wrote:
> Add dedicated google-gs101-uart compatible to the dt-schema for
> representing uart of the Google Tensor gs101 SoC.
> 
> 

Applied, thanks!

[03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
        https://git.kernel.org/krzk/linux/c/bad3bc0a23b74e7b353978b6f58eed6c0f3b51a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
