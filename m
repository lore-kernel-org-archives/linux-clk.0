Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E48322A1D4
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 03:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785295950; cv=pass; b=qieMaJhUFsk8+wfhUeIjvIcwhIHHHYtTZbSTWVACOy495DtcKiFDZAk4+cA/YMmnKgjL5iDjeeGbvmrZZ5CAtZ6FyvCbQ3+QRPqa5K8w+3o5q3xEDUeDaJSxrTPd6EnKdUrgfDOlUA6aHeOb8Gi8PazS0Tj48Wbt42XwpNRzFEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785295950; c=relaxed/simple;
	bh=vMWlWT63cDAO9GrSrZIaV2yrLqnml8MYjuWZPicHcgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hph4CaAd6FeC0FX596gwvy4vZHDFQoISjVifczUEYgVC1cTOB6ZaK4avCEpXfC5oJ53Q4eZBmxJs0TCubFh2Dm9htDubtiyRm5PbFLIhPvD6YHBmACH99ymQZSB4OaLEB+0sDq9XZw1+zyfQ0o79QGLbkO8aR7DEejiezQ8CBJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fm3fMPoJ; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fm3fMPoJ"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6626b5ace23so2572066d50.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 20:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785295947; cv=none;
        d=google.com; s=arc-20260327;
        b=SzGCEZH3nbmZH+bWPuxIxqAtAdQmOcu3dSxyRcd+k5A257/aRGFtjDQtRwXybvbL7s
         OV8Z+aKLJnNJzbDOUROxNJwHg8te7HkHtL/6Iky3UI5LbFtg0AKpLZk0yA8B8Kdit90h
         re6uhT6fKI444gdwQmqoxktIqTvm2onPGYFgbwBYdtDs/kCbNlvevmcF9pkGkw4xx/JF
         zIJwg5qSvRSf2NuEEDSB/Zs+953wbs0mea4+iNMYxOR3PaTKA3FwT2rVV9qnyVUzQg6V
         9OOTK2RNSps19JL/Q95WGBx7EcVBXBcAuGDg2onVRahRJNcRO1UvKI5QRiwsTvH8gG6M
         PO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YphEsPuwfO2GAZ8oScDaP5O5VSQEM8qtQtqlvFzmOwc=;
        fh=i7+F8V9+1rEL2ewA9PtQv/fB/o0NNvPWVeiW3dnBQeA=;
        b=aAc/gUt76gw8JBKqQN6T/ConX4NYORgSoLLgtMhp9bme0Hc1t6NalE624lTT78rFxp
         6/awO71clRdhheuk+otCqdmmEEQVD3M3nNQl3PSxgXCNvgS4Tj6sXTA2RFElC0n2ikzt
         /YzWqJSHGlAdGHXGZUCDsofIuJs+b/gwZ+0lgIxiVZ35W0iiaPWk+qFobL3aEiz+LYZ9
         dgQgCpmlKf6w2sqxZMb1drY0uft831UDBKcdIBKM3ER0y8/jsnMOmDXd83Af/ZdxTVrn
         j+H9jpSugdufx0DHFQ86VaINw8A1J6Kak+CxVFBvK2mrJLjIO9C56wIYku4tkUlwFgHe
         5UPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785295947; x=1785900747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YphEsPuwfO2GAZ8oScDaP5O5VSQEM8qtQtqlvFzmOwc=;
        b=Fm3fMPoJirvYwFJVqHrGjpQe9xPpDtrUmSYNdQKoTs5eGQfqUovN6tmZtmqrP3g50R
         MqzCD8mUG1rAJDSdJsi6sIiAoovyfCm9DZtuua6tZ8KuKVpTkNZ++MQRUMRAbUyGyAJ9
         JznsHoWpEVzTvbn2+YEK7t04+pgOSMk8go8AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785295947; x=1785900747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YphEsPuwfO2GAZ8oScDaP5O5VSQEM8qtQtqlvFzmOwc=;
        b=bVT7W5SbCxcJvHP87OtU4IJ8ismBOerc7eNATNxKLcMmJJAZw65TS1wK5BZRrshFsZ
         hrjadlXJk+STm4NzrPp7hXjYM0DXgSTr86EZ9JzXUSx3rwwDCMhYlGH0Zhrx+r50XCSJ
         1RDo/BQrSopRINOp06hlT+guOHQdsQRMjNEI/2Z5+miYPEvAr73Y/Zk66BFvTJwHIDWT
         /PNibPcMeR4rzta/4MAMbAq2LV4dcrvvKq1owNAxhgRZh5mj/EY47P1lsNCY5Qr0hpde
         B28ji6AADEQRNrITJdGJhubLxBmiLOCTtErk0+3+l2HKJFERkpFpp1AOEAXWU4xv9FA1
         LqUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQEcm5HrfTK9Vn2aqxYQ9am4oo5wzFd518D3Z2Is52Um9zsQLMnUHt0cETuQctFSvsM14PShXWqb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3zxiAhmSVl5sQUV6mwjCQHVb6VTwLThvWTWouDkwJb0EvX3w8
	0N1lKVmPARTt7ttrZIkl/IblN8QC+ZB+M+kB+Y+3DPsx6fM69AgMMwcPz9YGd/opq6837/F9Wuw
	DFSktGi40KMSCVYoBRr3OQYDEqTwNd78v8UWh9sU1
X-Gm-Gg: AR+sD11gvUidZ5DX/VP3uVP6P8jqqfQjptUTPi2ywLWSzj3iIXTxfJ617xmO7eCeLhP
	wxGZ0kHOQ7l/ELBCNZjL8CuDKhSRsMn+1dkb0F1X69tFKZkZU5EY+dgO/j5GvqxuY1l5shh5ZBY
	l7H/BP6dtUmNu/mCx2+AYgfm/976+0p6qqVzAqcQbg5dXlQ4dGbvdTDDRt2qPSKWi52yGHEQthF
	ucCZVzu9oyQ4c3td4g9+yTRXyFYuOjqIhYk93liF6ckLilB5AeGTF4PTR/556TDzS7qdEVv8vsJ
	hPq44TXPD0xzGaN8emTSd3jJI4KNAnjjwRlVoLT2tbrKJc2GjGqlRSAFAjAbrw3eEF986lJf5a8
	=
X-Received: by 2002:a05:690c:250a:b0:81d:455b:5fdc with SMTP id
 00721157ae682-81fa7a235edmr3133467b3.28.1785295947414; Tue, 28 Jul 2026
 20:32:27 -0700 (PDT)
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
In-Reply-To: <CA+m4KrAvATV9qMMN9h+tKcPdrHRp7-jFJ0-Jq3DeCZLi3Z6RsA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Jul 2026 11:32:16 +0800
X-Gm-Features: AUfX_my7lXKe9Z2oOqmBCydrADFp6DxbpdPpz-KqJ25BL6ZYGxlwr20b-0pppV8
Message-ID: <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: YoungJoon Lee <getfeus@gmail.com>
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

On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmail.com> w=
rote:
>
> Hi Chen-Yu,
>
> Thank you for posting the v4 series.
>
> I tested the complete v4 series on my MT8173 Chromebook, but I am
> seeing a GPU device loss as soon as Mesa initializes the Vulkan device.
>
> My current setup is:
>
>   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
>   Kernel:
>     linux-next next-20260727
>     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
>     (next-20260727-5-g33d6e5134c70)
>
>   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
>
>   Mesa: 26.1.5
>   vulkan-powervr: 26.1.5
>   Firmware:
>     rogue_4.40.2.51_v1.fw
>     SHA256:
>     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2

My firmware blob is different from yours:

powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v1.fw
powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)

SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e207323e4a

Funny thing is neither of ours match the official firmware blobs released
by Imagination [1].

The latest version is "FW version v1.1 (build 6976702 OS)" with
SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44

This version also works for me.

The "initial version" is "FW version v1.0 (build 6734358 OS)" with
SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050d22f2

And this version also works.

It seems your firmware build is even older than mine. I suggest you
update it and try again?

[1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powerv=
r/powervr/rogue_4.40.2.51_v1.fw


> All five patches applied cleanly. The PowerVR driver probes, loads the
> firmware, and creates the DRM render node successfully.
>
> However, when I run the following from an SSH session without GDM or
> another graphical session running:
>
>   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
>
> Mesa prints the expected GX6250 warnings:
>
>   Missing reset support for brn51764
>   Missing reset support for brn58839
>   Missing support for brn62269
>
> The command then hangs, and the kernel reports:
>
>   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
>
> There are no additional timeout, MMU fault, firmware, clock, or runtime
> PM messages immediately before the device-lost message.
>
> I originally also observed the same failure when GDM started GNOME
> Shell, but reproducing it with vulkaninfo from a non-graphical SSH
> session indicates that this is not specific to Mutter or GNOME.
>
> Since your cover letter reports that vkmark and glmark2-es2-drm work
> with Mesa 26.1.5, I suspect that there may be a difference in the
> kernel configuration or another part of the test environment.
>
> Could you please share the following details from your working setup?
>
>   1. The exact Chromebook board/model used for testing

The codename is "telesu", which is basically a hana in a different case.

>   2. The exact kernel base commit

I have a whole bunch of patches on top of next-20260727, but none
that should affect this.

>   3. The kernel configuration, or at least the relevant DRM, PM,
>      generic power-domain, IOMMU, and MediaTek clock options

All relevant options are built-in.

>   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module

Module.

>   5. The firmware SHA256

See above.

>   6. The kernel command line and bootloader used

Chromebook's builtin bootloader.

cmdline:

    cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D31A
    console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.debug=3D0x=
106
    panic=3D30 rootwait log_buf_len=3D1M no_console_suspend

AFAICT nothing special.

>   7. Whether `vulkaninfo --summary` also completes successfully
>
> My current relevant configuration includes:
>
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM=3Dy
> CONFIG_PM_GENERIC_DOMAINS=3Dy
> CONFIG_MODULES=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DRM_POWERVR=3Dm
> CONFIG_DRM_MEDIATEK=3Dy
> CONFIG_SYNC_FILE=3Dy
> CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> CONFIG_ARM_SMMU=3Dy
> CONFIG_MTK_IOMMU=3Dy
>
> I would be happy to test additional patches or provide any further
> logs, kernel configuration, or debugging information if that would
> help.

As mentioned above, please try updating your firmware blob. Your
version is even older than mine, and neither of ours is the "official"
release.


Thanks
ChenYu


> Thanks,
> YoungJoon Lee
>
> 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino Del R=
egno
> <angelogioacchino.delregno@collabora.com>:
> >
> > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > >>
> > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redha=
t.com> wrote:
> > >>>>
> > >>>> Hi Chen-Yu,
> > >>>>
> > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > >>>>> Hi everyone,
> > >>>>>
> > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > >>>>>
> > >>>>> This time around Mesa was ready for basic testing, using both vul=
kanmark
> > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > >>>>>
> > >>>>> Changes since v3 (all in the clk driver patch):
> > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > >>>>> - Added missing of_node_put() in remove function
> > >>>>>
> > >>>>> Changes since v2 (all in the clk driver patch):
> > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > >>>>>     - Needed since the driver implements PM domains using the gen=
eric PM
> > >>>>>       domain library, which also depends on PM
> > >>>>>     - Fixes build breakage (kernel test robot)
> > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > >>>>> - Dropped unused mfg_desc (Brian)
> > >>>>> - Added check of clk_prepare_enable()'s return value in
> > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > >>>>>
> > >>>>> Changes since v1:
> > >>>>> - Adapted to changed DT bindings
> > >>>>> - Dropped driver change
> > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > >>>>>
> > >>>>>
> > >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, foun=
d in
> > >>>>> some Chromebooks.
> > >>>>
> > >>>> I'm making a pull for Stephen for the clk changes. Should patches =
1,2,4
> > >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> > >>>
> > >>> Only patches 1 and 2 should go through the clock tree.
> > >>>
> > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pi=
ck up
> > >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> > >>>
> > >>
> > >> Not sure if I can really take the DRM bindings patch through soc.
> > >>
> > >> I will take the devicetree ones exactly right now, even though it's =
going to
> > >> give warnings.
> > >>
> > >> I trust that you'll make the binding get into linux-next before it's=
 too late.
> > >
> > > Rob beat me to it. :D
> >
> > Love it!
> >
> > Thanks Rob :-D
> >
> > Cheers,
> > Angelo
