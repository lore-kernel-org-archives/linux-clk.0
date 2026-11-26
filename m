Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655792;
	b=zuthobTQWY2L2/j+drmJ/7HuTaNwxMMctZZzXspmmj/WYOKhLUYNYdcWCwvc2PcCWdAx
	 87dno+GjV3LUbS+Us0MOONtV5H4k5r451SagtQhadRE78M97d299O9z7FGiW1A6I2CVqP
	 K1qdNEoHhtJB/MvrXw9cfdGIyH+cydEXskcz/F3CYiTy4zFacGMG1ZiRZkgJA275Dpki0
	 Tjr/yE/bjy85uERKiwp8OZsZKOTXbflsONfbbupaxuc6ev1OuGcrPHIy+Sbafffi1ehzq
	 eoQzg5fF137Asm9S67NHGNeSmVoKjPFWTqP8LWXZJBTgkUNFJfDmlZgxNnGubiXeYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
	b=O3vtFGeKEVDi6gUEqjXCvG0FxtURZlQVsC5Dc+t4LPGN7719SowC68fzA9XnfgyIltJk
	 gzc2vvZ9jOau7ceBMIiVYTl9QNYeih+At0KvxSPi8aYn7IXUE3PsnfPaxONCZFAQINKAk
	 Xu4Zoc+LVeMjmcHKzIvq/lH2jxI8N7UQ70gzvQLMz+5A2MBJmogOkSwvvZhUmD9fhDBnR
	 fbft1Qo2iubFKeY+R75nP8brm+OkFwfB086dQW98ckeucR4VatfHpx2VPtOgEgGGwXHtb
	 SuQsSoBBnFh3e4a5u3mKUDyK6cjB1oIdNkw03gK6hDCw2q2QimfeL7WGtWclhpZhGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3hiWB4Z;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8174A606A326
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 01:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8174A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3hiWB4Z
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4c2da74c0so42485977b3.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 17:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655791; x=1796260591; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
        b=E3hiWB4Zj+L3kKg33G/3K6k/Vf2pySHmj8NCZYgRSDYT2gq9x2DlDktdLL3cq4jVyL
         4IoAI4BW66V/dudYr+Z7ncM3MMMdZmRahqSriEwy7JyprppwYPFa0ZMqPnmh/aAwsawT
         5ZPg1tzHAn4RKfxhygskCZMsE/5Ke5WcMM8fH5svn/nR4in9izf6cXxJQn9fP2bibktZ
         GLmjEKHBoW5Cw/qvmRNVhpnOh1nTfUVgeHI/LBlz2K0ch7e9mOhOcLhoT4VWu98W1vVA
         CL4wu/KF8CpapNCEMXuXHkmp1FIzQ9pFD8iMQgLEmGSxk4sNn9jv9cZv+GyDRmpxUqME
         A0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655791; x=1796260591;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
        b=zE6xdvlE1fxIKzhUa7w3owp0qaCrUqWLe45TH7FaqzMFtNrtexKo+jQXVcwSCXP7tO
         l/Je/GMBDSkXON0ItaeZnHGP3SwKSp+3H2fnm0lMMnDinfLqsjiDQ7PSN44K0u2yFdJY
         UyBWWlvUJR9S+SPm6OfpdEm+3DoBkLDLU/yt4euqLNsCknzCc8gKj00cpfgFGy+nwLuv
         MApOCCWsioy9Glz2adaEBHxXVxe0t68DGWqs9TYytbEQoy+FWRx/nclp6eG9wt+LZ2PR
         fax8sojdpd2Xys1By3ayOk3hXT8Tbw/tjEaD5De+mML9N2Rg2ElmVEOSfQ7XNsP24dbu
         pHhg==
X-Forwarded-Encrypted: i=1; AL+hErEgf8fd/pQM7ZrkaLccBPnBLASN6iNtvH5trNWoNOfrEkkH+liZjU83HC+/ESGV9N/bDYCDj7y23Pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mkQvCfOmKxba2G9ASxk5lJCzTc2H8AEneYwD1WE+3/gYuIBkq
	sFZIcQK4dDSCDUEDkDK6q8a3gTIVxFCO5N6Z1OBnMYKO9bOHOcQze/WS
X-Gm-Gg: AZFdTZfgZUz5i6J6S9oETOVSJBmSDSccm93kLypLCh0NP+lv4ZCs5gcw8ax13/QojPw
	6+RSMWjlEGjwLPLAjOAJ28pT86hxuI85S7BwLVvWzrHa7vkUx7N6QkwUoDRQRlgth4/4B8BFHou
	507i3/3xjaWMNLp0vkVOvyFv4E4Hjm7RXwEt5LcJjduxpqvKpjLdMv1d00sivWNQU5AS70sZ1OH
	7b53S2OKAR6iGIFGoXL4qUqnVJ/PKkDuhW1db0QmKC06ptyNFBuXinFHLVJjcVqxgozBaUMAvl8
	yfI7tkGzRslcCQ/lOztBT9TI/dON0tLu2i4mrXoIh7deI5TcssbmZ73kb8pZwvVCpTTUabJkZF5
	GwjAOtoiZFvOpbgitO4/7A3Qgi9ilyTlT4wngAM3E2FLUpMRFBXZAeSfhoto5L+W7DCSZibLdza
	w2t7p64nZuUrInQgjjMkV9KPWdwNugWnD81gshzKBW76udCbReHa9aq7KpqiK0pdWniT35MntIc
	yXuZvhFYGOjRP9m3jUttfq+GswfGHGp6MGZXQkUpNqtiGuiXMcXqvOOL8/GBtMXELO2AFiey/ry
	HuaGmYUi+0dS/naUtN3PC6DG
X-Received: by 2002:a05:690c:6a06:b0:8b4:d0ea:ca9d with SMTP id 00721157ae682-8b52045f6c5mr70876907b3.25.1795655791098;
        Wed, 25 Nov 2026 17:16:31 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b575ff89c0sm12140497b3.0.2026.11.25.17.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:16:30 -0800 (PST)
Date: Wed, 25 Nov 2026 20:16:25 -0500
Message-ID: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Cody Kang <codykang.hk@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Cody Kang <codykang@vsit.ai>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP controller
 bridge driver
In-Reply-To: <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Cody,

On Sat, 21 Nov 2026 15:40:51 +0800, Cody Kang via B4 Relay wrote:
[...]
> diff --git a/drivers/gpu/drm/spacemit/Kconfig b/drivers/gpu/drm/spacemit/Kconfig
> index 8326a7b98151a..4667cb624401a 100644
> --- a/drivers/gpu/drm/spacemit/Kconfig
> +++ b/drivers/gpu/drm/spacemit/Kconfig
> @@ -16,3 +16,22 @@ config DRM_SPACEMIT
[...]
> +config SPACEMIT_INNO_DP
> +	tristate "SpacemiT Innosilicon DP/eDP controller support"
[...]
> diff --git a/drivers/gpu/drm/spacemit/Makefile b/drivers/gpu/drm/spacemit/Makefile
> index b3b148000cf7b..260d316a271b5 100644
> --- a/drivers/gpu/drm/spacemit/Makefile
> +++ b/drivers/gpu/drm/spacemit/Makefile
> @@ -9,4 +9,7 @@ spacemit-drm-y := spacemit_drm.o \
>  		  dpu/dpu_saturn_hee.o \
>  		  dpu/saturn_fbcmem.o
>
> +spacemit-inno-dp-y := spacemit_inno_dp.o
> +
>  obj-$(CONFIG_DRM_SPACEMIT) += spacemit-drm.o
> +obj-$(CONFIG_SPACEMIT_INNO_DP) += spacemit-inno-dp.o

I noticed a corner case when testing module unload on v3.
spacemit_inno_dp can be removed while a process still has cardN open
(say Xorg or kmscube is running and somebody does rmmod
spacemit_inno_dp), and the DRM device then still holds references on
the bridge. When that process closes cardN later, the kernel oopses. On
a CoM260-IFX:

	sleep 20 < /dev/dri/card0 &
	rmmod spacemit_inno_dp

  Unable to handle kernel paging request at virtual address ffffffff01ac5188
  Modules linked in: spacemit_drm [...] [last unloaded: spacemit_inno_dp]
  epc : drm_bridge_put.part.0+0x72/0xb6 [drm]
  [...]
  [<ffffffff01b0b142>] drm_bridge_put.part.0+0x72/0xb6 [drm]
  [<ffffffff01b0b19e>] drm_bridge_put+0x18/0x22 [drm]
  [<ffffffff01c41318>] drm_bridge_connector_put_bridges+0x34/0x7a [drm_display_helper]
  [<ffffffff01b23400>] drm_managed_release+0x86/0x116 [drm]
  [<ffffffff01b13cce>] drm_minor_release+0x68/0x80 [drm]
  [<ffffffff01b1ce2a>] drm_release+0xd2/0x102 [drm]
  [<ffffffff802b325c>] __fput+0xa8/0x248

An open cardN pins spacemit-drm only. The last drm_bridge_put() comes
at the final close and reads bridge->funcs, which was in the module
of spacemit_inno_dp that is already gone.

Other DRM drivers with the same structure, rockchipdrm for example,
put the bridge driver and the DRM driver into one module. I think doing
the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
solution.

Luca (added to Cc), is module unload something your bridge hotplug
series [1] is meant to cover?

[1] https://lore.kernel.org/r/20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com

Guodong
