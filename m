Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A0414D433
	for <linux-clk@vger.kernel.org>; Mon,  5 Aug 2024 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853994; cv=none; b=q5gGWTZ13IcLICcwrwIxjuZfxqM08GWkmFOFZ1v9HZFOdswj5MqUfc9TvMQCS5g0FxCxk8iOWUyfVLvTkbO+2YcoGyQlmMqeAaFgnmjVSpo61LdvZUmEKXwyce2rKNeQ8VlMcbr3fVLHt5ifCyAesR2InFdocY3ek8x97utUmPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853994; c=relaxed/simple;
	bh=aCg8Y7NDdsxbBmImd9uRerZmF7tRLZUEY04gUZ817ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fnTiKcAR3uRPOQii4xOTCwO5WR9KYxet9CoVFiOTWW/MD8dcuAveBRkMKcQzmrvAMDprByhmMnn3/dYelw+ajgAKEiWctaPEgckVdiQFOwAzwg/oiRLGTekG361cCuBhcvaYUrKD+13j9zxBE+Hl2lCcfa1PydJsPyXXsayB6hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzscwnAe; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzscwnAe"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfef5980a69so9367558276.3
        for <linux-clk@vger.kernel.org>; Mon, 05 Aug 2024 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722853991; x=1723458791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aCg8Y7NDdsxbBmImd9uRerZmF7tRLZUEY04gUZ817ow=;
        b=LzscwnAeCjD4FYkC5yo3LvvbRDw+wo9vP077qbgTn6BJHnl/wGemPeZbcXWul3tdgb
         Zi+cwUTLpe3StbSpVbBOa5cYXi+xqy8+eSFZZS7LOSIJo/jbBNyA/P8wMeU262S5uZc+
         25uxquCylRTBEmhn+PSL9HIcGbiYTtXTq7tFSLaHBQe0g9GFR1O3mLDv90aKyWG9d8xX
         ycV0fr1+CU8ArmionVbWTxjPKAMigIasC9eIov63Imjn0+dC1pAqA4mhcRfHpQhCRunu
         CePEvUpOBQSXyWKCjtCzjl4lGJ5SrSuTKhrtmAZUvJPLssGA8EhPQJ/nV2aeIbJ4unVt
         Xrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722853991; x=1723458791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCg8Y7NDdsxbBmImd9uRerZmF7tRLZUEY04gUZ817ow=;
        b=N+E3IQJd7UKIKG4sVB4BDVx4m01HNBZSkvHFlI3cWNDLZOyRyjjvsiKwmoi7DawZDp
         S4YEFCVTdrG3tXxa/IMXIJneH0dX89pw5+RVfyxutbaBWHb0OgeFCN4BsF2Px6nEvSPx
         yxKh2hezdaa3QEH9XZuUv2TauMJdCIZKptUZbmuW8xoM3pklWDmQes1Cq8tmNRfVpM0y
         OgwwMKFrFPIFNzt4fWCZ4bYYNccYbloWvNGvT7fgKXq67x2mecVc6Dyid04nZ+i1S917
         MvZFjzCqrcxSD/NEKTBAS+/n9CwF8H0qktyt1qV7e5jkLhj5j6lwlSfT7OU23t+LZOY/
         LhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFdnMz36VE7RyNtDNGvtK6DIZmc9ACv035enE3VG0MeDwJ2R8iQBvMD9VSjYf7qXOe7UWr+kiY84Y128dEBm3Nwt088bKWEhUj
X-Gm-Message-State: AOJu0YxitkmGEvDKXVbvngyHmjJ6Li+gTdCxYZEbFacKpFCtm/YHVeV4
	+KJ5ybiGV+6ivjAeZvPoz0IMY9Plz4tnURqzT3hG7SP+XydXrs2mka9sstOxBlmcteUlMJkA3YR
	xewgZAlE5HrMnQceUlF18zOTyw50vsnT+F7goxw==
X-Google-Smtp-Source: AGHT+IGGEv61lZA9mh+6DUS9SFPSvDLpedgHfe82sAKsqEu8+0Y0OH2Uh3V5PtPQFVyIyuu+NY/A4IbZiEUJ+kCoNoQ=
X-Received: by 2002:a05:6902:1441:b0:e0b:4e20:b592 with SMTP id
 3f1490d57ef6-e0bde21a393mr13367382276.6.1722853991091; Mon, 05 Aug 2024
 03:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710061102.1323550-1-quic_varada@quicinc.com>
 <20240710061102.1323550-6-quic_varada@quicinc.com> <d454e01f-3d6b-4a02-87cf-3d289bc6957c@linaro.org>
 <ZpeLYG6vegJYZ5Rs@hu-varada-blr.qualcomm.com> <ZqCD3xtkLHbw9BHN@hu-varada-blr.qualcomm.com>
 <iy3l3ybmvllqxtyqq7fifiokxaaedrs22davveel4ikjoqivdm@dinswoc52qpz>
In-Reply-To: <iy3l3ybmvllqxtyqq7fifiokxaaedrs22davveel4ikjoqivdm@dinswoc52qpz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Aug 2024 12:32:34 +0200
Message-ID: <CAPDyKFoSK4_gRtOY2_pZhT7AytZ4qpZpRTzg5cOrqJj7A22b6A@mail.gmail.com>
Subject: Re: [PATCH v6 5/9] pmdomain: qcom: rpmpd: Add IPQ9574 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ilia.lin@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, quic_sibis@quicinc.com, 
	quic_rjendra@quicinc.com, danila@jiaxyga.com, neil.armstrong@linaro.org, 
	otto.pflueger@abscue.de, abel.vesa@linaro.org, luca@z3ntu.xyz, 
	geert+renesas@glider.be, stephan.gerhold@kernkonzept.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Praveenkumar I <quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jul 2024 at 19:26, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Jul 24, 2024 at 10:02:31AM GMT, Varadarajan Narayanan wrote:
> > On Wed, Jul 17, 2024 at 02:44:08PM +0530, Varadarajan Narayanan wrote:
> > > On Tue, Jul 16, 2024 at 02:15:12PM +0200, Konrad Dybcio wrote:
> > > > On 10.07.2024 8:10 AM, Varadarajan Narayanan wrote:
> > > > > From: Praveenkumar I <quic_ipkumar@quicinc.com>
> > > > >
> > > > > Add the APC power domain definitions used in IPQ9574.
> > > > >
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> > > > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > > > ---
> > > >
> > > > Could you please confirm [1]?
> > > >
> > > > Konrad
> > > >
> > > > [1] https://lore.kernel.org/linux-arm-msm/57dadb35-5dde-4127-87aa-962613730336@linaro.org/
> > >
> > > The author is off for a few days. Will get back to you once he is in.
> >
> > Have responded to that query. Please see https://lore.kernel.org/linux-arm-msm/ZqCCpf1FwLWulSgr@hu-varada-blr.qualcomm.com/
>
> If it responds to voltage values, please model it as a regulator rather
> than a power domain.

Just wanted to give my brief opinion around this too.

I agree that it seems to make sense to model it as a regulator, but
that doesn't necessarily mean that we shouldn't model it as a
power-domain too.

If it is a power-domain it should be modelled like that - and then the
power-domain provider should be assigned as the consumer of that
regulator.

Kind regards
Uffe
