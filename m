Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150E392C48
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978470; cv=none; b=HG7n6gHYasq7c/8bBHcStvffXqXsM9yVZqileiemMn9avgaFkbT/gkYuoYCRcZt876LYEqgwGwM6Qo7hD1Pb9UGf6KSJcQI+M8v1W3UdeQ7plgoynmS0teQa2/1incumVQ2sQXaJ6A7+uEWnaXPMLRmL+Ly5NVGA0mI8uH3yumM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978470; c=relaxed/simple;
	bh=jpVDW6nqXT3bwXZCXv2EI+3UUbOFqSMc60wFkeXbAgk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To; b=lc6H17zyAHxB/RAfdVJWx9YSkIwAR5bDDMsWn1976KpHWyw37ak/I0asbP+F/LhKTUp30WRmBNH/pfQVjT+5GZR2Fz31myB+8kpsnk1ZaYyBs5MbH9Odes053/E0WhxkBEcEH/8ekywnzd+rqc9rw1V8RnT7ec60FDOFUhl4zsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qeX0in1d; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qeX0in1d"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso60289405e9.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 11:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788978465; x=1789583265; darn=vger.kernel.org;
        h=to:from:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzzpRVmc6Qf1040g7Lq6SnAgBrX6WGAOi89cdyMonLo=;
        b=qeX0in1dIzu48J9x5R8KqoTgevc4Ha9nGP+vm5qnQuFRJAQAKFfvLkerixsPp9wrN7
         NQceb6BXTODR7Uphy1FCizGjrECYncTVVgc1vN2ooJ+LPAdnQz5D9+KSM5WHRWJz4xx2
         1Whs9gaD89BhX3DwW6WYIlZbM1W04FhS3wmCLrNH0F+NU9p4Pq2N6FC7TQUCDXcQi3sl
         JcahU8yX7q51iL1NCo1/NHpl4qaLgqd2YrcNgpkFlSD+lj4cnz8brt1/YPyI/4X67Vnn
         ItI8xIPR7iVaPcyP29zq//wxxgPmLmPevJP8BQed3TRGKlFXEzO5NsmlFmeBjMbtyrNw
         PI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978465; x=1789583265;
        h=to:from:subject:cc:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzzpRVmc6Qf1040g7Lq6SnAgBrX6WGAOi89cdyMonLo=;
        b=hfLr/hpRUjqwXv/z+OOQFQzmPgw//webRitKzOvMI1dJe1O2Q0yju4b7IKdCXT/ZCO
         +LgV+su/UBelJkgDydnr0Xbldr7mGkGMRZB4PsoeAWb+XzTqT2pCWi7IvjpEUuoACKqu
         wWo1B7tqUSgN8OGSRU4SNF9/Sh/ixsOyLqb8qHykgiMTN7qxDK1HcjyC07mVyMhgeXtC
         xMqrpCFlqNJWay3c4e1xNstA15dzNaciTcLWwQc0SeJ5S9SW0sPKnuUaZ2YWi8v1Iw1U
         OGAd5K9XsCSE1NYFLiuS1QBAmsYgnTePqBufMMeOL/jd9EkTNHj++YwEugZSOsOASBXz
         5nUQ==
X-Gm-Message-State: AFuF++kdTBZgGLNL3ptQjvxRvkGvOao9m71Wu4OBGYyTPfm4gqAX2qQd
	ao9Yk4uGtVTridWC+QTIf2V0LVhPaikpRAd7CNXgbOvaknSlrlSaXQtocvLe6SDqfus=
X-Gm-Gg: AYBFou1R+xWoqeHykTm5IcEO9D2l4kCJmRDxZRmqGfyS6KzaSHvNyJUJ+6KLpCLKeE0
	rgDrY+GOWvrs/0qfKnqVsLu2FBjzFJaFWgXvtXYvdMJz3kz9Fnpw7saC9/+6gEfyWn7w6BjXG1c
	Tka72M9cgaqEPhSCknuELRbmYv79Jg82BcmQH1DQuCwyuT7l/7ekXojMFmBmI6TgponGd1xcJjA
	Qvh6Jw41/e8/tvt1dQxNKggHsJUJ7xwQg8ICH/DLu52uWA41QfOI9K06DU9lF8RwwZoWHl0TYMw
	JeAarC/ydODnwEbZ1r8SXmYniir/dmadEzMlNro0uZyq6lCWplpzhSq0ZzCz6yQnNBHbv5RrN2L
	thR5Iq4jAg4Ty8G9ByTnidHSzvVOQn32TvHn9kPnEKqe1aoQDIkOfitlSolXf/p5lKvRKYL7EzX
	NLAgnWbnbRy7PeF5SAOhU5q4gjAuF8AM/w2ukCX+80SrKP4rWw0RdwWvoUw1bVBqom1shPANmQA
	0z5V2/0+NYWPe2A8ORCym38dDP6tGveXqIZmAvFFdf/CIBnCWyByIXHSObU
X-Received: by 2002:a05:600c:64c6:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49cfa20ccaemr335752275e9.25.1788978465474;
        Wed, 09 Sep 2026 11:27:45 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c07c17sm11855715e9.14.2026.09.09.11.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 19:27:44 +0100
Message-Id: <DLAZXSNZK6QC.1VFAX37XCXBOV@linaro.org>
Cc: <linux-clk@vger.kernel.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-samsung-soc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [question] [Exynos850] ACPM firmware doesn't implement
 ->recalc_rate for acpm clocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>
X-Mailer: aerc 0.21.0

Hi all,

I'm working on Exynos850 platform support and currently trying to deal with
ACPM firmware clocks. ACPM is firmware running on separate co-processor
(like SCPI/SCMI thingy for instance).

Unlike gs101, the ACPM firmware clocks protocol on Exynos850 does not
implement get_rate() ACPM IPC call. Set_rate works fine, but get_rate
returns 0. Downstream reads MMIO registers directly to obtain the rate for
these clocks.

The file is drivers/clk/samsung/clk-acpm.c
static const struct clk_ops acpm_clk_ops =3D {
	.recalc_rate =3D acpm_clk_recalc_rate, <-- not impl by firmware
	.determine_rate =3D acpm_clk_determine_rate,
	.set_rate =3D acpm_clk_set_rate,
};

Currently I made ACPM clocks childs of corresponding parent clocks, for
instance, for CPU clocks:
	clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
		 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
	clock-names =3D "cpucl0", "cpucl1";
and just return parent_rate from ->recalc_rate().

The problem is that stale (cached) value is returned all the time despite
CLK_GET_RATE_NOCACHE. I tried different approaches but don't see smth
upstreameable because clock rates are changed behind Linux and I need
to trigger something like clk_get_rate(parent_clock) to let the new rate
propagate down the tree.

Which pattern is preferred for upstream acceptance here?

1. Return parent_rate as is and live with stale parent rate.
2. Cache the set value in ->set_rate() and return it in ->recalc_rate().
3. Utilise clock rate change notifiers somehow and upon POST_RATE_CHANGE
   do smth like clk_set_rate(parent, new_rate) but that probably breaks
   locking and mixes clk-provider with clk-consumer.
4. Maybe use/play with CLK_SET_RATE_PARENT?

Or something else?
Best regards,
Alexey
