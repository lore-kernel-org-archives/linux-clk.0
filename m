Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E583DCDA3
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787124786; cv=none; b=CJTrbEzREaQSZZH0LedE1LM+wz91UChb+fLhheNpxA3JdXp6yKF91lxVq2gc0RhDmi/PhQ7G+/72n4hHclIlzHYSVhbdCNOPZKqQ2m/Xmx/5jys4ds894Br7fMz3eR7eXWtfU8gJv7rAFFIT1IRUR13QVSYILR1Zj6v79XfV29k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787124786; c=relaxed/simple;
	bh=VkxwTHhpX690h2pXqhYY+zmBovwI3C9WHSBD9ryCt6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McIX+TPGaK3oG8IvpsU0p3A8GX1xPMwKgqF6IKrfCd1lWbP54JcmD+xp+ZtCpTRg9yMVa/wddkY8BWMQCPANMqUN4zMglpAg5+NpK5XRyw4R1/cvN850S8tQrjx9bFr8mP1pMtoQQSbiT85YO4COezQaz0NQ6CV51wxomxE7JaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpOjroIG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpOjroIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445721F01559
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787124785;
	bh=VkxwTHhpX690h2pXqhYY+zmBovwI3C9WHSBD9ryCt6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dpOjroIGI85uGUmiGJs9drYoXJhWNmVi4Uu3qGsw/NyvsqnuNvUgi89N9RNfPYAWP
	 AEgu6FA3sfYXpsYY+Wr9HXu2c8CUR44guutkanr8ETQ64s6zPs4Fh46HEBjo8TPYvD
	 jjXR4/BaPP1E02MEgaQLgH9LhmetQeGWQMYLdCcKPn1/lPeuo0vL87iviG8vq5aFMT
	 7BUbcYev20AFu3U5/liiINcqpf2o06mkh1Gpk22RTGdfBkWjXs6MZ2GSuVFHiDCubn
	 dJzb1UguVvNUKib86ajaYHZEAOcpz6oxmJS6n2q77Tm19iJyblR4R/XacjfhHp7Blg
	 IdoWLK+59joQA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so682210e87.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 00:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro1Ewt9ePaY4FmATmbNvoNwRGIMakeEcZdoBjiTUoMU97+0epxlJKV6lyJXX1BrcEPMQZeJblG6Fh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVuIzeZvaCWCBAIsZczqkeku8l+afpcYaK57KUPHFKQ51UDEL
	cZPftVr3C2AD5u60e+g58toKF77B55MPq4RkhGjioODwHX5aX7lCPEKmotcI//V1FlNjE6Juops
	8O6fA699BPndG1kdnd3pYPa+6SQYHnRw=
X-Received: by 2002:a05:6512:3d86:b0:5ae:a702:6528 with SMTP id
 2adb3069b0e04-5b478bdc331mr681671e87.26.1787124783764; Wed, 19 Aug 2026
 00:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com> <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
In-Reply-To: <20260818-cv75-v5-v5-6-7bbb12f0360f@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 19 Aug 2026 09:32:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsyZDBixXMDFUf1+i0ZtYkmzpc+kggn9bx7=8W-gZHSw@mail.gmail.com>
X-Gm-Features: AcwNN1WedvW-uebjWVm_0ycL6wQEG6qNIR9PZrbwX20kSbc79ar1YheT6gV97uE
Message-ID: <CAD++jLnsyZDBixXMDFUf1+i0ZtYkmzpc+kggn9bx7=8W-gZHSw@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: serial: add Ambarella CV75 UART
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	Long Zhao <zl020895@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 12:32=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the Ambarella CV75 on-chip UART controller binding for early
> console bring-up. The binding requires a single RCT clock input and
> fixed 32-bit register access via reg-shift and reg-io-width.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
