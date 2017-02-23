Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from [195.159.176.226] ([195.159.176.226]:53213 "EHLO
        blaine.gmane.org" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbdBWPKV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2017 10:10:21 -0500
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
        (envelope-from <glkc-linux-clk@m.gmane.org>)
        id 1cgv1u-0004tH-VS
        for linux-clk@vger.kernel.org; Thu, 23 Feb 2017 16:10:02 +0100
To: linux-clk@vger.kernel.org
From: Stefan Monnier <monnier@iro.umontreal.ca>
Subject: Re: [PATCH 4/8] drm/sun4i: add support for sun8i DE2 mixers and display engines
Date: Thu, 23 Feb 2017 09:27:38 -0500
Message-ID: <jwvwpchgez7.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <20170222151854.3280-1-icenowy@aosc.xyz>
        <20170222151854.3280-5-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-sunxi@googlegroups.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

>  drivers/gpu/drm/sun4i/Kconfig       |   8 +
>  drivers/gpu/drm/sun4i/Makefile      |   1 +
>  drivers/gpu/drm/sun4i/sun4i_crtc.c  |   6 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c   |  38 +++-
>  drivers/gpu/drm/sun4i/sun4i_drv.h   |   1 +
>  drivers/gpu/drm/sun4i/sun4i_layer.c |  92 ++++++--
>  drivers/gpu/drm/sun4i/sun4i_layer.h |   1 +
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 417 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 133 ++++++++++++

Should the drm/sun4i directory be renamed to drm/sunxi then?


        Stefan

