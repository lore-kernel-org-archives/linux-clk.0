Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A9252904
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 22:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753396452; cv=none; b=L6d21qn05MMezPl1M3NJIUJLa+ii7jGQXVFpqZ6ieP62zleZvXIgD7iXv3UfNjfCxOpKjV9I7vCpaIG6Rf/sXwbbTxDF2pJeOGNpJm8RUUCLnl7zjyFvr71qzAmK5BGQyOh+ANtYpZ/2o2+hmOEQxiDrv0Gp/Oya7Li6Zzb/Rl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753396452; c=relaxed/simple;
	bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFpYFmJwxNkfJ5C5EP/kgTBw9EbeP7hsciXbk4QZIyGelew6Mt7aORYwTtzbKcukQdMWynrheDuyqE0va7zKve9mnDFbIh8RJEVL+Jocd4oanQ35ZAU5O/LTjNRNDCsnA3kgEyw2dq1ZYqyIH0xzryCTHtnkSHHEA7MrLLyn684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=US2p18qN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="US2p18qN"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so1847a12.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 15:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753396448; x=1754001248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=;
        b=US2p18qN5PcFHi1u1gmly3VWqlDIqcxxWAQ9o3M5wn90HoPNy4bcVO+WV7cMF7iJ9z
         pBCp8VFhoA5fW3ttUuUcHsh2SGYkOoxG+9blr4CYtQV/a2INNkc3+4a7UQpiUoURcQAD
         4FHF2UPqcmjyLJJwX+F1/1WQK0hiOv5Q8lp70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753396448; x=1754001248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOXxAx2oIYNb8vCpPM8S2JbT5dI3/juv2Ui5zwEncwM=;
        b=E61UhohXox/d6mlbVDjt36n0zZ7+9jLq10LlYkTq4Jv68IKLQlZR9VuqBd6Z96MZ01
         E7UD8yVYrLkugph/H7xaoAX6gBCbVgDTjOGxDfv2Wm9GJL4bTeKtM/JQTr61F3taEPjv
         Ifgku0B+vvgTQqDCI3VAB80aDwbRXRfxeIrriQxWoPaadQno9RMvDsqS3Vm36067F2s2
         nq+6/+3q+PD/vV3B8AGu8DN6k6lWFeVydi3iHiez43jw5r8SuPrz0FBFvApEicHoiSNH
         2PZpDyve7YZjKTU6XeU//WLzdAxk7sz4jo29m60CYUJcWCf/ahEtW+ArjF/52QbdeLe5
         zcBA==
X-Forwarded-Encrypted: i=1; AJvYcCW6NQ3/6FBCpmBlX6RtRkdOgTVGPK/cFRZhvTcqEnSrddZ6pWGy3FPUoq9p/WkpPrd0MdklF2g41Io=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwIMMZswo63r+XI53yaY48aZsmBViO4tkGFCYgp0B2MWTEaNe
	8A8RusYmLaoiw0MXXzmwaXL0bMgbwtsHlafDxAiPVVR9j+EKhqKWX+MhZzvlrW1LTf456Tbqc55
	y5tBCeC2vDDf3I6zDu0PjDUDy7VOZS4Ngy0mJlC58
X-Gm-Gg: ASbGncvml3XAHthOpS76FHoQHlIRFiXuTcdfi9j9UW7t+wj0r3ZQd80NonZDZHOXTdf
	5S/DG2j8Rgi3aTCjC0khkoZtkbtRhhFGWSK3E7YASKWS60XMpQX+IkNmElLB8OCgCwCW3xCqf3s
	uKb1B6f9PvwUw3eo/t+bGt2zvSp9b2Yni7ydc6V21x2wM0PisRVJlOMRdp5Q69iL3BndhyCB5Wg
	1hsn0LQaUoKc0vu756XX5NLmkorhW2q
X-Google-Smtp-Source: AGHT+IGw7888sY4RAxWgOIpBS2jsqbLS1GSQw9Ezb4XYcelgTGp5K5TJlI+fh66ZnLxrY/LAEeaPSDPFviU6dhf0M5o=
X-Received: by 2002:aa7:cd50:0:b0:612:e537:f075 with SMTP id
 4fb4d7f45d1cf-614ea7376b0mr11607a12.7.1753396447893; Thu, 24 Jul 2025
 15:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
 <CAODwPW_kex5Agqxg_i-XC308scEpUJU0me55G7iZ8nB9LC0acg@mail.gmail.com> <204401b4-b483-47e2-ae73-0994b39bd30c@foss.st.com>
In-Reply-To: <204401b4-b483-47e2-ae73-0994b39bd30c@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 24 Jul 2025 15:33:55 -0700
X-Gm-Features: Ac12FXyGMQKjEAnwbki0mRBqxHKS-33YCATLZ5m_kBV4BCbWy_vAFu3BOhmvtmo
Message-ID: <CAODwPW9drKEAMfQvQHV8eMTyf5KCHB4SN400JiUs0pgjoXy=sw@mail.gmail.com>
Subject: Re: [PATCH v4 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Julius Werner <jwerner@chromium.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > I don't think this will identify a part unambiguously, I would expect
> > the DDR revision ID to be specific to the part number. (In fact, we're
> > also not sure whether manufacturer+revision identifies LPDDR parts
> > unambiguously for every vendor, we just didn't have anything more to
> > work with there.) I would suggest to use either `ddrX-YYYY,AAA...,ZZ`
> > or `ddrX-YYYY,ZZ,AAA...` (where AAA... is the part number string from
> > SPD 329-348 without the trailing spaces). The first version looks a
> > bit more natural but it might get confusing on the off chance that
> > someone uses a comma in a part number string.
>
> The first one seems better indeed.
> If the manufacturer put a comma in the part number we should handle it
> at a software level to me and if it is a devicetree error it is up to
> the devicetree writer to fix it.
> What do you think ?

Not sure what you mean by "handle it at a software level"? Using comma
characters in the part number is not illegal according to the SPD
spec, as far as I can tell.

That said, it is still possible to disambiguate this as long as the
revision number is always there, you just have to look for the last
comma from the end (so e.g. the string `ddr4-1234,some,part,567,89`
could be unambiguously parsed as manufacturer ID 0x1234, part number
`some,part,567` and revision ID 0x89, the parsing code just needs to
be a bit careful). So maybe this is not actually a problem.
