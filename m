Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49A610E5
	for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729944116; cv=none; b=tiTOQ7u8Be1eaupEIxBZsNYFqwiYd1JhDuVWHSU4BmNSvf6jPg35swyyz47ZQN4aCZYMN1/JQtxmgXx+yZdCfn5vRSRjL46NGHMCv8JI0DA7R8bYMjQTaUVf/9HB2w5ug5r9MZrZ56n23/2uKD9+RJxgKhqcDANdl9z3TUtGog0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729944116; c=relaxed/simple;
	bh=9GS99lzhdnNMT9LpV6PpxwW6BOkQ02qXLQl9hTQY1YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LEcl5CulLotWD4Hh2CPUUU/v63Il3JN9dOfOt3sBhtpgOspEwa7QyAksxE1g/9o5nfy/0oCEj7iX5LNwG1SD2psDYiQlRYSsxEvid4JhtJOavsfUKeOkG+QZmRWyzYvrY2YuERCMELjOy+17L9E41/sxbYc+nAmkJR6jAQ4fboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJ7fCEUB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJ7fCEUB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c9589ba577so467828a12.1
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729944113; x=1730548913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivIAohcESshAYpEPq++t9hJfCpjXuscXbD6Im/FDokQ=;
        b=AJ7fCEUBY+Myvx40AIhxqe91LgbTR4xX1blA+VWJ3i3d76HHN8si2lfQA9xeWMWPzE
         JQcVIhDUCLqH2Tm/xTrmIxAbuY2bn2ccO6JzJdpjp/RJ+qDIt4UlX3wveWSLC0dYEyMD
         npQrjVpPy+HpUwVbg4bH3zc17oRzEZXHqgvmoEjMeLHn0ImmiQtAXv/k2rZHRUoCarJf
         LmBtzSh+aYkaThp+ZuR/EdTSJ9udJeagbcznlvfZRyt/cwXa2O8+FVQ5Yg866N6vmV0w
         y02UDKz2p1NGvt/9IhmjymwDzC5rAYZ5j5OUt0WPEpW8AMEo0/t2b56VPrqgBk4/+BWj
         ecQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729944113; x=1730548913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivIAohcESshAYpEPq++t9hJfCpjXuscXbD6Im/FDokQ=;
        b=iW6yjyHxfGRxy3JC3hx0exIJmJ/eKxQtEc8R723p+MLYTC6Z8lxcZ3TvtKEzHiKoLw
         ydWOXwMxdTI3IotO9bPy7iTQaWzMsLrK05LC0Ixh8htSS36Q7/Lp3+0Pxxx6+sMFTG4F
         cq69feFTPWUWzmkTEmzD7cg3V7yEogA8kUxNlXHuXgKlitcaUaKRMFEEI1hw64mW/PsQ
         jcHth46neZk1R52I1nW/dHbaXBlfH9FfRLf+m3mCrqbWCmHVR0EOC38bwUff0cyb7seO
         CBn+qd+neArVpEnYwU5MxhhjdB3yZR1PrGpj9ynd78Onw8zAMhGL/HWcCCnSDxLYNwWl
         iZPw==
X-Forwarded-Encrypted: i=1; AJvYcCXhAqlOrQtOA1jmF87hzuy3M7mhXq9zzPVtIUhh6zVGvfwdS+xZjCTTRRVr5sJegnuT2AmuJMV4tas=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU4UBevYPbwUnYWTdpku6IsVnaFTRXV2zaivGynDKc8LYQvxL3
	vCCQmyGLQxf0QllQ/oea9mW9qkNHxsDzHMTGeQH53h9Sb7fP3x9veDLiCoNNOFE=
X-Google-Smtp-Source: AGHT+IH1dsULDIYCbXnhWrr2hutsWuzTM/gAfeo0yzwyxxJYFFg4QA218/5byXKAvC9+SNM44aVSrA==
X-Received: by 2002:a05:6402:13d5:b0:5c9:7f8b:4fcf with SMTP id 4fb4d7f45d1cf-5cbbfa58bf5mr660881a12.6.1729944113136;
        Sat, 26 Oct 2024 05:01:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6319711sm1490421a12.66.2024.10.26.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 05:01:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] clk: samsung: Introduce Exynos8895 clock driver
Date: Sat, 26 Oct 2024 14:01:48 +0200
Message-ID: <172994382528.22240.15972019701074354702.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Oct 2024 12:01:33 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds initial clock driver support for Exynos8895 SoC,
> which allows clocking peripherals like MCT, serial buses, MMC, UFS and
> PCIE. As platform support grows in the future, other blocks like APM
> will be added.
> 
> [...]

Applied, thanks!

[1/3] as well

[2/3] clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
      https://git.kernel.org/krzk/linux/c/49fefe602d8fa7323b51ffc4891acf4a91dac193
[3/3] clk: samsung: Introduce Exynos8895 clock driver
      https://git.kernel.org/krzk/linux/c/c6e45979204d092770c55c0b2d1fce6cff8dedd6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
