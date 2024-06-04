Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4A12C559
	for <linux-clk@vger.kernel.org>; Tue,  4 Jun 2024 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717474747; cv=none; b=f9eU4Y6xHk9b2XnQsEQlPwqDSgsMtXK1kP4pZ90Jp5df6cJX4jU25jpr1tjgf4rZHW9DNuxHRJpHexuQu7oNDVaGS0GHheZL4zZjlbCgab3SuQIeCLjRA6TR0dBjd8ZgvIMNi5MG4yT0KrAyUTj6IgN5Wiko+6i0gdHEy9szT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717474747; c=relaxed/simple;
	bh=MCXvmpJgnLDVER7GxypHg9B08dd41zu2LnHwh8cUFWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L35f2hgI9sCWTUR+/QUi/rP7eeRVUoDrYKnW7LxGIvzraU7m0fL+2XLwrVDB3VdWQgd6ipNQegwYFw3+05U7u/lX8FK8TX/7jHk+VojZcK9Wrc8es7lAhygreaFcmG6jfYqFAzPFh01f7D1IffWBRZtUXVxmjIGmIqcBZCSPD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GLwuM768; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GLwuM768"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b9d062526so1607240e87.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Jun 2024 21:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717474744; x=1718079544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N61SX3AAhMaQCzElmg/wZ9mbz5RbGf4AjlXkFfrh07w=;
        b=GLwuM7687NU+c9eNImnoidAqnT1LcNHffDdvnskWT4AbAC3Y/qoqx6shDMaL4TqBnS
         oHis/jE4tV9314g60EyLDyRmFPT3wQgpJL7YhhF4yKMDdPWLQujtTIv/zdBLRpZCgIuM
         jYula5CtHrJvjY/7GCr1uIePA7GdJjAzxW1Fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717474744; x=1718079544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N61SX3AAhMaQCzElmg/wZ9mbz5RbGf4AjlXkFfrh07w=;
        b=xE0zlyPLfOyn1HOENLEsWRTI4CMV3apw4WmPaIQwMAfkR2OOGQMtiXO+nT59CJiTQo
         KxyiaSePGDvlMilt/rSH+tiBuUhH/bcfpq3rcceiW9R2XZaelC1ySQa1DZH8ff+la+xc
         0DIZjRfYIkfZTa3iubZx4wUkaTiRhwV671v8pEkjyqTfvtAmPRczzHBK1uaP+adv1+BW
         7NmTrIqe2FxF5pkQbvuvw/787Qq2j1ziq4n5iQ94kDs4FBVs2qqfVFUy2UBS0g40bKtL
         68lORU4XiHeU3mjt/OpNNL2IIl//jEGYdE6dXdDyEakc1+YlByDm6nJbyMe4w8ootDUN
         SErQ==
X-Forwarded-Encrypted: i=1; AJvYcCXECFhZ3vr5gBd6opPqF0wyrWOsaIpU++Mbt9fhpb8j/4QiPGeFE4QoxM2mSV+gWV+j3+LeMIOK3SLj2EQ7BhymZBFMN+/4oLed
X-Gm-Message-State: AOJu0Yyzm4QCVIJNT9hDiw/JRX0YVQcqIPENPacn/CUynh8s5dPzbzi2
	M75xXwdvGsTiFE10Xlq2IqFP3UILbTuAkEGr196fG+1iDeSor1z58J8ij96v05F9EBlwtpxIKZ1
	wRFkBa1otdrbpouLtmd2U4N09pMSZ/+Y+4miD
X-Google-Smtp-Source: AGHT+IHX+8hzvDI7P5tkl2A/qlQQgMeILMWvYV42TUTaHfCptFD9ZuhOs/nuU1Lg8mOfQm/ry468a30QNnvnUyOmxiU=
X-Received: by 2002:a19:9107:0:b0:51e:2282:63cf with SMTP id
 2adb3069b0e04-52b896c494dmr5934420e87.45.1717474743646; Mon, 03 Jun 2024
 21:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-4-wenst@chromium.org>
 <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
In-Reply-To: <cc5847a486a760921375f069a4f65cd29453a624.camel@imgtec.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jun 2024 12:18:52 +0800
Message-ID: <CAGXv+5FBqcXjTc+DO8VQierzcxTYhyNxpw+AuuB4U1H_Xo6wPg@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"aford173@gmail.com" <aford173@gmail.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 9:37=E2=80=AFPM Frank Binns <Frank.Binns@imgtec.com=
> wrote:
>
> Hi ChenYu,
>
> On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> > of the Series6XT GPUs, another sub-family of the Rogue family.
>
> I've added Adam Ford who sent out some DT related patches [1] for the Ren=
esas
> variant of GX6250 and the GX6650 (another Series6XT GPU).
>
> >
> > This was part of the very first few versions of the PowerVR submission,
> > but was later dropped. The compatible string has been updated to follow
> > the new naming scheme adopted for the AXE series.
> >
> > In a previous iteration of the PowerVR binding submission [1], the
> > number of clocks required for the 6XT family was mentioned to be
> > always 3. This is also reflected here.
> >
> > [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a4=
3c79c2a.camel@imgtec.com/
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > index 256e252f8087..48aa205b66b4 100644
> > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > @@ -12,10 +12,17 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - ti,am62-gpu
> > -      - const: img,img-axe # IMG AXE GPU model/revision is fully disco=
verable
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt8173-gpu
> > +          # PowerVR 6XT GPU model/revision is fully discoverable
> > +          - const: img,powervr-6xt
> > +      - items:
> > +          - enum:
> > +              - ti,am62-gpu
> > +          # IMG AXE GPU model/revision is fully discoverable
> > +          - const: img,img-axe
>
> The Series6XT GPU models have differing numbers of power domains (either =
2, 4 or
> 5). Whereas, the AXE GPUs have a single power domain, so I assume there s=
hould
> be a related change here.
>
> The GX6250 has two power domains (lets call them A and B). There's a cons=
traint
> that if domain B is powered then domain A must also be powered.
>
> In patch 6 [2] it's setting the power domain to MT8173_POWER_DOMAIN_MFG, =
which I
> believe corresponds to power domain B. I assume this works because the MT=
K power
> controller driver is encoding the constraint above, meaning that when we =
disable
> or enable MT8173_POWER_DOMAIN_MFG it's also disabling/enabling MT8173_POW=
ER_DOMA
> IN_MFG_2D (domain A).

It could also be that the power domains are split in the glue layer and the=
re
is some sequencing handled there. I'll reach out to MediaTek to see if they
can dig up some design specifics.

I assume you would like to see the separate power domains properly modeled
in the device tree?


Thanks
ChenYu

> Thanks
> Frank
>
> [1] https://lists.freedesktop.org/archives/dri-devel/2024-February/443548=
.html
> [2] https://lists.freedesktop.org/archives/dri-devel/2024-May/455833.html
>
> >
> >    reg:
> >      maxItems: 1
> > @@ -56,6 +63,15 @@ allOf:
> >        properties:
> >          clocks:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: img,powervr-6xt
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> >
> >  examples:
> >    - |
