Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8496D42DA26
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415116; cv=none; b=YZlGoi1SC7R0XxJU1M+Ku9TL2AIq2FS+D3pJ4+3dKbn/xuEA/dihFkNOVKFcfIY4vgy5vopbZPORaj7jJL8E/brVc46H7j/y261qkyU1AAiHZ2mzBq5eg4i5y3XgaSuECNLyop7WmHrBZtX9US/N/u13VLSqTJqWKOfd6VyLQm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415116; c=relaxed/simple;
	bh=jRb0tpRGNkrC7c5RFqTLqhysl8zCsW4xFBvUK5ZAhkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJFv+ip6omTMEHgS0ajnwRnezEstk2FLdZOG0RHYd0kZZBqVn9th0GYWM3akdy/ooMY92MDMz1+THb+tGlft2eGTM0S7ER0/vBA06eVd+xq6YpeqHkPNDhkBQ5Irih6qxgkEA3AlNvvj6eXJD0LqH4iTY+59LtlCgJMvNApCIxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqQZ1Wem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqQZ1Wem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD451F00A3D
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785415115;
	bh=mggr7wvIfCEo+6dv/C0d5uPBSyxJCecBvJHz21a0w1o=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=JqQZ1Wem/W/7xLxCQm3EG3EkTkaXKflALH8qNzS3RVDmEiOS79agVsGHyEALzou3D
	 GYUDku/DoBb52HTNcggTMGeLICvvemsWQlakuOY5bB+UmwfmBii4k2CukXAU2S7iDe
	 wt69oS65mxwwR6vWL7PAIPlW5IuJmMjfeHnF9z4vvfvIBcEsbzREvQqtwkr3XeMNpL
	 TRmxlhGCCQJI3k66rbIGtzo4Cl8XHAdq12B+9lnseX6lD4COHJG/nX7nmconEkwVYh
	 HIZ7sq/ba32yxHFBy5FnWY9ypes/+veFhho8/C0RtSckRR8O1hGMGhjy/2oehu4DZ7
	 ZLdwvjWEcZX6w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c9452243cso20166931fa.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 05:38:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoqqheVkefxszLl1bDprrlsdiUG25kgytlAGAbUg2ewhlcj1rzvyGGvk+9e+wcNN+coQtV3lR7Tl74=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBW2KTQJ8ItHvJUJsmyINrBcg2lq7BkmlTuAdSLZdyS4yG3RnG
	gMCm371TcbJptC2Ll9RroPvo75Rj8kqX7ID2hIG3ra1/MXK8Ibf/FgkoxtlVYkC7Tuq5bsYg/Vz
	pBWND4blhKlDsnyjJgEJBWYAoMZspas4=
X-Received: by 2002:a2e:a99b:0:b0:399:83a4:4f2c with SMTP id
 38308e7fff4ca-39f6d112905mr4228721fa.18.1785415113867; Thu, 30 Jul 2026
 05:38:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com> <amswFn2qWkvypMH8@redhat.com>
In-Reply-To: <amswFn2qWkvypMH8@redhat.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 30 Jul 2026 20:38:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
X-Gm-Features: AUfX_mwS6SDXJLNyyEHek9sC4FMHJj30AO-N34TA1MSNgmBhhcn22gBEYkF6-6I
Message-ID: <CAGb2v65yEtUH5LQ=kGL1io-urha12iOute=D2bbG872YXbK4fQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Brian Masney <bmasney@redhat.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 7:06=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Angelo and Chen-Yu,
>
> On Thu, Jul 30, 2026 at 10:23:14AM +0200, AngeloGioacchino Del Regno wrot=
e:
> > On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > > >
> > > > On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@red=
hat.com> wrote:
> > > > > > On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > > > > > Hi everyone,
> > > > > > >
> > > > > > > This is v4 of my MT8173 PowerVR GPU support series.
> > > > > > >
> > > > > > > This time around Mesa was ready for basic testing, using both=
 vulkanmark
> > > > > > > and glmark2-es2-drm (with Zink). Details below.
> > > > > > >
> > > > > > > Changes since v3 (all in the clk driver patch):
> > > > > > > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > > > - Added missing of_node_put() in remove function
> > > > > > >
> > > > > > > Changes since v2 (all in the clk driver patch):
> > > > > > > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > > >     - Needed since the driver implements PM domains using the=
 generic PM
> > > > > > >       domain library, which also depends on PM
> > > > > > >     - Fixes build breakage (kernel test robot)
> > > > > > > - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > > > - Dropped unused mfg_desc (Brian)
> > > > > > > - Added check of clk_prepare_enable()'s return value in
> > > > > > >     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > > > - Saved error value for return in IS_ERR(data->clk_26m) branc=
h
> > > > > > >     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > > >
> > > > > > > Changes since v1:
> > > > > > > - Adapted to changed DT bindings
> > > > > > > - Dropped driver change
> > > > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > > > >
> > > > > > >
> > > > > > > This series enables the PowerVR GPU found in the MT8173 SoC, =
found in
> > > > > > > some Chromebooks.
> > > > > >
> > > > > > I'm making a pull for Stephen for the clk changes. Should patch=
es 1,2,4
> > > > > > go through the clk tree? Patches 3,5 go through the DRM tree?
> > > > >
> > > > > Only patches 1 and 2 should go through the clock tree.
> > > > >
> > > > > Patch 3, 4, 5 can all go through the soc tree if Angelo wants to =
pick up
> > > > > DT binding patches. Otherwise I can push patch 3 through drm-misc=
.
> > > > >
> > > >
> > > > Not sure if I can really take the DRM bindings patch through soc.
> > > >
> > > > I will take the devicetree ones exactly right now, even though it's=
 going to
> > > > give warnings.
> > >
> > > Apologies for missing this, but the first DT patch depends on the clk=
 DT
> > > bindings patch for the clk ID macros. This is causing build errors in
> > > linux-next right now.
> > >
> > > Not sure how we can fix this right now.
> > >
> > > Brian, would it be possible for you to split out that patch into a
> > > separate immutable branch for Angelo to merge?
>
> Yes, I can split things out and make an immutable branch this morning.
> But it sounds too late for that.
>
> > >
> > > Otherwise Angelo might need to drop the DT patches until the next cyc=
le.
> >
> > Yeah, that's so bad.
> > I'd be happy to be able to resolve this, but it's too late on my side.
> >
> > I should've checked the DT patches more carefully, my bad: I got a bit =
too excited
> > to finally see this PowerVR stuff working on MT8173 and going upstream.
> >
> > Sadly, I have to drop the devicetree patches :-(
>
> Chen-Yu: Could Angelo add an Acked-by to the three patches, and then I se=
nd
> Stephen an additional pull with just those patches? Do you think he'd
> pull that?

(replying from my @kernel.org address again because I don't feel like
 pulling out my work laptop.)

I think the question is whether the soc & dt maintainers would be bothered
by it or not.

No need to sweat over it though. It's not like the GPU driver is production
ready anyway. We can just merge the DT patches in the next cycle. :)


ChenYu
