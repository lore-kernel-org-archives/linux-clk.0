Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386469;
	b=oxZAYLS2tbkppLXZ6gYOfHkL5rTdwONBI21dmbw+iOuIVOZh83MUzYceYQ0HEtkpfuL6
	 39xpygqfrNiPSx+puEVxcdrShtgAd6huF4mfkBJg/T/CSCLazpuvP4/WGSBsq1ZZnv2B0
	 YT+4/76/E68/MeyiVN/q1N8z8A4dRGtVt8OumGuhqWVoNUmUcl0a6d7i7cWAcgDZwI1uH
	 V1BK2onuCUtwKOhtNNgwmHDPt4LkLtLjFv1vJENFMcOqpHVH3nCs0mFas/LX4AWT7hHRp
	 gcAQsUbWqivHvxpH1bYkjZgFmNY6VT/GI7L1XSAEzhX19DcLtE2txbWsY8JRpE4R5sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386469;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	b=x4Tbw4Arg+D9VL40I5yXA6XbMzE3m6uwZGqHqk+UysIroeMCzODdMB/zjzhBGi39GNmG
	 qeHkAImNF7uI3Ia1pwINeOcLGpBPjLGwqbUos8gDxcIgi/uHt0q2t528Oo/p6d8XKs5Xr
	 qev+PFUff42yYuPKFVfPSgprWiN7tFIkHcs/A2Va3iqyvG1DiZuOZXhmzQZuLtGEFrf4n
	 SV5DhCYy6pFG1L+onOa3MdayOV3MBNWUSvY+RrVlUd+07QhnZJdRA+XYo0L0ImyWO5hQd
	 kdRLKr3tmV1fxaUthFqeDx1hN3CgsJ3Fp9orAG8SI0Z+53juJzpRUoUty+RsTER9oiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C7B606A320
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377FD1F000C6
	for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386469;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OPvl8hLvtrJ9LTOBEzIfEHa7NVs6FlgdJ+UxySXJn2+owzPa+Vt+9mCch0yAryTlK
	 LiKkgt60uDzMuqGl1g+KQ2E7Kef2Z95xFZhXCWSyepJwA5mw5jkHgWBgaL+/ouNCPi
	 5Me0XAMpJtZOkyXWRKDg50hVESo6gA3s14fPpvaML3vODe8cqYANeTW9By5ZqlvQbZ
	 DW+O4gYiXt5DMKWYBwjgNlyOQxL5nEdqGbETlusikGuwdWedfspjl0dhUgXu2GpTS3
	 xA9Te218tcwx8GuRMHtb97FMKihXyRGlEDeWaIPIFF6LvLCr1FLoOJjV/zkYoce/4u
	 RKUCUZuB26tZg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso2299080e87.3
        for <linux-clk@vger.kernel.org>; Sun, 22 Nov 2026 14:27:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF8bo9be9IpNz1fdKsW6+R/ky6fAmO1ckhQg1FdiZ9vQ5kx24VlGPw4LvEgZEZNbLDT7H1TvmfO3fQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LZboGe4nXpZzWpduy0z9Qf9QbQ4K1iCRq2OdJSlncmZCc334T
	S+4P8OwtZeX5w497gyRyJJuBXyjNhIOHkYCfW+1Yyc/3AOtzGp3vDO5p//KWiIZiaUtAqUYCmF+
	cMqoEcbkHwft0B67wa3/Vzyp5/8P0vc0=
X-Received: by 2002:a05:6512:3da4:b0:5c1:a828:499d with SMTP id
 2adb3069b0e04-5c1bc8a0f66mr2723779e87.45.1795386467998; Sun, 22 Nov 2026
 14:27:47 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org>
 <20261122-xg6846b-bcmbca-xrdp-reset-v6-1-bf2104a25095@kernel.org> <sashiko-outbox-228331@kernel.org>
In-Reply-To: <sashiko-outbox-228331@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 23:27:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
X-Gm-Features: Aa3M54ok4call33uc2w-wg1Lc8Py5tmJgq7aasSbEWB6j45V_SSTm-IdEboSNII
Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 9:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: mfd: bcm6846-pmc: child nodes split PMB by Linux
>   subsystem

Parroting, Sashiko. This has been addressed in earlier iterations.

Yours,
Linus Walleij
