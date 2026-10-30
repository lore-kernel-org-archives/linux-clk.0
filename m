Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793336464;
	b=d8YdQdvYPw14EfN3q4ftve4/8OgaCaLNBeKv0jaG8OQ/NKf4jpRoJBjMw5m6cvY00i+I
	 bESQLVLu0La1VoqqzJtfph0O/3yla/Ly5mDfgFmx+ZZXHGK06CvbS/IuQg63o4aHXuxjq
	 YIFn8dF/wEH01aWOkwS/SQfmKgB8DyxYvU+YrMoa42D9gxzTOvNjj0/j9hP764WZiTcd0
	 SZttCoASk2212xVqKIA4Kv5Y3tKU2YWrcz0N3N50k0JhVX2qJ+gim9AVrChHmOtUJnSVZ
	 TTsOAeccxT6Rn47RGO2WURJBK+MWoaz+NEmvC9wDDqXL4zg02l4cXuSahbKusfrxdrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jVHkdup9h6VAyVXa9WHVnyDXMjAy2tnvxXwmB5v5HJk=;
	b=3SNB6VJdDy0GgvVyVH6pXSPDP7wLSn1lzfSSYn2jzlNh4JPvKrEb2+ASfHt3HSQvjTVc
	 +QQTnZYn51Jfs9LosWwi5cMr8a07m2gMHChI6OKFijifzF1jM88x5x1Up6aKl7NATEcML
	 tD25y21g8zSSTO5AWk3om/S5vyddjGoOUwegr4vK8ZtVsyHWY0Ul4D3zc8k3ro/VOD6F3
	 oJXaZfFiRsi+0NxdTKphiKfFskYintxJ07+MXre4Hj1QGCNv/isFyR4hlXylEOyDYgN/Q
	 9yVMzZu722y1SHB5aoVf5Ot6SWWkIit4AMln969kCZe6CJCRHw//aWDXpNs0pgMiFfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOqAbCXz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB8606A31C
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 05:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0AB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOqAbCXz
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-82380b0f55dso163493a34.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 22:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793336463; cv=none;
        d=google.com; s=arc-20260327;
        b=XdSdj6molHVWq4FqnDtsBHp17tiJWMXejJqI5kBfc2HmkC2/2SaMZMKRvKwt9N+Aae
         ThgdXWRLTu3UBrua9+R/mjoZU9rfp6imApjMsNwyO8bEpbYFQjNHmutdO5EPxK8FEJA3
         ulctLizmCFzqbCuCNVg/wMo6rkHQqsjK4XjdulfSs1xg/5qhxY7DFFBouwNPWRnCwVxt
         oBUrTqXTI+bQFDCYGmQnfWa5dLCn9XcB62lFgbWD9XyX3Pc7EfuIAX+j18uv/S4hCAls
         kW0pipJKPWzAbv55lsOc3hmo5oi2S4rtN04aDWR0phCX0o28HaYZXh/6Y1ibVXBbFh0v
         gSCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jVHkdup9h6VAyVXa9WHVnyDXMjAy2tnvxXwmB5v5HJk=;
        fh=CGaRV0hNAj/Ej2m+Q7DVxCqOUjQjcak+4q/9ZDnV38U=;
        b=IY5PtPwbRch35lxyVa0m6BZrTcqLboMfUugyNhDKtfKReoK4YSgudrKSJ/btMqbYos
         qRaLCOooPGrDtlE3tynzBFABojhbKDUipw+ikfPJIZQ0RIWiuLYnzwF66uHvSk1mP3pf
         X1eBEIzzTSSx98ODbSD7b8HnswbZ/Xb9bGaM5N/m34tUy/K8Hh6dCOYIVGpsDNOADthd
         lwJoKvVHYeAHBxqYzAmcw9d3MYzZBF8jUBl/AaQslt3/Sc5uoBnNm2jmFKR+r/vTj83S
         x2qozYV9lJ0sMCtdTUEiI3mkYq6meNBPvLe64V+iuDPXpvLA09YNyaxLPDqMiZHFUA8e
         6hRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336463; x=1793941263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVHkdup9h6VAyVXa9WHVnyDXMjAy2tnvxXwmB5v5HJk=;
        b=TOqAbCXzDcrtYX6aSoZuVbib/4rYY24Y4DCQ3LhuKWvVCS9F6xZT4Rwrv/i4lS4wff
         KKJxtYshSNmvchuSCdG+iFIHj8/IikdGEOYLr0dE4P96PYd5KkeNPHB2ImobORQni4Hd
         fIDPpVv0cTbDaHitAQWnU3csBZNaq2MlPSh3z2jNde5xMTHVyxn6Ja7BmPVqcCvxLE9i
         36eiKXBNf8zAKGHJMzrnjV2LhHQap4VdgxW9KfkCGrNGX0ruZUYM2qAOoFqDj6HoMg9F
         8UWY7fqDKQc/tmVHO7IGrGtOb/9k4AJO8akbQDrp8AqOvNVeYukMhb0OkoSIMVcSNkxW
         Rphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336463; x=1793941263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVHkdup9h6VAyVXa9WHVnyDXMjAy2tnvxXwmB5v5HJk=;
        b=H9jxVWJWWGdCJe40ESHDFEDmL9sxZBfQEIiTt3iu1XP9W9wMuh4kL//azMS79ZjQE6
         zJBeQHLkNiH0Vdo30N5m6emISaTiLWZZSWLvgBMOFQZoe7UmVk26Dr7w09tS4qDfJt/7
         JDrybH5w0M++po0/OqK2eP36ff5etC5Ww145hX82MBhgZVQYZ+5WITWLyMm9yyBirVtP
         uEbAWLxUckDDoDUKc3TvBBvNsQLQWgs3Z6+y/xCrB75qoMUcY2ZUzSGqvVc+Ay/a1fCC
         qQQgmh9bEy/VzU8h73ZlNwIZCWeaT4ADjWmiRg7jw5CO2cumRUX9IVD60bLGF2KXV94P
         gozw==
X-Forwarded-Encrypted: i=1; AKwUvByFfnP3UVKSScAEFv+aTdQaiwI2d01zk/14L9knnf1+UaUmtD3oohLmNsxuQBpvsTdZgdN+3c25N1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa33B2w398tbDhBo2/PJGmiOqCXc5953NBHPl+EIwGpg0v/Kb2
	a/Vu3K8v7Jv94NRJq/DwNoo1v+OFpTYrmVaE+V+3yQEZnTWEbYCjaAGgp9zHHUR5JZLwCV17BHX
	M5Ye4sWe8/UwIQJ8mDEq6GC6Xkxj+xz4=
X-Gm-Gg: AYBFou2IxBfQmKSfIm9KepzrwCSfst4SFgUz99/HukpTqQWo9oydhe9RURdEoi+zFZA
	zup9FP+i1Eh9+97NygLzh7T5Dzt6mKR8V/UB0g4MJ+P8E5WOnUdbVvPC7Dj1zDrPCFgMyFcBSY7
	s9GwNT5gXORSqs9lAfuAAX8WZ3wyfnhHGb9+cLkbDp6zsiO5rqsBaYP9VtP1xoDLyxQoHGaNR3E
	kGCUPrriA0s7adVviRa+iQC36Ky0ZnWwwMsti45065vmNUtPRVeQZNtN4OzM0cZe2SXyxq3rPz5
	DNZeyIaRNC4juuQ4RZu/bAR64Ff+CuZalThT1nNpu5NfeqPcsIux6r2VmOrHV5n6Dg/BcxPRXsf
	tJpWBX5o5wyyz7Yx9wiFvGH4Plb+fvuJucIoJbbNshQiQiut1YtUYF5ASQHyc+p2PbSIq9w==
X-Received: by 2002:a05:6808:c122:b0:55e:fa63:7001 with SMTP id
 5614622812f47-5640ddca9edmr954504b6e.36.1793336462734; Thu, 29 Oct 2026
 22:01:02 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
 <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
 <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com> <CAKTNdwGTacFvn5BEN+iu0OBG2BUas7Vfj=YYF8OhAhNq-9kmyg@mail.gmail.com>
In-Reply-To: <CAKTNdwGTacFvn5BEN+iu0OBG2BUas7Vfj=YYF8OhAhNq-9kmyg@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 29 Oct 2026 22:00:36 -0700
X-Gm-Features: AclHuK91Kq4AK7MRfCEoN-bxDWWEQLSESXtbozHlwJea6SWMh0uWvQ7bm47NBQ0
Message-ID: <CA+E=qVf=oBf9a=nrN-F2gGGY60+Gfuj3NMvuW4pWAdbU6NKceA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Alexey Charkov <alchark@flipper.net>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 11:31=E2=80=AFPM Alexey Charkov <alchark@flipper.net=
> wrote:
> > > I believe something is hardcoding the divisor (or leaving it at the
> > > power-on default) in the actual DCLK of a VOP which the HDMI
> > > controller uses, instead of modelling it properly as a mux (frac/div)
> > > feeding off VPLL via another mux - both perfectly representable in th=
e
> > > clock framework and already envisaged in the clock driver, making the
> > > PLL table patching unnecessary.
> > >
> > > Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
> > > depending on which one your HDMI controller uses)? Your clock summary
> > > already shows that something is assigning its parent to DCLK_VOPx_DIV
> > > and the latter's parent to PLL_VPLL, so rate changes the current
> > > driver code does on VPLL propagate to the muxed and divided downstrea=
m
> > > consumer as a side-effect rather than as an actual rate request.
> >
> > I don't think it is a reasonable ask. Wrong clock for the HDMI encoder
> > would just result in non-working HDMI output and no feasible way for
> > me to debug what is wrong.
>
> Hope you have a serial console or ssh connection to the board. If it
> doesn't work you'll know soon enough.
>
> What I'm pointing out is that the clock setup implied by the current
> dtsi doesn't make much sense: VOP's dclk is driven off VPLL via a mux
> and divisor. If the encoder's pixel clock is truly driven directly off
> VPLL then Rockchip designed the muxes and dividers for nothing, as
> they will always be no-ops. This doesn't square, so something must be
> wrong, and I believe it's the dtsi.
>
> I'll be happy to be proven wrong here.

Hey Alexey,

Sorry for the long delay - NVMe in my laptop died and I had to wait
for a warranty replacement to arrive. I would have bought a new one if
the price wasn't ridiculous :)

The dtsi describes the hardware correctly. The HDMI PHY's reference
clock input (TRM Part 1, 1.1.11: "13.5-600MHz input reference clock")
is wired to VPLL with no mux or divider in between; it is not one of
the CRU clocks in the TRM's clock tree at all.

That's exactly what the commit that introduced the "vpll" clock says,
from Rockchip's own engineers, see 5e3bc6d1ab48 ("drm/rockchip:
dw_hdmi: introduce the VPLL clock setting")

This bug report itself is a solid proof of this wiring. With VPLL left
at 74.25 MHz and the VOP on GPLL/7 =3D 84.857 MHz, the monitor reported
the mode as 1195x768. 74.25/84.857 =3D 0.875, and 1366 * 0.875 =3D 1195.
The TMDS clock came from VPLL while the sync timing came from the VOP.
If the PHY were clocked from the dclk mux output, that mismatch could
not exist.

The mux and dividers are not for nothing: there is one VPLL and two
VOPs, and each VOP can also drive eDP, MIPI DSI and DP, whose PHYs
have their own PLLs. When VOPB drives HDMI from VPLL/1, VOPL has to
run from CPLL or GPLL through the divider, and the fractional divider
exists for DSI panels with odd pixel clocks. For HDMI the divider is
legitimately 1.

This is also why the PLL table patch is needed under any scheme: the
RK3399 PLL driver is table-only (rockchip_pll_determine_rate() snaps
to the nearest lower table entry), and the PHY reference has to be
85.5 MHz exactly because nothing between VPLL and the PHY can divide
it.

And the VOP patch doesn't hardcode a divisor. The VOP still makes a
real clk_set_rate() on its dclk at enable time. The bug was ordering:
mode_fixup() rounded the pixel clock through the dclk while VPLL was
still at its old rate, so the composite chose GPLL/7 and the encoder
then asked VPLL for 84.857 MHz, which the table snapped to 74.25 MHz.
With VPLL programmed first, the composite picks VPLL with divider 1
because it is the exact match.

Regards,
Vasily
