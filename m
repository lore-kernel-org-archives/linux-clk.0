Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C03019C561
	for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738065965; cv=none; b=sldbKp9NLTXxQj30JVj5jXmfgJ7m2m+0Ll7H+KczfRO4Dn/L20EV9aoaXgtcldmLnYvQzM5pO7QHD3czz1C9EWH2xBqj86vA/q93jmvi+4pylZqILXHTFw/2ep6ITz6k4mR0q7uVo078A9P0+pK8UQ93+IyRyVarV93d2CP28do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738065965; c=relaxed/simple;
	bh=oufBkASVLAZPPxyZ4LNnHSodYk2v5NWX91Nm7PjoLCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gw+fKFEimFsgl9fyuSSUjJ7G4e+aSiC4pEs0gJiViHQ5mCVPuFkzpJDwNeT1ZKJJH2ywaBJzFFD+OeyP2pQMH9G4uSZMOqOsJ2OnzD/SUdvHbcUFAyoNjey2Zy1nJ+AowdHL4rtYrQ9sEd1QXAneiJC1YnsrhAAUINax0oWyp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCb09hNU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCb09hNU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f22fd6832so6194354e87.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jan 2025 04:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738065961; x=1738670761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUyQVfWY0TcVLA75T8KrSwQy4er3JVk1Q3BfjVHWE9I=;
        b=hCb09hNUOo65hpgm2+MK0JRqf53L1j2rXXJ5+8GirKwzxEMu9zXgygGeOOCehGbd11
         /LvDD9oSuTwsawu7WNp4yzTX+C8Ehqmy6rOQatQsdG3Gq7JDAwJQNsadMwlcdxoKmMzQ
         fi5IekNoDpvkfs/272qoZs1IWY8Je3nEcKYF9VLLVi5eCzvNKeBMboBku3J/U/iVUlRR
         RuukmzD/Fvf11zncUU4coM6RzvTFo5zNr4xa8PmQm478VHl077MR9IGtnQaAZx711xdM
         ndO+a3LgJW4SJfUP3OeKgr7oh9N9Pi+JvE/0n52Uc9FnIPnyANvaFbN3Uk0/0bs8WnRO
         9i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065961; x=1738670761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUyQVfWY0TcVLA75T8KrSwQy4er3JVk1Q3BfjVHWE9I=;
        b=l6XghQSGwRHSp3r30Cz6FfFMnK9GgtJBVeOUZYbv1f99Y+IYHM3i80Qqf7tAtklyIK
         5+lnm4vVJkBEy6AcA0xQL7wCxaWp6MTg9VIHL+5S962QF7bXws0V6enekRo2i4yNwGVe
         /cggIYD9qmJ36+rIjQFY4mh0AMd3l88xS/hFy8VoLabGK1pkCl7W7+65RCjFDNL4mJYN
         qNVOgjmOiWQUqiFsQUUxQt0QF9Li0E2QLTLYELh95pJf9rdTxOmXbQ99DODAacfypJro
         Dw6xhiqDp3E6vOn57beRw+EGyMyQaWK0yb8qVnIg1XE1AsApaoVwyjObD90D2zVrWYKB
         zS4g==
X-Forwarded-Encrypted: i=1; AJvYcCVyxi5QtYUevPb9bsCHn1OuWs6XOyjxK+WiugnJ/3ziVvHId2q3AvRgdA0d39Vd8jyxrfG94TsyZPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp6+GogmxmV5RDI0j4vOhNi00ELPGtvnOwADmNdGlUQOn/Dkb7
	kixjXOlBUYAnbhaUH7+NNpJNMcSB/vr0lAEzNipQMCdayRw0hKeZwJb47hbeegE=
X-Gm-Gg: ASbGncukpCUvfRomw/2yXgjvWegymlYPES2DzZJMHCLDncLXnPfwWJpjWKEYVnGj+qI
	Kd1dRV9eSvKeJmkCP7Vlc3ue6PgS9e+kNp9ITMuyaEkV31vpJ81yQoS55P7YpCxcLX3lZfKgXlD
	m+5CiPmyf1ecvLvCQg03V9610qb9U3McbAhiSqpO3nypi1RDTHyM8KOPO8KhPSlr38NUor/k7B7
	soE/7S69dv6QEOmVYuqdP+/eWyZoEjkzHx51ZMOv+eryLB6ZOQKiMEHWkxpMxOJr+n6QOkXBfbe
	2POFDvVRGfCz//EP6K6j4+sCUyV6fowFKRWT8JO9KczwgY91bHQudoX+oSK+2JHZtCPr3sg=
X-Google-Smtp-Source: AGHT+IHAsiYhaOuqsjBfo6+IiSS13eiK4EvcYmQzAODrNEPBRfk1wrbF7CuWTZhv/BBI0wyJGPOXUw==
X-Received: by 2002:a05:6512:b94:b0:542:7217:361a with SMTP id 2adb3069b0e04-5439c22c3bemr14203681e87.10.1738065961178;
        Tue, 28 Jan 2025 04:06:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc194cesm18324081fa.72.2025.01.28.04.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 04:06:00 -0800 (PST)
Date: Tue, 28 Jan 2025 14:05:58 +0200
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
Message-ID: <q7qrfmmzvs7uyleiuxzaahhawcgexbsyvi7edubpfmr6ompcw2@vj2j434qcwbf>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
 <7038f0a5-f7ae-44da-abee-bd04fecf74b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7038f0a5-f7ae-44da-abee-bd04fecf74b4@linaro.org>

On Mon, Jan 27, 2025 at 03:37:05PM +0100, Krzysztof Kozlowski wrote:
> On 27/01/2025 14:56, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 02:21:04PM +0100, Krzysztof Kozlowski wrote:
> >> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> >> two clocks.  The respective clock ID is used by drivers and DTS, so it
> >> should be documented as explicit ABI.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Patch for Display tree, although with Ack from clock.
> >> ---
> >>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
> >>  MAINTAINERS                                              | 1 +
> >>  include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
> >>  3 files changed, 12 insertions(+)
> >>  create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> >>
> > 
> >> diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> >> new file mode 100644
> >> index 000000000000..ab94d58377a1
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> > 
> > I think this should be dt-bindings/phy/qcom,foo.h
> 
> 
> Both options - clock or phy - work for me, although with slight
> preference of keeping foo constants only in foo (so clock -> clock)
> because then clock maintainer sees it as well. Also because I would
> judge by type of constants (so again clock constants -> clock
> directory), not type of device. We have several MFD devices, like PMICs,
> which have a clock, so bindings should go to mfd? But mfd is not a real
> device, but Linux subsystem.
> 
> For many other archs, e.g Mediatek, pretty often even for the same
> device, the binding headers are split between clock and reset. I know
> that Qualcomm GCC has it in one file, with exceptions (ipq, qca8k). Also
> these other archs have bindings file in e.g. soc or arm, but the header
> in respective subsystem
> 
> With exceptions of am654 and pisatchio-usb headers, we don't store clock
> constants in phy.
> 
> Unless someone insists or there is existing qcom convention, then I
> rather prefer to keep it in clock.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
