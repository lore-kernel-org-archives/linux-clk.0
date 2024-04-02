Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38FD5F84F
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054903; cv=none; b=GzuIfF3Dze2UvXN0B5/QGDtIIH6GNPEfDVrhHsacqKDp9n2olC5Sfo+jnmEePvhScrL9alQvoucngGi5rXeQ9VcP4lOzWz1LbFq19Xp+yFG4qmRjYfc3X6hm89jsx1tb+8Uv3BSSlMatVYBGgfy0UGqVgHPFtryH5kpD3UZ1Ics=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054903; c=relaxed/simple;
	bh=qqkptkwBB5jmETqLjS63zlxdb+z5eD6/k+FZmoOcCP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgpbYw5ClnZ9Q2IQZlz1tcrjDROzKG+1frP2IfRabsuE7B+y/mL92unbWIbN+0GXkk72hjwE+C4SShgoT+KnQI99cNMO5wb35IJC78ohRU4a9Fcqh5iMBgfB28isyLKrJ25lUkqfNefNQrcu6E17AXcu4dbPLwH5GN4AdsJoLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u4tCu6Gh; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u4tCu6Gh"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso4351766276.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 03:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712054900; x=1712659700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+xPQyCvLo53dq7pKGpQQof9V6YZJuIofT5TTwfg8858=;
        b=u4tCu6GhOY38sRAviEV/tKlL3V3tT2l3fvAV59tynf3dKBVNSfO/RXTM5iS23pXu+7
         0qvMqTLkTyQqwMB0XwY4ciDrt21N1kbM3QG6YvCZtCoYUGcUiffQDKuSH56LkBwHUhES
         hOJVE4POJfo4e+7Q02ODEDCgG+/dky/Z1jpgk3nWT99mwem8H4e/cyAPXocjN0ZyW0sG
         w13myAXscyDancBhQqgM4ply80ZcqpNRp8MWGPTKaRGQfIPjRRBObK7u5Op3wtSAukId
         c/hAdLOzFkcrrQmRwa+TtxBMj4R5WToq8vDsSc5h3taODFEQh29ntK/JvlLU7IbLeikt
         sakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712054900; x=1712659700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xPQyCvLo53dq7pKGpQQof9V6YZJuIofT5TTwfg8858=;
        b=ceZ5tY4nDPOKzJUWiNI5cXn2fQ6/h4RysHqPceaeugm1yYOMafsIkq8tZoLOmSkRue
         ngjySj73v55HBSEiyfkTgZ+96HKlQwtgBuDJaopvP8xnAvJJ7v6cnQizymAEnGHqz5BX
         tYg4pBaAKLN4c2VirIZaJL9fjuYfZ12Oc3QMV315X8rJQzcPGgUc3+xg7fFR++8kgb4v
         +MJIg6M9zWF6OmVtFI3nqSCOiIIJh+VDB5ah9f1hL3lUJJmg9+vXLnrHnHYa6lBfAEGv
         bt8cBD1yO9bZrpqzflyLie2s7DcM9DlzTR2WBKSITlIDAMW0UdPoXsCuIfy1uTjngJ71
         r1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXDqraSurgHrlqp/VHZO/gcZTs3XF0CtikvvJyym/ZdtoEMqevXbvx9G2x9iZ74MnTlbG4pZkRFjwQlpJ2CZrzQL4AILqfx6Tbv
X-Gm-Message-State: AOJu0YwIW7iTffW5UKAA+K6lAbHC3sXPZDJz6wuPi0SXITJrAfRBGNoU
	TLdjadyQkU4mnmcYJvSKTJoEEhp6LslfP0lZxhp7T1PxkIRlFpd5LRV3UPgC8dBf08ralvY708T
	QaFXWwnt5EHA6hDw+rHdF3M/OY8uEBWkPwNtkBw==
X-Google-Smtp-Source: AGHT+IEdThI7DXVCE+YtsqVQ5FfgA2JdRwa/suM7w9m6RjmrZhMB+jlS68lFUGN2ID6qPpnpew/nE9vA5K+Hs04awQo=
X-Received: by 2002:a25:9a05:0:b0:dcc:9e88:b15 with SMTP id
 x5-20020a259a05000000b00dcc9e880b15mr10209955ybn.41.1712054899681; Tue, 02
 Apr 2024 03:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402103406.3638821-1-quic_varada@quicinc.com>
 <20240402103406.3638821-4-quic_varada@quicinc.com> <CAA8EJpphk_kqzBE7cKb73ipdpTi29t9ZSOOdSfq7pAGSs5NKeg@mail.gmail.com>
In-Reply-To: <CAA8EJpphk_kqzBE7cKb73ipdpTi29t9ZSOOdSfq7pAGSs5NKeg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 13:48:08 +0300
Message-ID: <CAA8EJpo=TMhu+Te+JE0cQzmjLOTDPi-Vv-h5Bch0Wfr_7iVi2w@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] interconnect: icc-clk: Add devm_icc_clk_register
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 13:40, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 2 Apr 2024 at 13:34, Varadarajan Narayanan
> <quic_varada@quicinc.com> wrote:
> >
> > Wrap icc_clk_register to create devm_icc_clk_register to be
> > able to release the resources properly.
> >
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v5: Introduced devm_icc_clk_register
> > ---
> >  drivers/interconnect/icc-clk.c   | 29 +++++++++++++++++++++++++++++
> >  include/linux/interconnect-clk.h |  4 ++++
> >  2 files changed, 33 insertions(+)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Wait. Actually,

Unreviewed-by: me

Please return int from devm_icc_clk_register instead of returning the pointer.

-- 
With best wishes
Dmitry
