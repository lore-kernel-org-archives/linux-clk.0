Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123718E76D
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240463; cv=none; b=akkSjrWXH6t1K0DsmZYYFSRoXsM2RsrA2A/wejMwvXdpAm+7yEW0EmQ9i2zsKQtImxUDGG9GBBtCNyKCuwtty3fkSAJhkhQCWjHyhGE5ih+6DPH1PXlKaChsKI71zH6j5fpzsaMDCDSyktPNm1u1evKxUKQjYRaBJFf5Om4jK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240463; c=relaxed/simple;
	bh=b4E4029fjWstm/jwBKi6vJ1oeRX2E/I9d53IDt8mdA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jn/OTSfJBQWyZTGb8DQeNnaVoHcx0DfONeqHhzF9tTo9NwZjARBOYW2ccz3ht98XjQNNF/90/zM5BkWMK4QMOEgwaDaQZfOEybpffXFJeQrpci/6QGlq8uFOyNqFNJQfl5rsfx52hDknc6XQiFhV1HAsq/q47GvHXJ0vaHa8WpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N46VtChQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N46VtChQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so15037295e9.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 01:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729240459; x=1729845259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y3tHtrUBgNbTxtBGVso9Dx+kP6AVUtT/U2okVHcK1AA=;
        b=N46VtChQ6DI+WM02DXu9zdIF0vN4g+6TpsIapqiuYfrq1WBHa55RLQC9HyemrH9XSm
         A1R8YuLfa77wGH/K7Q4ZGyEFrPwvr1sPUsEraMU313hudYpy3gzLlpR531HEZPeOO1N5
         QX4GqK0pMPDU+KP9+awsMULpw9VukplLBzht0HiyJbfLJ1yKdSdOEgLjEsqgzhTGHI6U
         k238l2fGSlapUacklhj5jcaEL1p2sZercKQT4/9NqdVSOJcoIlEl7gDS3pVs+PbT9Aty
         5UH/e1q+w/abLBuDqninZzVjFcNNnHxaOHtsvIBu3oVU18x4/nOqlxVnyXrmGWUk3kA+
         kgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240459; x=1729845259;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3tHtrUBgNbTxtBGVso9Dx+kP6AVUtT/U2okVHcK1AA=;
        b=g7jCX0b5Whv7jOasGeUir7UiiCVHYrf6ASyTzXC3/hCgC1R+LiepSkHygC7ilOBq30
         71LtF67QseTeHtpNXO3w1g0lW75QdjMHr1t/tjZpruFq2WlB9OLeQSExOoz/DLEo4Czg
         5hUuqm640zvYDkuRNbd17j5XQ3weDVg4raeXylbQlYHV+ppDj0dq6cGsxKcN7N+yClzx
         VGdjvpfVtWESPEN9+S8pX29NhtvUhFiYNssz6Xc0/ZoYhjoszDG9+L+87ksrFOC9ETRX
         sOHB1Z4zIRaREJY6cDL5hDP1w35hw5Q6uTjAoPxDCcGyb4Qs6aJux3Po8OgSqOEFxDIQ
         8qFQ==
X-Gm-Message-State: AOJu0YwutusKYGcxoYTXnFqxgdIl0lXloNDnMaZnEXHr2RP0Z/mnYZP/
	0YvI4+7AY3Xj8CvAbCopYm/Ozi7JbTgWFNwMpaKR1Kn7wPfMamhi2kdLSeBR1cU=
X-Google-Smtp-Source: AGHT+IGrYjQeUUrmpVzq062mykeB3hZaR2qo1V+pRrCeo9VAw1xHCHQnzemdXQKBAcPjirBg2myL/g==
X-Received: by 2002:a05:600c:45c3:b0:42f:8515:e490 with SMTP id 5b1f17b1804b1-4316161f58bmr13838685e9.5.1729240459258;
        Fri, 18 Oct 2024 01:34:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e44404sm17384785e9.35.2024.10.18.01.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 01:34:18 -0700 (PDT)
Message-ID: <ab1fa4c9-6b4d-41a4-b337-ce9d7f5052ec@tuxon.dev>
Date: Fri, 18 Oct 2024 11:34:16 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: lan966x: add support for lan969x SoC clock
 driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240916-lan969x-clock-v1-0-0e150336074d@microchip.com>
 <a20e6927d38aed4e5b1cb1f49346ca29.sboyd@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <a20e6927d38aed4e5b1cb1f49346ca29.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18.10.2024 01:59, Stephen Boyd wrote:
> Quoting Daniel Machon (2024-09-16 02:49:18)
>> Add support for the lan969x SoC clock driver in the existing lan966x
>> driver. The lan969x clock controller contains 3 PLLs - cpu_clk, ddr_clk
>> and sys_clk which generates and supplies the clock to various
>> peripherals within the SoC.
>>
>> Patch #1 adds compatible strings for lan969x SKU's in the dt-bindings
>>
>> Patch #2 makes the clk_names var const char * const
>>
>> Patch #3 prepares the lan966x driver for lan969x, by adding private
>>          match data.
>>
>> Patch #4 adds support for lan969x
>>
>> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
>>
>> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> 
> Am I supposed to pick up microchip clk patches myself this time?

It's on my track. I already have it on my local queue for a while. Sorry
for not mentioning it yet. I need to run some tests.

Thank you,
Claudiu

> 
