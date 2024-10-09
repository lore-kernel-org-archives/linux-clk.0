Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8473D187339
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462500; cv=none; b=WbrtcyrK6YJ6/mPPrmcuvPl0mZggiMaGnl5/28lBj6EarISBuVzU076caIeeuZD1WX4ITcdm0jmcY1NseryxQmT+nHE+hIBZgKwjxxM2bMLdUZIFDSkqBzH0jZ62MtyVi2lgN0VyB/i+lkT8IN6zMbPzBX78BNDFiWoCcNBTv+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462500; c=relaxed/simple;
	bh=6bzGrGLwpvhYWgf5glIlpibLHN5KJ8LURWCbRfj5weU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sso1kf2R0LDy9+W/SqQYfi8n3LR1oiFWG2vA+dTaQlQwSUtqO08J9f6O4kxE3FLedp4LZdQY+f3bpzCVibs073VhmuXZdD8OqUzHh4VXUeyt8sia1qnUbu/BW6elxVouJRN5oro+URoaHgAhZ4Jh0mvIhfgM5LTbhySadCsCMec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qYt5mMoU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qYt5mMoU"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9950d27234so459989066b.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Oct 2024 01:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728462497; x=1729067297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2hncZT6TqY/G1HXjmnIuAZCGBO3DyGdLMKMRrjDhbE=;
        b=qYt5mMoU5kkhmjg5eDq3vxWnX9q+cjkHaku6hcqftTuGG4FjxkbZxINi81rFIEsLYo
         Ovf2K8AwO7T+cdDaGATo09R+fg+1WFS2uUK5kgtyLu+i2yWHreO3yxy1SNmjknqXhvpI
         QoLrRaTqZsHJl3/m7YEI4HNyYyuf8Js27ufn34XyNtMkijmD+JwEQjPzJNs3KIS81fr9
         C/faa5ONnnJtwJlGtVS7tNChj1GpfRLeoCdRk7QiIG7/F/vEgUtFVwOR3y1K3ivSF19s
         TYYT2ppc1XSVhK3Sqrp3UBY8H6tGPfIAGG39sm+1sNZYd+DUD9N+kgn8ZFLxdiCU1BvB
         tSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728462497; x=1729067297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2hncZT6TqY/G1HXjmnIuAZCGBO3DyGdLMKMRrjDhbE=;
        b=LGeBzvjmFjxaH/aoyVXo15xk7hBFzNtCY0PDPn0LHvsxckpwhW77LNxdQ+SQbTfvM4
         xp8b5kdlRUdyXb0fnwJg4dRGwHMgfvnfKYZcwAle2pJcTVYMeoI+hXgmfHgqbzSPhDmx
         NXbA9ZRyri/N/J8ttsezdSvF2/Nhh6mWtGC6ojn+WtdCLjE3zSxAeciGuO7+csEsrxIH
         YJKCSptkLn6oIFEXcN+/WTEFTroN2Rtp5e86fDAXlYU7EdOSQRHOx0vLXdlsPgFFzkrv
         tuz6RSdMX6JR3I0zx7Ddf4jjlomF+ErE4o3EJR/DREaJ1sG09vh8XEhVbrp5SF/tKjlQ
         fmAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUc9/inLgkNVHuSkhszMOhFcpH/sW3jiNkyCKPnHNXnoHCrWtaX+H9VRTp+2Yv+4vCn+nkA3N/7d8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZFSjcSqUOZGXVwJchA72lU/gdkKQt2tITKWsJW0bE/3XneKYS
	kLcLp3IsaZYc4tI6rWHqtuFRCFKlmQC+mtbP3tAzBkdp2e+8qxkWt09kGhEwR4s=
X-Google-Smtp-Source: AGHT+IHydLDTN7M+AKpH7BEdVRIu8dWcOdUuUuBI8mSec0MSrJaKmy7lwh2lnEMLP2ErYV/NquO3Yg==
X-Received: by 2002:a17:907:868e:b0:a99:4567:9205 with SMTP id a640c23a62f3a-a998d1fa080mr114977666b.35.1728462496919;
        Wed, 09 Oct 2024 01:28:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994ae7d1d1sm471992866b.104.2024.10.09.01.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:28:16 -0700 (PDT)
Message-ID: <59dabcb6-ae03-436c-87cc-1850e5130f72@tuxon.dev>
Date: Wed, 9 Oct 2024 11:28:14 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] dt-bindings: usb: renesas,usbhs: Document RZ/G3S
 SoC
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com,
 gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org,
 yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com,
 ulf.hansson@linaro.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <20240822152801.602318-10-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW5asr8ppnfxKT2zXq-9ScK1zZUJ9Fw1fZZeU22jbTuWw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdW5asr8ppnfxKT2zXq-9ScK1zZUJ9Fw1fZZeU22jbTuWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 08.10.2024 17:51, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Aug 22, 2024 at 5:28 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The USBHS IP block on RZ/G3S SoC is identitcal to the one found on the
>> RZ/G2L device. Document the RZ/G3S USBHS IP block.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
>> +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
>> @@ -26,6 +26,7 @@ properties:
>>                - renesas,usbhs-r9a07g043 # RZ/G2UL and RZ/Five
>>                - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
>>                - renesas,usbhs-r9a07g054 # RZ/V2L
>> +              - renesas,usbhs-r9a08g045 # RZ/G3S
>>            - const: renesas,rzg2l-usbhs
>>
>>        - items:
> 
> So we do have new users of the HS-USB block!
> If you do have a need for renesas,enable-gpios, it may be a good idea
> to proceed as per the discussion in "[PATCH 1/2] dt-bindings: usb:
> renesas,usbhs: Deprecate renesas,enable-gpio"
> (https://lore.kernel.org/all/20241002213652.GA1330004-robh@kernel.org/).

Thank you for letting me know. As of my current investigation there is no
need for this property. I'll keep it in mind, anyway.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
