Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B01BFDEC
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690119; cv=none; b=l26unf/Xfuie8Gg2/PWCIaCIAHYUlw9qzJwU8c3rmEPdNX5sLWNpVqcHAgYlFh4PERwtCldf5l4u4kXfxawtxhHyT3X81wspStIzGKoWYBuUjakG1ShQNJq7GD+bN29t3oGnCZ1deKNn4qgzQz4SE7GpqGatURas+Z/peEiqfBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690119; c=relaxed/simple;
	bh=pVZaHkvdqKRcNvk4Ntas94k1G/NPGK94bJRewixfG+k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=RL8hFE7BuBZPbmNucaM4D6xxEQEfPSM286iOfWjPQ+ya7ZskyoN4RXqbQlWu6drGRYTVJanxhwXup5bezbq4KYfDG7+QcP9p6eevhHBWtZN2AL6BWcv4zoNmO+bWkhV5CDDpIOileQTbT8y/BqEqdJzo7lRNqpEYPwHm1rSpVc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oyBlyPnz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oyBlyPnz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436341f575fso18317115e9.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 02:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734690115; x=1735294915; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hT9t7+Z62cNmrY6P7S0u2gAF6V0+KPuKWiIzoB2HDA=;
        b=oyBlyPnzeKJYDd4OWJNJM6YKL02Scnrfx/MfJ5fST24BNntTFcYkihK8/A9oCYzklk
         houHOctIEdk0Kxmra28t3u8sPcrt8WlSUZq0lsilg/HsQAVxdQhTilpGsp5cVMsg4Mkv
         VXH5bzfPdU8KJhCmFgMfMWqWTlmtkKydbchEocH+nTDBw2KcGu9xgKXrdXJpenHJuntm
         ZbBeUkqDATWNBqVt65HjvcZujqSz9OLDE1lCATJwgI+H5dsp+grMIVT1F/IOpd/yk5V7
         Mqt6Yu0SNNxU4YxMI91sbCd7MamIOdjb9VsfDPLRR57f1DeJ3ljFAy1aQO6TcA3J4Zul
         8noA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690115; x=1735294915;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8hT9t7+Z62cNmrY6P7S0u2gAF6V0+KPuKWiIzoB2HDA=;
        b=odN9cZJ+9a41tc6F/YV0KYZAHnSC7VZpv+yDto5BIf2FPa2HpXV0I3rS/dBohqe11+
         IK1OoQqwkNgG8ky4bGCSBsvKyMKNF0TEcLqwurtBhJNJaPzASY0lJudAwKIwT3FBa1ND
         ouI7Dxzcugf1DV/pLsYQGh6L/qLfplh9lyLNXHCBv8QPDbtIMnVIpiZTe9Y9srGu2aTh
         j9/MQjOpPXw8fzIH7g1VWssUPWwMzNCCcEAxQDmCYNiGSgPd22gxjJ8+hzjqAJaXmSiq
         lA6kcmnKTDyHMNMsDbrSqD3P8hTIkMhs2HImKcdBduQ1nnvtY+Ih0nmzwPtrjwNgUd3a
         oYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+ANNntzpXjq0wBBgrkQikAu+IsC6I0mKJVErz3Wp64VNrcyjyieAdBKT+ZsvbCHpKnL/tQXjsUgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ/TQPO5kcMy7VMoBcQvInliNiAQPHFWOuSy++dcZwVtdkNNqn
	/8aElGayfinnPmu77ItfCpKyU0dw5aF5IBKYa0aCEf4dW0+T2XQwKnmehohl/gtq1RIQl9q0rUZ
	y8PY=
X-Gm-Gg: ASbGncsqbNgbViODTEw5mAkPEpCxyC2gxBMJ/2KZRZc6RnaapfBUhwfu8dGtXuDqmIM
	r55s1FxTE2Q3pXMItxpeG6sj7eABmY0aLoW5HKY1ioqpxWhNrf//nNvn7TT/BJq3qUxqCGR84Lo
	84ZAuVeyEvM5MgiKkDSCEzhwkCbNx61vzrcIjzljc4MenWnN/9UfaPGZrzi9QCsIWOAFQAmgddI
	zXoevTauEFqNS8VJzsxenyAqRfAayKo1SxBKWMX998Y/xW7RCxqU26E/9d76VNuaWIVfll/po/G
	WGkiiNYqzYygSpfTky6VkPD42g==
X-Google-Smtp-Source: AGHT+IGfJzQyjs0tcbRlEOFSR6IiZW6L1coftNmeUL8VBSiDokEXLJGOVBXvHFoRemCYvC2ySUKHhg==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436678f5775mr22693545e9.0.1734690115475;
        Fri, 20 Dec 2024 02:21:55 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119d7sm75380985e9.20.2024.12.20.02.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:21:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 11:21:54 +0100
Message-Id: <D6GGBPC4V5XV.YU8Z2KASBH07@fairphone.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm6350: Add missing parent_map for
 two clocks
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@somainline.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
 <e909ac59-b2d6-4626-8d4e-8279a691f98a@oss.qualcomm.com>
In-Reply-To: <e909ac59-b2d6-4626-8d4e-8279a691f98a@oss.qualcomm.com>

On Fri Dec 20, 2024 at 10:42 AM CET, Konrad Dybcio wrote:
> On 20.12.2024 10:03 AM, Luca Weiss wrote:
> > If a clk_rcg2 has a parent, it should also have parent_map defined,
>
>                       ^
>                         freq_tbl

I was basing this on that part of the clk-rcg2.c, so for every parent
there also needs to be a parent_map specified.

    int num_parents =3D clk_hw_get_num_parents(hw);
    [...]
    for (i =3D 0; i < num_parents; i++)
        if (cfg =3D=3D rcg->parent_map[i].cfg)
            [...]

Should I still change the commit message? I guess there's no clk_rcg2
without a parent at all?

I guess I could reword it like that also or something?

  A clk_rcg2 needs to have a parent_map entry for every parent it has,
  otherwise [...]

Regards
Luca

>
> > otherwise we'll get a NULL pointer dereference when calling clk_set_rat=
e
> > like the following:
> >=20
> >   [    3.388105] Call trace:
> >   [    3.390664]  qcom_find_src_index+0x3c/0x70 (P)
> >   [    3.395301]  qcom_find_src_index+0x1c/0x70 (L)
> >   [    3.399934]  _freq_tbl_determine_rate+0x48/0x100
> >   [    3.404753]  clk_rcg2_determine_rate+0x1c/0x28
> >   [    3.409387]  clk_core_determine_round_nolock+0x58/0xe4
> >   [    3.421414]  clk_core_round_rate_nolock+0x48/0xfc
> >   [    3.432974]  clk_core_round_rate_nolock+0xd0/0xfc
> >   [    3.444483]  clk_core_set_rate_nolock+0x8c/0x300
> >   [    3.455886]  clk_set_rate+0x38/0x14c
> >=20
> > Add the parent_map property for two clocks where it's missing and also
> > un-inline the parent_data as well to keep the matching parent_map and
> > parent_data together.
>
> The patch looks good otherwise
>
> Konrad

