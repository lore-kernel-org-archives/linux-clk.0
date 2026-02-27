Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF03A0B21
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180231; cv=none; b=X1qMXgeg0bPFUa/etpzGKWDMolwlYT1uH67A/RuI96wXuIQaSsnm7382Cd9/owuYcvnfBnoMyDXOROPShL0xpaSD4et8IjAcFSqJloR2+vTihWF4fqAwd2XgeYF0KerOtukiE1MDUFCt7axNcBGx/wsXS6BJlsJvyuAkQ149guM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180231; c=relaxed/simple;
	bh=m1v1NON76PMqrwAK+QogHbEEQapfrZUSwmgoYwLysaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1ONwPjsm2fY3ZZtSElTg3fPTKjWfPpQByniItj6cvdHvk2ulCvl6WxkBShhLKEL8trog6UBrrGEEyqI7BKnj/t37hrzLtEgfXr9XJMa1nrWkImX3sozqat/lEgqq5qEcyNeACYrmmbDVq3op5Bu175I11L7GMtScv3w715kOI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5fdf6ad2517so998844137.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180229; x=1772785029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRbyV6rB0ACPTuZRlxL65vpkYib9H0d5lAlAjAED1c4=;
        b=Q5SqDRJN+iNnjnLUz31xXozvCwj1nmOOsGS0Aq6ZQoQnvz9KmkHgUkMCFKMK2VGFti
         WTOYngNRgkSiJZM5OkYPw8f7yCC0Ip9DFnQxtqisTpXtkxxNTZft3Lnv+PUXjw56g8kX
         v4cs4tMXUrNCcQBoSlYWwmTeTNohMxlh1fDEjpM0eTRXNoIfh8YMq4pI8m/SOV3Rmwew
         e6t//2Hvq+PhiEca4/1dEk2JqQyrhgBG5UJnxvHzTQaVmAN3CoXJiojdo/PT4r9fXdot
         QcxPMiEn+avXR1FOo1zJhxDDUynAsj5ypKQ26IIP3f7zz3fv4WmfVkNMRu8T5ZA0lHii
         7fmw==
X-Forwarded-Encrypted: i=1; AJvYcCWHpt5zPCKZMBnb1rVAoFVXg0AGxU0Y4xgNhEraB8hmmly3NMZ3At8b6CuCopivCRAeG3sd5a2Bp+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YykCaYQms9OuvUdvLsdTV9ySQ0NWrBbO9gisp2a/7KZbIrw6BxP
	WlWE27CtNRsa/9GBV9bznIMeQXZL0hzLQLGbr7gSbsL5t6TFd7trtRSDIaMXmWmEKR0=
X-Gm-Gg: ATEYQzx5ilj881bU77orJZdjpOzt+yz0Ez8x4sCnXMp7laO4vuASwW3svVid33JeXuh
	ygE/FI129MBk1f/9U96KaHULH59GPvxYkfYnfhmX0v87W/WEB/GacvYVWE7iJFLObN0JR5xM/pI
	ZZmxQtBpAfHkmHud51Vo61C3lX9lxlbzHxOLcDiFCjeRjfXVchgGvKWof9klUUxLh6eVcGbNXvO
	mNfzF3B+b6eL01YXZPTzFVwdUqJQvHqAT3lNX/GMm+4zrPHQ/4FohXDHHq2L6suG+LSfaBY5vsV
	VuwYaQvE75aVzYJ35e1IGP6y+WsA1H7xwpsEQxAj9opxjMt5xT7KD6yZqv6ZPLLwPunzAKa+FOz
	0GKqsX4D8TUXoG104H5q2IXvsvu2mjMmx6IzQYrAlRrtvjkF32Av4tsMYSMj9P5S4k6Jmx+6Hc9
	IsG4qYdq/TIBM8o35pyZyOVoQQ2a53wtc/5fRbQzwzCDfZ3XfwGS7ssm6Yo0mS
X-Received: by 2002:a05:6102:b04:b0:5f5:3bc4:725f with SMTP id ada2fe7eead31-5ff325713a4mr1107092137.37.1772180229612;
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1e80818dsm4644350137.5.2026.02.27.00.17.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:17:09 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5fded42aa7cso1170237137.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfs6sioRS+lKnZgcz7cTMuXkj6StElv4eIZcCVjt9aL47VXs2MRbbMcFPuvtWTa4hmt4qsGf8HaPo=@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5f5:3619:8bd1 with SMTP id
 ada2fe7eead31-5ff32494193mr1107329137.25.1772180228608; Fri, 27 Feb 2026
 00:17:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-1-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:16:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
X-Gm-Features: AaiRm52todzA8Sr5byokA4vkDZ2E-x17wtaWy3OW25tgrEahH799QvmVZU00ayM
Message-ID: <CAMuHMdXfPPs26ZUnWd+_+xUU0DJ44ewTMrtbzco3J2Bs165+Xw@mail.gmail.com>
Subject: Re: [PATCH 01/13] clk: add new flag CLK_ROUNDING_FW_MANAGED
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

Thanks for your patch!

On Thu, 26 Feb 2026 at 19:17, Brian Masney <bmasney@redhat.com> wrote:
> There are some clocks where the rounding is managed by the hardware, and

s/hardware/firmware/

You got me totally confused, also/especially in the cover letter! ;-)

> the determine_rate() clk ops is just a noop that simply returns 0. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
