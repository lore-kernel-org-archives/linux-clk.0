Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5C37A820
	for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 22:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894922; cv=none; b=LichoSI0+MEZd069CXYPUbYfyOdiS6/9WWhpQkPxiCsIFPTUymL4dPjXAx+esKABB4Nw2+fK8dZeic+YNgYHMMplKqwOwQprIbIo0Cq5KTFv1AvRLNSkYHAwsVmtmLtm3TEAwASrLTGnzVfTj9XXkGsuGZcNahR7IW9ZPDBYIOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894922; c=relaxed/simple;
	bh=fGfuu5GVufwu5Qg5o7fhFLMfDUxFownesqiCSdLkQJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK8GkGiHIYyEppMQjnSmkPjuu4xIfMg7zVCOVCrBNQLbTC1PEbfOKoebce3eNGOQUMdtFbh3EU7iD04VygOGSpemEG9Ic3OlQLN0Sx4qlRLyBwQQYDDs2WmQz79CbQzWsvn7pKKnYUYV6d97ViadViCDMldz0jfeshN/WwIkLrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=e/CQTj4H; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="e/CQTj4H"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so15058165e9.0
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 15:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894919; x=1784499719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGfuu5GVufwu5Qg5o7fhFLMfDUxFownesqiCSdLkQJU=;
        b=e/CQTj4HijBiyYwPhL6Rlh/ftWug8ND9BukBCL/FoXqQnHY9ECmwEop/QTqT89OaNm
         8JEx+z8Fl57/tioNaoVLx2b72OJdGcNPywiY4d1v+EkkWX3GqJZD2rFKy9G1zegFXat2
         YLj0T7PrAzc2HxAMq9wvgeI2SoNp19HJ3Lf2ImiN1DFeezkyNsmfZWPcqXed52N6Vv9H
         OcYXDtMEO0qGSrov/jaBlmVmTzkhpVec0PTQhDHZgWScQ6fdAo7WMPAjh6PTU6xLyQc4
         doVFfwvhAKM4oxMB2lfQ/VZOoyhO03nhceahrPCpwzUICdPVCvq/pZ6M4i4I4Z5FgN2Z
         Y8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894919; x=1784499719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGfuu5GVufwu5Qg5o7fhFLMfDUxFownesqiCSdLkQJU=;
        b=kLjAPakWhGakPr/6RLAYtBCFsIa4hHnhgxCfPovkt1/y0CinTMSOIhVbbuiwwFznHD
         L0oo7qeuWhYVF95s52pnNyMGOWyDwyauVrvUa0wsN1y/gkaSzqobV6+AxTK8MxhfzsYH
         XuMkJ/WzCfUItGO5IdLFuJe0tS3Sic+0AKSzSQL/tHi6WAi/5cwoTAL+WKpKktqOiPz+
         wOOzx/KEWSt+iJukU96rhP3lfxbCFIAa05FDsGT03d7ZfLNowwNzJCEBcWCS1Z1ahb/S
         3Dm3gFDbVvQHSir8T/r6sYyPu9MgOHlATdvkwcvov5GutlOmJCnOtzCV2TBuHFAtvmyo
         V04A==
X-Forwarded-Encrypted: i=1; AHgh+Rru0W2u0wsf6zn9hLR6bnN7Kv/6QV/EZxx9ViZ5x32fkAuNlzLyomW82WwamooyE+aTUqauag8gKKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5FJjairIzNksW7AH8oBt+qqcL/547VPiAHpcBmAp0h91pizA
	zrDhG5f4QXM3804bqExYNFSj/Mg8SYcxyTYnEWfFlOgaCAn90irAzrDz3vzmKpfO+aA=
X-Gm-Gg: AfdE7cneFfMMuKrGlW0BhblY3s9gv7nZpwKFz72J1u6ugN1dKA+4sKF7ac1l4zIrv2o
	GLN4xYA8HJxOr/+hdBl988d3isCovTR2DOOm2P6kIowOJxrq7vi10JiiyHkZBHKUJNSBwV5sDEx
	xFi3mMv5qWPqZxUl1ZuCVZRfLZZvd52C+t4w2TfUWOehJNR9dGDETlioY26UrM2TajULCgbAYd4
	5pWe4zdEwspZ9HbSqh4faWzOAtAiXz/kbWdM+nzdb2R+pidRYDwUhbXPo8Q9BULbiZsyc2rtX5c
	qe87bHiVlCBua/alEiBEPdYMKRGHpyfaGweyDQXg5oMymmj++692EJh1E6RtOyoS9lHIPIHxNJO
	TJ0rJ23ASSiNeg7wpJcVh5Nvwhr581Yqsfv1Eu8Dc/zTP8mttzjr3IoI8POa3b4PMHy572ahMHg
	ku6AixWVsnmhrYJEaZcg==
X-Received: by 2002:a05:600c:6387:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-493f87d8583mr74199005e9.2.1783894919632;
        Sun, 12 Jul 2026 15:21:59 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6df417sm335220295e9.8.2026.07.12.15.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:21:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:21:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
Message-ID: <alQTdqZO2DX4-OxB@monoceros>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hjdzayijalqv5rgt"
Content-Disposition: inline
In-Reply-To: <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>


--hjdzayijalqv5rgt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
MIME-Version: 1.0

On Wed, Jul 08, 2026 at 11:55:07PM +0530, Imran Shaik wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--hjdzayijalqv5rgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUE4MACgkQj4D7WH0S
/k7tcgf/Ug2JeXlzQ2GNsny9qgnwyc0tjIz7D2Ou7jyDzNQ+M4GuuV6R0m2+RRYJ
Y2YzjYfymF/aFNCI39xtr4cD16kQKhGg3mDXhxtXhwSPfCmdzPWWkt+Tqd9pIfDL
MeDVbTzwp5uhX+7BRpJQfjUxehs1WC2uMCIMFr6eldJZwGqZvj9jH+bCfiCPc1XH
/j4KfS+JQgpYW5a1dHcePxn9TlrPsZAfp0DPLa9G0mmzaClQNDuaLE208xssgWrh
F21F5d2BmOX/xl+cHn6FyM4kx/DmAFnSPpkLBOWU5K6yBJ0LAjhOuX0VIkkGnOkU
6wHa4a6ws2eR8ZjED1u6QzcB7ocu2g==
=5+8b
-----END PGP SIGNATURE-----

--hjdzayijalqv5rgt--
