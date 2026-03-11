Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4BB3DC4A3
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250215; cv=pass; b=g1XWMEPu32TGFjenEuXPGFSi2K50vFVmxoyp5FccRWwFg4/8oa8JlfcMFq/X6VAjJt/6Kq7iop1S/P0VzQTVmfeg0xdCdXY0RKTsmEDMIMYzpEPch2zmW/frBAgAsBhCLAmVpMM0JqGUy9/FEfQQ1FXePkPv/aoKc1NHMNJ1CbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250215; c=relaxed/simple;
	bh=5OBYZAWAFAqgPgNE3W1sS8+lHsHF1CjyBY9nqyA0F/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hpi5QHxrZ9EG4Iylci9EmmoRCKVh3wcN8AlVWF72981QLC5n0RNDv6LOz14GFqLBasqRC99iiKTYzY7wMdSDI94YEcrP0EvW7+CMOlPc+I03+nSecXtYBZ+ZJRlAfsdTpe5Kad6K+0kTJh89LxM2T4a9Xl+i62qN4+xpmyCTd/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u8jAAivA; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8jAAivA"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a133502accso216043e87.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 10:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773250206; cv=none;
        d=google.com; s=arc-20240605;
        b=EtUqivbuLPLAMXCOoIoy/8WecQy5PVmjLER1uwMKKAnJXD9eojVuI0p2fh3MUtKdAp
         hbX5LkNpDEMHz1v0RPLw0m3rX4XF+SzhaMylWkrexHWb9EsE80sqhulXYDZOK/LyixSr
         UE7HlBBulNoqptamdhFFFVcTdicwK8IDxjvUsVRvvjS2d97Cw8UlanA/xcRH/346l8kP
         VwSCelqo2Rjf6cc5LLQM17DAQEnjohMo9RaB3YE1JTHupGEYGT2C23ExvYWh5SDWDXEs
         58gh6HEBnJwqh8w9TOetJx8qWmB1o1vTPhMVzoyd1e4DmJNpSXNVsjN+t6lZH7aBWRd6
         FL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        fh=GFVBMYw6xTBJhGJ6rGnqkjJLNQl/a0EYLZzEm2LHZtU=;
        b=ApCl88D8w3NZcusC/pSaMazPE/YYaVGblKlmjD0YS4LHCPSZASeBktAIhPR+6fyJ2A
         NzqperaSqurg3zduwj7Ade+GmMY8Girju6lfo3E14kUm2nxOKSmi3Mj8j2IYn9PjVOH1
         9RMuQUC/ZnpjOUJebuyr7ZK812Udfp/PGUG0koAe1CLAy4lw5fSqLh1K55HV68k46jPf
         X+TRNpCZZVv/RuspKFizMveEe0Rlp9hhK3mHZCYrfzIVwTBp0drUeYKZYStJEpKKgTkv
         PW9ycsrovYoWV8mAM1lEdqJs2P5bZ3rULnJIb7B5NRC79J9FeAvVR9FOaKxz/XlwYC1H
         b8MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773250206; x=1773855006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        b=u8jAAivAOaWNJqMAsqliMbtQKLxSB5FeqaPwoUUJLHvbRiCVbzF65h9Gcij+DbzrPU
         iG81bSqETZnbYVaw/cJqqaQHpQ544ZHMkuo9FFiPdKowk8pdN/bYByvk8rOGzkFbcL4k
         A+6iMoo6J4m8g1DAcKfdrtKQqUKcDsv0h1oB6bJWM6QITeiWdtOhvIApPYKSI5OBAKkl
         L4L2hlMTgAbE3EOzhldn8k+Yp1YTV/+aJsF9U7ke98nwrWzE4iupy/6WUswUublWHBMM
         L+y1yYqvcCEAPofnccXAYCAdiIsn+F5Pgk3duhw8QytZ8iKRv3yCWwvpIsznYUy5SX3j
         Qg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773250206; x=1773855006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZnfHCfBs+6Zz4+9A320LuMDypzwbYjaEq8gelT4T9I=;
        b=NrWTmdAqkLJpYbxrKPOrLg/FdchqIuN63xIfZRVxwjXMP/sqChcbrqf3z52LyjVVZK
         3QExym1tF/m6vVauUxh0Ae+P0Wg5ZhYgqJMK9vPkgMqx3zs+OCMi1WuvMysQU+iOqPce
         V7X7ZrDeZQBsvGzv3tg5CWP0zdhRs0imgLDt7XQlycHvdaL0ERMor3Hd1bb80VOVpXJI
         gwR5L63H2kEV6B/s3gl/fTN6EccxHAbzqG+hX6/+7P9M0IJbCLxWmVprDIq8+kRIjP8Q
         eXiP92c0qjYjMYUvAjvetvLEWQvxa+ye3MZeU2wLgj3tKz0PLxzOO0tz6fboAsviy756
         Yi6w==
X-Forwarded-Encrypted: i=1; AJvYcCUVCHXaGFnuZTm/ggM+IxUvBjg21uEhyxbzCEtsvzPI71r7wV8ZzwIvA/+8kKzEYYZbjPQz/teanwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL0PM1h9d+SWRx807gL1dVlNHlugCHYFkiz9812Ca+s0Gtx2+8
	WkGzRwHc97C2pLEHdA2MkGjNjfxP3QrwOS2bpTuSNt6n7X9aig5+FzzXr/yLJ5I+QEiy3Zm/+9h
	uLBZ1YTP3vs+vgM6N+77QhlpsQCQADyW37vcE1UGX2A==
X-Gm-Gg: ATEYQzwXG2oG8P2tpBuFxX2UROVKesf3Iv250SLeRHBIWgpfw/JSF1DPyP0xhdJok0F
	XfDrXM5amNOb+ahUVTWko55VFymOeCKc4/pI0HZ7sLn8jwVuY2orCCMuuhGVH1jESnxWh9Bndvm
	OaUlNMtTG1fcJTGGXVHvoOGNeZ3XsGWFAISqQzeU5DdsT/vG2z6+KuRE2G4YsoisDCdMtVGi6F1
	+Hij0sR+ZXluMQSvUlZJUYKZGy5/Rt9/svM4H4kvOl91+8LExhKP4Mk+kGpVDb3JmO2pROSG1vd
	BmMYyglFXp3KtYFtz3g=
X-Received: by 2002:a05:6512:2c0d:b0:5a0:ee11:8d94 with SMTP id
 2adb3069b0e04-5a156ba88f7mr1283885e87.1.1773250206343; Wed, 11 Mar 2026
 10:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210053708.17239-1-aford173@gmail.com> <CAPDyKFrsMY8q+rvrbOdppYnefX6TA1-EhF+e+pGG6k49KpeTRA@mail.gmail.com>
 <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com>
In-Reply-To: <7fd891b7-b1ff-4668-ac99-8f8ac244d90c@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Mar 2026 18:29:30 +0100
X-Gm-Features: AaiRm52dneMJr0I61s4TTlnxGT0AaZqfVcItp2PRBKI4_FSf_MRvM1HPHY0fnQg
Message-ID: <CAPDyKFqbS+PUkLXkjoHjbiVFCYM4FxQeHdJk_LVVfLA5nGEZ-A@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: mediatek: Fix power domain count
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Adam Ford <aford173@gmail.com>, linux-mediatek@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Mar 2026 at 10:50, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 12/02/26 12:34, Ulf Hansson ha scritto:
> > On Tue, 10 Feb 2026 at 06:40, Adam Ford <aford173@gmail.com> wrote:
> >>
> >> The wrong value of the number of domains is wrong which leads to
> >> failures when trying to enumerate nested power domains.
> >>
> >>   PM: genpd_xlate_onecell: invalid domain index 0
> >>   PM: genpd_xlate_onecell: invalid domain index 1
> >>   PM: genpd_xlate_onecell: invalid domain index 3
> >>   PM: genpd_xlate_onecell: invalid domain index 4
> >>   PM: genpd_xlate_onecell: invalid domain index 5
> >>   PM: genpd_xlate_onecell: invalid domain index 13
> >>   PM: genpd_xlate_onecell: invalid domain index 14
> >>
> >> Attempts to use these power domains fail, so fix this by
> >> using the correct value of calculated power domains.
> >>
> >> Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > We should have a fixes tag for this too I think:
> >
> > Fixes: 88914db077b6 ("pmdomain: mediatek: Add support for Hardware
> > Voter power domains")
> >
> >
> >> ---
> >>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> index 58648f4f689b..d2b8d0332951 100644
> >> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> >> @@ -1228,7 +1228,7 @@ static int scpsys_probe(struct platform_device *pdev)
> >>          scpsys->soc_data = soc;
> >>
> >>          scpsys->pd_data.domains = scpsys->domains;
> >> -       scpsys->pd_data.num_domains = soc->num_domains;
> >> +       scpsys->pd_data.num_domains = num_domains;
> >
> > Not sure this is the complete fix, as scpsys_add_one_domain() seems to
> > be using the wrong value of "num_domains" too, no?
> >
>
> No, scpsys_add_one_domain() uses num_domains from the soc_data for DIRECT_CTL,
> which is expected. Maybe that can be improved, but it's how it is supposed to work.
>
> So yeah, this patch is resolving an issue, and it is a complete fix.

I had a closer look and unfortunately, it still looks weird to me.

More precisely, we are allocating and registering a number of genpds,
that corresponds to the sum of "soc->num_domains +
soc->num_hwv_domains". The index each genpd gets in the array (struct
genpd_onecell_data) must correspond to the index specified in DT, for
both a consumer-node and a child-domain-node, right?

It seems like adding them dynamically changes the index. In other
words, the index specified using the "reg" property in a
child-domain-node, may not match what a consumer-node should specify
in its "power-domains" property. Isn't that a problem? Perhaps not,
because we never have both "scpsys_domain_data" and
"scpsys_hwv_domain_data", but then why are we adding them in ->probe()
with "soc->num_domains + soc->num_hwv_domains"?

[...]

Kind regards
Uffe
