Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317BA20DD4E
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998123; cv=none; b=F363Urzw9jd1ovYtlhOa8ioS4bWHZptbG1CLkpgmGHp3p+nG7iBKURP2rq4wpw2DqzNl4GM1S2mDyB0rhFmkKrdWVa7mM9SjVMoJKcphHI0dif4WEFItGGh5OsLcSKgBaDfIW8A7G1T9SErgLbNmzWKILYdpU0KqbyeoVB9EywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998123; c=relaxed/simple;
	bh=xKgIqILnPtnjS48N+Dxj/TVujiXB39GbV1nYOP1dghA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mOnTcA/biWhzjC4b2d2KfF/rFDuaC9h/jKj8GNqBfn6fY9RoxmUyh8TvDN5b2mL/WmPctwl3BETJtFLjImAPARNL0NqY04IsRPINxEdDvViWtAvJBxvrX85qMLWUkrvnviZ4nYlgkX6BTY5Q6Bv5w8BPYQOHk0c7BAThEsp1rpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUzqbJ+R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUzqbJ+R"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso10001335e9.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998119; x=1746602919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07WxlVOIaTyluGdh8BRRgEGy/WFU+aaBchjV13UhNQk=;
        b=cUzqbJ+RUnLOn5pWZDxsey/6sMW6jh/ev0MCeTH7TDSNtI7quDWtr3f3KVykftgO7I
         W1jpxxQwqi+3PCu5/humMD+EX3hIHQVa19FbMhdvplUlLeQFUeBRVggWx3qH1j/aK6Wh
         sDY77CoeXwXYlkEdi+atizs4RgXcBagYqXXCXmGvQd2G/2n2tO45TdlWVkMzCWvE2XOt
         y7nTvJLtg3Di0cJ+mVnQe/ympMrBrFIXKmKYlGhK1+BrXLFPeWUJP3QpM0xicTjUs19g
         dcG7bfmxl1woofo3hJSyc9bGcAP2H5kGYihhG3FmTErt5G0NP6GiCiHTnTC9PstzM94B
         m1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998119; x=1746602919;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07WxlVOIaTyluGdh8BRRgEGy/WFU+aaBchjV13UhNQk=;
        b=B7M2UwgLl7SGAnQ0cjfDSBLEFhHMNtYQzfyIM4pXTkSKyPPsRNN+FrEK1MIbXGGFE2
         f5ZmewiRI6oZuIfOM2zUh3tv7EaqoWz8S85sx0YgATSRdTLwPhvyE3dSiUTdmt5XzoMo
         GuHqJiz2QzwiXC9mxEWYdM4AyDxh6C5Fi6Z0VASmw/QSrT1NpZ7Iq+CvAIYSHYXawhEd
         YN5FFOeCOPgi9pdUMpIpIIbNtpR8092cbGSjx4sdhcmjSBNoXY5fk5bUrxSF8jbKpA/P
         ggLhWEfYFsZBhANz+8zviq3V42z+Upag7xaaFLC9VBf8vHwiG0K9jKsPVYl+RXTkbAq9
         zbug==
X-Forwarded-Encrypted: i=1; AJvYcCVucbacRfwri5me2nrDGAKDK1LyzlknUCYQUEwq2NRbUoN7TRgfp6vRmTSk92z1rnkwfnidRBQWoCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbo0Zuj4IIvTFNKjGXyu9WhFMtmI4GNeQ8y6lFOwaochTw7Zw
	Xsan8dOpfC5Z+8AJvbUmSVyZZ6hif060TyXaps6WlIlkfEFzq0kePGkyULZFdB0=
X-Gm-Gg: ASbGnctl8sWQITYMwL5Fr5eqz0rsWuGv7ipsW3GlK+rcsCXoCbk5Ir1iSA6idcV2Szq
	OsexQIYNLjJvPVdTkJxRzM+X5BPSNWqExDFm77iZfTath6woKMgOQrdfAOAOOgGfxWFvwhuN6nW
	yXQfJmrzdtybXr9Q5d/ieSbAh+UpeKDmMtiXtA7M4Fu4vhGsvc+W8QrJn+yoTzFc0ufYyurV/Wr
	ihsR6y5Xb2yJYtQls7/t60+02wEuTDlk9DTbyI1cVtcO8HVzKtJXv2Z6JcL6Yv6VlGlnGur/6rW
	Ba4FOZ5ZVqRkJQQkNPlNOKvLs4QNwaQ/jd/dmjPtuzHaRML0576wZS1rr+0=
X-Google-Smtp-Source: AGHT+IH6V25XvncoZLZe0TycQ29EnlwaWMEky41C5N2edT8KzWHciHnrPjPlKJj3kIRZ+fXKOUOaNw==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a08ff35f51mr414041f8f.0.1745998119358;
        Wed, 30 Apr 2025 00:28:39 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-5-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113601epcas2p11d09d84944957018da75aa548d3ecb2c@epcas2p1.samsung.com>
 <20250428113517.426987-5-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 4/4] arm64: dts: exynosautov920: add
 cpucl1/2 clock DT nodes
Message-Id: <174599811787.45412.1841327377938630305.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 20:35:17 +0900, Shin Son wrote:
> Add cmu_cpucl1/2(CPU Cluster 1 and CPU Cluster 2) clocks
> for switch, cluster domains respectively.
> 
> 

Applied, thanks!

[4/4] arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes
      https://git.kernel.org/krzk/linux/c/aa833db4b82205275f4a4c08554b3dde99dae0c7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

