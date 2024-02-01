Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E95D15CD6A
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706783779; cv=none; b=BDt5GNDZObb0I/9T/Eg8+XVuK5l5nabvdpGqXWMaiFP008EYzuJwP4dF++KDSKHx/Ysbx10V0wka9Dt4UcMMpxBiCPTFdD/HWbJS8cLQHWuyuoanrYTOKu8XvQVv0lDATIRL/6IKSHX+QJJcbjzG5hUeYreG1IvorlcTo5bJcZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706783779; c=relaxed/simple;
	bh=ODyXbHt+fUOFhRoRY/NFCNXaK627szJnbd7Dc9Ct4qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CDxoT861c7i3coFKhIVLqzEzcG5GOZZ3U7MkWa+toyk7teTObj0F9ULbIZFRLcQDdUbsW6x3Z3koyRE5kiTLAKSVvoyKmNGhM2oty6/LYCo9zVmBkcRLOKd93FPgWOQLb2rQfwQ78U7RMg+jrA6i6xh9ZWE/TiYdf5CQh5JgxAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUWoitAN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUWoitAN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a366ad7ad45so88048066b.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Feb 2024 02:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706783775; x=1707388575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+plAUGLoLnL/TJNdsEMu1YsJK6wUB3LfjJLhkp4ZSw=;
        b=xUWoitANszcdOM2SOVbswcWW0seHJKnWXkq8+kHdahLt1aGgDM3JeaolCDQLHbQdgs
         aGVfJCrgxcWw9lmuAedKMc4x0RmRCgqsmgy2UGOrWyVNAlrWtau6vT5i/sEvFLGislwg
         l6hNcKwHQn9wKWT/lbKQrw+7iY/yYCNm7g3gMxSNQMXgApiYX/Fgqpg40McFNoFI0I+K
         uOGxkB3tQa8cC7RthAvDgL06U4zGWn0TxcxBvlkNuXYz1E1AeKiZH2lyfxUSbeyqYZyP
         HE0qu73ZbEOrpIYrzq76MxgKiRJ6FpkHvXqOpCRxxRBEAKf5S8Ydu4uim+QWnmPEersQ
         1KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706783775; x=1707388575;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+plAUGLoLnL/TJNdsEMu1YsJK6wUB3LfjJLhkp4ZSw=;
        b=D9WIcnqXZX0fxPsifiVcVHCHjcH/krfPfx0pi8CPK2FI1JInNjpECnJBLpqWYeWb0T
         RrE5Vaaw7b4VjQXSa0Mw8oNwEqSIii1/9oZ1q2r2hKWF13ySutWPBlDr198LbX/Jf6FE
         RcuBygDSxKwm0dijm4bD1oqXfnhHLvI9iRfRbjccD4aOEdsZlOniP8SbKgToh5FXJjj2
         XdTyGWbETlYGgwr7TFWP9XWajapLmbowVucKN0OQco/PquqP1fVBBXmkLL15H/5UqRWp
         HR7k0oe+VIh/PUcYlaJu4UdxfArWj45JOHD+EQ2pHBRTIlTi8RwDhO5eD241E7JVi1fX
         BqGg==
X-Gm-Message-State: AOJu0YxFmVJNnkYfypQkhwxCVpKnPdIOpyiVELeFqmmGpzuLgdm7ZWXZ
	gt0f1wgS1u+CaB57E0Ll1JL96pR7rNU0PyVyQnTZUmWmvhfsqQWDUSPhMO57TFU=
X-Google-Smtp-Source: AGHT+IH6V9sYQmX/fRDfsezAB/uac9zNAqwiHgbXiYY5IYFCSB/a46wtvfV9ErpXLnceRipyeBrmoQ==
X-Received: by 2002:a17:906:b03:b0:a35:dd57:e4cc with SMTP id u3-20020a1709060b0300b00a35dd57e4ccmr2982269ejg.22.1706783775672;
        Thu, 01 Feb 2024 02:36:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUnteUnmLoAY/q6BcTuLIN7u2GUH981ye275v1D2SEvrsBD6wZQEsashegLidAZ+D7uVwnc8NRyt1lKMJp5Q7h5pvYGFhwMlefNH8Tw3f38qQMz4vUhcKsoo3kKqg9E2g50SQuUux33Rb2+Wr6pRGDUeodjhy7u0pI4SDAgJ9RYzJQKFUxXGfN3jwdQjgk1fauRNXhC7E71bQvLzlzBvXKxxj9PUUfyXjao/WlglLkpwPuIxSaqpWRO6pJ5twAZWpch6XTyDpAVfAyMKgDR5MJ+BuhHInHd/S/VMuYzHWz1mrrPAyJ8/tHrK0mxO92MM2YqcCgNEMm23u3lZttu5aAzGhF0Z9omASBfaIOSJbKMYp0SIsqsqe7ejCzDAVrdDPIDMDwKo3B7X5ZrEMoqcsLgiIpq/lQu8zXP4I/YXlABqgrpqMbfLe3SYtXNxfsSqP2rp6mfkN7WJA9+8/XwC97KUS0+F/IRTv4CnXyiZtICBA==
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id hu17-20020a170907a09100b00a3603b49889sm3041749ejc.21.2024.02.01.02.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 02:36:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240125013858.3986-4-semen.protsenko@linaro.org>
References: <20240125013858.3986-1-semen.protsenko@linaro.org>
 <20240125013858.3986-4-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynos: Add SPI nodes for
 Exynos850
Message-Id: <170678377409.179918.13077326172475089482.b4-ty@linaro.org>
Date: Thu, 01 Feb 2024 11:36:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Wed, 24 Jan 2024 19:38:58 -0600, Sam Protsenko wrote:
> Some USI blocks can be configured as SPI controllers. Add corresponding
> SPI nodes to Exynos850 SoC device tree.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynos: Add SPI nodes for Exynos850
      https://git.kernel.org/krzk/linux/c/98473b0d78caa5502b7eee05553ee168f0b0b424

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

