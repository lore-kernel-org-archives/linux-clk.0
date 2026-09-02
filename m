Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817CC41F349
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 22:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387645; cv=none; b=qfXr+4m9+FoW41OCnKNZp2ctwRjFNf2qvaqA+aXhX+I4xJM2L2as1Ry+wcMV2kgA07iAawQQ869YT8aMNB7VgEkq8s/35yfhEgY4x6LrmZeobuBDVSJ5EGl+dc8D/J1r9ocFE7jByja+vbtPRJl1CP8oDDYNtKLdq9F96MVs6Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387645; c=relaxed/simple;
	bh=iLpH8+9iA7ODTvTwUU36ZP/HgSshJOQEJAhWQZt/+g0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=MVLNLYNfbw2hFNiJeKuOspqKmSYHCTElqH6lmXMBD7Yw+u4Fd5MH0FzNP4r/SfKmjhATVAin1lEUcEqF2RKoB3GlJVTOtwKBxmrR60L+rh176Ces67scN15zNUyLrFsUqZkh0d5d4JXfATzZsAgcDs6EjY3MoV1qVH/fnaQMXaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYB2lVtz; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYB2lVtz"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso1939481a91.1
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 15:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387638; x=1788992438; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iLpH8+9iA7ODTvTwUU36ZP/HgSshJOQEJAhWQZt/+g0=;
        b=fYB2lVtzBNybJRBuKKb3j9WGXB3m0Z3179BXXtcA0CLc2xeMwwZwiVqPMiaxXKQXXC
         J3RxjtE/JY+iRi6HILSlADNk5IG5s8Oonz8SJ4foVc1f4YAbtDUHg58p1fZVubTtGOpg
         BDhcRfAQGWkiADQcRoBouNRvvlxDw+MXf1bVLoqB/RrlFhG/L9tEwEpe0cO7aGsctK3k
         FMSj/Eo/rEBd42OTektr8MHeiRMphf8xzvPDpmc+bQysnjkynYQqvW5w7geWWqW+m5yJ
         P+iJsUNQafR/CovKsjGHD7D/y0MNjjFbJ2yqfPK4EH/TJUb7XUj5Nl8HADoVztkQsdv6
         2saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387638; x=1788992438;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLpH8+9iA7ODTvTwUU36ZP/HgSshJOQEJAhWQZt/+g0=;
        b=B3jD2b6/Nn9W+RGGSBm67+bD6xwR3HOOGNXYTeiIFHXpJGjQVzNo3vYSAbQ75BvTTZ
         hT8ggBc532Re+7/fHqRlh3I0PQ7Cv/5cJEigVyKwCcKGdRdz8HKFtABVdjyj+pT4RfPY
         5T6xXE0d3sUuT6IlrVWL2VDAz2viGzfbB93NURl4r1rBRf38+LIZ2sD0PL7V7r4mvXgu
         dOjoNAsOIC4gKXN5zFaoDXi3Hm1BzbH/sYO7FyY7J3F0EB1YnCl/BJmXJFBF7RKqosAl
         Dz1eGJwCl7n8h4bvMfmD2Jhz8Tp6sLRLj94SUPbPyxdcjhpDVDPxxqql9mtc8rQIJRbV
         a+LQ==
X-Gm-Message-State: AFuF++n8zwRuapeV0Isy57DaMNoy5FCwWTJfvCNOoZ6tytGtn83wQyrC
	/7WJELOs3C65T+7jyLLms8Wp3SxhAO/INixaxnYh2/0DtwfGh6ex9rhJ
X-Gm-Gg: AYBFou15CQomizZa4w1EAtcg38TPYtYedNGgxJ4y4g/fqlCRe0Nw4R9sxXb0ACnFiwI
	Z+N3+MjfKPcgWY791kyAopibXbtC3oE3ZjsV/yx7IVPJMw+ICbHT6s5hv0UTR0WB73tK9ohWium
	477W/8VjuNVXVrbmw9srH/f+ubcxL9bjsCtbm8FslMgm9caY6t2Q8mCc5j3ezeMEp45pWehUyS1
	Sj1qLJY4jTFe/dr04AqXCrWb7AGqB+LVR2NsEtEwCBAAi30wTEwyKxnbg6NpAUhfQk04RTOx6R3
	6fwphTMmhG5foW+OsEQlff+X5xlpt8KDjNWQaCJyzatEwybVzejGUeig8qdWWOTKm76Xp9ONVVX
	r5co+CfI/VxSUyNckMZqo76v/mMwxY4lfVLXcPMHVam6Hf8x33ODiViTGjAtFpyDqYPiFOf9RPf
	NS/FGcjhAwN9TNJhMyaU/yWIPcNoakvGZkIkSVX62m3pmJiEVBnAfZRLAtBolZasy0S4hosdObc
	nBopK9lkQvnJtx1nOzxNv6eo1OqaEQBkiX06JaZz8Py5FCFJ1vuFeJLV5PY25pwy+Iq/O0QdFsj
	wGwWDH7Hiom6Ns0Mxw1WBs16pH2i+LwnkI+uKw==
X-Received: by 2002:a17:90b:4c41:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39aedfb9a24mr9812596a91.10.1788387638104;
        Wed, 02 Sep 2026 15:20:38 -0700 (PDT)
Received: from localhost ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07ac1174sm1485087a91.0.2026.09.02.15.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 15:20:36 -0700
Message-Id: <DL56IA99IWH9.22TJJI2Z54XM8@gmail.com>
To: "Brian Masney" <bmasney@redhat.com>, "Rosen Penev" <rosenp@gmail.com>
Cc: <linux-clk@vger.kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "David
 Lechner" <david@lechnology.com>, "open list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] clk: davinci: add COMPILE_TEST support
From: "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260812184001.75093-1-rosenp@gmail.com>
 <apidn5onRt_p4FOL@redhat.com>
In-Reply-To: <apidn5onRt_p4FOL@redhat.com>

On Wed Sep 2, 2026 at 3:05 PM PDT, Brian Masney wrote:
> Hi Rosen,
>
> On Wed, Aug 12, 2026 at 11:40:01AM -0700, Rosen Penev wrote:
>> Add a driver-scoped Kconfig symbol for the DaVinci clock drivers so
>> they can be built through COMPILE_TEST without selecting the ARM
>> DaVinci platform symbols.
>>
>> Keep the existing ARM platform behavior by defaulting the new symbol
>> from ARCH_DAVINCI, and use it for the davinci clock Makefile entries.
>> ARCH_DAVINCI_DA850 is the only remaining DaVinci platform symbol, so a
>> single COMMON_CLK_DAVINCI symbol suffices; the whole directory builds
>> together just fine.
>>
>> Assisted-by: Codex:GPT-5.5
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> This doesn't apply against the latest clk tree. Can you post a new
> version that applies? I'll be able to pick it up.
Sent v4.
>
> Thanks,
>
> Brian

