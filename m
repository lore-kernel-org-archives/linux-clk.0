Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794353851;
	b=yHnk+9+gZKFsFRnHZi/3wEWsS/SAyLTvKFiUEVEYa8UM3C6rq5ANTICMPVt3KIs6yZnG
	 KTF47Hg921gXbWdiIskWDT9veZbeuaLWYwEKPGK1WxdwTz9W6NWk9mPH9YJDO7PJGm8aj
	 /mRC5h0xq24SFETn16bEqOF5dsTYbYbxF7qb/40TuUjBNY8YfFiXUSr3mTm5mAFd648Js
	 bU7cRyUJigzVC+nd9+XwW+JgidedHjmGNlulk0bN5VytlZN80w0GIjdeTXU4KgXu4M1W0
	 ILqCQ5Gvjqtjn9zIwgm3IW2sg/FLtTd1PumJXyOmw412gbev+tjCP1GpkVgN4CoO28w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
	b=UnCJtqMCkBJpxm8u7xxt4Ihmjmstm2TWlZUMYws4a29PJxMuwBL9mvL4Kqxf1np0EcER
	 Xdm7MxCG+RG0SxlCkdJGMhC4CjbYJMiLPHbc7UsUwd2Dy+mZ0o6X2LNbxGOkOeIQAZNCF
	 3TOP9UXU7nKizDdOSL1hs+YBpeMfj6wFvYxMTWMp3+ReSJF/7xkP+yJ3K17SAeU0gRVRI
	 aaH3B9ID2YDcQM18FBIEk4s6KiSoSXNHuA5dIt/kY4LGLcM0VlUNWjatP3uDb5hK8X4Ua
	 WPymtorq3FgafRRYEfnKFKOcmz7KGjtFutq9/ywF9ajyMEuJmamhWzp1JGNbpEBYRrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elQltWuO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ECC606A321
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 23:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52ECC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elQltWuO
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so3624438a12.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 15:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794353850; cv=none;
        d=google.com; s=arc-20260327;
        b=tCMzlgHJScc09El0l6VtEhWk6ZHxWUplA6UAaOMd6Xv213KzFhneg2yGiSxxfRDVo+
         h5E6e945poXYyeONoUZS0SfqCvtIo/12QGTwaOox8k8uI7+FlyfhZK9TB7MLe7FcpbJi
         JsrUrKPs7uIXKcYy3CLrbjybPuDyhhVCw5ilC45S9sopQMfU1Mo72hKusRYLdvZf/+L7
         PXGeSO8F7cO5ioFAxEnGm/1D8Pl5Hgbim2JPogiohVnZVRN5JEwB+vCPyTVC54xpJSt4
         JDx/Q6UhEfJsOoobF6VmFiu6aeBOWBIhjHdpn9ZJldqInjNTOPAbB5RUfIgNRqXSBCVV
         UfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        fh=jZsJfwniHSFDR+kJRbKNW4MVsQjOP8o8oU2TXiftdC0=;
        b=Yuu9cwsZ0QoVlPI7PzequZaqHcbbH1o70Gin04Q4IZ2EaHFsDrXRbldqEfiZwUKggB
         Gl0OwCIq1QPk5vOUyZnoj78olfv7ZSURiFqldrWKwumpSnC0gBvN8Lo+uh/FA72WJ488
         glJEoND9YZ1IB7O3rkEkClKRck9F9r0xxW92OH5rDLdqxVoPS/7JB1KvPW/zPzd24ANG
         DSn+Q4QqoOfKh3jpdPWT0I66AVFM27zeX0wK08gP4RBWjfBWnsE8bog6RO+Mxqf666OR
         zxY69WhObXV4rk0yScBZA38Ecy2iq2xJj+Ln2RA0BcPNzSnFDXnpP72+pveMefw8AU80
         /InQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794353850; x=1794958650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        b=elQltWuO/DkdGyaaLFYg0iABITYog+QbXRiK/p+gfA+oyGOiHjeAF+1qPdhV0er1z6
         19g2uFdXYKkYpF/n8Lo0CGEIrykr640l7VNsN9N+m/sZgVkvwKmQKCoxboYB5jX1S5o7
         nKm3+f2zmLDWFiaDmYao2vDAmaVxaGRm75JdGfHFgftaIHQsqBw7pnIHQU1eYzHWI+Zf
         MJp/WiosLChIPSTcgQ+ewBGDaKX9lFvg4TGCaQBU2lG0GZ9gYxBzzrFBglQZQSLwmtpM
         iZA68RQuU2bQHNTLXb6gPsxIfWvurVpdkBeLU5D44jSRmRIdPU9aoWCWrXJeTGm2rpg1
         gTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353850; x=1794958650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        b=wmWtvaKdw5yJzP6SNEUk2MazNEsFoQI//GMGOw3+eIm+EfGhzH/SY6CZCl0VvRZZ9U
         6B2Y/CyYeMq9khqvT8T/49JAUwK4l2B9Pici5kkRvP7Fe9RIxh27F/IFYk5J462pPiCN
         cA5TgV3MuLeEO64EG0DDwtV3xteBe7S07EeI5+wcyYGaDZMuAos9GCFj8exkUr6zFJi7
         /AQeYc2a/tHm26eziK3k/A+NLYOTL89tlZieyNbCpUFTq0uke+1S6LeysySP+CTnN11D
         fpLPcEQuPdFsP79Ds5fcCl++6+cCM+zDbKVvU5OhygVk7fFFvt1k2eXRy09FhQJOfoF/
         YWmg==
X-Forwarded-Encrypted: i=1; AL+hErEFEhgzQYAfTp0+Ulfz0KbIXJigYtwynUel0Tg3g8ItYQ8AwGi/6c5ANxTDw+6gx0qi0nO1Fo29C1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wW1gJ8C5AJBDlTPt3HOj0HEMGMDI4Gpp2CVd6oSBolwZ/MxbZ
	g+18jrcMo42gAOLLorvpH5hHt5eWsJRwWLnaddnYRUVq/HiKRpNjEfFrjOxRsWkFqbaMiqG54OE
	puGDR3R7iQaxcL9NFL5bIE7rkgWLdSNA=
X-Gm-Gg: AYBFou0C2kx1hUUtyE4XElQSJ9FVQoBj+wvPgx/p1C83drJp4IQjgxpvW0yX7hGfi/2
	bnlYOmDwcEp7Z10mwpZ/7hZsHrqeQRrLe2A84yFbENxAYASK8iibXMramZoZ3ItHht9mIrS3as9
	Yh0RJ/m7yJ/PlxH0J2Mc/phHbtcnPzoQFoZUshJY8YaJ3LJ5zgvAY439Ur4rha3gY0X70+FGrcZ
	XoJgECtgnwfP4/S2nvV9ogXKz5ePFc9LV80rZMdesgTnbcapiRMrfXJI/39EEgjIgmp5PfXSPt/
	jAvYQ8oN3Ax3LhSU1p/MbZFQhyooYU08bf69JUZ6MlKGEdp4d29NkcC44NN9LLwhds4MrXbZHBl
	RmmJfZkMJ22Ae1tkGHzhvSOvpY7rNuqqaP09mckklivr0cUg7pHQgtgDFd5tspwf3FBNJIXujfq
	Y0oVye3xf92jMQ5K6tnEjjmk4U6m1SfCJtYnpWqe/U39Xh1j5RHIpFUIcwjGngEA4xiu1toN+Qx
	Wf7uVKqsXzayu6b6++BDjX9j/x4vVDnIVUuSuAdjNinUga3UQ==
X-Received: by 2002:aa7:c609:0:b0:6ac:7d0c:2cb8 with SMTP id
 4fb4d7f45d1cf-6b7775eac3cmr391908a12.30.1794353849465; Tue, 10 Nov 2026
 15:37:29 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110013646.1582970-1-rosenp@gmail.com> <20261110013646.1582970-4-rosenp@gmail.com>
 <20261110-lean-pug-of-business-cbca5e@quoll>
In-Reply-To: <20261110-lean-pug-of-business-cbca5e@quoll>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 10 Nov 2026 15:37:18 -0800
X-Gm-Features: AclHuK-3dfP8GdD8w98u8UzvEILGcuTgL-XQqP_bC0ngHEJTsAE1kfgHk-4bdUE
Message-ID: <CAKxU2N9y_=m6Rkk86q38yZhK3E=M_OvYUs9uVMFEB_agrEcFig@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Nov 09, 2026 at 05:36:43PM -0800, Rosen Penev wrote:
> > AR934x has a second, high speed UART that is compatible with the
> > qca,ar9330-uart one and can run from a 100 MHz clock instead of the
> > reference clock. Add an ID for its clock.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  include/dt-bindings/clock/ath79-clk.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-binding=
s/clock/ath79-clk.h
> > index eec8f399b9e6..f8a98e4d206d 100644
> > --- a/include/dt-bindings/clock/ath79-clk.h
> > +++ b/include/dt-bindings/clock/ath79-clk.h
> > @@ -11,7 +11,8 @@
> >  #define ATH79_CLK_AHB                2
> >  #define ATH79_CLK_REF                3
> >  #define ATH79_CLK_MDIO               4
> > +#define ATH79_CLK_UART1              5
> >
> > -#define ATH79_CLK_END                5
> > +#define ATH79_CLK_END                6
>
> You cannot change that, that's fixed ABI.
There are commits like 2f4788cca881 that remove CLK_END. I agree with
those commits. This define should not be here.
>
> Best regards,
> Krzysztof
>
