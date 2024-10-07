Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8A61DC758
	for <linux-clk@vger.kernel.org>; Mon,  7 Oct 2024 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728322006; cv=none; b=H4hjOHeKJCf1F6cyKfmqMCjV1S3UIrozF6usEg53/O8fb8nvj6eVNDb9OS4UkK9Ub+8gAShKFJPzExxwczTc1f6xArlEWakP6iqIkOz3V9KNMhLorKSGsHQB6nX7tAx3x4uX+f6WBCtpgs84WsC5wUM75OVUkpDlw41UIC8Sgiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728322006; c=relaxed/simple;
	bh=f8J/xaTUSlbns5xMC+QDIDb/0E6cU5zNaymgX/wflrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqzeQeZZe8KBxJehihcNjlhkORByfJpnX+ajVWyxorKX37sYjJYi3sZIkH0hpoAKjxpxu842VDqtJU4cs+fjcgjoVidR2YwrwjBdZi95D0+V4wF9Ws8bw0YWYj+n3ZtFDfOGP/u8Duqwv7MUHd8JxhYBqSRX5dXbGign6Iazyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBEiJ0OC; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBEiJ0OC"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fac47f0b1aso55939931fa.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Oct 2024 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728322003; x=1728926803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaLyid4v6v3RyKRHRBjHKUsBfRZPQ6szoceuABDIEJE=;
        b=EBEiJ0OCgKyMHuBk8fLBm8PZxOVD0QKMM77zc3Hwo4bLZvDJ4qDctkUnZgtTvIHeyw
         aNZqU2vycAD9EAdQ/hc1o45VIaJItMOCLW8fkhLgy9EyiOGmY0NmyHpUCPomoeCc+f7E
         TedDa443U+jasCf63gLU9bZ4d6gLsx1qS340apZXmmeown6WdKnJzri+8tpSYJz8MXgP
         pQ0K0Po5dfStt9NiQV6pOKma6siN3QT6BUL23olnqngmJcpTcWu+JAYWpkOF/lPKinw5
         OiPEfHEUVizclSMWgm8QnQUW33tH6NGjNUSoJ0Kzrk2QbmoEQnl0VldaQILrweAyuHUB
         uPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728322003; x=1728926803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaLyid4v6v3RyKRHRBjHKUsBfRZPQ6szoceuABDIEJE=;
        b=iXp+onNWBr7JdU5RtJ3W9LLPjkK152gSGRXAIdYSqFBs7KcWouTX+aWukwTQQwITp9
         okVzSUT1soPGARcbuHB3ND+wuN7FOgM8ihoecswGZbNRWEc0YuKhYMuvmGQ1SfCIN1IN
         fniK2T7Ed362avflD4M46NqA1PtVdcjQS3DRIiWSG6sw+YyCBxMrLBH66ACEeLpXG5VC
         N0lOQOvPdXk7RSyuo9LTu4OoNWBAiRMRsXm2AOjDIl1O6+/9yJ5w6DafRYVBNE38Kxyg
         6yddmsqfKbe5g/dlimv83FurX5OmUUP+P1YG2RtPP7AZeyWa5ak+2+1TPk3Y/OYm3RxM
         6eZw==
X-Forwarded-Encrypted: i=1; AJvYcCWrk6S3cBtwB6JHbZSfo+bXWDde34SFLEHbInIXIikK4TS7sRjlFBkFJuFHkg+5fSgmr2QzFAQoqn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw62U8HzWz8aLEwdghUWOWAo5HlBy60Y2aUTXBDrWfHX46psYsb
	vbNN8e7W0RCgKUgJgpCyCLUNgdkr2mXW/cyOywTtMNKnlDtJvNmSG0VdWfFWR9k=
X-Google-Smtp-Source: AGHT+IGjPpE8nKiCzJOR5Dnc2BUe3ootx/puEHX0zXwHC7dqHj9NiHU4iWABJ8pLEYm3+gLDnTIG1w==
X-Received: by 2002:a05:6512:3050:b0:52c:cc2e:1c45 with SMTP id 2adb3069b0e04-539ab858895mr5903268e87.15.1728322002731;
        Mon, 07 Oct 2024 10:26:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff283b1sm892951e87.280.2024.10.07.10.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 10:26:41 -0700 (PDT)
Date: Mon, 7 Oct 2024 20:26:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include
 dts from arm64
Message-ID: <wpyw77zolcojvqonwhwsgkyw5xshipdmuk7sr4rn5accx5urzg@6tno6i6iuztw>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <20241007163414.32458-6-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163414.32458-6-exxxxkc@getgoogleoff.me>

On Tue, Oct 08, 2024 at 12:34:14AM GMT, Karl Chan wrote:
> The original firmware of EA9350V3 from Linksys can only boot ARM32 kernels
> and there are seems to be no way to boot ARM64 kernels on EA9350.
> It is possible to use this device tree by compiling an ARM32 kernel
> for getting the kernel to boot on EA9350 V3 firmware however.
> 
> Building the Linksys EA9350 V3 device trees from the arm64 tree together
> with the ARM32 include to allow booting this device on ARM32.
> 
> The approach to include device tree files from other architectures is
> inspired from e.g. the Raspberry Pi (bcm2711-rpi-4-b.dts) where this is
> used to build the device tree for both ARM32 and ARM64.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---
>  arch/arm/boot/dts/qcom/Makefile                         | 1 +
>  arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
