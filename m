Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270E36CDE0
	for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 22:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661582; cv=none; b=O6spVyZVojhOumnRTBQBfdDnjQ0Sh6I/VEQV/q532Fp1QLXzD5OJ4lqUL9kp9fuSPHU0wYUyk9hV6B/bFVcNBlwMTzHdFZoAMzKqCYtzAcORi5SxBJf4RXKMbugqG44Mn2n741xOJgsSsQawebSSFku43pCXvMH4Y+3hHYEKDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661582; c=relaxed/simple;
	bh=jOcN88w3MTBRqLOWyCqISw32454XD3ohZBOJ4M+I9w8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=T4R365GbmMMreGmdyqtQHPor4jy/ALzFbN/5/Frl51vLGQtCLjg7mO2Y2VY6+WYDHyMp1UzAe8kapL0jIJ+uUBb/zfsrWlviE5/yU6+OfAjZP9UoDgLB/7DTxNPkSZb8sE6h1IMcIh/TiRnVSTUbzs2W35d6/Bd7yI56eTZNkt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIkWdmbO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIkWdmbO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso13595705e9.2
        for <linux-clk@vger.kernel.org>; Sun, 24 May 2026 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779661579; x=1780266379; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD1NSvIYIbwsptEQaRl9/X9RefT87sq45fvetWKbNsA=;
        b=QIkWdmbOWw6B2ihP0EMJzZIBMnkNPvcVT5NUhanxTpyZG18FyZHSd1Pp7ygVm83UUi
         W0y6rFL2Od6FGcz+/GGUms2sAfC9vqtXriMFSW3iJBtXWF7lH8pgIojQfBQGQwLFvY6c
         houVLbL4gElbHNyEo0fKjcY/wYMOAfDmku5kjydoyXV9lI5fuGHyYXtlpXSOlPUbRI0a
         DblsF3K46DVSCVwgH2vvJlwj/oe8HoR64s0hyVtDPyuIbDFnHu9Ujx74t3syIIvI6gaF
         U8Fj4nC6bO2yUwegUL+563CFoP//lUOdbOlRgCe+0m3ZLV1Q8rYpi6jNmRlGyJNmWL1k
         Aq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779661579; x=1780266379;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD1NSvIYIbwsptEQaRl9/X9RefT87sq45fvetWKbNsA=;
        b=nrZdiuGKwEzZVRZBoDAX/ADMmmFW48nVzduZsk3ZFOYCchJOjrRGhk1lsWYTYTKjDm
         xYu6znoESUrU/C25QewLBC63AzyXn2A617sndY+kI8mAZuWpmpw3QRH0GevWqQu35UqZ
         1gl3E68y4Xtm9HkbkckHg4c3MpAGF1KZKJsLrRr7/82jD7QqtGzBMhqH9GxkhoUL8Fp4
         scFQEtPFlc8FJAZso1UXyYsg1ks0rK6ChMQE3QEI6qVf8eFBDMgMEWVf8BlaaEq2ZDb/
         ZdXlhKGUoio31Ns1w3LB8KtDwLjk7VcpuEk3FN+mj7aWVtPqiwFL7KycxSo6AewClP4q
         tDfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l8GajBZ/zwq+32VEb6M+GpPKn5EMhUGTA4SY/zngoBo15YAv4jXswNa857dzfLt0eA2/yVLg8als=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMsHHZ0JruemnS0CLwO/A8do/Qbr2RFxtX05RWXBcHEpyVzsm8
	y1fBqI5RTSdE8jB2b2AJi223PCHQJApJUkzYIsSCTmgx6JLLKJeYKutNq8jhx9ZyutMHfYs2dhv
	dGmxZ
X-Gm-Gg: Acq92OHy7So1tM/f/BCfpyQhJ1TuAuXOTXocd52V9mjx0ToJ+CEjPgjYd0Dv6T913TQ
	eMc00cI2Q3dq9nzzL9JeiF9VAF+at349piMTjPeVrFPTmftMU7Y0qpxUZcg41/0kVlMCXV8o4qy
	hZYeuy+jtDqW88fn9+UKHeK2zrS4fuQOS+0YO1DOxeJRRgN2JFABXQOY9ivav/ujr5fZjRgQLWA
	xgoIUZ4mSghW86VqRzyg+iY6aypk7msdr0eMTtYVT3kfnw1kRCpRsA+hrP52GddojOszggDa7Oj
	iaQc0VzMLcfRDHbiamm4c3LCz3rUDBivyU6aCP65v9BIvctmjbluX4RP++rYwW8TZKoGXx7Htlj
	+sS5jWAoQeT0YBK/sNzkbyfybZJsmRFPv6CmuQmvTyU4SYKo2cGHdWhGIOAeOPfihGB2iS65yOW
	ntTNLBc/sY9uWgISTcEqOrFFXzcfCfbLADC3IHvdQ6O4D+E5BWWnsTpAJOgv+eY2iAFo2eXtdxD
	vUIitv3P+77xw==
X-Received: by 2002:a05:600c:3581:b0:490:482c:4391 with SMTP id 5b1f17b1804b1-490482c4586mr199122155e9.23.1779661579070;
        Sun, 24 May 2026 15:26:19 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428ec538sm69746305e9.23.2026.05.24.15.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 15:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 May 2026 23:26:16 +0100
Message-Id: <DIR9DLGP2EN5.21HR8BY11G5SF@linaro.org>
Cc: "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and
 cleanups
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
 <177965159562.32222.17454581524471571236.b4-ty@b4>
In-Reply-To: <177965159562.32222.17454581524471571236.b4-ty@b4>

On Sun May 24, 2026 at 8:40 PM BST, Krzysztof Kozlowski wrote:
>
> On Fri, 15 May 2026 09:32:24 +0000, Tudor Ambarus wrote:
>> This series introduces protocol support for the Exynos
>> Thermal Management Unit (TMU) to the ACPM driver, alongside several
>> cleanups.
>>=20
>> Dependencies
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Krzysztof, these patches together with the acpm fixes from your `fixes`
>> branch will be needed by the thermal maintainers. I'm going to send the
>> ACPM TMU (thermal) driver for review. In case they'll take it for the
>> next release, we'll need an immutable tag with the acpm fixes, cleanup
>> and thermal helpers. Thanks!
>>=20
>> [...]
>
> Applied, thanks!
>
> [1/6] firmware: samsung: acpm: Consolidate transfer initialization helper
>       https://git.kernel.org/krzk/linux/c/43d3733b7ffd82b2bfeda69befa2a17=
9335dfe6c
> [2/6] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_pt=
r
>       https://git.kernel.org/krzk/linux/c/7b20fd06f783c1e901d34305c68df16=
212cdf669
> [3/6] firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops mem=
bers
>       https://git.kernel.org/krzk/linux/c/ef1109e4b6120a52be1ea66d486d674=
4d0c5ac47
> [4/6] firmware: samsung: acpm: Make acpm_ops const and access via pointer
>       https://git.kernel.org/krzk/linux/c/e694e19bf7db26ee324ff6bb450cc52=
3592f5bee
> [5/6] firmware: samsung: acpm: Add TMU protocol support
>       https://git.kernel.org/krzk/linux/c/f6af402de525d0848fc4a50f25ff01f=
56fc68d98

That commit contained the questionable error conversion which works
only for gs101 -- acpm_tmu_to_linux_err() hides some sensible errors into -=
EIO.
There were on-going discussion on maillist.

Now, it is needed to ignore that or generalise that or split it to have
different SoCs if needed. Some re-work will be needed.

BR,
Alexey.

