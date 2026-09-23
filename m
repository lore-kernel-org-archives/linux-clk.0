Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350E041DEC8
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190425; cv=none; b=P1Mp2X7w/VXMovb1th6j7P1bcC1RRAh/y6p1NMpsXctjgvuM2rBM7FnCyh1K1Sne48Z0+nvoG+K9U+tAIHPGV+Ld7rMcCD76LcamnewM03z4PoIXFYYL07HinxnXxrkoXaLHsanfsg1TqjCUAYWKrONHUUJ9ke7ewXwOZD5LRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190425; c=relaxed/simple;
	bh=3SJ6moiMR97rZgQTa8jc0c3pSuImAf/vLJ0uFkNgxQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kFewv1LSss3RpOEjCiC9g+ecISSj/E2LQn5WUf2o0/JsrrAccOFFAd3myEcCSTbVfQFTAXdsu/ewM8qbI7D8ue2ZVYAzpaX7T22M7Cdp5rfLGOpI4PzWeRtfDBA4JM3Duc2CIUFe+T8Oo5jc3qo+933iq/YYMXdusAd5m3zL3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMN6HcjZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMN6HcjZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so7714605e9.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790190422; x=1790795222; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRrAZTJfbjxM2jhxnygG8js/jIMoruYacFcKnFzjgtQ=;
        b=WMN6HcjZaytY384sOi4JAxY0ABsbD6bpFEYypmGwl+0iG9Mrb9M/74jxA32+Ofy669
         04sAhA+k47lYyI24gkQxVtWfo7wjhw7hrq6W91x9xC4FeXetGYoPRfQdeLuZPVmMJrVx
         vbngUfkPAoWI70WNRU+WMfW5DPhHu+KgeEbkR9cL+cCpOBCrQrBygp2erXwgXOfc/SSl
         ShOX0XOPXCFR8vFliLuZh0OQtqxbmEUFhqb+4RfJ+XydSh0GO4Dm1e0bb4PONYautamz
         Iimf/qzPNVNd/N5mmrOxgrh4JIMyL8LdtOx3KRsqGSQnEKNobEv7psbu5x8b8NrhfvEC
         n/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190422; x=1790795222;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRrAZTJfbjxM2jhxnygG8js/jIMoruYacFcKnFzjgtQ=;
        b=HnwC8sfWE4c4QM0RUyEIl7i8ZLhfpyNWvkMVkUSH9evBNCanoauPpVyZtdWNBQhHZh
         ydTFddnz3UdBQwRIsNmCsEJB4T5QGTmXtrS62M3KMVpEj0sshCLTQl8/WSHH7M2xy5mW
         UDycjKKVvPvp0E0TubZkGuMh2LQFw2yjLGcgrCS2pNEGoIGz9LSnkI+2D189u2UY0lFf
         cSKh+Kfng22dpxydyy9vamkzYA3KIBOuHbgJR/j2qiv3KB2HEON4c/d8zXwv6k3azEyd
         BX+ysskRVBKGzqOQ4fXCpo8ATQh6wcZ2L+3EHPE1nmauV3mnjKAqvy37N73okJX70QMW
         yPVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMzlC1KeB/9it0Rr+KBrVZATjo7qN+JIrnIekqpiEJRdKK6o5Lt48IAquBa1D1cCv25l8UvY5j+Gk=@vger.kernel.org
X-Gm-Message-State: AFuF++nu4XhPjHEhu2hAEVct+6zqY2NhP5C4z/3Whsk1SGI2E162hFl3
	qFOG4VNEXOjemioLH/QfDuvNlH6JdH7CCv8JGE5qRrEX2Z3Go+2lA3j/
X-Gm-Gg: AYBFou3J1ME9VCBUD66pFRkCjv7r8crkjGx2HKgeYH/2JCR6ejYs+8yyzhiVFPuwvjf
	UJos3KTfoNhQQBWS5dZKt8hgdlk5TAh25ghKhrx7VuYNzQWHBJDo1Q0nYLUc415Y207OE5wAxXr
	mjaCmgR1SwA4oTGeMmBvKSrNdM+datTO0LQRVyqb01SXWrp7AZa5/1wwd7Heyi6Yqle2ojVouq7
	nvwzUbjBLY+nq+Z7lth+da/JypnsAsk6P9QBLT0Ru126EtgbQcHMj6+ydNxLGYdXwmmN4Z13MJV
	1F0rADkk/O8xsnLxbDAMoo6rl3YuU+rTM82POLoaRzvMryvi67vhCQuB0l4TZrDiAMxZpjXHNd6
	4sAtic5Hpej9yB5N/30ZKaSSgAfj5yJ/8r222b+wzFibTqIeBif8kIBYDqoPGaJUPX6zaqawp3z
	AB+ArgFg/qm1CjVQD8a1fyzoMDJ7m7zOUBOE8GbFTa82oGYLvF71JtZrSwRjoevhGEi+VIhT4/F
	3MiPIHtTZlENc4G
X-Received: by 2002:a05:600c:4e8a:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49fe66fbea8mr2319335e9.24.1790190422340;
        Wed, 23 Sep 2026 12:07:02 -0700 (PDT)
Received: from strix.localnet ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm76197825e9.2.2026.09.23.12.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:07:01 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org,
 neil.armstrong@linaro.org, linux-clk@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 olteanv@gmail.com, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v12 09/12] clk: zte: Introduce a driver for zx297520v3 matrix
 clocks
Date: Wed, 23 Sep 2026 22:06:51 +0300
Message-ID: <wditwJCDQOOx8yviJrPU5g@gmail.com>
In-Reply-To: <20260923184051.0BA291F0089E@smtp.kernel.org>
References:
 <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-9-9c243796b6d2@gmail.com>
 <20260923184051.0BA291F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartbapkTblkT9q_p2c-f6yx5A";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartbapkTblkT9q_p2c-f6yx5A
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Date: Wed, 23 Sep 2026 22:06:51 +0300
Message-ID: <wditwJCDQOOx8yviJrPU5g@gmail.com>
In-Reply-To: <20260923184051.0BA291F0089E@smtp.kernel.org>
MIME-Version: 1.0

Am Mittwoch, 23. September 2026, 21:40:50 Ostafrikanische Zeit schrieb 
sashiko-bot@kernel.org:
> [Severity: Medium]
> Is the mapping for ZX297520V3_RFFE_WCLK intentionally missing from
> zx297520v3_matrix_exports?

Sashiko is right about this - this clock is missing by accident.
--nextPartbapkTblkT9q_p2c-f6yx5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq0I0sbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi+RwQAJ7LdzarWQJsNGnuTtIt
v7A0IaCEADzg/eOTVZOapRX1DQ1MBLfOp8OAgAgWf+VqD0Fwfhhor5R5EUuDwWwC
igC8QX9otApyyzP14ewnO5PvOhL6fJO8XQSwz/Q0H7cj/Km7exGMKAW3bKPFmOkP
6A6BJXNUVUTGz8lCfjWUkEN0pomCjORtx93e4jDS4zStbtETvxjd1ADd+0yeRFe1
FUhTa4t6KZqGfme4YnFrRXu3JK4jJRzI+xDPqKObgTHZQ8sjCeDoi3zVkYBSoJb9
VvzaKBMvPAo3m01t0EZh/IT34zq0dxWLPL8cfX+FONANbR7s+zguec/DDpzzpPFD
BLs1BFcP1BkVQJmYAfS+s+6E6gEfPKFlc8OtJaeZhJOd6H3iirHQiD/xFB3loMfS
m45lbDTE+r6rNX766bMUmFbTF9a4OQbxVx7sBHlFrPUYQS3HV67euaaAjYYdpSPP
bDcDnAi7DoGNWazr1rC3bHZmnnlRObBCsxw4GiLFwfP0hCH9KuqgEBpU3IH7KQo7
RQnoef5ZGjFs2lKIFWBJ79gDblrL3DSafnNjAHwQdOD2EK2MyeNXggsvkMWkcOXC
V4HoRzPMRxoTcbPjbb0OTFkSOdIHk5Tbl5W2k5V+1dvWvYd7mokaq5RvY8MAaKf5
XnS44kqcP9o/dcJvhIq15tT3
=GiyS
-----END PGP SIGNATURE-----

--nextPartbapkTblkT9q_p2c-f6yx5A--



