Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AC12D2491
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769757503; cv=none; b=Cx7FvJQNiKl+C0oGtCu68/0RgsT/K1A7QZE+FuaUpjJmq5XeEae+K4i3MYZlb+6BM/z4mMa/+6WzshNTYhNXBrUrbTJxcTlGmOgiCIaOGBT/LYGFEuPlcvLoW5cyqCwPQa9MRWMxfgEPdUJTJ+HpdRLseWJIuXlmmg4V7p1S6g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769757503; c=relaxed/simple;
	bh=syzUWbn6SzahDC0HW4fIVoN/5tzrTHP9OvalWI0p7Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=byK9gefoLQRI0GboMbhgoR9cPLsIMDXlLJL204bLom+w3JkPdkkTb6xbS/cQ5Y6Ev0yFgO+nfraeZkkTTPR+TjWlylvqYdPkdd9a4DtC4+oGmIf4jCz6RVej++Q7ro0eA42dfXx0o4UHL8ShVKyUkWYZTVTPiOgVPyNwDEg2554=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=V+YrKMq6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="V+YrKMq6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so1643755f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 23:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769757501; x=1770362301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpxkN9CzPqlfY/w02rIxvFlrDNaXNReJDm117rqc8w4=;
        b=V+YrKMq69JXfuUb3ectcIxNRPkTiYETPNroTwyLy3JqfhagwNAlmuB8XFHve/cSehO
         VtS9j2zjbhwC7VUnhpSzIigey3STDcQsPVk5WBr1lougVXmKKSwdQ0ya6Nwb9ESgMZhX
         wA998P7wSLSg2Hb2ojANIimQH/zhNYDPIHZ7lTdTFA9UE+Vmi8rIkzMTySOhYjYjoGL3
         EjvSQcDmmAZ8xxrNCZrx5zC4LmyPy0QFDPYaNFCmQEpLRxeYQK11HuKYJHpYUCKh8mi5
         0VVLP0c/DMbQmQAYCfJWVm1HMTC22M08lP2LL5eeVFD7v4z5gv+TWS0F00RI+a4C6wTC
         Jb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757501; x=1770362301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpxkN9CzPqlfY/w02rIxvFlrDNaXNReJDm117rqc8w4=;
        b=kIpV2QQzwdA6Sr45Bmy6hS3zVnVFNYPIjHAuDu2yIlLX6rbm9IPC3FLmbnEhzkSxwO
         cMU/DktzuwxEgjgBDBpLCJyYHFJx/fLt/weOuotJS2UeXIsZ9LzDlvbc5ykUEkmcAwi5
         xqBfRz4zWPxPASOhqxOyxA0dENLxogFRVy3uQ5/N0/ffQEUG/fpKJt9LoB36x3D92BXk
         urOM0NSVzVTFlLGYbM+yhjOPs9yb4QWnJBMPx9P5NtJSKwnX6eYJq/Wf3SwNq+WIpEoc
         1vSH+CbV9Dn+QrL0A6aHyrRFRspPnJ7HioeQ/vUjivGOh4vAO3LN2ufFSJ8CZtQeJv1T
         iXkg==
X-Forwarded-Encrypted: i=1; AJvYcCXLnM1GCjmgF3zcyjnoew1WtheoeiK7GMgknnREkw/4hsXu9gw60sXQTEgaWDSrudCD6ldoc74i3Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCLnLghII/pRvRHzTlGvAlm7oI4IZ9lI35hL3ixbE0kcg8Z9E
	Phl69npZG7Imya+ki9J2NNYxi4qnwO3BIyzWjdk4ARgSKvE34w6/GRiWep8X3LnSi84=
X-Gm-Gg: AZuq6aJVfUn4kHUkHlZzDtecf1J3cjw9nzt9UuUAj9aAUnLO4FSqqqPLgOHJ4iGIqhh
	A4qJCWlD2KZkiuk+m/gOQLhHVvxOtOMYdvR/Xbck1Bn7iGl2b3eY3jF58u7h0DDW+Mmjb9kCwC2
	LlGhKVerjN+sMT1vtsFd41o/1Etolhlaz/pD/MawFzpgke3I1H8E806Fwt6U2FcWolGfEBxhBj7
	kwwza2/jYQGwFKUEaot4LkRBeBMO3EKIBJUooAmNTns39K28qwWM2QpDhbHm10no4N549DW8Zg0
	WK4aKZGtlZzF2HPozfTxiGB08ua1Ojn4Z7hvNq5CUah0I7OmtrunyiH1jicO7t1J9y0TNEJHEmr
	9mdiaJDfk9wlDojEuVSnygh5Xo+5cU4OJlnXZLHJIaoHqqOa7KLqo354Hu/J/o2fUE2U44MNDNt
	ZaUhKzb27a1jCguID5IQ==
X-Received: by 2002:a05:6000:2910:b0:431:864:d48f with SMTP id ffacd0b85a97d-435f3a8689cmr2938639f8f.27.1769757500929;
        Thu, 29 Jan 2026 23:18:20 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee040sm19847702f8f.11.2026.01.29.23.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 23:18:20 -0800 (PST)
Message-ID: <8d3a2c5e-b31d-4346-ac47-12f9aa1b49aa@tuxon.dev>
Date: Fri, 30 Jan 2026 09:18:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/31] clk: at91: clk-pll: add support for parent_hw
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <7b6cc0e89a31b5f0196c0770dc692edf550e01d2.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <7b6cc0e89a31b5f0196c0770dc692edf550e01d2.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in pll clock driver. 

Isn't it parent_data?

> With this parent-child
> relation is described with pointers rather than strings making
> registration a bit faster.

Please update this along with s/parent_hw/parent_data above.

> 
> All the SoC based drivers that rely on clk-pll were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

The rest LGTM. With the description adjusted:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
