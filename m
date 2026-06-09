Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B2481AAD
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023335; cv=none; b=K/76c5vxH/u9sg6Et9dD+As15HUj4ZKvoYlO2N1K3wcv5yWVtL8vkIC3z+q/gW/JwQdy5dnmvX0Q+e7CDH5OewORKEcsdNCHIRhDKZPBkQYkom7LnivMheIQrSW+XFF9OQ0g1NT3wubj+tjeUyc0umPiTzDMVBBW1Z/hqwZb/to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023335; c=relaxed/simple;
	bh=99KrLILEF2FMsqh1wD5ix4ZSC/c0+z6tUPRPcB/xSnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFee62uBs3Mgxd8Oyje82ACqXQHAOLlK7DNI4jFUgsk3pdrUOcB3K6nTjU8Mq/L4d84qr2r6KsvthLv2qJ72y/f8wzKWPyKz7ssQXdUIZJm4B4bpdLuxoXEmjFTlZi0UAi0mx3AJifoek3QEZePDZBrdxmgbmh5mCBW2178QLrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R74uSwk/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R74uSwk/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so47781955e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023333; x=1781628133; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltcN6lrCBn1i7VizWEDzmvqmfmSuDzvei1Fc92HuNdU=;
        b=R74uSwk/1mn+Y95ALM1apeml3hcYrjv4EjrOvM+kdRXYl19ZSmMZfIDXNcAludAxQI
         YHq5AOGCc2ON5Rvg9d4y54yMFxxM2tNXA2HC2MlLNbchf2NAhdP4ZE56gwL4mYWk9c1Z
         pxsypRpK0sjfsCojfH2qWgUekXnqBWxd4038E0W15P3x9NNRPfFpfPXr1AbH/YUG1Rd6
         wbApfCGuXzs2kYueC/kfmVHan9xGLBUbVopemtbhP/EVI1E6t0IsyTrkioAL9Kp3TUsk
         fuj1xKtTnSMWq+LFtYUaSAJRgn9b5Wp7TUQ9Z5sil/eiPta4x7FvTBG/pVo8ES8bk7gw
         u0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023333; x=1781628133;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltcN6lrCBn1i7VizWEDzmvqmfmSuDzvei1Fc92HuNdU=;
        b=hP+g/n6jjIPBYTXwhV59+cuPE4VEF+gaAEw9zGMUvKIpcY1CLxZT65nYuZd4WijvOW
         TKxyNWibzIEJEZeHM8MJw4MrnHRGQ2WlnzAhjxz7elZ+cBJWMaJliY1S9qg8GB3InJWB
         vjNWzzhfJG+acRa3YsT2dnbrlIO8+Q1/LMzVaUDXGr/f0JpJRZ2tFEIfXKUHBwWvlm9X
         WVLsoWuHzF5BbmtEkNSfc+LwIDA5tRPzJVlb4tTLXVYjziaKOccDf/fu2jVJoHDKNQZY
         zxDc3c9JQsTqGKNju5RdnKbfsU2h8cklTr3mROr80qEmDCIgu/xBL6YH4Ifc6ZGENJ1a
         Q67w==
X-Gm-Message-State: AOJu0YyPGviioPol9BuE7+dQRrNlbUi5ZciMK68Gzqfi3FIUtSIiWHCB
	JQ/MpHCAsprLSvXpTzLiMYpk0e0MD29R8UD5JSEcREcU2letqEJJJQGrU/4BJkdDRWI=
X-Gm-Gg: Acq92OESPrTOEmUttiAwthVw87P//4KyytSyY7PEYQDrk6kCJXipwOKTNTVNNXFt1Ps
	KZkN/IAGuVroMSLwc27Yq0lWbEwPLLhjVXPPB5wf7psNqHBhf61BSxcpP9OngfqNk9q/vPvGArZ
	+tEFBZKrsDQ0nRVEglSHik9lnEw5yziBj4Z14fZJ8HAnVFIThUvWbsLHyR1yTtrAlFhzoHET6kv
	28BroUZnJzqA2YbJMeHG/R6QNCLroVBEGjwRTrTWrwyDZTZVcEqsYEO7c4Z93LOO3KFJBJ9XYF1
	X/nYyOkP2AlW6zt7F+Wl7p+uPgG/CjeRmOpovnwub5PjR40e+r81lrsHKHMRCwupt4u00QI3LFF
	3wDLG9+5+KFY4YfWbySZC5Ivi49gkOiMZ2oku8Emo5ffQA20BAyyybaZclu4wP+PmXyxS757+uY
	efPsZymo6WbB5dszdx0/UwwvhhDpjKYDfLfsbpltVElSLkJn0xAw==
X-Received: by 2002:a05:600c:529b:b0:490:5380:f2cb with SMTP id 5b1f17b1804b1-490c2528b6amr352314605e9.0.1781023332863;
        Tue, 09 Jun 2026 09:42:12 -0700 (PDT)
Received: from silicon.doe.home ([197.250.227.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46059346676sm2398593f8f.26.2026.06.09.09.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:42:12 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Tue, 09 Jun 2026 19:42:02 +0300
Message-ID: <QsCV4VffTSWWBp014o7Pkg@gmail.com>
In-Reply-To: <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
References:
 <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com> <2062167.PYKUYFuaPT@strix>
 <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartFLf7VarUTpi_4IXxXYdobw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartFLf7VarUTpi_4IXxXYdobw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Tue, 09 Jun 2026 19:42:02 +0300
Message-ID: <QsCV4VffTSWWBp014o7Pkg@gmail.com>
In-Reply-To: <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
MIME-Version: 1.0

Hi Philipp,

I did some more reading and checked past clock driver submissions. This email 
is to check if I understood it right.

Am Donnerstag, 4. Juni 2026, 18:23:01 Ostafrikanische Zeit schrieb Philipp 
Zabel:
> > The register lock because all LSP and at least one TOP register contains
> > both clocks and resets.
> 
> That could be solved with regmap.

This will require me to change the clk component to use regmaps too. There's 
no regmap equivalent to clk-{div,gate,mux}.c, so I'll need my own. qcom and 
meson have similar drivers already, so I'd likely copy one of them. Is there a 
particular reason why there isn't a regmap equivalent of clk-{div,gate,mux}.c?

Another hypothetical solution is a custom regmap implementation that locks my 
clk driver's lock. I see that only in imx/clk-imx8ulp-sim-lpav.c.

However, the topclk region also has a stray register that controls if a 
watchdog timeout resets the board. So there's no good way past a syscon 
compatible and syscon generated regmap anyway.

Afaics syscon regmaps only support a single IO region, so I'd likely revert 
back to the topclk/matrixclk split with different bindings, bite the other 
bullet and list all 50 or so PLL outputs as clocks passed from top to matrix.

Which gives a device tree setup like this:

topcrm: something@13b000 {
	compatible = "zte,zx297520v3-topcrm", "syscon", "simple-mfd";
	reg = <0x0013b000 0x400>;
	#address-cells = <1>;
	#size-cells = <1>;
	ranges;

	topclk: clock-controller@0 {
		compatible = "zte,zx297520v3-topclk";
		reg = <0x0 0x400>;
		#clock-cells = <1>;
		#reset-cells = <1>;
		clocks = <&osc26m>, <&osc32k>;
		clock-names = "osc26m", "osc32k";
	};

	reboot {
		compatible = "syscon-reboot";
		offset = <0x0>;
		mask = <0x1>;
	};
};

watchdog_t18: watchdog@148000 {
	compatible = "zte,zx297520-wdt";
	reg = <0x00148000 0x20>;
	clocks = <&topclk ZX297520V3_WDT_T18_WCLK>, <&topclk 
ZX297520V3_WDT_T18_PCLK>;
	clock-names = "wclk", "pclk";
	resets = <&topclk ZX297520V3_WDT_T18_RESET>;
	zte,wdt-reset-sysctrl = <&topcrm 0x2c 0x3 0x3>;
};

(I did not attempt to build this, might have typos)

And the reset controller will be an aux-bus child of the clock controller. I 
could make the reset controller its own device with its own bindings, but that 
would misrepresent the hardware.

Did I understand this correctly?

For some reason in my dev tree the reset sysctrl works even though my clock 
driver does not use the syscon compatible nor manually create a regmap.

> > Shared register definition: in the case of the LSP clocks breaking up the
> > composite definition would sacrifice readability.
> 
> That is a matter of perspective.
> 
> I had a harder time validating that the resets[] array is properly
> initialized from the two different composite arrays because of the
> unordered reset_ids, and some remaining resets[] being filled via code.

I do have a sanity check loop for that.

> It would be much simpler if you split the reset definitions out into a
> single, separate, const array, indexed by reset id. In fact,
> I would suggest this even if you don't intend to move the reset code.

I had to collect the clocks and resets from all over ZTE's kernel and U-Boot 
sources plus manual testing, so maybe I am a bit too attached to seeing all 
controls for a given device in one place. If the reset controls move to a 
different file, the composite structure becomes less useful, so I'll probably 
split it up and just list single div, gates and regs.

--nextPartFLf7VarUTpi_4IXxXYdobw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmooQlobFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiKesQAJRepE5jSEE8unaib32O
EpI63wWhBCKBNi9UCv8iIeAt61Av/y7m/U19SEHHCCyv2IdoH8hhqoPLjcJjt+/v
UsWNcEujOPf+JbRRRtSP2UyoirW5rsoYHEMOTuMfJSBvk2/SIrTApo7AwDhV59rb
nJ/MZI9DtTBOGF3CV+vuc9qPWtO8hntdu+jlLeg7TmUSkqtJJZEjknUKZdBZGpDQ
NSd2dY7wHnf7RhLEP73OBXwm9ebely5izLtAyNiDltkDAOAjJXZibKzRbZ/bPgdz
XkiQ854wIcynNBQPEaDwsHu4tAzpQSBd6qrZzAzrGn/Nw7XCBvTT3rD2xGhJUEU6
KUJmfCYzS+5dpY1tfSvsstPruM936JzgH6EBCpY0pQjvrs+QdW1lEMrT1NE890rC
shggbu9bGsS714qLLk54JffkJlpwTAPlObtNqOdyQH22cAvZvKfZ5cZY+rJzdoAs
2+d6glovGoZ1aJDGU8WhE9nnlKVgTYObenacdL+fedcfBKo0AwRc8Bu5EYnvn4DP
v+IKyecGKLWSiudu0Jh8oH3uguoKGpFHlZtXcd0jpLn6h7VvS3wqU3LeBpKRu6Em
Q04ptHCtkq5eJZBqHFBuBWbfT0XfkAF3sVmZqMxq7/SrzT1e3xJ3apVLcdo9u9Fe
b8l88Dq5BUMzyvr1kCAAFtGj
=8F5V
-----END PGP SIGNATURE-----

--nextPartFLf7VarUTpi_4IXxXYdobw--



