Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A6B2253FE
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757183621; cv=none; b=T0CHrJc7zkOIuMdW47OAKHMlPljPrBrHZMJoZ0aNz0UkI7UuO05apyveRS8aIQl5xukejqm4Gf50Tt2fgQkazLeyPMwT4L/sekLdiEW9mpFQ1qhwiQCKi23WKWQLfZBdZ4XASpx+06ikKptwJZW3bFgETq3S6XgX1N3BpY3VY6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757183621; c=relaxed/simple;
	bh=UJPgEv6eyXeNjeNUnoZo/GtbwoE0aOaQRjcdGkQu35U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lk//lGD1rTCAtyYCcHOJ1oaCYObdyKF9iVwTF8aEOsEKkbnC9JU1q93IRxfyxMrR/mMu0Io2vcjxKbMoDVtCbxVbDw0ai5DNjUqN6TgICpVJ4tVxW9Qnu9n/YZZb6I5bkholB4aQZt58dfn3MCjjoT0c7aHFoC/UuyfHzgvzr5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kUj43KAJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kUj43KAJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3d44d734cabso2196100f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183616; x=1757788416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2dacLMHesVeGl4p77HhpBS8AGnv2nwxLYHHxCHq1SY=;
        b=kUj43KAJWZkqLUjFGk5EqIVAZ/PLHr9feiaMVBZX6F7f7lIkx7pQP+IezEyr7sWrcC
         m8wIggpv4EmQyvgZXqFxKyN1FFafDObuu/2zmBQrvT3f+AAf20RXFpFwcVpVf9OsUCWT
         D0TKQ4jrb4uvNYn+4IP7RttNv0PBA/497NJUBD6r3MOJhZTSyNCvVCS90Giwk+OZ5o2q
         ry/1kgpzFhNVM1C2fjnZX9/ZMK5Hk620+PZeKrt5488iFRTtpBO822djeqWrVHEx/Nmz
         GoNawzWbvGNGWnnrf1Pzg1R/8gBELye6JwSLeChfWDZZb5rHsWtSBmZucU7HqmMfyRrY
         G9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183616; x=1757788416;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2dacLMHesVeGl4p77HhpBS8AGnv2nwxLYHHxCHq1SY=;
        b=dFBxw2yE0jkwHRzaFTTtHb4CMtDKiWgM2P2lvKyEJBwY+pwuRtWwds/B4Hg38B/zDr
         kMXMFHMh/c9nh603KxSWSl9+T0u+XZ1xW0kVsdJcZzAhwU9cmpuBcfXPONYFaUu39y3Q
         bcX4J+Gnn41hKEtmsrecggjlpDEkycOMOQlwVUfQvv8Sddufbf6/SJtX5vgzsjZq7FO+
         Y2ah8bz5scv8VrE4LSMAFfqla342FBES0I0pOwFnA8fmE99cu+nb4Mcq7RFX1+4zekBw
         jb8d9mvQNNrrOSO7DrW+kyEWQpCnjdCkXuF4onbUWkqHHh5CNaVPOfhKQwMPMkNx8QB/
         0uew==
X-Forwarded-Encrypted: i=1; AJvYcCX2Gvv18xLvqZT90EJOqs2otxelaufscnhYbWtF2lZeLhq/BUFnkOXIeUYR+H8y+yROYAEv0m0Sdz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/LQHlEOrT2Q6s4FwAOYgyTSb9wDbQ5PZ3S7bytx/G2W0Ik3qe
	W1z8kLMl3QCnk9w8E0RyRbdQa1DSCxSfEJ4yXdMUK3Tb6GVLVKaYmt+nxbEuYDvrsA8=
X-Gm-Gg: ASbGncvhloHTJqlmZMf7nvAV2uCYO0/eMCsJ9PaYSVqXOWslap1t6Y+ymezZeZUSeD6
	u6SPFA64zacj/UsudVvpAUvRU0OTJp0VX5DsrKw2pN7MHw2Ghyqk2q3RGRn+PzukvyA0K4U4Ugo
	pcKJ8aDqGoETSlc+F3VtEbWAj681IH8OJUT7Lpqi4QUw9l6KA/UOG/ar3iQIeruA58y/Gl/wKch
	N2/ut2hl1gRL0zPKMnyXSZ4oSwzy4zBSDiL0jCAF46T0ZcZRBBKe+L7RhVeodGONzgQJarxiXpR
	C2Wm9rtezeGOpVF4nW+Y3+wbrb8YNqi5AQXgLBiZdDqttXc3RQ49jlZnZV5CAv97I+zuWcwIPCU
	+HxGW7c7NBO+R7N31PKM/ebrvVAbvG1M=
X-Google-Smtp-Source: AGHT+IGJjXq+GA3SNmlqdifWOdhyu4Jyj/O0xGG3Pw4SHbwmcu2TdRqEXRwOHNVuP3i3mg9xuay+UA==
X-Received: by 2002:a05:6000:4211:b0:3ce:f0a5:d597 with SMTP id ffacd0b85a97d-3e64c1c34aamr1979332f8f.47.1757183616501;
        Sat, 06 Sep 2025 11:33:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e177488999sm9978705f8f.36.2025.09.06.11.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:33:35 -0700 (PDT)
Message-ID: <212df54b-b3b8-454e-8d4b-e79bd9b69349@tuxon.dev>
Date: Sat, 6 Sep 2025 21:33:34 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 01/32] clk: at91: pmc: add macros for clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <f3ef0275345578c504b41710c67bfe1238c44c21.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 7/10/25 23:06, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add helpers to set parent_data objects in platform specific drivers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: enclose complex macro with parentheses.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/pmc.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 4fb29ca111f7..0b721a65b77f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -15,6 +15,12 @@
>   
>   #include <dt-bindings/clock/at91.h>
>   
> +#define AT91_CLK_PD_NAME(n, i) ((struct clk_parent_data){ \
> +	.hw = NULL, .name = (n), .fw_name = (n), .index = (i), \

It's been a while since I worked on this. Looking again at it, having .name
and .fw_name filled with the same data may not be valid all the time.

Moreover, investigating it further I found that we cannot use struct
clk_parent_data::fw_name and struct clk_parent_data::index as the clocks
for these SoCs are registered with CLK_OF_REGISTER() and have no struct
device associated such that dev_or_parent_of_node() (called with
__clk_register()) to return a struct device_node pointer and associated
fw_name code to work properly.

It should have been something like:

#define AT91_CLK_PD_NAME(n) ((struct clk_parent_data){ \
	.hw = NULL, .name = (n), .fw_name = NULL, .index = -1, \
}

> +})
> +
> +#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ .hw = (h) })

Could you please update this one, something like:

#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ \
	.hw = (h), .name = NULL, .fw_name = NULL, .index = -1, \
}

Thank you,
Claudiu



> +
>   extern spinlock_t pmc_pcr_lock;
>   
>   struct pmc_data {

