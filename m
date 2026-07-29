Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD44276026
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785317708; cv=pass; b=Sinimjbj3MQrKFESyZDo/6o8WhZxQFbh3osxywztatLWyWWCEWbFdc9FB2t25KNa/snQFx3GuJCqwO3QUZSiyLpj4MvwBvtZU6Uf2T19UfpFwRFMw+QGEts1XzWZ/R+fXSx7UE4QurJqRS/71WMv01tftAWNKqOhbRppDoGFwwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785317708; c=relaxed/simple;
	bh=L1Cwge6zqVDGiZ+r2BgIBck2+bEHp2fjsCI7Eb4yKRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eh1FAlvuiSxupmi1SKxSyUCDMpy1skLBrHgFldold6p+QouhhM8tB9DprswCEItkf3iX5wiP54gGtN3f4aiJszMRWU7uXp60glWbuw+m87wonCHksARyExSIT79mrmraErQHwX0RKoZJ4oLVCqNTIkERst2QjmhQJuFKrFixhLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqPtFe9/; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqPtFe9/"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-44cd237446cso432129fac.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 02:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785317700; cv=none;
        d=google.com; s=arc-20260327;
        b=meynP5UE5lN3WT84+kLgT2d3RoF1iIiRGF1F8yih2YbKYQCeQIcIVZyPCpUJyqwpwv
         l7yoE2wxnXymQKINrgYRJS8sntbzmeC34eFu3t6kTxcQrdWIrlHlWPzYp+bfEgiS9JtU
         IG6mIYCR+32QuPxUvnpfBvWjE+tVqboqPKH48IgtHJzuiwGLEey3t/ic4pdTs4RwqTXs
         xUd0pBZYC33E9dK0EL/GR+NHBcbmsL8nobN8+C3A0sB/G3ICKKV6ZmXus7yxERRlvCwL
         W5Zpqpod2FLd4wUmrCfhY39Q7cAGgr6mlv3a0W7ecOFwG9z5sV5gJi8k5YLncli6LOsC
         nhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nHkBtF+R2SjHdapq97pn9cgpiPwnGdu2tbx0ToIewSU=;
        fh=o/5L249Vwgx+Ms3bD6zClk5mRKwaqau+c82EKd8Jhgs=;
        b=VmN7EcnmbCBMIq28E4iyEYAtsq/Quxun26F19AlS6BIni0naPXAIBS0CCcGo5CyKaA
         HV8uoyK05ceC/dVo5j1ib3G2RCoiN9TwCSRNEM45VoxVbqsyOKxO8PdmajBEZNkvWebQ
         7fxpeyw38NGRxBznqu0wKNVWnR3HvYsJeuKUSWd83YR94KuW69YFUXI3Y8Z+4bu057Kh
         SdwhgnawQ/s8OHsDXQPswa+uZ/h+fcQnXdcs8n7A4WULZVdnyZn9jDBQF7Papnz+MC8O
         oSKBBRluREyIV5iJixrWV8mK8N72+s9wkxLtsrZH8KA6vi/NiGRg213ktmyKjL/wUsYQ
         /DaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785317700; x=1785922500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHkBtF+R2SjHdapq97pn9cgpiPwnGdu2tbx0ToIewSU=;
        b=gqPtFe9/e87CagC5/EbU+8flQMsJnq8eOwUK2CZNmv6XShvIcdCTTJ/tVXgRThjGdU
         UIJvcCul7IdBBP1d1TR563twBmf7z0NtiTGqcybZA6feCcKQbI0Z8Kj8l3M61UKyDEjl
         5Z37UXdbOoR4w39jBkVvjuYeZdxx329DfvwPHJuQ7/znZS2kK0RRQaL8miFqEKazE1KQ
         cAl2Dk8Bdx8lI88znZX9ZX6iOIzzJqTajhAn+v9GipQ4y42H+ttYSDjcEGkvz9UHBmDa
         eKw9EWd0lv0qH+4ew8remCzXfQD+lUwrtPwCNSD10/L1E7MzkLYokQ3EVTo6v4cIE1my
         mANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785317700; x=1785922500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHkBtF+R2SjHdapq97pn9cgpiPwnGdu2tbx0ToIewSU=;
        b=foZkr/D3R73R86EwD8O9GraR+EWdJCGvnyxqm36NqK3TizrSs4nENlPBTMgns5arVz
         RB6yInkIYrWwpeP9IqzIXHTvgzPjT8fGzYebS7mOK+19z9ySlxupUkL7oetDabeny2Xe
         AQY5JGH3hdNq7Z+vvc6pLdC123Flp/fqyDF0rRGAByXK1BppOMcCQWQkJEYJg+frCGX4
         A4NNIIMloJadvxwyVAUsaqrG9nXCxcuo8z4KkG6wSUNZSNg+nYgB0bJUv/uBLWWrI5zH
         pusZCVl/osKVtDDK3lW2fun4GFkiyhvdGuT6q+d4PSHjU2l/Vrrf8/mJvGUIY719d/Yp
         hgFw==
X-Forwarded-Encrypted: i=1; AHgh+RoOrlK3NBhKD5fsupClhd4/xRuqtOBp1UN7OjEhXvynSp/njx02Aj/SlKAPJnAeJnNB9VGk43Lknao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmTGhE6rPOieYECFc9rnLOr9KmsMZRoTTdwk24B3MMYpZLOXd
	azNOxZ4yQNueGYUDZOMg+i/bWCsFLn//aDsMqbZU0QTZNXP0jWkp61AdRUcOHg6hvweQ/OSWGps
	J3MHOwn1INp5f1VMrG+LPBjLkjsHuO/s=
X-Gm-Gg: AR+sD11Y90jY/m/YZgjE5Z2N28b+kW3+AOpF4rzXJxruQP+IHXSVIntErSFM2fwEZmq
	bdPU/LbzitxwC5JU5dYZgh1wf5UpAARrgr28/gxg+sG+RSIXsxtBA0Hof7mVWkB2q/m7a9ODq0e
	+k8zN+3UQgfAYo2c8bGFu8Z2exVY6+AG226OpHzEL101vWrHOPIaPCojUs8RodDih+xmuYrU11z
	Fq65PvLekW2i0iinjtAHBOo/tWeNTg487KVVhzT4yj++diI41+B21HtRo4/PO9fAlzy1QCjuJ98
	pZNPVBSmoQAkSDIQtrhlLJMB/qXx38P82BlFJh+zCF5+MovIxGH12QZ+3h1sh+p8ovjHrh/oETv
	YPog32Eh3AStR
X-Received: by 2002:a05:6808:c2a7:b0:4a4:adaf:5579 with SMTP id
 5614622812f47-4ad5bb24a2emr3262966b6e.23.1785317700208; Wed, 29 Jul 2026
 02:35:00 -0700 (PDT)
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
 <CAGXv+5G8zPGb3SUwnzuutCF_U=+NKB4VQBsu+the6nLUqM-RDg@mail.gmail.com> <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com>
In-Reply-To: <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com>
From: YoungJoon Lee <getfeus@gmail.com>
Date: Wed, 29 Jul 2026 18:34:46 +0900
X-Gm-Features: AUfX_mwpvttWPSpQHnZKsUEo8Ujpvv33oWaosxrWC_IQP1bq3F_8ZvCYw0QiSGg
Message-ID: <CA+m4KrCZdQb7=+7wJDH0H8KZgDzWkB1CtB2jEbEnRUxu9OJybA@mail.gmail.com>
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

A follow-up to my previous email.

The official v1.1 firmware did fix the original "GPU device lost"
problem.

The following now works correctly:

    PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary

The driver initializes successfully and detects the PowerVR Rogue
GX6250.

However, while testing actual rendering, I found another issue which
appears to be unrelated to the firmware.

Kernel:

    Linux 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+

Board:

    Google Elm (Acer Chromebook R13 / MT8173)

Mesa:

    mesa 26.1.5
    vulkan-powervr 26.1.5

Firmware:

    rogue_4.40.2.51_v1.fw
    FW version v1.1 (build 6976702 OS)

Kernel command line:

    powervr.exp_hw_support=3D1

Test command:

    PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm

Renderer:

    GL_RENDERER:
    zink Vulkan 1.2
    (PowerVR Rogue GX6250)

The benchmark progresses normally:

    build (VBO off)          212 FPS
    build (VBO on)           216 FPS
    texture nearest          174 FPS
    texture linear           173 FPS
    texture mipmap           174 FPS
    shading gouraud          165 FPS
    shading blinn-phong      135 FPS
    shading phong             99 FPS

It consistently hangs at:

    shading=3Dcel

Immediately afterwards the kernel reports:

    refcount_t: underflow; use-after-free

The first warning is:

    pvr_free_list_put()
      -> pvr_hwrt_dataset_release()
      -> pvr_hwrt_dataset_put()
      -> pvr_ioctl_destroy_hwrt_dataset()

followed by:

    refcount_warn_saturate()

Shortly afterwards another kernel Oops occurs:

    Unable to handle kernel NULL pointer dereference

The second backtrace shows:

    pvr_gem_object_create()
      -> pvr_fw_object_create()
      -> pvr_hwrt_dataset_create()
      -> pvr_ioctl_create_hwrt_dataset()

The glmark2 process remains as:

    glmark2-es2-drm <defunct>

The system is otherwise still reachable through SSH.

I collected additional diagnostics, including:

    - complete dmesg
    - complete kernel journal
    - kernel configuration
    - PowerVR module information
    - userspace package versions
    - process/thread state
    - runtime PM state
    - running Device Tree

I can send any of these if they would help.

Also, please disregard my previous Tested-by tag for now, since this
rendering issue was discovered afterwards.

Thank you again for your help.

Best regards,

YoungJoon Lee

2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 13:38 YoungJoon Lee <getfeus@=
gmail.com>:
>
> Hi Chen-Yu,
>
> Thank you. Updating the firmware fixed the issue.
>
> I replaced my previous firmware blob with the official v1.1 firmware:
>
>   FW version v1.1 (build 6976702 OS)
>
>   SHA256:
>   e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44
>
> After rebooting, the driver loaded the new firmware successfully:
>
>   powervr 13000000.gpu: [drm] loaded firmware
>   powervr/rogue_4.40.2.51_v1.fw
>   powervr 13000000.gpu: [drm] FW version v1.1
>   (build 6976702 OS)
>
> I then ran:
>
>   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
>
> This now completes successfully and detects the PowerVR Rogue GX6250.
> The previous "GPU device lost" error no longer occurs.
>
> So the issue was caused by the older, non-official firmware blob I was
> using, rather than the v4 kernel series or my kernel configuration.
>
> Thank you for pointing this out, and sorry for the noise.
>
> Tested-by: YoungJoon Lee <getfeus@gmail.com>
>
> Best regards,
> YoungJoon
>
> 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 12:32 Chen-Yu Tsai <wenst@c=
hromium.org>:
> >
> > On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmail.co=
m> wrote:
> > >
> > > Hi Chen-Yu,
> > >
> > > Thank you for posting the v4 series.
> > >
> > > I tested the complete v4 series on my MT8173 Chromebook, but I am
> > > seeing a GPU device loss as soon as Mesa initializes the Vulkan devic=
e.
> > >
> > > My current setup is:
> > >
> > >   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
> > >   Kernel:
> > >     linux-next next-20260727
> > >     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
> > >     (next-20260727-5-g33d6e5134c70)
> > >
> > >   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> > >
> > >   Mesa: 26.1.5
> > >   vulkan-powervr: 26.1.5
> > >   Firmware:
> > >     rogue_4.40.2.51_v1.fw
> > >     SHA256:
> > >     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f2
> >
> > My firmware blob is different from yours:
> >
> > powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v1.=
fw
> > powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)
> >
> > SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e207323e4=
a
> >
> > Funny thing is neither of ours match the official firmware blobs releas=
ed
> > by Imagination [1].
> >
> > The latest version is "FW version v1.1 (build 6976702 OS)" with
> > SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c4=
4
> >
> > This version also works for me.
> >
> > The "initial version" is "FW version v1.0 (build 6734358 OS)" with
> > SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050d22f=
2
> >
> > And this version also works.
> >
> > It seems your firmware build is even older than mine. I suggest you
> > update it and try again?
> >
> > [1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/po=
wervr/powervr/rogue_4.40.2.51_v1.fw
> >
> >
> > > All five patches applied cleanly. The PowerVR driver probes, loads th=
e
> > > firmware, and creates the DRM render node successfully.
> > >
> > > However, when I run the following from an SSH session without GDM or
> > > another graphical session running:
> > >
> > >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> > >
> > > Mesa prints the expected GX6250 warnings:
> > >
> > >   Missing reset support for brn51764
> > >   Missing reset support for brn58839
> > >   Missing support for brn62269
> > >
> > > The command then hangs, and the kernel reports:
> > >
> > >   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> > >
> > > There are no additional timeout, MMU fault, firmware, clock, or runti=
me
> > > PM messages immediately before the device-lost message.
> > >
> > > I originally also observed the same failure when GDM started GNOME
> > > Shell, but reproducing it with vulkaninfo from a non-graphical SSH
> > > session indicates that this is not specific to Mutter or GNOME.
> > >
> > > Since your cover letter reports that vkmark and glmark2-es2-drm work
> > > with Mesa 26.1.5, I suspect that there may be a difference in the
> > > kernel configuration or another part of the test environment.
> > >
> > > Could you please share the following details from your working setup?
> > >
> > >   1. The exact Chromebook board/model used for testing
> >
> > The codename is "telesu", which is basically a hana in a different case=
.
> >
> > >   2. The exact kernel base commit
> >
> > I have a whole bunch of patches on top of next-20260727, but none
> > that should affect this.
> >
> > >   3. The kernel configuration, or at least the relevant DRM, PM,
> > >      generic power-domain, IOMMU, and MediaTek clock options
> >
> > All relevant options are built-in.
> >
> > >   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
> >
> > Module.
> >
> > >   5. The firmware SHA256
> >
> > See above.
> >
> > >   6. The kernel command line and bootloader used
> >
> > Chromebook's builtin bootloader.
> >
> > cmdline:
> >
> >     cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D31A
> >     console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.debug=
=3D0x106
> >     panic=3D30 rootwait log_buf_len=3D1M no_console_suspend
> >
> > AFAICT nothing special.
> >
> > >   7. Whether `vulkaninfo --summary` also completes successfully
> > >
> > > My current relevant configuration includes:
> > >
> > > CONFIG_PM_SLEEP=3Dy
> > > CONFIG_PM=3Dy
> > > CONFIG_PM_GENERIC_DOMAINS=3Dy
> > > CONFIG_MODULES=3Dy
> > > CONFIG_DMA_SHARED_BUFFER=3Dy
> > > CONFIG_DRM_POWERVR=3Dm
> > > CONFIG_DRM_MEDIATEK=3Dy
> > > CONFIG_SYNC_FILE=3Dy
> > > CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> > > CONFIG_IOMMU_SUPPORT=3Dy
> > > CONFIG_ARM_SMMU=3Dy
> > > CONFIG_MTK_IOMMU=3Dy
> > >
> > > I would be happy to test additional patches or provide any further
> > > logs, kernel configuration, or debugging information if that would
> > > help.
> >
> > As mentioned above, please try updating your firmware blob. Your
> > version is even older than mine, and neither of ours is the "official"
> > release.
> >
> >
> > Thanks
> > ChenYu
> >
> >
> > > Thanks,
> > > YoungJoon Lee
> > >
> > > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino D=
el Regno
> > > <angelogioacchino.delregno@collabora.com>:
> > > >
> > > > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Reg=
no
> > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > >>
> > > > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@r=
edhat.com> wrote:
> > > > >>>>
> > > > >>>> Hi Chen-Yu,
> > > > >>>>
> > > > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > > > >>>>> Hi everyone,
> > > > >>>>>
> > > > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > > > >>>>>
> > > > >>>>> This time around Mesa was ready for basic testing, using both=
 vulkanmark
> > > > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > > > >>>>>
> > > > >>>>> Changes since v3 (all in the clk driver patch):
> > > > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > >>>>> - Added missing of_node_put() in remove function
> > > > >>>>>
> > > > >>>>> Changes since v2 (all in the clk driver patch):
> > > > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > >>>>>     - Needed since the driver implements PM domains using the=
 generic PM
> > > > >>>>>       domain library, which also depends on PM
> > > > >>>>>     - Fixes build breakage (kernel test robot)
> > > > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > > > >>>>> - Dropped unused mfg_desc (Brian)
> > > > >>>>> - Added check of clk_prepare_enable()'s return value in
> > > > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > > > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branc=
h
> > > > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > > > >>>>>
> > > > >>>>> Changes since v1:
> > > > >>>>> - Adapted to changed DT bindings
> > > > >>>>> - Dropped driver change
> > > > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > > > >>>>>
> > > > >>>>>
> > > > >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, =
found in
> > > > >>>>> some Chromebooks.
> > > > >>>>
> > > > >>>> I'm making a pull for Stephen for the clk changes. Should patc=
hes 1,2,4
> > > > >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> > > > >>>
> > > > >>> Only patches 1 and 2 should go through the clock tree.
> > > > >>>
> > > > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants t=
o pick up
> > > > >>> DT binding patches. Otherwise I can push patch 3 through drm-mi=
sc.
> > > > >>>
> > > > >>
> > > > >> Not sure if I can really take the DRM bindings patch through soc=
.
> > > > >>
> > > > >> I will take the devicetree ones exactly right now, even though i=
t's going to
> > > > >> give warnings.
> > > > >>
> > > > >> I trust that you'll make the binding get into linux-next before =
it's too late.
> > > > >
> > > > > Rob beat me to it. :D
> > > >
> > > > Love it!
> > > >
> > > > Thanks Rob :-D
> > > >
> > > > Cheers,
> > > > Angelo
