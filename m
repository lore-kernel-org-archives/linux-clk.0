Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBF13570BE
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769868996; cv=none; b=LPtHZBub8jNMNrF4VQm+vdtfe7UgfBSGL+b+ypw4CKLXAWaBKnOczETkJ9MzU+X/Db9f/crwe9D7A1aiSgbJBBSasMUNMgifDKsCLMm0GHxF7tWQAXIh9Ov+ZV0ZLthj0N+gqKFjexcAYCOY83Np5ck5kXi93tEgtEy/G3GGsSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769868996; c=relaxed/simple;
	bh=59SehFCSegGSuNJ8LzeGsARjHhGsOHV2PwrXdAk0AXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0ZMv8+wEnDHxqhqE6ScyK+PKntx+AV6yBs9zaQWX28u+HBtp1mGLNIfsV1FB8YksNWF1WOtbDJvkcr/WBVNLPtVz61EhMqP45/P3ZLzLDmjyYY4zaNJ1NjZJuX9z82b8uS29j292//Pm8Jb1WlnLW3U/vtoFNdkc9V5CwFa1gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WWT5L7g/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WWT5L7g/"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b8466b4a8so2315135e87.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769868992; x=1770473792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnrYWC04zmXsWBUpFT18g/QgZC6dC+R5ETYNbj7MNao=;
        b=WWT5L7g/intqcg21s8Pp0bezaf2oO43iCEH/qxchlPVip7a9n8g028q6qd30QeHPCI
         UO6qhRETZuFrxEUe1J3GG6Kh7VlUKeTp55+k4wEZzf8W/Q+6Zh9jKpdqH+X4c7ikb/kP
         FMHFPOVCrvQxP3nzEFXuaVyZhRxQee+TqWXcn72YP7k1SQqlqbCamYFvpvPgvSDKqX2F
         F766RWO7Gqpf4ZEdjCzAFRHJcKo3AmYAksKUnv72dX+tr7o6rQr9+vMfD8rzpVlrHEqa
         jhw5EoP2xzk+Q6jsm9Arb9Y0YERSE/U4MjzC9R3Jfi85vOk5MmWtfKGyK3PJv+yzampL
         FoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769868992; x=1770473792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnrYWC04zmXsWBUpFT18g/QgZC6dC+R5ETYNbj7MNao=;
        b=lt+GrwxaWOc4fsYtvcu3qBvXLs3QFuzd8WyUuw2xkIujtr+w8AUmRqwfzfYfBHT1Gn
         OvzsL7fLrvBs9JuH4cQI1qmy6H2LUWt4qBj7vvo8ukh032eoC+9DYvP47bv9YdBT3bqe
         hnxed0JzwGucwhMa/ksyjEDiGGCY8LtFPMzg2TCwao+LewZLmYGXGtnFujvmLFRArV0I
         25IetZuIIw3EMpRZk9/nlGiwgRjFJ8f4TyZcW/NWFT3iS+YSuNJDs8VtwkKIzRN7yFpc
         B7rlCa7UeFMq/Mqmj84obtW4XRpNVBBxr5QDQZ5c5yQhfRM9m1xcP53LXSAzRy7xS3vT
         /7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCboOQ2uiMQ6WlnDY8DDPYE7OYynz2NWp5MPSeqjDbFBq5Rtw6Pwr2pakoLTj+nFDCyOmpnyLgi3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YymRuhFnsntaT1SJ+z63sL/Em5Yu6I4JoRvHa2VxJ6MbUCiphi8
	90C6A7XYsbigG0fi3RCbcCCw5KvV6l9P2RFLXYvIFtuvOEwFLBWLP0JTg6Wa1UQHO5I=
X-Gm-Gg: AZuq6aKOR4HWgaW2dY7fJJD7oVpoZiJgo3xCgRX33N93+PHRL6wO3y1b7vTdcXM9+Nz
	0cnrgAfAdaYhQWl2rEA/sTSlrzcFFkh9m8G9MWrODerl43RylbhGS0CXmBe5nI2lEHWpCsJdVuh
	5P/TMm65e45SHUIHdO9BVjtTQEjZ5kVhORJy9hd/GQ6tsKaeCklG4dwSCORCZ5TA3ArO+/4Zonv
	ad+aRHmM8GbuBU1M4UqoiN6djpIUVq99D36zBwn6Rc3314K+p7q/py70u1R551nm1uZe0XaRLIJ
	xaqZJxwIXCcxj7AYxbl79KizcR86BB41VD9aepntOXDWzT1pi683lmQXnTexaFkWG0y3hFoZTZy
	eTyLBZTFpLkZVh6cGBv2JupRsCHi4rSg2Sl5j8clAFpIlDC/qQsCK13FTglfQks4ItpcbqjWN5Y
	oZaTeQdF42+2rvslecKg==
X-Received: by 2002:a05:6512:3d93:b0:59b:9f92:301f with SMTP id 2adb3069b0e04-59e163ff690mr2340319e87.7.1769868992221;
        Sat, 31 Jan 2026 06:16:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e091712f1sm2250805e87.39.2026.01.31.06.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:16:30 -0800 (PST)
Message-ID: <79673c9e-6611-407f-9fb6-bf30d4971e07@tuxon.dev>
Date: Sat, 31 Jan 2026 16:16:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 28/31] clk: at91: at91sam9260: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <76dfa9949ebe73621790f62752d6fc77954198b5.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <76dfa9949ebe73621790f62752d6fc77954198b5.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Same here for the title and description.

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM92600 clocks to use parent_hw and parent_data where
> possible. Having parent_hw instead of parent names improves to clock
> registration speed and re-parenting. Update the clock
> registration functions to use clk_hw struct.

Same here for the last phrase.

> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

And with all the above addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
