Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF00D47CA78
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 07:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061869; cv=none; b=bP+/Mfw0o9/9QzrZ9z4aj+27DEVuKDBQOnpXgX7dr9lMLq17nhbpBPSF/NRfB9jsvA/r4tb3DMqbsPqQqaxx6FDLbVg3wwWAVeEGSiiHB7BJNvf9AB/PuOCX5s/H+l8oHb2TqBXDhc0oNLEXnT73QH0FRCpRFBlFCY2PhNtS+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061869; c=relaxed/simple;
	bh=dnHoQ9hJxT1jx4dONrAt87VQ3Ef84mxygQ9fqqx65vM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPW43lw2PeYDxkuWHbp8yaCvMpUV1eS9l6VYtr91oDyvagy/QtsUUSEbfulF00QEwYFA4qIR2Hxde4hqGKpyj7uZoMNcb/7hlqcB7yWtoThbVjU+iRck96D+A+kjG+5irKjeEwlygh7rLU0Iub5fhzsNx50FM8k6YIEwEeyDGrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+ZiLe9N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+ZiLe9N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B1B1F008BF
	for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061867;
	bh=dnHoQ9hJxT1jx4dONrAt87VQ3Ef84mxygQ9fqqx65vM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f+ZiLe9N+4HhobIOiXEkHSOzJPiavcqREHehqAwNFiC6345vzVqQ0XkFyy0KZLSon
	 mL8vlDLDMcccOzT/PVl1scbUyc58IKW+EpJhksVggpBN7qVRYVOFrfk1dfoi8DTMLq
	 XTsyDObN9lrEAZIOn9ddRz8TKaRrnEs+mS0QUYuqlPXuQqg0i/3o4HQSnBnBN2RlkL
	 t/d7Mf/CRnjOGt/CFEOYqI1b2ZQ3umC3r4HNuAtWJ9HEwmjNVNMvGGPEdmhDctmzKK
	 /MlckJ13teVFVlHezc3sFsPaWvdMGeBM/MWBUTpKBBKPDweGpMgVU1disO8Pej0Myh
	 3y51cbIY09riw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b845so3121484e87.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2026 00:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcjvMO13YguMlT3eckYOODjFWFdpZcaotQra7JRZSp7fnIUu6Dh2PS9Y3bHS5VEEOIzC79QAHH7lA=@vger.kernel.org
X-Gm-Message-State: AFuF++l/RPdNvz1EotvXA+1ndkqnU8y2pJbhfiSkRT+aYN759BzMtozM
	G9TsDS9BJll2JwlhYTej+hJ68qaxOeHzzi/QZTPvypmRg2yQl983gVPSriro5vR7SH6vCGAHQ9y
	D1ZoMnUTv2uxavuikYX8RilAoIsxIL/8=
X-Received: by 2002:a05:6512:b95:b0:5ae:ba8f:f9fa with SMTP id
 2adb3069b0e04-5b8c18411aemr4246334e87.18.1790061865764; Tue, 22 Sep 2026
 00:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-11-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-11-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:24:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLk1WEwWRFdLjkbY3YSJmbQ3oLaoNAv3Ca6ZJ2ebubp2jA@mail.gmail.com>
X-Gm-Features: AclHuK9erJBC7wstRYz1ZiKk7AbclZKt0-cY_QBUwQ7InLcjPRkXXHSAcSuac_8
Message-ID: <CAD++jLk1WEwWRFdLjkbY3YSJmbQ3oLaoNAv3Ca6ZJ2ebubp2jA@mail.gmail.com>
Subject: Re: [PATCH v8 11/18] gpio: pl061: use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH
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
> Use the standard IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH helpers
> instead of open-coded edge and level comparisons.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
