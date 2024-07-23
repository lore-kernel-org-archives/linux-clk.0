Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547C31509BD
	for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734819; cv=none; b=CW+P0qpq6C7OyWllBtFf0Zs3kBPJ3coEC9ZCsxnxtSu0/q/QXkkdsjNowbk3qvMggG0PKhFKNJT2JKCBkMm1iIdQY+yB+CVl3sJhgr0vFWTGV5/cg7Sf2x1oGN/wTSWPOCtlnOQSqmD5Rbo24tyZDhRRCfP2/RbOIeMYWOOvjqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734819; c=relaxed/simple;
	bh=miKYHhAMQjbYVZWFx6SGlpmuAdTAltRIq0QTKS+3kKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AaoW8zRYx6P5UjjVGNBKcDzfIPv74XskGf4Hw/IJsQXxvtK4sz4a1ADKfhakVxf6WRHptXaEDme/R1VJnTYgODpFnN8y+wdJzv0/Cr9TgAwYVf13eNVKwa+CSSvsTHiISaliQRxou7Mracen6djwqO/zTn+vzQ3NUIA0E5vwxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6qzX0vG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6qzX0vG"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso24812291fa.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 04:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734815; x=1722339615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2gm6usH2cYtHuVw5zQWMSdzPAywa155jTXvnc/dJf0c=;
        b=V6qzX0vGJpv5t+EkELTIH67puz22Zp3up5R4Ol5dYBTU7T1kXE/vmEKzriXqmUjgkM
         LoZzHGZ+6n7jvLRLs43gMIocspCKGCYnEJcNv5Bjn3FLw6UbPbtn/khGFHSXATKa15YS
         k6pvUY/ziddjIO4o/4rbdHkFYmFIEtFfNs5lVvMn+Jo8Dq7Nyi4FE4bWTarGWVph4pHF
         0tNVaRLu2iQnibWWPvLk2WHeU5CLTaslWxBYAJfP9rN3SZZNQ5G2BHOIbmGVupbQLiAh
         QaKbGreiNv3rBbVvQ9XM8CmpB9URl6VwEuLfMuiiXA3LWKUz1UdABoWxYXiVNqU/R03r
         hJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734815; x=1722339615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gm6usH2cYtHuVw5zQWMSdzPAywa155jTXvnc/dJf0c=;
        b=M4WeEgIj7Rni8aEcBznnfA8w2ga9uF/3tTFHJX83iayKXS41JzNMUg2Dbx9e0xEcso
         f/w0bAp7DjfrL4xWQ08gFKMWRkjcIDf15+LcyXCKJ0c5trPsxLI2eBY14rl+KUBeOzQh
         xoV0wUCMXts4iVEUWaJqidD7vkWu84ShjajSH711bhLzmTDHtS4zC5wqyHR4dVbIxEFq
         BDT4ptwWnyOLCE3PP0V38s6N8cXRHkyOkL7J3h3yHonDMbyUdFqdUjy80dOzl6vYN5cI
         HRDQDrkLwxMWCr+sGD/Bvw+cQKWR/7OTbZvM7Fcyeu2othbbw0TqxL2LIZzwqCOzTRWK
         FvjA==
X-Forwarded-Encrypted: i=1; AJvYcCVjRHMMWxn1Dc0enGTq2PNbi9wLnQo11Ul/VuGBCpz66GclklSkaqG+TVLDUuI2ET5rw43+ydbkMLLUs5jQdfZlz/AxJ5goLfAN
X-Gm-Message-State: AOJu0YzQ3PWMdpvv7hpBXZb/1VjHbjCy8oWRwaQRFAgZXAAFOGeH46M+
	Pm+txhM8NvmIvlTvqpJiKfFvO1j+igKzJ/Kl1oAlX+se6n3M6kKUkoPo8yArRx7MewPrdXBj2ZV
	C
X-Google-Smtp-Source: AGHT+IHT+hdOPzfYwxhYRi+/ggHwAHggwRmVCnpiVqL9zXnxZA6le2MSDka0R2B3RHU/WT8uSRZd4Q==
X-Received: by 2002:a05:6512:3408:b0:52c:d56f:b2cc with SMTP id 2adb3069b0e04-52ef8db626amr6725987e87.58.1721734804383;
        Tue, 23 Jul 2024 04:40:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef5581aefsm1553236e87.309.2024.07.23.04.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:40:04 -0700 (PDT)
Date: Tue, 23 Jul 2024 14:40:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, konrad.dybcio@linaro.org, djakov@kernel.org, 
	quic_wcheng@quicinc.com, quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 3/5] clk: qcom: ipq5332: Register
 gcc_qdss_tsctr_clk_src
Message-ID: <vbu5a2z2e3kudfuegidmvhy43tjzcvxjgeuci5gmuwmumqvito@5qbdcpdtduid>
References: <20240723090304.336428-1-quic_varada@quicinc.com>
 <20240723090304.336428-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723090304.336428-4-quic_varada@quicinc.com>

On Tue, Jul 23, 2024 at 02:33:02PM GMT, Varadarajan Narayanan wrote:
> gcc_qdss_tsctr_clk_src (enabled in the boot loaders and dependent
> on gpll4_main) was not registered as one of the ipq5332 clocks.
> Hence clk_disable_unused() disabled 'gpll4_main' assuming there
> were no consumers for 'gpll4_main' resulting in system freeze or
> reboots.
> 
> Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
