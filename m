Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0980422A7E6;
	Thu, 16 Jan 2025 16:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043223; cv=none; b=mYe+LgYgqIqbLMAW89lFx1Khd+MWuF+WRYZ7cA97EQXfH7BGKk2AeYi5Q0vzKieaXrEkl7ljpbRKZbt3KZBQsYWLr6eSBdQEqv4puD2bwdVIH0KLT69zmKBVjPfy94Moz2OaMgbcyQBwJb3LDfryvFfZkXbMdqKPYfWma3gonEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043223; c=relaxed/simple;
	bh=03CNHJApFKuIItIyArXaqYORwbEMmfvmo2iXGsI2caQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyqMAylH72EQdAbN758qEDfA7JK7YC/90V07e7WQdCkrkiPQkc6Ae2ydPWZPVcAVuuHMdUM9xplyPie5XUFNfDa0OzKChYWE6Sw5dXLw5/glMy/I2qinFGeKrlY5M/vzICwt5TPK3q1/H7mlh0Uhjqgapl9MsQ7uu3ft2JuOx4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aspxbGiO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aspxbGiO"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d9f0a6ad83so2264272a12.2;
        Thu, 16 Jan 2025 08:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737043220; x=1737648020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03CNHJApFKuIItIyArXaqYORwbEMmfvmo2iXGsI2caQ=;
        b=aspxbGiOQrvVt8aMFMUsi9ATP4Hk2HkMHBA8qoWaKEUwYkpbKyR2F2VUVRcNvLe2Sz
         WOnt96m+zDC/F3YiZMyNOz3ghZJdcRgPXzCBItHyEJhZBBe6MUyAeBpAJUgrIeeR5Ewq
         RaRIiMCBfPQdWGjd49XaXazjD0dPFX3tuOQERAnC21/nSwgUgdVmxhFJo0dkh/8aoi3V
         vVU4zvbw1MCDeVZ0FY5IjJ3SibT1E4kB0xCQmox+6ZXlvxUkTYEKAyU+v4s7ix+VQROT
         CIS9YHTYBYyFhAMSwojK5QMfNXT9jm3608kfslfqZRRcIcm/aJHJRNQFu40fobwO5KF8
         Ag+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043220; x=1737648020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03CNHJApFKuIItIyArXaqYORwbEMmfvmo2iXGsI2caQ=;
        b=vzn8LSnOYa7186EAG4tov35iSP4QpLZz6pRnS/2QRR4qQpWH/4nq01C2mJM1KuybiT
         7mYZ5X8gjJ2BsGJ8iYP739LPKWBTnEEx9enuKOwWOAbv4AX83HZkBUMy2qRJzctPET3L
         LIHtCVN80ZQa+Wa2YkmjUruyAkM4CIxFeCwiDzWQo7eR6C9iYLG5QJ5R51BUlHkQ/Qaj
         pCipOtrCPjBwkhTiOUtMaDGXX+ibgCwZTcef9pLFF9uBKgvBP/2c7f+OA3kg9Q+75GjY
         hHBHIU6a6ghUKuyPw5CRZZQKTqkH3my4zpZoZnWLYQCB4eA+azWGBxIXQgcpbINiR1Ro
         Fg6g==
X-Forwarded-Encrypted: i=1; AJvYcCVy8WRkpJGKhnnB36k50wzMKutUS6l/Y0tHzp2SiVTh3xnoRFrFfp92W3GLFLr3DReA8hZTUy2uU5bv@vger.kernel.org, AJvYcCXQ6dapQ3LRex7Mwsqn88gfUQJw6xKxZZn43BPVVSkKoJ2mB1DqhuY74hjwRXHjEexImY0mVVvLRSm8GthU@vger.kernel.org, AJvYcCXhAEjJvLup3FeZLuXwPldVAbfHDRaJYTNYAPTxMDYN+uA/hi6vycUdUS7aZXRKdLqzVl8/7J9N+w5z@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5boAKJg2zhk8j07cNkBydFrLYPFAk4N0rLb1w+oRfalCuXAp
	7qlD+HfUgfgQ+fAJ2FKAaAFWkFrnpU4CK8rUt/fpwRumVIxazXFRw1LMNl06V7TMaS6XGYJpKyT
	WydRKTOP57h+e9mX0vCPmelUbBXs=
X-Gm-Gg: ASbGncuNjnAz36wBLx361QC0YO8paMtwlF+70E0AaJBYLqzS01vL7xX2L0m6T+Xeoop
	ku5af1tZvsmA0TU/9e4aRY8yhdGEfMdPFF41NN3c=
X-Google-Smtp-Source: AGHT+IHuxtD1JvcYemQsyiIws6tdFTgTs+4qivEFZoap/TFlX96ws2N0XRh4Mzzuy/ekqhM6BhFqBHePlBLhuYIk58Y=
X-Received: by 2002:a05:6402:35c9:b0:5d9:f402:16a0 with SMTP id
 4fb4d7f45d1cf-5d9f4021a86mr11833443a12.22.1737043220056; Thu, 16 Jan 2025
 08:00:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
 <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com> <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
 <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com> <CAMdYzYoCj9FsyHdTQAOV4DFpD7OdMDaJ0R=BBxXG-SLguy512Q@mail.gmail.com>
 <F69CE715-C0E4-4FCD-943C-89CC1D3E848D@gmail.com>
In-Reply-To: <F69CE715-C0E4-4FCD-943C-89CC1D3E848D@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Thu, 16 Jan 2025 11:00:08 -0500
X-Gm-Features: AbW1kva1Q_Tqsgtr00KCSe1Rmn_xPDMkxiMe43I-JtCUAF1Z05Q1Na6dcupVLX8
Message-ID: <CAMdYzYo2gwJw_HvhS-gsqSMFof+n0dS1LUhVznL8bRZWYp_wHQ@mail.gmail.com>
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

On Thu, Jan 16, 2025 at 9:35=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 16 sty 2025, o godz. 15:02:
> >
> >>
> >
> > I'm at a loss here, I applied the patches to a clean 6.9 tree and even
> >>
>
> oh maybe issue is in kernel age?
> 6.9 seems a bit quite old.
> i=E2=80=99m on 6.12.9=E2=80=A6.

The patches were prepared and tested against 6.13-rc1, but nothing has
changed significantly in the kernel in regards to rk3328 clock
handling in several years. I jumped back to 6.9 due to dyslexia.
