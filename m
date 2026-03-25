Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD1D32BF4B;
	Wed, 25 Mar 2026 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427490; cv=pass; b=LtH7ofcYoJT8VK1MBigpjDBgjxqNBQUo/Nhf9Aars1FJRfpZ4X8wO+HKAnwF9zjKKzYy40GV065Bx8JsfJmhp2xZDzUudKVKLLy7N1+Hf/CJdNAHUUEjKSYhKhH4izNvoVHtyUj7tRf7/n8+lQBYNi1F//Te5USEnInlwppTDuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427490; c=relaxed/simple;
	bh=+3oEbeVplHpWFLD8Fo9j6zzbv46giUuVu26IwT7anQQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uXq+dLp8/0ZM3QAkHgjZtEoFNl7OEN4OEvcXFzA3Tqltb10WbhbSfszGOveW1qCLBK/Sws7dGM/rSiz/oM9Vk4mnKFNT9uIk/4HAB3hoT9a+bZ246UHMZ24CcAZzFdjJwNNg82p5TUj0LknuvgMWlr/o4q5PO14G/YhHVXNImPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=m8fDSXm7; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="m8fDSXm7"
ARC-Seal: i=1; a=rsa-sha256; t=1774427469; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tyy2JscmFeXuNquAONvjESaenDfPxxRBJwbVDF+F6CspYdRP0THK77xpmIfKM8PMC1kYj2Ef/rG5wjlWS0A/kqXWQjfz9oEYokEizNoVoe1Re5F9m5/NYO9SIO3MXm6mddHJtEOFQFE62RS9m0LyHO1ftVv0kL5q4D3r/G6DXzM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774427469; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Spa+zFtTwKq/xwqL8Z460sYoU7uK43OPtIBMa8MAK2k=; 
	b=RnuGUVU2EXOf3k5jelhLGon3XphGBJssDU2A1nQc0hWTIyTqGBsqKWEmmvHfza1MsUKYQBUSw3wxSOw3NS/Pin9aJs3KmW0Df3QsdaOin92ocfAfVO0AlzN4T6o1eja2MiFDYS9K/4DlYIApdUq6I0imzvpsoHCbOwtdrgc0LOM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774427469;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Spa+zFtTwKq/xwqL8Z460sYoU7uK43OPtIBMa8MAK2k=;
	b=m8fDSXm7BdFQUyxuJ00+cdp8h2tIr0kX2FbCE3bUPTXHDjreydmBvIBVbKvWMirf
	ZxlRx8+Ic5QAeI7QC7nutldlgXcVoFUfvVoooiuCzq4N9VWrcXyZkSf8cerX0fKwmxN
	JnJ7ukhTEUyuxKP5RGMWnJJFSIvVFP4h6GNORgEDLy11SxLumAZoogUpm/NW2K9NbaZ
	cLRZLOZiNjIGEU103spEJ36xKwWBmcF96dsyN5ZuHk+aF+OVY+Lf/BMN3zjYmchAm4C
	cDKUnV6rOdZ+jIGL0fm1oLj/6oKa/6hVvbklDK9oVqslcZOOQorssqClzYckfhLEV8c
	VXdlgRFsGw==
Received: by mx.zohomail.com with SMTPS id 1774427467195309.4266563704275;
	Wed, 25 Mar 2026 01:31:07 -0700 (PDT)
Message-ID: <0739597b7a9c162525c10d82c3993e37af1c8a75.camel@icenowy.me>
Subject: Re: [PATCH v2 0/5] powervr: MT8173 GPU support
From: Icenowy Zheng <uwu@icenowy.me>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster	 <matt.coster@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Mar 2026 16:30:59 +0800
In-Reply-To: <CAGXv+5FL2rs35V4F0bwq-a4ccvFaWKcr1cuKxT6sfTj9h+d6iA@mail.gmail.com>
References: <20260325071951.544031-1-wenst@chromium.org>
	 <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
	 <CAGXv+5FL2rs35V4F0bwq-a4ccvFaWKcr1cuKxT6sfTj9h+d6iA@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 16:08 +0800=EF=BC=8CChen-Yu Tsai=E5=
=86=99=E9=81=93=EF=BC=9A
> On Wed, Mar 25, 2026 at 4:04=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wr=
ote:
> >=20
> > =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 15:19 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > > Hi everyone,
> > >=20
> > > This is v2 of my MT8173 PowerVR GPU support series.
> > >=20
> > > Changes since v1:
> > > - Adapted to changed DT bindings
> > > - Dropped driver change
> > > - Use same power domain for "a" and "b" GPU power domains
> > >=20
> > > This update was requested by Icenowy.
> > >=20
> > >=20
> > > This series enables the PowerVR GPU found in the MT8173 SoC,
> > > found in
> > > some Chromebooks.
> > >=20
> > > This version is different from the initial powervr driver
> > > submission
> > > [1]
> > > in that it splits out the GPU glue layer support out of the
> > > powervr
> > > driver and into a separate clock and power domain driver. The
> > > glue
> > > code
> > > is otherwise the same, and also the same as found in the ChromeOS
> > > kernels, with some extra comments and macro names added where
> > > possible.
> > >=20
> > > Patch 1 adds a binding for the glue layer, called mfgtop. The
> > > glue
> > > layer
> > > contains clock and power controls for the GPU.
> > >=20
> > > Patch 2 adds a driver for the glue layer.
> > >=20
> > > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the
> > > PowerVR
> > > binding.
> > >=20
> > > Patch 4 adds an entry for the PowerVR 6XT series GPU to the
> > > driver.
> > >=20
> > > Patch 5 corrects the clock for the GPU (called MFG) power domain.
> > >=20
> > > Patch 6 adds device nodes for the GPU and glue layer to the
> > > MT8173
> > > dtsi
> > > file.
> > >=20
> > > Patch 2 and 6 depend on patch 1 to build. I suppose some common
> > > immutable tree would be needed from the MediaTek maintainers.
> > >=20
> > > The kernel driver successfully probes the hardware and loads the
> > > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination
> > > Technologies
> > > [2].
> > > Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt
> > > with
> > > the powervr vulkan driver enabled. `vulkaninfo` gives some
> > > information
> > > about the GPU (attached at the end), but running the `triangle`
> > > example
> > > from the Sascha Willems demos [3] with -DUSE_D2D_WSI=3DON as
> > > recommended [4]
> > > failed with:
> > >=20
> > > =C2=A0=C2=A0=C2=A0 Can't find a display and a display mode!
> >=20
> > I think when using D2D the demos want width and height to be
> > explicitly
> > specified, otherwise it seems to hardcode 1280x720.
> >=20
> > If you're using an elm, could you try to add `-w 1920 -h 1080` or
> > for
> > hana `-w 1366 -h 768` ?
>=20
> I only did the basic `vulkaninfo` test this time around. To do
> anything
> interesting probably requires the Mesa 26.1 release.
>=20
> =C2=A0=C2=A0=C2=A0 PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vkmark --winsys kms -D b81f54f=
8568deb0fb70a6a1ed845b65d
>=20
> just reports "Error: Device specified by uuid is not available"

I am very sorry to tell you that, when I run Sascha's demo with Mesa
main, I got GPU lost immediately...

```
[  441.509433] powervr 13000000.gpu: [drm] *ERROR* GPU device lost
```

Icenowy

>=20
> This is with Mesa 26.0.2 packages from Debian testing. At least now
> have the powervr vulkan driver enabled by default, so I don't have
> to rebuild the packages again.
>=20
>=20
> ChenYu
>=20
> > Thanks
> > Icenowy
> >=20
> > >=20
> > > Same program worked correctly on a BeaglePlay and displayed a
> > > color
> > > gradient triangle. Not sure what went wrong here.
> > >=20
> > > Anyway, please have a look and test.
> > >=20
> > >=20
> > > Thanks
> > > ChenYu
> > >=20
> > > [1]
> > > https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walke=
r@imgtec.com/
> > > [2]
> > > https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powe=
rvr
> > > [3] https://github.com/SaschaWillems/Vulkan
> > > [4]
> > > https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19=
e@imgtec.com/
> > >=20
> > > Chen-Yu Tsai (5):
> > > =C2=A0 dt-bindings: clock: mediatek: Add mt8173 mfgtop
> > > =C2=A0 clk: mediatek: Add mt8173-mfgtop driver
> > > =C2=A0 dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> > > =C2=A0 arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
> > > =C2=A0 arm64: dts: mediatek: mt8173: Add GPU device nodes
> > >=20
> > > =C2=A0.../clock/mediatek,mt8173-mfgtop.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 70 +++++
> > > =C2=A0.../bindings/gpu/img,powervr-rogue.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0arch/arm64/boot/dts/mediatek/mt8173.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 33 ++-
> > > =C2=A0drivers/clk/mediatek/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 9 +
> > > =C2=A0drivers/clk/mediatek/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> > > =C2=A0drivers/clk/mediatek/clk-mt8173-mfgtop.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 243
> > > ++++++++++++++++++
> > > =C2=A0include/dt-bindings/clock/mt8173-clk.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
> > > =C2=A07 files changed, 363 insertions(+), 1 deletion(-)
> > > =C2=A0create mode 100644
> > > Documentation/devicetree/bindings/clock/mediatek,mt8173-
> > > mfgtop.yaml
> > > =C2=A0create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
