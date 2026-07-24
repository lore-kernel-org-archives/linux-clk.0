Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219D421229
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889254; cv=none; b=GDNqr69ERXO+a8un1VH6IkGXDI7tcf6v4g1A1SgqW/xMh/ott6iYuhh3wYRZKuy48dDBbAvnYtsnB8BhjuCfwanm8kDu+SAhy/ZxEQ4c630g5EbxXCG9JwEs4Zt41QfA6qnTjJ+Wj4xPly3/uDWzgZz8SpE8md+iwGcwDL09kiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889254; c=relaxed/simple;
	bh=7yJ0XIwJzjPOJ+yWjxzt78IMRepMQzFTHARmaw7TQm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfCbZLv8k+xrwL7tA0sHCyIGSSKY/8LUFDzrognnhs5HGKQR8hEOBVPlvsYoWCqroyRWLMSzq3rEwJS/ht6cEHGq7rb6Kc/kFSQxjrQzi7+mloyJOYEEV69zSKWWLroFGbBNPrlDmGOm9M5Iaj7LmTj9gaq3YwBrki/JN88Pd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oVNqgStd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oVNqgStd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso2885765e9.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784889250; x=1785494050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yJ0XIwJzjPOJ+yWjxzt78IMRepMQzFTHARmaw7TQm0=;
        b=oVNqgStdVX497sSXZdAcVyYA29KAAXJIV7gRy97FYSULEE8QZuMm0EjFvMRKcSTXSA
         /kDRv6rrt2solcbodOtwgKqMrfrVz9yXyCKZBCmWEtYbq8X0IT1SedCt0FveUGiBP+Oi
         xf2XIZ/VN8gQ7SdAB+ayX5KYgMujr7KBp+I0ozaVNfLYy0FKwV6ftLntTQS9EJgF+DyM
         WI6lpFvb5E8Oa3rKLRxPDnm1qqDuhfyfXlpNZVvWsxKuxq0htNnbMx0snrwq+VwMANHR
         lPCK/F/1/nttuMc/6gIOuOGJjJBe9q4yz07w3gQDTI9YaKen9Wa4/51NNcpXfx6C8K96
         gksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889250; x=1785494050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yJ0XIwJzjPOJ+yWjxzt78IMRepMQzFTHARmaw7TQm0=;
        b=q7o/U/XeRsZRJTOa+lbxcTOfwmx1b48vU05pyUTcisKWXBWrSxu8HAbf8z5B9CtaWg
         ikcCRAgKESWmDKSzdFGynufAKDLtplMScGbgF8CeC6iILVUGFpWEHChHLmik5m+x9dyZ
         njldw0mlLYa/XYzS4MXkIxzim/DE/VvbUSP4bPEMpKTfMCv+PfWmAsmlziTPjw+/DjAx
         6WIXl59EHruOTvalI3IPbcC6ndhLBZf0/4qb+iPOz3CqlJ94zBmSz/HjnwY7vTAsY2NC
         vZySrUbIgtd0VNCO8Emx1HLPxqsw60VwsAkSZssoKOKr93BsUTIsW4ZVg7vpWTM9/jNO
         QpRw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3BX74AMA3GYG12Q5uier4U5tuMXPpZmtsCWqkutN1/4IGa7CghOFRnYtHUlLBYvjEuPyV+lpjEO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrtXAe5t3F+f/cIZM0vMhmoo1zewR+sV0be25F0DeQH1KlrjlY
	NRcouzdMTF09JIMxAMlciAs67bSo3WeJ/5fgKi5CIaHnBY7LI3Xn7w1Rf5CJi/yidYU=
X-Gm-Gg: AR+sD10kYO4kz+Hv5iN2CkPK047qEuNTlkoHZx/Kinpi8sBnikLrZOsw/dyI9xCBayr
	1CguZBsepQcsRU4dbPNxT50uG9p2GcfM7ihtOQ/QdYEr73shMRPT9HGEcUdJLCJICd8Kc2dIVeo
	+SBbhhVHUJ67efDT09z/72L7B5OPB64Y7xEgUoxpo6rriT7uEsd7heAm201pwQVwJdDJ0B9h2ha
	e9hMS9M4GzU0iHhBMWa3dFaYoCAUmFOJnDQZvpCds14MoZY/Qfrku9gILFM8IQHlJ9RLT+ib9OG
	NvFFr7desOBjJJJopmpv0a9rDhq9zJ4IZB0UywfLgc6X5aH4u534RX6E7G50NdNJq24XGmaVXTF
	fgpEM9TGD8TrSmmFAxC4eavEaBc7rBSm+c1NDcA3IP77GbTJ5QqMGkzrWe1soeClt41ppzI2+va
	nP6ya0PuE=
X-Received: by 2002:a05:600c:3b0e:b0:495:78af:78e5 with SMTP id 5b1f17b1804b1-49578af7abemr52456775e9.1.1784889250156;
        Fri, 24 Jul 2026 03:34:10 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957afac187sm58468025e9.11.2026.07.24.03.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:34:09 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:34:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
Message-ID: <amM_ViJcG0jbDNmB@monoceros>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t2bnazuvarmd3e35"
Content-Disposition: inline
In-Reply-To: <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>


--t2bnazuvarmd3e35
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
MIME-Version: 1.0

On Thu, Jul 23, 2026 at 09:15:52PM +0530, Imran Shaik wrote:
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> is supposed to go away. So please drop the
include for the latter.

Thanks
Uwe

--t2bnazuvarmd3e35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpjP50ACgkQj4D7WH0S
/k4/sQf8D2+PWz3SlUqpHSWzW3vCjzo8yJcf/44rjrQuErQ97PsZnrshJVLId4Ro
Y4MeRfq2WTIQFO5Gpz2UvWOywcryX18qUEPKGSgc/R/nkwbrmwNbeECdMxm94XdV
pJ9UjqXVPDlbNvOniqBLYBs8XAyGr4E/+puRfHJ03ZKNK//+Sa08d+oiD9gEvwAv
ItYFdIzkIqZ1kIgCWyrngOetlRK8z5NoGazvl2xbPPPrBjqoZFBJtTB7TyaTv0Pp
W+2kjElwpBuBmlf4Dkdh2BYuKatxjtBOLTf+q2j9yzHD9G4vNdiagcF0xs9hlvlZ
wKs9kfYotxt+3MzBoNcv/uUcGPw0vw==
=GYne
-----END PGP SIGNATURE-----

--t2bnazuvarmd3e35--
