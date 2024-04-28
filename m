Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5A70CAA
	for <linux-clk@vger.kernel.org>; Sun, 28 Apr 2024 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714320714; cv=none; b=MmX5wjw+LY2veh0JPplzEu4+c+YDAi2JQHXoFe0GOjpaZjMAoRAWzpaMyXGH014fon2PjmHUPgf5ZVXIhJrwhjj6gTrpmDDeN+7Luv7PjjAmX1bcs6psJn12dQMYeanOxp6X0M3ie2ouE02GKO2Y1Z/AhG6tbzXN1XEq7fp/N58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714320714; c=relaxed/simple;
	bh=lwQO4festyPbAo4fEUDXtFX2fG35lsp/AYPDZzFtBwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D6n3rj2RruQ5xucpKKRqPLqlHiC+Mi6f6w+NNo9q0NHEvhhmfBE1B3YaQpmKGnJspkkb+bDi+UqyxujHeAx1+pHpR8NSiuiAGD1Vd7YVwT3pxuGdcHzQiNLY0uMLhJxP7YpALZcOQTByZFEt/4W+T5jo3GN01l0vWNdHxr2mGPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MknSblpJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MknSblpJ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34782453ffdso3544399f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Apr 2024 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714320711; x=1714925511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04cSsPNBtTMr6mKvSQUe5a7pLiO96Req29h2TQ6tsGw=;
        b=MknSblpJLeBoEiHzzfwJrN9gKjFBRU9V5xp9HQdQekUKZSqAJNMQL1f8hUt3uOF3Gl
         TNKH8s1fYSbY9ECMhlY77RW1VD0rLCCP3GeRi1pKtl/hTlOgx/mo5++iYNraoqbRGwwY
         klfKEu/Q5MmgyQS5CftKjioedgssR7OGLRXxP1DKDY9g7DFtRWv0XsQf8nTdKPfWe4Ua
         0botY+LHwyag4B7wz0h+T4lOwD0Eg/n1IF9HsGZDrmWuwGSt2ZlvxQKsCXlcIxuk2TLd
         xcE1ZjBZW1FSL8pyu5EGGY8NWFq6s5gKzipVdusbdeLjOT7aw7E1tUyJKadqK3Eg6stu
         iUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714320711; x=1714925511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04cSsPNBtTMr6mKvSQUe5a7pLiO96Req29h2TQ6tsGw=;
        b=IQV6qcn+G490dK30UYOKhzbzg+hnBhT9wzDVYltvMSG0UluXYXC2S+Zej8JiWz506K
         gt/IZDndRdbZxMCLu8SwqhAPS2+NJH4MP54SoaHwLo4sNdtUCHsHg6oWZZLbDpEr5a+D
         L9NCv/xlTg0nBDZ6wv9MR3paTZvg6QB9mtJOFQoUbnSw7q/q1PMej9Na7MO6BcVw8ayY
         EQb1M5NjX+Z+UPNubwGrAQICGyFXlEsRG6PhmFC/2OS2j4r1UNlVTImJgFMtE3iOBYlS
         64gXy3fyceWJ/0qT8fVsJMwO2xGuVAQCZQOavaooNGPelUe2Yjv5IOoeTq8WCoTzdFDh
         T5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIxI04f0Nacii2yudYwlkKbj1kEujth+ncGEj+6/WMZYCh8myK9HVOes6xDDYTCxNWWdOm9qMjBk6vZon4h0PTsCnRZFTtbYaB
X-Gm-Message-State: AOJu0Ywc+iRGO2PpJ/UHd1duN70Ndgy8I1DMzjmHe+sotXEb4/f/5BCy
	KCO8dReh1rg0G1n0SFU+Cjiah/2W+f0I4by+rqxxXVKiluZGzl52o7LfBI0mIRU=
X-Google-Smtp-Source: AGHT+IFMUxU5Z3h0JtviqQ6YbIFzG1v4A97kqONBvP3SlthSR3Cm/ZZmQKSvWDI8YPlTZPb7gvEiuw==
X-Received: by 2002:a5d:6208:0:b0:346:bb51:c203 with SMTP id y8-20020a5d6208000000b00346bb51c203mr6059990wru.12.1714320711038;
        Sun, 28 Apr 2024 09:11:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id fi29-20020a170906da1d00b00a58f1eff266sm1325570ejb.189.2024.04.28.09.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 09:11:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 4/5] clk: samsung: gs101: add support for cmu_hsi0
Date: Sun, 28 Apr 2024 18:11:43 +0200
Message-ID: <171432067235.26421.5148957892529383246.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426-hsi0-gs101-v2-4-2157da8b63e3@linaro.org>
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org> <20240426-hsi0-gs101-v2-4-2157da8b63e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Apr 2024 11:03:07 +0100, André Draszik wrote:
> CMU_HSI0 is the clock management unit for one of the high speed
> interfaces, which is used (amongst others) for USB
> 
> Some notes about the clocks marked as CLK_IGNORE_UNUSED:
> * CLK_GOUT_HSI0_PCLK
>   CLK_GOUT_HSI0_LHM_AXI_P_HSI0_I_CLK
>   CLK_GOUT_HSI0_XIU_P_HSI0_ACLK need to be kept running as
>   otherwise the system becomes unresponsive and it doesn't complete
>   booting.
> 
> [...]

Applied, thanks!

[4/5] clk: samsung: gs101: add support for cmu_hsi0
      https://git.kernel.org/krzk/linux/c/04ddcbec5651cd4da80d3b83e9c6d54c50dea456

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
