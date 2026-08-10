Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99B3AFCFA
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354685; cv=none; b=DBoJ+yqh4d32npdBStZWE4yI3nXm5autj9G/5VbbeoH1+UpNekn/FoTdVQqccS3wE9XQVjZxj113cKvGat/oTIyvoeGfiS37d+/bIrRFtZSvPG6Qekt1GP6CAo24dpnUuaPwlbZGYTrCGPu5mU1CtFTu//p/OWEQ+4JtNNDr1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354685; c=relaxed/simple;
	bh=xIcVYX0/9wf5NDk4ZC0V2d1DNB2jwH5MbDCYWw3Ll+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcgrlJ9W7vCCXr4VBfDZ9sRfjV9qoaUjB8udrmkSiFBkRgCAIgUmesXXov6MBTcEw598K/Yd7HsJGnbJU7VI0ZHGIgAwVeorCmXjJ74XGt02MC7J5e2PPCEVGkqSXEaLa+CfTYMtK9cIhDu+63hT+jlTY8K7jpo8cgN0IfkNIjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X7WQzG3z; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X7WQzG3z"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-480001972b8so602934f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786354681; x=1786959481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xIcVYX0/9wf5NDk4ZC0V2d1DNB2jwH5MbDCYWw3Ll+E=;
        b=X7WQzG3zYN2tH+5v3xjFipwf/LyyZ6ev6TwkMKo9w2LmqL1nj5ERVc0V+oitt+6Aij
         m+hcj+gK1FTFvPO8wV4Ooo6BiUcfmlOtIqrJUTn7mhwLJoXddzrEIkKsNjUi+qte5Xbi
         6vbh3HaODe/NlOafSpAe7w990wEUUo1Y14XVCZJMLYo6NK3qnMfRoW1dNxg74ABHEovP
         A++eaPx5yMepnY3Debr5lWfC8T5JvR0DzfeRewSgA+OmlmxMEyRxJYfVrjK22THCl0bn
         9ozKU+OV2/Ph6HLey3EuX5ttzTsjMtYK7VJl+UFs6i2ilQMFVwuGv68h0nNJoKjl2UzV
         AWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354681; x=1786959481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIcVYX0/9wf5NDk4ZC0V2d1DNB2jwH5MbDCYWw3Ll+E=;
        b=g1cHpn6jO08wi1c+OvLMV7wFvtImHkspi1QvL+IYi4WeHsovpV4OLTHH7271XPfvfj
         PMswgG+OKMgpFEfGs2mNhg0hHiWvMTqpt9si3aflHfNvUjHFCYfNw8t1qFw7/2/2pHLa
         qxZB+ENYfbln1oUB04TDV7zN7wYRzFk7gUFuTl8NCsdhl0QnkFrVvSOyTTm5VZLziJ3K
         49ToIsNCf0B+sHPl4WFcxH8kILjpAeV4FpbJ6aNHkiGyoFdQxKJPkRn+Pf7JbrOgiOSF
         WeTyJjoG9b/n9+5BYNxi/asJ+lNXJqF4K14IcMR94xNATmvYQToyi9ntL2BC6FhJHiCI
         oo0A==
X-Forwarded-Encrypted: i=1; AHgh+RqJX81IsYsF+/lertqovzGopLhJ63NR+DMRhktvMtEgBVk7/bM/lH8WPztZS4MMCTkORADl+bi3vbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhGXxKuzy6EirnlCb+YO+9k7wcFPR2BDDQrbcOPbQwWlSVI83
	/DREE/9u7L6S0schIKlVPjIyWIbrVPkliflcz2nSP0HbzsRCXn90hzqJQA+3grzJQ1A=
X-Gm-Gg: AR+sD11WdLoOerFy/UL1r4haWDml4vovMrwfA7UbNIPWOWFxwTEd1/rAyKyQBQt2dB+
	rpIvVGLK9gFJZiTeSXgP1amiinwFNegS5/buW7yCTdJ40Y1KX9JP8CFKdMd5VbUs83k6BZb2cyM
	Q8A3RXrr+g8UgwAKM/ERkcjaGAJfOUgk2vy4kWnr60QkeeRiyus18dUHuBhLBMxUSkKe4DyeDeB
	8yq4RrZiCC7uvoiOu/O4Vn7y+MYjK0DOnTAXRYclCMZeBqIuDOEfEMhPY/FsLLLBHjQIOsvfc9M
	f2jHEnF1sbKAfFU8gHgsDmBQCwv0zUZdPcrrZU7tcYbCttGVEak6SsdJ7eqmwOin+Zw5Sr87oxz
	t0aNeHrWta09SqGOwBEw3Y4f45n6cvbiGmyB23URxp1k5eCDrZWvAvwSjdIVbqsdsLyFPhWsLdG
	kz8/LDH7zTUhDKCmTA/3eZB5vK8eQfba3dG6jcwa2aQ9HNofjvrN+N3/ge2cQF26mdesztlcCOm
	ODbbAC+PM80eAq26qNaEMZPdfq+bxHdmTv8XsfKUyaV8uEIc2jA+VoKMJi16uQ=
X-Received: by 2002:adf:e194:0:b0:47e:aa3e:e75e with SMTP id ffacd0b85a97d-481455df4f3mr803199f8f.10.1786354681431;
        Mon, 10 Aug 2026 02:38:01 -0700 (PDT)
Received: from localhost (p200300f65f017104988877d75683e2e7.dip0.t-ipconnect.de. [2003:f6:5f01:7104:9888:77d7:5683:e2e7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-480021e7b3fsm35703729f8f.20.2026.08.10.02.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:37:59 -0700 (PDT)
Date: Mon, 10 Aug 2026 11:37:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
Message-ID: <anmbi_gXKslOw0bP@monoceros>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xac63pr2vji44lb"
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>


--3xac63pr2vji44lb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
MIME-Version: 1.0

Hello,

On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide a definition for
struct device_id and drop <linux/mod_devicetable.h>. The latter will go
away soon.

Best regards
Uwe

--3xac63pr2vji44lb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp5m/IACgkQj4D7WH0S
/k6R5Af/ZHauc3SyLK+PyzhuAVo8KLioCnH6hR3DN0mwmmRoImnIwhh/fZ8+bxX6
4sjLWVHk3LNdw7myepDx8m5LApUqxoXGF8MFr2ei4fdCiuGploizmUZTp3Gk89n6
i05o9xebgzD7+GHFMl3dkgkR8Dlgwhlkiu/eQcM68rZlB+dcqBWwmTIlNam/Ns6h
DlMcTTmlbkteGx2LreH2BUe4x/5L5HKGnzdEbtkBPY+G/QxvT+BXS3TFwkfblKBF
KvzW5xksFzfP6mNdXxofjZ1Az5JBPefKwO2VaVRTfH90dspMqIqaB4zuscwYL2J2
gYsqyFDe+2fuOzTFDh4IeXloKHG9uQ==
=FHMs
-----END PGP SIGNATURE-----

--3xac63pr2vji44lb--
