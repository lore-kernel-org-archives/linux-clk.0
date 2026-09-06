Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB624315F
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 06:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788674948; cv=pass; b=uVasvfuOUEVg+PLdW+bMPwAPtEZGz5YU1GhApFec4hAx1J+WLcmBl07nfVgkfnjxmQFuzS5UDM7QEmrozfQ41FVDMwIy/DUR+nEJTsPiqbQdoSw2FPKo1DopfuBuD9Pg4qSSK5r9g04jZc8wM4ng0dX9hF0/V5kehIO0+BRCq6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788674948; c=relaxed/simple;
	bh=vdC57ddqvGP0W5KwBTBkhOYJWRkgqf1DhL7jKk6+43U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcCc90KEa/+MnUdNZqooyIfX4uuLWDpB0DcCPcChNpF/jp8oiti6owlPHyGl1LB1dD5ZWf8+z8UC/mgHDUxwkjsDTE53Cv3Edwq7M8dMR/ZKTsJxJfU3RsSPFAbUaGijDp/gwWA+6kdkx1i685ONXKdiukVy1FYek3EfVsR/z7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ja47fZW0; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ja47fZW0"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b145a9623fso1215763eaf.3
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 23:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788674945; cv=none;
        d=google.com; s=arc-20260327;
        b=f0xJ27AYV+wbgjEnzkkvPvbbR8KwC3EmCTB/fP33cgicQIsCGB6ZKPPw1uoYSX0Dyn
         unqRB/CJppGGiNTCKWh0QlkpwJynyGvENzTLuPchGoTkvjbYUlR2d1h6rQvasgHZwqEv
         mpIqWdExDoZhHyVfcl13AV/rmBk+JDBWIs5W9V+i6QKWC7fvt4RtcA1sYnKYRxXvBe9J
         Nnway9fnuBPZsSJTRSsjXbLUFwPXTv5qJAq2TOWggpyu6yowjOPjkFTdN3H4ubQ4pfCs
         LmUt396nRdjwJC4M1pGlCQF+pxL9nVSTYHdNBYYNgXhhV7HjIqgDId9Nyyv7CFuZy0Px
         4UHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vdC57ddqvGP0W5KwBTBkhOYJWRkgqf1DhL7jKk6+43U=;
        fh=RJNl2GQFHK3htCbpN1ftHZLQZNDa0F3Bz71Lje8O7Ng=;
        b=p56UBe0m8t4ee/nsbFTnlEhxKWbllhX7wBcic7OQHwEQkISvV50umZSewfV9Idwy3j
         X6hf1ahlhpKeHCkljGTJBaxKwqbmUp8dJI5UVRzXsuGv6UJd7JblW4lE3P/iBy0nghi3
         uz/gOHJG/R74GZO+jOEDyskd7iM4k4Tm98uvbcqdB7dzdKuoySSsj2RThif+TALtmutA
         vIxbikFomGBLZci2CMToKZHU4//FZ95B8sVUAirSQVSzsgcirz6WWu2KTpyCQsRdQnyp
         f14bmRZVNpojQoSap0v1wuIVqn9t9jS1lgLc/Jqn/5j5VgKIDdmlCWLLPyi5Hi1vb/cx
         vj2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788674945; x=1789279745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdC57ddqvGP0W5KwBTBkhOYJWRkgqf1DhL7jKk6+43U=;
        b=ja47fZW0Wvabc81V/mPDcEjmXSTAU2ddNGO0UdKzCodljXBwOTKsDhNHEWJ+uMsS38
         dKjJ+n6kQVodC0xKCxPm2eDf5Vy/5+8W07vIc3p7Kg+SeVeqc4XuYLYaVM45qRNv7nLb
         wumNhcJ7Xf8aBVHBleITx7o/yFlwW2IfVc1S0rbiI3fgIp/HtyoTYNX9Zi0tT/gNXhYJ
         L+bRI5gE8YUkhuw6cs6gSDqbOxdTp7x5pZPbxwYK93jyDbmcTwq9kNku6dhP1KVa0mQy
         kTvvt9DNTIDQCxi4GovZWbsxhDtdXWHQPMK3cocfMxhp5U0jEXPbWXuJ4PoA88ZDzzn5
         LkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788674945; x=1789279745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdC57ddqvGP0W5KwBTBkhOYJWRkgqf1DhL7jKk6+43U=;
        b=V6VLUwoLGEROhZH4l5gxUKCavGsEkpBfEGfdTc9krvnBxhAHLLvWs9WPc+v98HQ7OH
         S8z6Inhr2M2WlFo4SqVyhtd9EFTiBjAog5noNF/f/muhBWBwSswJZT9qID1NjNjA158U
         gA2n6QPP0hZa1KfzlxhqESOZ8iTgeJmp7Ni2m6f/CmxV0sgxzZJivNKPteuj8jxb2ayi
         5TD3IthIEjNOS0X8YF6/CTduFNZvmSqxH812RJHMfhP4nt/FfN9Lkb6Qrlyn20yy2+zP
         uTmo4C50JFJTFUANsxUaV38t6A2lx2V7DLZnr7esZSCwZs6kJOfQtQVfGWZnwjw5FcmW
         u/pA==
X-Forwarded-Encrypted: i=1; AKwUvByk/FVNAfpQJSoQJ9dP+r03cRrcAYMQDsXvCLzvLAGtbjXG887I2YhpOEWbrTqbmI3zYwo6DW+ui9M=@vger.kernel.org
X-Gm-Message-State: AFuF++m2AHViy1/yVGLa7JFf5QD6NVe3rrMq4jOI+oS5dBF9tk/91VB/
	kXxymgEwwiblv9gnFpnrrSeFp2K+uaeymjEYTPyB2ltk2ljIEq2o+IGhKjYB0y0Z+j6sgDe45o7
	uqKerOKWXDiyafbH8/rSqqJ++Ha7Zoj8=
X-Gm-Gg: AYBFou34kZjaAgzBvienjEs0EIi4xiifACjv8s5Jba+9f7UKFjrm1x769s5WGAO+WYS
	FdFI5cdGn8Ke7ILLsPhzo1sHJeDTPnzUrsWBVI+FtbyhrCYZSZxOkb2N22rLAjgdWbPppC4GplZ
	V6b14vVKxHZRogHk/XSgmy7M8Z9NtvXaQGWGja0SSPW0rMgjqxHV8C6k1ZiqENQNx5tYT6uHofo
	ULZN0gxxM/4r40TiUqE+79oqTnbd7SgIRNHyzZmjmc0Grb6flqBaniJaQ4ctpAQusCBS9Q3sXBw
	rkrzjlSmsLGNlHqsKdXcix+kOe2iP8Mt3VncNpHaCYXNGm0jXR7+mw==
X-Received: by 2002:a05:6820:1787:b0:6b7:8396:f3ce with SMTP id
 006d021491bc7-6b78396f87bmr7383804eaf.48.1788674945534; Sat, 05 Sep 2026
 23:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com> <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
In-Reply-To: <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 5 Sep 2026 23:08:39 -0700
X-Gm-Features: AcwNN1XV6eaC-hb5tnT2MKyn0nOE60V4HfLSORk_N-jEL_PXVgmbyJgM3d_DMic
Message-ID: <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com>
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

On Fri, Sep 4, 2026 at 2:36=E2=80=AFAM Alexey Charkov <alchark@flipper.net>=
 wrote:

> > See arch/arm64/boot/dts/rockchip/rk3399-base.dtsi, hdmi ref clock is
> > wired directly to VPLL, and dw_hdmi-rockchip calls clk_set_rate() with
> > pixel clock for ref clock, see
> > dw_hdmi_rockchip_encoder_atomic_mode_set(). So at least in the rk3399
> > case VPLL is supposed to support the required pixel clock. Without the
> > first patch 1366x768 mode with 85.5MHz pixel clock is just rejected.
>
> I strongly suspect that the dtsi doesn't describe the real clock usage
> here. The TRM for RK3399 doesn't show any "ref" clock for HDMI, and no
> TRM-documented VPLL users look like anything that could connect
> directly to the HDMI controller.

See "1.1.11 HDMI Interface", it explicitly mentions 13.5=E2=80=93600MHz inp=
ut
reference clock

> I believe something is hardcoding the divisor (or leaving it at the
> power-on default) in the actual DCLK of a VOP which the HDMI
> controller uses, instead of modelling it properly as a mux (frac/div)
> feeding off VPLL via another mux - both perfectly representable in the
> clock framework and already envisaged in the clock driver, making the
> PLL table patching unnecessary.
>
> Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
> depending on which one your HDMI controller uses)? Your clock summary
> already shows that something is assigning its parent to DCLK_VOPx_DIV
> and the latter's parent to PLL_VPLL, so rate changes the current
> driver code does on VPLL propagate to the muxed and divided downstream
> consumer as a side-effect rather than as an actual rate request.

I don't think it is a reasonable ask. Wrong clock for the HDMI encoder
would just result in non-working HDMI output and no feasible way for
me to debug what is wrong.

Regards,
Vasily
