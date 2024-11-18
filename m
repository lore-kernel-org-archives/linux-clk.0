Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4201991D8
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937570; cv=none; b=bH99DOBjxU6fjTF8Uo3tK7ANp9Fbm4I4wuDpMEKS5lmfBsmJ1kjlXQKca0Sk6+KYp3qowhI99gy6Jf24u+HUGMppXCRESt3itH2luQ4cpNqeiyNp8nDZOxh2i89hKrfkp7pL60jmS4EUe8wzXqZR5Tyf4RGccggM4HUxEsNlUD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937570; c=relaxed/simple;
	bh=b9tRVma+TdXdJ7jfsjJM/qj83OGqnBtnRY9AG1aE0zg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BctyssiWrvdC+Ty0ntY6YBRL6VwPERt4BJRPIMIfJd4fc35aMgjVFWaQ8lmnNThQa+cjxogzQbRkYmABuDO6hnd9+d0zVzDFxRY2ZMFbj9QXGjsP/ExhXksUGlUhBqyd5IGtUSquCh/m6/6e8cf9gTyHeNTBYrFTLv5cK3qBGr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JCJxRf3p; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCJxRf3p"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3824446d2bcso1374222f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 05:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731937567; x=1732542367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lacQL5MLBt9Z1ViGz34neptdPtz7ar9QEPWg44wYwTc=;
        b=JCJxRf3pFVrQoRv0Ez90a8a0JQmDJoSwbdUb+qZhFtu+1OoICmCezevkP18p06WHw2
         vbhvTrZvbcGWPAPRVXD4AM9kdEUjClmi2HH8g751JuMqASUVCOiEXgXViIqF5lMLSeOk
         DpNMaT6fktmAMDerpGmlvCKDNwFAZm6K9Egh1cmDOQC1Ivv2xtFMXtkq569qrNYtvAym
         Rf/fhJYv4TYX77/ywleprMBxcvqtzJoLINkcXToXi3L8Co7hoT2d6+NItDD1S05+gE50
         9+8sIOZEI5qz5ISDhrc5BsAc5aSUiH8KOJGoOaVxM7AgDeyrWHZ3aht59tSYiZTV51pr
         Iy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731937567; x=1732542367;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lacQL5MLBt9Z1ViGz34neptdPtz7ar9QEPWg44wYwTc=;
        b=nYLitzzM13563Yq4Su7uwqvpnHOqJm5iNCsH7L8r4QKsXZN3iHKQu+ouDl0qUSVbZD
         z9ZaaU0F/UWVXFYxQYB0k7+J0Ji8E3fdU/jPPtFgvgsgZP8rxfJ+v9Yb/7SFobgU5EDf
         wo5iL/lNhex5pTXE0jj3OJ2tMkWlzAAnsoSAjC/vz9jEp2O0BU3qh8d3LJVkMtVssUBn
         yygz+CNvc+Aye8TWM+C08TzjzrJQf3G1VbeKpWsGd78PYmBX6SYhFXKUfiuX3xXe2tB7
         96sjUqN3u8a9gIUZuJYDL+/fQFbyxUMvGrIm4iAxpRS9f/60bd9AVEar9MzvUrcGZMT4
         f7Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVoGa7MyWbOhQG1FFNv+HReBwFnxE1nmIAc7EJ2jvoZhUyxniaA7HEVqEh4uLc3UtpUJg0FX4h/qL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpKyut9iO3fQ71cx++DJStl5oJFpIzmjOyCZvu8xk52k/RGLA8
	gjYJel7Hvnri1HYBeJN+dCkyDA6Z+gtAJhQPlH1h1qPH3U+qB8iNRhdeWAqewfY=
X-Google-Smtp-Source: AGHT+IHkVwqUrsTO57CDIVnVyeB9jtrAOxMYr912xJox9XhpNLtz3G90FO7UCuAgsWAbyuFHiTCB0A==
X-Received: by 2002:a05:6000:795:b0:37c:cdbf:2cc0 with SMTP id ffacd0b85a97d-38225ac491amr12126768f8f.53.1731937567318;
        Mon, 18 Nov 2024 05:46:07 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae161d8sm13142570f8f.78.2024.11.18.05.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:46:06 -0800 (PST)
Message-ID: <52eacf06-baa5-42c7-a451-363679728135@linaro.org>
Date: Mon, 18 Nov 2024 13:46:06 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains for
 a clock controller.
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <cl4u42hzdwaj4dt5bponhnadou3uecaodtr7iopfu4vhmvttif@bxxvmwmzu5u2>
 <3ce358b9-6a65-4141-ad3a-bbb826082470@linaro.org>
Content-Language: en-US
In-Reply-To: <3ce358b9-6a65-4141-ad3a-bbb826082470@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2024 13:22, Bryan O'Donoghue wrote:
> On 18/11/2024 13:15, Dmitry Baryshkov wrote:
>>> On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
>>> multiple power-domains which power it. Usually with a single power- 
>>> domain
>>> the core platform code will automatically switch on the singleton
>>> power-domain for you. If you have multiple power-domains for a 
>>> device, in
>>> this case the clock controller, you need to switch those power-domains
>>> on/off yourself.
> 
>> I think the series misses the platform-specific part. 
> 
> I don't think I understand what you mean by that.
> 
> It is hard to
>> understand what kind of power relationship do you need to express. Is it
>> actually the whole CC being powered by several domains? Or are some of
>> those domains used to power up PLLs? Or as parents to some of GDSCs?
> 
> Well for example the TITAN_TOP_GDSC needs both PDs to be switched on.
> 
> We _could_ do this just for the CAMCC on x1e80100 - i.e. make it just 
> for the camcc device but then, the next clock controller that needs more 
> than one PD will have to implement the same fix.

Can some of the PLLs run with one PD or the other ?

Perhaps, but without _both_ PDs on the GDSC will stay stuck @ off for my 
test case on x1e80100 and looking at other places we manage PDs directly 
- drivers/media/platform/venus.c for example its generally just all or 
nothing.

There may be more granularity to extract but, I don't think there's more 
granularity for the first case here. Both PDs are needed or the GDSC 
will remain stuck @ off.

As I see it we can either address

1. At the drivers/clk/qcom/camcc-somesoc.c level
2. At drivers/clk/qcom/[gdsc.c|common.c] level

I think option 2 is more how you'd expect this to work though. Its not 
particularly obvious but ATM with singleton power-domains for the clock 
controllers the singletons just get turned on and left that way.

So managing the PD on/off inside of common.c/gdsc.c means the calling 
clock controller can stay as a simple probe() type driver and also means 
we can reuse the generic common.c/gdsc.c approach.

---
bod
