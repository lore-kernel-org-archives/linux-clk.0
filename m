Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB3314A9F
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430292; cv=pass; b=cMXMWsltTHr4gwpWVAWxSLD3KItltWJX5JqkgTzBAl0Ope3OxN7zQUnS/2CXHjABLQBMBPGcRx1G/+iMJPLnzlnR8hTm5rcyYJAGdbjwo7ytJA3TiXerR3eUn7/R1z1C9cKsM8MS2birq2/mUU2tDYllcbGcyv74ccXeuM1lu6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430292; c=relaxed/simple;
	bh=oXuLyf7SvrEVLG9w4iFIMkHzMgMFhUX80pfwamRWX4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huQFnZM8lcW8za0DbPgVWyV/J/Be/eHgt/m/F0m/eM6MxOM7DRDbNkOAavSPPUExYO1RPki3xJDMxjS1N3DTY0RSaFJUvHIhD93jLXIqkuHmjP9g/RVCIAz761rhyPUMGj4o04DkTfMaRcz+KV47Dy6ANyI838O8OM8qu+4jUgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N8pqkw3v; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N8pqkw3v"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ad26e3992so15620701fa.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 02:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774430289; cv=none;
        d=google.com; s=arc-20240605;
        b=A3czAaU1Mx3rLZntD+Eb6o7vKi6KaxAGbdnwv6dgRcpka7eWYByqMLuMJLrWmIYqPm
         WZnmJ5Y5s4UvjGqnhZxhZUhmgVp3MHn14rb6FwcD6QI1aszeXcXBnbqpNQdtKjXTKhQq
         EojubwgF9/tZWLiTfp8bRzWT2evXGvflrt83S1fYEBbxZYaUZXuEAwRTkl8Da6BGLsWQ
         caxkdR+4aYXzxQhjEEMOth5ObVeO7gdlP3tQfdpn6RP/UMPux87CZUPTzH+pC7fumv71
         PvjuilEbJNTchbKigxMwZsMVRe86V/9/80z3TzPCeKs6khLkjXQGt48nnRTOB0vnuVvt
         hLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JlhSXELYE8vgX7qqunsSd6qJxJ59KW296nfLjRCFqek=;
        fh=GyaFkMI0cHRQiu91yVRU7iU9R310Ih2qKS8lQQJ3yDA=;
        b=gtyjjKUzB04X604nmGAO4bAX+ApcK4Lkoq1+EUlgTge2ezyjCeYcq3sB4rbIhH6HOr
         69ca92I2ofJeVKuqlQ4HE9MV+EuiyF8Mj5KrIE4spKJxDaKgNT4O79d9Y6w4cPH0MnSN
         Lud1raB4LBeN/nEETv3N5oQpZ1NQh7cSVk35WD9opZfp15RenjwbOZ8IgVxNaFR6qP7t
         haG7Vrfkk3seAYk0Ysczf9KmlCfwKScvnp8GW7mo53tPUmYCZllSYYTvUjXw3WodwFaZ
         foJNP+3Q7Ti4NRLR40tmWNWUKEM2MyCAsPvBiN1eQlXKI5cCqQGlEJ00j0CBF45xgpWD
         7KeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774430289; x=1775035089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlhSXELYE8vgX7qqunsSd6qJxJ59KW296nfLjRCFqek=;
        b=N8pqkw3vqhaGiF6kaEOs9IQw3aRqpmI6rNArghnw7o7J+Bf7IKLkOUKxLFZnQHlPih
         FjuKXm5kt+pdELMhs+gEcmOvtU4QmLiCquj58Tt95p403VX49u0WzEqcynX4dd60LwDu
         SME/tDvRHnVT4BCR0/Xd9kaV4YcdnqotfYcmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430289; x=1775035089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JlhSXELYE8vgX7qqunsSd6qJxJ59KW296nfLjRCFqek=;
        b=GxJ4EfE9Fov9dKKv+eFIEdcwb0H0ZTvTBn4MIJBysXD+ehBVa047E+Dh7tVtMtzVnx
         oMXZ+v7avFqubg8NIwHeM2nXHK9GYmbZZS+aq4aGhntyPBGFCHFFE7jEWGEIFuIm/IRF
         c1xXQ7P7NjNX+dz+O0F4/D8hnDvtcbAZTnK3SsY5ixKiWCb+fzKnTdX/MQTvLauBlQ1v
         /rEfVgH7cieYOhdpVt8Nb/CEnQ1ezggl+Xlj3FBeZrQnOd3B06CnHvNDXcCO9tw5hVDY
         RjUrbHeZdC8wEr9SsSGswW/2NLYWgi4pfhs1Gb55jJ9vR6MaW5T5rh7uqX8dTaWhqFUC
         BEQw==
X-Forwarded-Encrypted: i=1; AJvYcCVNjXLuxQ8mL4/BDtbHMZSoMXUfS+jsrqH8Bu20X25sH2VM4ym+UeijIsV11FhK3ieLBhrtt0MXDrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4O06vlM7TVCzGDf3Vg1o9q/efnwh0392fwy5bmDaHUICYbGd
	q3VitE8jJ/7LVh6/iY5lOOxUma6IT37D8qSiclBz9mzW0i/ZeMBRfEqEcGy0VabUyUo1uBF2OkW
	CiUC9hTkqHxq8kXZ/MLJpFhcu6V1OV22gxIRzPf39
X-Gm-Gg: ATEYQzzHgHhXU1WDvWFbIG33dSw+kkx6FakaXqOd5boOhU8X7aU30i++n3PqhDGDnmh
	nsz6yo5x/2YbfyjmoEe+jdt1yo5acpLvL6HllreM2faE6LdCJbE/OuVS+k0/pVlJtBFJLgD6pTh
	46XZUUKISxyeVND2WV/oS745xuSO0/DEMeW8xxKDoNGVJQwJsDkjCr0FdC0URzzkK1UIUEykb4O
	oHF5BmtbKjrQ8ON3Nfjl9EKV2+AQG4FmGlUFD/DFZtbH+Wtzy4gpmARjrW1xp4P337NaCVcNmUF
	o7dsZXifv5FOyYpZZMzZC4rpq6B1E2viGq8X
X-Received: by 2002:a05:6512:1252:b0:5a2:8718:b322 with SMTP id
 2adb3069b0e04-5a29b97cb53mr1236317e87.15.1774430289060; Wed, 25 Mar 2026
 02:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325071951.544031-1-wenst@chromium.org> <93c1d325461cc0ffad890d64870de680506338c4.camel@icenowy.me>
 <CAGXv+5FL2rs35V4F0bwq-a4ccvFaWKcr1cuKxT6sfTj9h+d6iA@mail.gmail.com>
 <0739597b7a9c162525c10d82c3993e37af1c8a75.camel@icenowy.me> <cb75a09ecc88972503f5ade8e1807122c48d8ac8.camel@icenowy.me>
In-Reply-To: <cb75a09ecc88972503f5ade8e1807122c48d8ac8.camel@icenowy.me>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 17:17:57 +0800
X-Gm-Features: AQROBzAB2xsA--d1NrWuC5hnkU-nq8sFhsGVW2irjP7zw26EVL5TptjCi0fi-9g
Message-ID: <CAGXv+5EbFv5bybX4bkXOSiPZm4fG-dQy19dfUXJ6C8RE_tk6Cw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] powervr: MT8173 GPU support
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:42=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 16:30 +0800=EF=BC=8CIcenowy Zheng=
=E5=86=99=E9=81=93=EF=BC=9A
> > =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 16:08 +0800=EF=BC=8CChen-Yu Tsai=
=E5=86=99=E9=81=93=EF=BC=9A
> > > On Wed, Mar 25, 2026 at 4:04=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me=
>
> > > wrote:
> > > >
> > > > =E5=9C=A8 2026-03-25=E4=B8=89=E7=9A=84 15:19 +0800=EF=BC=8CChen-Yu =
Tsai=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Hi everyone,
> > > > >
> > > > > This is v2 of my MT8173 PowerVR GPU support series.
> > > > >
> > > > > Changes since v1:
> > > > > - Adapted to changed DT bindings
> > > > > - Dropped driver change
> > > > > - Use same power domain for "a" and "b" GPU power domains
> > > > >
> > > > > This update was requested by Icenowy.
> > > > >
> > > > >
> > > > > This series enables the PowerVR GPU found in the MT8173 SoC,
> > > > > found in
> > > > > some Chromebooks.
> > > > >
> > > > > This version is different from the initial powervr driver
> > > > > submission
> > > > > [1]
> > > > > in that it splits out the GPU glue layer support out of the
> > > > > powervr
> > > > > driver and into a separate clock and power domain driver. The
> > > > > glue
> > > > > code
> > > > > is otherwise the same, and also the same as found in the
> > > > > ChromeOS
> > > > > kernels, with some extra comments and macro names added where
> > > > > possible.
> > > > >
> > > > > Patch 1 adds a binding for the glue layer, called mfgtop. The
> > > > > glue
> > > > > layer
> > > > > contains clock and power controls for the GPU.
> > > > >
> > > > > Patch 2 adds a driver for the glue layer.
> > > > >
> > > > > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the
> > > > > PowerVR
> > > > > binding.
> > > > >
> > > > > Patch 4 adds an entry for the PowerVR 6XT series GPU to the
> > > > > driver.
> > > > >
> > > > > Patch 5 corrects the clock for the GPU (called MFG) power
> > > > > domain.
> > > > >
> > > > > Patch 6 adds device nodes for the GPU and glue layer to the
> > > > > MT8173
> > > > > dtsi
> > > > > file.
> > > > >
> > > > > Patch 2 and 6 depend on patch 1 to build. I suppose some common
> > > > > immutable tree would be needed from the MediaTek maintainers.
> > > > >
> > > > > The kernel driver successfully probes the hardware and loads
> > > > > the
> > > > > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination
> > > > > Technologies
> > > > > [2].
> > > > > Userspace was tested with Mesa 24.0.8 from Debian Trixie
> > > > > rebuilt
> > > > > with
> > > > > the powervr vulkan driver enabled. `vulkaninfo` gives some
> > > > > information
> > > > > about the GPU (attached at the end), but running the `triangle`
> > > > > example
> > > > > from the Sascha Willems demos [3] with -DUSE_D2D_WSI=3DON as
> > > > > recommended [4]
> > > > > failed with:
> > > > >
> > > > >     Can't find a display and a display mode!
> > > >
> > > > I think when using D2D the demos want width and height to be
> > > > explicitly
> > > > specified, otherwise it seems to hardcode 1280x720.
> > > >
> > > > If you're using an elm, could you try to add `-w 1920 -h 1080` or
> > > > for
> > > > hana `-w 1366 -h 768` ?
> > >
> > > I only did the basic `vulkaninfo` test this time around. To do
> > > anything
> > > interesting probably requires the Mesa 26.1 release.
> > >
> > >     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
> > >         vkmark --winsys kms -D b81f54f8568deb0fb70a6a1ed845b65d
> > >
> > > just reports "Error: Device specified by uuid is not available"
> >
> > I am very sorry to tell you that, when I run Sascha's demo with Mesa
> > main, I got GPU lost immediately...
> >
> > ```
> > [  441.509433] powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> > ```
>
> Sidenote: I think this is some power domain management issue, because I
> saw the kernel saying `vgpu: disabling` , which shouldn't happen if the
> GPU is active?

AFAICT "vgpu" is the vgpu output from the primary PMIC. This one is unused.
The actual regulator supplying the GPU is from the secondary PMIC. The
rail is called VBUCKB...


ChenYu


> >
> > Icenowy
> >
> > >
> > > This is with Mesa 26.0.2 packages from Debian testing. At least now
> > > have the powervr vulkan driver enabled by default, so I don't have
> > > to rebuild the packages again.
> > >
> > >
> > > ChenYu
> > >
> > > > Thanks
> > > > Icenowy
> > > >
> > > > >
> > > > > Same program worked correctly on a BeaglePlay and displayed a
> > > > > color
> > > > > gradient triangle. Not sure what went wrong here.
> > > > >
> > > > > Anyway, please have a look and test.
> > > > >
> > > > >
> > > > > Thanks
> > > > > ChenYu
> > > > >
> > > > > [1]
> > > > > https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.w=
alker@imgtec.com/
> > > > > [2]
> > > > > https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/=
powervr
> > > > > [3] https://github.com/SaschaWillems/Vulkan
> > > > > [4]
> > > > > https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e=
1f19e@imgtec.com/
> > > > >
> > > > > Chen-Yu Tsai (5):
> > > > >   dt-bindings: clock: mediatek: Add mt8173 mfgtop
> > > > >   clk: mediatek: Add mt8173-mfgtop driver
> > > > >   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> > > > >   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain
> > > > > clock
> > > > >   arm64: dts: mediatek: mt8173: Add GPU device nodes
> > > > >
> > > > >  .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
> > > > >  .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
> > > > >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
> > > > >  drivers/clk/mediatek/Kconfig                  |   9 +
> > > > >  drivers/clk/mediatek/Makefile                 |   1 +
> > > > >  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 243
> > > > > ++++++++++++++++++
> > > > >  include/dt-bindings/clock/mt8173-clk.h        |   7 +
> > > > >  7 files changed, 363 insertions(+), 1 deletion(-)
> > > > >  create mode 100644
> > > > > Documentation/devicetree/bindings/clock/mediatek,mt8173-
> > > > > mfgtop.yaml
> > > > >  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
