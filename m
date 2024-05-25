Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2A2127B70
	for <linux-clk@vger.kernel.org>; Sat, 25 May 2024 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667970; cv=none; b=EOOJvRIPxrWLtZ2vpJoEy9kbuP+8Lw7e6gwRlpcuCmDXIITTKqaj6FiEQbNKcoIVU9XE5aq6jWCWeODynPeYVqsmnKHYj9ErUGFjEOXJ53ay2w8qTx1daSRuNokRFxrPhmctpmC+X61MWUlmcL0Wxn7LosFG1jUfL3o7jj0rlYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667970; c=relaxed/simple;
	bh=eY5NFdEB4BLrmrsCDSSMoBVFvT1TeVGAQqzQJjG9lgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnQYMqBVoUlerIen3kB5serQSDo7lOSc/dhQUMcLRVXztUJ5bJwRlCE6+UVE1JUwWFdzI2QcmwDyqDIaog1Vg9oTWrn9OohAJzKVj19dQt2JoY+lmg4eIxfRqNE5e5zLeRqDa7vSx52tukIQA3qy0xZuuJa8tpMJEuTW9slNCww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOFvn8tR; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOFvn8tR"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso66126291fa.3
        for <linux-clk@vger.kernel.org>; Sat, 25 May 2024 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667965; x=1717272765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6YKAF3uOaRvvdDSRLqD9z7t3ncxonB3HE3QHJTs1EU=;
        b=iOFvn8tR64bqOAW4wLh408BIkhTt9uzBiLrcTFbLo/d97uhLd94dsGZQ8it6r7sos1
         tWkONJ54pSdJtxwS4Ha2xYeLWlGvZwRRz0deUGHuKURCCzXAkFUuKvmQ9UiOOME665yT
         naV0PVRxOwrCxtbEqGbbpJ6X+ZqRtKVOC0yJJHpeqdQWduP/ExMJhoFRvCDmelF1kGcD
         aQeYrEsp3GLeuPRcDKqF6c0XvOdaNbOZIuDnWaAjYTslgGdhiTWEr9/sD+huEvH3UyZz
         rYxDp9za9mgdptSrcAQHFgWTHuQR3tQijxxaoEY7HGXd62NfcpYCb/YEdwvjDNnPQb77
         O0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667965; x=1717272765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6YKAF3uOaRvvdDSRLqD9z7t3ncxonB3HE3QHJTs1EU=;
        b=QMDmWCkyZgKmI5lUwc6WBZ2Ps6K0mIco/u8l47wDrn4G/XJd3nXoE7aGm/Hz1qhyPQ
         YY8j976oMkcmMpKT4mFOQbiTUegmRchjUJOWFZCH9QFa2gWkr7ODiG+XaeOiXxuTghSr
         2RIh9IgqJvKbjVpC2pfPLh10H9ON5z0G57vG0Yh9FqExZfpTGtZHzZZk9P+jZYemGOWX
         LlPxBEH3y4t6sb1RSrP5Umo4+9ToUUXG7Uh3EJmpAAeOOkTCeI7ycIGEzlmtFOEIToPA
         +XCCwtiv/ge/NyO3O67e9uHEFhgTl7JMkV/JXWMdU77J96n2XSw+JMWrZgPLy3TjP/e2
         H08g==
X-Forwarded-Encrypted: i=1; AJvYcCVk5Cx2ccpLgl3Ss0qyU95Y6CIJhtA9Iwl7FPaRUUKrSOFhQHP3uBa8WA2Bg5+9tCeNo482HC2kS9jjLOm5z5SyL3UIU5rveCyL
X-Gm-Message-State: AOJu0YynIEWkJ5A3oBxrVIdGGO39V477KAiK/Y+IAIKS+hnp+ocjOQAj
	ceWWulH4AKHMU9ejUaznFag7Wfp9/iGWbnoE2PWJ3ZjFcRKMDUyPe6SP97L+i+k=
X-Google-Smtp-Source: AGHT+IHJDobPY5xFq5dvnmXXHNOJaX/jRN/ri7kcyQYhHMcDJUmJpMFwZSjdDHIOoZ0wzgcLMXKknQ==
X-Received: by 2002:a2e:bc08:0:b0:2e9:570e:1cf with SMTP id 38308e7fff4ca-2e95b3089d9mr38786341fa.52.1716667965322;
        Sat, 25 May 2024 13:12:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd152dsm8775351fa.81.2024.05.25.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:12:44 -0700 (PDT)
Date: Sat, 25 May 2024 23:12:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 02/10] phy: qcom-qmp-usb: Add sc8180x USB UNIPHY
Message-ID: <ynokoy2fh4fwespzfdgo7mpklmy2n76syfyb73bm4m2hp4cftp@am5nldqvj65z>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-2-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-2-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:03:55AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The SC8180X platform has two UNIPHY blocks, add support for these in the
> QMP driver.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
