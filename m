Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A76200B7
	for <linux-clk@vger.kernel.org>; Wed, 24 Jul 2024 17:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721841992; cv=none; b=J565Hh7FVYro54FoZy8CWb5AfLddxIS8vNv847cGVJ4nZMqXQG1iQtFyohutVx0ZTLt6qjzty2Wg78jNB8JSEkJYWMgKKA65kN1zNWflZMv0+jWweCRlQmrIAcO+CuX5tRFuBbk5n89Vn0nq4KPTWgiYgGVFX+FHEw8TV1L8e0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721841992; c=relaxed/simple;
	bh=nirmYw7F2dXu3jHlu65M8bPLc+xMzWCodmmYzuIxjFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNB186VgmvZKNgtlQsnmA5o3+E7ix5ss92x6iAorlLG1hWQLmxX/EkvV0KxD/t/toj7aiTMC6Qes80lV0WMJdYf7h5y5mkgB0pC2CxFMSXHvqe5eaHlvpchCohRycaNctz6HA8FF9m31soa1ynAeLpHyy59KU8H8G/05IupEUhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6vUAwb/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6vUAwb/"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ed9b802ceso7243353e87.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jul 2024 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721841988; x=1722446788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gyjxRwZj2E8/gds3ss9PWGb0Bwbvl9UNoycwou2Ge8=;
        b=c6vUAwb/UeWzIuHEo6185p+G1KDKK8dDaWZ9CsMhmLDvbBrWLwgT1R6NkE9wmgQngA
         /dp5GZfmH8giO4TpCMZAeUgyK+XYpF+6JUlgwaCg8Z9qea6ae9mHTBCgWPHmlDROlWCy
         ToTDyX6+oC6Cy1W0osRfemF953dWfVql97YqXf6rRR9qVsn1Y9jR90VNoo8wTg5FHXBM
         ZbLh6tTQocJSs4HtLeU4lq8TPePxM1S1T1ctVaOvpWIx0vFSJta2AoHuFJbYnMMKWSe2
         DGzq8yZDXH6tKODSWVSZ1xFjdfSPNaB2o33jmQ4fcGRc3P25Vowd9bytuEfRUPH6cE5s
         vbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841988; x=1722446788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gyjxRwZj2E8/gds3ss9PWGb0Bwbvl9UNoycwou2Ge8=;
        b=bOuVz/A3PmCiLteu5SAlTGtFKaszG4cfTWh5b/DRJHI8Og4xKjcH24jNnO8k6kZkSz
         +KwL0DFBGf7yP7tpkVZnlCJHaxEslaMCWTNqTI7e1HFfycBw5Jnq4KD8lrSlttBOXqcF
         1BrH7pA8ArRAFfVyJFexUU3APBlwLCgVzD4gp2d6aYKNs1sn4+9KLXhkGrHRbQ5SiBqY
         +h6gVM0jXw09tymY4ZG50L9QZZkYgmXlNgFG50b/AQaq8RVNy9Og2jsa+uM7kfohbFdw
         7TOv+fi4s6l3ZeYNvlYslY697/1MNrQ1vgNwuTJiz64jJYARoBWUQb300yhQ/dYYHLgQ
         zTPg==
X-Forwarded-Encrypted: i=1; AJvYcCUCu4iolrzMeQAiESF+ldZuaK2Kexzczohxa5BaF3EANRl26NARGlulhI4AFgpRC9y/K7HXxibBTm2u6od+kINyE4VrdBtjRGl0
X-Gm-Message-State: AOJu0Yw7wrzpOhVdqZHw0Nrj2Gpds13DDLT1RjNBHsvvWSg6yWB1ex6t
	6S/PeVYiqeGVoL6ZQVQB3q7+ZnmmR8JcTOhFehydoj0iIdegwKm115IqEBcziuj810u3Ku84gwr
	1
X-Google-Smtp-Source: AGHT+IHlDpSkUv36Gv/Yk9ACZKyixMbYij87/r4e8rpjoasoFjkXepMGnJgzlNprXteCON2oLyXFpw==
X-Received: by 2002:a05:6512:b84:b0:52e:9b9e:a6cb with SMTP id 2adb3069b0e04-52fd3efa634mr362510e87.15.1721841987977;
        Wed, 24 Jul 2024 10:26:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eff3bd6ecsm1445088e87.4.2024.07.24.10.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:26:27 -0700 (PDT)
Date: Wed, 24 Jul 2024 20:26:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ilia.lin@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	quic_rjendra@quicinc.com, danila@jiaxyga.com, neil.armstrong@linaro.org, 
	otto.pflueger@abscue.de, abel.vesa@linaro.org, luca@z3ntu.xyz, geert+renesas@glider.be, 
	stephan.gerhold@kernkonzept.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	Praveenkumar I <quic_ipkumar@quicinc.com>
Subject: Re: [PATCH v6 5/9] pmdomain: qcom: rpmpd: Add IPQ9574 power domains
Message-ID: <iy3l3ybmvllqxtyqq7fifiokxaaedrs22davveel4ikjoqivdm@dinswoc52qpz>
References: <20240710061102.1323550-1-quic_varada@quicinc.com>
 <20240710061102.1323550-6-quic_varada@quicinc.com>
 <d454e01f-3d6b-4a02-87cf-3d289bc6957c@linaro.org>
 <ZpeLYG6vegJYZ5Rs@hu-varada-blr.qualcomm.com>
 <ZqCD3xtkLHbw9BHN@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqCD3xtkLHbw9BHN@hu-varada-blr.qualcomm.com>

On Wed, Jul 24, 2024 at 10:02:31AM GMT, Varadarajan Narayanan wrote:
> On Wed, Jul 17, 2024 at 02:44:08PM +0530, Varadarajan Narayanan wrote:
> > On Tue, Jul 16, 2024 at 02:15:12PM +0200, Konrad Dybcio wrote:
> > > On 10.07.2024 8:10 AM, Varadarajan Narayanan wrote:
> > > > From: Praveenkumar I <quic_ipkumar@quicinc.com>
> > > >
> > > > Add the APC power domain definitions used in IPQ9574.
> > > >
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> > > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > > ---
> > >
> > > Could you please confirm [1]?
> > >
> > > Konrad
> > >
> > > [1] https://lore.kernel.org/linux-arm-msm/57dadb35-5dde-4127-87aa-962613730336@linaro.org/
> >
> > The author is off for a few days. Will get back to you once he is in.
> 
> Have responded to that query. Please see https://lore.kernel.org/linux-arm-msm/ZqCCpf1FwLWulSgr@hu-varada-blr.qualcomm.com/

If it responds to voltage values, please model it as a regulator rather
than a power domain.

-- 
With best wishes
Dmitry
