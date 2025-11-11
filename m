Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0F3246F5
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868114; cv=none; b=lWrwx/O+wdwXIuDmr1H7B3l27ev5vc4Ak3zq8Q1P5UsNZM4OB/KKcMBLLNzGas3m1974exZACWFSs0lQSSJ4vV472iW4Cleg1yi3cxqM8iWQYSW3JoCKHWbA8CGzWy8hW6B3f9usU0OTrX8xl5EUrMFZjGPk5OswVx7C26ZMRr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868114; c=relaxed/simple;
	bh=44f+GGBR2oWTuYZdNolnAn15TPhOowpsnt5jgSu+WJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGjn5PunuW8hMhIYDJrl6oZJo7P64rgt/EelW1jZ785zrKg/BYGQLZt8zORlC54wiTrvPqLkly5asWBz22H9KlO5nbposi6klXONQXSQZymxnVHJm7UaFE1sdqLDNR1cHfumFpAP3KbV0RGjwUGBb34wVouMVfw87bH4nWUQ+Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TogU5/CQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TogU5/CQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b38de7940so1388907f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 05:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762868109; x=1763472909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zh7RVlz9/fn4Pl4MaeRlvONIISFdEg92t4/EjrGZ5o=;
        b=TogU5/CQKt3gFVpr3F5BucXjKpkgWAK5iPWPCtD5c+SGKmBXceOa3pxwlp6mGeju8Z
         VkjaBrzEyP84kS/jKc630hRoTAHvWMiXg4jYqz16kjp1oLOM5JkT2u8CQ7v/zxH4u+2p
         aPmEs9BxjT8kdmgBtDULJfiojnrmsO8koRiqbMAAvnA4+7cDbHTnGqbHHsUAgtGiaCdl
         TOmlLtDue9102u3ob0RiyJckKsJ4Qa3sU6+2QtcWcjwQREn/km4n5eQVE0Fp469PIWu3
         wd83UwFhJSqpu6e3D/DqOrrLIJ+XSixoVoSdl3fj5DgYODk/FJ5/YZp10D2YBQkPqueZ
         9gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762868109; x=1763472909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0zh7RVlz9/fn4Pl4MaeRlvONIISFdEg92t4/EjrGZ5o=;
        b=MHfQgqELbzUXDDM5sD/L1VYCoxTMjebsQtbZJ0RxKNyAH7KnvpdphRfss16Eddmr3I
         KwNbn9H3t3iFx3w71GLNCKKvqVHsa11EMkgQ46lHOHf8tWIFNnR5WXBCmyQWSBLUCIDQ
         Y/VxdQJYYs9+i3ytX7YRhvg2zGRMgBnROF462rfFPwTAxDYraTIen+Yn3WQ5qxO8f6/3
         FgKwWD7LblKX4I/9E49+ACMlmTYas/oh5la8ykk87RdZTSOTmUWFZqze+GZgTGeObme1
         luxe/8S64l+BCn5UZISXLL+Zp/5oqt352M4iqwh5zh957lhk8HzQJgG0Vt+voC/3G/V1
         sJJg==
X-Forwarded-Encrypted: i=1; AJvYcCV5UBuZyPDy9zdRlHx1iW3YRN6mVjBPhP/zwRu2QfVuiJ0A2YqE3tAvL6sCwMf12Np3CgnXUe8oJbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM71emEyhKJnxIQ8tRXf9xkn1v9mGfa6oITQxe3w3PEvf33A+C
	ZOTgcv3SNu/ahB0wnxoog8IYz8U85aoT/RMU/ym6nqaWhmk+a1rxRgGR0Y+KfJzNggH0nbj/BML
	fz1S14Dw9wYLQkig502K7yOfGBK+6fnI=
X-Gm-Gg: ASbGncuNwbc6y/6pkxWsp6/ECIScDt6x5zVnAPIX25ohsPCdxOwbGO6xwc1Vul7bc4h
	JPeC2wE/jJ3MD4Flw3Aa/iivsXHZvHbms1muwLRW7KfpnR0TUrNXULlGBSj6hcFNr772Tvd0gxB
	RlnknKhAEodzITFO6Sz2YSu91r8CfvtWswQK8LVro+R+7buBhLG1giYWAqtfm2zgCabAGZcjE8z
	JEK1jkd7ZUhOcf05hWkNd7kn0NZl9Smt31aG32t0z1uVuO5XJqV0zGIo4i6yQ==
X-Google-Smtp-Source: AGHT+IEtivyRqo5lmF9BZUpAcCnMPsflKj+Yv2TwjeYH2DfqbpxfoITaNpUO+HHZcDmnNtTIfPFQUG2YLx/3HTHTlHw=
X-Received: by 2002:a05:6000:2507:b0:429:c54d:8bd3 with SMTP id
 ffacd0b85a97d-42b2dc3ea86mr11789923f8f.53.1762868109221; Tue, 11 Nov 2025
 05:35:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250915080157.28195-1-clamor95@gmail.com> <20250915080157.28195-2-clamor95@gmail.com>
 <3455911.aeNJFYEL58@senjougahara>
In-Reply-To: <3455911.aeNJFYEL58@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 11 Nov 2025 15:34:57 +0200
X-Gm-Features: AWmQ_blV6d3G7hE5fg-sUlAJ4jm_DAmDeF4LDT7xiVBDSmfK9MhRSP1-jMuZj_A
Message-ID: <CAPVz0n3qXBLEVDKDDc6DRrN+WFiAdeL1wDaA94DkdST7NoRXyQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] devfreq: tegra30-devfreq: add support for Tegra114
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Osipenko <digetx@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 11 =D0=BB=D0=B8=D1=81=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:5=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, September 15, 2025 5:01=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Lets add Tegra114 support to activity monitor device as a preparation t=
o
> > upcoming EMC controller support.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/devfreq/tegra30-devfreq.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra3=
0-devfreq.c
> > index 8ea5b482bfb3..d976077d4757 100644
> > --- a/drivers/devfreq/tegra30-devfreq.c
> > +++ b/drivers/devfreq/tegra30-devfreq.c
> > @@ -980,6 +980,7 @@ static const struct tegra_devfreq_soc_data tegra30_=
soc =3D {
> >
> >  static const struct of_device_id tegra_devfreq_of_match[] =3D {
> >       { .compatible =3D "nvidia,tegra30-actmon",  .data =3D &tegra30_so=
c, },
> > +     { .compatible =3D "nvidia,tegra114-actmon", .data =3D &tegra124_s=
oc, },
> >       { .compatible =3D "nvidia,tegra124-actmon", .data =3D &tegra124_s=
oc, },
> >       { },
> >  };
> >
>
> Looking at my copy of L4T r21, the EMC count_weight should be 256 on Tegr=
a114, while it is 4*256 on Tegra124, so different SoC data should be used. =
(I haven't checked if anything else is different)
>

You are correct, tegra114 seems to use 1 EMC clock per transaction. I
will move and expand comment from tegra124 entry regarding
count_weight to include info about all 3 supported entries if you
don't mind.

I have a question regarding tegra_devfreq_device_config to be used
with tegra114. From tegratab kernel I have, existing
tegra124_device_configs configuration seems to fit tegra114, may you
confirm this? Or, if L4T r21 you use, uses different values, may you
provide those to fill up tegra_devfreq_device_config for tegra114.

> Cheers,
> Mikko
>
>
