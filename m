Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7224187331
	for <linux-clk@vger.kernel.org>; Mon, 17 Jun 2024 07:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718607852; cv=none; b=MgVZtl/J/LHeOWl7dlLTiKTN51pMCdJfo8hkDNRLc98/aRtA/L2yJy116fYi0XUGvyu39Zcmc2EbhExkM59OXQMJF9VEohfkyczjdjvhpwkoJnDPJcAFUMIPLKOgmiCEnitiUxXlL5OdlVh+qH2W9x0YPAC4EqQvGOs9GyjT3Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718607852; c=relaxed/simple;
	bh=AktLrWFN6uYaEHm2eLlbIr/ITVmWIbhY3r7zRb7at9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWaaeCneW6Us70pQJMf10YNAhDAnf21gfcuMc3LZnydRhf0Gkj1tG2xzuUGnk8LLVlgxxntpzl1ZOa8xM4Cxv0yakj44YGNNFWXsO0cdCCA/7q1Mcfw6rPPchDzUrS3VWOA63IJX85P0t8J2Dswt2iccWTYg5iaK1zDI3Aa33TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dPkeukVi; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dPkeukVi"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57c7681ccf3so4603057a12.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Jun 2024 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718607849; x=1719212649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4op8rIzHP8JvuTAHfHPAy9Ox6rzEQd4/RfOVSiZ2sE=;
        b=dPkeukVimU+Z7QiP8FmUrrJiarxq0ve1JePcKqUhJGQaMpGOHXSRpzbkveFLiTCFdL
         bA8YcAP0vmaH0lgsOtY77R0dbqEuvUYrJIw+xUU7MM7SMxBHgOFMn208adM+mqW1aCLe
         PvEyyXRTlb7X9enYKIJdAIAdyslgOzFd8cjYJMO47U/yCf3Yu7KOfNEYtOOKnWSn458q
         B4SA/sbJy6AdQ2PTYo/m4Imf0NmCq4U0tch/r9IGu/ETrM+LPkWbPRXeHMxIYLB4x1O+
         rKBDPgClJtPh6V5svWDJJFhGyMOGfOuiA3Vh1Se4u6O/EnLjIP2lwr++6yFHWoMolw6t
         ifkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718607849; x=1719212649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S4op8rIzHP8JvuTAHfHPAy9Ox6rzEQd4/RfOVSiZ2sE=;
        b=rPOi+0WBDOPOfL9wsfGZ9Vk8Bqj3yNIhol9iek5zFKiHMNzXw5eoUDcNbKk9MzIF1a
         7kC5Z9p2n9iv/B+JkEnbRZ49mUwsiKsEf6S+QqsTRudo870+o+d82YHE7hwKS5SFIcPc
         xQcI1aSOCGCHYsIMh1wY6KIaQ2wNwS/NVmQbqb+8rqX26hThRbfOTN6k4f4FpnKBHMFa
         C1vHF0kP+yZrbW+25uX0QGAnAGsG0FbAhrjz6BYdlidDbuIG9TfAZZ5nazUPs70hO4qS
         xCNOBVtDOZQkX96ewC+TeqdpUjzf4DylKkvVR8NVoSxxyWd6W+9pLV3XBrLW48HgooHq
         qCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxKt2LdcZDBQdqUMCJnL2SE77D745bF+TS72RBrGBIBW/SqnThX/XripXqi7qJcF21zLHdEy3EdlYZdWp7YL1WyR2rlJ/yaTjG
X-Gm-Message-State: AOJu0YxgXqKSu6NkG8qXv/yNKpQgO+Dz/sm1Uk3lWIrLKRegrFd1Y8+7
	yYXUcwQ68m24TgxgIMJ7LgsotLCrBM/X7t+zfd8pE+HkQirJHEWOxYnKWYHCunk=
X-Google-Smtp-Source: AGHT+IF26jBL/MXFko48RwAldivf6KnMYn+dkXyzG1gTNio9sEd7J10HUGxCIpDzL8VV6MHgzlHGig==
X-Received: by 2002:a05:6402:40c5:b0:57c:de6e:75d9 with SMTP id 4fb4d7f45d1cf-57cde6e766dmr2014654a12.32.1718607848890;
        Mon, 17 Jun 2024 00:04:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da785sm5972959a12.28.2024.06.17.00.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:04:08 -0700 (PDT)
Message-ID: <4141ee7f-3f05-48b8-8ea5-97160bb0750d@tuxon.dev>
Date: Mon, 17 Jun 2024 10:04:05 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] dt-bindings: mfd: renesas,rzg3s-vbattb: Document
 VBATTB
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 alexandre.belloni@bootlin.com, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-4-claudiu.beznea.uj@bp.renesas.com>
 <20240615-unhitched-slain-446130658f87@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240615-unhitched-slain-446130658f87@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15.06.2024 15:19, Conor Dooley wrote:
> On Fri, Jun 14, 2024 at 10:19:23AM +0300, Claudiu wrote:
>> +patternProperties:
>> +  "^clock-controller@[0-9a-f]+$":
>> +    $ref: /schemas/clock/renesas,rzg3s-vbattb-clk.yaml#
>> +    description: VBATTCLK clock
> 
> Being a bit of a pedant here, but isn't the address known? 

It is.

> You leaving
> room for future devices with it at a different offset?

Ok, I'll keep it 1c instead.

Thank you for your review,
Claudiu Beznea
