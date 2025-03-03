Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5224FC03
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741023065; cv=none; b=uJuLMidA9LxiVyA6ICg+dbIP1IXdrO0mQj9Nw21zsaBk68p/Rvqe3d9/zGXkYdVeo7FqYYvfXxP4JKBGGFS89HYwlQKd3xj7a6tGNWWDZ3jCjnwLjhj2T66eEjxTyJM/1BCwQyURgVgeScxlfdbGVShmwoEYfALXqbSpTLIjCvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741023065; c=relaxed/simple;
	bh=EwUNeYrjXw4Abxl4Ekempi49OOEBziqDKshlyOT2j2Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=de9EGqg2Tz5Ku8OuV2rwvKk3WQIqDZ3VT5Lw/q4WCNLQgTmIfZOPBdXHP6bAQvVpBgjA52zAgU7jYBgcRGwqHb0+BFXpVGUI07cuKc2jPRzaX8HBFbzhWxZ7YOAE0EFYVR4Pu8N6P2zzkms1l0XzkPu/MvXxMM9aPjO4DMJqy80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0KstmVA; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0KstmVA"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e539ea490dso1962425a12.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023062; x=1741627862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tn2H88qy5fJsuv2JITum7avWFZmr0OiLNZ9SxsUWXM=;
        b=G0KstmVAT1uQfwQA2OGbyrUwar2gw8eIrzzaL+AHm7pohGGHI+1kv6IWw7arrPfDXq
         hBfZXvYc6p4O+QOIxs5pGiTMKX7XvUhsRSdN7PRR92yNMzdL8/B2YyiBosgjRwRQTFb/
         mOzokQDIz9670FZzJtz6d8cIL5EFHoAp1kmbS+82DEirEeYb3ZjhSJgD99UwmOlmfiZe
         ELsTiY0Ytp1RXFQNoEmp8M9xKsJ2mu7yHRmgm1glygffkgogdxi1UHhajfoOUb+/ouJ6
         fTP9Qwjivo32xCT91bfHM4pDTW/wtPXmgr2z9CsmZAhZlXtMfCWws61duuTSZgyplc4l
         ec1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023062; x=1741627862;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tn2H88qy5fJsuv2JITum7avWFZmr0OiLNZ9SxsUWXM=;
        b=AVSRXxznWoAaDJloLhQI2JMy0j6ZY3OqMqmfxUY4GOFvJgBpvdQwarmaLK9fShSlpC
         uGVfhMKoMZStBMwDjHUCS7LCuDgCfVz5LhMKbSLuXnpk0O8lRgmt1d7Hf5pIYPpKbUmm
         3/GKWqDz7G0nk4GkHNZ9kwEJCMdGVjrSE+reK/S9qnYymvK6XYWwXXTLSmkY4r+SmrzD
         1So9b2uM+mHoPZ9kwDIqfJG+fw1rp1q43XcvwHWZVO2M6m/jGhOCAq9FaD1rzYmIG0od
         3UdwzS1gtaQzrLTKKNo21uxsS/PZ+e3ZvIWvmXYvaZ84s9AdgXFlKkrFznugmxnzIKUs
         nQjw==
X-Forwarded-Encrypted: i=1; AJvYcCXFZZLnTyUe/+eI3wozzBkL2HzrmLGR5/CYUHCUuaPfeO6kz6YBfLG2XH5g/ORJlW5/VUfLnMxBqIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxif77AFNCVSoOebjMaDN0y/giU1ebjeAPLprVNZUnR97iXJ/iI
	UCXKD+zhldlGBEatQRsbaFGQFFtnvtEmg2UgsgPydnXJbNtjOsrQ8WzTRXuU+sQ4y+ZAUmFRxGt
	s
X-Gm-Gg: ASbGncuvgMp7Rk5XE+TI1UiRyDOWMpwzx/C1oZTAp3zxzN6P7BlAiWio4lQYEQ6Oi+3
	l/3Noy/pxn/UElp5aq8ZVA5r6ZRQgp5XcPJoVjUeVX5otyf+2Y9EDu2jywaFL4wRnzwFnQm2qtw
	cDQvHPASrjSOP29BYaMMdJUSwJoCMQPjv8H+rJ1BXqqJsHlOfjncqo1BXdHJZB9dU8mKrRAgMXp
	LVdSSIhTFyxMjWn4XVFhXZafE/u6tLzkG/MkhrbTT+9kAb5SZEwkISAlTaF/SJiAD2k6Cecvrgt
	wK6I+a6MTp/plP6d3G7p+AeA5vcIScoXF7ufVdwlhAI=
X-Google-Smtp-Source: AGHT+IEDCHbXJFeVr35xZXSASXjjlWalAgEpW0iSBToGQqWlsuonpEUcEGYcVr4M4CEdy1EY0ZamnA==
X-Received: by 2002:a05:6402:42c8:b0:5df:25e8:26d2 with SMTP id 4fb4d7f45d1cf-5e4d6ac58fdmr34237245a12.5.1741023062067;
        Mon, 03 Mar 2025 09:31:02 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d26esm7085355a12.20.2025.03.03.09.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:31:00 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>, 
 Stephen Boyd <sboyd@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Adam Ford <aford173@gmail.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX
 DSP/OCRAM_A
Message-Id: <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>
Date: Mon, 03 Mar 2025 19:30:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Wed, 26 Feb 2025 11:45:09 -0500, Laurentiu Mihalcea wrote:
> Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
> it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
> the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
> 400MHz.
> 

Applied, thanks!

[1/4] dt-bindings: clock: imx8mp: add axi clock
      commit: 2471a101938b0d1835b1983df08daeb98eef1205
[2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
      commit: 91be7d27099dedf813b80702e4ca117d1fb38ce6
[3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
      (no commit info)
[4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

