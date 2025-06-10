Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277E8283FE7
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543839; cv=none; b=b2QNDDwoQnIntf9NXZX0eVcG23FQ6aDtWr1Dq25xmt0A6xFsDEcUnKMc5zDIxz6QT9Y+ojOT9VlhCGX0t1JIrzDGUQmpe92Bf2tQZKB/M5JL7I0bTT0Tkp7TKq0BBLyKOY2nx5GCDLkeZmIO4hUHfUMkolS+pKuE5J2Cc9PiH/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543839; c=relaxed/simple;
	bh=yyhzPDdF8NeOOeZr2SZOX9HHHQ5D7bOqPKd37iQiSFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qyilbDhysdE1VnggXILN4D1OcTzS4NOliXcMEre7FvHPwRDj4DB401oUgz10Z7ToQkGfdp8LBYrXFlG327+27qMjGmUfQLwBO+YVK/n8CJXdHV0mkyT2S521vOaPw19PiEvordKSD9TxW5NaKEFi2/TcuwmyL/6gVr0g0i3gaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEZC9Q1T; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEZC9Q1T"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso810295e9.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543835; x=1750148635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=;
        b=hEZC9Q1TgiXTu95oc+6NtCo1BRbnOHrDqPXM+MQe97jPplFgtUdf13p/+l/jivtpqn
         AVEQjBzDe0FJXPE6Qt6a8uqrNr2fPd42ABmxo+Ea3b2F/O2bpgYVKdN+pbeS5ePPw1cm
         akKeS/vsivEpT4A4OhOoE989960LD37RLNNrych+3AkFBsAUaYDYEI8fWIB+kyRCdOYs
         LHNItha/qRFBQeNZEdhYjhtgiFYAGupfM9a1F8cMJL3gN3y8zWcjShQ6qS+/8UxWnLa0
         WdUy5IvMd8OPHPs55WlLsoulOhhLt1FIAQwpR257JdBImWFyg/7ZWBilWCccOvj0herZ
         M3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543835; x=1750148635;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=;
        b=GMX4SIsbpaPcNDgckrd52S8SKmIdjGS0mo6wpW5QfecgFuRNwvM3yO6zGTvKr47w03
         Dkt7jnTM5FXPFeXM59cD5x1uXFDlLThY96oLcCF9/azQYeZHSkz01YGYYOtPtLhslu8/
         x3h4SxIp2ksrz3UnkFXRPJkvCFEGwWz0fCcLLn+pVlNDQfBKjQ/P0/R9KpdanYPTiyFp
         lMpjVkddiBuj719Y0CklkPuFB2BjHG2WGUgUvW501ry64quHXFECUqqBXWaFS12NF1xs
         SCfKUJEuSD8Gh6u6MOgsTIUpwakMv898VgcqcCE2t7jmqt1lSndb2A+ylD4wbcOXXdrK
         398g==
X-Forwarded-Encrypted: i=1; AJvYcCUqzqHxHM9awMDP0UlDYRAtb0LeGPKcWrbjKSC3DGMdW7sDSkhlsBr8PeZUvoGaFv9Mgw/gYxnTkoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDJpSETpIKn+aKrxati6WdKWuwqrNpbuRpuBWkYfCjte3J/w7
	oerwufvibm96Qnmy+7Iwr/lXdAK9gUwGZbi9FpN8GsEjyxQkbI929WB7QTyhxf7mqOo=
X-Gm-Gg: ASbGncutAs9PpoaZasiZe+nQnVLf5xFvarG8vLEoVfRahBA0LbqV3MEiGr91PS1/jyD
	ZpPwqvTt4wFxW5Asj7Syz1m/FaGi10kv2DsarFnUCY0ZkQTJ2Xevi3VmbduLgWzHNuDMSxSahS7
	d7za4htY4ziprSMpw1c9UJARGSrF6s7BknNI6+wYq7hNddBWzs4wQhPV46dRG/mOSSWzC+ivFWn
	SZjZ2LcfZ+61YM3VpzdTKnT+IbkcrDR/xZebay1qDwovLYPuB/H1HKlJBt70rkbaF9Xh2sAjSex
	B/JSV+HsoYZXT45+YKfad3Loh6dx5aUevSM4VbqYKz26V/vdJomxkr/FP/RnVs4Z1mt2FDPcdpb
	UL/Y57A==
X-Google-Smtp-Source: AGHT+IF3umgoC1MXVewYqSd6NXb0BxRbXdgsSHg+n+0cmqeui+0FYUC+7otmqctsYZrl7Ig6A8Aq0g==
X-Received: by 2002:a05:6000:2409:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a53313fa5emr4137414f8f.2.1749543835438;
        Tue, 10 Jun 2025 01:23:55 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
Subject: Re: [PATCH 0/3] clk: samsung: gs101 & exynos850 fixes
Message-Id: <174954383375.117835.6950854237763688291.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Tue, 03 Jun 2025 16:43:18 +0100, André Draszik wrote:
> The patches fix some errors in the gs101 clock driver as well as a
> trivial comment typo in the Exynos E850 clock driver.
> 
> Cheers,
> Andre
> 
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      https://git.kernel.org/krzk/linux/c/29a9361f0b50be2b16d308695e30ee030fedea2c
[2/3] clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      https://git.kernel.org/krzk/linux/c/ca243e653f71d8c4724a68c9033923f945b1084d
[3/3] clk: samsung: exynos850: fix a comment
      https://git.kernel.org/krzk/linux/c/320e7efce30e2613c2c7877acc46a8e71192cdcd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

