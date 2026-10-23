Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747165;
	b=EMKY6CvfDCd1CZYASrLHWV7Rxl/ze8VRGlC/nc76GmBpNeK48+Pc0gNkkOH3wPRsE6Um
	 h2YUq6dCG2ZgAMjR+DImWxWBGejdclaVikW9nhJvYZ+800COFInMLagox2bHpCZRt4SHT
	 YwVOW4AMeYNBP7d9OmhhNaDtj7wcRfP9O/+I6hhvQmZ0uSKNprWuy527GW/uoH3nEvpL+
	 VYwWMGkubiKPLO7L2fhZrfZKnYVkxagdgdAxKcz3HyartLBcHchzWr7wLiq9K4c+7XnwU
	 +8jIULvhxVIXTcntRcGJ/FJSGI2pLXsCxxP8ShtLU5D96ZYjfVFVqLtO8V/sez/zHnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
	b=ca4v7zXHahkgmM03301lKpiKr+sC5ufxGcw/MsQXeUEZj1KdBIGIJr6itZ0VRqAHIJQt
	 3lKQFKUiurM49tGnEehkiKRe9qRDy2ZQ9EJ9oGHgLoivdmFKDSSZpY7/y+NFNPVJmiMrM
	 m//cEyZAUrF8uFl6e2dqJJ/E5uYOFDJI7Djus9Xe0yj9b3JFp74i017DhZuFvKHHHCSBJ
	 mI4Nrgrqo3L3ztLlx70sFUMmTuj+ZDqiKBVboVwDF5nabvImaIR2VCGH1UnvdpKCLx1lj
	 NFVyvYTbQwdaZeowZzeYr5pzsxBzPJtLsgymgw49hLWkuWDb9xkjAZlMvkFeY9qihhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V1nv8nw7;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA3E606A31A
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 09:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA3E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V1nv8nw7
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20c923847so5727635e9.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792747163; x=1793351963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=V1nv8nw7Es+VgKoDXVxc2xoowsXtxzg4VOgfLThVNmD+M2TSPogeK49BjUSvA0Jv5L
         Pv5BHJpFeO6BLUSu7GXLvDraEV8/PDb2l8Z4ioMuWUrwJZw8TVg/h1PIOwJPQALK4Z6Q
         wQrror1EM3CQSHD1uXgcCPYJVlXMhWwOVV+FrwEnZ1Hn4TR901b1o34mlK8lGL4AwGy3
         8O7/XatVkZEvCQl+BZMQUso7fnujZsgo8hBG+CTHd4zunGhpg8sWGbRY0cOYIgGNraon
         zJyWaDdIaMKhmREnscAlUZ77uISpNRcd9G5GLS8LRmwPpAFazvOUpMmuWLXZk5Bq+6mk
         mtlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747163; x=1793351963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLtmbh8p3beyVqvPbT7uOUt8AUzrdi16nA/h6CiToDw=;
        b=gR0UZIc1ZnzNKTFmOEe2l3lYvhOiAVdxHWiKx+Jq3gcBDPQLRH3eYE3D6L2fLYet2I
         RsBP1jnnInQJlFNz4tvW6kG9M8JQ7c4EgTMvmoxvWfpLVIW97u8Iv19cHNRawF9iFhK1
         Jmo6goFFM2IXzfRXb9p4aN4TdFu7PfGHctVx2MpqCgQekwRYt/tIWPfAabx70o6FfN3y
         Yo5jnhAW19NyR0EwsmFhDf30y5hK8Vak/STjJliy11s+KNTvplMbZamPBg9/6+MFJul2
         mIWQg1b/Ezw73zOJh8WEM33dntTFDvbZeLfYt3Qv4MUgtnO0w5BmNvtRiXHhU3+tqD+8
         qoHw==
X-Forwarded-Encrypted: i=1; AKwUvBym3mGLTk7M9LOiDtsVQ5FckUxIZPbV6uDjUq+nxfyL9JXrjXPAimU+f1hqz//GUVczWrq3VZGdupA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQng+QfiRGj/129Mn+5s3f6g5xK96OMSUpDJgenUnBdyHBgg1T
	r/G8UfeLq8j9KCsmGPb+2RTJRCNih86n6w59nSGUPjd5+hBVbljne2yKt25yu6OkPcQ=
X-Gm-Gg: AYBFou2eS9BncEk0DnveM1La/ZUrCVlHGlzKtr52fmPGxVf8PUgNpq6lDtCWzdvvmnS
	xSQ4rou4Kw5NwQihvN96GUd46OjWPgkxQbwsplJvLPB0k8P/r9uDW1LaEqIKOlx6wknFHaLK0NP
	rTq7tS4iCAstckezqK7JU0oG9fmudIN8oPlNw3TGiM0gmxSUH22Ta4PQspbtxJ8oKnr0lOVFctx
	HmRF8B8BrRn0AbGEXdwLVCm8L+psh6gBhtvmdSrtSGnvpTwZ66GpGdsdal4xI5KxGB6XxaStTAo
	66Wp7xNmOnpCOHELkt6H9ujCDm21QVIDsFLp6T4KhHkznaOoUDs8vw82T22bRFa5Rp1aLholJ+w
	8oqUPRPpXkbgaaKL0clw14exgmVC4MNamt2Gyxthg9EprySyA9iEBmRbftqd5x5kkokQgev/aVK
	8vH+qxM8T78T7dgDL9LXFi35kEaeFssu2cEPWqwM4EJxTmsIab8GXAreZ8LhVHFwK3S/6dIagHq
	i7Q77SAMHspJpxPAD5OPqirH/iDWXuZp7uo1i9clK8eNrG4VyoJUKUvcxVZ5/xfvyapTo7zmXGl
	xQUoQlVbL+uM6yuPrbReTk4j1+EoZT+QRm2DqWcUljs=
X-Received: by 2002:a05:600c:8712:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a211cd5eb3mr28983755e9.7.1792747162862;
        Fri, 23 Oct 2026 02:19:22 -0700 (PDT)
Received: from localhost (p200300f65f19a9045816c66224fa2d94.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5816:c662:24fa:2d94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a211ba3e22sm53005535e9.8.2026.10.23.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:19:21 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:19:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
Message-ID: <atsmP_5sX5RFunft@monoceros>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
 <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="covttcbalrymohfa"
Content-Disposition: inline
In-Reply-To: <20261022-a210-init-v1-9-09fb4d99da65@iscas.ac.cn>


--covttcbalrymohfa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 09/18] pinctrl: zhihe: add A210 support
MIME-Version: 1.0

Hello,

On Thu, Oct 22, 2026 at 03:48:17AM +0800, Han Gao wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/mod_devicetable.h> pulls in many unneeded dependencies,
everything it provides that is relevant to your driver should already be
available via <linux/platform_device.h>. So please drop
<linux/mod_devicetable.h>.

Best regards
Uwe

--covttcbalrymohfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrbJpUACgkQj4D7WH0S
/k7J6Af/akzqmN8ibSwrfi12ffHOWdI7Our+3A4vhm7xG5fLhDxm5RVyO9IOnbZF
hEEqQasZCXUckEd3P8maCUNMZrumlljeFYUKxiiGeUptwiJNhDfD5gwgvKN+QznX
WUBMP16Z+bJ04qU+9Jvxwu2AZERVCQgTDx7HM49rEY2meQdARZ+74mmtm7x3AKyE
LAf4maK05HpWCQtSPGWBSz9ZRiv/TrfMYyA43n2Say17TUHYMVEZfRooCn3JlUBB
TybkgcHqyHLbqU2SVAqhlZIuIVWIEQWz1aD92G51OANqUqboJ0wTWbGxYyrQMMd/
VqEBROgHbira21nt4uuVoVmMDk84zQ==
=XQ/k
-----END PGP SIGNATURE-----

--covttcbalrymohfa--
