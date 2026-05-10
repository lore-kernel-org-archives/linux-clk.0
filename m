Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F99E33F580
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 21:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449465; cv=none; b=uZJ3csrwOdinEtkhVxNL2ElhJmZ1ZCcRy4gEx+HHugEWTDZEeZKktSz4Qoqm7NJXuxUZJxt8qLy4dno5u32spBGy20Xfg74omBn76KBh9tGrPq8zYChz/sWLacL8JlRFlOvNdy13IqdVA6UUGC+toWniWM+mUz7nZwqZG4n4eLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449465; c=relaxed/simple;
	bh=9PGauRrzIPvJQQBGe9qqeSNW7mE9+oduTX9Qb+UYiYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=An6Ixz5NN/ZU/8rH/rKkNnuo6foY4AHoVqoIGFkhpNuGEPTpPQ8SNAhbhPnJT/NkeuO7ljrDJYSfVZbc6KUS/MFe35d9WIIfS9BZsD+531qctcazAOC72NvphBK1NSlPbIBtEv6HGkE5L57ca+3rwfuCZxYVIo8X+bZ7rXj4gt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYKvJ7rj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYKvJ7rj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso31473325e9.0
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449462; x=1779054262; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0I608nOr5T/ewLNCbkEXQ+oVjvkUSUcc64qKyYq/s8=;
        b=iYKvJ7rjpYJvBnGNtCSWMi+iUR8qwirNV0XXQI0lN0neUa5b2gwUzDBYEKIfYHAt6K
         hz2VrZiX7DW6xLIH/RaujXTviitWNX1jHmNBaQHYNPZjatlg5yffYCE2Yb2MaSnPjwH5
         Cqea3Dqk06rwVZKgIsIQkq74eE6qub9oBVZlcPCUsDUgAwSaqn0vKgnRGik1WzRf4HQ6
         5kKHxXf1fgrMtUCS4h2jkIxsy16Y4AZd6k58mJNIJoCbWpDvUFIL8kiqPdIpPl9z7sMT
         aKszI0/9NjbLm8Wzn3xFo43tLMbx026vExyL6SSAzHaatdeLrBQNoZ884gfBHU2qi5Ja
         9dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449462; x=1779054262;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0I608nOr5T/ewLNCbkEXQ+oVjvkUSUcc64qKyYq/s8=;
        b=PIxlT34U0hjSwAyU8+7evIN6lRx7HLOVP268Wr+ohGc1ZoVFG0JHdlyVENlctlmmn0
         zlqRGg29CalDdHvSPQoVBHjFMVnFbvzah7VgdYK5flhU1c4sJGn5XRTOccws51AdEJkE
         Cc7okfNjXssHx8QhIDA5olAmNHNxvGlQD33MGadsV9xc6h+6JFjKccmEt/Q5BRmOpDBZ
         Jc2htxFoYNzoM02Hs6SjmqeARcLIFJsFCJ1/uuTXjXKv03PKRR9p39t43f47zyt/PJSf
         oT5W06H5GBDrD4qxjzwnhvfYaFR/b4AWT3iy0nEZGzSEHGxLcEgGmLY8CLeH4T81677S
         E9vQ==
X-Gm-Message-State: AOJu0YzJa9HdVW1IJIXg9tPH6seMNXP2wuuUHmFJJjocLls452TQYjad
	0BWxxh5rxBKTN3W2yoyA4Z4ePp22JEjUk2cDS7BXb4GvqPSfKQm7M5Dq
X-Gm-Gg: Acq92OGDHJEKfdI29IU9PybwU/RFn/4sfA9bspBI1mG7w0Twz1Xul1fn2hj1MzwdFVM
	FGmLR8bbfJKy92DCeh2/+Q7TEmJqYdyPipHQ63pEDNw0WLEc5XXcpsixBMIpGWtS6FpG0W6HJXj
	ofX2Y9cJBXZb0e/pdnVDKDGQdgeyZs9QOgqWbhd88522cc3DCvDSCp1AQbNHIAJVo/bytZpJf6R
	xvvWjdQ5nqYCXy/Mu4bnmIYbdOofucWddQ+ZDJADH0jGONCx2ILRvL1pZiBfyZxc0OWsE9PH7rc
	KeX0H+oynaWhxTA8O8YrqKhJFDUF1+qrNrnBERRNODJ/v23UBnUF2K7T3xKZ6yG/iDiKz1vILeM
	K4oDAUawh2bGi7U5fSP0Ujk3RjS9oq+lPUdIaU5Xi/Ge+l5JQ/yuT25c1fwXKCDP1S0rePs/a9e
	1yvahJYIUknv9uMrt2W2WaUS0aDdWdMQqxsdSRr/TRcf4=
X-Received: by 2002:a05:600c:8b65:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-48e706c7e20mr118280775e9.22.1778449462329;
        Sun, 10 May 2026 14:44:22 -0700 (PDT)
Received: from strix.localnet ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7041defesm143551425e9.15.2026.05.10.14.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:44:21 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC 4/4] clk: zte: Introduce a driver for zx297520v3 LSP clocks
 and resets.
Date: Mon, 11 May 2026 00:44:12 +0300
Message-ID: <6334180.lOV4Wx5bFT@strix>
In-Reply-To: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
References:
 <20260510-zx29clk-v1-0-e1bacfffe967@gmail.com>
 <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5167878.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5167878.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Mon, 11 May 2026 00:44:12 +0300
Message-ID: <6334180.lOV4Wx5bFT@strix>
In-Reply-To: <20260510-zx29clk-v1-4-e1bacfffe967@gmail.com>
MIME-Version: 1.0

Am Sonntag, 10. Mai 2026, 22:01:03 Ostafrikanische Zeit schrieben Sie:
> +       static const char * const *parent_names[] = { "mpll_d5", "mpll_d4",
> "mpll_d6", "mpll_d8", +                                                    
> "mpll_d12", "osc26m", "osc32k", "pclk" };

So this obviously doesn't build, and I didn't spot it because the git branch I 
sent this from didn't have the Kconfig options introduced by my other patch 
series. I'll resend, my apologies for the quick v2 spam.

--nextPart5167878.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoA/CwbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiS/YQAIf0qPo56nJtvWnvshjI
jYTbtH4/9VEWn+hbTxBWhSKMeLAZrhArnpgzBZKh9eCUkFT+gD8J/qIIPINkWDhk
6fX1PuLkXwdW+MpfdkjontAdN/EZhm3lPeJhIGt3GruUA00eNtpn3iycubfSYcmK
5kMq9z446fozdX66/Oi+TUL2jbXvRlByXqFGznzqZiyd+lolxlnm/Wifzd3Ro7yg
qny8kAsZ0EaW1HiuHKP7SHIFfkSFoeQUIDtpF4i+TIFqqSMb6+SIOa/iXwQtRMgp
rtVRv2XwPPYL6G6dKbDrjJiFThvbarchTCVxXmRsUtXYH87oMy5GKuBzoEed5qwH
ApZH4okVK3eELxsk+Dpu6VYtBftAMpTOWf+87Z+FEJRu0so88yioA1Gw4DJGmuAT
fiV9X4a3B96Z/vtvfFJRHwWIhMaRkwWcoxis8eCtM/6X8DmLQWUHCd8SKZsz45As
tHjztXUMwmC0F1FL1N68CML8a1MUQ6lhGroL5xj9BfJYf9UH6BpoACH9Mi6Xl7YT
d4Lq2qi7CS+8Spqt20uHR9+6bPYkLo3Ks/U79EcSa+QTg2Ug1P+G6QePlGEoeS7X
YAQX5PCivPvMa7mTTw4jnT/3SxZHBd/KDBTpdnahl4QYDXrvxS9T6kKr4dkbzLru
DjFXREbRhcS+D9cuyqvVoOWy
=5+QN
-----END PGP SIGNATURE-----

--nextPart5167878.31r3eYUQgx--



