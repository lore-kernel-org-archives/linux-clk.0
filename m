Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8D28F514
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788322; cv=none; b=QXXAZdk9w0cO6xNEIx2xUrz7pxwpma+4NkHBjP5RjkNIF56Al26pKL89Y95fzYYiovwv1C9Ygefnlhw/3qTTDadtL8sua5UPczyiLiu8ZDNQlHsx1js1Bmh0wUVw85WpxDV0+pn4Gh4pjogTg+lMOFKJxinlqdD3fu7ukmM1eoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788322; c=relaxed/simple;
	bh=2nk5dPqyhxM88VSx3v0lc2vY03eLZ/CpvYHcyrM+f4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecWq9/wqcERSlibTpWrnZ1R73f1G92cm8vd7U6j46r+63xYXcLUOH/rNSQSjCHnB6RvuC9hYO2fhkt0kGPzWvK2fuAWNL5hPl3jCpApOyqojlmVBDYhJn9DH3onQhN0DYoqVNtQ+2Nd2ZEtuZty3RZNEJm8oZ+We2jPUG9a797g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iEkFmp6o; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iEkFmp6o"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so3805448a12.0
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746788319; x=1747393119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZbHuHRIDWS4UNIfVAz8PWvS0NgpTKjqW2wDiJXiI4s=;
        b=iEkFmp6oA0+kHrIEOYOlqtVmGVUUGsJ5pw0PcoQM6jye4u+XIo54/kXNrONptCF4aw
         TdwGf8KB5hifwloh/N6mzBnqkw3Mpw9e5+BSEiziHZ9m18WE5z/oGRln2g9Fl7ilC03k
         cOlycibYrDERDw+OHLtPFuaugWoRj5cW5tu9bf7hHBzd1Rq7LxKiNDS/7r/jJIDMYMeW
         bFcaF+6cP9CWGVlIU9/v0MYiTJhsa9ZyF1cCvfjel6KfNAdtLPZtVgBUq3jLNuFHg4im
         bTgruLOU0F5zAZqrPj3Mo9A8RSbUfcd5tyGopggQTEf1NAnHAXTRvWbJzlER+ntNgjm8
         PTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788319; x=1747393119;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZbHuHRIDWS4UNIfVAz8PWvS0NgpTKjqW2wDiJXiI4s=;
        b=Hj0d6aB+S9EwE4uYiS+7rqyrGcA4i5ViOO0aOucrKQ5Vq7tbXvyJ91jUPvNRojTcef
         AbBWLn10lO6jwvJWsOcnZSsiJEsdArG23o4ECV8EEW6tJN6JlOwmdQb0X3ZDcfgzQKMe
         Cj7ORg1xQpCZGYx4a3fl6Id1qYlWwi/ISPy7eWnBvzlAeQzv1yPMSKrVgMBe8zfzsE49
         vrltnr2SE7DVzwzmI1iYMoTJEPaPcwrVAdhPjHWgAgAewRN+ccJug6OLlBPcdgvorRDQ
         viBfIorDDk6aK6MLL4Vlj6Ay5YjVwu5h/LM5kp4Y+LQgp9e4pRZ39jJjwTkMaug5m9rH
         o1uA==
X-Forwarded-Encrypted: i=1; AJvYcCV3gFUwtG/D/EIr17T9vTcoEUqzg8UWLgMgxqlX0dj+TKyIPlRBz0IIiwbW+5tCF3P9VQfZnyGVr1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHn6PKVAQWkFlvFoS7Pa3kjI8LEkUwQ8vmbRf2AFPHzcHli/f
	3E+zsjMpNRxb7bnlFNx4krOQBvH32GB3x76RAV6FW0ULDNTokwVL1TYszr+xHkQ=
X-Gm-Gg: ASbGncsk2sUoV2sr25Vk+V8zUW09NjNED8C9nAhz072vNFDgQ8oTObWMaYOR/evM/Tp
	z/D6CE3c+L6pasVK2kKvccfbfDVADjf3pg14NhOONAbh31KYI9Km5RyX9G4fcciGKEHs+1TufLK
	gSrCDMEREuOuki4d/2S2BElTHKEITBD2i4Od3t+0g8TJw/QdgaHZ49wq7bzv28O+ewDCR+ssWWP
	8szVP3nDRdxhSC/k5razLeDQNyVjSOsTyEYjgFnPgePvLWyDOzwLIWcMI0LS+E0MTybOX+CmuUP
	/ijuigTbbA6jkm4CgnWAciS3j6XPkc8UaADhH9SLaV/JYzbC
X-Google-Smtp-Source: AGHT+IE8zKJ0SlPd06ZZ9+XoxKnWzap/lSuxcblf1RpgkOVSS1IxrVf5VthK9xYufsLEWTuocUBDwA==
X-Received: by 2002:a17:907:8992:b0:ad2:16ce:7c3b with SMTP id a640c23a62f3a-ad218f54cc4mr280469866b.22.1746788319022;
        Fri, 09 May 2025 03:58:39 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746ca6sm132664766b.99.2025.05.09.03.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 03:58:38 -0700 (PDT)
Message-ID: <8a14cf38-9a7b-462b-80d1-ec5026b5a565@tuxon.dev>
Date: Fri, 9 May 2025 13:58:37 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdU00apiWYCPiwqGr66Ucg9KgWMhhm8FW_KBoeN2ceos+w@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdU00apiWYCPiwqGr66Ucg9KgWMhhm8FW_KBoeN2ceos+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 07.05.2025 18:47, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
>> module has one or more MSTOP bits associated with it, and these bits need
>> to be configured along with the module clocks. Setting the MSTOP bits
>> switches the module between normal and standby states.
>>
>> Previously, MSTOP support was abstracted through power domains
>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>>
>> Previous Order:
>> A/ Switching to Normal State (e.g., during probe):
>> 1/ Clear module MSTOP bits
>> 2/ Set module CLKON bits
>>
>> B/ Switching to Standby State (e.g., during remove):
>> 1/ Clear CLKON bits
>> 2/ Set MSTOP bits
>>
>> However, in some cases (when the clock is disabled through devres), the
>> order may have been (due to the issue described in link section):
>>
>> 1/ Set MSTOP bits
>> 2/ Clear CLKON bits
>>
>> Recently, the hardware team has suggested that the correct order to set
>> the MSTOP and CLKON bits is:
>>
>> Updated Order:
>> A/ Switching to Normal State (e.g., during probe):
>> 1/ Set CLKON bits
>> 2/ Clear MSTOP bits
> 
> What is the recommended order in case multiple clocks map to
> the same module? Clear the MSTOP bit(s) after enabling the first clock,
> or clear the MSTOP bit(s) after enabling all clocks?

I can't find anything about this in the HW manual.

> I believe the code implements the former?

The proposed implementation clears the MSTOP after enabling the first clock
taking into account that there might be cases where 2 clocks sharing the
same MSTOP may not be both enabled for a particular functionality.

Thank you for your review,
Claudiu
