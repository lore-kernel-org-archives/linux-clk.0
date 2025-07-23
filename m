Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A0326C386
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 21:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753305382; cv=none; b=IeCNa4SYHyz3ljpyc2CuKLV8CcbRPq9Jn8kfM12DrC6sRNS04Y9nQWPx23a0xAdDwf1gIGtF5v6jk6pS8gBS8e9x9yN57xZ7XXuW+W8RzoICq+i/n6x4rkKBO1uNju3g2Z+OuOUAmRa/0cpi8sSH1HFTjpdMukZFuaXQ6gcS+0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753305382; c=relaxed/simple;
	bh=yWyJDF3Q2SumP8IS31W52vFdyTdD9QP8y32xJ3aVsWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nwrpn13K4rxEFQ666860RJTHe5+7kJ5XcboEuBmTUto7ZN5rbS2zbKip5gXSwn/7mSdKzAL9JQzN8AMCtqt4NhOsHxI08jrqnPUMWgXsGQTRXTATivZJVa0LTEJX5xXIUVy2IYU5W880cQQw1dwCb7FgHS6CYUpjqfpxlpnOY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TB2m0bfb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TB2m0bfb"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-611d32903d5so3244a12.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 14:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753305379; x=1753910179; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yWyJDF3Q2SumP8IS31W52vFdyTdD9QP8y32xJ3aVsWU=;
        b=TB2m0bfb5AWnodsdI4fAEe0G25DPq8LtpAMClOdD/1YTS2jhq5Eb5DG1EWe5FtLuLy
         qNrGoar7njwPPDGhlAMbnxBPCljPkWLUXxUz3zyc/VRwGnPAIYhUHn8UZMdGuJjEJ22L
         423/h9wpccWK3CqTPWZDh35goLIjqDiOsjVL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753305379; x=1753910179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWyJDF3Q2SumP8IS31W52vFdyTdD9QP8y32xJ3aVsWU=;
        b=RWtOozaA81szys106tYqVdG8jnvxem3kGA1vh73oMyoso+GPxgD/fGb6SbBd7kiaj4
         ENZrj9MTYgK8+o6FmD+mMLe/yzXIgzCgCL05rdFB5eN6VYzifyGkPyxRoaW4iaqfyg1O
         BlneiJt30jEJ6KjjYtRsXZ+CKbh/3cB6AEaVkAyx80hWEx65mrCqpc8QGv8q1MhKV5BB
         glfInyQ4UAsZVpD6t/FvnqX8bgcWYTgXp5YR9WIwDpEjMdV4KFBoMj1zawbEgTaqqWUS
         XlY7ZD2b8R5FM6FJ+oR21+ZMtamcqCMBHg4LHaFTpZNR94ikQtY4R10SF6GoeKTcgVRY
         dGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYhwXcSXpfM/TJ+jcLLCqtE38EKb24/SKVD1rNu8K2Djt456kKkLPmiknKed4OiGdLIkbebbP9FwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xvl+ukAhNpcdPcHNQKEUHftXJ16zFLmrDvZD2fNTOd2uqzLC
	fViav70RAnWeqC3Cc93rgziSQlOW9dqg2Fz7ZMXyUhPhqMTnbSAfK/ncy7EAb63kI98GCZTZkxj
	0Hh1pHM8AENGMcWcGr8KKIGjpl2kIrkBZIAfaHUM/
X-Gm-Gg: ASbGncsdIo7xWEGhRXsiO2YUL70HGxej+YkHdWE91MRhLy+fiB40jnV+Bqlquuvxrjx
	NfzY/nKcIgjUaAGPkhS8031R5Eo7fnWZgRjiFp0zwvWqtkcaQQpfHD3oCxCwtVmbsoRVM17tGso
	GLDgPuhmbGscjNNbpxS2zUIh+K5YGBFlnihrN8Y/ART4EJkSvPawuzTsK388ddujmoNqQUTliTW
	QTJCYF+dtTfWO7LyB27X2SV2UkRqoDhQw==
X-Google-Smtp-Source: AGHT+IGkycQnfe72S9SyWbMalkjmg0I49bPxAmbp0MCvmAI2AYuaRbELjXuXnq+jCKrEmFtw1MggLjmHYfDowt+Iv2w=
X-Received: by 2002:a50:aa8a:0:b0:607:bd2:4757 with SMTP id
 4fb4d7f45d1cf-614cce2f67amr6758a12.1.1753305379189; Wed, 23 Jul 2025 14:16:19
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <20250723-zealous-turtle-of-perfection-e67aee@kuoka> <e9e33fc7-4705-4e6d-bd33-ce9dc1a9b94e@foss.st.com>
In-Reply-To: <e9e33fc7-4705-4e6d-bd33-ce9dc1a9b94e@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 23 Jul 2025 14:16:05 -0700
X-Gm-Features: Ac12FXyYNcqm7jBBLCa0VFOXC51yHGdhXmCX5kALRLR-kvG2ffG7jYjz27Mm2C0
Message-ID: <CAODwPW-bwg-CD8qfP0cb58QVFLfJSqj6DhZSQuqHxsEdLz1QDA@mail.gmail.com>
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I don't want anything specific so yes it could be cool to have a generic
> node name.
> "sdram-channel" is fine for me.
> @Julius what do you think about it ?
> Is your existing software generating it in the kernel ?
> I'm curious about dynamic node name generation.

I'm fine with whatever for the example here as long as the kernel does
not rely on any specific format. `sdram-channel-X` seems fine.

On our platforms we generate these dynamically in the bootloader based
on what we enumerated during memory training, so there's no kernel
code for it. If you're curious, our bootloader code generating it is
here: https://chromium.googlesource.com/chromiumos/platform/depthcharge/+/refs/heads/main/src/boot/memchipinfo.c#25
(We can update this if there's kernel consensus on a new format, but
we'll still have older platforms that keep running the old
implementation and we also want those to remain compatible with newer
versions of Linux.)
