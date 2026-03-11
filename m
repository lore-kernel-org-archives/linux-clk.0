Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27A1AA1D2
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234080; cv=pass; b=h4UZdtA5oe57RMB0lRGwL/X62I0vDzFUGrpewbm6H44MKs0Te4in62KcwmpjavZwqnNxpCliG6ULGqreXWILXZivY6pdQ4uYUEkRP4AI+JF0kPB0xe13ozx3JjcxJO11J2oebfACidAnUbQROYfhR7u2SZJOcwlXSrq4+5is/Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234080; c=relaxed/simple;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IP/yi+85jwIv70dhqvBKNCDTcjqNQzuKwzLRu+uJCQoMQXIptqyCmg3N/xJSbtHth3CN3OLwdskvYAzpNbMH9X+VmdZKyc0kMWPxHCYuH4S+WCbzDt6EXqNi8RlhtY7tHAxJIme084vzJwCRY+jxrTeZuwtDnPkRgo0QvXatCwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A/4OsqfG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMeQUApg; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A/4OsqfG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMeQUApg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773234077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
	b=A/4OsqfGdWEN9JBcZMMyEeziM2PRaN4iLm6m5e3lasQW2S92Q0qLLQzuqAynRtEJSTyJs/
	P2za3o59Xwwa2A5pq8SDT1c7hhSh/al01BH2tKkk258WZiJmYFenr6+q1TAC9+P1IoyYXy
	Kvd8UVJqwacqzCY/6pEHoOarX2UFibQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-5sqMAaawPMOrfxaHz7GWrg-1; Wed, 11 Mar 2026 09:01:16 -0400
X-MC-Unique: 5sqMAaawPMOrfxaHz7GWrg-1
X-Mimecast-MFC-AGG-ID: 5sqMAaawPMOrfxaHz7GWrg_1773234075
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b8f5bce308dso1235486566b.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 06:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773234075; cv=none;
        d=google.com; s=arc-20240605;
        b=fXSJ4SHhTx+R4MtUXDbhdv9KYfkpkR1JWVl8vRA8T+HyL18S/fLicqNbMhyBQkNTQW
         5YFvvfTao400Zv3MBNrVARtOrkw3G0K/0200rcfMRQMJon9JmWJBMceC6dDSfSqy3kUv
         8JBE/sU0yaGQCT4pwUF8kWdcb1oyvwp3AT/JTNfXcmrd1K+hY+FKPZHOb5Eaw9Ja3NuI
         4V1+Miyezd7DegO4biVIvnFQIM6037hCQeDGvTwppJvyEhUY2sLTyVaoZCxJWWIIS5ru
         +7GRqvS0TZizJe7UdjEF2wmbIguC5+Hh6H8vMgaEvY34hm1a0l53WoiG1rsxvXCreFyD
         b5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        fh=XpVhYCJMZc7SL9SBEeaqNa3MLRe6Qd7KOSmsBIGBm1c=;
        b=j5zUkoyjtPNUvgmt7Hd3V8NXsoyh0PN31188DVNhKkKurE8xfHaeiYqqY3ktV5Q/V+
         G9A5DjbUBnHgTWJWKrfn+CCxRWSyFwN0Gt1UlK33lP9yp1Ik9RSUeA4CaQjnmoSeP2B1
         bjFXWgO35HhpW1DuRcmUQ7ETkfJTt3Uu4Ejw8KhiT7og3iugYECohJc84PnN/zyRq1b6
         GsGWw4rc7Ymd4Ms8mpbhq1jGbC1HGLWAZsZoOQjTrf1QpCY3deMkM0GNia1LT53k3WX0
         qj7EQGfMlO4MRx7BypiK+/RZmxgdcMnwKtlR7u0/m4j2ZWM6YhPQyJud3TDbIgBAcPOd
         KTrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773234075; x=1773838875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=VMeQUApgiTL1BMwmMWLbd8/lAa34fF8CCr7lwzXXgMUO3GO1g5uIhmB7I5pTqfk0gK
         yQMmN9yDX4vgjagejSW7X5479okYG1lk/1qxHFYlJ+M8KYLTm6gAKqR1bf3KonOqhKQl
         i6T9FQzg3+JP2aeLx8y8/48JSe83ISS3AKm+Vx5kwdBm7F9zfu7fx4yNd/ZnyyluDFSJ
         tSiJAZU2lpgdvnMIqXXQzf0mREd0+FdS8Kja7kNaPrPGBuyfwy+kvwcFM1O8c8O89RD4
         ZxYIZmtgz2Qdohq0+zQlOTaI0oPC6SlOlkoCpCgznUgQZv87txiYHJG0ZO/yxKQOD0Yh
         Gr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234075; x=1773838875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5omYf3UBejq4qWG7tPFgWTcjtBLBdAAToujIJ2lCAvg=;
        b=Kh+EKu+Zxs3TKR/Dh1LVuD4MvX4SFBwQMAWzWb2A1O4VIwLLGapAY1T+a0CeEI7cv1
         2RVklVMhMO/30fVpx4AC+Th76mPvEAkwF/xzXYUj8IRU8GXLjQRxL8f0rlPfG1zQUez0
         NDNMwDlOjXx/f1jDueqYaUklQYOYOkt47CVoDqn38XotgcYjQ20ijNzs3vsdcvdEOljK
         E6Wni1DmAD5tjmtiHWmI/g5c8uw2VGXEmmoKcuTeGeFWzBlLeI9u5U8KSjqkFsLbsGRr
         OXReK27XpFy3MObZsrMv4u/94Vtx8l1OzwI/LXV9NBaUUd634arDUGVkhUvv+hEV1RCu
         56rg==
X-Forwarded-Encrypted: i=1; AJvYcCUtc2+MAVuB3dtfU2YGsdSR0n4qfgJ9XaDp2vkmzX4/wIht0epZ0gkElrut1X59xEERa5saHw14Mss=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcFi+q4QwW5wRxKONFqfsAmCFDZ11F03uUjFFKRke8DvyWcGO
	ueQ+FT8So+MhH32xZGGKGnhasukZLh4NSBPdi+Uh6JpDMv4UgF1EfN+mJINazOgshmc/4S7cInH
	gLA9VdAo7SI7n4iqyflqAzu9nM1z7nqkWm3df0aIi21+fd+qTwsd4ozOuwx1oQCDX/p+oHfjIiG
	3R4rK9JHD0CVWRpWGDe4TsnLY/QQrq9PCwN1V5
X-Gm-Gg: ATEYQzy4GtbnbN3p2dnyBBiLF5CscaFFAKxvhJuhgZmn7vEtDDR6cckEp5aLs7pyQkW
	pjRCc9z4DHYbzFJEgm9xDEGcVxEEC4iSKagDv3C7Xb6gtkABpDSNKYv+cujQksF6HGp1fCg9GrN
	qz8gjZtgQtG5vKXF0sPWO383or4WWPOR52Stt+Op2Iy6l0AfkFEf2PTgvKSzjtoaKonCxL6/I+/
	MEC7A==
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id a640c23a62f3a-b972e6069a2mr143084766b.48.1773234075158;
        Wed, 11 Mar 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a17:906:7314:b0:b93:edc0:e2e8 with SMTP id
 a640c23a62f3a-b972e6069a2mr143080266b.48.1773234074508; Wed, 11 Mar 2026
 06:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
In-Reply-To: <c7d47b6d-caf7-426b-944e-7debb7d69045@linaro.org>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 11 Mar 2026 09:01:02 -0400
X-Gm-Features: AaiRm52EdqmkwN8CGi7SEvZrCO9M1f6Y7hYTKKNfjOzM3D3aXhP9MAnWBZaRjqI
Message-ID: <CABx5tqKC_KocCp+_uJ-t7AhJNa9MZOG=5Dry4UoZXzUvSryiFQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 3/9/26 4:38 PM, Brian Masney wrote:
> > Note this series depends on 3 previously-posted patches in this git pul=
l
> > to Stephen for v7.1.
> > https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
>
> There's no tags/clk-remove-deprecated-apis-v7.1 on
> https://github.com/masneyb/linux

It is here, unless I am missing something?

https://github.com/masneyb/linux/releases/tag/clk-remove-deprecated-apis-v7=
.1

Brian

