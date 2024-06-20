Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5567F1AED4E
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718896196; cv=none; b=PB79j3CE/e05VKGqjwCDDCJMpVxi/hPHh3b6+9RuyCVrjp0TzR0FdardU1thfIisU4DU5RRq1B5QhXGBE8cVwG6MOWwOSBJeeFo115AzaHAgPabdJ7Bz6lQ7g24bT2DH4jklC3bRwZ6Ctmt9altcApB+qQVTWjA/3OVnpdn3CGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718896196; c=relaxed/simple;
	bh=mfiwSIjC731sExU1owoEvvO8FCSEVIoCYkKggzTldDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrNLGu7WDT5BHCyq7vwz74t78viXl/WZ1pgvWL61IxymV6VdMXq/VycIeWIO7lPIot6Ck6j7Vh5q9QzQ54Fov7AgtFlQrWpdy06sHwYunS5/oEqLRTe7g1gDCuKuXMFaWeswcdAgT5fedIKaILEbtdO4kGj1ce8pzRrbOO045Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0P6wIfa; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0P6wIfa"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so916917e87.0
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718896193; x=1719500993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gK+thIDawbMI8D6X0tNOPUzlxQcTHptuQx1Z2ceRXM=;
        b=V0P6wIfamtHqFfdSKj+7giMe3rhe9Saloyfx06RP4zZ0dxam+nYkdJLhiYR7zFY5Ie
         qkHDnkBjV3Qu+1IxADNrakETXBVYpu+Ynzjiu7SwMfGjctAmni9ecnygedl+kMEgFywP
         p8q42rahO6+xzGYFuQISPWf2Xu4eEEvG2P4HDc7wldGhBPcq13FOI6N/Bg4Xo/zLSu/c
         6o8bBdsxJDeMwGQFzVEnDN9DjIl2ohosU7qsGOnJgIab1pHMWpCL9JKuVcb/TYMSPBvz
         LL6B72fExJ34Jn2uT+YyrqVrdUAXJcS7uLZWnF8jmyOe6+cp2mUO5jWmphIaWC6NX8f+
         VOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896193; x=1719500993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gK+thIDawbMI8D6X0tNOPUzlxQcTHptuQx1Z2ceRXM=;
        b=xFxYcxHoLSUmtZyn7madma8DXFwdtzKXxdu60UkxusX09ABTuz6D3xJhSGfqcHJulu
         W6rmcmgB89hjEe2oOPoUv9+2p/p+KgcRVUdZa4U3/jt3aamHmvMTCvjAAMlc5IVo/qB4
         ixJPXMsdEbZNakXcBpsVkqSvMYSCT+QRQosieEOAq2wTlCQn4k9Xf0OuaNGoabKNxpJ2
         EpvJSJwnylp2B82d6h36GLg14CIMn3Dc/Q7s9l3zOqwZk4sBXqFG8YWoaKOeXwih5mMa
         L5A2M/WAUkyW1APy7Lp+PRKjIXg6Y78nWlJf8d+rLS/qyi5qWBSeC8FABf9LmfsgLSQ2
         VppA==
X-Forwarded-Encrypted: i=1; AJvYcCVJFMx5hTQsth5ecCeN9NdvEKTzFiAVp/P7u+QRAmT7QgGjP4K9fH6VkvH0naBrHdy5+I6TNb6P6wvLogPZJgy6RsRenf3aft7a
X-Gm-Message-State: AOJu0Yw2XkuMcpFlxvbXnGY1z1vkf0xrIZHZw19W/rP0YSAI3/GHy9/M
	vOVpi1i5FdU4p8/84qhrA0cECcRPXw7sVQ7jll50TYYa3na/fEqE8c3AodSaJQc=
X-Google-Smtp-Source: AGHT+IHZ7VSN2wu7ZM55UCXbxtOpvLmg+Rz6tqxnMXIu8tRVtuNvG3de09teEXUPAPTQMcqu6Cz87A==
X-Received: by 2002:a05:6512:31d4:b0:52c:c64e:b902 with SMTP id 2adb3069b0e04-52cca1ea264mr1869080e87.27.1718896193490;
        Thu, 20 Jun 2024 08:09:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2826269sm2091191e87.61.2024.06.20.08.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:09:53 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:09:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	quic_rjendra@quicinc.com, luca@z3ntu.xyz, abel.vesa@linaro.org, quic_rohiagar@quicinc.com, 
	danila@jiaxyga.com, otto.pflueger@abscue.de, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Praveenkumar I <quic_ipkumar@quicinc.com>
Subject: Re: [PATCH v1 3/7] pmdomain: qcom: rpmpd: Add IPQ9574 power domains
Message-ID: <jfh2xygjdoapkno2jrt6w7thlylgyp2tk7oaczundhxvi26qel@ahtskgn4v6sp>
References: <20240620081427.2860066-1-quic_varada@quicinc.com>
 <20240620081427.2860066-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620081427.2860066-4-quic_varada@quicinc.com>

On Thu, Jun 20, 2024 at 01:44:23PM GMT, Varadarajan Narayanan wrote:
> Add the APC power domain definitions used in IPQ9574.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>

The order of the S-o-B's is wrong. Who is the actual author of the
patch?

> ---
>  drivers/pmdomain/qcom/rpmpd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 


-- 
With best wishes
Dmitry
