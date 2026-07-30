Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D563A71A8
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400647; cv=pass; b=hRxAiDQLvzfNFuelojy/AeM8DIV2oxCU9zzXIhvbM8vQIJbmk2J8OZpkrpRE6E3IIJYzAYhO5JY5we242X4ILELKEEPQc81aBxwtTOEl7r5OVOfQHP/EZIQiBiMK8EKXyMMmtoRwcqbFPRnSpuR/3Wy8jHJzX85oA66UjOUSVKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400647; c=relaxed/simple;
	bh=Wqi/Un1MhDb4AD2e5tOkm0dlOIBZd5Qa5ltP4eXELpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTgKSJbvzJyYP8y1SuylReXXXykPw/NKhV6WvFmp4bOBke81gPXbJH2Ov2lZc+19sUtdiKVGZgbh2x++A18fIOKZzL1RHdew8Gg3rAZL+TrGBPn2wGd2Kz7F4TE9lbPhUIAeD+ucIC/8VH8ocOvgrh6XKFibrPdL9/GlO419ZEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MINXMUo5; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MINXMUo5"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81f36179d72so29028257b3.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 01:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785400643; cv=none;
        d=google.com; s=arc-20260327;
        b=F7515+H17N51tSJYTdJ0EkkVvS7kYtsyUDL8kI4eyXwMYnxXlkzspsXhEjziPT33EI
         6rx+I367dlxwSPo+5PSLZr4i3WGOWBIZAhc6uZ90lXTjvLmJCKtedfhp7eQfhtQ7rYXq
         OA9gSfBXguukjOM+0ADr2b5ieLI0UN+xkjJsJ0HFqZgUT/kxN4C2jEsJRApnoS8FbkBz
         5HrHm/bVgl0h+Xpg15mdz4WQOXEPdu2UqbZef0YQ4f/8PtBo+xDjfbwQ7WMlQPt0o0dx
         tS4bGB1nG4AFEtZ45/vcHoqy/x1JPFXjevrWec9n1zvhjsjbqo9pGSlkKCocka/wbfV3
         mugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W45gP6xH7PfQckM+Q3lwy6aIcxf+8fEMzg4xhSYRh+Q=;
        fh=8AWoodMLVPaIUdyDfDiFINzgGX/JH1SIY5/w2OLd3p8=;
        b=DnjJvfFPsXN8PSq3esAvpEU5UZdXGig8bFronIdwuxxsrItc3Ko9aKYlAqJym/HP7I
         T0k+1Hhv5tbaDjNxAJp+mLvF9TsVReRYjvW9R0007W4M4997XHKBfgskfTLsP9v4FctS
         jTK9MoJKGWsCZMiTtmahkWS/gXaUwvdkBYZDtLCQjvOckmiA+EFxm7XTG/lZ9372Qqt6
         h7cyTSv2oMaGtfjZYjTiMGtk8q3KEs5ZZjiCER3BYdyoWdSr7vG+gmhZRa1s1TLimFzH
         CnBle+n7ztBUqjfSzmRflvZtgyRVZGM+Cz6tnEFuGvF18hYHb8vXnoHAEVSr9yHPDmiu
         ZWAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785400643; x=1786005443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W45gP6xH7PfQckM+Q3lwy6aIcxf+8fEMzg4xhSYRh+Q=;
        b=MINXMUo59MX9De0jrupBx7u1X9rOnW2CjPAgjCUSw4x6NVskWwYeBNFtSITJBVIAAI
         7EFq4BKn65iKL5SGVI0e4fwXAbNSUYBD7ZW0Sgct6AFDI4pXCikb5LgfzUPJOcz3WNa5
         69HIjGCyFxsFSwllNCfClCmdIkKSeQPVYNQ0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785400643; x=1786005443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W45gP6xH7PfQckM+Q3lwy6aIcxf+8fEMzg4xhSYRh+Q=;
        b=jgtG76HT7yVzhWB5ePmtLGPKzoimYr+Y4oANBwVKk6PUHz0t+VUuXkWU/wR50xGYXp
         IlGI+Qn+jhqVStRUr/F46WmdKd5FbJTm5rI9YcF8v7+b0IwDyuR9I6F2XiSkWdK/jR9H
         LTYA2QcCiOYf/fFQ2RjLZBSYpKvIy3ptQgrGSIwf2nluqxz4+RGuUi/wAFUwMtfJvVBd
         4o5d/v68YHscUbuRo1KovQEPX0ewwJ635WQmnp9lL2F0bbCE1LE//x84e9Wk+YQypVbb
         VujjbpaN/AnXKdwvIn9D946/EjXN/+2oMMnIvKbca+kACX4CmLPuU+5aXnRavtPWLJPM
         mGjw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1zVqRLL8kBbZXrXZxHpeMPHri8Ckvbk7Yrgi3u6QW+QBTxZF4ec2CyyiQE7j0z/PRq9vIlYpi5Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqaVj9EeHoDfo3ngFzJna9OQs4obcImDrq/lRKFAnJZkwb3n0k
	OmqGkYX7y3c9LkZe9TrKZvMU/xb/6blDC3tvI1B/yJ5BYNOrYFkyMhf/1A/bxwn/MFju7wSTPc2
	8m71p4PZeaubHNy3KPYbVN+2sux4Q0xy9dx/46E0V
X-Gm-Gg: AR+sD10jsCANZHvpVNDeqPrCgoJ0J/DWbphscmMay3BXwMK2pSl3NMzi7IHp3x+57Qm
	hosv+Ln+TiJqFzja0MFsxOoHPBCylYOTop4h2cIg0w1SDx7eJZilBDBOXMT3vF1MA5Plu1AzciK
	wWblT8K0aNXc257zWzA6PBxMIadX3QSApU9ttOAVijiwgO283hAcksvYub03F9/wVjz38UFGmV9
	seZvZZ+iDqhAc7xsaHfPCVn3gcztmGRCOWdfwhfu5cCz1mmcl5RPZ38o+nbjeA7GwR3lpbwyUqI
	n+CW71siHvpMkIbuc6y69x//0jcTFzbxWf+2Pr+1+zx8FQdyznUnZb4nHWFBuvxhZ8l2ZVwWXoo
	=
X-Received: by 2002:a05:690c:ecb:b0:814:608a:a2f7 with SMTP id
 00721157ae682-81fb89bd682mr11853577b3.25.1785400643037; Thu, 30 Jul 2026
 01:37:23 -0700 (PDT)
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
 <CA+m4KrDQ0tf0ffx9ttARBF-5sDZUz5bF0Apu3-M=wr=psYLogg@mail.gmail.com> <CA+m4KrCZdQb7=+7wJDH0H8KZgDzWkB1CtB2jEbEnRUxu9OJybA@mail.gmail.com>
In-Reply-To: <CA+m4KrCZdQb7=+7wJDH0H8KZgDzWkB1CtB2jEbEnRUxu9OJybA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Jul 2026 16:37:12 +0800
X-Gm-Features: AUfX_mz9ndgpKU1aVx4ZJqOpOdAsme5iiSGANxBR0WVL0ps6zyho2cMcn1ou8yE
Message-ID: <CAGXv+5HcwgmEEmhtTU5TpexxRVwDXC-ggdtOViLdmThT7FjB+g@mail.gmail.com>
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

On Wed, Jul 29, 2026 at 5:35=E2=80=AFPM YoungJoon Lee <getfeus@gmail.com> w=
rote:
>
> Hi Chen-Yu,
>
> A follow-up to my previous email.
>
> The official v1.1 firmware did fix the original "GPU device lost"
> problem.
>
> The following now works correctly:
>
>     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
>
> The driver initializes successfully and detects the PowerVR Rogue
> GX6250.
>
> However, while testing actual rendering, I found another issue which
> appears to be unrelated to the firmware.
>
> Kernel:
>
>     Linux 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
>
> Board:
>
>     Google Elm (Acer Chromebook R13 / MT8173)
>
> Mesa:
>
>     mesa 26.1.5
>     vulkan-powervr 26.1.5
>
> Firmware:
>
>     rogue_4.40.2.51_v1.fw
>     FW version v1.1 (build 6976702 OS)
>
> Kernel command line:
>
>     powervr.exp_hw_support=3D1
>
> Test command:
>
>     PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 glmark2-es2-drm
>
> Renderer:
>
>     GL_RENDERER:
>     zink Vulkan 1.2
>     (PowerVR Rogue GX6250)
>
> The benchmark progresses normally:
>
>     build (VBO off)          212 FPS
>     build (VBO on)           216 FPS
>     texture nearest          174 FPS
>     texture linear           173 FPS
>     texture mipmap           174 FPS
>     shading gouraud          165 FPS
>     shading blinn-phong      135 FPS
>     shading phong             99 FPS
>
> It consistently hangs at:
>
>     shading=3Dcel
>
> Immediately afterwards the kernel reports:
>
>     refcount_t: underflow; use-after-free
>
> The first warning is:
>
>     pvr_free_list_put()
>       -> pvr_hwrt_dataset_release()
>       -> pvr_hwrt_dataset_put()
>       -> pvr_ioctl_destroy_hwrt_dataset()
>
> followed by:
>
>     refcount_warn_saturate()
>
> Shortly afterwards another kernel Oops occurs:
>
>     Unable to handle kernel NULL pointer dereference
>
> The second backtrace shows:
>
>     pvr_gem_object_create()
>       -> pvr_fw_object_create()
>       -> pvr_hwrt_dataset_create()
>       -> pvr_ioctl_create_hwrt_dataset()
>
> The glmark2 process remains as:
>
>     glmark2-es2-drm <defunct>

I think this is more related to the unsupported nature of the GX6250,
and not specific to MT8173. Maybe someone else on the Imagination or
DRM mailing lists has a better idea of what's going on.


ChenYu

> The system is otherwise still reachable through SSH.
>
> I collected additional diagnostics, including:
>
>     - complete dmesg
>     - complete kernel journal
>     - kernel configuration
>     - PowerVR module information
>     - userspace package versions
>     - process/thread state
>     - runtime PM state
>     - running Device Tree
>
> I can send any of these if they would help.
>
> Also, please disregard my previous Tested-by tag for now, since this
> rendering issue was discovered afterwards.
>
> Thank you again for your help.
>
> Best regards,
>
> YoungJoon Lee
>
> 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 13:38 YoungJoon Lee <getfeu=
s@gmail.com>:
> >
> > Hi Chen-Yu,
> >
> > Thank you. Updating the firmware fixed the issue.
> >
> > I replaced my previous firmware blob with the official v1.1 firmware:
> >
> >   FW version v1.1 (build 6976702 OS)
> >
> >   SHA256:
> >   e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1c44
> >
> > After rebooting, the driver loaded the new firmware successfully:
> >
> >   powervr 13000000.gpu: [drm] loaded firmware
> >   powervr/rogue_4.40.2.51_v1.fw
> >   powervr 13000000.gpu: [drm] FW version v1.1
> >   (build 6976702 OS)
> >
> > I then ran:
> >
> >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> >
> > This now completes successfully and detects the PowerVR Rogue GX6250.
> > The previous "GPU device lost" error no longer occurs.
> >
> > So the issue was caused by the older, non-official firmware blob I was
> > using, rather than the v4 kernel series or my kernel configuration.
> >
> > Thank you for pointing this out, and sorry for the noise.
> >
> > Tested-by: YoungJoon Lee <getfeus@gmail.com>
> >
> > Best regards,
> > YoungJoon
> >
> > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 12:32 Chen-Yu Tsai <wenst=
@chromium.org>:
> > >
> > > On Wed, Jul 29, 2026 at 8:08=E2=80=AFAM YoungJoon Lee <getfeus@gmail.=
com> wrote:
> > > >
> > > > Hi Chen-Yu,
> > > >
> > > > Thank you for posting the v4 series.
> > > >
> > > > I tested the complete v4 series on my MT8173 Chromebook, but I am
> > > > seeing a GPU device loss as soon as Mesa initializes the Vulkan dev=
ice.
> > > >
> > > > My current setup is:
> > > >
> > > >   Board: Google Elm / Acer Chromebook R13 (CB5-312T)
> > > >   Kernel:
> > > >     linux-next next-20260727
> > > >     commit: 33d6e5134c70446eddafbb3fd5ad088e848a7ad6
> > > >     (next-20260727-5-g33d6e5134c70)
> > > >
> > > >   Kernel release: 7.2.0-rc5-next-20260727-stb-cbm-next-pvr-v4+
> > > >
> > > >   Mesa: 26.1.5
> > > >   vulkan-powervr: 26.1.5
> > > >   Firmware:
> > > >     rogue_4.40.2.51_v1.fw
> > > >     SHA256:
> > > >     f44b7056992fb4057c987dcd7073468bec628aa56cb9815b1162f1cb7c1d73f=
2
> > >
> > > My firmware blob is different from yours:
> > >
> > > powervr 13000000.gpu: [drm] loaded firmware powervr/rogue_4.40.2.51_v=
1.fw
> > > powervr 13000000.gpu: [drm] FW version v1.0 (build 6503725 OS)
> > >
> > > SHA256: 1456504351bd041f0bf96667403ad32460fc7b807c09858df1f083e207323=
e4a
> > >
> > > Funny thing is neither of ours match the official firmware blobs rele=
ased
> > > by Imagination [1].
> > >
> > > The latest version is "FW version v1.1 (build 6976702 OS)" with
> > > SHA256: e6bf10aaf442798fd81df9b9122e7e85900aafe77fcbec34b426af435c2b1=
c44
> > >
> > > This version also works for me.
> > >
> > > The "initial version" is "FW version v1.0 (build 6734358 OS)" with
> > > SHA256: baa227de4f297b7c0928c6535d15affd80aa9c5f528d2d5dc4b764ad050d2=
2f2
> > >
> > > And this version also works.
> > >
> > > It seems your firmware build is even older than mine. I suggest you
> > > update it and try again?
> > >
> > > [1] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/=
powervr/powervr/rogue_4.40.2.51_v1.fw
> > >
> > >
> > > > All five patches applied cleanly. The PowerVR driver probes, loads =
the
> > > > firmware, and creates the DRM render node successfully.
> > > >
> > > > However, when I run the following from an SSH session without GDM o=
r
> > > > another graphical session running:
> > > >
> > > >   PVR_I_WANT_A_BROKEN_VULKAN_DRIVER=3D1 vulkaninfo --summary
> > > >
> > > > Mesa prints the expected GX6250 warnings:
> > > >
> > > >   Missing reset support for brn51764
> > > >   Missing reset support for brn58839
> > > >   Missing support for brn62269
> > > >
> > > > The command then hangs, and the kernel reports:
> > > >
> > > >   powervr 13000000.gpu: [drm] *ERROR* GPU device lost
> > > >
> > > > There are no additional timeout, MMU fault, firmware, clock, or run=
time
> > > > PM messages immediately before the device-lost message.
> > > >
> > > > I originally also observed the same failure when GDM started GNOME
> > > > Shell, but reproducing it with vulkaninfo from a non-graphical SSH
> > > > session indicates that this is not specific to Mutter or GNOME.
> > > >
> > > > Since your cover letter reports that vkmark and glmark2-es2-drm wor=
k
> > > > with Mesa 26.1.5, I suspect that there may be a difference in the
> > > > kernel configuration or another part of the test environment.
> > > >
> > > > Could you please share the following details from your working setu=
p?
> > > >
> > > >   1. The exact Chromebook board/model used for testing
> > >
> > > The codename is "telesu", which is basically a hana in a different ca=
se.
> > >
> > > >   2. The exact kernel base commit
> > >
> > > I have a whole bunch of patches on top of next-20260727, but none
> > > that should affect this.
> > >
> > > >   3. The kernel configuration, or at least the relevant DRM, PM,
> > > >      generic power-domain, IOMMU, and MediaTek clock options
> > >
> > > All relevant options are built-in.
> > >
> > > >   4. Whether CONFIG_DRM_POWERVR was built-in or built as a module
> > >
> > > Module.
> > >
> > > >   5. The firmware SHA256
> > >
> > > See above.
> > >
> > > >   6. The kernel command line and bootloader used
> > >
> > > Chromebook's builtin bootloader.
> > >
> > > cmdline:
> > >
> > >     cros_secure root=3DPARTUUID=3D824526A4-24EE-344D-85A2-20630C42D31=
A
> > >     console=3Dtty0 console=3DttyS0,115200n8 earlycon ro text drm.debu=
g=3D0x106
> > >     panic=3D30 rootwait log_buf_len=3D1M no_console_suspend
> > >
> > > AFAICT nothing special.
> > >
> > > >   7. Whether `vulkaninfo --summary` also completes successfully
> > > >
> > > > My current relevant configuration includes:
> > > >
> > > > CONFIG_PM_SLEEP=3Dy
> > > > CONFIG_PM=3Dy
> > > > CONFIG_PM_GENERIC_DOMAINS=3Dy
> > > > CONFIG_MODULES=3Dy
> > > > CONFIG_DMA_SHARED_BUFFER=3Dy
> > > > CONFIG_DRM_POWERVR=3Dm
> > > > CONFIG_DRM_MEDIATEK=3Dy
> > > > CONFIG_SYNC_FILE=3Dy
> > > > CONFIG_COMMON_CLK_MT8173_MFGTOP=3Dy
> > > > CONFIG_IOMMU_SUPPORT=3Dy
> > > > CONFIG_ARM_SMMU=3Dy
> > > > CONFIG_MTK_IOMMU=3Dy
> > > >
> > > > I would be happy to test additional patches or provide any further
> > > > logs, kernel configuration, or debugging information if that would
> > > > help.
> > >
> > > As mentioned above, please try updating your firmware blob. Your
> > > version is even older than mine, and neither of ours is the "official=
"
> > > release.
> > >
> > >
> > > Thanks
> > > ChenYu
> > >
> > >
> > > > Thanks,
> > > > YoungJoon Lee
> > > >
> > > > 2026=E5=B9=B47=E6=9C=8829=E6=97=A5(=E6=B0=B4) 0:28 AngeloGioacchino=
 Del Regno
> > > > <angelogioacchino.delregno@collabora.com>:
> > > > >
> > > > > On 7/28/26 16:44, Chen-Yu Tsai wrote:
> > > > > > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del R=
egno
> > > > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > > >>
> > > > > >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > > > > >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney=
@redhat.com> wrote:
> > > > > >>>>
> > > > > >>>> Hi Chen-Yu,
> > > > > >>>>
> > > > > >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote=
:
> > > > > >>>>> Hi everyone,
> > > > > >>>>>
> > > > > >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> > > > > >>>>>
> > > > > >>>>> This time around Mesa was ready for basic testing, using bo=
th vulkanmark
> > > > > >>>>> and glmark2-es2-drm (with Zink). Details below.
> > > > > >>>>>
> > > > > >>>>> Changes since v3 (all in the clk driver patch):
> > > > > >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> > > > > >>>>> - Added missing of_node_put() in remove function
> > > > > >>>>>
> > > > > >>>>> Changes since v2 (all in the clk driver patch):
> > > > > >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> > > > > >>>>>     - Needed since the driver implements PM domains using t=
he generic PM
> > > > > >>>>>       domain library, which also depends on PM
> > > > > >>>>>     - Fixes build breakage (kernel test robot)
> > > > > >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> > > > > >>>>> - Dropped unused mfg_desc (Brian)
> > > > > >>>>> - Added check of clk_prepare_enable()'s return value in
> > > > > >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> > > > > >>>>> - Saved error value for return in IS_ERR(data->clk_26m) bra=
nch
> > > > > >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> > > > > >>>>>
> > > > > >>>>> Changes since v1:
> > > > > >>>>> - Adapted to changed DT bindings
> > > > > >>>>> - Dropped driver change
> > > > > >>>>> - Use same power domain for "a" and "b" GPU power domains
> > > > > >>>>>
> > > > > >>>>>
> > > > > >>>>> This series enables the PowerVR GPU found in the MT8173 SoC=
, found in
> > > > > >>>>> some Chromebooks.
> > > > > >>>>
> > > > > >>>> I'm making a pull for Stephen for the clk changes. Should pa=
tches 1,2,4
> > > > > >>>> go through the clk tree? Patches 3,5 go through the DRM tree=
?
> > > > > >>>
> > > > > >>> Only patches 1 and 2 should go through the clock tree.
> > > > > >>>
> > > > > >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants=
 to pick up
> > > > > >>> DT binding patches. Otherwise I can push patch 3 through drm-=
misc.
> > > > > >>>
> > > > > >>
> > > > > >> Not sure if I can really take the DRM bindings patch through s=
oc.
> > > > > >>
> > > > > >> I will take the devicetree ones exactly right now, even though=
 it's going to
> > > > > >> give warnings.
> > > > > >>
> > > > > >> I trust that you'll make the binding get into linux-next befor=
e it's too late.
> > > > > >
> > > > > > Rob beat me to it. :D
> > > > >
> > > > > Love it!
> > > > >
> > > > > Thanks Rob :-D
> > > > >
> > > > > Cheers,
> > > > > Angelo
