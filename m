Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486D83EDAA3
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167354; cv=pass; b=pMMPCUqf0VEwM1hMFYyOaD8qq8Sm8BArUOtOnxZXNy14hFqyVTKf/6KoVp4/3wQ2HBcN769GTf2B7BGm/CMIK+I8dB1gWVJvhxhQi/Ih9tC/WMp3jKIbYc5XbSXPe31Wof9Hv3A9qU5oguiBSQgFptmS11j0fn7Jqnrxbn4u6N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167354; c=relaxed/simple;
	bh=eaQgCfeUyFwuBEvcqHManR5V3IEuwTON8wPH84Mq3zU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqCEyy810euDto5oQRfJe5JwW6/HACkoEZfH5PiIaAK2aQjG/q4QWrDNVAYI8TMWskErAE7ZpXLQ3uMqNNQuecQ6jxz2wyyUXOtQbOoQiLdnWuRqlmpPdEukMY9+8OKYYfDsHNA/lzbsDI8ZQRsuhEwonGRCJ4rkHYmIRNf9kz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlxAk4hk; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlxAk4hk"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4896ae35be9so1193399b6e.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 08:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785167351; cv=none;
        d=google.com; s=arc-20260327;
        b=LODtHu9sArhUMYrI315JyfAliAFTid9XfmNqXduGJcBOd6Qmzi+XzCo6Je4I7IEkwO
         3T2b13bJXZ2ZbJr1Z0DrTJrhyUea//dpbabUDDpxNqg8bWVHMzT9Tr4J785Y8qgcA6I7
         W6oW5yU8DwEbdLnovbHpzhvn8R13xi8//UD9Jmo0fkqTH/92qRKviAghvmQRhynBrw2b
         38e7RhTVHptG0myUhE1/UpUYCTmL9R+f2Al36kQzo1KcQxLSCWZN3kg5g348nJ1YFtaL
         h4PMLOPcExCk2KgUs/Nh2sQfbPxJC2WzNjWIo/23lcn7EizOdFFHxrrF31O0UiSvOyql
         mGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1j2/Vmhav9hp+xwE98aMBcISKaxMX/xLgtMgIxAU990=;
        fh=mhExfUiqnXvsCTRAdhpurDt489gdW+dtDT5YhDF3wXY=;
        b=I72jmO4DyoFPfoYkkHgh6KvlRCriptaKYu5W8aofnsqLD9f/04thCriW0TWLdr121s
         /blX5wj3nENof0lHTsU22WIPi0FGlLLLRTHzfIEXWJlI6oIXnA0aP72vtfUxc6i8n59K
         7JA0EUErwDG9GVGcFNLAJwwKj2lGVd1zWAjkqvl0YNKJ7FRx9TTPqMiZzFxdNqe8LyVJ
         qYAOIPeKJE4hEAYzlAoBKY3t6EjeMJ7jZqsM4IwRZN0DKeuYcHhZ0s26xxR0nhMlVcti
         wKLmGfXyAfIs7yFHoSfI5chi7VthXFnaSiuBUxjWdSNk0qJV0jRZ2Lpd4TCMg7vkgb3j
         uB6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785167351; x=1785772151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1j2/Vmhav9hp+xwE98aMBcISKaxMX/xLgtMgIxAU990=;
        b=JlxAk4hkwSaUmh+dfX33bO5TB4BN+kNXwc933Xbtm9fkCfVyKy359W2gOyscxwd4Nk
         HZBNd2tKydFsJUd7xVwU6MQnBM/W2NvzMHbgE+J/aUTGmHTH71hN2ThvHh6P5mfiJ1cN
         eXGRMcqjtOEv9OFsvmwa3cvq7ZrrGLhhagFZw3sSunkFwpVQb5aKrhgqiFSVUGLP/kGj
         lX+RUzefYLOkqaqVwPiRPHi5tguht58XHFh8F55y0r+1UVp9Ys2sCQENDCYkaSYAYoUb
         d3RZYVnv98fLW3GUEuKNCDgnHLp3n3BHcgalfxhE1jj6CEv7LJYBOsiSRc2S/jB6BzjZ
         0kwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167351; x=1785772151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1j2/Vmhav9hp+xwE98aMBcISKaxMX/xLgtMgIxAU990=;
        b=mhO82y05PQTpq68DOUI04QZOk23yKXnXZ6hgUGXl3tYniMXDuoffHcZVfJzpacfpu0
         MUcBH8TfwywR3w9P1seb8bfZjG6Twi3pCMvwVaTahFfp9mbKH9M/VZP/ftvpxZnFavCr
         t0U4XkGm8zWbtA7RF+iQ3n/e8m8EiHH5XpoyHUJGlXSGY3XgHEoRarXA8Q6BXzfO+KxB
         6S5HvUwYgDuvfEYlbs4eHtXJBuEJaKZXLdqiXebXt4usqvN5S3Wk/d/FKueweO5fkhYi
         /2cOtlnCm2S6GTFprFRSYNg6I5l1TGrMWe2Jiy9dn9oDYqCZYBqjCfikt4T5PkvDQLp1
         zktA==
X-Forwarded-Encrypted: i=1; AHgh+RrehUNxxbj3FYBdMmrW1XQwu/L7b4uCKvvYzAU/CvYxSs9Y/seH5dSktwDnX9oyDoNKqpV4xPyQ/rg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx91WAQtDpV6ItIvUH0K0xQPmMebiR5CHtM0RweKTePXPiOZ2v
	PU8RX1y1cSDnhX71da/+IRYvGxqtuwp9Ikgn1xRGyEPlKO9uBWnXG4WuiRd2rOReZHVTRYPl6Yz
	5zkcdVGcXVKNIYWs71cDqZPZWRYETXYI=
X-Gm-Gg: AR+sD10x8V77m838M6Repui/YVzmbaXnpswQ47OkpVm+5fE9YYHEjovCfO2FzV0p+sr
	J9wB3xHF+2kiOxSvV5399j6ShWiZkU4jtm+a9dRG/P7SST0zaGmm/JoQWOoAZwCP8pLdTvJklWj
	w1U8VGgFF0MAutgcdNPVO+7jA0V+9ZjFfsVsv8sOc5Ss5JXEeF05xsFU1M/pdNvPfiSgE+SSN/G
	CdYxeXYTtbOCeKuzNKV5e0FMvkB1rVbwcVrqaybwsWj75X/yY9dLvNMWYRS2yT74egxY6akBS6c
	dFzVae8MMWZt3d11v+Y=
X-Received: by 2002:a05:6808:bd6:b0:489:5d05:552c with SMTP id
 5614622812f47-4ab6a057c69mr7313742b6e.18.1785167350906; Mon, 27 Jul 2026
 08:49:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727091555.1023910-1-wenst@chromium.org>
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Tue, 28 Jul 2026 00:48:57 +0900
X-Gm-Features: AUfX_mzZIAlliZ6SyEB3Z-mqC0yAJJDeNAn1Qi3wrTwtKld-OCTs0GYYwDDse00
Message-ID: <CA+m4KrCkk_p213=JVVcuxjvO2tCREw7_mL596xu-RWJ0Dz3p5w@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] powervr: MT8173 GPU support
To: Chen-Yu Tsai <wenst@chromium.org>
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

Hello,

I tested patches 1/5 through 5/5 from the MT8173 PowerVR v3 series on
an Acer Chromebook R13 (Google Elm), which uses an MT8173 SoC and a
PowerVR Rogue GX6250 GPU with BVNC 4.40.2.51.

For clarity, I applied the five actual patches numbered 1/5 through
5/5. The 0/5 cover letter itself was not applied.

Kernel:
  Linux 7.1.3-stb-cbm-pvr-v3

Relevant kernel configuration:
  CONFIG_DRM_POWERVR=3Dm
  CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy

Kernel command line:
  powervr.exp_hw_support=3D1

Firmware:
  powervr/rogue_4.40.2.51_v1.fw

The driver probes successfully, loads the firmware, and initializes the
DRM device:

  [    6.110569] powervr 13000000.gpu:
                 [drm] Running on unknown hardware; expect issues.
  [    6.117454] powervr 13000000.gpu:
                 [drm] loaded firmware
                 powervr/rogue_4.40.2.51_v1.fw
  [    6.118010] powervr 13000000.gpu:
                 [drm] FW version v1.0 (build 6476056 OS)
  [    6.122992] [drm] Initialized powervr 1.0.0
                 for 13000000.gpu on minor 1

The following DRM device nodes are created:

  /dev/dri/card0
  /dev/dri/card1
  /dev/dri/renderD128

However, on a clean boot, without manually running vulkaninfo, vkcube,
or another Vulkan application, the driver reports that the GPU has been
lost approximately six seconds after DRM initialization:

  [   12.084078] powervr 13000000.gpu:
                [drm] *ERROR* GPU device lost

The relevant boot sequence is therefore:

  [    6.110569] PowerVR probe begins
  [    6.117454] Firmware is loaded
  [    6.118010] Firmware version is reported
  [    6.122992] DRM initialization completes
  [   12.084078] GPU device lost

The unused-regulator shutdown occurs considerably later:

  [   31.712124] vgpu: disabling

Therefore, the later "vgpu: disabling" message does not appear to be
the immediate cause of the device loss. The GPU is reported lost about
20 seconds before that regulator shutdown message.

After the failure, regulator_summary reports:

  vgpu  0  0  0  normal  1000mV  0mA  700mV  1350mV

This output was collected after the GPU had already been reported lost,
so I do not know whether the regulator state was different during probe
or immediately before the failure.

The PowerVR-related clocks appear enabled in clk_summary:

  mfg_26m       26000000 Hz

  mem_mfg_in_sel
    rate:       455000000 Hz
    enable:     1
    prepare:    1

  mfg_mem
    rate:       455000000 Hz
    enable:     1
    prepare:    1
    consumer:   13000000.gpu
    clock name: mem

  mfg_sel
    rate:       455000000 Hz
    enable:     1
    prepare:    1

  mfg_g3d
    rate:       455000000 Hz
    enable:     1
    prepare:    1
    consumer:   13000000.gpu
    clock name: core

  axi_mfg_in_sel
    rate:       208000000 Hz
    enable:     2
    prepare:    2
    consumer:   power-domain@7

  mfg_axi
    rate:       208000000 Hz
    enable:     1
    prepare:    1
    consumer:   13000000.gpu
    clock name: sys

I also installed Mesa 26.1.5 and vulkan-powervr 26.1.5 and tested the
Vulkan ICD with:

  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 \
  VK_DRIVER_FILES=3D/usr/share/vulkan/icd.d/powervr_mesa_icd.json \
  vulkaninfo --summary

The PowerVR ICD was found and loaded. Before hanging, Mesa printed:

  WARNING: powervr is not a conformant Vulkan implementation,
           testing use only.

  FINISHME: Missing reset support for brn51764
  FINISHME: Missing reset support for brn58839
  FINISHME: Missing support for brn62269
  FINISHME: Devices without tpu_border_colour_enhanced require entries
            for compressed formats to be stored in the table
            pre-compressed.

The vulkaninfo process then remained in uninterruptible sleep:

  PID   STAT  WCHAN             COMMAND
  3244  Dl+   synchronize_srcu  vulkaninfo --summary

It could not be terminated normally while in that state, and a reboot
was required.

However, the clean-boot log shows that "GPU device lost" occurs even
without starting vulkaninfo manually. The vulkaninfo hang may therefore
be a consequence of the GPU already being in the lost state, rather than
the original cause of the failure.

At this point, the following parts appear to work:

  - MT8173 GPU device-tree node probing
  - MFGTOP clock registration
  - PowerVR kernel module probing
  - Firmware loading
  - Firmware version reporting
  - DRM device initialization
  - Creation of card1 and renderD128

The remaining problem is that the GPU becomes lost approximately six
seconds after initialization.

Could this be related to an interrupt not being delivered, firmware
heartbeat handling, reset sequencing, runtime PM, a missing regulator
consumer relationship, or another MT8173-specific power-domain
requirement?

Please let me know which additional kernel debug options, DRM debug
settings, tracepoints, interrupt statistics, register dumps, or test
patches would be useful. I have physical access to the device and can
build and test further kernel changes.

Thank you for working on MT8173 support.

Best regards,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8827=E6=97=A5(=E6=9C=88) 18:16 Chen-Yu Tsai <wenst@chr=
omium.org>:
>
> Hi everyone,
>
> This is v3 of my MT8173 PowerVR GPU support series.
>
> I got another inquiry on the status of this patch series, so I thought
> I'd dig it out, fix all the issues and send another version.
>
> This time around Mesa was ready for basic testing, using both vulkanmark
> and glmark2-es2-drm (with Zink). Details below.
>
> Changes since v2 (all in the clk driver patch):
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>   - Needed since the driver implements PM domains using the generic PM
>     domain library, which also depends on PM
>   - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>   clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>   (Dan Carpenter / kernel test robot w/ smatch)
>
> Changes since v1:
> - Adapted to changed DT bindings
> - Dropped driver change
> - Use same power domain for "a" and "b" GPU power domains
>
>
> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> some Chromebooks.
>
> This version is different from the initial powervr driver submission [1]
> in that it splits out the GPU glue layer support out of the powervr
> driver and into a separate clock and power domain driver. The glue code
> is otherwise the same, and also the same as found in the ChromeOS
> kernels, with some extra comments and macro names added where possible.
>
> Patch 1 adds a binding for the glue layer, called mfgtop. The glue layer
> contains clock and power controls for the GPU.
>
> Patch 2 adds a driver for the glue layer, implemented as a clock driver
> that also provides power domains.
>
> Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
> binding.
>
> Patch 4 corrects the clock for the GPU (called MFG) power domain.
>
> Patch 5 adds device nodes for the GPU and glue layer to the MT8173 dtsi
> file.
>
> The kernel driver successfully probes the hardware and loads the
> "rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [2]=
.
> The "exp_hw_support" module parameter needs to be set for the driver to
> probe successfully.
>
> This was tested with Mesa 26.1.5 from Debian Forky. With this version
> vkmark and glmark2-es2 (over Zink) both run fine. Mesa spits out a bunch
> of warnings since the GX6250 core is not officially supported.
>
>     # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vkmark
>     WARNING: powervr is not a conformant Vulkan implementation, testing u=
se only.
>     WARNING: powervr is not a conformant Vulkan implementation, testing u=
se only.
>     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:73: F=
INISHME: Missing reset support for brn51764
>     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:76: F=
INISHME: Missing reset support for brn58839
>     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:523: =
FINISHME: Missing support for brn62269
>     MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: FINIS=
HME: Devices without tpu_border_colour_enhanced require entries for compres=
sed formats to be stored in the table pre-compressed.
>     WARNING: powervr is not a conformant Vulkan implementation, testing u=
se only.
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>         vkmark 2025.01
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>         Vendor ID:      0x1010
>         Device ID:      0x6250
>         Device Name:    PowerVR Rogue GX6250
>         Driver Version: 109056005
>         Device UUID:    d04cd6f3a25fd4900f89c151bccfdfcf
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>     [vertex] device-local=3Dtrue: FPS: 251 FrameTime: 3.984 ms
>     [vertex] device-local=3Dfalse: FPS: 220 FrameTime: 4.545 ms
>     [texture] anisotropy=3D0:^C FPS: 223 FrameTime: 4.484 ms
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>                                        vkmark Score: 231
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
>     # PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
>     WARNING: powervr is not a conformant Vulkan implementation, testing u=
se only.
>     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:73: F=
INISHME: Missing reset support for brn51764
>     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:76: F=
INISHME: Missing reset support for brn58839
>     MESA: warning: ../src/imagination/vulkan/pvr_arch_job_context.c:523: =
FINISHME: Missing support for brn62269
>     MESA: warning: ../src/imagination/vulkan/pvr_arch_border.c:244: FINIS=
HME: Devices without tpu_border_colour_enhanced require entries for compres=
sed formats to be stored in the table pre-compressed.
>     Warning: DRM_CAP_ASYNC_PAGE_FLIP not supported, falling back to 'mail=
box' mode for SwapInterval(0).
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>         glmark2 2023.01
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>         OpenGL Information
>         GL_VENDOR:      Mesa
>         GL_RENDERER:    zink Vulkan 1.2(PowerVR Rogue GX6250 (IMAGINATION=
_OPEN_SOURCE_MESA))
>         GL_VERSION:     OpenGL ES 2.0 Mesa 26.1.5-1
>         Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D24 stenc=
il=3D0 samples=3D0
>         Surface Size:   1366x768 fullscreen
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>     [build] use-vbo=3Dfalse: FPS: 49 FrameTime: 20.473 ms
>     [build] use-vbo=3Dtrue: FPS: 45 FrameTime: 22.660 ms
>     [texture] texture-filter=3Dnearest: FPS: 45 FrameTime: 22.642 ms
>     [texture] texture-filter=3Dlinear:^C FPS: 50 FrameTime: 20.172 ms
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>                                       glmark2 Score: 46
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>
>
> Please have a look.
>
> Thanks
> ChenYu
>
> [1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walke=
r@imgtec.com/
> [2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powe=
rvr
>
> Chen-Yu Tsai (5):
>   dt-bindings: clock: mediatek: Add mt8173 mfgtop
>   clk: mediatek: Add mt8173-mfgtop driver
>   dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
>   arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
>   arm64: dts: mediatek: mt8173: Add GPU device nodes
>
>  .../clock/mediatek,mt8173-mfgtop.yaml         |  70 +++++
>  .../bindings/gpu/img,powervr-rogue.yaml       |   1 +
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  33 ++-
>  drivers/clk/mediatek/Kconfig                  |  10 +
>  drivers/clk/mediatek/Makefile                 |   1 +
>  drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 241 ++++++++++++++++++
>  include/dt-bindings/clock/mt8173-clk.h        |   7 +
>  7 files changed, 362 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt81=
73-mfgtop.yaml
>  create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
>
> --
> 2.55.0.229.g6434b31f56-goog
>
