Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289EA38A72B
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 22:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561961; cv=none; b=ERbJ1eXZbjyjjoyPoKWs9RwekhKLrq5sJ+d/E6wu4YMz3LG19fkjBC1wM7N7V9LMDbwyKYX+e/g8tfdl7CXVJdBgStAXQq2rpNwSK3Vzb/smOu9JB9g+wBoPKDnr3g2IDRT0w6sW7QscerXbt5fS6lC28z/vIRtvCXETl6xhUog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561961; c=relaxed/simple;
	bh=N6PrZC21iwen1B31Vi2jxyoGAz00i3RnJHUvEeJPYKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD/g+etDzOEzEUqAIqwoOlYKiXxFe45BAj/8W0P3W8Cs6rglgZ75LL/Zn6ozvtiMq6iy+XFTL6up9khf/34A7gZxckpQyN6iGRZilEyFcdvXJXVgoqUQdnKi39L8+4UtyWOzYlxAozVxsC3vLy8dvMaP02POayJLx3v1F7ScjSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d70iELOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d70iELOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15251F00ACF
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561959;
	bh=N6PrZC21iwen1B31Vi2jxyoGAz00i3RnJHUvEeJPYKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d70iELOPejhaBBj5+6MW44oGn0aWXKRbgAohwfHSsU/NLiIvY/fHQDlN6hkNCQojh
	 KhsDrUKRNEtpUBfA4wXzCclmbNO5nsV0ItTAAd+M7utWhgIOTI88JJVCdlEfYcfHrZ
	 Sp+cvzGDdyzy5G5Ds/uDrCbuGDYAm4vbC6ahg99HB8cJlTwyoMUzwGszByY5/+7QWO
	 hGA+wKRDNsUhZmdcUspY3bXo33TZP7b4J95yD78zG9+PN2BrODGzpSpap7cLoFk2oZ
	 xdMdKxA+P3VuuxMZkwX/X0dNbrCd4U0OrHFZtaKhN8khrcIWsGPUbucNxAh4IFP59x
	 lI2oMGKWEi3Rw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b5607bd3b5so1364621e87.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 15:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGkAYu6b2Qy+jHiQ+yTkSvHF5S+oLujYw/5Pla7vI3jp8IU/7JUCjjgEgUPR4AGlRyBhbyRNGBdj8=@vger.kernel.org
X-Gm-Message-State: AFuF++nK/06GaE9+iSJR35BgQuBDnoLNGOgzTGGc1jO4rayFf2qqh0rJ
	L5gErVtC8WztbOfh/rBwGqwAONaZW0+UgX6ZC4M+zGlDrjur00JqcEvt4/KVLucIoNB9uyzPqNc
	ajXbIwZiLlS/lSFjtMFkqu3NDFZKYK9M=
X-Received: by 2002:a05:6512:a84:b0:5b0:eda:de26 with SMTP id
 2adb3069b0e04-5b616f2f892mr1623528e87.16.1788561958599; Fri, 04 Sep 2026
 15:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-13-e918514cb3b1@ambarella.com>
In-Reply-To: <20260904-cv75-v5-v6-13-e918514cb3b1@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:45:46 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tVwQPPCFCc=J6gxBt4VvSJKWKvbAeSRSybfXjvpcdPQ@mail.gmail.com>
X-Gm-Features: AcwNN1WvpRED5iixL57tKxLT16byEdBDfHJOlSmTYR0bXv5jc6tVAgVJ2Y214Ck
Message-ID: <CAD++jL=tVwQPPCFCc=J6gxBt4VvSJKWKvbAeSRSybfXjvpcdPQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] MAINTAINERS: add ARM/AMBARELLA SoC support
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:39=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add a maintainer entry covering Ambarella CV75 bindings, DTS and
> related drivers.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
