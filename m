Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E0E1B580C
	for <linux-clk@vger.kernel.org>; Wed, 14 Aug 2024 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723651261; cv=none; b=mjoqmXzUrX2qxE9jGOZoDgEVMLpSE6vgez5oEb0OoSOf+RIM355CCrPXmdM9R0dWdI5AeqQTAJNxwEQkkFjbBA0YZ0Je3BO6kt7e7H14TCHzM9OnHvm8rca85Po9wWOJ04DGup4Z3ggH5SsL6eGEki8J5PaTbtt77uNPlasIl5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723651261; c=relaxed/simple;
	bh=oLlx8kbXtgT1+h98Q08HClm2cRfuDS4Jxg7GijXyT84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vp4MMNi+WByOBj62kueGxprijQH96fPXQ3ImUqz8k4LdWlkam044LIgpcz+1xkpeOVONxKWANEfts7HLzm2KId3loPcUb5Hl3Bjfnm8bg845jZX+QYokjpal/3TGGtczMY+BD52k7/tJSYDKfBjVMmGuGrD5n2i3Us2Y63v+qIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WcngHzte; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WcngHzte"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7abe5aa9d5so5822366b.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Aug 2024 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1723651258; x=1724256058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6hg5lhUPiTHteMjAtZ4DGZhyCZPAhbUKp0ZDVO35ys=;
        b=WcngHzte7z2+0R8yahuC+jagCozgcKZBz8zLuPzWiXPuLIWoK6gVjbWjADmeL578G/
         2402+EBakHEp2IEmwNwB4iyZYK50ImqQzKwFANBOBgBTLdRD8gRq1pj7gsGQ+aTqptFy
         7YbRfsxuiBYRyCf/oDVqgjX7VCmtq6vdXstyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723651258; x=1724256058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6hg5lhUPiTHteMjAtZ4DGZhyCZPAhbUKp0ZDVO35ys=;
        b=ZfpljX6DskRHrpkS5vg+huu7UegdnD4t2r0KEp+XmVB9SgcYBq5omX/WbnrHEL+Gb7
         ddgbsm1nXARvPdjsl4+xku4Bx6uxakNk7NES/+ez9YJzO4SLO5ugBl7+5osH+D4qHwN2
         anyyMnkBbk4StVqygsjiSQmmDSqBFtXbQj3C9pN49NCRm4lrJ+sSkdKE6E+C0/DG4JRM
         hin1THWZuzFjBFMlepYTifYUZhvr6bBTZr6rc5bVhhIUTIy0lxCyu4gh+D+pWN+CqqqY
         Kd0ciXsrniy1hUygPWn38S6khY7/xu2rhQpoANkhSkqL6DEPk1DQYOfewSNyy1GzR+jx
         ot8w==
X-Forwarded-Encrypted: i=1; AJvYcCVPKDYrJJ7ocQVlYzcNAHumxKmrtX4SfP7k0LgpMCQon5WJag+wjXNcTEBTgaFB6YSAZXcJCpWVBQ7H1yMsJJXgtffbJIcyzPEq
X-Gm-Message-State: AOJu0YzL0AFUHCnzEXSTsgWCtlCznIR1njhkx+Ltv8uSoIbwaz2aZpI9
	8c2XnzU0HcuhY6kWWdtzS5ynTGVmFfUIojKE/wOFIIJ4RYOuJlu7Tt+IiPRX8xrPBstJcjjX/HY
	Qnc375ED7pRWR1b43Ti+eO6zehbhV8w1eQOhV3w==
X-Google-Smtp-Source: AGHT+IENFPXzmHmrz8jSJ8HsNlXGesQUoIAVxwoQN1tYtA8UozxZmzLthTqj7kIZyclRgdiVGC4awwo51S3E9XX+6KU=
X-Received: by 2002:a17:907:e616:b0:a7a:8378:625c with SMTP id
 a640c23a62f3a-a8366d45bebmr216496766b.36.1723651258158; Wed, 14 Aug 2024
 09:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220605165703.1565234-1-michael@amarulasolutions.com>
 <20220605165703.1565234-3-michael@amarulasolutions.com> <5f34b6d6-c2dd-44f9-c1bc-fe1deb336334@gmail.com>
In-Reply-To: <5f34b6d6-c2dd-44f9-c1bc-fe1deb336334@gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 14 Aug 2024 18:00:47 +0200
Message-ID: <CAOf5uwm3p5AJXL9w7hQtqz05hDpQ_-CQArm0z6kAehj7OxK1Mw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] clk: bd718x7: Enable the possibility to mark the
 clock as critical
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-amarula@amarulasolutions.com, 
	Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen

On Mon, Jun 6, 2022 at 7:26=E2=80=AFAM Matti Vaittinen <mazziesaccount@gmai=
l.com> wrote:
>
> Hi Michael,
>
> On 6/5/22 19:57, Michael Trimarchi wrote:
> > If the clock is used to generate the osc_32k, we need to mark
> > as critical. clock-critical has no binding description at the moment
> > but it's defined in linux kernel
> >
> > bd71847: pmic@4b {
> > ...
> >       rohm,reset-snvs-powered;
> >
> >       #clock-cells =3D <0>;
> >       clock-critical =3D <1>;
> >       clocks =3D <&osc_32k 0>;
> >       clock-output-names =3D "clk-32k-out";
> > ...
> > }
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >   drivers/clk/clk-bd718x7.c | 4 ++++
>
> //snip
>
> > @@ -100,6 +101,9 @@ static int bd71837_clk_probe(struct platform_device=
 *pdev)
> >
> >       parent_clk =3D of_clk_get_parent_name(parent->of_node, 0);
> >
> > +     of_clk_detect_critical(dev->of_node, 0, &flags);
>
> Purely judging the kerneldoc for of_clk_detect_critical - you may have
> hard time getting this accepted.
>
> I think you're working on a very valid problem though. Maybe you could
> see if you could align your effort with Marek?
>
> https://lore.kernel.org/all/20220517235919.200375-1-marex@denx.de/T/#m52d=
6d0831bf43d5f293e35cb27f3021f278d0564
>

Old thread but same problem. Is there any way to make this acceptable?
any suggestion?

Michael

> Best Regards
>         -- Matti
>
> --
> Matti Vaittinen
> Linux kernel developer at ROHM Semiconductors
> Oulu Finland
>
> ~~ When things go utterly wrong vim users can always type :help! ~~
>
> Discuss - Estimate - Plan - Report and finally accomplish this:
> void do_work(int time) __attribute__ ((const));



--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
