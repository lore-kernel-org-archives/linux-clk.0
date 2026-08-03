Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD11242123C
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779318; cv=none; b=C0GjjpxdtErFFaNrKQ/VjcuYzcXPDczn5nWI5QTJ4eLORBwSjMNtXlDm+rOOJVxfDloTA2/4b3r+2wZYm34Q89wlsGQUeIa7IJAiczz+uF+16OIEu+cOmKd2rrFTJbnP45SwApUNAAGwgkrptA0jJhgx5zEiVb/Cev0fdNMwo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779318; c=relaxed/simple;
	bh=qz7YCBMeFmwfqIQRWfN+FmRZ72NOsmo/ZZAIld/ipvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HBxrfIh+8goSYcJ1oh3Zdfh34wrCyjVmy9A3/slVo4kNXhtcseQjnMJMe/RvmMJqTt4W9PxCwK6VxqRnoJhRNSuQsHYhkvEtols6HHihaAFEurHd2yIxXuXRXY9Vj/WqgatGvwyXvJ7f0D5EzCHSzxlD1fEQkgFGhD0mBUZOk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNUu71fK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNUu71fK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954afac04bso28221905e9.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785779315; x=1786384115; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=;
        b=oNUu71fKbSrPlOF8J98E3ExdEeWbs7gcoApY1UAYspY6MSyG5smSxN86AKKaAN1vpG
         ju+TmAm/zagDToky8JlgjFBZqa0jzHd94pQKYQV7V099Q9nH7dhvmVHgxdIvoqkfsXLH
         luOc6N9VFCzjTPJ6Au7rWYoL5rcN954bYXhvYJ+X+XLLc0e4PVtr9T8ZZ6n+AFmimwxc
         B/TmF4k8jGThMX3AfFj3dSAFRQRUlRkFRBd2BNm3Je7CfrJ7Y3eWdHdZt4MPhkG5skbH
         jaOGRcWtnIIQWJX41keIXmR2rDsL9ButgCtJIlgM5lfYP3MgTjsdh59j3whdYP5noBdO
         SnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785779315; x=1786384115;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnDKjAsExIlIO6cGLAGlNzQp1IiRGZFjDF5mAKUFBPE=;
        b=nq87FbTs0Ik7AaCiN8ah0s+u/Sm9FWtQYlovqotJLpCrTF/OKbWBJ9OO0w+IboubG8
         vY27YE/oS4+OhMhnKDLnUNns0G7jTdM/mbjAzWzkdHx81lQKc/32b/TXQSHI+UOd0yGX
         8ha8pxNcSpF/ou3uuCCSaNFRuVpr67XIQn0k17SMItfaFXOdWBvOhRgPKwQgY8rHynqf
         japx7Aq75ijO+KKreub4u8PF2o9UtAZ+Ej8GITLLc327YEb493QjpMQ3Ytb/NI5Rcq2M
         Ad2yevdms9gsl56YAkzsAFqQZKclpqW4MdkE8SC+nTVC9W1ZoYHgMKuca5554hWQW+EI
         ZkFw==
X-Forwarded-Encrypted: i=1; AHgh+RoFQal9KApfZjpD2xRc7ew/ZZNYI1trZxXDh3Nw0c/7ir3l2vM3RPwoBkhC4McVi0uRsX8To0DFrXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfEeAYKFE24y2CMMk3fHMz0nl+5xtK6zkC2N1uy9HSxOK5jpPs
	UgFjEy4Bci/+5kigMwV/x79QeR8vF+mG3KhJRcJV53b/yHpFDncYKVZq
X-Gm-Gg: AR+sD13efaulBHF4e/ex5qxH6r2BYyxZFTO9ScjAdlquW8Ih+BIqG7wsXp3RjmBMoOK
	XyUR3EQ+UYhnK67951JEZZ8d9j6ZCNhzoBaTQLNt+fVjStBiGVjNwaUrAq+IsN5Hq9WUWvY134c
	nHeit/Zqtd4CnjOHvecbwnbI0JL3RhpsU5yDLXE7wmLDbMhZdYB+jNdkUt+z0NL1rQPfYU+Ceec
	PcoYJ3pKlTHgI+JqBVpmYhNv+C1BBTAcVmYuYbU5/FhDnGsrN3RuW+bBPHvLBi99jRZeHvZ4cTP
	TxrNylq47pSgtJmdrePdyvvjy4rNGHr+FxH4vWO2NxEuhD8uullTx/cNhJ1brpkNHYv7VghAzAz
	FPpH8VvDGaq1v92vFLAPOgR81SmkQxR7lJ9XPwgQs54L115i1oHapdAdR2oblHHQa1WtjHJSzxX
	1ubvlMSc1gjcECMNwKTNCDqHQgSpM7rv1j+zRtMFWNMUqK0NuqpOhdQf4BWV8tNLsmRCLSAF2cQ
	A==
X-Received: by 2002:a05:600c:314f:b0:495:4572:21af with SMTP id 5b1f17b1804b1-4980c673252mr206970055e9.9.1785779314611;
        Mon, 03 Aug 2026 10:48:34 -0700 (PDT)
Received: from strix.localnet ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5b4a2sm295532795e9.1.2026.08.03.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:48:33 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Date: Mon, 03 Aug 2026 20:48:18 +0300
Message-ID: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
In-Reply-To: <anC72Cf1zKcLYWlC@redhat.com>
References:
 <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com> <anC72Cf1zKcLYWlC@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartnWZPMUIwR7W-Gw2dYxPvgg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartnWZPMUIwR7W-Gw2dYxPvgg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Date: Mon, 03 Aug 2026 20:48:18 +0300
Message-ID: <ky2t5IqOTfWMdfZsXE91Gg@gmail.com>
In-Reply-To: <anC72Cf1zKcLYWlC@redhat.com>
MIME-Version: 1.0

Hi Brian,

Thanks again for the review!

Am Montag, 3. August 2026, 19:03:36 Ostafrikanische Zeit schrieb Brian Masney:
> > +	/*
> > +	 * Sanity check: Make sure all parents are there and write a clear
> > message rather than +	 * leave potential orphans.
> > +	 */
> 
> It's not common for clk drivers to have a validate function like this.
> That said, I know you are reverse engineering what's in the downstream
> BSP without documentation, and there is value in having this. I think
> it'd be useful to clarify that in the comments because code usually gets
> copied and pasted between drivers over time.
>
> That said, once it's verified that the clock tree is correct, can these
> checks be eventually dropped so that this validation logic isn't ran on
> every boot?

Yes, I plan to remove it eventually when support for the SoC is more mature. 
It has saved me some head-scratching as I have been working and re-working the 
clock tree. I'll clarify its driver specific role in the next submission.

Another option I contemplated is wrapping it in #ifdef DEBUG. What do you 
think about that?

> > +struct zx_clk_export {
> > +	unsigned int priv;
> > +	unsigned int binding;
> > +};
> 
> Sashiko flagged this as unused.

Indeed, that is a leftover from earlier - before I realized a simple unsigned 
int[] does the job fine.

---

I have a long-standing question about tristate/module support for drivers like 
this: I don't think the driver can realistically be unloaded. I have been 
testing driver unloading by removing the UART clocks from the DT (otherwise 
the clock driver is busy) and marking all clocks critical (otherwise 
unloading/unbinding will shut down the UART (and more) and lock me out of the 
system).

I have made it tristate because from early research into clock driver state of 
the art I gathered it was desired, even for drivers necessary for fundamental 
operation [0]. Did I understand this correctly? It also uncovered some linking 
errors that weren't obvious when compiling the driver into the kernel.

That said, I'd prefer to mark my init tables discardable with __initdata and 
think the module load support is going to go untested and bitrot over time.

Cheers,
Stefan

0: Chen-Yu Tsai's tak here mostly: https://www.youtube.com/watch?v=d1VIAnVb3hI

--nextPartnWZPMUIwR7W-Gw2dYxPvgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpw1GIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi7TkP/05WuGUn0opY7QQ8sZB6
OuKTG5SinWEzjuroAKgG/nD8WOveL+GRtp0cJ8+CUdvw0WpzZQeuRnSX/zDbSvXa
2G3pIBOvMcd0MOBBaEHUAtOHArZybsIuoFTVTzsaAYyHf2B7cc7KVbJZWRztmYSH
Z/OUYaxPHYoD6cHC4FlSNHyJplDqLj0LpgZOwY4zP0jaWLbEJpkCTK9Izl+ZIB4N
Q15I4WFfnyUi+J+3/mM3Rl4UYrS0U55ydarl5Io0PUsY/ORocxQY7jhXTvFyVmGV
xEythQnLVsvYici8F6d1tA/VcdG5jbo/JxRgrG53yGGuZX7x31CampUCrUOJRJ7t
bMsQwZz/VwpxL11Pg92G9bI3mzCHb+CZDRLT5zh+DN8cOkF5u4GBnI0CPKaqFAdw
deFt0WVnrrosFn0Vf0p17OrTiycj+f72S3L97DLCiH+0A02LR5XC6rxe5ia0xsFj
zXVl/z67OSLLN+g00eH/Gm7t6wSmRHdNY8QYBxaoIfY7NSPC4sfAm0BPcRfOtHEe
aN2QkZlUqy6LOPzLMKJXsVo1oXp94QXx5YgJpObLC1OH2GasPwX+teqCVXGyJZpt
we0fT64SnRaq5A4TfIcEcb2QJZUmH6znzcgROxCXZIJ1Dla1nW0ASQlNw2z5btj/
bbygfsidb6/n+WxVmEd5JJI+
=Lf/s
-----END PGP SIGNATURE-----

--nextPartnWZPMUIwR7W-Gw2dYxPvgg--



