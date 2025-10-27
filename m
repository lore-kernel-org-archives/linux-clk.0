Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C61313549
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583813; cv=none; b=FdlSiziCk/n1gbqUveE8UGpGO+ojDE9j0XV4pLn6hLeiPtHBCww5FK2/JDND1UV9TxO3JUhulpfKZskWQZIUJYlK9inTndj9Bc63ncNLS8EqYM1Ddikrc+YbbGKkIXIqW5EheQULUEtSSL+BBRPPGqO68DKZ3VJiMa/rGlaxRsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583813; c=relaxed/simple;
	bh=f9gyr+50VXCzFRqzh5h2Eocs+kwwPbsfidV5wgRt5Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NohfhI6ol8FaAhFpodRN4yj8RiLQkIJXKNXP+VM0js4OCZU0BxyMuOzVVE6CVsz5KVv8J1O2E+ZRdbVXot+zKf/oaPGTBg0FHufn21P40WFsp2gNnWM60iPWhm0JflEnuE/b+4rUrDbL7J67KvHz7UVeAV/ssfjD8bsDDxoCSdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ff/jTan1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff/jTan1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4270491e9easo4045168f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761583809; x=1762188609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llXiWHJLf2syx3blZo0CXJGIyiry1LJYTByzcLi8/h0=;
        b=ff/jTan1lkgWUNpwMGoLzGON5a2N4mfXOajPZajkFvH4cHFDFH+FASZNEuimReQO6t
         h0XaH+V4MjEnkv28OfQ38Tvg38vlkJkkq4RD92MGqt/zQzWhEXU9Bnvg1i80vEXdEdfA
         cPku+D2MAL+xeB9+xGkOr3NIEkdA9WjcUHW/zNNC01W5n8bMhqxRohJO2bTq8sDwdKg/
         TP51AnWBRMZtN4dZo+3KFvGCIG8D3ae6YO8rH91kqj9XOGkFJFFhWjSakU6jYCOY5FpC
         zC7XbRmD/bv7A9azMVoI1YHeqMiVCcNUVfG5RDf6ZRtAqWq+FH1HTRInCvxfxnB2DpZy
         38FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761583809; x=1762188609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llXiWHJLf2syx3blZo0CXJGIyiry1LJYTByzcLi8/h0=;
        b=OV5yWZpAjJ0o+a4Cq6mzdE6+gSmgJ1ZjCOxnqAWqgPlzmzWBRBoMHmTp9X6C6MhDx6
         9vObMqxc3mgsUzeHlMwM2FQ87lpZCmuU3yPqglAljhfj7NJ5+SKgRoh808w7GgI4XdHm
         /zkta/Z9qXToyDEFuq5UXDozbKr+YLsWq04bAsLzfYqDe7jtoxwo1z7T3FBx5eXtM+aZ
         Rq2C0pkCUsIHWO1315MHMjf2ohnIe4KaXwR69wjj0E15QyMp9X5l1xnC90RoQl0Mv7u0
         cOPE1v6j8yBYm2esg9e9G0AHE4ZAgafPB+S5i9r92E72JUssH1IcgsTohHOXmsmigmW3
         Hv9g==
X-Forwarded-Encrypted: i=1; AJvYcCVufJksuZxpYgfFmWC6BulYORF1SE0g/5KjfS66yi3DFuQTII4xysPgYxwF+jVtz2PF1kUpH3ZE9Q8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUuPCwrRsXcS42NDa5gx0Ieo4K2JbUIQWfME/D1WxjLKn3ijj/
	yCYf0rafh5K74AY15/xPjG2Zlw6OL5qBMQdkHlv7U+HzXeW4mnpeDq+d7nHtaFoW9b20CICQHMM
	MP9qjc+PMlNGCC73JZTD/dCBnAUMvRt0=
X-Gm-Gg: ASbGncvOVmeCgQvL88RpE4aG0Vkb4azu5gW4Oj0xiv5juAZ2pMPIzeJtm+AtjF51dWf
	BvMed7xi441c0fQLHwfinDcxfsAKOzxMpcsWNt8UPmcTwLSvqDrRCH6cR1crcs1vteJ7zXLd0Ce
	zWhBCEOC4ydzUjIjXrXN6H+pvFK+wgKS3PluY3+ZheAMbn8nW5ExVrcJFJV92kwLUtGTqgooPSN
	gmCvjnDMZiHX7UHHWfDl3wmOtnsz8LtqmFuPwYfmfeNUqmfhvLQkPTsRm9UUQ==
X-Google-Smtp-Source: AGHT+IH4XlaBzxcnNj5YFZ0kloDrzQaT1eJpLjTjeIpDU2XpK4VeABDkTozkzcR3WZnwD6TgVQ+f15BePNjDYvfetA4=
X-Received: by 2002:a05:6000:186e:b0:428:476e:e0ab with SMTP id
 ffacd0b85a97d-429a7e97661mr333005f8f.60.1761583808872; Mon, 27 Oct 2025
 09:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022142051.70400-1-clamor95@gmail.com> <20251022142051.70400-7-clamor95@gmail.com>
 <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
In-Reply-To: <bd6262c6-a31c-43a6-8ec5-2735fb2fe0d2@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Oct 2025 18:49:57 +0200
X-Gm-Features: AWmQ_blgGtMyE7YToN26_Q2JZoB8VDufuUc2Jv2Dui7Z-P7sPMVoiu7__HneWyw
Message-ID: <CAPVz0n277DZ8S5wX5n0gCaOpng64uEfx3VVue4Zp0n5bsDevqQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/23] staging: media: tegra-video: vi: adjust
 get_selection op check
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:4=
4 Hans Verkuil <hverkuil+cisco@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 22/10/2025 16:20, Svyatoslav Ryhel wrote:
> > Get_selection operation may be implemented only for sink pad and may
> > return error code. Set try_crop to 0 instead of returning error.
>
> Can you mention why try_crop is set to 0 instead of returning an error?
>
> That would be good to have in the commit log. And in fact, it's not
> clear to me either why you want this.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index 7c44a3448588..856b7c18b551 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegr=
a_vi_channel *chan,
> >       fse.code =3D fmtinfo->code;
> >       ret =3D v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, =
&fse);
> >       if (ret) {
> > -             if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
> > +             if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
> > +                 v4l2_subdev_call(subdev, pad, get_selection, NULL, &s=
dsel)) {
> >                       try_crop->width =3D 0;
> >                       try_crop->height =3D 0;
>
> This looks all a bit magical. Which subdev is queried here? I.e. what is =
the corresponding
> subdev driver that implements get_selection?
>

Camera sensor subdev, Tegra VI driver directly interacts with camera sensor=
.

> >               } else {
> > -                     ret =3D v4l2_subdev_call(subdev, pad, get_selecti=
on,
> > -                                            NULL, &sdsel);
> > -                     if (ret)
> > -                             return -EINVAL;
> > -
> >                       try_crop->width =3D sdsel.r.width;
> >                       try_crop->height =3D sdsel.r.height;
> >               }
>
> It looks odd (esp. setting try_crop to 0), and I wonder if this code path=
 has been tested.
>

Yes it was tested.

Original code checked if the camera sensor has get_selection
implemented and if such operation is supported then it applies width
and height from get_selection, else zeroes. This works just fine with
most cameras and v4l2 compliance tests pass fine, with most but not
with mt9m114 which implements get_selection only for its ifp source
pad while sink pad always returns -EINVAL, hence VI driver fails with
-EINVAL too. To address drivers like mt9m114 instead of just fail with
-EINVAL if get_selection returns error try_crop width and height will
be set the same as get_selection is not implemented.

> Regards,
>
>         Hans
