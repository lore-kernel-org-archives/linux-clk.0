Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE3395AD2
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787133773; cv=none; b=MCv4w9eOu81fN8JKz6/84ZGq+nECa/eDVrcTcGBKnjlORUGzGgXkoYEVDTtxlIu4Sww26KliigtDAb5vihPv4CvWY4BE9BzYVFgDvNusL/QI3MrbRg/KzlqELxi8+T5rJ3HYt+OS0+9v0BhPWtqyFYpXIwm71GK4vXcQBg5UyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787133773; c=relaxed/simple;
	bh=KHXxQrdPyMQV1j9h53mmteeq4E6nsKAgQweLk1l7yi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SeVuJ/YLEQ/mPWMjJfNnX/AxbdwYN/qhLE5UG95IjKx4C1mGUYj2ZMQfs2cGJNtOzpPUSFYRopg/fTGvUAKqHeUsqcF+191tTnjrPtbis0bhx+ziN75GGzBnLbF2YoK9HK/emKGEeV4/eoZR+jZkcTEjFn0k6uQYTll4l649//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTsQ7SVD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTsQ7SVD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215E11F00A3E
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787133772;
	bh=KHXxQrdPyMQV1j9h53mmteeq4E6nsKAgQweLk1l7yi8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iTsQ7SVDmjpOMkJyIMV0UDO+IqH4FuS7KPhqaAa4SYZimwGrefrY7KS5h1KnX5p37
	 TGAiiFqPjHXrrez4p0hcfEvh9qKS/YfLTgb1/QygVgsvPDAdkkkZuWl9cFjhh3jjdC
	 twFSyAkhjdCw3zdHtHpwSg+SJOev8Ini1WxjcUVzgcesTpJQhvfuaxbPuwUDGa6q3R
	 601HeuqK60qAETdXnyz8jtYvOP9nnlY1qrW47rs1isnZaXD8RWKWUE62v/7CaMd6wY
	 EAEAXhcAeBceiRdbxXT+Y3hAgM8c5w9KHrG2i9eA4Wgs/F9eSOGkcrnBlcZrCLCCLb
	 1F8TWAyZ1aMqw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1016684e87.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 03:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp3hhEFzKzdV/mcFKRl8eS0eZf1CIaeRx2+GlCY86axHg4Him+fL01Q2oUmN167AT6hOsW4vKnYuk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7q7jzig/x2oF5ev/Ys6efKuKfENLJwUsfzhJAZOKQrxLFpeFl
	SgSbIdnQDZkKos0Gz6tXEOmWsggOXWbgYNSrtB7IlQ0SO8apdffXEaerOVXYGsokjQ7dKA4ccec
	kvbb8hFk6yaUX/wwIzTSvmgzt3ctxtpg=
X-Received: by 2002:a05:6512:1284:b0:5b4:5a41:a8e6 with SMTP id
 2adb3069b0e04-5b47868ba2fmr768992e87.12.1787133770878; Wed, 19 Aug 2026
 03:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-5-7bbb12f0360f@ambarella.com> <CAD++jLngqGzethEG5Hx+oAPzZoV6rvWNGXYaycFFkDz_dXFz=g@mail.gmail.com>
 <7b258258.6f41.1a01943e97e.Coremail.zl020895@163.com>
In-Reply-To: <7b258258.6f41.1a01943e97e.Coremail.zl020895@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 19 Aug 2026 12:02:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLmf9_kp6b_eL0hedyhZLvzdVTXNDe_AtTf1pyhojdhTmA@mail.gmail.com>
X-Gm-Features: AcwNN1X8jEhwleIm8t1lo_bZxTU0D9zLfJvN6rMgb_5K_Wo4kFGRz26QFUIrtQY
Message-ID: <CAD++jLmf9_kp6b_eL0hedyhZLvzdVTXNDe_AtTf1pyhojdhTmA@mail.gmail.com>
Subject: Re: Re: [PATCH v5 05/12] dt-bindings: gpio: pl061: add Ambarella CV75 variant
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Long,

On Wed, Aug 19, 2026 at 11:05=E2=80=AFAM zl020895 <zl020895@163.com> wrote:

> I checked it just now, Ambarella is in JEP106BN as bank 16 / identity 0x6=
8.
> Per include/linux/amba/bus.h I plan to use periphid 0x000e8061
> (designer 0xe8 =3D JEP106 0x68 with bit7 set, part 0x061).
> The continuation bank is not representable in the classic
> 8-bit designer field; please tell me if you prefer a different
> encoding.

This sounds good, make sure to patch your designer ID into
include/linux/amba/bus.h enum amba_vendor maybe as a separate
patch if nothing really make use of it right now.

Yours,
Linus Walleij
