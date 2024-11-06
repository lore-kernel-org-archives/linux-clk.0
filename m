Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F35202F7E
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730906252; cv=none; b=Y7hytfUJZ3+U3KeLKiYsGDaa/64CrT1QoZDfTtwGtX5IJKO6O0rmq2lMQzRLu5S0Au0eAr7HqAinGajJwkVNmfpUk2buyOyjFODsZ6qTXkDqyGV26fzKTj84qo+obspXJrH9EDk9/K+AdDAHHG8y1SEmIiBJrWshd36jLP8oMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730906252; c=relaxed/simple;
	bh=uKlUi9Sg140f0IdPzaKYU2GXQ6NZXSS0fvyz8qo/uPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHILp5MFJgu5bSiwzvpxwyfV1KEYopQBkG416/tj4POZO69jp/WxwUIwpOlZn/8fWmwVsRXJlys4YS99YFJoKMzjiBA6TeamG6QqGhCtVJTmAGTafiBva+DOB2tK72vCHAKiP8JM2z8Ao28NWZkm+o4l94rnhhq+eJ6hF5jKfhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pL+UeLyI; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pL+UeLyI"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so55896041fa.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 07:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730906248; x=1731511048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MsTq/WJqlO5g9jEiiWLZqf/MRDx8MkbY/RBJULejSE=;
        b=pL+UeLyIg4maDpaK21NrO4Hya8+56wocLDvNRoWSGJ6fKpRJiyvmJPwxmW4Tj4IjHQ
         TfBQb7PtNcule4MZ+h4wmJfcgs2rWol6miZLACzsMMV/yBc87uRBM+KU0OKkEVq8vkkK
         Cp/oOIpjJB4se6BvZPVdigqEMdvS7e/uOksh71Vuy0LAmwog45XRJLqgZWv+Z5NSEAiq
         vvE4b6R3jBnev4tGq3uJmuxEmRuxgw6ZQROY7eioFnwg82ynV+5myCoyZfkN4mBtuAPg
         94NEPkQ0Bz8NotKdcl8HNOuu6FSAUtuA2HhXXf98jIcE9Plq6U5LzloZLGqn2TpufMRZ
         lZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730906248; x=1731511048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MsTq/WJqlO5g9jEiiWLZqf/MRDx8MkbY/RBJULejSE=;
        b=HeDd4bVi0H+fcYjq+Hc2xnKYFwp7AtkMHXWLXHToYrOHdlI6tGyx2f0Ik4z4HiI9kv
         HFBQ09xdP38ltZv6lF1k968WO7M9d3PjUrA58W7xHMjr+OffyoKjV6+uRmsdRkJyylvW
         bEwBgHXfF4+7W6b49pPVBT6zt8c7OJWjwVEJ08eqBtML+8SUHB+IVABTrg0e4hdX7ZJp
         KxKzjYQNHShuOG2KgqORB6zv0l6Trvb0YL/ckN2sqqMQsuHa6Yxbf0CEzRYik7aNIzdp
         3rnOGTaEjeDSWwI1sI00WoWrdtzGELzd49ROnJpl8ZiUe2Rc8dTAEPY8yBTSEhUKV4JL
         5gsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAwZv83x46G6PEMlpet+zPYzw3dRMrm3GnkXChrXpy9VX8MHMIBoypg5Fw/faM8qaikUL2QoQUgbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjEmebG0VPmxnuJE8zy8yzmW+OwrdousFBwLEvO25BTqcO5Ie0
	hNAP1TfANv9PamDf17Lv2E+kBEXvfKxMAZ9TB+Q8ShVB1fncvR/JNjTwqVJYSO0=
X-Google-Smtp-Source: AGHT+IGnJcBdTdgjK/B0z/HelObGqjcm5AB5nzH8x/DxvLNK2CcgfKasW11Fsyv2wiAlGSAOaH7rtw==
X-Received: by 2002:a2e:be0d:0:b0:2fb:8774:440c with SMTP id 38308e7fff4ca-2fedb7a2a10mr97785331fa.10.1730906248023;
        Wed, 06 Nov 2024 07:17:28 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6a9a41bsm2855950a12.14.2024.11.06.07.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 07:17:27 -0800 (PST)
Message-ID: <4e233ebe-b0e1-4b37-9063-bdbeb5980b13@tuxon.dev>
Date: Wed, 6 Nov 2024 17:17:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/31] ASoC: sh: rz-ssi: Use a proper bitmask for clear
 bits
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com,
 p.zabel@pengutronix.de, Adam.Thomson.Opensource@diasemi.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-13-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWxmoUQSSnAVdqhpTQJYvUCJTL0EZbdKmLLhFWi8UCGkg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWxmoUQSSnAVdqhpTQJYvUCJTL0EZbdKmLLhFWi8UCGkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 06.11.2024 16:56, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 6, 2024 at 9:19 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> While it is still correct to pass zero as the bit-clear mask it may be
>> confusing. For this, use a proper bitmask for clear bits.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/sound/soc/renesas/rz-ssi.c
>> +++ b/sound/soc/renesas/rz-ssi.c
>> @@ -331,7 +331,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
>>                 dev_info(ssi->dev, "timeout waiting for SSI idle\n");
>>
>>         /* Hold FIFOs in reset */
>> -       rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
>> +       rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO_RST);
> 
> But you're not clearing SSIFCR_FIFO_RST, you're setting it?

The bits should be set to reset the FIFOs.

By "Use a proper bitmask for clear bits" phrase in the patch title or
description I was referring at the 3rd argument of the
rz_ssi_reg_mask_setl() function, which has the following prototype:

static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,

                                 u32 bclr, u32 bset)


Would you prefer to rephrase it in the next version?

Thank you,
Claudiu Beznea

> 
>>  }
>>
>>  static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
