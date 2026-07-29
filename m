Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD4428373
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 00:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283735; cv=pass; b=mSoRU6afR2CSR8w2fcL4EIuquYCl61FXhTwAVDCKTW/s4ugf+2+iJuTAHYLyn7EW4Lx+cZ8w00Ne7+BsKDNFSWNcsAJ824NOxyiZwhwheuoq0PvlgLB//yWIievqL7+CdW5Bw3/yHyjlHmD3cylUx1466jrYVRazHDfj6jQuSII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283735; c=relaxed/simple;
	bh=cDxfYqcfSByeJjQqSK1OEhcdxCYtFWgTcU8x9Td5aQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/Xhr6KWsc7m2Kt9WMW0kSW8iz+6Zj+liLG1IXTHB1jf25trJiLyBgRAUPFZL7fVlGxOg44V+8XZ1jxp0PSbh4ADU9swEMVElgtsGdxFmDyBAPMt4rlL3aa4dG1ol6FaTCEULCYzX8qyY+6Nl4oojYTWFFS/1IW7eYstyeCG/Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlvKkHpU; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlvKkHpU"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso216587a34.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 17:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785283733; cv=none;
        d=google.com; s=arc-20260327;
        b=gFP9OzYTMUv9pMWKHQKaVfnxzMOt70LyHqFVSov3RYwUp8ea9hq0H9+JxAg7ZKga7q
         RUibtP1bSrYGzkbvusINbs35Rm3NE6vYC7qHgiPieTVFN+HDMAIkcvD/ml7mmI4/EBeT
         R3aMKJfHubUaatps5H2lKVYomIH9XseW9mCuGoHCg6lx7y6Vkx/wcd9c/p4g4/F7aG7B
         VTDrKdv8M9S3LDfe7cGcNLVBk/1SzLa+5YyA3jJBPo/+ok660/L1pFbEsQMKlWa6UfxK
         1mdtVpGWkeJ0nmaFnk2jQqJhRsLIdOB0chEaqiIFNcN/SOumrA4OsL4Tieseg5JRLg4V
         pVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        fh=CPlljUWElEUmORN3FR0to9LtHIjQrP0KffJ6Fj0vn3o=;
        b=pwBZJTrGuOhqdpdGVu7BfcHnNDiszATRHrNS6Q/9XytlUc+59FsKOihGx2p4B0H0JZ
         QY96cp7OB52dDnULz0GYySrFqd6deZhgoF8lRB0F8sIHa9pi6YeacQrndZfMt+Mx/nC4
         eTyoQKyhrde1Whm3XEjlwPhvHytxckufKv8qEK+quw0i9TflZREKTNp0Wxkgdbt3NmDl
         tjKSOFL4a7dvSSQg99m2SCHrElDYJpiFTjyj6Ll/vGRscEpdAWxkJec7DFbnaOeWZrFu
         oI9kdsW72T96QuDTYIDUz/zwPXOFEr5X4qW5fVdmgSuT2ZgAkSywEOg1swAig0Y4r74W
         TP4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785283733; x=1785888533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        b=PlvKkHpUFhBkE3JglxXMHHFFM6lJSixpSMG+mZUpfJicsDLxKtamyylms3+ivWZ2sg
         Hu3gNOjDzvWdSpDUJz96XVBpz3dbs8q/9x3wGeT/WVftfuEBEslPnYQ0YB88pTtsIg//
         i74ioDsCqkltbZK4R+qf78wBH49fHV/w0LWfI1K3zVZpEd2aqsRx94CAUhk31dO0u6S+
         RlsyNa8OHdePeUW13Url369+slsgPL35z2AhBbbmwHqBxnizLgr1sGFmwwUXImo3xBDk
         8OA2Ecqb4OtKUOm4ictkoWKxsRKuKp2ExFjS8yALtN5x4MfaEWYaGgdckTTQQ3NkolSJ
         o5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283733; x=1785888533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kyoFypV4ziVMyYM4rNHMecvIB5wpcxkRGbJyRri9dnY=;
        b=gN2iZMstU4pxRaXnIirZYwIe3ZZyAtB5HjKx6jk1WCeiuTw3iPUlI+9Qnn90eYUiOa
         D+OwDI36PIQ/oiXKV+Xg4yNrgB+4OY54do0aaukNrEjFkaFw/OxbZIvNrPjm43blNDmw
         xxZawylsLro7PHKc+HIXLIdRBhsKtSZN8MNiIR54huF4dp9AHDpUYLMMu/3YewB05kuZ
         YZp5gG8TALBTAu0llZpt/kZT6QInFcR/78FLDQdcwq/BSlFKFcU0iTrUJKjuaaQ6vjuH
         jt9NAK2LUA8LPky/GqGA/rUpxWsdPj1MkqpXfprdAoIH3SJnF7wqjPqdxOO4RH7gw/N0
         ZJZQ==
X-Forwarded-Encrypted: i=1; AHgh+RretMBXLRkbzkjbApU95+dJB+hVcJUZqul/qvpW3Zy1AH6F5I7TPlmxLKxfJUXh07/VJOd4VGEQfwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Od66q/HY1Bv63lTuSe5xHO2pdNVUEPdXgx+XtiJzILZaPjRp
	wwZCn5hkPcpKgKCeNQqZebrC6j6qKoEEe+JS+CUAn66Z5YbRviwOTofpLN5qSLkyMFK7GnwzpG7
	IrtvvuTjxgLsgFytoZOFlo+wXfZ6BaOA=
X-Gm-Gg: AR+sD11RBVagLeQsnxWu6nsZxDuF9r1N22Ldo9eJV6eDeq2qOCClmrhSHNVIvfceCug
	Y9FsMfVmQHjIoievGHrEztjlmffJg1dDy/sp2ra0QTnwKmh1hV4LqtDYu6qqinIojDCmby36+wp
	SNaR5/2XK8rqpsxbaihKru2X8d0bJ/v3IqYNHfLp/0Qup0vnqXxSjhuqBTkAGXnvPXkpGqVltHx
	PDlOsN+mZMZVQ+PALQBzrQLWHoQhHz9sGh7+3M7cVeNQRfPyJIq1fiyhyVK5G1XeO3ca/N5/uUX
	Kt1339cgrsRzAAr8ancJRpuOev1O3tTADG6zat+GdGWMGA8nl0hMH0QX46RRfnPjrTAMdFo/0DZ
	FnH4L7CE4C2uKlg==
X-Received: by 2002:a05:6808:220f:b0:496:2b3:ae71 with SMTP id
 5614622812f47-4ad5b9cb9dfmr3003896b6e.18.1785283732989; Tue, 28 Jul 2026
 17:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGb2v67VRhy_xzkdwUAYhzM_sWzoXyfZ3rYSHYLYaxuve9H17w@mail.gmail.com>
 <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com>
In-Reply-To: <a0ae9525-9288-4d13-a080-9cb3d965d536@collabora.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Wed, 29 Jul 2026 09:08:40 +0900
X-Gm-Features: AUfX_mxJyiSm31bWY5a0snpvZu7asEtmvztGs1v4_zBGPb9VpXQsQKFqM4tmGnM
Message-ID: <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Thank you for posting the v4 series.

I tested the complete v4 series on my MT8173 Chromebook, but I am
seeing a GPU device loss as soon as Mesa initializes the Vulkan device.

My current setup is:

  Board: Google Elm / Acer Chromebook R13 (CB5-312T)
  Kernel:
    linux-next next-20260727
    commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
    (next-20260727-5-g33d6e5134c70)

  Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+

  Mesa: 26.1.5
  vulkan-powervr: 26.1.5
  Firmware:
    rogue_4.40.2.51_v1.fw
    SHA256:
    f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2

All five patches applied cleanly. The PowerVR driver probes, loads the
firmware, and creates the DRM render node successfully.

However, when I run the following from an SSH session without GDM or
another graphical session running:

  PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary

Mesa prints the expected GX6250 warnings:

  Missing reset support for brn51764
  Missing reset support for brn58839
  Missing support for brn62269

The command then hangs, and the kernel reports:

  powervr 13000000.gpu: [drm] *ERROR* GPU device lost

There are no additional timeout, MMU fault, firmware, clock, or runtime
PM messages immediately before the device-lost message.

I originally also observed the same failure when GDM started GNOME
Shell, but reproducing it with vulkaninfo from a non-graphical SSH
session indicates that this is not specific to Mutter or GNOME.

Since your cover letter reports that vkmark and glmark2-es2-drm work
with Mesa 26.1.5, I suspect that there may be a difference in the
kernel configuration or another part of the test environment.

Could you please share the following details from your working setup?

  1. The exact Chromebook board/model used for testing
  2. The exact kernel base commit
  3. The kernel configuration, or at least the relevant DRM, PM,
     generic power-domain, IOMMU, and MediaTek clock options
  4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
  5. The firmware SHA256
  6. The kernel command line and bootloader used
  7. Whether `vulkaninfo --summary` also completes successfully

My current relevant configuration includes:

CONFIG_PM_SLEEP=3Dy
CONFIG_PM=3Dy
CONFIG_PM_GENERIC_DOMAINS=3Dy
CONFIG_MODULES=3Dy
CONFIG_DMA_SHARED_BUFFER=3Dy
CONFIG_DRM_POWERVR=3Dm
CONFIG_DRM_MEDIATEK=3Dy
CONFIG_SYNC_FILE=3Dy
CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
CONFIG_IOMMU_SUPPORT=3Dy
CONFIG_ARM_SMMU=3Dy
CONFIG_MTK_IOMMU=3Dy

I would be happy to test additional patches or provide any further
logs, kernel configuration, or debugging information if that would
help.

Thanks,
YoungJoon Lee

2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino Del Reg=
no
<angelogioacchino.delregno@collabora.com>:
>
> On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>>
> >>>> Hi Chen-Yu,
> >>>>
> >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>>>
> >>>>> This time around Mesa was ready for basic testing, using both vulka=
nmark
> >>>>> and glmark2-es2-drm (with Zink). Details below.
> >>>>>
> >>>>> Changes since v3 (all in the clk driver patch):
> >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>>>> - Added missing of_node_put() in remove function
> >>>>>
> >>>>> Changes since v2 (all in the clk driver patch):
> >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>>>     - Needed since the driver implements PM domains using the gener=
ic PM
> >>>>>       domain library, which also depends on PM
> >>>>>     - Fixes build breakage (kernel test robot)
> >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>>>> - Dropped unused mfg_desc (Brian)
> >>>>> - Added check of clk_prepare_enable()'s return value in
> >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Adapted to changed DT bindings
> >>>>> - Dropped driver change
> >>>>> - Use same power domain for "a" and "b" GPU power domains
> >>>>>
> >>>>>
> >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found =
in
> >>>>> some Chromebooks.
> >>>>
> >>>> I'm making a pull for Stephen for the clk changes. Should patches 1,=
2,4
> >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> >>>
> >>> Only patches 1 and 2 should go through the clock tree.
> >>>
> >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick=
 up
> >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >>>
> >>
> >> Not sure if I can really take the DRM bindings patch through soc.
> >>
> >> I will take the devicetree ones exactly right now, even though it's go=
ing to
> >> give warnings.
> >>
> >> I trust that you'll make the binding get into linux-next before it's t=
oo late.
> >
> > Rob beat me to it. :D
>
> Love it!
>
> Thanks Rob :-D
>
> Cheers,
> Angelo
