Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hUo+Pljd"
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159B8D5F
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 01:05:15 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32dff08bbdbso3198222f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 01:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700471113; x=1701075913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkLluJIfs9A2WfK4ws6uTuiWflu7QIwTGk5lEdGrZ8Q=;
        b=hUo+Pljdj6x5DCjR/jo7P1BtRCgtwcj5R+aXWuUgcTe5aDpa5k2//Bgtbu3Ls9SCsB
         fJ2CtzrsxrCXB80LUyj8UGgvAgyKbVbVjJOYubMepvOEjjpW6ANw1i+GQnzRRNztUK5x
         5EG+fr9meG3V1P5Py6rBU8Kp08piIKFYOpJN8aCN2HgPWjtSYVYfOOlwCyokisJYwdUC
         gOWjAHZen9uqfhrBOxF+m6RcQPhCgMA0hbgQ8tfcUd1pPlf0sZGggvNWKWvH5KMDiBoC
         /cRHWUF2epMv2Ml/Kbw7xmZ6HSavMtv+5mlRsddVFUVk1Il5fRcBN5T85wXqYcW2QE8x
         m5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700471113; x=1701075913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkLluJIfs9A2WfK4ws6uTuiWflu7QIwTGk5lEdGrZ8Q=;
        b=tNSYTm1AHLIRXmyTLRc8s6sSq0sAqet0Wd6vgQ5IT0WEAVRKI3fqLQYF+VChcKuLFe
         5WjvCenRs1AJqrs5/bLwxHPfphT7Gpmw2ZT77nfLB59yefGYhoYHRX0A7j7ot0hmJy8h
         OTdFv1pUx4DyN0naL0ce0FiFIcx2hoez54MMM2mrfML8SrmZhGARKcPCL8sNuSvWgb8X
         XQ4+yoQc0Hbp9sVU6dadoi6Ak8ZKoMtGBjO/V64zy2voue+OFcoF6jXR+pKxs6nNk0XH
         zRHRWhN8n3j6zpFZYmtP+dLscXFaqg7MFc8JHnH50NYCUn5aGhF7UbS4lW3kajpsmLC9
         nkog==
X-Gm-Message-State: AOJu0YwgSjFxhADcwXdqxz40kRRNYC3I9kP/2/v3Cig21z3I/cVqJe2B
	0pnaTm35jBpYTrXBcYVN06RFdQ==
X-Google-Smtp-Source: AGHT+IFq74/v4yVRRxE+pvLLMGOf1Rfctzf+CaYkqnL15lGut/2IP8miObeas0tpSho4tWROmvLB0w==
X-Received: by 2002:a05:6000:2c1:b0:32f:c369:6b00 with SMTP id o1-20020a05600002c100b0032fc3696b00mr5665046wry.14.1700471112833;
        Mon, 20 Nov 2023 01:05:12 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d4c92000000b00331424a1266sm10473085wrs.84.2023.11.20.01.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 01:05:12 -0800 (PST)
Message-ID: <ea3567ef-1293-4679-bd25-730c1b3e60b9@tuxon.dev>
Date: Mon, 20 Nov 2023 11:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm: multi_v7_defconfig: Enable CONFIG_RAVB
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Davis <afd@ti.com>,
 Mark Brown <broonie@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-15-claudiu.beznea.uj@bp.renesas.com>
 <bd25377b-b191-4d81-b144-2936cb5139d9@app.fastmail.com>
 <CAMuHMdUkVO7cXpsHd_oGvEpZdJpP6GP+VC8H5GAZ94KJf2joLA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUkVO7cXpsHd_oGvEpZdJpP6GP+VC8H5GAZ94KJf2joLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20.11.2023 10:58, Geert Uytterhoeven wrote:
> On Mon, Nov 20, 2023 at 9:44 AM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Mon, Nov 20, 2023, at 08:00, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> ravb driver is used by RZ/G1H. Enable it in multi_v7_defconfig.
> 
> Used by:
>   - iWave-RZ/G1M/G1N Qseven carrier board,
>   - iWave-RZ/G1H Qseven board,
>   - iWave-RZG1E SODIMM carrier board,
>   - iWave-RZ/G1C single board computer.
> 
> So I'd write "used by various iWave RZ/G1 development boards".

OK, I'll update it in v2.

I noticed it is needed while checking various bits on a RZ/G1H based board
so I considered that if there is at least one user for it it is enough to
have it enabled.

Thank you,
Claudiu Beznea

> 
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> We have a mix of =y and =m for ethernet drivers, and usually
>> only have drivers built-in when they are frequently tested
>> with NFS root booting.
>>
>> Do you need this as well, or could it be =m instead?
> 
> As the default chosen/bootargs for the iWave-RZ/G1M/G1N Qseven carrier
> board contains root=/dev/nfs, builtin is appropriate.
> The iWave-RZ/G1H Qseven board defaults to root=/dev/mmcblk0p1.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
