Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B233D76
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244444; cv=none; b=n9qHhUHPNYFcEGxk/RULREQIqfsFhtfAwImFHD7LFioIVNk1iImepTNKSLYoq/cQ5rmWv51sIrWNkZTzXp46oGREnI9+e4VxOkzwJrDVk0ZksuqmiJVKFBH1c9Do9whfjfkQuqTTob6uYsTWJIvbeSToaCSsdu34geacHwQ68Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244444; c=relaxed/simple;
	bh=hM7wgJff5d7dm1zCwMs/ze2o10lynhLmBxBK0IeNa+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/VcbNSQq9whHQDVnWo4SNqPJv2bdU6D/epRiS7OmxNrax+rsR+gduF/KZ9Ib0F/i/QpUIYP31tI4Jf2RAh0j70FmR93f8Q3Jb7S3jdYbxs62pX5Plau6OZGiTWcwU5mQKKHxjS6pqLZOsxMvqIO145Zj9frjeNvpw5zH1IXYz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCaobtUE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCaobtUE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E97E1F00ADE
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785244443;
	bh=HstpdYfbywLWh4CB6nynAIB64mnsBl07BDpNKOrgIFE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cCaobtUEdzz6WRAUNsTL3Z2vgY+Co9DP4VkHm+Gsb7xa6sbxVRRo0eJmjA0z5lLco
	 AEhqign9VQ1QldpFiba9OJX6QVUyv8VKT584kgql4jr0NllmZSJN+79lHqyIy2ug76
	 AwNOw/8sBO2jiGYABfcfoAQ1qWvEgMdVR48oD8gN5wnNzvGn1KqXUEOXgplHORXW3Q
	 R63ziezh8499ch4nkSEg/J2YWrYrfc+ktmsMa053XWGZamjCcJb2zyf2c7cOZOi8eB
	 WOOy/DpYkNYX1/In6ThKJH/honitiwtyjASzpa/u0XJnE+PGssiBRxQaPRUxX3M56q
	 xEXhTcDtCa+Aw==
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-49fa951b2c6so2101935b6e.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 06:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqiIZh1B/behm1HLot+5/6u4ho6fx5yklaXoGY7K2x+a5Xoj4yGJlTX2EkN7ayTmgWMmVr39GUidsw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+0Fxdj3XoXBpNBWFQ+jzleKvSHuQzAouqZjd6eOx1RCpe8pep
	7IPM1Zy3FmgTHE4xB0egpgO/W+brQ1dSNc4nC+glIjZlJ0BBY2XmR4jSETocizWyVTX+6l7ktlg
	ZGg1fKzbTibkTBerkFge8Ly2MGEJT3N8=
X-Received: by 2002:a05:6808:d4b:b0:497:ce6a:c1e3 with SMTP id
 5614622812f47-4ad5b9ee590mr1487519b6e.31.1785244442094; Tue, 28 Jul 2026
 06:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
In-Reply-To: <amiqKRkFItYwD6oL@redhat.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Jul 2026 21:13:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
X-Gm-Features: AUfX_myW1QhqVL6Ph24cCnrD1naOOoxnlCT_fOiXs5oLs21mzKAdeU9Y2nOIEvw
Message-ID: <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Brian Masney <bmasney@redhat.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Chen-Yu,
>
> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > Hi everyone,
> >
> > This is v4 of my MT8173 PowerVR GPU support series.
> >
> > This time around Mesa was ready for basic testing, using both vulkanmar=
k
> > and glmark2-es2-drm (with Zink). Details below.
> >
> > Changes since v3 (all in the clk driver patch):
> > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > - Added missing of_node_put() in remove function
> >
> > Changes since v2 (all in the clk driver patch):
> > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >   - Needed since the driver implements PM domains using the generic PM
> >     domain library, which also depends on PM
> >   - Fixes build breakage (kernel test robot)
> > - Fixed "RST_DELAY_CNT" name (Brian)
> > - Dropped unused mfg_desc (Brian)
> > - Added check of clk_prepare_enable()'s return value in
> >   clk_mt8173_mfgtop_power_on() (Brian)
> > - Saved error value for return in IS_ERR(data->clk_26m) branch
> >   (Dan Carpenter / kernel test robot w/ smatch)
> >
> > Changes since v1:
> > - Adapted to changed DT bindings
> > - Dropped driver change
> > - Use same power domain for "a" and "b" GPU power domains
> >
> >
> > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > some Chromebooks.
>
> I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
> go through the clk tree? Patches 3,5 go through the DRM tree?

Only patches 1 and 2 should go through the clock tree.

Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick up
DT binding patches. Otherwise I can push patch 3 through drm-misc.


Thanks
ChenYu
