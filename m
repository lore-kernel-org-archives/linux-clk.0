Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793347206;
	b=cWPSoS4kfA/xTncH+2OA9nPfQ4kaSv0Wxw4xDwT/2Xxf30QQdPyoTcJsVSYi5UJGX9U1
	 WxbifJxJ2i+ao+c8JXqETSfaG95U7+g7GdwqbtGRqmSxqS1cubKmqpEPBQV8TVmRKzPOk
	 70Y+SaO6ok1DhldEcULJOXS5IyWyszCBIfpS14HjK1qqG3oPYIgPkFo7vbhA7iKXJewqb
	 Ep0ASyZWhKtdygCaHVTxyufdpscAcqgyA/6VOo18OX8KgAomCv9bhhm83XgVMMMPrPIRT
	 cdN6O4UJaRIddfmbAagiA6zOzp4OksAqGx4NTabj2lpaZzVgts7hygMYAUhOYfYMzvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q/eIx/IUOdi7y2UVsh8BBzkkFOgj24Cn4YadoL10m2E=;
	b=y1hdeiSVC7yes4clo4uuE73yFrAEgEbxJe2Aokk++wRiHRlDkexEmR1ClXJEl9bF1OAB
	 iMxA6NDltwAQHlnhWRj84mThycMGyEuxMiEeaQllzsrdhp8r3P2c+3KSUY5QjDRWodPqr
	 Ta1eydfuSgP68skAaMwVCW0MWb818Ox7Qt97OElhnyRYukPC/XyAZOXEkBMH1P+5eluL7
	 h9dLEU9G8G4HLX7up7iqpxOdI/ZBiShFckSGZkxszj57rQQx3qJDXK1kyqc9KVFnWu8M1
	 xrLs/2HKyLIiM0CuooaFEaNRgKG46ca23CN/hC2393w7FYWlDwpf7BeNKMQjGZb+O2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="Fp/hJv5o";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1002606A31A
	for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 08:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1002606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Fp/hJv5o
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4c9abc1824so54445266b.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2026 01:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793347204; cv=none;
        d=google.com; s=arc-20260327;
        b=sCRUduryHex5/OWhTI6JuhnTSwjFa2Zq3wn1uO6Ou2Nr9kPBJhNI4FOVgvSVKfhtBq
         n+aCns2cD/U3YFu/4aIRN9ojl6b1e4vntr3LjAHJFrgUlj883t4A2TYJ/y/SbJg91JZm
         OS75oYamLNxW2npg5FIF1+zybcrnbKb0hJPHAXJsVFwXcE4GQN7qa9MknChyRv3oHHPB
         IhX8uTSsVfNXqDRzcRYAL13dXBshaHGMT7Q4vwfvv5LH8d5+yqBMTTl/mMhMSKvitJFx
         iPw/lEX/ARBLFi31/5QRvVfeaw0lReHfj2OQl5C38psVQGmAd6yw1Fh6dWIXTh+19RYp
         7Kxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/eIx/IUOdi7y2UVsh8BBzkkFOgj24Cn4YadoL10m2E=;
        fh=A/FllR8rhd88dbN33YrQvDXiv/TG93P9Ze4mOniynB4=;
        b=e/1mh5B198Zq53YqknFUh/UXvQT2s6frsEPIBG1eaRpw/aO0OkTDGTS+3RKdoStZ2r
         9rcglWbyF1sehOHnlrLvMZFIbOHAJWW5TCdUU/YlFKCeDVHPlZIAMQYZU6fBrx+QVDIK
         tiyzPhvc2ifv4QPnlbqaVB0w59lmUYv98m3Os1CuqLVXeezBwwBoXRkGhd3Dgwa2o4fF
         vSSE8B+psvv8O3wtoc9Untw0oUZu0Ug/gjp2cBohVvWyCG9SStJ9qUXwRPd5wPSrstug
         K70Yllsmo5vHavGX4dbJMMmUyBTZe4axTOasr/EBxK/Vy99QoAVEPj0FnuQtCzp9sO1/
         /VPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793347204; x=1793952004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/eIx/IUOdi7y2UVsh8BBzkkFOgj24Cn4YadoL10m2E=;
        b=Fp/hJv5os+WrWxiPlwDww/wfj1j3ssC5ZhVTksXPOhseZXnyTtq2A810mxt4TEz2zP
         TtG81G4CV2mb0RbBDdZaGr500bY1UTu0wrlMNfP6ddUGaZj4FfOUD+ND50jpBY6o/wpE
         5dooKKqRCPdrlW5iK14/GM/s/KGHGem53Nh8R/0GIeJzdECpPnVsSjilA3NHvKm380i1
         hA7JrBT2LkSkZ/DIjHYUmRa4CS8ZmQgHDqI85FDcPb6M7qu+GQo2WMXuzCJ/rBWVRiKK
         hPWTR1o05o2NkBl0ugTQ0Oam2On/i+jHaJNVMCpbojso1KUCIAB6DE/RamiyjkW6s67B
         rH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347204; x=1793952004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/eIx/IUOdi7y2UVsh8BBzkkFOgj24Cn4YadoL10m2E=;
        b=1exdzraS7fCi5ugrsQduHQd2o01Ibk8LLhXXsn57OiFVEbJEA6C0Ppdtu1mu2oPfXR
         FSzzHissBNDJnXPphrFWqnHfhFBM6Ynresd1WznS4OcPdPPGa2q+VutyBT1m9dzcNnmV
         QyfDN3hI28o99ULi5iSWC7aWym8I71ah2Svas44QHTqwgDOLZR8MzYvW4i3Z+57AnTp6
         ilWIxCqMgB6S6Ree8s+kfBf76nOkuL+fkbmYgjQyzBKQBGIhml1Gy2vVjElDLphU+1sz
         z8OSe17hotkaBoW+PwUN+eW/BxjsSOzqPwxRd2Gby59rcTPMglx9meke2GhIyPncQ1hH
         Z2Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzcg4AzPNQFv0TnXY/zyUjOR5/rkbL8tUOeLM1HQk4kiOkwfAjhVsT46d0Of70HU2/TfSnmxwKq/EI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuQMY+K9MchGkwSrZybNqs6P/8GQoTZJebdmrxJcI2xlP+Q14L
	T1YRsUxjflkhanozpqZ8EPtNZfNEpQmxQpGhIoBrxP9kcgHXPyMbxVHl/URoZ9tJOKbcR9bNHXz
	rsvH8vJK44jBwoQjSbPdJC1MXrvtWm+h05v/MeOu81w==
X-Gm-Gg: AYBFou3H0Xzw5ol8VSleqv1eQ7HGjVdIIU01cGLlGyAQ+rbCsjAKkE2gXClijCDmKGn
	s5bsTD/gVwGg2VjMHGMOCBj2+YeNmw6WeV89LSRw7dlMVVuGQvRr0XJA5o9HPLjsrBtDoRb/pjZ
	pfYO18KHdZViR3L2g3fm6vddhyY90owcPX6sTlZPnaBLcpNePw2Mgkj8dmCGapO6jIT1f66yVlU
	XJU98lZaCh7exa6xRgIaEYNWEBsXQFcbRdqVS6cmWAzrIS6H241OUZCoCBGyvvBaYCCLkjcTOrE
	IZb0f+IYG7Co+JcEknFzJFrQqT5ao7dhZMij7l1DmWHjuTc/WXStNPP8n5Pir7jTmfw93KtVx50
	iaHDDgIlezPYoRtYFm5xQZeibJwEWcLiyjXOE98z1U4PeccRN9tpiRwfMEfNDpepR78jm0Q==
X-Received: by 2002:a17:907:c23:b0:c49:cfcf:8d7f with SMTP id
 a640c23a62f3a-c4ca7ae8ad6mr121607566b.46.1793347203897; Fri, 30 Oct 2026
 01:00:03 -0700 (PDT)
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
 <CA+E=qVcwtnU_Gg6_oFmWqMpCEF8vOvB_G+H-ihfbiAr0PpFUJw@mail.gmail.com>
 <CAKTNdwGTacFvn5BEN+iu0OBG2BUas7Vfj=YYF8OhAhNq-9kmyg@mail.gmail.com> <CA+E=qVf=oBf9a=nrN-F2gGGY60+Gfuj3NMvuW4pWAdbU6NKceA@mail.gmail.com>
In-Reply-To: <CA+E=qVf=oBf9a=nrN-F2gGGY60+Gfuj3NMvuW4pWAdbU6NKceA@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 30 Oct 2026 11:59:55 +0400
X-Gm-Features: AclHuK80eGfXzrhDU1BJmzUNyq0YUUcHy3czLcESvjD2RbRa1URB1Gh73rfRLng
Message-ID: <CAKTNdwEiNjjX3DgBm5whH0HHvAfZQFgF4LhKf7PJ+1p7MJ=QJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vasily,

On Fri, Oct 30, 2026 at 9:01=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.c=
om> wrote:
>
> On Sat, Sep 5, 2026 at 11:31=E2=80=AFPM Alexey Charkov <alchark@flipper.n=
et> wrote:
> > > > I believe something is hardcoding the divisor (or leaving it at the
> > > > power-on default) in the actual DCLK of a VOP which the HDMI
> > > > controller uses, instead of modelling it properly as a mux (frac/di=
v)
> > > > feeding off VPLL via another mux - both perfectly representable in =
the
> > > > clock framework and already envisaged in the clock driver, making t=
he
> > > > PLL table patching unnecessary.
> > > >
> > > > Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
> > > > depending on which one your HDMI controller uses)? Your clock summa=
ry
> > > > already shows that something is assigning its parent to DCLK_VOPx_D=
IV
> > > > and the latter's parent to PLL_VPLL, so rate changes the current
> > > > driver code does on VPLL propagate to the muxed and divided downstr=
eam
> > > > consumer as a side-effect rather than as an actual rate request.
> > >
> > > I don't think it is a reasonable ask. Wrong clock for the HDMI encode=
r
> > > would just result in non-working HDMI output and no feasible way for
> > > me to debug what is wrong.
> >
> > Hope you have a serial console or ssh connection to the board. If it
> > doesn't work you'll know soon enough.
> >
> > What I'm pointing out is that the clock setup implied by the current
> > dtsi doesn't make much sense: VOP's dclk is driven off VPLL via a mux
> > and divisor. If the encoder's pixel clock is truly driven directly off
> > VPLL then Rockchip designed the muxes and dividers for nothing, as
> > they will always be no-ops. This doesn't square, so something must be
> > wrong, and I believe it's the dtsi.
> >
> > I'll be happy to be proven wrong here.
>
> Hey Alexey,
>
> Sorry for the long delay - NVMe in my laptop died and I had to wait
> for a warranty replacement to arrive. I would have bought a new one if
> the price wasn't ridiculous :)
>
> The dtsi describes the hardware correctly. The HDMI PHY's reference
> clock input (TRM Part 1, 1.1.11: "13.5-600MHz input reference clock")
> is wired to VPLL with no mux or divider in between; it is not one of
> the CRU clocks in the TRM's clock tree at all.

The TRM unfortunately only says there is an input reference clock but
gives no detail on how it's wired.

> That's exactly what the commit that introduced the "vpll" clock says,
> from Rockchip's own engineers, see 5e3bc6d1ab48 ("drm/rockchip:
> dw_hdmi: introduce the VPLL clock setting")

That commit indeed mentions that there is no divider between the VPLL
and HDMI PHY. Looks like it's our only evidence, but I believe we
should trust the information in Mark Yao's commit message, given his
Rockchip sign-off line.

> This bug report itself is a solid proof of this wiring. With VPLL left
> at 74.25 MHz and the VOP on GPLL/7 =3D 84.857 MHz, the monitor reported
> the mode as 1195x768. 74.25/84.857 =3D 0.875, and 1366 * 0.875 =3D 1195.
> The TMDS clock came from VPLL while the sync timing came from the VOP.
> If the PHY were clocked from the dclk mux output, that mismatch could
> not exist.

Fair enough.

> The mux and dividers are not for nothing: there is one VPLL and two
> VOPs, and each VOP can also drive eDP, MIPI DSI and DP, whose PHYs
> have their own PLLs. When VOPB drives HDMI from VPLL/1, VOPL has to
> run from CPLL or GPLL through the divider, and the fractional divider
> exists for DSI panels with odd pixel clocks. For HDMI the divider is
> legitimately 1.
>
> This is also why the PLL table patch is needed under any scheme: the
> RK3399 PLL driver is table-only (rockchip_pll_determine_rate() snaps
> to the nearest lower table entry), and the PHY reference has to be
> 85.5 MHz exactly because nothing between VPLL and the PHY can divide
> it.
>
> And the VOP patch doesn't hardcode a divisor. The VOP still makes a
> real clk_set_rate() on its dclk at enable time. The bug was ordering:
> mode_fixup() rounded the pixel clock through the dclk while VPLL was
> still at its old rate, so the composite chose GPLL/7 and the encoder
> then asked VPLL for 84.857 MHz, which the table snapped to 74.25 MHz.
> With VPLL programmed first, the composite picks VPLL with divider 1
> because it is the exact match.

Ack. Thanks a lot for double-checking all of these - it's great to
have your explanations recorded on the mailing list for posterity!

Back to the patch itself. The new rate you're defining is consistent
with the existing entry for RK3036_PLL_RATE(1368000000, 1, 57, 1, 1,
1, 0), and the parameters are within spec (VCO rate of 1368000000
falls within the documented range of 800 MHz to 3.2 GHz). Feel free to
include my:

Reviewed-by: Alexey Charkov <alchark@flipper.net>

On the existing 1368000000 entry, I'm pretty sure it would produce
less jitter as RK3036_PLL_RATE(1368000000, 1, 114, 2, 1, 1, 0), by the
virtue of FVCO=3D2736MHz falling into the higher end of the allowed
band. This won't apply to your 85.5MHz rate though, because the
required divisors won't fit in two 3-bit registers.

Best regards,
Alexey
