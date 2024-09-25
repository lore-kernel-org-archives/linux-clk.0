Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345DF145B0C
	for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727299905; cv=none; b=KImi4vbhZXzKZPGgOJXANDIIloxy5Qo0gy9ElyC00gnXTODciWUBGd4c3XC5bSPyIUIxpCek4X5AnsIE234JOz6Qwkh2duliweTfPFqpQBT7miDqpuyc9DGnp+noqrvAG+81D1UBInsxFbmKmABG/s0cf+nizaS5aCdQYRr5Rfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727299905; c=relaxed/simple;
	bh=q1hnfW/UYENj/VV96bgSolK/g/2vdQSz2wVyhQteCPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sb7AJoe0k60T2qv3giRnnzlhDtLk79+x8VtmeefzM6a6tw0EJVwGZcnmHG6PKaoSUyrqq1+pt/iBZTEYfFyFQGisNhgqwFbxvS00B/b4KX8Dr2LMGeOU+WhCLqPahX/kcFgm4bAGv73h+7JVynEiLggDSAXMdJu09b0+SGebQAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpHxw83B; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpHxw83B"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so353782e87.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 14:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727299902; x=1727904702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2gRWXk6um8ssZG0dTYz3h8O6sPux+vtNyTeziNQM+4=;
        b=vpHxw83BEcxXUiXAHcwannMowZ5Cp/Zm0//e9txywTNF+VvbYNu8F1jTKNov+mH/Ns
         5hHQflIjhKUl5G/IPTQ1QlYBoyLU+pl1Qt4Mx572kqq6ImpdtT9nvn7R1iEEZdIHMOxB
         SzftUfPVRDvh/dh4iGooNg+6fQdfSwKqC2XOKsnIbMuGDmC0MWWgUrNTgHl0q+YB/QjH
         E6TDD2eqeFktH3aKA7aTMaEBEEEm2Bnp4OTeVI5cdWgWqIyT1MrP4YYAq9UO8Q2phjMl
         Cl+YWdmPf1FQZtaE2nhr2VGc1ZXKepGxtu0tMXMKlhUgIh3yLSandXdoVQjX1kgBeB6r
         TSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727299902; x=1727904702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2gRWXk6um8ssZG0dTYz3h8O6sPux+vtNyTeziNQM+4=;
        b=n2ZLFfYqi8wIcqozZdhWHPMWgxPuhWNMdaFsy8LIO+7VLCuf5D8+hCtJH8FF3qAAd2
         n55Cgs++9IA7GbU+N/DSSTWCAGWLAyEHv7amZcDUqiAw0ooYrmEYJpOGzdHhb84PWP2Y
         uQlPAlyfkUSJZXyWd2EcWSsQ+OTz8agEbCZH8SNNdYxZ1fwV1LIt+A2lzDNMOQHS+gjq
         da/0t4c8LtuhVQp4Xk+v62OKRHZNeeUQO8c3RpmbSmNvgUxakGoB06Z7oTDLAKhlcQHT
         wUWP7ShE4AONBXyMld+bYgrtswrwab6EQS7iYM6Bt5AW72ha4roiGSNIyAEQ4bN/NqSb
         703A==
X-Forwarded-Encrypted: i=1; AJvYcCUcG4skPvcCdqH+uJVPz7GCdfroAAl5BrpxOUJz/QVyx/WhHQ+cf1zN+3BoSWqES0r70dg0NLvumHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ/GBkma9TUjK5T0ympqcVGg/Wk/IUOkHcizKgr5eBzPnwX5og
	TF0N+/R7IFXsleq9SnDA69SIGVPJ4ZwaIQWN/39hhOzfo7opBbiuR4q8vhPGGKQ=
X-Google-Smtp-Source: AGHT+IGRtxkMp3x13jBkNmqIgOxnVIpZ0WovylKJsjpSzFGlmQuJwR6WMxOTZoa6v7kxp+tzwKvB6Q==
X-Received: by 2002:a05:6512:3a8f:b0:536:536f:c663 with SMTP id 2adb3069b0e04-538704986fcmr2778800e87.22.1727299902152;
        Wed, 25 Sep 2024 14:31:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a86408dasm623111e87.144.2024.09.25.14.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:31:41 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:31:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH 8/8] arm64: defconfig: Enable IPQ5424 SoC base configs
Message-ID: <h6ajhgv5rqabxupove4ge4253ywzbjyxoqq75c7ojmauudd3z5@hhhkbbzfmved>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-9-quic_srichara@quicinc.com>
 <4dxqbm4uuuuht5db7kt6faz2pdeodn224hd34np322divs22ba@dzmjveze3b4f>
 <2a16d5a2-17a5-4988-8a25-34ac10ff3d08@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a16d5a2-17a5-4988-8a25-34ac10ff3d08@quicinc.com>

On Thu, Sep 26, 2024 at 12:34:56AM GMT, Sricharan Ramabadhran wrote:
> 
> 
> On 9/13/2024 6:23 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 13, 2024 at 05:42:50PM GMT, Sricharan R wrote:
> > > From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > > 
> > > Enable the clock and pinctrl configs for Qualcomm IPQ5332 SoC
> > 
> > Please name the device rather than the platform. The defconfig affects
> > all users, so it should be justified.
> > 
> Sorry, to understand correctly, you mean to use the board name here ?

Yes, the board which is generally accessible, if possible. You are
increasing kernel size for everybody using defconfig, so at least it
should be obvious, who is benefiting from that.

> 
> > > 
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > 
> > Usual comment.
> ok, will fix.
> 
> Regards,
>  Sricharan

-- 
With best wishes
Dmitry
