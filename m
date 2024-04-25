Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EDB12AADD
	for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714045825; cv=none; b=Sj0GanETKOh0y7QLg1AxQk19o0NeL1WGQq0OggmcmzUnPt3AygUdr8ulNG4v3wjTBpotNKMZganIIz/PLMvUSnLjaHwYko7/wRMOehwevqJcH6y4SwTQvIoBRyjiMip8c1VAuJscMEGRLcgF4j9c9VhAl06q6PsLlElYA3yYQ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714045825; c=relaxed/simple;
	bh=6X90SrMENmPj2F8E+j2MRnzGgHoMOcwnFY9jZAuri3U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XZiXdkNAg5ea4seq5iSSYS0AB1MXec7S0pgcwFiBsF/Ze5zLNPyJMmtYG0xcWuhHsgdur0AGoC/gS2Rqwj7Qk8uw+4dux5+Yf/3dG8SwigulFDtyXZMTJHDlkOq/dY3c96dQc5/A0ris91UZvAGrNouPUzFMDeOEYwHi7fFl8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kyi2H011; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kyi2H011"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41a1d2a7b81so11193285e9.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 04:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714045822; x=1714650622; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6X90SrMENmPj2F8E+j2MRnzGgHoMOcwnFY9jZAuri3U=;
        b=Kyi2H0117xIsE8cvv7in4YmWqDUx33JTPlWpOsXzJ7clB2o8iFYfwTBa64+ZJKmIS6
         kAYT1YvUKsWbZT7K9k48W8dDGAFDDC7Dm8aWJek+6nmIVLwfrH32pkTNSEnKHHBgb/Xm
         LBFpet4OqALHQefnHOd1hCx0XLSxnJXC0WsDhy9W8Y+ByveTjcwgnf6WbDrm/Ecqszf1
         lBo9dCOSr+/X4WxieS/r+RG0cls+B7e7yGU1h83p3tMgGtR51zA4JH1GK/9OaIoTqALY
         Mzr85czlf/JGYe1HAtgnVrZMl4Nm0HDxpR1o5+5Xbw7OvMpt6EkWv6yfm9+Ys1T47UbR
         IGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714045822; x=1714650622;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6X90SrMENmPj2F8E+j2MRnzGgHoMOcwnFY9jZAuri3U=;
        b=ON7YrZEsiwNu7Ue1KfCm3V7Tv13CRq9LSTgjRhl4+7PJeAJ/ZeBzVZ9HNt8DTc4/qq
         R4D0NLxvzhMw0Msnt7G1adnUCl7hrdglv3OLYyx9EWKJjO8At5/GisAKQZ9QRSraf2Q1
         cz29IUujK3rTk0J4MGV5OFRCrP9e0Y3Jk70odTaARNp0XtowtUxbqsdDAIfknNRJTYLx
         Zx5udJFzyvzH7JQIWSs8F6mrObrvWhK8n816jClmqxbqS6mdXz0mwjLcwYfyZWQE2VGz
         3bSB9hdLRpOwzvWGvWZLg6P1nLP6W9u2ikD7hZc0rjS7N7vV9ON3UCFeNnHFOsHkI9mr
         NkIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8yOnW0gt6uTzCiHorWOHY2psAHfjnFWPgRbA8tSGuMaJQfTmgCKm1qIDS/O2zKihWPcK7BqzpCompinoFDaTYc9XOXAbDfmSn
X-Gm-Message-State: AOJu0YyGvrQjlUcaWsyUoSb+7zFODLuwn1rW/YDkbMiKfqpmK8dxsuyP
	unnGvaaripyN4UU0HYPutAtkhp+P2Xn/3ofBrdivP2Ew1YeWOm5770fcOao6OtE=
X-Google-Smtp-Source: AGHT+IFd3IUrl2RhAWqNwz+jhkozMToyJuHkmRsv7L8RtAZdqq/rmyIrab8etOh0MMSjsigMRTo70g==
X-Received: by 2002:a05:6000:789:b0:349:bb17:6e60 with SMTP id bu9-20020a056000078900b00349bb176e60mr2805121wrb.2.1714045822352;
        Thu, 25 Apr 2024 04:50:22 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id he5-20020a05600c540500b00418e3c5bc8esm26152587wmb.18.2024.04.25.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 04:50:22 -0700 (PDT)
Message-ID: <db857c14d2463f643dc602012329b75df8146c0b.camel@linaro.org>
Subject: Re: [PATCH v2 05/14] arm64: dts: exynos: gs101: Add the hsi2 sysreg
 node
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com, 
 James.Bottomley@HansenPartnership.com, ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Thu, 25 Apr 2024 12:50:20 +0100
In-Reply-To: <20240423205006.1785138-6-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
	 <20240423205006.1785138-6-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-04-23 at 21:49 +0100, Peter Griffin wrote:
> This has some configuration bits such as sharability that
> are required by UFS.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
