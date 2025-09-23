Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D655230DEDA
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 06:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758607889; cv=none; b=cRdCgV5GCjuYA5rCUXXdJ81lwxcI8e6CMYaBWp/MsE4Hq426738BKMqhlxbZM5faMEfHtg5UNeLuCSwaPmMZ2/q9nhANjgd2Ojd5/DskMFkqp1tW6Bnx+cJo8C4NvoJAGWch25+G17T0m+20adh00SBkIyYGve31WZbO1Ia/hLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758607889; c=relaxed/simple;
	bh=wqE//xXjG/9enyu06X/XpnA9P6xidXRuB3EznxD890E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuFx8w65fLQgRHqhtlKmaEZEzVEED2ICWeiJapNtJF/qUJ3P5VgfPWHNyBcih/VaGbNS2gavjVJF+IHmkQwAC/IlSZ0fpKag6yZNQYEmfKsOdT1ZnFRTl/Qy7JhSBaU9bMdUNCFkJS9DAV2BKGF+GvG1oHVnSakFEoo+RS0zXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9sywnaN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9sywnaN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46c889b310dso21332305e9.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 23:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758607884; x=1759212684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df0O5cfEZsPuYIfSKJgwSBHv7jw65fDKH5euNcKl0U8=;
        b=j9sywnaNJeiwVdlSOASLjawKOOKU/GjmbLa/A/3LT6jc8qMYl0G9ETGNt8GSUDdvHA
         MYOke/lKU+Cu7vK9CJ8Crooee85WW0MJpEOrAdn/Y7J18MOBl/DucBcc+MgQe1+axT+v
         ut313PH5cvzQ0N83El+T2LBav0b5lfdGJBMtnFbCn3uBq6gkl1JRc6cs/jmYKWinQdfZ
         36505ImiyxudB2LixR3c4h7atGfjlMKJQqgVkYKnsdwAml1xu9EztQ7UINB6b3n2ooPx
         57kUMNExZjR9BNNq99tKWUkuOVkm3jnO384/5Q+frWi4Wf0o4TEkZrir/WDLxJQhRZiH
         a35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758607884; x=1759212684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df0O5cfEZsPuYIfSKJgwSBHv7jw65fDKH5euNcKl0U8=;
        b=m6Qj4XcAF3yrNcUdCRJlwV9fzq+usn1OaH0+3mZAX9Jqyf6C8KG5/YWB9qkrobCLzy
         Ft/Qi0jg3p0Ae2B4kFO7HEZDp8HtQQjji1RQkjoGoV2Hd3SFbrUauYMLu9YcT+lRauxs
         9Z1H0fEybCzP5jOYXacyhuFfTiEaTca2cwaKBRHj4skkRNyQnwwJnoJgZiEdQEMq303T
         8oeiONx9jZkMfv1lhs2jwzHw5wVh/vcu8P4JeQP6BW0YuFXwb4EabjOTD3QabudCiffj
         lucOuNG6qPTx2qMh5PszE+LYERzzI5zPgl9ufxhUEojth4AXOoB4753TdVaWFJTTccCU
         tHbw==
X-Forwarded-Encrypted: i=1; AJvYcCXZCG/+PQO/UWeUAqIaTf/5s1NVsheq6WKEQxcMpW2Md58ySLuHA919MKxs3irgz8v4Ouc/mASE4Mo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7xMcWwTye0mIpT/uPOJ5dMFFq+v4uaSg0sDMrGmYjImmYrgYw
	IngFD+lmDXhFGodx3bSkeotr+H2z8tNhW6XXlFJwMw6GPp6GoMCQmKNJmaaJ2IGNyzHuyIw0j6G
	sh+PP4ZW0Y8/N9x5TYokiLTEARlWQzoE=
X-Gm-Gg: ASbGncsiWHekjatJq97SLMF/G3cbupBjea/R73Q8slHGTPH9TTB+VJvYFTHYqA+gMAz
	7vm9W8THOfMWVTXGqhAsAflHkNMEK+1M+VKPcwbp8w7sTHr7goQzGlb33XotcVcLrvSN+RPVh+b
	QCEf5Q13XHx8cgDxbPNxuGfwg94dM+/grUo3jJGOKVxggjjdGUjJgIjRsNrM66wW7/dO4g2rPkP
	k0RZbu5
X-Google-Smtp-Source: AGHT+IHBSpjHfy2Q6q3z9LYXbKVWlYO8Qx27BR2vb+eB7bqLChBlxXgoI1PiDjykMrE3rras4dWInJgZFxiyTNggXpE=
X-Received: by 2002:a05:600c:6305:b0:46e:1a60:c995 with SMTP id
 5b1f17b1804b1-46e1e1122e4mr10672545e9.2.1758607883820; Mon, 22 Sep 2025
 23:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <3074302.Sgy9Pd6rRy@senjougahara>
 <CAPVz0n1ozJ13MB4eFMAJzESe8iQ7SKjMApZCLFAZ_eubCFs0tg@mail.gmail.com> <7680340.18pcnM708K@senjougahara>
In-Reply-To: <7680340.18pcnM708K@senjougahara>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 23 Sep 2025 09:11:12 +0300
X-Gm-Features: AS18NWBVjttzeBZfLbhRARnUraFXXX8nh5TTiRUlvy0pbzFRoAj4ko8xGSDHW9w
Message-ID: <CAPVz0n2iRVBf0+BwdV6Le2FhY8xERqbtsyeff26Dh44mKsTy6A@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:04 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Monday, September 22, 2025 4:36=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10:27 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09=
:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhel wr=
ote:
> > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=
=BE 07:44 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > >
> > > > > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ry=
hel wrote:
> > > > > > > > Simplify format align calculations by slightly modifying su=
pported formats
> > > > > > > > structure.
> > > > > > > >
> > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-=
------------
> > > > > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/=
drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v=
4l2_pix_format *pix, unsigned int bpp)
> > > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,=
  TEGRA20_MAX_WIDTH);
> > > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT=
, TEGRA20_MAX_HEIGHT);
> > > > > > > >
> > > > > > > > -     switch (pix->pixelformat) {
> > > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > > -             pix->bytesperline =3D roundup(pix->width, 2) =
* 2;
> > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2=
 * pix->height;
> > > > > > > > -             break;
> > > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * p=
ix->height * 3 / 2;
> > > > > > > > -             break;
> > > > > > > > -     }
> > > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, =
8);
> > > > > > >
> > > > > > > Assuming the bpp is coming from the format table below, this =
changes the value of bytesperline for planar formats. With this it'll be (w=
idth * 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > > > > >
> > > > > >
> > > > > > Downstream uses soc_mbus_bytes_per_line for this calculation wh=
ich was
> > > > > > deprecated some time ago, here is a fragment
> > > > > >
> > > > > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_pi=
xelfmt *mf)
> > > > > > {
> > > > > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > > > >  return 0;
> > > > > >
> > > > > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > > > > >  return width * mf->bits_per_sample / 8;
> > > > > >
> > > > > >  switch (mf->packing) {
> > > > > >  case SOC_MBUS_PACKING_NONE:
> > > > > >   return width * mf->bits_per_sample / 8;
> > > > > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > > > > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > > > > >  case SOC_MBUS_PACKING_EXTEND16:
> > > > > >   return width * 2;
> > > > > >  case SOC_MBUS_PACKING_1_5X8:
> > > > > >   return width * 3 / 2;
> > > > > >  case SOC_MBUS_PACKING_VARIABLE:
> > > > > >   return 0;
> > > > > >  }
> > > > > >    return -EINVAL;
> > > > > > }
> > > > > >
> > > > > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
> > > > > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> > > > >
> > > > > Googling this brings up the entry
> > > > >
> > > > > {
> > > > >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> > > > >         .fmt =3D {
> > > > >                 .fourcc                 =3D V4L2_PIX_FMT_YUV420,
> > > > >                 .name                   =3D "YUYV 4:2:0",
> > > > >                 .bits_per_sample                =3D 8,
> > > > >                 .packing                        =3D SOC_MBUS_PACK=
ING_1_5X8,
> > > > >                 .order                  =3D SOC_MBUS_ORDER_LE,
> > > > >                 .layout                 =3D SOC_MBUS_LAYOUT_PACKE=
D,
> > > > >         },
> > > > > }
> > > > >
> > > > > which matches that you're describing. It doesn't make sense to me=
, since it at the same time specifies PIX_FMT_YUV420 (which is planar with =
3 planes, as documented by include/uapi/linux/videodev2.h), and LAYOUT_PACK=
ED
> > > > >
> > > > > /**
> > > > >  * enum soc_mbus_layout - planes layout in memory
> > > > >  * @SOC_MBUS_LAYOUT_PACKED:             color components packed
> > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stored in =
3 planes (4:2:2)
> > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stored in =
a luma and a
> > > > >  *                                      chroma plane (C plane is =
half the size
> > > > >  *                                      of Y plane)
> > > > >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stored in =
a luma and a
> > > > >  *                                      chroma plane (C plane is =
the same size
> > > > >  *                                      as Y plane)
> > > > >  */
> > > > > enum soc_mbus_layout {
> > > > >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> > > > >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > > > > };
> > > > >
> > > > > i.e. non-planar. The code in the driver is handling it as three p=
lanes as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_BASE_=
ADDRESS_V. Since the planes are separate, there should be no need to have m=
ore than 'width' samples per line.
> > > > >
> > > >
> > > > I did not invent this, I have just simplified this calculation from
> > > > downstream, output values remain same. I have no cameras which can
> > > > output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot test =
if
> > > > this works either. Other YUV and RAW formats were tested on real HW
> > > > and work perfectly fine.
> > >
> > > My understanding from the code was, that the MEDIA_BUS_FMT_ formats l=
isted in the video format table refer to the input formats from the camera,=
 and the V4L2_PIX_FMT_ formats to output formats from VI. Hence VI could in=
put UYVY8_2X8 and write to memory in YUV420. The code dealing with V4L2_PIX=
_FMT_ values seems to be related to the output to memory. Is it possible to=
 test this (your camera -> VI converts to YUV420) or am I mistaken?
> > >
> >
> > Camera I am testing with has no YUV420 options available and from what
> > I can tell there is no way to force VI to output in YUV420 unless
> > camera supports it. Any format manipulations should requite hooking up
> > ISP, or am I missing smth?
>
> From a quick look at the spec it looks to me like for YUV422 packed input=
 formats specifically, VI should be able to convert to YUV420. If that were=
 not the case, e.g. 'TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420)=
,' would not make sense anyway as it's talking about both YUV422 packed inp=
ut data and then also YUV420.
>

After additional checking you are correct, VI should be able to
perform YUV442 to YUV440. One of the reasons why VI is not exposing
YUV440 may be video-centric nature of the driver, so that it exposes
only formats supported by camera and VI. I will double check which
formats video device exposes. What should I test exactly?

> >
> > > It's certainly possible that the current code is functional -- if byt=
esperline is set to a too large value and that information flows to userspa=
ce, it could still read the buffer. It would just waste memory.
> > >
> > > >
> > > > > >
> > > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /*
> > > > > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegr=
a20_vi_ops =3D {
> > > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > > > >  };
> > > > > > > >
> > > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > > > -{                                                    \
> > > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE,=
 BPP, FOURCC)      \
> > > > > > > > +{                                                         =
           \
> > > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,      =
             \
> > > > > > > > +     .bit_width      =3D BIT_WIDTH,                       =
             \
> > > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,       =
             \
> > > > > > > > +     .bpp            =3D BPP,                             =
             \
> > > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,           =
             \
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static const struct tegra_video_format tegra20_video_forma=
ts[] =3D {
> > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > > +     /* YUV422 */
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420=
),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420=
),
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > >
> > >
> > >
>
>
>
>
