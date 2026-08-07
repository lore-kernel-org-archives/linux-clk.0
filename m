Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60B453A30
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 06:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085628; cv=none; b=koZdlRf19VeYUbFyRyhz9LGD3vzm1vqNP70BLP9QKkq3jwbFMaHoXb09i3jbtub/Jor/DUFwycgtQP0uHF+3j+Xu6LSdvpzStR2WZREO7KZiSHovUgnfpI3yqj5w+bwXrhGrwpGZ0lOSNWCNomCWfHOmaD8zFRevy/gOldJ4wOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085628; c=relaxed/simple;
	bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXnB5x4z+JIMWek6YM0BrB5IDbbcVAa2XEq9A0rs2LWuLrsGh233EI41KGjSH9JE5i4F9DeWZ082DeHgQcCt6C3XsVGUyJw1FGdXofHKH28X1yQ9/qgj3eRVociy5o0yZxHOkizwD/SQRP7oXoDM5gyEZZt9/jBCmpki34c3HWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CfOSlEhu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CfOSlEhu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso22602315e9.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786085625; x=1786690425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
        b=CfOSlEhuGYDDWyfbmlLfTdjvDJJI5OwpdbdBapgJflbUwRYDZijzOIKEyNvGRUdxhI
         QmjoBgPgXYio+5PzfXSiAYHEUmW2yVp97f7APOlI8x6sKOvQzmAlvG51H+qQngwcFNW3
         ngSBPwLP6FnmQ7dfHgQQj9CfsB0TaznMKLYC4EgQoL6xuLzhWLqPqJ7V9QYGdDGx+Hoj
         mfmpuKbxR8vToV5Crji2g5wpC8ldpCqRJkXnlSXUpSrJaNFvTS7hKJuSkFYKXpnzUd3v
         oiQ+XB3bezrsQBNFeAyH/5X5GzbQJkR9UfQH5pHBmfkh5NORtP0l3BpZoCKNzyDyzCKz
         Wkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085625; x=1786690425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
        b=XuylUuLMnEcXZASL6kbsSR9XUT6pZGHHOc15r5ypCe9khlG9hk+OoMXc2sBnDg8lAe
         bXtlKs3HlBpw71gRoIcKWdiODRErzAqyuj1RG9Cre78D+y7eDzaSsmp/grlAayzSqJ/F
         YSX2bzXG2amflJwDI5nvNNRy/xxchx1z1B8n2iW2Kqcx11VtJoU0lnuOtXQ7Y5FQxyFn
         nPhkXK7UPWCEjRyvFkYN2x3LgNHBjom5ySxwxZidRJKn1gARaFyOfYrjpw+rzF67HDMB
         Y98zu+C+MvuZeXXgCdbR9kXTi+m2CAaGhiMoSQB3R/zUe6ShOzsyRWU7dDpTRVwq10L6
         iXug==
X-Forwarded-Encrypted: i=1; AHgh+RrCaiXsTUliEmman3Euq2sSNJcN+eCco7l43kf6cYGiQUz2/JcgO8dKpofchip1KdYyPyyNc1aeC2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBFhR8tM/QQcEvDNCsnMBNI3JhroEjEzD3RRc9ddaaKQv8Yl9o
	7cCi/+ufQ7dnKQu8kCindxA/w05o2yFi/qlBfguS8nbr5fxPZV/j06uEEFkirojQb7M=
X-Gm-Gg: AR+sD11GXOoc9OxigHvrNX89QAjmsYsVu6quHc97vsvd6/CvGI4dbNL4uM7roVBb6zz
	UciTOtZFnYyf/z6pPVeZpcjFT3W0udhNwczvht2ACm4TeY3DhF7upN1hnluHogYph9+72VeOJvN
	Nocj9unaRF/POKKih5hliBUbSFrf2IiHPHjs0E84f+jfoD+xUJ1bJZy6VnQ2PLf5waBJdzSwPmT
	UbO1P0jdtYQ49+UeynhKoDU+nWS5djz5CaiwLGVWaokL2ox4LlLKBYLzwaYnQ+tIgh+lXUn7bjw
	TbCZHLchaNEM4zDUX9HTFz3WkW1eEqvy8uTVadrfvxW2tT+aid/SqY+mzEAGSpMC5X3SwzPM6MQ
	iY4qwj0SbQTnjzslXuyIjofUUQw825h/lHRBoQ+r3EQdr56gjgBoRYOJozhQKClsSrLXHpGwh9W
	OQK5+Mh9CIj0foRxqQVi2txfNYlnAfGll3Mi3ujL/o4jByb/a+MUycz4c4BVXVBE0Y4OeMJaZca
	uBZitBVM4KC3TKDxyWmMaiI56UW2oxNQNgMCJ9bamgjCOeiOA/N
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr16392445e9.7.1786085625549;
        Thu, 06 Aug 2026 23:53:45 -0700 (PDT)
Received: from localhost (p200300f65f017104bf0aa590e17c3201.dip0.t-ipconnect.de. [2003:f6:5f01:7104:bf0a:a590:e17c:3201])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995422016fsm98840415e9.8.2026.08.06.23.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:44 -0700 (PDT)
Date: Fri, 7 Aug 2026 08:53:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Cody Kang <codykang.hk@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
Message-ID: <anWAmitXSFRUw1W2@monoceros>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-5-f22a10a52867@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjrvltbz7ftd6xiv"
Content-Disposition: inline
In-Reply-To: <20260724-k3-display-v1-5-f22a10a52867@gmail.com>


--pjrvltbz7ftd6xiv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
MIME-Version: 1.0

Hello,

On Fri, Jul 24, 2026 at 11:16:37PM -0400, Cody Kang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please drop the include for <linux/mod_devicetable.h>,
<linux/platform_device.h> already provides of_device_id.

Thanks
Uwe

--pjrvltbz7ftd6xiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp1gPUACgkQj4D7WH0S
/k5t1Af+IUdmJ1rwWz3XTKVvTnkiumXy+BBJlthTfpRB3pFeiGILfF6fTXLHen+q
HI5KuCh4tnAo/jb3zLCDqO0RRmh14m5WlEgbMnFB9NGgBsbmj77K/WjLo2asTvFN
zTn9nrSjAtcmoJs0h4hIB3zaaueCYiWTGq8S2lIKH5D3xMUy61+006h2s5Dtrzlc
fHv743vCRkGoaGQWxHvpsgkx8Sp7WXEwZQyMaRvSggG2FiskKlV5pyM35siiJuAA
re4sCShFRtGFOhGjKK+mM7y8skzgBNqDocWT4sYp0QYeW6w8nwNHyKh3KUN//afs
1fDWRTlDMEJQqbI9K3OToPHbVguUIA==
=glOr
-----END PGP SIGNATURE-----

--pjrvltbz7ftd6xiv--
