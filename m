Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832EB15B0EC
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 16:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769875261; cv=none; b=fI5zNpWhh7TjHkp8u2nGHMRiIBSgohuTPVbHFCSZ5BYmT/HTzxBQe/1AQwFbYsBW7eSEQRp1pmAJPxb6SCtgxzBvNLdUmJUckpvVPyx4bc64LOXTERbohFdFQrSGfW6szn7rDhpeWo10/eauF8qI8qTCDo67kt2Tb7dh8t3IHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769875261; c=relaxed/simple;
	bh=yejpOMXPzkPs1BTMWVwwoFRdN1K7aZPHm5sr49+HsXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lI6ikivTdmB4HJYr4U+cTFLkOBNlZ+S8vRgalJwI8e7oMrhjQqHyPnS+/gXkIbaMCR91XPvE6k+aG5GSgr4iWISSH3PJBt4iQShgZ9mfzChIlfhaCrkJ/N3FjSZjAafUZs3j5cFN3uMkRtqTeusoejzdkZ1apoQOcxRaTf4aAU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ovZxhndc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ovZxhndc"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b885d8f4092so537493366b.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769875258; x=1770480058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJLogjaQIREWDYxPFSLJELLqjbCy21hgcIev5TDCa9s=;
        b=ovZxhndcN0ayhxIif4/KUa8P2F95O9ZGJ09txMKVJ4wWnIUfzXDyxKsa+69VpHTokC
         S8j3b1TnNjCNcH+4q6rXMtHrUp4KO4xWOA5xyzv9+fkZIJyXkYl5HNir6CO9JRUqlwDR
         V0eRHRL0uk0hMODh5+dIpysOlw84RJshLxVGKmBzZnxryI2pUF+cAZsMj0cz98otbm0F
         aFD1+f2sY5Uf9TWoYpHlmPLWqCJ+T24z7CzxAPPydA6ITIx8FHxPnElJYWnQ8UlnCaD5
         lJQ9Gw6k023beQcg6K1Gonk6ZMjA1qAWrFb9LdEAafSKqgnCRIePd5vXQCD0arzBuXBh
         4gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769875258; x=1770480058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJLogjaQIREWDYxPFSLJELLqjbCy21hgcIev5TDCa9s=;
        b=ijZqi9rFmomEExLj4N6FR55Y7EhWMn2Le49OkSm7iBz0sYMN65R25hiOO/+nNUssmm
         5iC8oNuXmYvxgFuNuhBeEykryknCH8c1GnltceacgiyIz2KLj8AaRyzak3xQxmcaQ4zc
         oPbYGfizZCZ1rBFU8t5RtCNzifhHog7nSdJVTlV0MHq18a9cSCd5dGCURa01Bpi3/MGx
         262Kyvgi3LThrPLcUtLsHRgPj6Fmp0VqrWykzu5tAaOAIyU6bwlPjzaOGdGUrRAuDyiW
         F3DMM/3CT1MvOv/r6InS1FKgYrFPezZcPpxPY9NiWudLLkHJc7PBYdyBrotGY+Uk46je
         j7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVauyzJPo1DtsRtpl/Avjd3QZGoZ1pyU/wSuilSPnyme1GHBYqIshNGKSNr+ynGn+MtjAtFyIDIgfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhdO2bYjUsny0zuADAxrkVBg/KbrIvdEpoD5CU4/DhuVONhdR
	Aj3vUz+1WeiCWOKBFyKWeogVJbL7yNwz6lGy84p3oihgTm3IKjsWnCAlVUXVC+JtMh0=
X-Gm-Gg: AZuq6aId1BlLGVwfUD0VtDKl8gEG+L7lgVtyquDJk3dRjObJopV44vF0fTH3G+DIPuj
	YwwOQFRV0URtJ3dxdliF26yH0d4WM99Zzw3CByEJGplt+jWx7ZSWrkZ5ozZ4XfMpKb74qC868kH
	Uk9yxl2WsYpG/uZX4L7VvFlv9CkxZbbDmTHUllbndmnDg9gCoQWHp2mtvxSwsH9ibBc7Lh0DFSq
	mZHg4fEEJLEFdcFCDZeRUu8VFsHLcS/HbsJ7IqUViSG5UrK2ZKey3xOWTUTBKAr2tkxuDJ3Jbbn
	D5R3XUwt/SCVNE1H7r6+XdYEnBYupVJ51gy8SOTUmXWJcrEKiefZtwaVN3RVRKymtA1GlGIBd9x
	TkKtMiW/lohjpglvNqr/fHiM7CgTjmAz1/TM+rwhEBGPEOSxbBnlSLD72Z/WXRoTKr/szA5nNh4
	sn/hKWWZqYHElNe2tmi539xkI65woQ
X-Received: by 2002:a17:907:96a5:b0:b88:5bd7:63b0 with SMTP id a640c23a62f3a-b8dff5af70amr373554666b.11.1769875257922;
        Sat, 31 Jan 2026 08:00:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183f2bsm587629966b.32.2026.01.31.08.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 08:00:57 -0800 (PST)
Message-ID: <a7d42750-276a-4348-802e-30cfa4ad3a81@tuxon.dev>
Date: Sat, 31 Jan 2026 18:00:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/19] nvmem: microchip-otpc: Fix swapped 'sleep' and
 'timeout' parameters
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 stable@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-5-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120154502.1280938-5-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 17:44, Alexander Dahl wrote:
> Makes no sense to have a timeout shorter than the sleep time, it would
> run into timeout right after the first sleep already.
> While at it, use a more specific macro instead of the generic one, which
> does exactly the same, but needs less parameters.
> 
> Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
> Cc:stable@vger.kernel.org
> Signed-off-by: Alexander Dahl<ada@thorsis.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
