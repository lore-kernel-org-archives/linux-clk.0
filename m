Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E677081A;
	Sun, 23 Feb 2025 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740325994; cv=none; b=DU7/wU1+aM13Synf7QAjBLH2qj/vSRFKxRLNpzP2t7yKx3K6mvEJnVkaxbjDu+vNeMcQ9kXGLi7NNuH8Zry8cjAhyKGnxtG9AE9e7LDh3gJeeConvMn1AdERRz+i8V3k/tZxwxXs2+mydYTdls0YnvjNizrlzgtG5ajBW716Deg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740325994; c=relaxed/simple;
	bh=+PTWttt6YLa5hYivlZV+DBU+EkZervftcg6qI7/jehM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8wwWUP8PPDb/aFdF22h6CJVjJh1JeEqI43ApN2Dr3JiWtIUFRfSp9Bk0QQ4U9Lf4g2sjma4m6J+I8PsdBZBQ0SMY2yrzFNdNayaH7UM+GaG8fO8vtAzIX3vOST/IvkBiPjD7xAcUK6wTrSHZ8VulWgsixcehcF+kyr6OyooRYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daAYY4pl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daAYY4pl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so24187555e9.3;
        Sun, 23 Feb 2025 07:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740325991; x=1740930791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3e2PiIu2yG6qmD2UeYdaW6il4BUgkIs9FCPbn92s/E=;
        b=daAYY4plkX3+73kgXcSjoD+pPwCNz+jaBsss5Oxn5g0K1p709QcT7nxnaSFHNUcbaY
         CVUx5omXo/kyg70UqjvgO9JAgbpfVz7fzcjDWgYIVzmfTDlp6UKFTzM9a356fPIOQoRk
         e+bFnd4RyHhrb9gvYoW0wRPLrLaCmdWX2QNqLZJ74BVk5CZSNJE7vNp5feICZlwAza9/
         Be7LgWxKLaP27YK2gib+agGjPR9cDLvqG5XB9/1+oKzgmAnEnDLOQul1a/ne5fRGGbli
         8bYSEC2vLPh6GKxSV8EgOvYky5PU80kL2qzaxbTiwEKkrodo67EMBN99gFMhKtZ6i4Yy
         Rv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740325991; x=1740930791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3e2PiIu2yG6qmD2UeYdaW6il4BUgkIs9FCPbn92s/E=;
        b=WZeYwjMcd0pCplG7luanhGYNLs3cEb1DVLxeM+/XmY2KPBL/oKS6wiNL9TCk9eAhMn
         19gx/Z1tBHySmeeZyLA09x3VXH6e5HVTgLCpyYr+oebgF+vj6hi12N4a1GDDE/NExVaE
         w3sn7ij/IchYmtBjtm895Mji3bggNhLss5gNZXdFVEvchyknhKnMixxvYeZlvZ5oPK78
         JuvBbZtunJX+Z1V0ZKyHZgFv47uzeBX2LB95LRIvQGxz1qvSvLYlpY/pwfqQVPmmbUf3
         o4CLxo5JBfkTGSciWM26HKD37mMj3Pjmd2NqBMnZ5WixFuZJUAKekY8lNhh+t501DU52
         v4lw==
X-Forwarded-Encrypted: i=1; AJvYcCUEdrhqsAWbpLtlG/MmX3k0Snop6Nf/rBvffLu/cIH+3SWxiTATEPndSHxlK/OGVaW1yHt+wWWIMTHW@vger.kernel.org, AJvYcCX++oW3TlWX2u7pRj86vDywQDZnQanHLv+mG9hM/pIFuZpu8NanbHPX1uuuf53mMQqRmt8Ij+QDjixA@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMiSE1DvZ/jmrSQMuPeR5xQvxBIpX2+hIu8iY/ON7Bi0CmLJP
	8C9xeLiLYADUcI9Y4K9gR93Wf8sEIfMNxWM/YHvVmn/hEo815xC3
X-Gm-Gg: ASbGncus2d7GcORZyog6dxe2xHBHg5YwKYiwdO9E1qLywS2S5J464nNTp1L5lKWlt6V
	87Yk8s5d4eq4PJSeqJhLLIfMfo+9+aYan7Tio8yjfDQakpVh6HUC2V/H7YR5+n6ucBr+3uTB09G
	OgeyBTXeogyU17SmihlUKlvYIffNvPG9sFLNA9rG9WJSZguGjloVpTen5tyEMfxm5MoVQC3FoRo
	Y+IRAuypDaeCvDJlzAupsqcIXDIw2iB6t6xYLzC82BacFq2KjWGnbvUZMsmgJlWmgvHMQanAyNv
	UpNABHdkPuDlpv6uF0Va+4565CRj5fvFRzQ/vteUrbN2e5yy9C7ntIXUm7Ps60SjZah4FNU9jy8
	qiA==
X-Google-Smtp-Source: AGHT+IHPL+jXdxEEeBLWCOIwCIuIIZzPVqsjlW/gM+1S4FJuWMcMNYeu7/iNQfK6XHsfzRzL83fmfA==
X-Received: by 2002:a05:600c:1d29:b0:439:9377:fa17 with SMTP id 5b1f17b1804b1-439ae1f4d07mr88074615e9.18.1740325990809;
        Sun, 23 Feb 2025 07:53:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce428sm82838535e9.5.2025.02.23.07.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 07:53:10 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v7 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Sun, 23 Feb 2025 16:53:08 +0100
Message-ID: <2150124.bB369e8A3T@jernej-laptop>
In-Reply-To: <7770397.EvYhyI6sBW@jernej-laptop>
References:
 <20250216183524.12095-1-ryan@testtoast.com>
 <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
 <7770397.EvYhyI6sBW@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Maxime,

I'd like to pick your brain for the issue below.

Dne sobota, 22. februar 2025 ob 10:28:51 Srednjeevropski standardni =C4=8Da=
s je Jernej =C5=A0krabec napisal(a):
> Dne sobota, 22. februar 2025 ob 03:48:01 Srednjeevropski standardni =C4=
=8Das je Ryan Walklin napisal(a):
> > On Sat, 22 Feb 2025, at 7:57 AM, Jernej =C5=A0krabec wrote:
> > > Hi Ryan,
> > >
> > > sorry for very late review, but here we go...
> >=20
> > No problem, thanks for the review!
> >=20
> > > This patchset actually introduces 3 disticnt features, which should I=
MO=20
> > > be separated
> > > and thus making reviewing patches easier.
> > >
> > > 1. native 10-bit YUV420 output (without YUV->RGB->YUV conversions) -=
=20
> > > this is used on
> > >     HDMI for proper 10-bit 4K@60 HDR output
> > > 2. Display Engine 3.3 (DE33) support
> > > 3. AFBC modifier/format support (used for more efficient GPU or VPU=20
> > > output rendering)
> > >
> > > If I'm not mistaken, your goal is only DE33 support.=20
> >=20
> > This is my initial goal, but I would still like good HDMI and video sup=
port (including HW decode).=20
> >=20
> > It took some refactoring and resequencing of (your) existing driver wor=
k to get to this series, and I have left out the HDMI and separated the TCO=
N code for the same reason, that initially I am intending to just support R=
GB operation to an LCD. I do intend however to use the HDMI code either in =
or out of tree but think that will be a much bigger/more complex change to =
mainline given the current HDMI code is more invasive to the generic driver.
> >=20
> > The YUV and AFBC changes seemed more self-contained and seemed reasonab=
le approaches given that they were both features of the DE3 and up. I am ha=
ppy either to split these into either 4 or 5 separate patches ie:
> >=20
> > 1a. refactor CSC code to prepare for YUV
> > 1b. add YUV for DE3
> > 2. refactor mixer enumeration and regmaps to support DE3+
> > 3. add DE33
> > 4. Add AFBC
> >=20
> > My only reluctance is that that adds more work to manage multiple patch=
es which are logically grouped and in terms of ease of review, all these 4 =
steps are in the current set in that order (apart from AFBC which is comple=
tely standalone), and I don't think submitting them separately reduces comp=
lexity. It however will reduce reviewer burden as you suggest, but this has=
 been a slow process already.
>=20
> Sorry, completely forgot. YUV420 HDMI code relies on my previous work, wi=
th which
> Maxime wasn't happy with:
>=20
> https://lore.kernel.org/linux-sunxi/20230924192604.3262187-1-jernej.skrab=
ec@gmail.com/
>=20
> So unless switching HDMI to bridge ops is implemented, which also brings =
format,
> YUV formatter and some other patches just add unused code, which isn't id=
eal,
> especially if we decide to rework driver before that code can be put in a=
cceptable
> state for all involved.
>=20
> From quick look, patches 5-13, 26 should be dropped for now. Not sure abo=
ut 1-4.
>=20
> I'm fine with AFBC support going in, it's just one patch.
>=20
> >=20
> > I am happy to accept either process but this has been some time already=
 now with lots of stylistic feedback but not much on the correctness of the=
 approach and code, and I am keen to get this landed.
> >=20
> > There is are two=20
> > > reasons why
> > > I've never sent these patches myself:
> > >
> > > 1. scaling YUV images doesn't work
> > >
> > > Not a problem for any user who doesn't use video player with DRM plan=
e=20
> > > rendering,
> > > which I assume is most of them. We can get around of this issue to de=
ny=20
> > > scaling
> > > YUV buffers until the issue is sorted out.
> >=20
> > Good to know, I hadn't appreciated that. Mostly relevant for video as y=
ou say and it would be good to land YUV support without scaling, then exten=
d subsequently, possibly when we get to the video engine?
>=20
> Correct.
>=20
> Just be aware of one thing. Even if YUV buffer is rendered in 1:1 scale, =
vi scaler
> still needs to be configured. That's because U and V planes are subsample=
d and
> need to be scaled to Y plane size. For unknown reason, that works just fi=
ne, but
> if Y scale is bigger than 1, it all falls apart.
>=20
> This should be implemented in atomic check.
>=20
> >=20
> > > 2. plane allocations are hackish
> > >
> > > DE33 for the first time introduced option to move planes between the=
=20
> > > mixers. DRM
> > > has also support for this, but for time being static allocation is=20
> > > acceptable and tbh,
> > > even dynamic support need appropriate initial setting.
> > > As you might guessed this is done in DE33 clock driver using magic=20
> > > values. Proper
> > > way would be to introduce some kind of connection between mixer/plane=
=20
> > > and clock
> > > driver, so initial configuration can be moved to appropriate module=20
> > > instead of
> > > being thrown into clock driver. I need to check where to put it and h=
ow=20
> > > to properly
> > > connect DT nodes. Maybe syscon phandle? I'll do some research.
> >=20
> > Thanks, I was not aware of this either.
>=20
> Here you have some pointers how this values are actually set:
> https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-5.15-su=
n55iw3/bsp/drivers/video/sunxi/disp2/disp/de/lowlevel_v33x/de330/de_top.c#L=
232-L260
>=20
> I think this is the biggest issue of this code. As soon as we solve it pr=
operly, we
> have an ability to implement all remaining features at a later date.
>=20

DE33 has introduced "shared" planes, which can be allocated to any mixer. T=
hey
have now distinct memory region and are not included in mixer regions anymo=
re
as it was the case with DE2 and DE3. This patchset maps whole planes region=
 to
mixer0 which was a hack to get quick result and to push problem to a later =
time,
which is obviously now.

I see two solutions:
1. All mixers map same region for planes. Not sure if this is acceptable, b=
ut it's
    far the easiest to implement (already done).
2. Implement separate plane driver. Each mixer would have phandle to plane =
node
    and could call plane management functions there, like switch plane crtc=
=2E This
    to me sounds like a better solution.

What do you think?

Best regards,
Jernej

> >=20
> > > There is one glaring issue (when you work on driver and test every=20
> > > aspect of it).
> > > DE33 introduced RCQ, which is basically DMA, which copies shadowed=20
> > > registers
> > > from memory buffer directly to hw registers. IIRC it does that at=20
> > > vblank time. This
> > > tells you that current concept of writing register values at any time=
=20
> > > userspace feels
> > > to do commit is wrong and we've been lucky that it works as well as i=
t=20
> > > does. So,
> > > in order to fix this, driver would need quite a big reorganization.=20
> > > Introducing
> > > shadow buffers would solve most of the issues, most likely also with=
=20
> > > YUV scaling.
> > > Implementing RCQ would be then relatively simple and even improve=20
> > > timings.
> > > Note that even DE3 has occasional issue with YUV scaler and also=20
> > > read-modify-read
> > > access to some of its register can produce bogus value and thus corru=
pt=20
> > > image
> > > until next commit.
> >=20
> > Thanks, again I wasn't aware. All my testing has shown remarkable stabi=
lity and there are some downstream users out-of-tree with good feedback, bu=
t would be happy to support an effort to improve this.
>=20
> Let's land DE33 support first since it's long overdue and then I'm happy =
to discuss plans for moving forward.
>=20
> Best regards,
> Jernej
>=20
> >=20
> > Regards,
> >=20
> > Ryan
> >=20
>=20
>=20
>=20
>=20
>=20




