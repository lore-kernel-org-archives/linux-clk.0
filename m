Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4A2900A1
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 12:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794613; cv=none; b=InkLaep+lTdBlRhzfbTFWXuTIjeW08FMhi7IfPrrtTmVmJn5GKuhygQ7JNN0qyluPU+ka+amddQQJdD0XGWwfuUy1BgMvBQDsqLiCiwUAMx/CSSNDrzrsaQWPOgYZaXNeP4tZPgT6E6LDFFHx5mN+Xl4xC9Eq8yETHZq8Y4wrxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794613; c=relaxed/simple;
	bh=dBq5NjX3jmgg7se5CJ/Fx1O2rSIBfOC+Pwzh4kwEhtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=udDpFO1Jc7CMeNnp/wuEH+UPcxJZuGWuK55x9UuWsc98Z3a+Uawdakx771bQMx21nhHY66SfnUdF5D9aAQb5NEEslNmbF1Us8Yhzmeu7XVzfGkW7MF9sAD+W1FnEIsLa9Zf3qG60i7Cc5amfdXSV1s/6twpA0LDoGhghqR9sv+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=McYLpU7P; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="McYLpU7P"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7082ad1355bso18525537b3.1
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 05:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746794610; x=1747399410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk+PX1t5YjNrLbu3fw7I3HTDSpUrF4EYuLzp9K2iLrw=;
        b=McYLpU7PpNPPIkLcsWUDBeHPU6ZiLCpZIhmHvfUqKXEnIi8zT6gBLwEr01/aNtjufH
         2NxQY4RNZRi1LhglVCVDpffMyZmeg3vY8DXpWrO04TiEP25QEPe+8ZFAQ+tLbg5DCD1K
         W9Z8sJV+3hPWcqWn1kWTJnJrwsLMKzmr9DlGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794610; x=1747399410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wk+PX1t5YjNrLbu3fw7I3HTDSpUrF4EYuLzp9K2iLrw=;
        b=fsHmuZJssfjf2mis+o2LL59Af7cezD0IxjeMH4jUATRNVC2FIiQNWeamXTIrLOwgd7
         pG/FSjaxYr+kEIkl5elsT/IABVa+8d2HoZxPnhq+0BtEZbkwF5p256bB+klydINpq5aE
         zeT7sZbGqmPGBghg0WE1k1wDysWHYi8QtJU8FZTK+8a5PHPsg1jyModIxtXveYhe6Lgi
         oY1EtzI4pvKnApwVe+tK9xDRkKqbFLbVRq5a5Z+0m0bVRs+eWZZwfbwHLgpbzsGdLn3B
         T4p5Tvl3IUxryMJvO7icnRi8wgQd5IvmYs5Rl6Jso+1XiZC/8H5n2v5ChGTc0wi7aHx8
         CnFA==
X-Forwarded-Encrypted: i=1; AJvYcCV7K/h0NKJiVs+XH9yOkFd04jDyhvlP4i8ZA43FHFjdp9L3JGPCDbYXFxt3X4mxhAkPiYsNasQ1+Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqrrEtc3eUWL2seqeLmFb05leIEu3YVGMldtGpYu3fc+g8bk2y
	QgT5q1R9DMwlLMGYbG0NzilFTUty2k3Lp6OY6M7C97OhFJtcQCHCnD+A3fjwrvZIEKNKgx+nmjJ
	wAnUbhpQmHt0fMFUf+FkD/DSgiTetaOArR9or3g==
X-Gm-Gg: ASbGnctpl9xhvLbDYfUpC4OpmBe5NGtR+KrTQe/B4FdXiutai2EMRV3vo7q9tNEpmc/
	P74ZWGGUQySJPeSJIEtVk8t9P0TeP8p+i7wty+3Wa4yr7KbZ8ZW3j29exZ0RxoylP8EJKku/0on
	S8cO9+kiXNMzHjgxXOoQ==
X-Google-Smtp-Source: AGHT+IFrjZ49BKORpGjnuIsEC44rpN9s+TBJde8pml0KWAikxDuw2695c1SnudEFBoIfDQFFwneLL6Ms7ZC7MJFaDXI=
X-Received: by 2002:a05:690c:4587:b0:703:ace3:150a with SMTP id
 00721157ae682-70a3fb605e9mr40252827b3.34.1746794610485; Fri, 09 May 2025
 05:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
 <CABGWkvrkVLRocFsZs9JLni4KDZCDyYDZxMzwA9AzAwipmUyTzQ@mail.gmail.com> <aB3unsCzCFUkdp9i@dragon>
In-Reply-To: <aB3unsCzCFUkdp9i@dragon>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 May 2025 14:43:19 +0200
X-Gm-Features: AX0GCFvVFue8wdjYB0ISSFwk7W4pX-EIs3Ikr6iut0B47FJnqLkddmDVofMWjCc
Message-ID: <CABGWkvqfyH=dcuw6EDZaFVVebj8SZhJF0P944+mmzL5YK3-Pug@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 2:02=E2=80=AFPM Shawn Guo <shawnguo2@yeah.net> wrote=
:
>
> On Thu, May 08, 2025 at 10:32:10AM +0200, Dario Binacchi wrote:
> > Hello Shawn,
> >
> > On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org>=
 wrote:
> > >
> > >
> > > On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> > > > This version keeps the version v9 patches that can be merged and
> > > > removes the patches that will need to be modified in case Peng's
> > > > PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted=
.
> > > > The idea is to speed up the merging of the patches in the series
> > > > that have already been reviewed and are not dependent on the
> > > > introduction of the assigned-clocks-sscs property, and postpone
> > > > the patches for spread spectrum to a future series once it becomes
> > > > clear what needs to be done.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
> > >         commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
> > > [02/19] clk: imx8mm: rename video_pll1 to video_pll
> > >         commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
> > > [03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
> > >         commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
> > > [04/19] clk: imx8mp: rename video_pll1 to video_pll
> > >         commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
> > > [05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
> > >         commit: 2ba124053687c933031a6dc5b2e16ceaca250934
> > > [10/19] clk: imx: add hw API imx_anatop_get_clk_hw
> > >         commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
> > > [11/19] clk: imx: add support for i.MX8MM anatop clock driver
> > >         commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
> > > [12/19] clk: imx: add support for i.MX8MN anatop clock driver
> > >         commit: 80badb1d7264e83b512475898e7459f464a009c9
> > > [13/19] clk: imx: add support for i.MX8MP anatop clock driver
> > >         commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
> > > [14/19] clk: imx8mp: rename ccm_base to base
> > >         commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
> > > [16/19] dt-bindings: clock: imx8m-clock: add PLLs
> > >         commit: 6a55647af3334f1d935ece67de4a838a864b53fc
> > >
> >
> > Please check the remaining patches, as they are required for correctly
> > building the
> > ones merged by Abel. The kernel test robot has already reported build e=
rrors.
>
> I assume the remaining patches are DTS ones?
Yes
> If so, I do not see how
> clock drivers would require DTS change to build correctly.  Do you have
> a pointer to the reported build errors?

https://lore.kernel.org/oe-kbuild-all/202505090537.ss8RbFln-lkp@intel.com/

DTC compilation fails. I think it's because of the patch
[16/19] dt-bindings: clock: imx8m-clock: add PLLs
which was merged without the corresponding DTS changes.

Thanks and regards,
Dario
>
> My understanding about the build dependency is the opposite, i.e. the
> DTS changes require clock defines merged by Abel to build?  In that
> case, I suggest Abel pick up the whole series with my ack on DTS changes.
>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
>
> Alternatively, I can pick up the remaining patches after clock changes
> land on mainline (the next -rc1).
>
> Shawn
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
