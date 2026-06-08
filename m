Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC8C3B4E81
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 09:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909835; cv=pass; b=W9GfJwj1LA2NimX27N3o1L2klkElvgmrqo6DYRdmATpyzWAJTpTSKZ3G4OphEFD9Nx5YO94cx6lQGOqpp9V9tjjUC8ucIp9JnwVX9jskDAqTqe//FGxtXRU54PvV5V+wqk1PrGLdyzSISd23x/+ghthN3EZhD27EI/D+UHsNnRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909835; c=relaxed/simple;
	bh=dZbilIS/Qna4fJ6oZVSTQqKNAm/MOGoPv0Ifm7jq+/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAWumCowJeJwkCyN/8zSr/l06DBKTrkc47bvo8ck4bDFPg7zH6u5HcMuaOqiiQwVP4E9FPB2SC3CV6yEdDd7FseLghi7e6bUForQkU348B+84rWGdoRJYTZ0RJNEAfXCtS///xHrhHX65Soa9U5Yoh7uJh2Ap9t1fnyjkA7N2QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kk87X+Fb; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kk87X+Fb"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68cf03bfso4118004e87.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 02:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780909830; cv=none;
        d=google.com; s=arc-20240605;
        b=gqpcpcRUx2NdMbevKacbHek4UpnfAufWX5hhvV0lefCiEMsrjAVd/I01NzNEhWJ24z
         ESwv2rNNFr6jfxl7sQodkibvqRQium8nJez0CZZIzSK8tmE6gbOcgtJ6jLi4dLOWdlMk
         9iRIRcmD5QtQBKjpqTN13Gbl1cYlvl5wNrV2ZsoSiHRRvoHKEjnjcA1WGWey4ppHUZKV
         H5Kbffa3z49XRNv3W6HZMWQ6fhUMsRRsfJt3GQ30bnuoIfOyeuwDVhz9b460o7AseMhx
         NSWkNF+GEICDswi+23xDpFLmlhVE+HIm5nn+n4HjXyePfH5G8ZioTZyh5uHS8zYI0BD8
         kUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        fh=uyYrlRPxeAhWsG3a0cCDCCntBn4X2hZODwLN2d2pfsg=;
        b=jQWoENGg+7LK/2OaInL4zVKPgCZ2yOwF0JusYl5dehRqJv1x6VkJy1B/0zrp9GwT3b
         iltKSP+jUMkqxWJ5FZhPbM2VZD/niTzLpyjI8b1wJZv0+uakLwwnDSyTPu6LhHADbYDn
         VWRKnwgY0LlXRZqw2k6nqP4Niq90/cyXbQoeN2jWEhYYnlfeRtF5tdvb0X9efVpj/iEv
         Fyy7eMFcrWP8waFzW/2/DXeJEtvrLkkeHcS45KQ6Kv5wsD3leNigydHOvJKdNThT36kM
         M/mBYt7VrYoVItwATbBjwC6wam1cHdQU5iUsCL19pPnYg4x03QvrEb/b2EpMxtHkQeoa
         18Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780909830; x=1781514630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        b=Kk87X+FbK5KVTKLuUe7lsT5xnPMNY5DSF6dLfAeNQczoDOm8i2V569R4mbxBJbCSiK
         JwMwb40hpEIFMRXcLs+7SpIIG9u8M/wfPG3LqdRZAgk34Q0Y6C+/xLQdJ/wsO8D9Ldi8
         JReHMB7vKFGnJNkYa1OrHLrL+3XKElzCG93ahbk453cSmhqx0qXgFfanu/o/CyfWmt2U
         yh+VqRpNFLC7/SFNIjDnajZ742Sk8KERAc9e7u9QKw25JHcvEE8cYzQmZFVCdg3xn9Sn
         rUdj/oCATdRvSdjmcNnwH2XtAR3+HK5t/QbflfYj2t8hCPzKvb7Sts2waKegFCCtE60m
         XZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909830; x=1781514630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FITnT5hSRTOhc0v/k1uvO22mPCQJj8qfY19n4Uco4GQ=;
        b=T+7N4RUavmMd86dev3KzGs3lOwXdvvIcj+3kBMqblqtGHIM+AWSKs9Y0Pm29W/oCTa
         3BDRI1dJ/Tb+m45yCd6CEro6tcOngIC5tx+u7pk71RBM339SrSyYK2zjSKxjtUoal6tH
         d7TuyL2g3f9wz5gMfr7LFe8Q4bQKEzJlUJD8/gURFaFsZTVBfhKO0ozDk+171M1Axruq
         AeZh8nAKLkiF3Y5dYBjI97f4Com5nqnsg0yOZuPh1Qvg5Iz1/C/VBmt80W6af/LpRVZu
         pcSmYxTqncqh/6Idx2EptM4RvRWaRIcW3VflaM+NRq28/PXV9uZpgpZUQ1MdOp+RnNlF
         BC+g==
X-Forwarded-Encrypted: i=1; AFNElJ/c+ZK/sBTdxXVSCRcodZYxLzQMAxa152Dq0pLAXfhaQ5VfPamJF9t/qAf7EhGK9Iei2U0Hor6UTso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6hodr78RQhNThIP+ZgtZM350JBYMOVTvylqxHNIlFLbIyZgp
	tgYJLjjKo04ItdI59WtfCOYkrUDV6JF/BTuEjVC8zFldrPxFNVovzOQlnNQ08VKTPKOhZO+kr7X
	TJSx/jP2sJxRYbVC2OajlOn41epKqQVI=
X-Gm-Gg: Acq92OFPgsDT9WdPqg8iF7n+BZlbCOmewIxcWc5Y6q7xroPeRdc9zbglXID2Wx9tXof
	p52XJ/ZJvqkBFSTdyctmPwwDTDIkduHQxcrHJzDn7IpN1LCPZxZG91Gv6SKdLgCPveblFaZB7d+
	0paD1xJW9PVkmmSLtKL+qzxem69veBxMGnS/VFI79ksnunjlBw+3y4SQ7zlkvYFmCrD3jAAMKHV
	zt9wiNr39Uqzmqj6DYFQja6+AEHOlR5Fg1ypmzP2Z+2Sy6liR8tVxf3XjgWQtvc07/ZRJtYFYPO
	qj9cbKFnZm4LV3WUD/n5UZI8gf3YluCH5hHzn9he2X862VaWnxeG3hEmnPZx9Mo4MKlbRQX4LeE
	LyXGILxg=
X-Received: by 2002:a05:6512:1116:b0:5aa:6c66:e343 with SMTP id
 2adb3069b0e04-5aa87bc93bcmr3927231e87.38.1780909829307; Mon, 08 Jun 2026
 02:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20260605121112.27866-1-piyushpatle228@gmail.com> <aiZzxhljfyYQ68Gl@raspi>
In-Reply-To: <aiZzxhljfyYQ68Gl@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Mon, 8 Jun 2026 14:39:52 +0530
X-Gm-Features: AVVi8CcpFt73_s1W6tVAYjL6KIr_ANTO2-Kr_9uq4rs-k3XfwDZkGI2c1mIcJWo
Message-ID: <CAMB+xkZm-FA_hmnAYRnXw6T4tZvVtamM=kmEyatFKZWV0+kJFA@mail.gmail.com>
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Abel Vesa <abelvesa@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 1:16=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Fri, Jun 05, 2026 at 05:41:05PM +0530, Piyush Patle wrote:
> > Hi Marek, Liu Ying,
>
> Hi,

Hi Ying,
Thanks for the detailed update.

>
> >
> > I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI =
on
> > LVDS ch1). It mostly works, but I ran into a few issues around DI routi=
ng,
> > LVDS format handling, and DC enable sequencing which needed rework befo=
re
> > HDMI would come up reliably on the board.
> >
> > I don't see a v2 of the series and things seem to have been quiet since
> > November. Are you planning to post an updated version?
>
> My plan was to enable prefetch engine support[1] for i.MX8QXP display
> controller and add device tree for a whole i.MX8QXP LVDS display pipeline=
,
> before adding i.MX95 display controller support.
>
> Unfortunately, it seems that Marek is not a big fan of [1] and I'm busy
> with downstream development so the plan doesn't move forward well.  I sti=
ll
> think [1] makes sense(maybe I need to rebase it on latest drm-misc-next),
> so I'd like to see review comments on [1] and hopefully people think that
> the overall idea of [1] is ok.
>
> >
> > I've accumulated a fair amount of rework while getting this running on =
the
> > FRDM. If you're not planning a v2, I can clean things up and send one b=
ased
> > on the current series.
>
> I still think that i.MX95 display controller driver should be in a separa=
te
> driver, rather than sharing the same driver with i.MX8QXP display control=
ler
> like this patch series does, because the two display controllers are quit=
e
> different as I mentioned in comments on this patch series and in discussi=
on
> in [1].  Also, the common part between the two display controllers should
> be extracted to a common helper library as I mentioned there too.
>
I agree with your direction. A separate i.MX95 DC driver with the common pi=
eces
factored into a shared helper library seems like a better long-term
approach than
extending the i.MX8QXP driver, given how different the two controllers are.

> >
> > Thanks,
> > Piyush
>
> [1] lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941@nxp.c=
om/
>
I've had the current series running on the i.MX95 15x15 FRDM (IT6263
LVDS-to-HDMI
on LVDS channel 1). HDMI now comes up reliably and remains stable. The mode
and timing are correct (1280x720@60), the LVDS/LDB pixel clock is at
74.25 MHz in
single-link mode, and the DC plane is scanning out a linear XRGB8888
buffer correctly

The one issue I'm still chasing is color. Timing and sync look
correct, but the colors on
screen are wrong. I've ruled out a few obvious causes and see the same
result with a
simple CPU-generated test pattern, so it doesn't appear to be GPU or
Mesa related.
I'm currently narrowing the root cause and will report back once I find it.

While bringing the series up on the FRDM, I ended up reworking three main a=
reas:
- DI routing (display interface selection and pixel-link to LVDS channel wi=
ring)
- LVDS bus-format handling
- DC enable sequencing

I have time available to help move this forward. I'm happy to continue
testing on the
FRDM and provide feedback on the reworks I've made.

On the other hand, if additional help would be useful, I'd be
interested in working on the
separate i.MX95 driver under your guidance and posting the resulting
series for review.
If that sounds reasonable, I'd be glad to coordinate with you on how
you'd like the work
structured.

I'll also take a look at the prefetch engine series! Thanks again.

> --
> Regards,
> Liu Ying

Thanks,
Piyush
