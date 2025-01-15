Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454D1BEF9E;
	Wed, 15 Jan 2025 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946975; cv=none; b=Lw9VzhwYJgTMHOJ4+DC3SaFj3ZpJo5nrULfVIkAmuNe+Bay2/9JcfXgsl/sP/DDE2pEv1pOuOwlOetzZ7t6dEKgNF16Z5ea0XHzgPS7a0k4NfI1xMQMlGQE7jrblG4mmBi4WUxqko62Z0SYsGld1Dlgbhj6BwEPoXXEZibbD29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946975; c=relaxed/simple;
	bh=hxMT+EOt+oUhVHlzI0Dq3TZpbOPTDPRyYDcoR3J5gYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K144vXoBCh6CPu1rzpXUXzD9uv8By6AJphPlU+m1a5THNcm5hDhyYsRFFmpAArLoE6aGkOpri4O8MniB3ocuxwkRP3hj4tSerQjUnLcnivVXpYYxngH/t2pDr1BKrCjyHjz+XqC/v6jBSJNvwHD9noEy4MQRi2iVckTaluPz2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGwKUIvm; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGwKUIvm"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso11235174a12.0;
        Wed, 15 Jan 2025 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736946971; x=1737551771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxMT+EOt+oUhVHlzI0Dq3TZpbOPTDPRyYDcoR3J5gYw=;
        b=MGwKUIvmO9gPBIcpa8tUD4Ik2iWhOcMyO1n+lIqe0gtC/m91osPv2zqVnbF2XYI7Y4
         SPuWWoKQR5Hf5cCoMhYI7KtKOVeW+DPuAkfzf9U1OhOmw/3h0/k5tyZhE/AAXgt99Lqq
         Zly8V+ivKdhyjXj5eX4c/XIhyAMiu/YrLMnplgssQIDvOeNnRyld24CEe7mZIL7b5ugF
         z2eX3dRBFWhbSUmDNG2ezD977S8+n+4pmaMeJAf+WykPjJ6FEuHI6AAaZS0yPem0vyLk
         VLMNjpRGRHr0P9fLWYB6byt4KbyaDnLUfjdrrU+b9VRmay/VqOEsg3hor2TltD5TGhWa
         QowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946971; x=1737551771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxMT+EOt+oUhVHlzI0Dq3TZpbOPTDPRyYDcoR3J5gYw=;
        b=bBLie0ydfo7M/zmCZpEWnCTPoVvokaeij6YHBm1E2keE0bkGA8auvnowoxO3NSTSIi
         MO4sOkmh6lPf4Ybg+bFCzxPrQLep2ew1Ieo8ss+JpVDauHI513kDehjn1ckLvHCd0BEJ
         iBb+JSkeEEKTHN7Cqk+htx+U2dOwy+YX0hp6ghl1xzoSmatoEs4PgvE6If+8wDkgViMd
         cMhr7bhD0iHubsbKM44YU6nK0/agfEMTJ6eN4WMSp/mTxFshLmyk5C5SJh3PER2WKBrB
         rJS5KVE/C4f7QWsFV9rMQj/Ga9TkhHeSqMOMvRrzz1/Dauk+8D6gH+ew3X4B3kcAn+3X
         SWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcXKdNSLOCB8ogqmuxRFnT4PF3CkVdOuUKKTn7jW7OSh1ze47xCEcBwY9uQIu1gJ704TS9i0th/chn@vger.kernel.org, AJvYcCX+yVzF3uIDIiu33tSrvwEt2Jjk/ds9tAo0011L+XgbXXs0VZ1DL5brZOiNXSc9mascXpYjdoxT4su29noU@vger.kernel.org, AJvYcCXs5+rnkov1YHyQFfZcVCMpAYS9OBuWZ3l7ZA0e9oSCOt3YjUiwemKBMQ10RQaWHif3cdC7BqF0LcHj@vger.kernel.org
X-Gm-Message-State: AOJu0YzvDmsXyAWbwD4GPPBeKndI3qBfwhoL+lH3xfdK90lRd4lWmezj
	3XmUgh9lEaXMq2LTx8ZNHZDJoBB1NAl6swLV7DG4KL3amN1uwGy06SeM1qbv6Et96jAwuiYUp9V
	9Ssl7QdBUzRh9iwEdt4v8UCFLyXc=
X-Gm-Gg: ASbGncu0ABzWtXiQ/m6UKL2qOaaQpzPGf1EuBusKWFYT1Nlj7wTJodKHIGVKSH2qFZ/
	HVa+afr4wEAyuDU+RkurScP0l84wNZpJYM0iCfA0=
X-Google-Smtp-Source: AGHT+IGqNgQvNCqEhSn4YPN8QYtdlQn700LKTgmmyFE9sPXhQKin9LB7OlqDrLmstSu/qLY63i7jMpGdi0qWOY4oHGg=
X-Received: by 2002:a05:6402:1e90:b0:5d0:88da:c235 with SMTP id
 4fb4d7f45d1cf-5d972e6e4d8mr24223573a12.31.1736946971366; Wed, 15 Jan 2025
 05:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com> <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com>
In-Reply-To: <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 15 Jan 2025 08:15:57 -0500
X-Gm-Features: AbW1kvY4MkGurzp0mS0S6CqMjSh_jTqZIAme4zVrx6Zwh3T6atp_XNIcYllHFX0
Message-ID: <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Michael Turquette <mturquette@baylibre.com>, kever.yang@rock-chips.com, 
	linux-phy@lists.infradead.org, wulf@rock-chips.com, zyw@rock-chips.com, 
	Dragan Simic <dsimic@manjaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>, frank.wang@rock-chips.com, 
	Elaine Zhang <zhangqing@rock-chips.com>, Alex Bee <knaerzche@gmail.com>, 
	william.wu@rock-chips.com, Zhang Yubing <yubing.zhang@rock-chips.com>, 
	Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Trevor Woerner <twoerner@gmail.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 7:35=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 15 sty 2025, o godz. 13:25:
> >
> >>
> >>
> >> Do I miss something?
> >>
> >
> > Good Morning,
> >
> > That is an interesting failure. The simplest answer is the
> > `clock-names =3D "refclk-usb3otg", "usb3phy-otg", "usb3phy-pipe";` line
> > was corrupted. Please check that when applied it matches the patch
> > exactly. If you are still having problems, you can send me the
> > compiled DTB and I'll take a look.
> >
>
> oh - this check i done as first thing to look on :-)
>
> pls find:
>
> dtsi: https://gist.github.com/warpme/6af9e2778fb06bfb47b64f98fe79d678
> and dt: https://gist.github.com/warpme/79340c54c87b2b1e52f2a146461d8c9f
>
>
> and compiled .dtb

It all looks good.
Do you have any CRU errors in the boot log?
Can you check for the presence of clk_ref_usb3otg in
/sys/kernel/debug/clk/clk_summary?

>
