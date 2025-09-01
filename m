Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE58175A5;
	Mon,  1 Sep 2025 00:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756686838; cv=none; b=SD4kU/fSpoFfT5CrOKjSFmAoq/y4ub8YcegUjGwEexRrdkffwLHUDSrdLPnvD+rcFtiJeDzCt3HAiAwY0tQU6OtU9+qR87PyBdNmCqWBqiLWey2PFn8HKguckod6XLbwbtA+IA5sE0vZH1iaFBYESewlnFZTUNP9KR9XyF8bNH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756686838; c=relaxed/simple;
	bh=TSWrSyoDzTL87mcL8MuZmOYXKTCJO+6HOjb3ku1UCWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqithVNFvvgYqElGmQGU96XB428N+48f+cGEj/xwGWiRoUGJopJL73t9FFYEjbJhjfJCNUcrE9z+35oL6SEUTTQ8G2hEA46sMtGDGQmABP9RwiKi4FT0VJekNmnG0qFOFer5z+/2BTJYzA4yfvgMQwdUROf2c8NhLjFSfFfk1FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuvJZmIs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuvJZmIs"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so5681850a12.3;
        Sun, 31 Aug 2025 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756686835; x=1757291635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvH3gCh3YcyePorgXaVz1lgEivaFSAAjIPEZY4vEWpE=;
        b=EuvJZmIs0MrZA8eH9ZjaHIDJ58pPGiGFVWcjAPMs4h1DXENrS8Cqhl+us2PRuVcaa3
         HBUR8ZASwEtl0gg9z9Vw4dh1aALtfsVc8WeAJjZYOesSSk3qbV3Hca1+cUSEVzenHce5
         r3OvNj1zIRq88inOGaguX+9JxbDyxchVXXa1Oz147GTWeNdNaovMgrQbjwtbFsldUdOi
         +egDDomcoi0Jv8YfXmug4Bm7BdS2Tfnw00dTZG++ZDym1lUZIDCFmn1DUSwdNtY2BHzu
         ZZ4rrSTJ+27cGG4zQ8kHW5pOFQpJefAmO0KVq3lGLJH+wDjg+yGgNB3CQ+p/BILRkejj
         WgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756686835; x=1757291635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvH3gCh3YcyePorgXaVz1lgEivaFSAAjIPEZY4vEWpE=;
        b=d38I36TZJCMV8YOpb23ybB5OHZx14TVKiIeBKTLXOyk6Lc6MZDBuS77mzZ0iYoPsne
         V61DZU+gXjxnYJwXtlDDLORIlxpefK8m9MrG7nlolETL8NJOHHo36fFUXmfpsI+Eof+G
         8mq5ejLvvKj+Fbgf5OkwsQReREkhqYaz4mXtQDxbxL9rdck8hvO2Pct5oIsYV9EWpNBH
         pLzbgnMaMEJcES74FCbrna1alnSnvp0d24rA7aQK8qTXRMJWpxEVwEGvT6ZK4wQMpEGH
         Q4f5/6yZ6RqeW9bx8LdgYtUnEdD8KE54G8Q3c/uFsdrOR+GJ6zsrGR2LBb0kfmzo/8n3
         fkHg==
X-Forwarded-Encrypted: i=1; AJvYcCU99VHsYiqz08C2Dkje8L4qjUtS1T8i8qLtHmpY2D9/zotHNY9IHjyTWXJ0+D5wnPtmv4sTtCtdKHqp@vger.kernel.org, AJvYcCV8lRkIezHtAtWluexmCz3hxp/99md4vvVECVCwkEsiD8i2gl+TuaF1Ql1luY0kqZ6MHNyMhw0QxGpV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe3iCQjNkbBCpQL1R6vlVfLGyhpPPG6+HmkyfFcdA9+/h+1bGX
	W1b7CqUVtYYA0oklNnWE10hVfdEYtiu6fZhEvzeGzCbFJfrU+XCGQdj9MWPLGQngj+AE1jwyMlU
	UpYaIOTb8Ne+4nPqa7DJL46bDm1qMD733C5olBy3epJ2U
X-Gm-Gg: ASbGnctoRw13hDACNSpmI89v36u3ZD49xCYWeUENYx1up1ysxMApmsMjtwJ9JQM1n2c
	P8TY5u00ExfLYtAXGq7doRURT4r99Qas0x0Popkb6gPt1EQZfrP91V6AwglKxnbUqE431vUJS73
	WmGawSN1+YKYhPXZ0O3m4qp7LSOgEuX81pGhuSEwakfYdM+ZMibDBiPq3e1GN0TwQCdD43iRB6a
	7TGdiVRO+yJ/TIpOG9e9kZI
X-Google-Smtp-Source: AGHT+IHsnDIYWknvZ46S599IimzZF74o7ha/d+7Cbv/hBrVMIpqV1LTK6TMA9HYQ0QgUHmynIKjrSHRY7rxC6a02QK0=
X-Received: by 2002:a05:6402:27c9:b0:61c:bd9f:723e with SMTP id
 4fb4d7f45d1cf-61d26c3fabfmr4557103a12.22.1756686835238; Sun, 31 Aug 2025
 17:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <20250831104855.45883-7-cn.liweihao@gmail.com>
 <8571992.T7Z3S40VBb@diego>
In-Reply-To: <8571992.T7Z3S40VBb@diego>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Mon, 1 Sep 2025 08:33:44 +0800
X-Gm-Features: Ac12FXwjlx-F7jqLTPXkOkYRV923MnWRyR-cXYRmkjdjk9ub15vW_5_Mbgck2YU
Message-ID: <CAPEOAkRpuOOVXwDDha+990znhh0-PZwqa=F=mibGkJck5rgZ_w@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] ARM: dts: rockchip: Add D-PHY for RK3368
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This phy is a MIPI_DSI/LVDS/TTL combo phy.

maybe it be better to use dphy: phy@ff968000?

Best regards,
WeiHao

Heiko St=C3=BCbner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B48=E6=9C=8831=E6=
=97=A5=E5=91=A8=E6=97=A5 23:06=E5=86=99=E9=81=93=EF=BC=9A

>
> Am Sonntag, 31. August 2025, 12:48:54 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb WeiHao Li:
> > RK3368 has a InnoSilicon D-PHY which supports DSI/LVDS/TTL with maximum
> > trasnfer rate of 1 Gbps per lane.
> >
> > Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3368.dtsi
> > index 0e47bf59a..674a3676d 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> > @@ -884,6 +884,20 @@ display_subsystem: display-subsystem {
> >               status =3D "disabled";
> >       };
> >
> > +     video_phy: video-phy@ff968000 {
>
> I think the node should be something like
> dsi_dphy: phy@ff968000
>
>
> > +             compatible =3D "rockchip,rk3368-dsi-dphy";
> > +             reg =3D <0x0 0xff968000 0x0 0x4000>,
> > +                   <0x0 0xff960000 0x0 0x4000>;
> > +             clocks =3D <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_DPHYTX0>,
> > +                      <&cru PCLK_MIPI_DSI0>;
> > +             clock-names =3D "ref", "pclk", "pclk_host";
> > +             #clock-cells =3D <0>;
> > +             resets =3D <&cru SRST_MIPIDPHYTX>;
> > +             reset-names =3D "apb";
> > +             #phy-cells =3D <0>;
> > +             status =3D "disabled";
> > +     };
> > +
> >       hevc_mmu: iommu@ff9a0440 {
> >               compatible =3D "rockchip,iommu";
> >               reg =3D <0x0 0xff9a0440 0x0 0x40>,
> >
>
>
>
>
