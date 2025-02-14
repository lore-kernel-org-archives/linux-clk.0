Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F3424BC1A
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532690; cv=none; b=brzyqlTw4Sb0pjDg4HASIsUOynIzsqhzVVTjh1m5iSc2lY/SiDJtFjdz8Xfp4dq/psAm0MF4SPAKu8R0vviqsxDvvznd6FqpZ2xcROG1caFzzjBp5N9bBpm/sFMyJWGc+jYZciibLZWXtAVZfKx1ZlcdoFfx11RzWsi9aETooGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532690; c=relaxed/simple;
	bh=2U0g1+m0tosU4qQlWPu1j9YKUDgGDzukDvuljJcEnVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq3nMCmiC9fFMZ4ZSMQEeUyeja9BKFqLb9x6jt4bLNqvp/1YnMToZiBn5/Ipuqpdod/957uBr7XdhpTdZfI0WOgpkY066D6mFXlSatRF4DaFfE/VgK6OABBjaVuqtqPMAWtgTbhdkqrAg4cSSdl07Lb1V9AjROCFw27thSf1o2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sFNnp2sq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFNnp2sq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5452c1daabeso308516e87.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 03:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739532687; x=1740137487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQrrMIIcsdepuAUZtYMG2ibPJAIlpej8VrcFVh4LEgA=;
        b=sFNnp2sqD7mjLqfNrs/1f501u+5IytNpwB0hTBLpq5dLCrIpxV0Z59e7XHuoC3lB0p
         J+Gz9sNGFhGZMPLJ5ZwW7VifwETi80zCLQZ6lPKoPKblO3Cqiq5eoll7E96QTMpbOyyV
         tcEUO9Sq/IjlkO8imriCpyG746jvnAtieoCz2IHWxsz27QoA1lU6QMZ9ciqrQAOZMfhb
         14c/oGsfRph0UWKGO5r0Dm+dIhzBWWqf99EDujoUMnmKUB0kJwlRPzQZOK2CiJ3XsC+o
         1iH/S+Tx6tnJ+ez29pe1Qj6hlEpR2FRfHnAvODb2WtBtHzR4xVkkziJbzkqMU8tV9YDW
         SNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532687; x=1740137487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQrrMIIcsdepuAUZtYMG2ibPJAIlpej8VrcFVh4LEgA=;
        b=HMtvnxk1x2oxFCOSIUkul8XbnQl7u8m+zaM8Sxed8ebrNsrhIGIKrVLpMvCXtWCS46
         8v/QKa7aNNo4+eVOIvkyeyj/FXHriystMGconOuLcg7ZEZWy4YGt6L4z7adVzOpgpjyI
         nT3gxDPBLAfO5RLLb9oslAK4ckDsSChKbiZXkWv3J8SqiitUVgaBGmE89TfoErj7NYmY
         0eCnuKEXJ2UXwEm3hAhsjyHzufH4Ojcprjc0axSjEAJ84bWvaQbtXYfHSUCANZs4JFh6
         NEyIIrpdzd9T0oncx3J2qDJDjoCdCOSKjjJZ8R5wSy8/C0fyRg/UzsP4YH7rX7X0RDyW
         jPeA==
X-Forwarded-Encrypted: i=1; AJvYcCUlX73NALL8S/FoKrsOG6m2rbdY/oSmeczjlue5DrQ6OGFY4QGTLeD5EkgR2p6+XGssFWabHzXC/MA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAwwv2NY8+4DR5tasstYhdLY19fbK+7lHbj+/ASUkGbjmEYYB5
	mSiwDrKgZWdYDoMFDsdoAdCmXFQ7uGRZcXt6MuOMM8syiAMxgtymayviQ9QTAXU=
X-Gm-Gg: ASbGncuU2NKmcnFUKh9aTYhPtMwS8mVeAL6vzBkm9vsmyRvWxZ3HLdrWmxUFoPtR/Rz
	VaFnampadoYi4TMUseYnlOtynIQ0PAmatYL0RhB+1AO0Pu8kICr305d8pkE5l1c6crhVsEs8k9h
	cGEy/bk58vZYxEJdHWjKv759+gd3bP1kE2lehr+lDGCn2ybk14BZOoxmcosGPHUTvEOtpTdoGw8
	vust+jtq+nX4fJuTidmUd3LmnKPi+daGpwdoeUVjyXJiuORgbh5/tCjrJWVjtG/n/WfPAAKRiFr
	vy8vVv8Y/NcSc9g9RRjxzAj1Z/D35SRSAL3zSL+rrbdhiD3mgcx0DW4jMA+HC/WUv8PHPck=
X-Google-Smtp-Source: AGHT+IGjs9yMg+iCQr3IF2oWlxeySoJlOZkKJgyEb8x4vfVkiQxa9wP3j61Oy3tVPMRng/3g23DMxw==
X-Received: by 2002:a05:6512:2216:b0:545:62c:4b13 with SMTP id 2adb3069b0e04-545184a2e51mr2906212e87.40.1739532686682;
        Fri, 14 Feb 2025 03:31:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f083593sm487198e87.18.2025.02.14.03.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:31:25 -0800 (PST)
Date: Fri, 14 Feb 2025 13:31:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Message-ID: <cpem2v3z5slkihza4h4kaocxitpmdpnkrnl3iksevbewsqo5tb@zugjn5ng6oci>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <b4d07c0a-5b09-4a89-84b0-e8508ae12ba5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d07c0a-5b09-4a89-84b0-e8508ae12ba5@linaro.org>

On Fri, Feb 14, 2025 at 11:50:14AM +0100, Krzysztof Kozlowski wrote:
> On 27/01/2025 14:21, Krzysztof Kozlowski wrote:
> > DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> > two clocks.  The respective clock ID is used by drivers and DTS, so it
> > should be documented as explicit ABI.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Patch for Display tree, although with Ack from clock.
> 
> 
> Any more comments from DRM side? Can it be merged?

Yes, it can.

-- 
With best wishes
Dmitry
