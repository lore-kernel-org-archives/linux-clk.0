Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE5D1AACB
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877463; cv=none; b=Hy1Wjv8Wr5s9JS2ZGLrQDRaJanDJKgUgiydH1b3D+ZqZgl749gy4DAUn0Lvx7ws9K8U4aD0n8KGKRDRxGU77HshSZGMgtoSOoAF+OF5IjRWfLpTQ2IDgTATj3YGX65UIQylYVHVoHnJ9huNuDoRk6NQXM8NBWtATvd3HtJ8STSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877463; c=relaxed/simple;
	bh=QBa7Y3AGR9N0gR69nFXfx/CX8Gh6cMWpZsRsN/2yQSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KIF6EHiJkBBNsivHKKWxTXoVeYA833eaC77O9eFCAUuhb6NTZeGi9bx57QB/USAjG3bF/sFTo/Uj5sAasKYo4XjuAfgN3T4QmnUMqDvHXPrHtHz4xU3VUAmQ+CeGNXpSvTrP09czGfIrr3OPoOlQ+UhXFPEpa7WYEHdUp6670HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6cTyOrU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6cTyOrU"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d2305589a2so33829811fa.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 08:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877459; x=1709482259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5YyMqPimo9XUHgL83+xZtwboRxx5/IrUrU5gbAjYaw=;
        b=l6cTyOrUUtKpmUjEw35t90DPpeGc+HYmcYGXc+mLQ/tXaa1OYrN6P+oGrxZCtoHnlZ
         EziIyIob7WYEkTtYwMQPoZUy4JTaWwCWR6E9ix0lJPA0SHIg+tkzYqeFUaeB0eQF5wXI
         UfABURC08UnzC3JEyVYzMCEi4R2Ph62C6kOd/HlfM+Zj0s2oYLjKJIh2+94RzUYLquoo
         KdKXSpRIYFYuRyvzq962SMv5xd2ezuG95n5wEGs2OTKegPLj6589PcN3ro3Szo2H+KZr
         03NVng4iObqydVs1Q+WElQsr1skK54M34SfaTkzVi4b52LJji1ff+MHGxW04InVhmLvM
         tByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877459; x=1709482259;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5YyMqPimo9XUHgL83+xZtwboRxx5/IrUrU5gbAjYaw=;
        b=M5EPcSvO23z6/xdqMVmyHKeHEPnI62HMSocrohQ+uAUZDq7YceDUVvfF6o8SF9GxOT
         uZ/z0wjqQgV0uq0MpVyh0YfyyMY4zPrnwAH6JO+OcmP8TrSoSZCEDjOjnl1vxOE8CYj5
         mN3RPU1wfSkZKPFT7r5esEO03id2Rt7hiZE0I08GV8tydoVtgHl1GTwwbxDqt8clrr1F
         kHyDNIEYUNPYqdBm0WkRAsUQgWJiOap4ANCEd7N+JbOV35tN/wUj+EzRnpsMuth8rqnJ
         lnqxzid8/94/sWX5wY1PVktyenzNITLAbFJf2xA7sWTFRNPz7LuD0iHPqTL1EI+cpU8M
         0obA==
X-Forwarded-Encrypted: i=1; AJvYcCWdJ8aG/T8r7fdhkA5+t4ibJ2BhV/UzBUY+s9LE+mB09HPLnvh+SH+dGJPwiWMSXR/l64W48ETA/l0hDoWQS9ad7h8fiFY4XdKo
X-Gm-Message-State: AOJu0Yye2IstNvmRt6gBI6ovEohxqh4GPd8r8lwLJ1jIhcqFb0znPIP8
	X1tnZH4Ufiy6r45pDImkKwVlVrBOU429mnBg+HOShWfZ/gJB4j2SLjiE81c7Uxc=
X-Google-Smtp-Source: AGHT+IFLY64OJZ09kr5YonBW3qBy4LeKF5vqhWb20kSxzQsvNK4am8dCdGHvlpfqKNUziIRdPCfQ7w==
X-Received: by 2002:a2e:3213:0:b0:2d2:4054:2fab with SMTP id y19-20020a2e3213000000b002d240542fabmr2649973ljy.37.1708877459151;
        Sun, 25 Feb 2024 08:10:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:10:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-6-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-6-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 05/15] clk: samsung: Use single CPU clock
 notifier callback for all chips
Message-Id: <170887745713.215710.13782897214681477333.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:10:57 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:43 -0600, Sam Protsenko wrote:
> Reduce the code duplication by making all chips use a single version of
> exynos_cpuclk_notifier_cb() function. That will prevent the code bloat
> when adding new chips support too.
> 
> Also don't pass base address to pre/post rate change functions, as it
> can be easily derived from already passed cpuclk param.
> 
> [...]

Applied, thanks!

[05/15] clk: samsung: Use single CPU clock notifier callback for all chips
        https://git.kernel.org/krzk/linux/c/c9bc1f778625b0ae93641e6d14d83b62d16e549d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

