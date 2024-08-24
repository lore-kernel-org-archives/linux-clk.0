Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74761714B7
	for <linux-clk@vger.kernel.org>; Sat, 24 Aug 2024 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724511227; cv=none; b=D5UDbF8DypYcOi7dJw5JMDyuASL+Tsiu49IrohP0DhcwslrDXxV2qgco5o4529fXlqTciv8pouSzK2hQBPuMcdVTdzY7rZNQg0/AqMe6aPFySn7titExvd/KhXPKA9Ma4h4goH/FnSw1/3o5RAae4X5buMod/kD5nqZU2a4YFfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724511227; c=relaxed/simple;
	bh=/JsEau8brkLXr7oKpwfXPD6AUQJCnf27nPEb3S56Hr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ojn+eKtAw2g21DQoZLwhSY9QjwEILk6OjVBZ/7AVOHKGJfh0BlfIMb7JLExHrIYVk3zfsC/Nzt5VHd4EpmK3Vzd/efWUeUo5PEUHt48zlHo97Qnl0MGKtdVW1jbzdBn4UKBlSkufMHnt5twXhnm5NplQBqmgZBjgZO1WydpySSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j0IH/FDH; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j0IH/FDH"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f4f24263acso34841651fa.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Aug 2024 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724511224; x=1725116024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l62ZXkDjkO/9RbV9AkhIHQNaZIShFDlH2pL9xxXwU6s=;
        b=j0IH/FDHVskWTIgSuDT0wwu4ffEWdAsV6A8d2pcVQx+4RH4F8ejX6H53KJWjlphpRn
         Kw6gBGHMejB80y/ndBa8zOufEBwiTQEcviQb7GIGc1XajiJBwwvLgsxnMvti96yd8CQn
         MhzGz6x0B5hWptL99g052BYAU+LxaWNs+FZhNyWG+RpiB553KYMbdO3Qga337SeRIHoE
         Ra6WEhffWQ08iHWgd/MRkYxWcwRE1Wd6o3CN8D3KwrEUFPR3GBqLu31fGS3tnaQTH7Fj
         XzYdov/ZoG6fQxnVuVCz4rE3JOZKJcRWO3fnNpN5gCA6+jcVzAc0X0rCqlvpQ/TrmLL0
         iC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724511224; x=1725116024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l62ZXkDjkO/9RbV9AkhIHQNaZIShFDlH2pL9xxXwU6s=;
        b=nP+TtyJ8RiRXoT3J1HvraPaZ6kfNh6Qft6lqwNaj3gBaGGa1Vs/PXQ2H4gKuRkbYNP
         TyoALPr99pSedPAvJh8rptxve381ikgbq9EHakI624mR9gYgh9lVvIgHmYRhdi35Q2qr
         72jqW9Oy9+HUp9qKlI49rm9FCtuN2T+YFj83kab+BqBS57iIeAt6TYt3cp596ZZzaZYr
         su32NNiPbVMdsf6nFiYZaFSDJWzDVLwX6n1YELR9aAjzL0Jxqr3+aOzlNu0T7ED7hRki
         IpSugieAQJnWB548RaD0mXdsiKPquRwXFV+EWTu7ISSBHnkS6ELkP2zL4aU5gb8Ah1Q+
         UJHg==
X-Gm-Message-State: AOJu0Yy59bm5jH2yecaCKnA/3kP7kEk2XcuT4QrB64ddfVL+toUzvuUg
	IJkO0D8Fh7BSwN6v83hiAPOmNUVe/NVpg5xYuD4iaeOlyvKfCIhJ/vCb1g9rMj4=
X-Google-Smtp-Source: AGHT+IHWbWqgdC2nPGTjCpSG2/Yy/IeWdZQTtHHgJtiQJ7X0BY6UfL5m2t7msptFp4JJayuged9ZpQ==
X-Received: by 2002:a2e:702:0:b0:2ef:2d3a:e700 with SMTP id 38308e7fff4ca-2f4f5754e91mr38772991fa.18.1724511223545;
        Sat, 24 Aug 2024 07:53:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f433671sm409703366b.128.2024.08.24.07.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 07:53:43 -0700 (PDT)
Message-ID: <5665dd6b-59af-4106-888c-67b374b9f7ca@tuxon.dev>
Date: Sat, 24 Aug 2024 17:53:41 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: sama7g5: Allocate only the needed amount of
 memory for PLLs
Content-Language: en-US
To: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240714141315.19480-1-claudiu.beznea@tuxon.dev>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240714141315.19480-1-claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14.07.2024 17:13, Claudiu Beznea wrote:
> The maximum number of PLL components on SAMA7G5 is 3 (one fractional
> part and 2 dividers). Allocate the needed amount of memory for
> sama7g5_plls 2d array. Previous code used to allocate 7 array entries for
> each PLL. While at it, replace 3 with PLL_COMPID_MAX in the loop which
> parses the sama7g5_plls 2d array.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Applied to clk-microchip, thanks!
