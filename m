Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA42745E
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769857224; cv=none; b=rIMIqmoeXhoaScfNVQDvk8vR9R6WhmlPAwlhJEGh+85g5BDG1BFG8aJ95MNs4seJh3rE0pUZB8ig4a992I3Te/X/x0LUr6e16rPvC1ZT9gs775Sur2ir2zYIuOayvUNJbEQV7cEnjS5gWeVJVcJKp5IW8L9t1xIwh0TM5qPsTPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769857224; c=relaxed/simple;
	bh=HsmTOw1HTTlF9t8MWSCV8EwGr75S4dtpGB8To6izMWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tuoj5X87Gccc6XT686No+gGbrLpIPK8L0P/rWUGj+5Rn6MhbGRkM9FvAr/l0v6BgZBghsPbfznxUkSIy0uiban7Pl4BFr5Ql2nAr6qc7mSXozblwj5DCPjtc/1TCAgNFlgIjCAB6i42gDVzH9WkPWMfomzE5uhvjMh+jnZO9jQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c/nHoFVn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c/nHoFVn"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4327555464cso2136568f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 03:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857222; x=1770462022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQDkAIIhKgRDDvuz1aH4KGKZtIlloZoqb9YIYg64nMw=;
        b=c/nHoFVndqblOJ0FqvvoZdfcGOMcTM1M7d2L7RsHs3oKy6WTnzzfmGXKff8FIFGU+L
         cuO/YBv2wmQhOhvP/KdbNjC40GPFt+/mSd8QDTNKkajfvu2RkEBXMxVgK2FE2tERoAbI
         l4ocz7bdf/l2vf52xEHHmHRMV+ymtF4UfSEiRFElzrk1UzbhWkn8CdvD4Hf1s/bTSOCh
         yqRMz1pmdp+qMxukUfIlHSItlGnMnLH7J1oI6EdbMhTB9vdIpk4pfp5hKVEGUVOdZnVw
         rLxulIQzwpNgqAcjpWdtptjAWSKJ/80URjWu0uph7pNH+Rvyf39mwYD8SaN2pbQPyrWT
         xwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857222; x=1770462022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQDkAIIhKgRDDvuz1aH4KGKZtIlloZoqb9YIYg64nMw=;
        b=OOhXS2wp1V9Ho5NkevsSuPOJB1Ta1npfCICePC8xB1u8sZHlOxnCwiVGO2ERiLhvNd
         MyRA+wQaFkT8dlXFuhplwEtRThpdav4aieQE0dDZbLc9lIjmXFb19w+wDOhrmDiaGS5X
         rq8f9t3e0ab7O9OpWdntNT1BHnfDyKHWhhVhmXeZ6iVM025FW+xanu9uoqo8Nd07H5Km
         xs3foM4LNOCpAsJw1pWePcBcmAC2GIMPYtAVAXaohnJQLwod9Pvge3XeMn0XtlDzQu+p
         yCmOfqKAHbsg4Bp/gO0rOw6EhaEqMQSd+d7cnqlDT7dDctHceERNFm6Yd1jH8qnOKODI
         Ldfw==
X-Forwarded-Encrypted: i=1; AJvYcCWg/HHbfpSvryI7/n8OqSKU9TUrlwM4RH3uwAZFrxdEy/B+LfF1nG3qAnp6ffUy30VjgcVxehtbadg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL1bapWuS6f2bF+aymqtTfFUZcYzN9LufymsCQ26+J0iZW3KLR
	D/SOH8bYfemyaOI5x0D8vQtANbrAwmIdnlluOMf9mitxhjsD7NVzzjjVD+g/8r/B48Y=
X-Gm-Gg: AZuq6aKPdVa2Y4TxhVvsbkIgn60N86TvYn8Z6xGaPcfeBphz7cJF6NnY4CJZNBg5XQp
	DwjtS+r9vJjn6un8Q9PkNpI8itOFoucdQCS/GcnBHa+NMP75A9Qvgdb2adCRV+dezjy+GW9E0Rd
	JtJyvYMiQ8vHkN8n7FRw20vwL/KZZv29D3IF3TXrxoGeUiEScZz9PzoL8mys/2nyamcBKbcOQ7R
	l7kNuWk2rtb9MQNOEGR/uEFY8WZjsBMlhyB9pEOkWAzucho+0GCW+Krw4S9wKw1u9Sp2Ynk57SL
	C4OjRyN/YXMWuQdoAeGq6aazZ3M84keRVnwS+724WuTDit1Ny0MHfmrumHJZEtUH/KGAjCIYwWb
	4RJjAF8ocd5TvyH92uKbzgTL4n0UvsDpcKfbQL/SZfNjs2ZPrn16jdOpcDOWeAxUUL3oLwc502Q
	aORe53hBUwW+YwYYtNoTTnEsro
X-Received: by 2002:a05:600c:4e56:b0:480:1b1a:551d with SMTP id 5b1f17b1804b1-482db47cf43mr69137265e9.18.1769857221761;
        Sat, 31 Jan 2026 03:00:21 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e2e3beadsm35715875e9.20.2026.01.31.03.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:00:21 -0800 (PST)
Message-ID: <33c9d757-4f3f-417a-b7a7-314f27a96903@tuxon.dev>
Date: Sat, 31 Jan 2026 13:00:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/31] clk: at91: clk-slow: add support for parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <cd2dcd1bc60c88bde718245c60a2c409e467f30c.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <cd2dcd1bc60c88bde718245c60a2c409e467f30c.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_data in slow clock drivers. With this parent-child
> relation is described with pointers rather than strings making
> registration a bit faster.
> 
> All the SoC based drivers that rely on clk-slow were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

With the patch description adjusted as mentioned previously:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
