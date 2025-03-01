Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925DA1DFD9F
	for <linux-clk@vger.kernel.org>; Sat,  1 Mar 2025 14:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740838410; cv=none; b=Gk28wlr6VOcMBEPf8gRhqvSJAi72X6DicPbyqfU43bZSKJ/OjUVNq4Tn2bux5xLVWB++M/HI3QX4+bQvHka0SBU67WL58dxZD/Fm1h1HshmXCDEYztXyCGPDBCvzf3n2pai2MgaYnYvNNZtc8/o5Un8hDX1C3b3nyqAWbKF14r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740838410; c=relaxed/simple;
	bh=l0jI5ewz4E8unNwYqgNQ3772jTNnjhi+wvE+Phrny/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uxV/z1cvQ0SQa9hwSGuAwwzyhhLIpDyqDCYEAVB7aH3BRxT+I+XMGs9S+6B8sb4ElVfGaEm3piZI7BI1h61QzAGWt2IEplRRhPQT7bo54YaiozwZWXSrJnpl73tveK9Qu26zJ8cFXXWaJ3JkpwxWHYfWsuY721KrABTBHibpbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sflCk1nq; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sflCk1nq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dc191ca8baso588782a12.1
        for <linux-clk@vger.kernel.org>; Sat, 01 Mar 2025 06:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740838406; x=1741443206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kICij+zGJ4SJUAMRx6vOY4fWK/HFQvlnrffeNoOoYzw=;
        b=sflCk1nqgl8RMSI2XM3irIn/+zWof5zGU3bdYiSqzzIng1o3i7Pmsgtw9HbaYtTuGk
         yltDZi+Sn27JC8dDA2x93vPla+vvoLBYjM8gYofZ5oRAhDMbKxRO1bzVtyC1/JSw/VmS
         Ht/BUdkfiFqPhahZsmisuTedEcLiLFnjpCMWrOBoUheN9yqR+7AYCEBiDvr5drdYFVL1
         rUD6W/CIpPYo7Z9huRNFLGti9MI0iCQNhQOh9O4Hz86kwbSVuBq+uDrPtxMjRR19PfFk
         Eln+WYE8U4mM/ZFqh31CvvBm+8PUBFxa6Wdl8k3ZfwoFeSw3iXkZoLnGFhd17cOl7olx
         juwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740838406; x=1741443206;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kICij+zGJ4SJUAMRx6vOY4fWK/HFQvlnrffeNoOoYzw=;
        b=qKNCmePZrzQy2kusPcKVmViROMETM9Atrzp7LbYE8H71oVu/cw90s26eSkNnMqR/ru
         tg1CCm8Dqle2T+ir/xucWT9xNJWWCUhzyEo3jldi4rx3o6kH0xL4NCBX0P3txzsokAh3
         ZalAhhbg/TogsMF3cUThkFjyb8ca4OZ4DnwXJK1bCl9dU6o3CFbyR7ub0An6uqCW3LbH
         4Capz85c2Zrzy37KcjFqG1/H4SnVIu3VI2lkEALdQFlZsaTzkb71lKFSekauZsr+tayr
         TxFRZ3H0XwV0kF8HfOsVf5daIA0C0mqgT2a1Aa4bhNbe/VvMr/xnhI13ra/O6wNlEulu
         LMYg==
X-Forwarded-Encrypted: i=1; AJvYcCWaBSAZM4IEtTD7XX9+jHQb1I+l0LkiH0sfDSP3OvjNaJ6xb80luq9AVQnORvgNHq+F2/UMnx1RPU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzerbkJ02+BECp5pugVmQndaEqrexaZAckHz5c6DL7slW80It8I
	naFE84OvAixWVffptsdUokSikgMerlJANJBw2pRBAkN8gdjOQ+BAqBzrs/zk96KR5PCGfMkSI5+
	VT1E=
X-Gm-Gg: ASbGncunJUthd6WADuf2mz7/cFlcpwVZMGjITSB0vZF/nJw4LF8NeZntqDVOqtfYBa2
	gYNsexttW2e6UYorUfdqZkry2mfeI5gxpDpDd5oLTb97+R+ClvmGrvbL7wj7BTvHPIfj2bTPQ2D
	aKKrs7XB6G6A6IWdOpwYdyBqz/01BJ9N4/9rOs3eGDw2qX3MRpZDmX9ikaQLN/oC9LmPcJe7uq7
	3AqNfUTqxIJaHoARInBD6tlSfha/TtArb4CTLaVmH/v/VFiacnq+Wl1khLu+pzuvduVywCSOK6q
	8q5HYAYKRaVJzZakeES7vRzw5cwpfYIjMiS09PsX5UhtBZEDltwb62ryGZ8V
X-Google-Smtp-Source: AGHT+IH4LDzdUoKTGOGgBFHqmwTZj1CstR0ayqx7aTgOFcUj9dhcl28Y1Pq7/cB2aRE6iWaW2lq9kw==
X-Received: by 2002:a17:906:da82:b0:abb:ebfe:d5e9 with SMTP id a640c23a62f3a-abf275cbf12mr350485366b.9.1740838406199;
        Sat, 01 Mar 2025 06:13:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9cbfsm485532366b.14.2025.03.01.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:13:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250301-exynos7870-pmu-clocks-v5-1-715b646d5206@disroot.org>
References: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
 <20250301-exynos7870-pmu-clocks-v5-1-715b646d5206@disroot.org>
Subject: Re: (subset) [PATCH v5 1/2] dt-bindings: clock: add clock
 definitions and documentation for exynos7870 CMU
Message-Id: <174083840306.17657.2523115679702297451.b4-ty@linaro.org>
Date: Sat, 01 Mar 2025 15:13:23 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 01 Mar 2025 09:27:12 +0530, Kaustabh Chakraborty wrote:
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI. Document the devicetree bindings as well.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      https://git.kernel.org/krzk/linux/c/35b2b3328c2e02b544f49d010170fe981f20ff11

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

