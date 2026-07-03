Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E94325392C;
	Fri,  3 Jul 2026 06:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058882; cv=none; b=aKPLjvTMCD5Pgr8D3gEeRN8+aia/5rPiaXcDDVukudAjN4bcGsZU2wEB75mTZcvw3L2l1x8n9TLWHFjUlt4k0AvZHe9rrljDiL/13mZyqfQJpzrOx63mFTmVJJr9LKiR0VGsewc0ul3PSCjRaeBbHTScSzNLK4bP8dLULkOxyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058882; c=relaxed/simple;
	bh=mEUrM8x3sX0nMe6PzqR3wBKzu+FAH+7Z0tCazYHvPJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAr4JUUfgSYQrz6XKDoY7aLxJziBZj2W+DoyXbW1/kEfNvn8T/93ccAzQrA/lMYF2YAMfgXTuawmtVSBeBoEjPWMlVCrHfjRXErOYXMUdqk/uaJl2wc+SVqPwNvThI0e7qFymIwfGCxo0ohw0r8TBOecXoG2KtMwPvqpJnmlnoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7SMh9pL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7SMh9pL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505DD1F000E9;
	Fri,  3 Jul 2026 06:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783058880;
	bh=mEUrM8x3sX0nMe6PzqR3wBKzu+FAH+7Z0tCazYHvPJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M7SMh9pL5doMGKIm/4H0MQ+2m5BYfS/1JNlz0g0NWquKsb0CH/F8vbM8DkYEv6Yim
	 NfV8SZtjCR5ysa/WNF7wjCB44//ZNuhCO+X/vSzFb9j0XWHEqsfPqVMDs23+/oSV21
	 euAxPPd5+h5VfaiFCUgM7eIPDmA/zA9mtimCV5LP1X6OF4qcYqNGEL/RgMWwfzArbK
	 vYxt5kRT7FNEvpdz4ktckdQEHWgtIoOwyv88nYeKV8pTV8yvk5PLn8d6CVMtEFUJei
	 UnTIRGpd7X2Gu65O1J8B6uY7njmX+9oUPpjNMl5H8o6FFyfDChtw4DT+PsrpyrQL84
	 RxNBhVEtx5g4A==
Date: Fri, 3 Jul 2026 08:07:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 02/12] dt-bindings: soc: zte: Add zx297520v3 matrix
 clock and reset bindings
Message-ID: <20260703-cheerful-salmon-of-agility-1ed1f1@quoll>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-2-377b704f80c4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260702-zx29clk-v6-2-377b704f80c4@gmail.com>

On Thu, Jul 02, 2026 at 11:27:57PM +0300, Stefan D=C3=B6singer wrote:
> This controller contains clocks and resets for high speed devices on the
> zx297520v3 board and hardware spinlocks that I expect will be necessary
> to communicate correctly with the LTE DSP firmware blob.
>=20
> A simple MFD driver will instantiate independent clock, reset and hwlock
> drivers.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20
> Changes
> v5->v6:
> Add syscon compatible - Conor suggested this after v4 and I forgot it in =
v5.

Please explain why. syscon has meaning in bindings, so if this is not
accessed outside, then it is not a syscon.

Best regards,
Krzysztof

