Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE9C35F16E
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 20:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792065; cv=none; b=m5I8kgjYJU732ylhHZ8Hvslf4RSrjN8VyTBxGy8eWW/st6WkGMIhSE36fj+3dCSeU1wsyksvzEAXG1OnajpZdnxk4mRJRa49IawYNRZmBc1vLqVDg3cHrOCATUWZkPCRkbJn3IYQNLuSSzkAF6Tw3I3zGTgwjfwy36TKBoyJ4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792065; c=relaxed/simple;
	bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rtjrNNfjefpP6XNhEWvl1XP7Ly1T/fobYizX4j9yQ8L4pm04K+0zXyeSQquM0D/kdL2O3+uvLB4m/m+NOHXMS0spEufv3jJOtSsidBUY0cfii15seVLy9VLhSn+QuJnCILCEyimlhBwirF0ideidqGUkKPNWyI5XkoaaG/EBbH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7pHykAc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7pHykAc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso73837445e9.0
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 13:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778792063; x=1779396863; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=;
        b=C7pHykAcpNNaBjN4JX12Q5/W5zNGlY6c75d/0uhrvOC5t/td5i224kW4yaTZtBtyiT
         DKEQKZV+C+mSzuISCIYZUF+BpvQ/M8ZtO54y0NwKHQvktfqgW9NAeMbd+3jzoWUmYfkZ
         b6GrRmh9j4zye2/cPKdX0pk3TgV3VhGDXpw1HuYXu07+FoE1fKKpeMrH4j/AAswLEMUX
         VGUPB3r7+pWPW5epjFZQtUVYLg2i2FcAWvRtLTU50co38Uil5k0bipni2j6jbF2GfxYe
         4QUellepL7nl26sCFeLyeInsCada1EdvUV/XOLodBrfCjjh4HFYjKuZiKDVj6zLJD5NX
         idnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778792063; x=1779396863;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMlEHXY7hETkupGWEWH9+rO2TKBFczNsf5O8VrW7wo=;
        b=GNpYs3TJM3LVGQ8av0iVjOuertqkWZEmnHUXDRBVP9gCHxcUiGM/M5KWNazIdqcNqm
         jz3HuP3Ti/I+frR8WErxtXVbPBQvu6vRpktLN3VgI5c2OruO2wkkr+lChw6BOX6+b6to
         qRuJTiX1Zy5C7WAYjMeJSEdXxow6L2m4B23i+TiVCqfau4AgTSwRdmqI6JOpSuvtKyyN
         rAa5w0N1aFmsatokrvwr8YpYQlfYTVwWLyXdRQ4PUnm3pTBaQJU+c3FIlwDbJ7eOIZ32
         NasGnldwiNPxp//SYdf88ne2M0e8eHlk3Pmt4E17X61IvQl5ziaMGdI2FDVBPBGzlr3q
         NoHw==
X-Forwarded-Encrypted: i=1; AFNElJ/B3iBz6CiRazQE2BkWKpFqAo5d8iP/xWgt5jxPzJJvxtOA17iL89l99AZhb50qCI3VzS76ZGlNDds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBZBarKRjJtEvjMj1hD8WYUbSdbSczMahoxYVWXkpd+ZPkPfWt
	uoNp0AWXbLfXCBqhrrPuCJYMWs0gQti5kD5KP6lG14uYaZklZSAGODWu
X-Gm-Gg: Acq92OE3KAj9crjaRvh/yBnQtTVxdNJ35tM5zUMOsSCHs9HXcV11pvBSAYUzUDn72jt
	OVBS8YUJYVNp3uvJb+8oZGvSuB8sGdZo468JqHX7Qfylf7WVBKE8gaC2El36OTzIfVmIx/dqPtM
	zSYGXB02bsMV+zqV5toSvIeGWi5ELkOsl5/j276N/T6HmmUh8KJ+iKhpjdUqZh+C7gLDIUZjJ+g
	Z0SykwqnadjmxXE8TpqGzUKVkgm77E8N0pHzhTGBlpLpVDIOwJeV8F1IxhApcKv7Cs9ZANatE5D
	I4TPGCKNncoV88WNSBg3NkFy68P6sW+FERIh4Z5/2T87PX5d6imGN1agjr9oK+u8HhjEDR7FD8q
	m0MlPQXngc9QF6hGy9q07jJIPV113lWNkKAZd7BE8U8plf5rFi/RmoWjG1QtQ1ow7uKMYWUiguU
	cauRD+ljiqj5DYIRdUE2Sxp/swclGP2MHmxZwnvyOkTDon6A==
X-Received: by 2002:a05:600c:6995:b0:489:1f97:6b1d with SMTP id 5b1f17b1804b1-48fe6322219mr11555345e9.28.1778792062912;
        Thu, 14 May 2026 13:54:22 -0700 (PDT)
Received: from strix.localnet ([197.250.51.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53767ecsm14608105e9.10.2026.05.14.13.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 13:54:21 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC v2 1/4] dt-bindings: clk: zte: Add zx297520v3 clock and reset
 bindings.
Date: Thu, 14 May 2026 23:54:08 +0300
Message-ID: <5993526.DvuYhMxLoT@strix>
In-Reply-To: <20260512-musket-gaffe-376f0450a610@spud>
References:
 <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
 <DD71E384-1777-47B8-93C8-D6EFDA4BA74C@gmail.com>
 <20260512-musket-gaffe-376f0450a610@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6267680.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6267680.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Thu, 14 May 2026 23:54:08 +0300
Message-ID: <5993526.DvuYhMxLoT@strix>
In-Reply-To: <20260512-musket-gaffe-376f0450a610@spud>
MIME-Version: 1.0

Am Dienstag, 12. Mai 2026, 20:02:03 Ostafrikanische Zeit schrieben Sie:
> Unless you want to model top + matrix as a single node with two register
> regions, then list it all. Hiding the relationships is ill-advised IMO.

I actually like the idea of modeling it as a single node. I'll give it a try.
--nextPart6267680.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoGNnAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiz5AQAIUbXFrbsjS/R0yXIQdA
b1difyWEbPGIi5HfSb1sf542X+XVqCXHizeLtRKZlWwCyj0sk9jpqYoRVia5j6dF
ybEknbcJ9zAS2119flV9HxmkGicslIwemmhu+gwZfN/isfPCu4qvc1Ka1Qp9Q96B
suf9ksGMyQw3RQ8QFFymslUufSQDTmkZNZNREBUaUGrlJh0bu6Mm1C3VNtmEur+5
6iHFmf9W1oGmxl9GPVygMFbt3agnG60QySBNj8YPpiBu0ga/9a1ljEszdQc+CgQz
Rqq3nF6yoFZjJpIAfFzkmfi264LwqW3GQigKv6399wxlyVWCrwcH+d64yZwpuFM6
lU0rCRX5D3LpehfKfgrPUtGLOTyW3/x26tTWGKooWKJf9e3+AdjOZMlsa464R2pW
rElZEhBYB7wT5NHyr/zpQIje/3PNGMd9UvoggGsS+rMx2/5BrSOlFGGf7kKhquUk
aF6IV/9pxSZfHJ7v/HYX6NnoBT9L+FtK6bHtX0rgNP65fI9v4kRN4Lj4JkI9Nsa9
eZTciGlEz61crCNgczdNgfxhzvKC9RiJtjHHX9iD/wvLVyZhf5B5BcTdu2liw1EP
TnLsYySz/XcMP3XIlZmQg4eB+oeAy1FgIG3JOIW8nBrtkepBtJyKiBQVvz85tU42
G2m9j2RBmGrgURCqe8LoW8J6
=xlqn
-----END PGP SIGNATURE-----

--nextPart6267680.lOV4Wx5bFT--



