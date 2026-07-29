Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B66521ABAA
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 04:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785299924; cv=pass; b=czdMYULMzVwivL9a+7R7epOzxna/QcBa4ZVo+XNkp+0cRP0bByyIB3yzqIsBNMA/RReMUaJuv+oYLaWzHTT4nVtt/8GwCEqItRzI4dIUGLMmzbREzYMYST2HG+DupRaTrD3guR7bJ9nGVVKVl3Ny0ePhkA+Jv22u7JvaXl7Q66U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785299924; c=relaxed/simple;
	bh=IVrwQEWuxf39JXVc7yvXQkPU+bAdoFXunz81hBtKtRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZikakmLFCMWlMl2obZWMhQG0nvqC8v4MxgEQ9PA7tCqRmm/O/dbFSBMiMH9oLzD/s8BZuVlc7nf9VXnM9Mfa+jAHnTAD0JfJCvizTx5j175piJ7aEiDIyZ89iT7zqu0BlC3mBu0MNotGZ4QPuFwp4ge5whfeD3257BCbPxJ21Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTTiIYbN; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTTiIYbN"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb545db3afso414803a34.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 21:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785299921; cv=none;
        d=google.com; s=arc-20260327;
        b=AF+KopRDG9jrR7YYUY4Sa/e/eWFNQI230i0h0quTymeMyQMhNBwSGNv9sSw5sZAbQ/
         qMOyqvQoNr2sZEuzcIjNK8Q7OnI6stGx+H/dK+OIsIZHcxnxQSnZRqo2msLtENQmE01m
         bnXzbQ6c9gKVbYPZHLHqccJilgkPwIozDfDhutWh2FOIc528b3Mol5x9xpSKIHEdSX+P
         zRx/1yuuc60bsW/7/pe+yPbWzpCk/5xdBqwigUEh4ZIAIPOJGCkhivrG+1R1ymdHh4qM
         nIhQXEJcYaRrcrXp1LsIhu3Hk7VJ5e66dYS7bXbDP8bZvJA10V437uiaMMv0KPNAClM0
         38MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        fh=Hp9wEnq0m4N1S1PX13siU6I4avlt/nJAchBa3g8jhNg=;
        b=ThvDNuoYMf0e7QmYpIBzWnnJtnp9weHawb8EfCkY8Xn/YEORnQBqWSOkQcHjD35pVv
         sI92vkiZLVlsQX7p3MnbB3AIvRfhtTvbuDpxzKjOOyfimivpSDlozt9gvYxF8kabuXCG
         yllor8SFwLrB+gotZQIxVeFxcnUCl87YpTW4JS+irX9MimZr+nix6WvcitZKjUxFAhTJ
         VXTgXG0DFQhXzBlFxikCruQxfCJboxXWKM7bq5cpv2Q//QYuk4xyvQUlGYewdSP/w4dp
         bydBPU8h0iHwNQB17S0FulShlMoRzTmkqcYAJtNpxbNMJxjuyXfDXjjU1BbMLOfIPPKM
         IbtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785299921; x=1785904721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        b=WTTiIYbNjN4Y7G/fFx7kQ3LphnA2kPmDYGSBfCVZ+z5VmI7QZCSo5JZe9mKIcSS4o1
         rJBi7Bu3+Qpiboh4DCWHgwYdqk778LT4OTIRYboOXRfF1KKfs38Jg2WUu5ELwUJpn/98
         AZSXNddxeYzai2bu5VbSRPmxbPk/nEhq9RFrMPewGlfxgVE4Skkb0GRSJJqYBDfCeB7u
         1EnF74sQBBcF749BhWPJqPBjOv2mXlFlLNXTVC4obvbK8mDf0ObyguJpETamcwaqQBYE
         ZEstkVS8lRIz3UNqy+a4G1XO+V7oXn8hOcpaT3WLwZ1Yb///zOT5Tn0KYJFBKqFnT1kF
         1/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785299921; x=1785904721;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGzlWs6tdF1QMY0fgbav9prDOXBrAsYvphx8445KlbY=;
        b=WcPMqwo0Uq23M/xz1ughe0P8XDPP0+Fzp3ZCJkyvTpVCm/L5sPbsx4b+yK9Xz4fQ5Q
         gobNCcKefsXBFz+uLfA2uzXR1brv+JcleO3/ONVwX5OXOMqO6j4SGfG1MWKUs4YYGc9c
         cUgrjRu7l5aWl7u6Wo9dYt3Z5cHv9A4i7/AbLIKv2ri2KNXlMrdlAaEhZbfQ7Q96zowp
         NPoG11qXRmso44+9QzuZE8AZh0ZnR2bSrP83Ezz3vWfqF58cDvEiDxGD7XbGcdcldqyD
         pyVLWHaZ0SuJ0W3iOAIOnlKXYtQ3E46rpBHB40cUYCpRB+Ud0gMtRBYzoYMEqSXkFTPD
         kFlw==
X-Forwarded-Encrypted: i=1; AHgh+Rrn0i14gjiJh7c0aPk23eJT64G12t7BgHYcTkakVzwXMwgZEfUneYqi7sM0/OQOMWFcJu+GC6EnpJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx93o0Mwfd3vyKYHDABZaB8f0Jj4FOhy1qmlC48Ds6z8LF3oUCI
	i1Iu6j8SvMJvaCFHj85aPMg2QN6r8MY+mDLE6fnF3+ycs1rv3zHktxgA2KMUTEnHgSwZgIDCqgE
	4XS0asGYy0zvjEKDuHvxKzxIbqsgiL+Q=
X-Gm-Gg: AR+sD126XADqMhtBeE8nEw9loJOIOmh9T+hpym8qD8NKQ4qEyQytGrbYnFkkXW+cxqu
	zOdkQNjuIzkICUSZ6y9+IWu/sY4mPmKFhcP0JTyu8BWgaUKSI7rIGKsz0RRtj5Lrsb9ph1NF13b
	nwnvjhcW2suPUVMNwfKJh7Hdvbo/F1CyZgF87tqxQj0Ga3PpPFGRaPOEwGjzXh4A8BzXhg8D2kT
	LfZKKq/lrSXnm6c232fBa+4Wtt7x1HTxgqSe1FbnP60T6NHQd1WLb4dDju02ZPggdU/ki5gl7NE
	yyuDJC3KjfoIsQlw3wbyEVZ3KzHWxUDwID+8OSD64y0fSLPJlpZD4t4hdXcMzY9+QPFNctq/DGL
	t2Q==
X-Received: by 2002:a05:6808:1527:b0:4a3:2bd1:5216 with SMTP id
 5614622812f47-4ad5ba77288mr2918774b6e.43.1785299921220; Tue, 28 Jul 2026
 21:38:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com> <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
 <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
In-Reply-To: <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Wed, 29 Jul 2026 13:38:27 +0900
X-Gm-Features: AUfX_mxR_oGunwLpbAK7Vqbf4uXNzZjhDaRd7Jvp95pR-HEJXbf9urH4ed-uYIk
Message-ID: <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wens@kernel.org, 
	Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Thank you. Updating the firmware fixed the issue.

I replaced my previous firmware blob with the official v1.1 firmware:

  FW version v1.1 (build 6976702 OS)

  SHA256:
  e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44

After rebooting, the driver loaded the new firmware successfully:

  powervr 13000000.gpu: [drm] loaded firmware
  powervr/rogue_4.40.2.51_v1.fw
  powervr 13000000.gpu: [drm] FW version v1.1
  (build 6976702 OS)

I then ran:

  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary

This now completes successfully and detects the PowerVR Rogue GX6250.
The previous "GPU device lost" error no longer occurs.

So the issue was caused by the older, non-official firmware blob I was
using, rather than the v4 kernel series or my kernel configuration.

Thank you for pointing this out, and sorry for the noise.

Tested-by: YoungJoon Lee <getfeus@gmail.com>

Best regards,
YoungJoon

2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 12:32 Chen-Yu Tsai <wenst@chr=
omium.org>:
>
> On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmail.com>=
 wrote:
> >
> > Hi Chen-Yu,
> >
> > Thank you for posting the v4 series.
> >
> > I tested the complete v4 series on my MT8173 Chromebook, but I am
> > seeing a GPU device loss as soon as Mesa initializes the Vulkan device.
> >
> > My current setup is:
> >
> >   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
> >   Kernel:
> >     linux-next next-20260727
> >     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
> >     (next-20260727-5-g33d6e5134c70)
> >
> >   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> >
> >   Mesa: 26.1.5
> >   vulkan-powervr: 26.1.5
> >   Firmware:
> >     rogue_4.40.2.51_v1.fw
> >     SHA256:
> >     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2
>
> My firmware blob is different from yours:
>
> powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v1.fw
> powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)
>
> SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e207323e4a
>
> Funny thing is neither of ours match the official firmware blobs released
> by Imagination [1].
>
> The latest version is "FW version v1.1 (build 6976702 OS)" with
> SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44
>
> This version also works for me.
>
> The "initial version" is "FW version v1.0 (build 6734358 OS)" with
> SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050d22f2
>
> And this version also works.
>
> It seems your firmware build is even older than mine. I suggest you
> update it and try again?
>
> [1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powe=
rvr/powervr/rogue_4.40.2.51_v1.fw
>
>
> > All five patches applied cleanly. The PowerVR driver probes, loads the
> > firmware, and creates the DRM render node successfully.
> >
> > However, when I run the following from an SSH session without GDM or
> > another graphical session running:
> >
> >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> >
> > Mesa prints the expected GX6250 warnings:
> >
> >   Missing reset support for brn51764
> >   Missing reset support for brn58839
> >   Missing support for brn62269
> >
> > The command then hangs, and the kernel reports:
> >
> >   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> >
> > There are no additional timeout, MMU fault, firmware, clock, or runtime
> > PM messages immediately before the device-lost message.
> >
> > I originally also observed the same failure when GDM started GNOME
> > Shell, but reproducing it with vulkaninfo from a non-graphical SSH
> > session indicates that this is not specific to Mutter or GNOME.
> >
> > Since your cover letter reports that vkmark and glmark2-es2-drm work
> > with Mesa 26.1.5, I suspect that there may be a difference in the
> > kernel configuration or another part of the test environment.
> >
> > Could you please share the following details from your working setup?
> >
> >   1. The exact Chromebook board/model used for testing
>
> The codename is "telesu", which is basically a hana in a different case.
>
> >   2. The exact kernel base commit
>
> I have a whole bunch of patches on top of next-20260727, but none
> that should affect this.
>
> >   3. The kernel configuration, or at least the relevant DRM, PM,
> >      generic power-domain, IOMMU, and MediaTek clock options
>
> All relevant options are built-in.
>
> >   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
>
> Module.
>
> >   5. The firmware SHA256
>
> See above.
>
> >   6. The kernel command line and bootloader used
>
> Chromebook's builtin bootloader.
>
> cmdline:
>
>     cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D31A
>     console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.debug=3D=
0x106
>     panic=3D30 rootwait log_buf_len=3D1M no_console_suspend
>
> AFAICT nothing special.
>
> >   7. Whether `vulkaninfo --summary` also completes successfully
> >
> > My current relevant configuration includes:
> >
> > CONFIG_PM_SLEEP=3Dy
> > CONFIG_PM=3Dy
> > CONFIG_PM_GENERIC_DOMAINS=3Dy
> > CONFIG_MODULES=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > CONFIG_DRM_POWERVR=3Dm
> > CONFIG_DRM_MEDIATEK=3Dy
> > CONFIG_SYNC_FILE=3Dy
> > CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> > CONFIG_IOMMU_SUPPORT=3Dy
> > CONFIG_ARM_SMMU=3Dy
> > CONFIG_MTK_IOMMU=3Dy
> >
> > I would be happy to test additional patches or provide any further
> > logs, kernel configuration, or debugging information if that would
> > help.
>
> As mentioned above, please try updating your firmware blob. Your
> version is even older than mine, and neither of ours is the "official"
> release.
>
>
> Thanks
> ChenYu
>
>
> > Thanks,
> > YoungJoon Lee
> >
> > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino Del=
 Regno
> > <angelogioacchino.delregno@collabora.com>:
> > >
> > > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > >>
> > > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@red=
hat.com> wrote:
> > > >>>>
> > > >>>> Hi Chen-Yu,
> > > >>>>
> > > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > >>>>> Hi everyone,
> > > >>>>>
> > > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > > >>>>>
> > > >>>>> This time around Mesa was ready for basic testing, using both v=
ulkanmark
> > > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > > >>>>>
> > > >>>>> Changes since v3 (all in the clk driver patch):
> > > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > >>>>> - Added missing of_node_put() in remove function
> > > >>>>>
> > > >>>>> Changes since v2 (all in the clk driver patch):
> > > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > >>>>>     - Needed since the driver implements PM domains using the g=
eneric PM
> > > >>>>>       domain library, which also depends on PM
> > > >>>>>     - Fixes build breakage (kernel test robot)
> > > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > > >>>>> - Dropped unused mfg_desc (Brian)
> > > >>>>> - Added check of clk_prepare_enable()'s return value in
> > > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> > > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > > >>>>>
> > > >>>>> Changes since v1:
> > > >>>>> - Adapted to changed DT bindings
> > > >>>>> - Dropped driver change
> > > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > > >>>>>
> > > >>>>>
> > > >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, fo=
und in
> > > >>>>> some Chromebooks.
> > > >>>>
> > > >>>> I'm making a pull for Stephen for the clk changes. Should patche=
s 1,2,4
> > > >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> > > >>>
> > > >>> Only patches 1 and 2 should go through the clock tree.
> > > >>>
> > > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to =
pick up
> > > >>> DT binding patches. Otherwise I can push patch 3 through drm-misc=
.
> > > >>>
> > > >>
> > > >> Not sure if I can really take the DRM bindings patch through soc.
> > > >>
> > > >> I will take the devicetree ones exactly right now, even though it'=
s going to
> > > >> give warnings.
> > > >>
> > > >> I trust that you'll make the binding get into linux-next before it=
's too late.
> > > >
> > > > Rob beat me to it. :D
> > >
> > > Love it!
> > >
> > > Thanks Rob :-D
> > >
> > > Cheers,
> > > Angelo
