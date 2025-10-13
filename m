Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BFC202F65
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361156; cv=none; b=d83TpV8Xzgpq77FG9+2dCK7xXYNacFKTOsO4RzYai1ismze2u+P1psgxgvukw3BhfA/nQYnecEIBwefoLQiET6ithmRzNicI9cfhBYab0WJfnW4cmxj23Dr4qcqkMrJ5anZAmmHFNXnqVA/yJePMqWHNLyrPamhg5vXHLGJTCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361156; c=relaxed/simple;
	bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePtVE8XOJunh2TrJ5c6VVkAxWZhFFTlFqp6RCZSDlh80iy11YZsPmSTEvHL9eFgq9l1dooyGolwHtqFiTBNAIM7voVurOPLsTt49DfUshm2KmbXjM4dgd3muqNIesREa97RdfHIbyIsR0tyiVxP5RESydn7W+tg6ANiKJBRrXZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymHa93Am; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymHa93Am"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36a448c8aa2so36274441fa.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760361152; x=1760965952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
        b=ymHa93AmOHyeoIONqnse0WzUIiaL5YmZCK/9aCdAoMvu94TZJBsUKdt0NIgfIFaFRi
         ZT2Lb5nA4r9lgLM4hea1nolQBO4mlbMqnELea+rszXep+RF5/G/lLhreR94Raxh9Osge
         6TCkbRieIDbrgA6J69IlwVFBGToALIZo5yx6CdpeSqqA46h1Nn86HUgJQIiWzVEuolUd
         K6FvR7OK6rnPlCGmQdvbhkA9ynaibN2eVTiNS98MNquhhH2lQV2fk7LiE9aY7o8hB1Sd
         MU3MsWtrgnPKCDkmYpGWSgbVNwZnNgjtCvV++qflS0q0pyGq5XLvv6FmMHN+5at7stfb
         6F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361152; x=1760965952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
        b=JQksL4Ec/MwJCQ2q3q0OtFv0CfMba8bMdzxv6ZDzNg+EOv+CK4B6VohS6ods+5iCD9
         nb7qT7/UqDvX0I+5Pr6VGFlgb5Ghod+lYWdHYi19+K7uWPR2XXJjT5OQJIJZIEAs/Na3
         zOT2CNKqwy1G35VW2e0DZll94CSPJvduv1b/PE7xkRTDD/tosScYkcaKMv2HoCz3wmef
         7RsUy0RXgqHdl/FIRw0U1rbNk8HtX9XSLUWaxQAQ4nBfKV0M59uZQIBe7BugHpNBBqyv
         ndYEHZJS9FaKYlmW+oONyJM5Cj/xnZ72axEK2fs+m1TFoYkvZXqZuVjT9si8/dZQ8Xia
         71AA==
X-Forwarded-Encrypted: i=1; AJvYcCVO5QaeN6zXCpXilfkzIYgHiJ+W/xZUJCn5x0+FYR90tDLSAa7CztofmP1S+yh2ocnD8Pn1d46BOUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY2HMNDFZNENW/k4+J9NOCQbYL2HliSDrthRXG7TTvQ9RztWEs
	G6TWZ5X9sjbaW6ZkmLMarImH2sLemMV3blzq1DIr1uLDS6sFT7RWhAeogOq2RRuMrCu9eJosAFd
	khO9lnirYXWXUeJB01Kiwi/5LSXiu80/cln+vdaZuJw==
X-Gm-Gg: ASbGnctetWDDsVzAFgt8yhJ4v58JESG0KF9Spu4w165Zz2xk+LFVp9N+XPPmUX5DRQq
	qU8kObGEbj808zBZ0Xh09wqT/Y+0tusNsWjLdolXAisr6fDvp7Akg+tl6SDg98wj3rw47CgFh+t
	ioTYvdmCRtNrmz0cX03sLjDTkOmWUrD2gQwMxWAVrRaHjDTd/L9OyAVeQc9a8VbUKngqoJ7Yipk
	xo1pTdPgEuWyC2BD5CG8C681u9q5mGwu9/qp63M
X-Google-Smtp-Source: AGHT+IFy7QQZzDisxgLU7RQiHqmGLbp9GU/ko5TeFOP01cdLTHtzWG4syZZ8PgjrdKymxne7+Wg23WBWjWeGpiwOdDo=
X-Received: by 2002:a05:651c:4394:20b0:376:45a3:27c4 with SMTP id
 38308e7fff4ca-37645a32d2dmr19705401fa.5.1760361151675; Mon, 13 Oct 2025
 06:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:12:20 +0200
X-Gm-Features: AS18NWB0Tr61DfHtPSZqpJT6vjMUO75ud5f5_b3M4zNOdVsqYQjTLusmQxbBsw4
Message-ID: <CACRpkda3o55N2m=H+RA2p0r598KBLv6bbbin76Uu5Sy44qCLig@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch looks like it can be applied independently from the rest,
can I get a review from Thierry or someone else at nVidia so I
can just apply it?

Yours,
Linus Walleij
