Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4937736DA0D
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062128; cv=none; b=rH42JpbGantcoieD6Yb+GsSx0SdVWgqMaz+OgfjAs5Du+V7T8eduuqzY8/HLo4gjeKbZPFIW43+wfk/FuaIbn3AriTuEMJZiWc4og3GYrX2x3mVKcLYfQ4+4MrshKUdaBbmhfISuB7+ip6OPtPO5n64Fhc0cWKg7f/YxsQWQIuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062128; c=relaxed/simple;
	bh=jUNbiy0xDuTi7c+5s9qvfuW81PbsVIyH32dQ/SjREYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUfPAtvpN2VxpHhsnUc3vr2ZrZgHatCopyMrY8Dhjfuhl5BATQg87d4XSOtXlcEfrW+R9UUr0K2GO+G0yEF2VdiQppN4yqykUe5wdHexoB8FhLcvAtu3/8WneDHbXYqmltmkFCaiq3fyY4YWwNZQjPI+D/DQyD6VDpfCVaNdYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZp0caBb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZp0caBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E37C1F008BC
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062127;
	bh=RlS/01WyyurIPf4QsRysWjeX/pYeyMHVRzkWTplgkuo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OZp0caBbpefIvj9oDAZUhKHN7HmbUmSQEDEtJyByiNinpZk0O8y4fxtBhC2HvSwG3
	 nVn3uGo7rfGHO0FJAzg3l8b+9tkirrGKqpKntbc1kLUFH8BTKzyUGr51prwRh0TT8A
	 jmKeyXJeVqznfFEmqluszLaZuv8CtgzLp19JetSlzAJSToGilc4NUXKXeZrCz2xhe6
	 X7tA51sgsYuxNEbq10r+KXuYWZYb8M2U1qJxyJC9D5q3iqM8mHzzyusLZ8KQse/rV/
	 VtDcdTYWoki9oBne42YfmbwPaJv9I98IdOA4Xf4FTY/WfuzkM8U5IDrx7TAxDxmisn
	 0h0nFQkVVbtYg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16c81so3250087e87.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 00:28:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzy1wPhWopGPVE3W0bF2k99+8kOHEo18EUULx7affmxUfucpMRdSxRy+o4GP5z0+BR+E5nGIfMveFw=@vger.kernel.org
X-Gm-Message-State: AFuF++k6i6gwZi16KYBK948bHDKLfEr+bTB6OazB174ixU+4iKDGnwYl
	2uuiH+FIQmVwmm+fMfKemeyQL0FywxDXoVKEc1U/EpOAWj+pO7taSfkMfahuQ4fab5P8S/lgndC
	Rwl+yv0DktpVhZgJ6ybGDUgS52xiAjSE=
X-Received: by 2002:a05:6512:3d1d:b0:5ae:c8da:6254 with SMTP id
 2adb3069b0e04-5b8c18298d5mr3810337e87.22.1790062125682; Tue, 22 Sep 2026
 00:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-15-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-15-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:28:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnL5h2AD5rYvUYGT_TvQ=m9CQd6bh_NT=T28G7hDGFLDw@mail.gmail.com>
X-Gm-Features: AclHuK_pNJ1evLbofDMJ7O-GTWjLgf41H8iNHME4i3icaRDTTyzpN_Rs6YR6w7U
Message-ID: <CAD++jLnL5h2AD5rYvUYGT_TvQ=m9CQd6bh_NT=T28G7hDGFLDw@mail.gmail.com>
Subject: Re: [PATCH v8 15/18] pinctrl: ambarella: add CV75 pin controller
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add an Ambarella pinmux-only pinctrl driver with CV75 function/group
> tables. GPIO is handled by the PL061 driver.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

I feel I could just apply this patch.

> +       select GPIO_PL061

This doesn't matter so much, I can just assume this will appear in
the merge window.

If some bots complain it we can just ignore it.

Once the bindings are ACKed I will consider just apply the
bindings and this patch to the pinctrl tree.

Yours,
Linus Walleij
