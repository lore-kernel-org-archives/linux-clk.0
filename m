Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6D540C17
	for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922118; cv=none; b=b/2i0UctrziKbwWK8KTkAGhViOaAYVHYpwF11FIRLSNQfu/fZPpeGwSXwmPS1ZD6oul6DA8byUzAL8GJkdGhwFjjVUuIuzMwdyUN3RMgjuRS7+R54Qu2DP7PS0wEWGsGYAqOTq893LNnUltmWhUo8LKF+NeYv58ikQDXJ6MhOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922118; c=relaxed/simple;
	bh=g71pOkF0q/D18ZOmtU7U8XWrY0ImCsg2nS7oXJFuYTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MvWqxSRh5kuHicRlbdh2qHZPVf5Ae4nsa4hLX1gSoFHeRg679G09Fkbfu1pbzv3K+3j60+p01b0PzQt2EzYdewSA3cYthjVsLU1Peu0PkBgD9b+NvERKITxvOwa0ZYrgNelKX4QKFozCA429FsAR4xBP2iCerSSWaBX3JlYsawQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VR6voqr/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VR6voqr/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55a90a0a1a1so1917575a12.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 03:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922114; x=1706526914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18VyJIfEtiBUv58CrrtMAEX1dmGY5zrSQPkQzP0Kc4g=;
        b=VR6voqr/+necgvFihMKG+kzlldJZMmXifhR7aQkQqnI8olWtQu1SqgUcgoya6bAK6u
         wP706N6ESeHt5RI4wrZxzlJHm4v3XhqE3XKyT224q03mJoUOdaEIpKYkAgAoihlgetA+
         kh4DZs6+dyGzI5PGLKj3f89OAcX7dNqHEZc6Ernk4V+oss1yY2KgguSKJ0mEh9WQT4mt
         zQhcgg8vDuQwExO7sdH26roM4IjNW2rYtUAsJ3aEDvzQObWZx7Qw1aVpb1MBP1R3tB0V
         +trWKsHBprdppX51hACw+yLvPi9zZw5EbZOF/Lb37CzEnvtKkfnG+OvRcuTYZgsE6D3f
         ex8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922114; x=1706526914;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18VyJIfEtiBUv58CrrtMAEX1dmGY5zrSQPkQzP0Kc4g=;
        b=kaMK04DNsRkeTXhgI25iHcIy14xvw/bxO05m4NCCCkuLvxl3PrrTPGlZrGYBNjLUT6
         VOcUaQhk47hTBOe7zJu8tIvn9xJXIcpqt1R0Kd1Sxw0Wb7SSdxTCuGdeN6WzZmI/7UHX
         884YmTbOOmgF5OUwg6hWDbXMY4+aBRTq12b4U7IrJBzxOHw4TZrifl6H2jCe3cx4sFKT
         MNUabb0RXecnODE3j4a2ZcDVHrwMH11vRG1FbbtACvPAtEoYsxHX5N/PJZ0krxWqu7bB
         RLKrfq/1ipyUibf37ZBaCax36ltULZx7Wfnm2l+VOE5DmTrt3SfTEg9phB7+894f06qt
         llDw==
X-Gm-Message-State: AOJu0YxvZvgt6DGqJw59ehB3r7pnumz1OEVgJQX3AqkUYU6khzrQXqMh
	UcK8L2HY3Gqk35MLKAPT3yEz1Vnx/Iw0bVYb5AtovTl3YGO+f/ysrvT4jbFrrxQ=
X-Google-Smtp-Source: AGHT+IF072wtLDVuFhLz/laKC/3DyZTIFY+Nv3wRPhqhHWN3bhVDacXtc1jka+JGAi1z5WbEVcDOMQ==
X-Received: by 2002:a05:6402:31ad:b0:55b:397c:3019 with SMTP id dj13-20020a05640231ad00b0055b397c3019mr877760edb.1.1705922113962;
        Mon, 22 Jan 2024 03:15:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 daniel.lezcano@linaro.org, tglx@linutronix.de, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com
In-Reply-To: <20231222165355.1462740-4-peter.griffin@linaro.org>
References: <20231222165355.1462740-1-peter.griffin@linaro.org>
 <20231222165355.1462740-4-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH 3/3] arm64: dts: exynos: gs101: define Multi
 Core Timer (MCT) node
Message-Id: <170592211238.45273.922705807227687587.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 22 Dec 2023 16:53:55 +0000, Peter Griffin wrote:
> MCT has one global timer and 8 CPU local timers. The global timer
> can generate 4 interrupts, and each local timer can generate an
> interrupt making 12 interrupts in total.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynos: gs101: define Multi Core Timer (MCT) node
      https://git.kernel.org/krzk/linux/c/2b1b22054a8240e8e806d872b6fc361611f9c7a2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

