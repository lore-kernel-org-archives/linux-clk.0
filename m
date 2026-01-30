Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCC62DF6E3
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769757682; cv=none; b=dPkcjW511kWdURyw7zcQehf47M4ieHgk80A+EXRqfz2bd5Z10P5UhPZaamYYYSrhD8is/Mr4+eSTHuFzLh1xiFHc3+IcUFKjmh4Zi9c0GXUS/jnw0b+jQzP8trbJsbQkhexqml5vot+KVwDvk4W+dL+7u+CUCZqbPOaGeAUUcOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769757682; c=relaxed/simple;
	bh=xFj8ThHr+/S9C2uJnI6H4TW54RjPEhQPo5tewC/1n/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxJ5+7/U6XeEBRfXn6Z+PD7UgSIp27s3fSQnaxj/RbY0wMpalXRvse3rJ5gVaOs0Srj2wTojKCiFXx9ZKc8On0I95R0qvne56S5VN6832kQmS+0pmfjWCfl3ta/tuBqdC8+IwsSoxyrmGQ7hxAETejLg0or+DvlZePI3aGevlJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AOu/eVNk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AOu/eVNk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so20009555e9.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 23:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769757680; x=1770362480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLB8sjSeOChOeJ847YsoxZIIrknXx/zBdsFz+HRbeUE=;
        b=AOu/eVNkHMiKAyn4BquKWkSaOHR3WjHBizYBV4t6VFKM7+8QofAPcDQD0sXWuYx1jX
         cnIS8psc/yKycUr2QjXasfQHURT9wbbepxFlPXAfCLBhQs/vmNCX26WDk7T1SctQxtxS
         Z8Vag7sdMbdSvW6d9UeLG2/5UBzC4f4O6OM4YgwtkD8UNW5UYCZA0pMbR30i6kRM6VSu
         WhjAgOJbJdyWBS7c2MYsBLH9RRfQmoI0Cog8HMJ0F5MlsJO9XAXllw+d6mJFtg3GBS0h
         04xBIyncZeVK2Rsba92c89N9nKJlrQAZZkICNTRU9w/Z64gD3hwtSsP6w3+P/cL1//bw
         PhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757680; x=1770362480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLB8sjSeOChOeJ847YsoxZIIrknXx/zBdsFz+HRbeUE=;
        b=onJmehq2yP8dDF9IUnK8c9RPvTMQOSI20nAMcj/vKRt84PQixHp8X8iLYuvndvAwbs
         VR/4EL2SrTl4oj7QePD19jwQN+OBEw8miN5A0lnFn1KnzgqKXHE8RKvVeOaQE4Etqx+x
         5N6d7K2jwSRFNUpIopQBfZfcGvKC+tSCBk/9X1az8exdhrlksuoXuywXwjT20H/rlXxv
         uNtAw4bzb+gRGOcO9b+MFZKCTVnh5f2YmESVW0MhOQ0XqHwomwxRtlyuqGwyHzFNDpoz
         I1H4PrG/JXag//86lFCc6sFdgojzW3MLv6h2j+k3fzTp9o2QHJ3Rah9s280ndxeGdiZ0
         aP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3B54YrbznwSOUDl+6ws5lweQdaolIlEk/CicVr0QZpfWO7ftX63X9rJLc8yuuQU6H/3dBNn4/RoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywkaNUg+0C7p2Db/jXgYCUd+QNYHCNx98SyKI962D4YUZv5b8g
	+bXh46B5jW0iFUIwSdEW/89ISimGCw28wFjHvGb5Ip3zMC26ZIMYt88334/2sqZfunI=
X-Gm-Gg: AZuq6aISthAt7qYjpXFiVM0nMA8GIb+KK0taNLXDipkXcXjU205CsAOxzFLO2JZptqy
	bZbnMUiblTfHYx7eV5HC5hEFyUjMqiHrHfXWR9HSvZ8LeAx6i7ChPfyesaBWRXgfzOodqBcFHbr
	zFI1PaZcsvJ1AWtAf+SENKYot4qQcBeaPVd7ges1of42awivlHks9FtmGW+fcdnZZo3JuFIVBRA
	xfSU7N1tfScxmAf+b9v/KpR1ikaFz9T0sQ3UKJuqTkH5iLPU9BrJuhSJwm7rALElfKg/h3oCP9m
	t8wvCaqn8ADoI8Ykw2Fm7AslskBpVhXM3yB/iioMz4eTJoVfCQl+Kwiu0WQSMjD06ffs5Oj7tgl
	qinGYjYacgVVuITeb35PWFDta15yPVeqF/afp3rMZzV0SpzRzZt7BHPEHNe+Toot8UWpIGH6bTm
	lDbgm+8SXF2PrsuLuw9w==
X-Received: by 2002:a05:6000:1a8d:b0:435:db9b:5883 with SMTP id ffacd0b85a97d-435f3a820f0mr2452805f8f.2.1769757679666;
        Thu, 29 Jan 2026 23:21:19 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132303fsm20672631f8f.36.2026.01.29.23.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:21:19 -0800 (PST)
Message-ID: <8c6b0e2b-7209-4030-a415-c68fcf8e94c3@tuxon.dev>
Date: Fri, 30 Jan 2026 09:21:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/31] clk: at91: clk-audio-pll: add support for
 parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <7b75764e380508c6c2c11a405bda60a801e2f494.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <7b75764e380508c6c2c11a405bda60a801e2f494.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in audio pll clock drivers.
> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.

Same here as in patch 14/31.

> 
> All the SoC based drivers that rely on clk-audio-pll were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

The rest LGTM. With the patch description adjusted:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

