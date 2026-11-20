Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162610;
	b=SGMngM1YcTNMSusqja2qocddaPIz6OXE7svrFrj3kiee/W6z17CK5l3y/dQz+jG/IaEB
	 BsvL9p0/2PMX+EzdNUJdi5YB+sFobkaChQ7qgWgNp+IgfrqK2FIjpCgWc7TN2RyHopAJD
	 /r6nCrvSsoOULRiE19abPNHFJ8EzSHTrXKVMvAVyAsY14aLRP4PPS645cJeEH6tSW84OY
	 XT3a5EpAYuKhFqKHn8M+DYGh1/s1EGC9beezYSQFB9bVqaA0I3lDJL1XWbvtPfUdvyRIE
	 7VPkpF0DLPu06Bat7a52w0NOTYG76XK9zUbBMZ7d3pQreuvGxgg62nH70zTJgetvZwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
	b=sUL/8cb8u6wUiUrjLCuiVkv5L7rVCQHzsE1LJkeCFkrxb+U0hF3OtUEP0fIf+ycbFjwz
	 NakuglMa8C3wfK8lpQmSzLwmWmX0SxcBatMbfo96LsuvKIh/s7JrK5ObPu5t9TT81VUuc
	 1MZO2wAUfBwpJRHeUDbm6l/fkZAG0E6Je7MsU6dbs7/3qrTIfuEVSfoSF7aur52t+MFMj
	 IngrQyDzQnaCNIosbJHLquajisM1GYUyd12JnKBTouQfoCXOgrkB8FlltYsittUoioUNy
	 JSqhjzt5Gdw14ujMYCIq5osbWxBn2AkvZhduNX103zwvIVJqFYdQckBSqBq4cMNOIfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OidJyP58;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D655606A332
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 08:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D655606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OidJyP58
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2ca055399so181992137.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 00:16:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162609; cv=none;
        d=google.com; s=arc-20260327;
        b=XHvuxj1u7Ui/yW4TL0yHRDMr6uhx6d2+/0oYYY+V3L5IgNA9lI2AIPjbeaaie4+JK9
         WzMYESVokzTqz9T02sC4V60JhjWa73KsxT7yOEbEAiE2viPQxUgVjk844nxTSCU+ExI8
         pbulg8+ruB18CSvyCTa9PnckQj2MhBojEDBD7ISK1yxgnZHXeeHV/4cNl+2jwyIeBRcL
         LeuVGQKC4prhiFy0xCII7ZLb9aENDDB6xLgfib8xh7GcGwtdlQvZCa76PQGNvbhS4MPO
         QaAN5rAGs7iCLuO72ykaR18mpeGWoy6PxZ70SE4eaYekAPMB3rp33hsugcp5E0TyhwqJ
         Xrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        fh=ZPJPV1BuuLq16qJaAp75Os213eKxwbazWLdUizLRjqc=;
        b=lLQRKyg+1WiS3DZJWNDFAom31wc6D5beSpjhzzzNqKn3yy+loMmloV/tvHoKwT9oYL
         fw8SWoS++3HrzEf4kC7Bz6Fk9G4Np8dUuj44DvZ/wfFHbMfAzQnk4w4PZMPsHa4WjRpo
         uWEYi4tAVZQR6xKGXPJZKBK5yrW3qz9/VBugUE7/raj6l7JG+3a/GQ9NW3WWfyBWhh2A
         eU9Bs3rqnfvauIntCHgQ6q82SV/HEzYmijq/UPO2Px6h0Q/XvgltHVEiVHXVfCi0C1Jy
         Dj/fmm67D1EWAnT+HDNkYFMZtz+H39zJv97X62roFu4NMPhH25tPE0g0oqAUNTAN3tTg
         4raA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162609; x=1795767409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=OidJyP582FX73SpilfBJrOmiXhxrJOYCltwuoU44dARQd6knYJbLoNgzzr2QZ/AjoL
         HGCKHEEsI3bmshiQlfpEnTfkM5hcAJsX9eANMoJEg9e3CY466eqHmlenferkg4xMEhkc
         xpOd6DLKN5qeg8dTs+yv7+uyQgIAz4Xzk2X/hfkkSTc67c9yvB0IWX/bcw/vN7UF06Oq
         KNFPsahTkSsJrS8+tZFSqCtMwRLOddaXqTkAsYE3tFmraWqdL37SQVgkUcjqC/2YhYmQ
         4AbAtUlx78qBQjO5gKgsyULaQp3LIrBnyCzG+hBL4bE867SrG+nklbMutTFgtKsdHJOz
         IZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162609; x=1795767409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=eiAcUAly6OfTz4OkbUYtQulSfKN+LDgNp1SQZJfoEXoiECYFlV8ivxHayq1Q5y3QlH
         +bsVkcMITBEdh3diMTS1PDYFMTKYSXcot+PTeIRktLeCrJLCMziLcceJnVS5eNiBkaqM
         Pig2LzCpLPPABH6TcIv6eA3NSZyty+ScPg7YneTyxDpa7E13AmKfcmcCzswzKzqgejfs
         8wnzXPP0Ei+iLbdwzOAzXipEUTxkd4BnryaeKn/7wThrY0lgueXWryZUXHUw1PxRCyk8
         5JIwx5sjDXvEZk5ZPdfaRbNmguYRibARV0IVxEtxV0DZ+EEnP2AaBbyZnI9mJzmk4Bxk
         OTHQ==
X-Forwarded-Encrypted: i=1; AL+hErFAD01pQof+wSYKDZOFuDcx2vywZ1s7hzRz0qcqwzHiecYe+C66ZZV2pS3QggJfi+bQvuxptA58rSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oM/w2+StnVDqK+Fb0xJy6y3x8Rm3C5e9eFQR8wzl7bjYkABwP
	gp6h9Mhvq6ZS/wEgqoXAP0m0SNnGnnwkjDeNqwaznPS1PgYcJshF6MrvAknlCFzmR3+zlqHBzCe
	3GPV8pXIwWtoxSygDXxTwsTQ47t5tWyI=
X-Gm-Gg: AZFdTZex/Kn05hyPh0t+Mxy/O7Y+9qhNxdLwUfdQNhv9PLaKJLWzTrj8bfN6RcQSahJ
	oGNPPCRmmiN7bPPBwi7Ze5ro1ev7PTZLqKxjiUdWyHrRJ+ajBpN6UJvmZ5GQdoChbLxsNv6iRef
	+FimT0D+JFhoJ810eXQ7yX8QE1sxYf2arQ5VOnxnJDztc5HcGigQoDw73QuKOt42C+z4VT8ufnB
	6c8OLmN8MkyTJTxc2aosskBr7VFkqq4Du3OQjAhNZiybVDwkNBfpuEJZ0zFSDXsbnMmUL+xVlOe
	KME9vultglV/nUUTe8uyF86AZ7xLIm04BhZHx6KELD06aitjmPuq3l1KzDTJrnK0qYI+XcdZeAU
	dgpHhgmvY87a486q3pd2aTD9i73WbrfWFvobgL6pL32N0Gtca5Hpf36Xu22uJZCjQt3a9Wqa4I5
	JUWzIIhPtQ54Z1bQQH9oInkNLbpQ3BOtG68mhVVpnwO9YK3C6bumdpoUdwU01qmop7A80PLC5PR
	f8tTtwUyGMgbQNIAtsjuPtT3VnjwA==
X-Received: by 2002:a05:6102:5cc8:b0:7c5:4da3:aefb with SMTP id
 ada2fe7eead31-7d7396b4513mr725084137.34.1795162609310; Fri, 20 Nov 2026
 00:16:49 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com> <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
In-Reply-To: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 01:16:38 -0700
X-Gm-Features: Aa3M54opK0HsAqJ5IKoxodsp8AVX0yGJFnC-piFBxQLeC7dh0z1JF0IENGFsfTk
Message-ID: <CADvTj4pkgZj77566ni_ifFJODRC0XvvOddiOij4kGRxoseBqfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
To: wens@kernel.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:02=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Thu, Oct 22, 2026 at 8:09=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > UARTs use APB2 as their baud clock. Expose its existing clock ID so dev=
ice
>
> And how did you discover this? How did you differentiate this from it jus=
t
> using a combined clock from the UART bus gate, which is also driven from
> APB2?

I got APB2 from section 9.2.3.5.2 of the H616 manual, which says
=E2=80=9CSCLK is usually APB2.=E2=80=9D I took that to mean the UART needed=
 a separate
reference to APB2 in DT.

> I'm not adding this simply because you want / need a baud clk that you
> can set the rate on. That's the wrong way to go about this. You should
> just add CLK_SET_RATE_PARENT to the bus gates. And making the bus clocks
> variable is a whole different discussion.

I tried your suggestion on H616. With CLK_SET_RATE_PARENT on the UART
bus gates, I can change the baud rate using just the existing gate
clock. So I don't think we need to export CLK_APB2 for the UARTs.

>
>
> ChenYu
>
> > trees can describe it separately from the per-port bus gate. Keep the
> > existing clock numbering.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-b=
indings/clock/sun50i-h616-ccu.h
> > index 6889405f9fec..e3318772c92d 100644
> > --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> > +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> > @@ -11,6 +11,7 @@
> >  #define CLK_CPUX               21
> >
> >  #define CLK_APB1               26
> > +#define CLK_APB2               27
> >
> >  #define CLK_DE                 29
> >  #define CLK_BUS_DE             30
> >
> > --
> > 2.53.0
> >
> >
