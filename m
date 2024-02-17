Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9DB7D3EA
	for <linux-clk@vger.kernel.org>; Sat, 17 Feb 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708188353; cv=none; b=McwLkZ2H8lQ74hPBppXRpYV9Qet5GLJFmCt/HXfC1hWw7SCaSZCJyw57U6uscSMJtN/ex+DyQRI60Ah1UIrxW+PiHuwueifqArq0FC93RhcKPP11d23cJTcqsyOJ+wYt/0baTWy2+k9zTexS3pQLA2dG/mReXf5XSDZklzxahjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708188353; c=relaxed/simple;
	bh=jnNx/uqfu3MLSSg6puGANl2kdnhsWwqi8IjbRuM06nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl/TQ7R7qYpuX3B4xAGh9CcVJ2QHmwSngCKV4knmpXogQxJgNAghQeJxP2mqPKPtGXDQ/Drst1cXJTxM5ac/0eha1Mv3AuYgDGW2NUbyCU9yvXn8I+6mNw1fxEKZ+he/9ZYCzjL5SlEScBD+ZBsYB2TiqPBgYhPO281jB0wBz0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHmDLqTw; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHmDLqTw"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60802b329c4so15660817b3.0
        for <linux-clk@vger.kernel.org>; Sat, 17 Feb 2024 08:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708188351; x=1708793151; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8b4mZDPM8eGHJ9kfKGWzDwm7bcatVceDQyS3pKcfyeA=;
        b=EHmDLqTwYTX8oymXtAWA4HPpYtFTeD4plFX+mf3NEG17EgoGsCArVnmFpkE/LbPqZ8
         6edlP36Hs5Z1588riiAocj6r89AmQcrLBzReJoiVHGTxsNX+lafl0R70MfTZLFJwk9v6
         6e7vetaZfN+q8ICXViNr5jS3O1C6largIluLL/KsauPKUfxqYk5ALNsMdJaiYT7a5PnG
         HWe56IJcQEFZeoUp5noFBnkIIH8HxKMZKReOiEl8szLuiOvhiWwbYx66OF9oDU9Eywer
         0Skr/GWU6qKR/Q+8FeGuFXck1cKPJkEFu0hRs6Z6r1TElPI0z0w3z9cW7ZwGN2+X1zIh
         IQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708188351; x=1708793151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8b4mZDPM8eGHJ9kfKGWzDwm7bcatVceDQyS3pKcfyeA=;
        b=JwvYwRbFg6s81DTMFk/pbkimTiugFw9UsT4eF7nrdk2vnx+wlFnvifsX4zT4xNrk8L
         3x9kbsaso5UY9DqMsSSV6O5Hi35da5DYz+6nB64EUI2NgPfZQVD1MZim/jleNfWN0oG/
         ho0V3wnZ8dk4helWD+r9qJ1hX93PvEAHnJIVvBRYOWGBxuflKVA54kDShRegE6bk6Xls
         UhO3aCNwqTle2W28P55rKaVnh+tOmCwYELy+FnyNkRhKHKKHioY17f/Wy1GCM4/ce2H0
         AQmyF5/j9x6b4gpl2kQOYAiOq9PoBj6C5wNE5K2r/wOFQl0mOqiotyh6BDqBcTMEsMb2
         rLgw==
X-Forwarded-Encrypted: i=1; AJvYcCUgP6ALljw/AzlmgUOzmGC+VrpwygHdxc8/xXH8qJ5fphI3AAO5SfiLFfpOhWMSDjCWMkIxx9oAJYcOl4Hnbc3fUnpbrB9IgZSD
X-Gm-Message-State: AOJu0Yyao7R2ath5jCEa44gA7tvHS0lENm9/5tuieQXMz++RRK17RWqg
	82+BhTIQglRLFbO61bi1G2JX81c/ImBbm5Wo22wTjzdZZL5uOxEZCYzDdRYxV4I17LP9PYDDhVv
	gJFfKl9BRqW2iNftjIxAi4gftjvzhP4CJ3bC8jQ==
X-Google-Smtp-Source: AGHT+IEqILzoK/VmX6sfUGgYoxs+Kj6m9usmVnKhsv0jSGQKkMhWk4CcrhNvGz0Qw6T1QZh9IOG6jFOhIBdsPvVlWDI=
X-Received: by 2002:a5b:18d:0:b0:dc6:d093:8622 with SMTP id
 r13-20020a5b018d000000b00dc6d0938622mr7622931ybl.15.1708188351064; Sat, 17
 Feb 2024 08:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122-ipq5332-nsscc-v4-0-19fa30019770@quicinc.com>
 <20240122-ipq5332-nsscc-v4-2-19fa30019770@quicinc.com> <7a69a68d-44c2-4589-b286-466d2f2a0809@lunn.ch>
 <11fda059-3d8d-4030-922a-8fef16349a65@quicinc.com> <17e2400e-6881-4e9e-90c2-9c4f77a0d41d@lunn.ch>
 <8c9ee34c-a97b-4acf-a093-9ac2afc28d0e@quicinc.com> <CAA8EJppe6aNf2WJ5BvaX8SPTbuaEwzRm74F8QKyFtbmnGQt=1w@mail.gmail.com>
 <74f585c2-d220-4324-96eb-1a945fef9608@quicinc.com>
In-Reply-To: <74f585c2-d220-4324-96eb-1a945fef9608@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 17 Feb 2024 18:45:40 +0200
Message-ID: <CAA8EJppuNRB9fhjimg4SUR2PydX7-KLWSb9H-nC-oSMYVOME-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: qcom: ipq5332: enable few nssnoc clocks in
 driver probe
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 17:45, Kathiravan Thirumoorthy
<quic_kathirav@quicinc.com> wrote:
>
>
> <snip>
>
> >> Reason being, to access the NSSCC clocks, these GCC clocks
> >> (gcc_snoc_nssnoc_clk, gcc_snoc_nssnoc_1_clk, gcc_nssnoc_nsscc_clk)
> >> should be turned ON. But CCF disables these clocks as well due to the
> >> lack of consumer.
> >
> > This means that NSSCC is also a consumer of those clocks. Please fix
> > both DT and nsscc driver to handle NSSNOC clocks.
>
>
> Thanks Dmitry. I shall include these clocks in the NSSCC DT node and
> enable the same in the NSSCC driver probe.

Or use them through pm_clk. This might be better, as the system
doesn't need these clocks if NSSCC is suspended.

>
> >
> >>> Once you have actual drivers, this should solve itself, the drivers
> >>> will consume the clocks.
> >>
> >>
> >> Given that, NSSCC is being built as module, there is no issue in booting
> >> the kernel. But if you do insmod of the nsscc-ipq5332.ko, system will
> >> reset.
> >>
> >> Without the networking drivers, there is no need to install this module.
> >> And as you stated, once the drivers are available, there will be no issues.
> >>
> >> So can I explain the shortcomings of installing this module without the
> >> networking drivers in cover letter and drop this patch all together?
> >
> > No. Using allyesconfig or allmodconfig and installing the full modules
> > set should work.
> >
>
>
> Okay, Got it. Thanks for the information.
>
> <snip>



-- 
With best wishes
Dmitry
