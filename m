Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852940;
	b=hg62RwvRwXdc5eMJejQDYuCRc0evIRbSE+HxPTWlHkgd1Za3u0IIfg2AAMkBlSqW7DPE
	 ECka8KJ/SUrJ2Gq7T4ZDUd81Ht/pPOtiABG5R1IB3eYkT7LjyTpfNBb9BWFxN8sUoloYH
	 3qbNenXd+U5HRQHeCZTjeDJVbYbRLi1rrjkoV7slCeLAtxVjWc0qoyFla46mSXWtat7+S
	 e48g6bbm2/04DJPRZCOgZYu5Girz6qX5hGaPC73MYyrHGD4xC41Krqu/7k4WVbqMTyAUv
	 3j71UlO1XFQnZ4CHmpu7hyk+6wcKYDAlH34vr/haX6Uow5ZnptLJOw0jy4y7u+HhgrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
	b=g6OY0AIcbpbn9tIZVak5txGJL22JWhb4uadKc8RTQtdvsj/JeTBflZKg+h+zX4fdSmh2
	 UNHYInNXgudpumFeyDP5YdtrHJcIfhWi4bSElI4x3iK99TG1Xrl9ThYHJ8mhsYTWBbUOr
	 MA3JwuOzERsU3PW3ajEepAFYAGYdzw7DM6D9U3A9GoDslRer3n5lIrSgXJn9tkd8YqTfi
	 WPPAt8uWxcGO3/3fAyGQDA0lujb5hfatNFKyRYlgz9GJfocNIQSpdh0jRmf5HIM6w4OVz
	 IUGNH+c9EagDewafPhHz+HKzYNjqN4Ksh9iBakQfCG2vJA7iW82fzjE3ZESHMJBbfFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LdeAbaCm;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49806606A31F
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 08:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49806606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LdeAbaCm
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so112344875e9.1
        for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 00:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795852939; x=1796457739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=LdeAbaCmG6aGvR2nb8gxW5A8NUpC5be/ax/tgsLkZ3JfclnVHSCztMsXwwaOxtfCbs
         Whn6R4Xgag5vvedOlLOOqZIFnO8p/ma9v3ewdMLMmUyJbXJcCYsbNL5BU8NrNcJm0+oO
         eSwAcSAwqLPgE02R/6QTtbzMaR7x4ACNhuLU3ilAUFgQLJwW15oDv2Zj8CLXGoYhlgUI
         KPtuMWxjbplrMNqe/O/GPbWscg6EDpj7foYgYY/edB2p0i/glCFuhZ0rShexO1TvOxJ0
         V83OwMTYNND+twHG115GRwZtJlnojvLS57hCFDQamb/4om6vZZDhNJMq1HEeB6yzOL4r
         qeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852939; x=1796457739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvYCv8hY4UfHhfetpozuse+xYZWS5m8FKY73N24xD70=;
        b=eeIqPJn2Nj/YFb9rusYAkgmnyg/ZcWILEWYtdTvWgWLvw8cpPHaMYMI58g9y0ShJKQ
         zGGehJwDxw/cXK0zMjZoxT9kj6fgXScFVn1RpCouO+d9Ur3OoOXSBO800hrvL1ETmzzF
         sBAH8O9wovK2icQxjmzxJvFKupopZr9UMb7Xf1N7U1KsvzapU8pMqvnlcHOFGq1fzci9
         EAPHNxLFF/EbDMWNGgPWJaZEue79GURTBlfC1MWSKoZLlvCmIyOsSsWF4XZncUuJCOof
         DCoLeZ4Lc25bCT5scjnK7KNPD2H3KpwkzEschbfe8nP/tpmyItT+Jc4aRv8Zuhu6E2Uy
         STOg==
X-Forwarded-Encrypted: i=1; AL+hErFHR2Qo+sWS17M1+hAWkudZtKpvRZRETJH2KEYuCeKXnh1vASWNLUCDU/iBAMEg2g2rC6iH8S4oLxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ti7B7u5dg7vEaRJ0uuPh24pNrn6A15RnwuKdQoeMNvlOAfgs1
	JR2vgdcIpexbiuNt6t4iM6ZDmbf8a0ewJfNMk3JiKdy98zDIZ3t/ug7D6ixBazZSzB+k3RsRjLx
	E8XS6TlI=
X-Gm-Gg: AZFdTZeG+shuVKno+p0ZE+pzLgpUWRMhnxfM2xaCAd4asL46gId0TCVlLQpKnLPWlDL
	KC3xVGcXp1DjEsXkC/Zuh/2TlevpoevYbGnjbjdAJDlkqacU2nd4TDHUu8c9vAW0DkRbleNkhup
	ohgLNv5Soao/ITJaFSeQgqnEDthRlRmeCXuJuqeJmMrbUbf8KPPk5+N0V3FQ8NC51P9O5X66oqF
	ju4r6Ix/HIbLurVybRZFcj8Jb3WMaVSlDze2j7T1wl2gn9AhQA432hHUfPYVTajPcrt6/RiSJzt
	5164mn/7OrMPdxKLYlMuJrwzhS2TZHGrW+6BO/P7Xfl6k21XA+oyNxLUqZ2dYciONkLfIzTtj8/
	Jw5J1+l4FZT6zRN/L1dK0tPAVWaDTBMYitJFA9juu+Q3r8JOHL9EXkuEDGewi16evuMN4NGQgCd
	SCcG4JtCm7BQ86m88RMosY2rh3S30kyKuYRDOBXn2oguu9JI6yY/SmhldIiKYBf6CSNMufFDqAe
	pTaDD2pPSmc/pJJx3QPccpZpOYsgoy9aUdtO+u55BWmyLUIBdrYLAHY+NkV7TT2G8fB63rsiaMe
	0Gm/fw7ERcJC3opifZ4dZ5qUFVOhsK1Pu4ijKWmhImgbp2gGkn+o2pFssSgYdnqZ0UY/h1nCWAY
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr505581765e9.9.1795852938637;
        Sat, 28 Nov 2026 00:02:18 -0800 (PST)
Received: from localhost (ip-005-146-085-079.um05.pools.vodafone-ip.de. [5.146.85.79])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf680fsm59330195f8f.14.2026.11.28.00.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:02:17 -0800 (PST)
Date: Sat, 28 Nov 2026 09:02:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
Message-ID: <awqKD6EufgpjsjP8@monoceros>
References: <20261127073231.1776847-1-alastair@d-silva.org>
 <20261127073231.1776847-7-alastair@d-silva.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xgu3d2pgo3fouvi"
Content-Disposition: inline
In-Reply-To: <20261127073231.1776847-7-alastair@d-silva.org>


--6xgu3d2pgo3fouvi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY
 driver
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 06:32:26PM +1100, Alastair D'Silva wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> provides of_device_id already without the
unneeded build dependencies that <linux/mod_devicetable.h> comes with.
So please drop <linux/mod_devicetable.h>.

There is no need to Cc: me for the next revisions of your series.

Best regards
Uwe

--6xgu3d2pgo3fouvi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsKioUACgkQj4D7WH0S
/k7jYAf/QI/UwQ7qh2BbAqLJFatOOEv5i4Gi+vBVMqy7v16wMvrk3u7U4/ECqS/O
C2/R+NZfyAK6CTe/5t37K/v9LeyvsEN4IbMSK3b5rwXFErl5KgfUZIBdgbD/1BJJ
UP2X0g6ABsQZ5fNkNJXk8nerljU4Pxf7OUuWsz42+HHHKiq9AcZwAZgrS/TttgCN
xeKamMt2XFYPMdjOhAhO57r/l3qPChmlWbT2bDdzM4i9nTyLBXrDRghnJWItoaN4
puwi4x03yymrmDrp7IH2TYfNTOy/Lcc0OcjvpqxxhIG18CeOOMBMdMXQofE0HdQ6
Htyr2kbi6xiqECUEVFTnuPE7uy+hvw==
=iKhd
-----END PGP SIGNATURE-----

--6xgu3d2pgo3fouvi--
