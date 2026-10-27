Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793073221;
	b=BeXPIauZOqjk176Ly8kXQRlVp0mM0hTIecxdYFTIy3lLt0DfvqqnKbA0lo0l5JNE/1FV
	 eY/oWDzsowjkL+q3zWcJ6J2JOH0neODNt6qmXZzmjbl1FDBtsln2nSCZITAGxTg51UUab
	 rM3zGa8h40SkNfzFEIqm2+5Qb1+mMWHas5D0GhnCQAGwW8065RJqHPJDTokUzXqZ83jeh
	 wYpo6+wx94Eo5E5tw3kiQZO1iDftzGNreh52lR3R5MQ2wil7xeT/BEFwGNdHtXIsa+lNZ
	 TRUPLfBCvW0c5ivCf7FhnD2SY1C4yLvukAKL0o9hHhL1qJwQigGQNs6eNof87tEuOag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793073221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
	b=DUKLFE7+Zf71QZ3V+JahyYgSKllEP3iQHDzf0B+Q7ApUDuxDmlTJuVnRBPhopiBy/m5E
	 WErGVJHvjPI6VOnZgpyAYgEbwiE6IAQlXkxjpBctXspCjS2BSTHJjBXfiSwWDBBEiPL+T
	 XB0iFzFxzJJ7IlASWsNhGf+cM2JlaGiyT2ZTpXm0z4J54sbmWtfQaQf2LD6x+K0FEoX9k
	 r9PYv+85MiJfGrzU4h3sdw85E4nfX06yP1EhGKcQHsNsDQIHtALWuGoNdq0XsbTG1kzEs
	 U2tldP9DFr0gd/+XyyiehPIQBcpHQWJhd+1+Ka3qh99STKEn7xsHkviwC8GCvuDFYXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gmnM+VK2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF300606A31B
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 03:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF300606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gmnM+VK2
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ab432273c5so30340697b3.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 20:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793073219; cv=none;
        d=google.com; s=arc-20260327;
        b=BKxFENCi0hSKx7OrthLcAg9uCec1Z/Zx9F5DvAT4p11PRurFDvDEhhBtBXE6i+uncM
         iNhzbFgKqGVS7FcRd29Xldl3Z9yyxDK5tas9kL8gP4K+LXeRiBbdYVfUeHTkJcR7oX/O
         p5VRBHKnOOv8V6H/M+O1YhYi2I/L16kB2n1uBQgYYngx89bwkxNio+86paT+JHuNaRlY
         R6VacsuuHZj4hPczI5Yr1Pm0ihWNQ/y/D02biQNOqRq55kpbJMwKYJEt/9bbk9o/NtnR
         K8qRgqDux0LIsDt4/08e0FwylxfOlmXoYFXDKGH36ByukmpSxSqVoAaGDKKHltzNEwrM
         mRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        fh=2J0MAxo3id1tKriY5HflXMuUIWdjlTV4H9UuNxpnlGQ=;
        b=VKfHWoj3rMugnaPAUYR+Q3r4foXORhDjr3Fik2MVWGCF4WYsFG/NJghPbFGZl0zkEY
         ZxLZafL1dJcUnFnWNHfAjzZ7NYG53ZDuB7AMGZSIG22P2caj0J5fN/OUVmxRDo20U7Ug
         rdWfqJ9xPaoL2LYWPqRPHwOd3dIouZMcPA5TIRj5Vt7v/wHPt1ti+OMvZjTgReRYd3NL
         dUOFET4LTsmePdzOFD107m9Lt6u1U13ESqxCSOV1CuU+7579wLdg2a2yZpGhFETDj/lU
         QBVogQPM+N4rtLI4nUeckLUrf8rrtmy2sJbUfr0ExtDM7bGOV467u0KiFpypRHe4cKPY
         ZTTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793073219; x=1793678019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        b=gmnM+VK2FHfRvDryYWxHCVQLkzSvELGiTjKId2CX37exxagezn5WzGkm1vyJrhbg0U
         0ntd9vDW9Pf1TYBBZKoovsDv6XFh/lhEacqhJOcgDdqDHPrte5YSBQNI4vMKTVLIOpoG
         gClP0iuoiU3qugTeu9sD5xek0+2z6AgQW4IwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793073219; x=1793678019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63XdMIgmDxPufVfDbiuncQKIwymV4Xhq1c62N9eTtiU=;
        b=H2ZOnqrKDg8mbX/aeazoI5tWYS4uDH8PrH0wJXrACzVC1zgICYazACrjDyY37w0sRO
         9PzvZsxP+/grMicGkAbSPrR9JmVG4skO7inn8gUcHm9TaW35yu2S8Zm5j9mR8In+0AgB
         3wwojUeaK3UZzBto9F9tYxCKKY7d2fEBQHmTePAfWWomNLrXY/qPj43JQMVcZ55cwZqK
         9ethmWdcKA0DJLXWW2YjOjU4RMm94K4dEpre662IFbNeMpVjjwHZxV70oXB7tNYub7ys
         9H2o98EFs65IRtpBEvzxj48ikSrI2m6sfDuDaaBWTs/O7gwfEu4mDdn9mdJLi224GyWB
         V9ig==
X-Forwarded-Encrypted: i=1; AKwUvByl5MRzXRE3U14cAwguXpljXnEs/F1yFQjcIebQaS0QLwjF+n5amdTkc73oEbfSBovGck0HZTaixrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxvfilhCSOpV6z0ePhGJA/IMDhPbkQUYD5UbhZ6aSv1yrJSYAT
	nkOX0PaxOGDkViE30tIPk6l5Uod5l+qviEHzUhnV8wdNLEleQE0J5X+D3/CcIgs2so2yFgXr08c
	WsC/S5NlconBRZ79yIWTfGRlsUgrl30S0Jd6kadlM
X-Gm-Gg: AYBFou0DPQFTFumM991R99DY0dOvUyd/nrjf/H1/72Zwj0UCK4QysXRrx76CQqJlbhp
	oqNpnhUqbgeQSnOkeQxX7mdBvXeCT7BKpUMhMyyUnHb03w6q9JedWWhyuatc2IiZarhAiLUwgQ2
	gEQsfw8uZIgmKs5BsCnxsKG4IsbnGIYGbIl9EO2Ja5uT+GdiU+8NwWNSs9ym+ZojsaTzacpTxcj
	kqO+n4o5wsX/dh76oqQHqeO77Ie16tEfhfevb1CbnQQWAfflD7NKWI9KXiWY/UfBTRmRiBMtsbC
	dKl9si1fMF5sISRW/7ZOWQZI6VBmv1H0BZPtpfX1T6Sz5LKH1mPx3KqdP7oX59yrNnM7rEK1ywd
	q+XSi4YwN6ZNE5roauivLdyyUaBDxFK9TYe8Q2Ck1x6/9n8uZ6PTOfe6mUBqJfP0PZgE=
X-Received: by 2002:a53:b644:0:b0:677:d023:49b8 with SMTP id
 956f58d0204a3-67a4543f2demr5622996d50.66.1793073219651; Mon, 26 Oct 2026
 20:53:39 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027002419.2099708-1-nbryskin@gmail.com>
In-Reply-To: <20261027002419.2099708-1-nbryskin@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 27 Oct 2026 11:53:28 +0800
X-Gm-Features: AclHuK9fP-f3Hs_1VqqYwtoVLd1mzJ767fSZbB5u4Nm7cGL3-Cn95lyNs_2rirg
Message-ID: <CAGXv+5HiwX0R7a8gJeQMbZOB=AYEDUanD5ry6y0-X=wqO57RKg@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: keep the OTP gates shared with the
 secure world on
To: Nikolay Bryskin <nbryskin@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:28=E2=80=AFAM Nikolay Bryskin <nbryskin@gmail.com=
> wrote:
>
> The secure OTP controller (OTPC_S) shares three clock gates in
> CRU_CLKGATE_CON18 with the non-secure one: clk_otpc_arb,
> clk_otpc_auto_rd_g and clk_otp_phy_g. The kernel treats them as ordinary
> gates: clk_otpc_auto_rd_g is disabled as unused at the end of boot, and
> the rockchip-otp nvmem driver enables clk_otpc_arb and clk_otp_phy_g
> around each read and disables them again afterwards.
>
> Firmware in the secure world (OP-TEE reads its hardware unique key and
> the secure boot state from OTPC_S, and programs them) has no way to take
> a reference on these clocks. Once Linux has gated them, every secure OTP
> access times out, and a normal-world nvmem read on another CPU can gate
> them in the middle of a secure access, including a fuse programming
> cycle.
>
> Mark the three gates critical so the normal world never turns them off.
> They are 24 MHz gates for the OTP block only.

If OPTEE needs some resources kept online, maybe the OPTEE DT node should
have a reference to them?

Otherwise everyone is just playing whack-a-mole in each separate driver.
And for folks that don't have OPTEE, it's a potential waste of power.


ChenYu

> Link: https://github.com/OP-TEE/optee_os/pull/8034
> Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
> ---
>  drivers/clk/rockchip/clk-rk3588.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
-rk3588.c
> index 24baa0ef9bf3..8e0f408fdfad 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -1158,11 +1158,11 @@ static struct rockchip_clk_branch rk3588_early_cl=
k_branches[] __initdata =3D {
>                         RK3588_CLKGATE_CON(18), 9, GFLAGS),
>         GATE(CLK_OTPC_NS, "clk_otpc_ns", "xin24m", 0,
>                         RK3588_CLKGATE_CON(18), 10, GFLAGS),
> -       GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", 0,
> +       GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", CLK_IS_CRITICAL,
>                         RK3588_CLKGATE_CON(18), 11, GFLAGS),
> -       GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
> +       GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", CLK_IS_CRITICAL,
>                         RK3588_CLKGATE_CON(18), 13, GFLAGS),
> -       GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
> +       GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", CLK_IS_C=
RITICAL,
>                         RK3588_CLKGATE_CON(18), 12, GFLAGS),
>
>         GATE(PCLK_SARADC, "pclk_saradc", "pclk_top_root", 0,
> --
> 2.56.0
>
>
