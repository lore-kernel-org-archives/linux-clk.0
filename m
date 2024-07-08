Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FD1B64C
	for <linux-clk@vger.kernel.org>; Mon,  8 Jul 2024 05:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720415630; cv=none; b=ip30BDY+DcpdBYjuy00MwlqeYyRK1Nsuf+NclqyEB18b7naBRB3Zw9oZmMV0MgiX9DETbx5usPGUYAaOQzqTm0lZl/0oaS3rY4I2bslJNMhdF+3KN2vGOPqljANxt1fQb7z3EZJZ3CMQKHuIbgvWHQWtRTTTWd95axkXSuG0n2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720415630; c=relaxed/simple;
	bh=wRFbwZCq6fW6VzKrR2D+pZJuBoE0qYdTiZYmsY+SkVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+uONnn5Oh5MtJBvvAXaNSOkje1jgsgpbaHAB4FQvNKuoYR02cxP8MHGBQcJuK/kTR3XqdBfz17dutIflissp1b2/m8hG+a4iUHi4z+ahbiJJeEwnfMgOKDEu3EPvFIinhrilgoSKgFYkwO5bTDS6hEQc2T56tNSDMnb5ofRCkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fHl0yuG2; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fHl0yuG2"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee9505cd37so26064371fa.2
        for <linux-clk@vger.kernel.org>; Sun, 07 Jul 2024 22:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720415625; x=1721020425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bz7wWMAmp35kfVIWuAo+lyRhJVw4zZS6mIxOLkavesk=;
        b=fHl0yuG2ZDSE0q3bihnJP3u1s51SrFuMYERyIIzOzxQrrkUyao9hRfzD7dja8QU20P
         tg1HQUaj3Jz/lmpP33MfzBbZZXHp3RVrSBRaXSkGhwO+KhUbT2MeMzQd+5N4iUfBX3r3
         6N0HM2KkUFuq79bnZmCjYqGojiO8i1pN5ipG+Ob+7BUKj6OmvjqwCBRbis1DnwFmjOq1
         Fik9F/0Mc/YMXdQc0ApVXK+cAebcLDf9VLozTlNkbcsrdGguH9ZaWr0wz832+nnMqLXd
         dW4v1McBu+vKMGn9tGZldJSB6kk03XsDtqKkZqMvfbhTGT6suh7Q94yxGh57XVXH/Az7
         6d1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720415625; x=1721020425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bz7wWMAmp35kfVIWuAo+lyRhJVw4zZS6mIxOLkavesk=;
        b=h4RoANnJUHk+CGLFvYNxaTclK1t9WHOwJxHWSmuPI6vdE73EF/v4gKWxg6Ea7g3Sy+
         MeNuDy3ZNiu3zVlmQF5+a7hkSSKGH7qi41ebj3jSnQpg6Xu+mDw4sKPVB0mjKRDIu5kB
         Uo7ouFmRxavWJmr9eqlPLiSDjV0Y5QKrVXH901ywWwPuZORuX4KvMI3DyEnYsFTZ5zIN
         nCjVxGRlCbWqwUv/luQbpE7OXNm9smP/WmmViPodAe8BvtH+GmVZAIIdNMjUcgUd2rkx
         R1rpoOFj6pfDmYIZwj9tJiYpPcs2834TjqmoF9529sov6EeayzMz8cZVf+xM7+urYWE0
         g8ag==
X-Forwarded-Encrypted: i=1; AJvYcCXbjE35xEVvWbLaf+xrP4WIAioSdjVqZ2vtn3p6pZKxsWWfndraBaHxJmbIFy2nh44OYCu8DMWOz8NSPGI9k0MWLmUWxmwpWoL/
X-Gm-Message-State: AOJu0YwkHHUXDGdvjyQEdpPJWC5kRJfZOmRqG5rN5+x35s2xizKinJec
	Zb0VK9+K0OKPdRcoodv3H3bPKEo1tWs1MVemEkDCiRi/5qjS9Q1swPCmwaoC05Q=
X-Google-Smtp-Source: AGHT+IFISF4UwewGpBvBho0EppedjUfcSuAVkq8b8GaHaZZCaF0Hi57425EYZnXMa6pjbT4HHeqobA==
X-Received: by 2002:a2e:9953:0:b0:2ec:7300:d02f with SMTP id 38308e7fff4ca-2ee8edd7b73mr65514061fa.49.1720415625292;
        Sun, 07 Jul 2024 22:13:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a40a6d4bsm8433845f8f.51.2024.07.07.22.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:13:44 -0700 (PDT)
Message-ID: <b487595b-d215-4e7e-8e61-71cd6dbf7db6@tuxon.dev>
Date: Mon, 8 Jul 2024 08:13:42 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] i2c: riic: Use temporary variable for struct
 device
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-3-claudiu.beznea.uj@bp.renesas.com>
 <mzuqdxb2dthfg6xa5jhodj6d54b6zlcnby35hmxe4jvfw3oghm@uunqpeg5wcdd>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <mzuqdxb2dthfg6xa5jhodj6d54b6zlcnby35hmxe4jvfw3oghm@uunqpeg5wcdd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Andi,

On 05.07.2024 01:30, Andi Shyti wrote:
> Hi Claudiu,
> 
> ...
> 
>> Use a temporary variable for the struct device pointers to avoid
>> dereferencing.
> 
> So far just refactoring...
> 
>> While at it, replace riic->adapter.dev argument of
>> dev_err() from riic_init_hw() with the temporary variable (pointing to
>> riic->adapter.dev.parent).
> 
> This is the real change in this patch and you are not explaining
> why you did it.
> 
> ...
> 
>> @@ -303,11 +304,12 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>>  	int ret = 0;
>>  	unsigned long rate;
>>  	int total_ticks, cks, brl, brh;
>> +	struct device *dev = riic->adapter.dev.parent;
>>  
>> -	pm_runtime_get_sync(riic->adapter.dev.parent);
>> +	pm_runtime_get_sync(dev);
>>  
>>  	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
>> -		dev_err(&riic->adapter.dev,
>> +		dev_err(dev,
>>  			"unsupported bus speed (%dHz). %d max\n",
>>  			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
> 
> I personally prefer the reference to the current device, it's
> more traceable. If you think it's not providing enough

OK, I'll keep it as it was initially.

Thank you,
Claudiu Beznea

> information, then you can improve it, but I wouldn't like to lose
> reference to this driver in the log.
> 
> Andi
