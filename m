Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95E53C3C9
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 19:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792006793; cv=none; b=M/7cIEKTT013fU9NAeCfa9n0fZAKxkExB9DmSfSEz7lFDd5z2yuvBC3stV3k4hPsfIgh6U0nKONwNgRU7VMrtu7suQl7C5bg5xphLUzFH/uF48bhe3sScXBBw8vAdWJGjPdV2nsrjcadyIrk2pWjYIj7iTsCvODXF3shxG8mKgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792006793; c=relaxed/simple;
	bh=qSGlkJ/tiRxSKCByNYHm8CeLHYrmmbBMOlrabqcMMZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVfotmM/+Wa63PbLRPbxJySuFsnP/3rVpJuUMhe+Jous7iUOXVJSv76YjCjS8q6QAo6VQlPeqWkaIIO8sQaMT9YAuAqrD86nFEpdn7BQN+zxrXL9fcN/nSZBnjIVqniGHmrkI0PAHo8C9ULTwLe4/iiJkdUIpm0aN+qtqMubzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpJnlKIK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpJnlKIK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so28304995e9.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792006790; x=1792611590; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSGlkJ/tiRxSKCByNYHm8CeLHYrmmbBMOlrabqcMMZ0=;
        b=RpJnlKIK5zyAHIJKcOysLqwJ2yRLmh67WM2HyW0SR/SkSvpE4HbzUTgLhlQKt0kxnT
         sg/rs1ppt2QxutLCOeDR6BQOIEyYUMEGER19GLBzPCP9ZoBihIPy1N1y3McJbXy8GMJC
         2aj+ywQU7jOjF3yvTqjOPmK3sl5cY8kbizqfHsNMex3H7qozdBBZxk1wMdv0IZYP6b6j
         eeuQDJL/uj58scz3CkrzOoQCkl0tNjAqE2AFItIGoSqR7STIiGX2ZmNf5dlNnbdelupg
         oMi/cb784l8WiUyVsrhMNb/i1G+fbvSNxjI89n0q5Oa6IbKm63Uol/WeVk3UOqLrwguY
         oTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006790; x=1792611590;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSGlkJ/tiRxSKCByNYHm8CeLHYrmmbBMOlrabqcMMZ0=;
        b=lSc9LRExU7DjWykEltwkkX5acZ7w4ZzQT9EPGpAxTgcVkbKf9jgiW/QoaohMSDXfIT
         UW4YsPVF49BG1ars0j8tfKF1R+5o+44XZUC9dXfUFxMM/RUmuy+RWNONucxnVcIvtT0w
         hgnuj7nBfeW3m7fTHw6sn/iiW+sbjHMGeP72LMhdhJmYz/C9swTVuOLycHWOJm7U4gdD
         O3UDqS5rnyIr/s2F3+j/B+GQWdVP2unpIvfCiqAMcXbz2ziszBjiox7ZxQDrDMOB47kY
         tETWpKMKCiFy2Cs39SrYpfBI6ZJ59yfWHzQu3Yd37XJMnfX7CnTrRWOVdgvYE7u6u3Ob
         I7OQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6C9VaiNQRrm8S5XtTe30j8czurpduj9L7k/A+fSAhgPpYKtwJv3ndLZjxsUzZ2WzwNsI0c9yThu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaY/ocgMY90sUI/81Hg2nLWQMsNXq8CHcX+ykvcY71WKU5M1HC
	/v/8OkEExqX0vOxzbb58RglSR8fGNSnLdAdp2sgIIA02kv3iYwMlYGae
X-Gm-Gg: AYBFou2zPPbJH6XkZoDXqg9SBwl9kCkPhejGToKMq92ru5WK7wSbzVob/8IfQ75BHba
	HLLdsGiZrYYiIDmSrrSgbEzeJxyplXRUGwrDmv3WgnSnEmQxPS1xy8rQdi8mtItnLgmyyXPUO3T
	WfVURp75FRcxGyd7c9/wBGuO4qQzs0DnSLM1oznQU9Pq5L+mhLFmZxmp6vGACUOsVrZshL23s2z
	IX68DyZyRqgSNIAAvRAu3gVsMzsYTptz2XxruTrsrJQK2PlVyHR8QCDZp+ahYbCHcRSP89zARLn
	y374jHejQx8MvqNwJvGW2pEZftLJKWzBHlBp6xg0XF/+05AFNVLb+41VU73eda5951T24booLHf
	c3FdDn80g48XIi30Iji4IMjk03FLtjMLjHdC1K0tmKcJQGS/6J+krmgOKzmnBMQHQpA/meSeHe5
	CX2cgdcG/bwRQMZk4gf6gQnGEY083cNDg0WnT8ZEUoGuE2WVj1pd0DTB0JcZmiEA+deaPmkTexA
	lFek9hFnYB9T08suFkfDNwaxRjtPuUTOagateRMrrlsaoOZXUx8
X-Received: by 2002:a05:600c:34d4:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a18e4d67d6mr324712255e9.32.1792006789573;
        Wed, 14 Oct 2026 12:39:49 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67b125sm10387095e9.3.2026.10.14.12.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:39:48 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Wed, 14 Oct 2026 21:39:42 +0200
Message-ID: <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
In-Reply-To: <20261014072109.1759502-7-ghahramani.navid@gmail.com>
References:
 <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-7-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart0ktEb2oPSPiRPHnKcsrTTw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart0ktEb2oPSPiRPHnKcsrTTw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 21:39:42 +0200
Message-ID: <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
In-Reply-To: <20261014072109.1759502-7-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

Am Mittwoch, 14. Oktober 2026, 09:20:46 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:
> Support the top CRM and low-speed peripheral clock controllers of the
> ZTE ZX279128S SoC. Implement custom reset controller ops mapping
> logical reset IDs to internal hardware register offsets, and provide
> CRM2 clock gating and reset controller support for PCIe.
>=20
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>

The comments I sent for v1 still apply to v2 I think.

Please try to reuse the infrastructure in place for zx29. Ideally clk-
zx279128s.c should be just static data and a minimalistic _probe function t=
hat=20
invokes zx_clk_common_probe().

The drivers/clk/zte code is upstream in linux-next already. The MFD and res=
et=20
parts are still missing though.

--nextPart0ktEb2oPSPiRPHnKcsrTTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP2n4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiBHoP/1/qah26RVyfGWoIo5XU
a6m6WDESfjpMjuAWlMdAaFxD3xPutu+BcnejO8nU8S3CdKLnNWsPSD13zwk7ZvMS
HsNdJaATkvR148jd3JdikQsrg6X9GIm9OISzJY2aL+wbABR3eR3OeL9Yfe6O8oer
J7hteZN+T7YrhJbrfUtJ67wnfQyzrT0U4asJM1ieL7/wqX8tcu0ATRm/h/dg95Rt
Eku6mMHUTqq8dt9+p0wxYFD6F62iI+6x/f0Ka2I0Ywewd5g5SD5aODyMHf9R96mc
Ps1dE1quyR+FrmT2Pi9H5efSftynT+96E0y8Uwtj9l86DPvSVJ6DYluyE0ARPdpY
OMSJt2X2WSAaY0rz9MMUTy9/qLGk7w/VB4Jdkhrc9CNk5cB1r3Z0fWRG9s2xrJIP
UszhDfMwrYRUapevh6YMMSedDOP4SGF4d/HNQhf2ihgx1fT8npIAB2QnRhBmf0Hp
wTp82GN/2FzU9NCtOqpqxStEQJgBMIi8+JlD5SrixgbU6MTzvw4ZQaIXWKAknIGu
rIlKqu9JHYDhTKPGS6tNLwMJ8Xv0EXVRXQlHzNlUDFdDQIV2DIUQr7XU3C1B1rzK
vq2zCuf7xEsTxe3WbMh3OEgGl5LhApkkPG3ehDf7qL87DWw8ES9gVc8dnamjvy07
Cp5RQIo+S9rHalad5WqiGt6+
=93mx
-----END PGP SIGNATURE-----

--nextPart0ktEb2oPSPiRPHnKcsrTTw--



