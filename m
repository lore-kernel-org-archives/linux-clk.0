Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4473A380F
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 06:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785220656; cv=pass; b=HrmDAVtBPZQf56Ki2vw76jwnnCk5dN0J61nyrw+cWnSsf7lnNQEr8eOeQ32YySONZNNSo8yECY2KCLpZSd4NzzQd/10yuA74fVesn1YOu0ose5d4Wx1gbZoKwbbZBi7jXmQtUlUVN//DhqV/tfl4rIGZmYRBYYWGR+RLRUM4IDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785220656; c=relaxed/simple;
	bh=i1jPI83dMFm2Hu0tQ9qGkhLKh1Yj9gi+bLwVuwqqMhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oudl7tsagZ/va/Og+rrmbC71aWJbFYM5rFX3NzvpwAWB7N1Pq0zflOoKpcWhtRrAjF6jhwqpaZfvkVlyOR83puisIomPNyE31VRbCXFiCY19wp4R0e58MYw41PZ3biYxZN1BqbD1/IuVfeBTo4TCar5OJTFElN74kbIlYLfOn0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IlLgHX3t; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IlLgHX3t"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81ed000b507so27828717b3.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 23:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785220654; cv=none;
        d=google.com; s=arc-20260327;
        b=JED1l7EaXkMh1xc4p1rZzM6rOixf5PNqBzO2JEGpq6gat2knyqFvViTcLRGeBkC27h
         ERc0ymESjWGWZ9R4rCcswWDaZC1jwZBXGe+jMYZelv6yN10Vz2fHZO7dT4G3PC7zQCFN
         i+n3X4iQJPsI2vzI29cqnL8iOsdAUhuV266NQVJbzMRmEyb7iYdxJA1x8GG1QjNzauHN
         tGN0YADyjR+gKAFrCcrufNvZhpqaX4PIl27UVytoJTg0nuPbNduHjZyjzjpoFlz0g5B3
         w/KtuPy1uqMfhOAMXfos6vEyyNvIWp6rdfujjfEcfqEL9nO33uh6lI6iq/QIBmKrLHfP
         xXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iwoDhJK5JZbrMblzbHvyi1tLJRZPTflh+Yp8TazZZnk=;
        fh=9FTFdi8kb/jUqoEvLQwf1psyxjeASlBzVv3OtL/Tpxs=;
        b=jxiIXQl5Zw/CCWIp/AkVFpVGa4g7BMVGSnGSzk82ayeYmsJRxQ9rXVuvH0JnyI4dNr
         BG1r8bM8IyLOPsIVnK5GuI3YImUGQsUsva/IxJH6xGSWmI+Nnca2ae5Qg3COzTmNKpEz
         2pCL7JcdJv4FpQfRxxOme3uBPDOz7QojkK/CQI01pPAqftlFFpJiUlgYBOfoQ50dP4cP
         0+DetP33nD0K1deMYdzdKMEWB9YbIpmLotMkJAfCIxW6VQZ/CThKqbamKVXb9FPcvmrn
         aRZTjUgOqEzwBGnT5LjKNA9dR2h5pyjjoAuI3YOdPieyPgxmhvM8akE7u9Ryh9A67rCI
         /5tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785220654; x=1785825454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iwoDhJK5JZbrMblzbHvyi1tLJRZPTflh+Yp8TazZZnk=;
        b=IlLgHX3t5e/tsj5yBCHnEinBr2Vp0GlCEY0Pr4SzgpgYg6Ypq7dav7Ku0+59zx3+S9
         AwvI75S4o3PwH5+m8CO9vVlTaV1PsqtYa8/4GXIn9VVrfjzVOVj0Hu1Cns6kBeOsu2a7
         SzUruUkOvtmISC3JrBPfa58nVfqEcoKLFofcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785220654; x=1785825454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwoDhJK5JZbrMblzbHvyi1tLJRZPTflh+Yp8TazZZnk=;
        b=UCARsMhe1caaY4xQ5pqa7eWj6gQ/ldMaVO5kNx63JClja38MXDxTbn0p6n1eTxXMHT
         gYMqs0CBMJKAaUiOxfZvIfwwAcv3IQIJ11a4ZkeVfUcISii1fk5XhzBXcjE4S8BtCykl
         3h2mnbyLbFBs/cn9fPdV56JJXUMH55elt3nK1Tcr1HZoYziami9/riY7pXj2dS2qs1YO
         lJRntZPcF7WmySPgFc7otE/mTWqAYUN3hYBsu6Bfh+T2rV4pwCbPHsFqwXL95L5TRWL1
         DwjFRtDQBx4gv5r6FqDC3r0MLOmGea+Fq0K8SyglbGM/CQBEShtnC65+gciehPKQ0tqx
         MmXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXjrFI6cbcP7xiDTXP2y6ryM0ZvjoLe8X5uPTCew342s0zQ0h92dNeX1n5uk36Z6YZDqznUZJI6Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHMpYkIE2UZNUT+5zNNnKtwL+Tnn3/+sN9ejy+lLs+76WHcVGl
	CUdJC9vagHoP+B7MUCaTDl9v2Q2aGezc+tXSxo3tvZZR+wQQUpq6+zT5jy7Ttm0MgJrJduVyblz
	+2rET3RsRhfnq5RoIhgprahKot6hMxVfyTS8sZ3RR
X-Gm-Gg: AR+sD12ayNz0RTsO6UQDzGsbcugJAxZGpVrsS7w9EkRLkMk2ecOPpfgiBfIaNOlyUyr
	LEQ3JehSP1t7Kgc0HWLCX1r4O6GNN1GwQ6ip6mkwnTMmondQLaaZNDb6eM6Nts7J1lN8sDtDran
	maDrJAR8+NzV9P+dDJnSanyrg+AFWlkUpMb5JhZc5+ZwxzJyvbQYcB78L0CZT8pWwmQ7RCEqcrx
	XZaBpvRcz/SXbLacrnIVnp9eSwvY7/W7SHlVe82P8kBY78c8+OFy5JV90UQ+BkdAQ6sICgaFb4n
	AoCWgZEn+NSoaR06
X-Received: by 2002:a05:690c:6513:b0:81e:6fd:93b4 with SMTP id
 00721157ae682-81f990e37e0mr5299807b3.19.1785220653618; Mon, 27 Jul 2026
 23:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727091555.1023910-1-wenst@chromium.org> <CA+m4KrCkk_p213=JVVcuxjvO2tCREw7_mL596xu-RWJ0Dz3p5w@mail.gmail.com>
In-Reply-To: <CA+m4KrCkk_p213=JVVcuxjvO2tCREw7_mL596xu-RWJ0Dz3p5w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 Jul 2026 14:37:22 +0800
X-Gm-Features: AUfX_myB_DUT8i6FRV-3BSUxtj0ldOLM5BCdGMqxKm6_-hJ1ByrCEGHtFfO4OGY
Message-ID: <CAGXv+5HXf9U6CdMudVkrWL_62jktW6jYQvtrjAFGc=+UnoKQXA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] powervr: MT8173 GPU support
To: YoungJoon Lee <getfeus@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:49=E2=80=AFPM YoungJoon Lee <getfeus@gmail.com> =
wrote:
>
> Hello,
>
> I tested patches 1/5 through 5/5 from the MT8173 PowerVR v3 series on
> an Acer Chromebook R13 (Google Elm), which uses an MT8173 SoC and a
> PowerVR Rogue GX6250 GPU with BVNC 4.40.2.51.
>
> For clarity, I applied the five actual patches numbered 1/5 through
> 5/5. The 0/5 cover letter itself was not applied.
>
> Kernel:
>   Linux 7.1.3-stb-cbm-pvr-v3

Please at least try linux-next. There's around 30 patches for powervr
between v7.1 and next-20260727, 15 if you count from v7.1 to v7.2-rc1.

> Relevant kernel configuration:
>   CONFIG_DRM_POWERVR=3Dm
>   CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
>
> Kernel command line:
>   powervr.exp_hw_support=3D1
>
> Firmware:
>   powervr/rogue_4.40.2.51_v1.fw
>
> The driver probes successfully, loads the firmware, and initializes the
> DRM device:
>
>   [    6.110569] powervr 13000000.gpu:
>                  [drm] Running on unknown hardware; expect issues.
>   [    6.117454] powervr 13000000.gpu:
>                  [drm] loaded firmware
>                  powervr/rogue_4.40.2.51_v1.fw
>   [    6.118010] powervr 13000000.gpu:
>                  [drm] FW version v1.0 (build 6476056 OS)
>   [    6.122992] [drm] Initialized powervr 1.0.0
>                  for 13000000.gpu on minor 1
>
> The following DRM device nodes are created:
>
>   /dev/dri/card0
>   /dev/dri/card1
>   /dev/dri/renderD128
>
> However, on a clean boot, without manually running vulkaninfo, vkcube,
> or another Vulkan application, the driver reports that the GPU has been
> lost approximately six seconds after DRM initialization:
>
>   [   12.084078] powervr 13000000.gpu:
>                 [drm] *ERROR* GPU device lost
>
> The relevant boot sequence is therefore:
>
>   [    6.110569] PowerVR probe begins
>   [    6.117454] Firmware is loaded
>   [    6.118010] Firmware version is reported
>   [    6.122992] DRM initialization completes
>   [   12.084078] GPU device lost
>
> The unused-regulator shutdown occurs considerably later:
>
>   [   31.712124] vgpu: disabling
>
> Therefore, the later "vgpu: disabling" message does not appear to be
> the immediate cause of the device loss. The GPU is reported lost about
> 20 seconds before that regulator shutdown message.
>
> After the failure, regulator_summary reports:
>
>   vgpu  0  0  0  normal  1000mV  0mA  700mV  1350mV

This is unrelated. This regulator output is _really_ unused. "vgpu" is
just the default name on the PMIC.


> This output was collected after the GPU had already been reported lost,
> so I do not know whether the regulator state was different during probe
> or immediately before the failure.
>
> The PowerVR-related clocks appear enabled in clk_summary:
>
>   mfg_26m       26000000 Hz
>
>   mem_mfg_in_sel
>     rate:       455000000 Hz
>     enable:     1
>     prepare:    1
>
>   mfg_mem
>     rate:       455000000 Hz
>     enable:     1
>     prepare:    1
>     consumer:   13000000.gpu
>     clock name: mem
>
>   mfg_sel
>     rate:       455000000 Hz
>     enable:     1
>     prepare:    1
>
>   mfg_g3d
>     rate:       455000000 Hz
>     enable:     1
>     prepare:    1
>     consumer:   13000000.gpu
>     clock name: core
>
>   axi_mfg_in_sel
>     rate:       208000000 Hz
>     enable:     2
>     prepare:    2
>     consumer:   power-domain@7
>
>   mfg_axi
>     rate:       208000000 Hz
>     enable:     1
>     prepare:    1
>     consumer:   13000000.gpu
>     clock name: sys
>
> I also installed Mesa 26.1.5 and vulkan-powervr 26.1.5 and tested the
> Vulkan ICD with:
>
>   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
>   VK_DRIVER_FILES=3D/usr/share/vulkan/icd.d/powervr_mesa_icd.json \
>   vulkaninfo --summary
>
> The PowerVR ICD was found and loaded. Before hanging, Mesa printed:
>
>   WARNING: powervr is not a conformant Vulkan implementation,
>            testing use only.
>
>   FINISHME: Missing reset support for brn51764
>   FINISHME: Missing reset support for brn58839
>   FINISHME: Missing support for brn62269
>   FINISHME: Devices without tpu_border_colour_enhanced require entries
>             for compressed formats to be stored in the table
>             pre-compressed.
>
> The vulkaninfo process then remained in uninterruptible sleep:
>
>   PID   STAT  WCHAN             COMMAND
>   3244  Dl+   synchronize_srcu  vulkaninfo --summary
>
> It could not be terminated normally while in that state, and a reboot
> was required.
>
> However, the clean-boot log shows that "GPU device lost" occurs even
> without starting vulkaninfo manually. The vulkaninfo hang may therefore
> be a consequence of the GPU already being in the lost state, rather than
> the original cause of the failure.
>
> At this point, the following parts appear to work:
>
>   - MT8173 GPU device-tree node probing
>   - MFGTOP clock registration
>   - PowerVR kernel module probing
>   - Firmware loading
>   - Firmware version reporting
>   - DRM device initialization
>   - Creation of card1 and renderD128
>
> The remaining problem is that the GPU becomes lost approximately six
> seconds after initialization.

Sorry. I'm not seeing this on my device. I'm running the patches on
top of next-20260727 this round.


ChenYu

> Could this be related to an interrupt not being delivered, firmware
> heartbeat handling, reset sequencing, runtime PM, a missing regulator
> consumer relationship, or another MT8173-specific power-domain
> requirement?
>
> Please let me know which additional kernel debug options, DRM debug
> settings, tracepoints, interrupt statistics, register dumps, or test
> patches would be useful. I have physical access to the device and can
> build and test further kernel changes.
>
> Thank you for working on MT8173 support.
>
> Best regards,
> YoungJoon Lee
>
> 2026=E5=B9=B47=E6=9C=8827=E6=97=A5(=E6=9C=88) 18:16 Chen-Yu Tsai <wenst@c=
hromium.org>:
> >
> > Hi everyone,
> >
> > This is v3 of my MT8173 PowerVR GPU support series.
> >
> > I got another inquiry on the status of this patch series, so I thought
> > I'd dig it out, fix all the issues and send another version.
> >
> > This time around Mesa was ready for basic testing, using both vulkanmar=
k
> > and glmark2-es2-drm (with Zink). Details below.
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
> >
> > This version is different from the initial powervr driver submission [1=
]
> > in that it splits out the GPU glue layer support out of the powervr
> > driver and into a separate clock and power domain driver. The glue code
> > is otherwise the same, and also the same as found in the ChromeOS
> > kernels, with some extra comments and macro names added where possible.
> >
> > Patch 1 adds a binding for the glue layer, called mfgtop. The glue laye=
r
> > contains clock and power controls for the GPU.
> >
> > Patch 2 adds a driver for the glue layer, implemented as a clock driver
> > that also provides power domains.
> >
> > Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
> > binding.
> >
> > Patch 4 corrects the clock for the GPU (called MFG) power domain.
> >
> > Patch 5 adds device nodes for the GPU and glue layer to the MT8173 dtsi
> > file.
> >
> > The kernel driver successfully probes the hardware and loads the
> > "rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [=
2].
> > The "exp_hw_support" module parameter needs to be set for the driver to
> > probe successfully.
> >
> > This was tested with Mesa 26.1.5 from Debian Forky. With this version
> > vkmark and glmark2-es2 (over Zink) both run fine. Mesa spits out a bunc=
h
> > of warnings since the GX6250 core is not officially supported.
> >
> >     # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vkmark
> >     WARNING: powervr is not a conformant Vulkan implementation, testing=
 use only.
> >     WARNING: powervr is not a conformant Vulkan implementation, testing=
 use only.
> >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:73:=
 FINISHME: Missing reset support for brn51764
> >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:76:=
 FINISHME: Missing reset support for brn58839
> >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:523=
: FINISHME: Missing support for brn62269
> >     MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: FIN=
ISHME: Devices without tpu_border_colour_enhanced require entries for compr=
essed formats to be stored in the table pre-compressed.
> >     WARNING: powervr is not a conformant Vulkan implementation, testing=
 use only.
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >         vkmark 2025.01
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >         Vendor ID:      0x1010
> >         Device ID:      0x6250
> >         Device Name:    PowerVR Rogue GX6250
> >         Driver Version: 109056005
> >         Device UUID:    d04cd6f3a25fd4900f89c151bccfdfcf
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >     [vertex] device-local=3Dtrue: FPS: 251 FrameTime: 3.984 ms
> >     [vertex] device-local=3Dfalse: FPS: 220 FrameTime: 4.545 ms
> >     [texture] anisotropy=3D0:^C FPS: 223 FrameTime: 4.484 ms
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >                                        vkmark Score: 231
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >     # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
> >     WARNING: powervr is not a conformant Vulkan implementation, testing=
 use only.
> >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:73:=
 FINISHME: Missing reset support for brn51764
> >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:76:=
 FINISHME: Missing reset support for brn58839
> >     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:523=
: FINISHME: Missing support for brn62269
> >     MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: FIN=
ISHME: Devices without tpu_border_colour_enhanced require entries for compr=
essed formats to be stored in the table pre-compressed.
> >     Warning: DRM_CAP_ASYNC_PAGE_FLIP not supported, falling back to 'ma=
ilbox' mode for SwapInterval(0).
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >         glmark2 2023.01
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >         OpenGL Information
> >         GL_VENDOR:      Mesa
> >         GL_RENDERER:    zink Vulkan 1.2(PowerVR Rogue GX6250 (IMAGINATI=
ON_OPEN_SOURCE_MESA))
> >         GL_VERSION:     OpenGL ES 2.0 Mesa 26.1.5-1
> >         Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D24 ste=
ncil=3D0 samples=3D0
> >         Surface Size:   1366x768 fullscreen
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >     [build] use-vbo=3Dfalse: FPS: 49 FrameTime: 20.473 ms
> >     [build] use-vbo=3Dtrue: FPS: 45 FrameTime: 22.660 ms
> >     [texture] texture-filter=3Dnearest: FPS: 45 FrameTime: 22.642 ms
> >     [texture] texture-filter=3Dlinear:^C FPS: 50 FrameTime: 20.172 ms
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >                                       glmark2 Score: 46
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >
> > Please have a look.
> >
> > Thanks
> > ChenYu
> >
> > [1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.wal=
ker@imgtec.com/
> > [2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/po=
wervr
> >
> > Chen-Yu Tsai (5):
> >   dt-bindings: clock: mediatek: Add mt8173 mfgtop
> >   clk: mediatek: Add mt8173-mfgtop driver
> >   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
> >   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
> >   arm64: dts: mediatek: mt8173: Add GPU device nodes
> >
> >  .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
> >  .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
> >  drivers/clk/mediatek/Kconfig                  |  10 +
> >  drivers/clk/mediatek/Makefile                 |   1 +
> >  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 241 ++++++++++++++++++
> >  include/dt-bindings/clock/mt8173-clk.h        |   7 +
> >  7 files changed, 362 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt=
8173-mfgtop.yaml
> >  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
> >
> > --
> > 2.55.0.229.g6434b31f56-goog
> >
