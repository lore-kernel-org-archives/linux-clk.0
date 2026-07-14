Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03440448CE5
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032039; cv=none; b=VOQtZGbxJlbWxIeHu7svt0D56pwB3Em5LfRC4Z59Xg1OFYL6GI84H6iIhIZflk/s6qlpfdcONGuWN0bFmrng7NjBQPXGASsKaxyz8wHBsOMPboCgx49c7cBOAszaW0H7h0fLc4UBgrwYYb/3fLbGmmHBfZZDwN05YN/ZYHjlau0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032039; c=relaxed/simple;
	bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TADLB51E694/0D39v+kioSkKPdcKnC5PuJPqQvm8luCZvCq/5R9siQMz/l1EwHUb96nAqiqGC7ZqTdklfTnJ3PXFdmIc/nJ/DOQ7P2NmAIYele/+YqV7cbtW3moqCHJHNdcu8qw0bHJUum5b3Xn+C0WVDF5hOic7jRlauw9NmLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PynYh0+J; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PynYh0+J"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so6512815e9.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784032033; x=1784636833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
        b=PynYh0+J+gquIeEfFLT4xpocDZspjFo1uC0tvXr4kcCbJclxbeAeA2JOA0rl3y20ol
         mcit2fW+E+jmrCK96IIoCDFJ1VM3XZlBM1Ol1m+WClgum2198FRqcjPPCLV9qklXozSF
         bNqWPUmMRztTIRAr/uC8vS6aAntTLhgq31sxO+VuZBnLE00avo9wPo2ak+Id2S73P6TP
         JyMTv3npRT44eaT/IXdnaC/THJCMEiU1U8Y0HHTLWki0rZkYwd6+emsgtmO5Xkm2w9R+
         pry/Pqru2T18iu+oxY+ijHeqsYm6DhnLhfMAzC4qCJgPOzNSx45HsubeRl3RQLtb7Mxd
         11HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032033; x=1784636833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
        b=TWPdlfGyRL8uGk1AYfOsr0di011FeSNwAOry2EjZG4FtvO0BrubrGBBwAyQE6uX1QC
         FJn/cGmtEEkQWX3e0GD+nkLL6oLdTOCJeG8ZI7x9t/bQXbrT6fztZoQn8ARkJt9/uPzE
         SEMdSYnh3sYLFsValZlgmQpimwkM/USAFpiISs4thWFhv4Yg4L0FZcbMcqJHkPy4EQ8C
         xFLZEbCm4zJ7eKcO69ZlapDGiWqHGxGUamowe8wpznmlHM86YK0HrrqwNrWpUmVqZete
         46wjHhc5FVtqtckvc9lC/ZnKlkV4wt98DMkhJvpWVPC/ykGO52PG3qUQaA6QjIvEdZoV
         nD/w==
X-Forwarded-Encrypted: i=1; AHgh+RrrX/q8fGTvrMVLkLNvsSBt8KiHs6CURXsAo3IDmjCNdyOBNp8LOnu9tau5YsV0wCC+8cdfXRazS+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvnvqXOL6YPM28324IpwQ6LRisJc8pmD577VW+zyW4BnJPKh6R
	fZcSafFzEwPAnFjf5jK1IkVrO5dAZLyln9/VjXc8tLB59oB8Ei0a6nm5vGyg9plZI7A=
X-Gm-Gg: AfdE7cn1NnXkRvtk4pGFUwiZd6XV5PDUNiHpz7gSwOML9xvqjlwZK5W+bEqrMyTKO8x
	Ptw6GIIclKndbZUQKSx6/sBv/2CGa5wUkNaIVv7Td190RMby1J/5QxSVkcb6kIoMctjJzNnYTVr
	BKVjqwjBhgJY125IqCs2UI4lxnS3rqpKcHcW6mRGbsq0R2cWy7Sy+ilMc49c082rh5bOpgII6be
	vBOxCqCVTILCu+QMlObuHHzBD8mVDA5HPiIyNz3aGXcbG2mwKEuqLywZEr0ci5fSnuq7A08G1ss
	GPwqvWcKJGSAmtuuYlaV6S9eI/7cSoxggUmJF5kSzGpmQ76FR6Zv5qULcTV2tXw3eAzKnmU3DgY
	CDpFQsvy8Ifz+6xYS2uaKMfdKI4lW46jv4qE/VO1BzKk6dBx4OkHFfufqqzHsA9TcpsT0W+b4vK
	Zat+FHVIECHa4R9qy9F0aRikDS5ij4BXLWWIAJaDI2hEDoTAyYmRdQgXmzsXdwh+DJANqVMIgg+
	8+HdMZVw126J/kL1F5F4uASiQ==
X-Received: by 2002:a05:600c:310f:b0:493:ee3a:f05b with SMTP id 5b1f17b1804b1-493f87d7fcdmr131894065e9.7.1784032033466;
        Tue, 14 Jul 2026 05:27:13 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49508732395sm71538925e9.5.2026.07.14.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:27:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:27:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <alYq2J6hd06g9XyC@monoceros>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ebx5plxbs5ed2t4p"
Content-Disposition: inline
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>


--ebx5plxbs5ed2t4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 08:23:45PM +0530, Taniya Das wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>. The latter header is
going away soon.

Best regards
Uwe

--ebx5plxbs5ed2t4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKx0ACgkQj4D7WH0S
/k73NQf/T09jaRmPJhz4l6/RUqCHwddXVzILSJXm5JaBiJDO0DMQ7ba66QjYb4dl
QI1n/Dhb09P32uDl6jsczhMK61GxspOgLrFR2hBJzih+s41bXQ7uPoTac0gcaxYW
7ldbJEM2KWQqFfrv8evU5objg4VkaDip0n9ci9nt6BgjQpYrjjX2clnDM/0zDdp+
J8Dm1K+VIcHnIuhNQqi0ptZUQ7G6eoC2c6bWlZ6aaZm8kmv+yuRaMgI+u78AEzgG
aSj02assVonsMuBMLKWJt55XzGBjwDCaWmUdfxbvs8kPIqtPeP6z5JFX/FcChP14
2tr6zJZjaXuLYoEM5CwI84TE9YnOXQ==
=/t+O
-----END PGP SIGNATURE-----

--ebx5plxbs5ed2t4p--
