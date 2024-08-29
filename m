Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800ED1A76D6
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927087; cv=none; b=BEJWyqndEP9ptwK9LmhIHUZ1feN1Zy2kozVwwqdK5KwFoVyzr46/8kG5QJHXeKNkPxYjjTdz6L1ADcTXetH50PEeAPYldclQFA54GI6CHTFLjdw7uVIN8qYZtttHGMhot/nrxwe9egcKM90zm/UqNUm5ZWzHyn10GkfI0DvVtoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927087; c=relaxed/simple;
	bh=85nAiCVJwW62QrE2b6r88lCjF1lPmNgCQtLklbdsK4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIAWBwI1qnI5QrlZS9zVJHqKrOyFNlfZdnCmabn51r8NkYGXOOOLx/J5ganvzxVqy63BUv6EcaHVBhDI5CLESMOGAitKLXcFsb3hanQVtQ1mvP8GVdLBiXEHgo9MFS84kJgaHiJ6vNM88F7v9sNdBRMkqR6N8GiWVTiggrJD1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y8PaUcA5; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y8PaUcA5"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5343e75c642so629297e87.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724927083; x=1725531883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZ/w73AaDcXnHgRTfa/18n3sPpKrgC+SUsJfs6EyD5I=;
        b=Y8PaUcA5moJt9cLegY3MzGmNXt1jn6nP/fptdePOHLYDlWP6mMxUeIx5LnjFiLLdS8
         D88yl3TiB9vksXbY+bWWnffkYyMTWdFrhdGSLCAt0jgrfcH6rFKi8xxX0ToDmWYh89xk
         vEVuH8zsnBDO1I52+38E2Ku8T73NuiBea3fzs4OiFe4WCzL7eOpHshFx2rPnRNLfjXvW
         Q6OdkOjERhVTzj21EyU/BuT0TKL77Ndpa6AVDjx1uq8l87yNiQDkPxmScIxb2EbQDT2N
         QzrAWHEmZnLileDmOAHppoJGLUR3Qq25xsWQYrqUABeBARydWIzyugts+PuZczmzxQL6
         /hAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724927083; x=1725531883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ/w73AaDcXnHgRTfa/18n3sPpKrgC+SUsJfs6EyD5I=;
        b=gU/XAw0RJGRKVeqy47Bs+1XrANjjYt8HdB8aesKd3UVILVzc4kmFSmcSOvTyAxK2C1
         ucONa6wTvwz8xS9toFAqgrjJHkUxTgUcHw/f7QSX7xWXdnIrPHtCnnH7eCXYo1GJDePV
         hWd38sy5n/fcmwyl7FdqvlHdU3M3xrOODRNMSRFgAZZWhnrphoNd4jp1+NelR0hLm5ph
         3AVWd+YhXvmXbDtIHyN5gwLdvG8qHhh48Y52NJI4IYk6exYDtLMd9d9d5Hxqpn6iHs6g
         pEPaCF5LmzzfGteVq1AW+5uon7GcGatwmFDcSEd6YQAjqvth/VOleoVzDje5hCHUMm02
         VxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKxJN9wmGIORr//v7RBQxGbEly88HQHz9A9Yami57Z4WT4TDq99aFNhcQHfRedKBpOxzYwpKtAW8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8VKki7U/4m0fK6huwrOhTQiQpWE6ksosvfhe0lThFt7oxfIP
	WGIua6MS+LAnnuwJJvTNYwplncZEybLK/vUTMlb3+ikFBS7axaQ2mjlxMJVeIdE=
X-Google-Smtp-Source: AGHT+IFvU8hzzwqySK6Z6GUIQ8oD4NTRyF61j/91mZyR2mOx6xG0K5M+rBICRiQtcdWNMlY5YDmVng==
X-Received: by 2002:a05:6512:b0b:b0:533:3fc8:88b1 with SMTP id 2adb3069b0e04-5353e5bf859mr1504710e87.54.1724927082870;
        Thu, 29 Aug 2024 03:24:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540840f44sm117424e87.202.2024.08.29.03.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:24:42 -0700 (PDT)
Date: Thu, 29 Aug 2024 13:24:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, djakov@kernel.org, richardcochran@gmail.com, 
	geert+renesas@glider.be, neil.armstrong@linaro.org, arnd@arndb.de, 
	nfraprado@collabora.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 5/8] clk: qcom: ipq5332: Add couple of more
 interconnects
Message-ID: <kscjtfse3rkdg2sp2uzxiueadf5l66g253vrahfir364yk57lv@jbk4qfbricxx>
References: <20240829082830.56959-1-quic_varada@quicinc.com>
 <20240829082830.56959-6-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829082830.56959-6-quic_varada@quicinc.com>

On Thu, Aug 29, 2024 at 01:58:27PM GMT, Varadarajan Narayanan wrote:
> Update the GCC master/slave list to include couple of
> more interfaces needed by the Network Subsystem Clock
> Controller (NSSCC)
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  drivers/clk/qcom/gcc-ipq5332.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
