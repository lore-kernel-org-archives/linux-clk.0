Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6E1BDCF
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856347; cv=none; b=U9QaYozqsPymohLuGSYmc3D1PKD4QmlvDW1YnjI6h/nhXVoxnklAwx9vOvBF/VnJWDjlbPgowH5cpPJDt8YI02Uq/qpYAtSNj7LbqBy8ULuaJ/DmL/q0TfHG3Oa2R7vrx3Q/RKMxO1LRm/i6AA4Ujg9PxGYR+bDHNrvFUGaOlo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856347; c=relaxed/simple;
	bh=yeNpjwZl2sl8oqjE5JYKjs0a93TMha76benj0TJYBpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcjfxYvX8Z+qh+vzvVaTQVhr/vgtH7YJICbndlHz5YY1wrrcA5dMZDEFNrCtpTghZSCnTvCRe9TKMXqK++eyEEkJBRTRooweq4XD7OmPMV/GIlObcRx0RsczH+rEgRmCBYGdNNPVuzSwiGTNVSywhsdb80Ti4XVqEKXdMi2bRAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kf9tWMh4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kf9tWMh4"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so767196e87.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741856344; x=1742461144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeNpjwZl2sl8oqjE5JYKjs0a93TMha76benj0TJYBpA=;
        b=kf9tWMh4k3NN1sCoD/3wmy4HUr0xqzaAbEJRgOi1S1qIlQP4pu/F94XBHOJxROQZVY
         r19tHPSmXWsLAM/y5zY3pDbOFG8+l36YQtuXdCo/op0z6tzq4E3XCpyl0y5+6e5iQQPY
         r0+U+TERVtb9LCdfiCsOfdhuM6BIv0O5SmSOulr+tHXG1DLci5Rsi+STfDooGKmynmUB
         +CtpivGLyw3/jz1nPwDZyAdO/E3jTfwX2PEGb0WCunuieJ6Dw6y6jxGe7yJ9e2Bl7aH/
         NN8e97FTKh5jA7RoD+5kxXC8Pjjp2o7/PkqJdfe1pzaM+LzrbsWe3S0wwRclM89kGqds
         A+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856344; x=1742461144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeNpjwZl2sl8oqjE5JYKjs0a93TMha76benj0TJYBpA=;
        b=oc1i5Pv8lhGNVSIosZb660u4UZX9YwvUTj1Ko9yNMQIwYWUASuSHoVhAWCwmX543fM
         2VhfKIEz9Xfj/U3KIHDsF93roo8NJGpm4D6IMeprv/liTc1QNQaNC3NlvaEP0DHWKKGp
         poOuBT1KVt/q/sL8pIJZlHZltEQopwjVrvTSFWll60F980u0zCu3PiZZjmRAWvHx2vRg
         ElwcCK52bCYlP0cpg8D3vpWqo5U3dtzCQ6XRfnX5Qp6vy4ttkeuuBg1MDbIVhdW7j++E
         wJ70XevG7HoYbus1IAxg//am999it4J8g/hRP7p6BoQaIBJT3R4/IBOZNydklz0/XXgm
         y8kA==
X-Forwarded-Encrypted: i=1; AJvYcCUihA5wto/4cc36VoxgyoJIRo3wIsl5e2wXJ78Ay/dq4k+yslb27vs2nLUxN+wq1whnz+j9ete2NTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtgSOGAv2K7h+6mef9dDrmZr3DUj2JS4TRTSwBYcqu3eKSPqH8
	tun02NUR/YrcsDJ7E2HQ3wP7EZ/ig6EiskiYtGfr7S/LOe7pyjhzcOUq+wXZE7KDLa12JRz2O6C
	a4FGQwI5Gu7l4gahyLVW/efexnLRQCbenBp/x8Q==
X-Gm-Gg: ASbGnctkFOjxCzR6P1prihqBeCCz6D7suml0pKxtcDjysHAVIIXfAaQCk6J8BwDdjmc
	6z2gzGgFeo06hlZcHM2jT6YR/jkNuBchTuv+3hDuPRQeyyy0BPNFmNNtiNzKlC1p+30RqEbNtxV
	JetmHxLagP2rDnenyAWqrgq68gJgI9q8iN37GaoARq5sKY1267hWl9RX54Ow==
X-Google-Smtp-Source: AGHT+IGiiFdJ0ZBw6/jQUF8chaOzZeVHHI2CihuJD77p7pGnuyVLUQG4ICD01B3azbKMP6wdJwvnk4QQZ4PxIoF8jsk=
X-Received: by 2002:a05:6512:118a:b0:549:7d70:52a9 with SMTP id
 2adb3069b0e04-549910cb47fmr8194156e87.47.1741856343773; Thu, 13 Mar 2025
 01:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304133423.100884-1-brgl@bgdev.pl> <c540bd72-0d78-4e4f-a6f9-392166cc48c4@lechnology.com>
In-Reply-To: <c540bd72-0d78-4e4f-a6f9-392166cc48c4@lechnology.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Mar 2025 09:58:52 +0100
X-Gm-Features: AQ5f1JrxwVeTyfPuKATvSFHmNNcoFIbaQ4PhOoNoJUSLtDixcR4Qbb6uk8DZ4sc
Message-ID: <CAMRc=MeOyYauKp2MndJULN3Mn6E=_i6HvLpChJd-KW9Uog6-dA@mail.gmail.com>
Subject: Re: [PATCH] clk: davinci: remove support for da830
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:29=E2=80=AFPM David Lechner <david@lechnology.com=
> wrote:
>
> On 3/4/25 7:34 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This SoC has some leftover code all over the kernel but no boards are
> > supported anymore. Remove support for da830 from the davinci clock
> > driver. With it: remove the ifdefs around the data structures as the
> > da850 remains the only davinci SoC supported and the only user of this
> > driver.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> Acked-by: David Lechner <david@lechnology.com>
>

Stephen, can you pick this up for v6.15? I would like to remove
support for da830 from arch/ in v6.16 but for that I need to drop the
drivers that use it first.

Bartosz
