Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936883793BF
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 20:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529953; cv=none; b=okRhlZ+azeDS/8enyKl2d+g2NoCG30VmKu5SJQIQgd27zkW6M1MOtChSOEWPuPf+AmTpOT4P7/8SAWmUVnlTfXe2LoYgxl4S8my3Oj3t+VEuCCTxF/J+vqvu87yU6no+KlOk94WBknil3VCgbJFei6A8sB9WK/0447uxia0kGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529953; c=relaxed/simple;
	bh=2Xsowmeu2RyzTVACoqAzvMX79fACSIN87yT/5+JNn24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chvDGHyQbgQAypnlBxQuKqvgzoHZi8Z1SLoA9yDykCpRL6Gtx/66alyDyjfvepdE8GnKo5jKY0mBzFq6rhBUrxRhIuQRoTWKHfGg7t/A5/r0G12A4aKUzPQvZyB8W+VfW8R8vGNzL2EjMkJON+xynwG5YKbIhEjo79hiEy4zBK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ut/rzfkE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ut/rzfkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588BAC4AF10
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 20:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529953;
	bh=2Xsowmeu2RyzTVACoqAzvMX79fACSIN87yT/5+JNn24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ut/rzfkEkxSQVJ7hvg2gtO6RIoATawPoLO/LzBoFHk1N3oMedL7fWii5dcdw9dz6b
	 J51kg8bIAGfkyUvBmduu7zpL6FKRE22Zr5QsHn0BtEZuGshRBbXLv4WjMdSyPQdgvT
	 OeUDgJMgA6DsdYZ6YEhEPRHYYZwa2AfkpN7bzsR/7JFLpnRpYi+d/cb1PIJLY3GHyh
	 MBH5LsH/Lzfd+LeqmNU8AltNw/bYfFNBtt2l2tdwqYTmwEJ0LUQviIEL85TuVwcSD3
	 IMsYVCZPvqM40y1b0nOdlDeeJZc21FPfsYORXiFvbLkRXG5T45nHZjowBSW7dDVu6R
	 ayQ8YXFRatRbA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38be5e86918so60045551fa.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 13:05:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NXlsmIb8VWgn6re4OJhbMMRDwODjNYfBbfnSD+MG2Bc9Dpj5UNVfCzkRXfHutl4UQI3g9htfSZLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcIT0MWqtM2I0+Ai6xNcZnRI+JH4vorYRxMnsIo8Kb4MQocV65
	DU06TrQBySosJ36xAlvJZSlKYgto7HfUDMXoFK4Tp5EOlR+ZKuHeK31MRS6oRRdaINzoXu4DxSL
	SQnaVAcuWE4vZCqp1oJZRjMP8ZO7qOIo=
X-Received: by 2002:a05:6512:4008:b0:5a8:80ce:ba55 with SMTP id
 2adb3069b0e04-5a887ae1e90mr8495895e87.11.1778529952053; Mon, 11 May 2026
 13:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
In-Reply-To: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:05:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLnJn9MOrsF0EPte26ZVbwVWHGuubqmTpss5D6Ep7kAY9A@mail.gmail.com>
X-Gm-Features: AVHnY4IWb6Oao5TaGJ75WC2JjZJs_EcccJqTLmElh9HpaEFa4BQJq1a2vLp7XN0
Message-ID: <CAD++jLnJn9MOrsF0EPte26ZVbwVWHGuubqmTpss5D6Ep7kAY9A@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] pinctrl: aspeed: Add AST2700 SoC0 support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 10:12=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> AST2700 is composed of two interconnected SoC instances, each providing
> its own pin control hardware. This series introduces bindings describing
> the AST2700 pinctrl architecture and adds pinctrl driver support for the
> SoC0 instance.
>
> The bindings document the AST2700 dual-SoC design and follow common
> pinctrl conventions, while the SoC0 driver implementation builds upon
> the existing ASPEED pinctrl infrastructure.

Patch applied!

Yours,
Linus Walleij
