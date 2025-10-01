Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4383424DD17
	for <linux-clk@vger.kernel.org>; Wed,  1 Oct 2025 05:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759296974; cv=none; b=Na5s/zT/A5FJxCLdMvVr0+K+ZegwwWy//JCDtkKD5dN99J3Pgdxo5+sIZ8HIPGTVUf/A5EQVDCB6/evIhxWDC+L7tXGqPm3N/TKSvjC5d4+pObkT5KJQDuWqU5VFk5GTslQqjrkwH13yCv4Pyu8QYUW4wcxF2eXqHz0tMVYzFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759296974; c=relaxed/simple;
	bh=q34zNznzGEMyfGPcEjFTGs2Jfob+XLVas6eFFMSYtFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkuxArHed6PkOBNrXxz4GQenIV3naXzQTZriSx+tL/X/o0j1dcN5Zl9AsYh7uhrPPHw3lKypyE2NRIb8rwW5zLhubIxW5ceSfluPo4GAYivpbOSFDwBgf7cEzYpbUmjau/zEjR1ehEYkp3coSfPVjg9zOsKCCBa2k8HRLgkuv68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9fE2soh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9fE2soh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso45827065e9.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 22:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759296970; x=1759901770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJrboPAQ3bvQVq27/EG4Rsr76H/+se+9jLXRfCa8zmo=;
        b=N9fE2soheAKPIJ2f1zAB2wDiCxy4UP+o59Og5IJ4eRtdYz+LK2u/waMd7UA2UPooek
         wrheJUyWMOwIacL4sG6Scypu7vOL+OTICqC4sB53Jps8EfPD86PwyQ9wrg/ITW1Oyqhq
         19yeViFkVsegOrgtg9Nje+QJTPul50RDlcZUAJPJBcI4QZbVRppOX9RDczVdSeJFLb3x
         QNy7t62d+JQYBVstO75SLfxbhRCyyTD/AM7iWSF7yFX8+4caM9TBfn5onyXAua/VPnYV
         0gxCOpRTf741wUMpBiQx86K437FS8TArIKzLlUogg2uLBGBioGkaGlgKEtRIJI4V9JFJ
         RHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759296970; x=1759901770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJrboPAQ3bvQVq27/EG4Rsr76H/+se+9jLXRfCa8zmo=;
        b=p6Dz++/hteeuAHWL4nlvIFs5gCcBiLjLY7SxgXsjD8fuCXZtldql9ybZW/goAXKZYe
         uljJ+DOMuS85ijIB+tucZGl9XdpDtMgFKCpqlIQNGRhX+IJvo4brqEs/UjgnzIcvTuCB
         lip8VvPlwCuHxEHOhz58rtQK0ZtKoy1fjs3RXI537t1VlYAR2GF4RO6S70v2eUmltKFi
         Ix2GdOQhAHB65TrfnKAye4rjbgjRymepK0rHwUB7HpJhf2OAV5fogwwWSjjG1fB/ja+5
         kOfjD0JG2rimzEjPW7lQLGbgUk8fv6n3hSI1XnrnoWcxTfE0Kn11xHJctNNvWBSgwhLl
         VSXA==
X-Forwarded-Encrypted: i=1; AJvYcCUrVwa+H6xWNKrF4D04AyA/Grc3LNqj1htegP5ODBHlwrtnpyGW+lPH2LVQBZScyHAvoqHw86mMgY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRYvfrcHZyV5sWYtmbR+gVrdEECrEt3sXV/W0/4A++Vkl8b0kX
	Ll/FrMfShzAWiSY1xe54eDKhRwNBc6BBsCT2ewtEknHqwZQp2KzptqiwBTMk1g9X8U+nFSwG8ub
	L4DLDNGuyQ8oFU565zNRonGDqn3hxrzQ=
X-Gm-Gg: ASbGncs9SN9/7PP4Fn/znOYJMCIObFsadydNbhLZFgLqLeY2Ncft66rhPQCj5F+/fqI
	Sqih79kTfCzSXcL18WeNJvP8EXuecUsRTlCpH4b6n2WIB2TAcZ5NlopSzj5C5p6irn0dW1H0kQV
	cGgnoeyC8ftCdo7zvr+2n79cHzW/TGspZtGcOOlS2wbQVXaL8XOzL8bfdg0rz3RvuBgklhonSvp
	rKbCmaZhyCrhVVZ5r0wE5gu/3kbqYMc
X-Google-Smtp-Source: AGHT+IGl4qoOTXJavodfDxV6HJESDY/3a24Dq7hSw7IU0JyXat/2RujwJvhHxdQJ+/VFFZv/MM/yRAJC9AIJaLEF69Y=
X-Received: by 2002:a05:600c:8b65:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-46e6127cccfmr17260215e9.10.1759296970493; Tue, 30 Sep 2025
 22:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com> <20250925151648.79510-16-clamor95@gmail.com>
 <3419823.yaVYbkx8dN@senjougahara> <CAPVz0n2CRV8d1w1hp-60SQ_caBTFyJE8tJaWerwyEuZHD1p_Nw@mail.gmail.com>
In-Reply-To: <CAPVz0n2CRV8d1w1hp-60SQ_caBTFyJE8tJaWerwyEuZHD1p_Nw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 1 Oct 2025 08:35:59 +0300
X-Gm-Features: AS18NWBi4bYPebuwB4xx20Y7NKjL9OGwnlxl3s7Rk7XozkUX3za7EYle47R5QzE
Message-ID: <CAPVz0n3-VvtjHDPKoFiipYQFx=Xq6hph8WW=xa2UaC7iDf1MyA@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 08:07=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 07:=
38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> > > Simplify format align calculations by slightly modifying supported fo=
rmats
> > > structure. Adjusted U and V offset calculations for planar formats si=
nce
> > > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 planes for=
 U
> > > and V) so stride is width * 3/2, but offset must be calculated with p=
lain
> > > width since each plain has stride width * 1. This aligns with downstr=
eam
> >
> > plane
> >
> > > behavior which uses same approach for offset calculations.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++----------=
--
> > >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> > >  2 files changed, 27 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/st=
aging/media/tegra-video/tegra20.c
> > > index 7c3ff843235d..b7a39723dfc2 100644
> > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_fo=
rmat *pix, unsigned int bpp)
> > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_=
MAX_WIDTH);
> > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_=
MAX_HEIGHT);
> > >
> > > -     switch (pix->pixelformat) {
> > > -     case V4L2_PIX_FMT_UYVY:
> > > -     case V4L2_PIX_FMT_VYUY:
> > > -     case V4L2_PIX_FMT_YUYV:
> > > -     case V4L2_PIX_FMT_YVYU:
> > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->he=
ight;
> > > -             break;
> > > -     case V4L2_PIX_FMT_YUV420:
> > > -     case V4L2_PIX_FMT_YVU420:
> > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->height=
 * 3 / 2;
> > > -             break;
> > > -     }
> > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > >  }
> > >
> > >  /*
> > > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(struct te=
gra_vi_channel *chan)
> > >  {
> > >       unsigned int stride =3D chan->format.bytesperline;
> > >       unsigned int height =3D chan->format.height;
> > > +     unsigned int width =3D chan->format.width;
> > >
> > >       chan->start_offset =3D 0;
> > >
> > > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(struct te=
gra_vi_channel *chan)
> > >
> > >       case V4L2_PIX_FMT_YUV420:
> > >       case V4L2_PIX_FMT_YVU420:
> > > -             chan->addr_offset_u =3D stride * height;
> > > -             chan->addr_offset_v =3D chan->addr_offset_u + stride * =
height / 4;
> > > +             chan->addr_offset_u =3D width * height;
> > > +             chan->addr_offset_v =3D chan->addr_offset_u + width * h=
eight / 4;
> > >
> > >               /* For YVU420, we swap the locations of the U and V pla=
nes. */
> > >               if (chan->format.pixelformat =3D=3D V4L2_PIX_FMT_YVU420=
)
> > > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup(struct =
tegra_vi_channel *chan)
> > >               chan->start_offset_v =3D chan->addr_offset_v;
> > >
> > >               if (chan->vflip) {
> > > -                     chan->start_offset   +=3D stride * (height - 1)=
;
> > > -                     chan->start_offset_u +=3D (stride / 2) * ((heig=
ht / 2) - 1);
> > > -                     chan->start_offset_v +=3D (stride / 2) * ((heig=
ht / 2) - 1);
> > > +                     chan->start_offset   +=3D width * (height - 1);
> > > +                     chan->start_offset_u +=3D (width / 2) * ((heigh=
t / 2) - 1);
> > > +                     chan->start_offset_v +=3D (width / 2) * ((heigh=
t / 2) - 1);
> > >               }
> > >               if (chan->hflip) {
> > > -                     chan->start_offset   +=3D stride - 1;
> > > -                     chan->start_offset_u +=3D (stride / 2) - 1;
> > > -                     chan->start_offset_v +=3D (stride / 2) - 1;
> > > +                     chan->start_offset   +=3D width - 1;
> > > +                     chan->start_offset_u +=3D (width / 2) - 1;
> > > +                     chan->start_offset_v +=3D (width / 2) - 1;
> > >               }
> > >               break;
> > >       }
> > > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra20_vi_ops=
 =3D {
> > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > >  };
> > >
> > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > -{                                                    \
> > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > -     .bpp     =3D BPP,                                 \
> > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOUR=
CC)      \
> > > +{                                                                   =
 \
> > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,                =
   \
> > > +     .bit_width      =3D BIT_WIDTH,                                 =
   \
> > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,                 =
   \
> > > +     .bpp            =3D BPP,                                       =
   \
> > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                     =
   \
> > >  }
> > >
> > >  static const struct tegra_video_format tegra20_video_formats[] =3D {
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > +     /* YUV422 */
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > >  };
> >
> > Looking at the code, BPP seems to only be used for the line stride (i.e=
. bytes per line) calculation. I think we should just make it 8 for the pla=
nar formats (possibly with an explaining comment). With the current code, w=
e end up with 'bytesperline' variables in places not being the actual bytes=
 per line, which is confusing.
> >
> > Actually, we can then just make the 'bpp' field be bytes per pixel as i=
t was before to avoid the discrepancy with Tegra210.
> >
>
> No, this code is actually cleaner and in sync with what downstream
> does, Tegra210 bytes per pixel is confusing since it totally neglects
> formats with fractional bytes per pixel, it is impossible to set there
> 3/2 for example, which is used by YUV420.
>
> According to downstream code bytes_per_line =3D
> soc_mbus_bytes_per_line..., downstream directly name is bytes_per_line
> and soc_mbus_bytes_per_line returns width * 3 / 2 which is correct
> calculation (12 bits). Meanwhile for planar formats Tegra has 3
> different buffers so with offset calculation plain width must be used
> (which matches downstream).
>

If you mean use of BPP by VI, I can propose removing bytesperline and
sizeimage configuration from VI entirely and leave this to per-SoC
fmt_align function which does this already anyway and guards every
time those values are referred. This way there will be no instances
where "places not being the actual bytes per line" comes true.

> > >
> > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging=
/media/tegra-video/vi.h
> > > index bfadde8858d4..5cbc0606ed6c 100644
> > > --- a/drivers/staging/media/tegra-video/vi.h
> > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > @@ -281,7 +281,8 @@ enum tegra_image_dt {
> > >   * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
> > >   * @bit_width: format width in bits per component (for CSI/Tegra210 =
only)
> > >   * @code: media bus format code
> > > - * @bpp: bytes per pixel (when stored in memory)
> > > + * @bpp: bytes per pixel (when stored in memory) for Tegra210,
> > > + *    bits per pixel for Tegra20/Tegra30
> > >   * @img_fmt: image format (for CSI/Tegra210 only)
> > >   * @fourcc: V4L2 pixel format FCC identifier
> > >   */
> > >
