Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65612206F05;
	Sat, 22 Feb 2025 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216537; cv=none; b=YgczzfDbxgoC0OTmuG0p9kdDrfTjtPvdL3uztE1X6DdxhJKUtJakM0MX/DoBk83qZuns1lMajA61dtBWBVwcKpoO+byMNuCI4xzPxYUPGkfE7UlZhKLloOvq/7T31ZURYdXwnE9VMBn51A9XlPQh/0ii1QMDn/iap/WWPu2p000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216537; c=relaxed/simple;
	bh=rdRab1LYMrE7cNMzvsINjaa3q9Muiny8rBimFEtPdZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aRnzNbGGexXYMZvBz7Q17KqK/TILrnET0D8Gac2WLDlzzTzdo5yQOWFN+t2lFs4TPoNcK8IA0fxe5BK8g8OEVQKB5AwcWt5NXimf6mtEW6ZekKE1nj+SPcdcsbO5ovPFURz8/BV+m/9aZy89oDgz/MrWwFU74y9gPr+h/uedL4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4vyYeVq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4vyYeVq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so1471495f8f.1;
        Sat, 22 Feb 2025 01:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740216534; x=1740821334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=St1JTstNvtpDJwVJQG8kMHDEmxsx7ifcGkS2W32UHvQ=;
        b=b4vyYeVqnLyexEz8UPrHOCVvMP2kg+WcGdf9ODumzQXPeQp2b6yDKmImyoN4rqd5II
         OeDnbcybYfBMwagKLaSe8bfCyzEiNxco/R1glwMFUkWQzz8PPYRyQW6gXLGd6ILOTWim
         uPJcWurcWkJsI+VxNH2u1TaJJDUm6J9E9N7S6t6AkZ4Wq6vHKh+Lz5MggrnJN+8ewc9/
         ftSsdRLa636C3dLF0CyOlQAhEqKxfuy0VBp+eOJ6YC5bHrP5B1X0QJx5BKnuu5+3iSfJ
         WKPirhLdLVo0H3cyvbwJMfi4x5Jnwtws0tXYAK8NSR+g0Fugk5OWD5klthDKHKTtbVJm
         E53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740216534; x=1740821334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=St1JTstNvtpDJwVJQG8kMHDEmxsx7ifcGkS2W32UHvQ=;
        b=qNgQCLkR1ZtucjzKxpfNjlfAaJJ21xx5VPRQtmRoKWdXmVIi6T8ek7yBQjd1NpGWkT
         r2ppoL6CDQuJXsazlbq1c9wZQqtjMcru0+caL+DbXrUUMG7WTHlgJJTaY/aFhawRbTAt
         xjA2kVQoRA6t7Rw1cfQVKtxP1PAWK+1hLYg1VAT2MzfsJY+j/Ftsd4Q88/x/KcI0tVk1
         2zmxjOq0BaJBF3C+CLE4CqSKNaAH+cJxTYEWMpKUhHX6E/izMsQgQNjJ3fpd2EXdYIey
         gaNDK1dAj3jeC6MDpp+oDY15wLUI85zmtbEqDxVYUilZAbwxVpi8xuyRt6E4+3myNgFI
         +nSg==
X-Forwarded-Encrypted: i=1; AJvYcCVMzzl4+JtOR8pIeG20+kiIKpJf4cRJz5PLKX6igTU4sUGL27v8iUfO4eIHIxQvVZymS+ZV7h5xgkiG@vger.kernel.org, AJvYcCXm2s6AlPlEIUrxtjR+to4So+wEvkkOIRrB7Yptwxdk8mI3gK7da+qU84XWhlmal/rtcZZWC0Ho+zc7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/w9DoA1BJHn/s2Usqg+Zv97rlLQoiycUtXGNi6pgO+rNoE9pc
	z7bmbjCIGCs6hm8YJmi2P2y1GrVyP9eSWAsYbx35TcoCb6QDDbIC
X-Gm-Gg: ASbGncs1ui80a7UMRqO/jsubDgkuWO45BjI7mzAB5yKIrN2Gvm0cNuKvwVZeVRdY6be
	aDCG8SRAfd6FNpcRUI5Fmcd7zVusXEefSwPW6B47XG/cHrduHZF45Ui5ZQulCPOXcq3P0U9W/8A
	s0MWhw3Mh30VFEEN7zuVmsaZHY2Y5InZYi3Q4PeE41/3PbFMHrSq7U9FOqpGohvX9z3yOxee4s8
	de1TavMGsG+wjcxttgh3W6hXXq1FJsQnHCKXUnh8Yd/fwV7XbWm/IVCJHzl8eY/tW2cPi3WIv/N
	blqGu7FdV6Iuj0c5nQBjQi/nun6kro4zef+i/nzVo8L/LkpgVfiDLpbNHT3QgB+HJLrGPvNf3Lb
	WhA==
X-Google-Smtp-Source: AGHT+IF6pzVIMqT3bI5J8rbMV0F1AIJ9MBRqLOEPinMndAjfKOv9u7BlBPc4YGBvwr2qQglMbEAZjA==
X-Received: by 2002:a5d:6da2:0:b0:38f:443b:48f4 with SMTP id ffacd0b85a97d-38f6f0d0ea0mr4633663f8f.49.1740216533405;
        Sat, 22 Feb 2025 01:28:53 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b439dsm25488772f8f.8.2025.02.22.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:28:52 -0800 (PST)
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
Date: Sat, 22 Feb 2025 10:28:51 +0100
Message-ID: <7770397.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
References:
 <20250216183524.12095-1-ryan@testtoast.com>
 <2221204.Mh6RI2rZIc@jernej-laptop>
 <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 22. februar 2025 ob 03:48:01 Srednjeevropski standardni =C4=8Da=
s je Ryan Walklin napisal(a):
> On Sat, 22 Feb 2025, at 7:57 AM, Jernej =C5=A0krabec wrote:
> > Hi Ryan,
> >
> > sorry for very late review, but here we go...
>=20
> No problem, thanks for the review!
>=20
> > This patchset actually introduces 3 disticnt features, which should IMO=
=20
> > be separated
> > and thus making reviewing patches easier.
> >
> > 1. native 10-bit YUV420 output (without YUV->RGB->YUV conversions) -=20
> > this is used on
> >     HDMI for proper 10-bit 4K@60 HDR output
> > 2. Display Engine 3.3 (DE33) support
> > 3. AFBC modifier/format support (used for more efficient GPU or VPU=20
> > output rendering)
> >
> > If I'm not mistaken, your goal is only DE33 support.=20
>=20
> This is my initial goal, but I would still like good HDMI and video suppo=
rt (including HW decode).=20
>=20
> It took some refactoring and resequencing of (your) existing driver work =
to get to this series, and I have left out the HDMI and separated the TCON =
code for the same reason, that initially I am intending to just support RGB=
 operation to an LCD. I do intend however to use the HDMI code either in or=
 out of tree but think that will be a much bigger/more complex change to ma=
inline given the current HDMI code is more invasive to the generic driver.
>=20
> The YUV and AFBC changes seemed more self-contained and seemed reasonable=
 approaches given that they were both features of the DE3 and up. I am happ=
y either to split these into either 4 or 5 separate patches ie:
>=20
> 1a. refactor CSC code to prepare for YUV
> 1b. add YUV for DE3
> 2. refactor mixer enumeration and regmaps to support DE3+
> 3. add DE33
> 4. Add AFBC
>=20
> My only reluctance is that that adds more work to manage multiple patches=
 which are logically grouped and in terms of ease of review, all these 4 st=
eps are in the current set in that order (apart from AFBC which is complete=
ly standalone), and I don't think submitting them separately reduces comple=
xity. It however will reduce reviewer burden as you suggest, but this has b=
een a slow process already.

Sorry, completely forgot. YUV420 HDMI code relies on my previous work, with=
 which
Maxime wasn't happy with:

https://lore.kernel.org/linux-sunxi/20230924192604.3262187-1-jernej.skrabec=
@gmail.com/

So unless switching HDMI to bridge ops is implemented, which also brings fo=
rmat,
YUV formatter and some other patches just add unused code, which isn't idea=
l,
especially if we decide to rework driver before that code can be put in acc=
eptable
state for all involved.

=46rom quick look, patches 5-13, 26 should be dropped for now. Not sure abo=
ut 1-4.

I'm fine with AFBC support going in, it's just one patch.

>=20
> I am happy to accept either process but this has been some time already n=
ow with lots of stylistic feedback but not much on the correctness of the a=
pproach and code, and I am keen to get this landed.
>=20
> There is are two=20
> > reasons why
> > I've never sent these patches myself:
> >
> > 1. scaling YUV images doesn't work
> >
> > Not a problem for any user who doesn't use video player with DRM plane=
=20
> > rendering,
> > which I assume is most of them. We can get around of this issue to deny=
=20
> > scaling
> > YUV buffers until the issue is sorted out.
>=20
> Good to know, I hadn't appreciated that. Mostly relevant for video as you=
 say and it would be good to land YUV support without scaling, then extend =
subsequently, possibly when we get to the video engine?

Correct.

Just be aware of one thing. Even if YUV buffer is rendered in 1:1 scale, vi=
 scaler
still needs to be configured. That's because U and V planes are subsampled =
and
need to be scaled to Y plane size. For unknown reason, that works just fine=
, but
if Y scale is bigger than 1, it all falls apart.

This should be implemented in atomic check.

>=20
> > 2. plane allocations are hackish
> >
> > DE33 for the first time introduced option to move planes between the=20
> > mixers. DRM
> > has also support for this, but for time being static allocation is=20
> > acceptable and tbh,
> > even dynamic support need appropriate initial setting.
> > As you might guessed this is done in DE33 clock driver using magic=20
> > values. Proper
> > way would be to introduce some kind of connection between mixer/plane=20
> > and clock
> > driver, so initial configuration can be moved to appropriate module=20
> > instead of
> > being thrown into clock driver. I need to check where to put it and how=
=20
> > to properly
> > connect DT nodes. Maybe syscon phandle? I'll do some research.
>=20
> Thanks, I was not aware of this either.

Here you have some pointers how this values are actually set:
https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-5.15-sun5=
5iw3/bsp/drivers/video/sunxi/disp2/disp/de/lowlevel_v33x/de330/de_top.c#L23=
2-L260

I think this is the biggest issue of this code. As soon as we solve it prop=
erly, we
have an ability to implement all remaining features at a later date.

>=20
> > There is one glaring issue (when you work on driver and test every=20
> > aspect of it).
> > DE33 introduced RCQ, which is basically DMA, which copies shadowed=20
> > registers
> > from memory buffer directly to hw registers. IIRC it does that at=20
> > vblank time. This
> > tells you that current concept of writing register values at any time=20
> > userspace feels
> > to do commit is wrong and we've been lucky that it works as well as it=
=20
> > does. So,
> > in order to fix this, driver would need quite a big reorganization.=20
> > Introducing
> > shadow buffers would solve most of the issues, most likely also with=20
> > YUV scaling.
> > Implementing RCQ would be then relatively simple and even improve=20
> > timings.
> > Note that even DE3 has occasional issue with YUV scaler and also=20
> > read-modify-read
> > access to some of its register can produce bogus value and thus corrupt=
=20
> > image
> > until next commit.
>=20
> Thanks, again I wasn't aware. All my testing has shown remarkable stabili=
ty and there are some downstream users out-of-tree with good feedback, but =
would be happy to support an effort to improve this.

Let's land DE33 support first since it's long overdue and then I'm happy to=
 discuss plans for moving forward.

Best regards,
Jernej

>=20
> Regards,
>=20
> Ryan
>=20




