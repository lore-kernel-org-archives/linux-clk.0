Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UV6F+HMy"
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80265A3;
	Wed, 13 Dec 2023 12:29:49 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so32307725e9.3;
        Wed, 13 Dec 2023 12:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702499388; x=1703104188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zw2AbkoN/4FIKkUWexE+EWqV2AcpdmgqKqjwrsLePhs=;
        b=UV6F+HMyC1uQmn384lL0Xk2D69cNif6FlMm6AJI3HGQ1xn9GTIbdsnft9BAR4uYAL+
         P663ol+Efe/pFz7wV8VLgllpcllpj7YjykMIBpPoJKdaBZap5vgRhik+tTL46l7rgRre
         MBxQIoxsYOLWvTs8CPaClR+h0FsppmxvegbC135DRm5aV0r/Mh7snnkZ24EcQMcVrUxZ
         N54JQ2DIYBFSJJtGuOqAATxWiCDwVwBRF9rn8eJ5ybcY32QQCnZuPVmz5ivtWEpTWIvQ
         3WEuyEIiJah/FhTWolicgWkb0z9ilGvBvRmB0VgPhim67uYaJo0umphu7P1HWRCDoFVI
         3lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499388; x=1703104188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zw2AbkoN/4FIKkUWexE+EWqV2AcpdmgqKqjwrsLePhs=;
        b=hee5yTVBBSUdJFOysReZnHpRdAZuuqQ/YFA6ggHPEkBvRowDSzFt3+PGY/wut2xQ77
         6m2/kWHMdCdmWnzEIT/p6kewovMS1LFdiZRIMluSsw9TeEeSoLRVtTefGHREsm3loAqh
         lTNafE8URxofKN24JaOKfKg1LQxS6DlAmwnQy660iQJnxOorejTz6q8+2eubhV4A35j0
         bTV9WxlRvTTB+LED4xAIghwMzeuWbDqMGhoSHBkNlx9221ckurfyaWYbsks5nDk0H8TS
         CGR4oXqeYr6w5Dg2zLWbr/5Q9SVfCBk7mEQdEw/Js7DH+7j1a1uan8ZLlGeHDd9Rw+iW
         u0uA==
X-Gm-Message-State: AOJu0Yw/XX8TFn7fVb7qeSo6PiTKJOA9bCG/GURfGlS/lF/JUSWPggBM
	qNLZ9hseR5TSUNcgxu+APd5cI7Kmww==
X-Google-Smtp-Source: AGHT+IG20yw7g9GqI9IbadFk19Exl/zGderaqPqj/VFPT7HLhLixQNc2+B3uD+potrr7JRkM+oOFEA==
X-Received: by 2002:a05:600c:3648:b0:40b:4812:22e2 with SMTP id y8-20020a05600c364800b0040b481222e2mr5226786wmq.11.1702499387771;
        Wed, 13 Dec 2023 12:29:47 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:3bf6:bcc0:fe50:883f? ([2a02:810b:f40:4300:3bf6:bcc0:fe50:883f])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b0040b36ad5413sm21179364wmq.46.2023.12.13.12.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 12:29:47 -0800 (PST)
Message-ID: <a5889aba-75b6-4671-918b-26a4b9ec12c5@gmail.com>
Date: Wed, 13 Dec 2023 21:29:45 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/31] Fix and improve Rockchip RK3128 support
Content-Language: en-US, de-DE
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, Johan Jonker
 <jbx6244@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <2167016.irdbgypaU6@phil>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <2167016.irdbgypaU6@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Heiko

Am 12.12.23 um 21:03 schrieb Heiko Stuebner:
> Hi Alex,
>
> Am Dienstag, 29. August 2023, 19:16:16 CET schrieb Alex Bee:
>> this series fixes some issues I found when testing my "new" RK3128 board
>> with the mainline kernel and adds some core functionality like SMP bringup,
>> usb and networking.
> before I discard this thread, is everything from here migrated to
> separate serieses or are there patches in this big pile that are still
> relevant on their own, that haven't been applied?
> [I lost track of what did go where ;-) ]

No worries - I kept track :)

Not everything is re-sent yet (sound nodes, RK3126/RK3128 split-up) but 
you can discard this and will re-send everything left in separate series 
(as I said [0])

[0] 
https://lore.kernel.org/linux-arm-kernel/170109134007.42627.12929766893521974712.b4-ty@kernel.org/T/#m63efa1c1379353b5cf764d2f9a260cf0329c864c

Regards,

Alex

>
>
> Thanks
> Heiko
>
>
