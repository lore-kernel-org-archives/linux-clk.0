Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CF8157A5C
	for <linux-clk@vger.kernel.org>; Sat, 14 Dec 2024 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734172816; cv=none; b=tzwZKTt/esyKZIyRRcXWSBa/jbbUk841ygNU9zk/QajbjfWGMlWU4A/FbZ+QmgzEMvDWKC0KmHWAFSHvaiScQZvL5Y/bYv/zyVE2GYQ4IvU2QP1ud8FiYSrF7ZdGMAjBruCjSimsED8H+MInwpj71aJ5e46Du/U0dLb8ZojZSog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734172816; c=relaxed/simple;
	bh=vLgZnBGevkb+s5SDd9vhGESHydnh2nVi8ggdWP6Lt3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MaVKhVL1KBrZA7fsfGG+/kzzUBtYVaf9+E/Mr28M5vex2mntRtLOyE1w/o8CoHwmJM7dBZIcFW3l2fYtaabvNZPQ3J0XmI30O9dmWfAuNdORtjKuLuoxA+qYIH+LS0KUpCaATfHquv6kHYOkiSHJNBl03BmUizePsWtzEMwJ068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tm5xx/Xs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tm5xx/Xs"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38625aa01b3so256119f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Dec 2024 02:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734172811; x=1734777611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NDdZ7criVQVdKqHwJ2Kal6Xww02rI16R8MBCBHunDE=;
        b=tm5xx/XsP9hRqdmUUExfR1RcORjh7kOXroscjmjbaHSs/GmCyANWf6aO2c7WiTg4U8
         KjfARbD9r59jMrK9W5BrhrTX2FZpyo66LO+I3PhKa4rUDP+eRp6VEp2kP/XMjWp8T5q0
         MUKnKf7uxfGOYjtoQjw0ZtxZTtZHR3sMCnvs/SULz/9jqCFh7fG7Nu96t9zAF44gGRnR
         Nl+vMHybbAcDIyszxFUhY6FlwxNhujiOomLTntwheU33Uay+dl2WANhzkHqgaM8pBeQc
         hQNlp0MAOZ7OOJrP+5dq3SdLqBPQKaxlBPpx1PyFrMLODYz7EyZnj44TS+tqVAbSdFUC
         Ddjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734172811; x=1734777611;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NDdZ7criVQVdKqHwJ2Kal6Xww02rI16R8MBCBHunDE=;
        b=XWssjfhRhEfgnlvM1+/+EdFw3An7VDwjoHlcHEQfQB8s9dP+VpbJUv0aAqreXriX8v
         DqHMirKg9lT3LQjmG2ALmQkrxfYBQEL5WJS1euUnARvjGLnNEyMTIbkVtJssdoaDkcb7
         PLpDfFIZGX+s4YgZaFnAlmrUZQ6AmEGTXB41KZp7aTH42WYO16vw6mvzE+8/Wus5mHIj
         EeeZIb+CjB95Ib7l+C/6OYoFbAY0R2zo/hkk/KaxW9a+ukcLaqgyAxJI8wOfI4f2WQfJ
         sZ20aNxs6brfPB1pQshAC+ajxxlFCdIUDlWfWUmnUVgWOhDxUyqtNRKygqAGbXKiePyY
         9fnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8JEoC7mWayqYsZvBVNh30n8jV2fHivMrkobKa9BTO05RKUoZRUqK6PXwH/alZaoBIF8afErlgCVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTiUeSWyHZh/BFopBIUHMGsMe3FBOZKsHZADF9hU5Y5rVZrm5
	wOjMhTxQGI2ETwxNzf0ETzB2ooyFEkqyljWQEN33bbl3CyZ3TSx8OQ4ctDAvLcw=
X-Gm-Gg: ASbGnctstENkWPEp5ISiSrghZ99DQjZDo1z1UQuxgL3PlT20KbVNQdcwS7yOF6y5cql
	OEg6uoLy4WCzuRVDS0dWVgCQtpITEInSSgxhGvIXj8yOlOU4mXkJ2mc4NzghY2Y7KVM8ocZSKa/
	Hlmo0Mf1jgti/kjEvDRASvxoaQ6I8WVTHqcCHlO2VKFqp2MaAiaSVw1gumQa0ty7oo1+xP78mj9
	6TAXVwheX4sp3I6rgu7zRDGlcGZwuWzP1Nc+h6UkcCEovvVfqMw6CfrVQ/PigUkzxCzLGzt
X-Google-Smtp-Source: AGHT+IGr1iG8RISOHOiTTg35lGNZDL66gDIhEtHLO3gjjE3O+P7pn6cBHt0y4vmKD6qwOfGi/YuUXg==
X-Received: by 2002:a05:600c:5493:b0:435:192:63eb with SMTP id 5b1f17b1804b1-4362aa3a034mr19610635e9.3.1734172811452;
        Sat, 14 Dec 2024 02:40:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362557c357sm75366345e9.10.2024.12.14.02.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 02:40:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
References: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
Subject: Re: [PATCH v4 0/3] clk: samsung: Introduce Exynos990 clock support
Message-Id: <173417280888.20557.1392916695437038027.b4-ty@linaro.org>
Date: Sat, 14 Dec 2024 11:40:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 09 Dec 2024 15:45:20 +0100, Igor Belwon wrote:
> This patchset adds support for the Clock Management Unit found in the
> Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
> MCT, et cetera.
> 
> Currently there are two blocks implemented, CMU_TOP which
> generates clocks for other blocks, and CMU_HSI0, which generates clocks
> for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: Add Exynos990 SoC CMU bindings
      https://git.kernel.org/krzk/linux/c/5feae3e79dbe2d357b223fc48ae907ba0aedb271
[2/3] clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      https://git.kernel.org/krzk/linux/c/4a450ed26c580316d720154e7ffb5e9b4763a11a
[3/3] clk: samsung: Introduce Exynos990 clock controller driver
      https://git.kernel.org/krzk/linux/c/bdd03ebf721f70df1458a720b25998a489f63297

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

