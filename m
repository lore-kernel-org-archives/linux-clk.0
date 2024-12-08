Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C051714C6
	for <linux-clk@vger.kernel.org>; Sun,  8 Dec 2024 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733676252; cv=none; b=FSmaQgtvNMrXUVzcobNMsrxQqnhtOfH98aN6QCve22O3OfllDesaMfSOWD7Zh3X/1bzCigOikE199jjXFQ063kSfEKlS/T+6M1JP2tcXKINAKP6Z74xoeI+W7YCY+1+8ij0W8iCEfDY0FMre9k4Ybkh9CVOhE/U1d+lwZEe4bmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733676252; c=relaxed/simple;
	bh=u18GVkcun9bmHffXCJyLVQo9hlXnvo82onfpHRp1QD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcJrLEcVS3iBezfnZSXRTSiq+jT8fBG7e80OlxaVtYwHfCXxzgVVRIp9t0ToHP8p7JlT6HUw5lutGSBiwNSKvZPHGYiBYiQdMC7qEPyicZQjPy9mF3k+xs2BE6kI/GI/7sJvkdD5xLnXpRojPvi2sXEDFEqfnvXg3bcS7N5qVqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Da+iT3uX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Da+iT3uX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3863703258fso504049f8f.1
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733676247; x=1734281047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOi2LT6/bSAyzBeK+6Fj/VJjHRIZTnvrX9jpLhKvAB0=;
        b=Da+iT3uXRdif3Rn3fy6JoeSY2AoUFpAHj2n+9GqSki9JyOreWq/gXD+7UFqwvZh0SP
         z7zsa84CfPFU+N+f8L1zTs7eoaekO+2ourf9G7+xum/jG/5dlBolrZRlKoMmzgsMIEDo
         /CDYSZULm25HsPUMPj/BtNVMvx2KBoMGqvPA7H/yocbDdgOoaeAeEJqbQXYVe3aTnc92
         r3v33+ARPRb4DQS3CCKmQ5DPPpvVBE1gJsiee+Sx/E0SD+ho3g2nec5x3SSVOzGoG4fN
         7aY7rbmnfD7PKuNS42/r803WCg2ucUYd+qah/dOLzWcpNjF+SlW8Ra/9kspuBRIPzKkb
         1M7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733676247; x=1734281047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOi2LT6/bSAyzBeK+6Fj/VJjHRIZTnvrX9jpLhKvAB0=;
        b=H5qQzylYC3Wa+ZCincFFndvOEGr7xOj/myAy/8AlveFeD9tzovzIlfxbidxWVzQYzT
         YR7k4EKeJPTxGBww9ozUMy3FwluT7GBJ5vJ09FIZoDrfhLZGkCIBZq/SuaI77eWJahJD
         BRA7cauucBYwCBIu1GWynZogr/jKniZRiljezXQtFEua5Ab3ns+t83C8aXOejwI0COzO
         dWSID2Nk4Z4GPXLYFzp8ioU+WQdbh/DN089i4Wi9aNHAmv+mBVh+z36tGeBoZith2Z1v
         6GxOZV2MDs3IVkY8hjAKu8UtG2IXyOHVk/6KRtX+lIu9eVeZis/n0aLZJUUKYKnp3gdu
         J9cg==
X-Forwarded-Encrypted: i=1; AJvYcCWsP6sFNbDQ5nDjDhVSZzNSjy9W7LC+exRBeHvucoKAKogTgP35vjveCerPsya1rnWBt5pT6ToKFbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsURRGaQ1ErjOPKnmYDVkBDm+lvEIzaRakxe+t0H8Vy3IScdgC
	9v45PWLIUQF2qZcVA14eS+sw/Q1ckzHyhuEOuMqZQZ/Bsq3COVXCY9KUcDWcVkY=
X-Gm-Gg: ASbGnctPb9CHXuh++z9/dAueUJXCS1QfFso3Ia0CXmZRxUvm1UYHtcKoNoP6SgJd0n5
	g6O5Ubhaf4pxyd5eAUHIWK0b9PI9os9jS6t7Xy8NYX1ULLGXV7WyrSh5QepbxNlKgOhJ+eA1NaI
	54FFShNre/Dpz6s+T7gbMriKk7a0t6bqdNGcjlB1KV3X5oefczWGbUhdvKOJavgzXEnnaiBxwoA
	FwZOmx+U75rVrKrlUgjyPh0OECfzRqogzlH0unpPk3P11gdEYI20xQAIuk=
X-Google-Smtp-Source: AGHT+IGGy6Ldhaa4YTjG8IieQa8Oj6Mw4sjYxJ+7EDklp4oAAKnvXJZlWaCkP9Zsx1bWxvnFCp2yYw==
X-Received: by 2002:a5d:64e7:0:b0:385:ee85:f1bf with SMTP id ffacd0b85a97d-3862a8b530bmr7258225f8f.18.1733676247575;
        Sun, 08 Dec 2024 08:44:07 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f4a85f2sm10302736f8f.29.2024.12.08.08.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:44:07 -0800 (PST)
Message-ID: <d5d102c0-e4d8-4041-8899-6a732a514046@tuxon.dev>
Date: Sun, 8 Dec 2024 18:44:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] clk: at91: sama7d65: add sama7d65 pmc driver
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <6cf9921c6d312193c34f6f5cbd9eda7d0f9f317c.1733505542.git.Ryan.Wanner@microchip.com>
 <c0206c74-33d3-4715-9a01-256394919fc8@wanadoo.fr>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <c0206c74-33d3-4715-9a01-256394919fc8@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08.12.2024 18:35, Christophe JAILLET wrote:
> Le 06/12/2024 à 20:59, Ryan.Wanner@microchip.com a écrit :
>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>
>> Add clock support for SAMA7D65 SoC.
>>
>> Increase maximum number of valid master clocks. The PMC for the SAMA7D65
>> requires 9 master clocks.
>>
>> Increase maximum amount of PLLs to 9 to support SAMA7D65 SoC PLL
>> requirements.
>>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> ...
> 
>> +    for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
>> +        u8 num_parents = 4 + sama7d65_gck[i].pp_count;
>> +        struct clk_hw *tmp_parent_hws[8];
>> +        u32 *mux_table;
>> +
>> +        mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
>> +                      GFP_KERNEL);
>> +        if (!mux_table)
>> +            goto err_free;
>> +
>> +        PMC_INIT_TABLE(mux_table, 4);
>> +        PMC_FILL_TABLE(&mux_table[4], sama7d65_gck[i].pp_mux_table,
>> +                   sama7d65_gck[i].pp_count);
>> +        for (j = 0; j < sama7d65_gck[i].pp_count; j++) {
>> +            u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
>> +            u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
>> +
>> +            tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
>> +        }
>> +        PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
>> +                   sama7d65_gck[i].pp_count);
>> +
>> +        hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>> +                         &sama7d65_pcr_layout,
>> +                         sama7d65_gck[i].n, NULL,
>> +                         parent_hws, mux_table,
>> +                         num_parents,
>> +                         sama7d65_gck[i].id,
>> +                         &sama7d65_gck[i].r,
>> +                         sama7d65_gck[i].pp_chg_id);
>> +        if (IS_ERR(hw))
> 
> If we fail here, mux_table is not freed, because it is not stored yet in
> alloc_mem.

You're right! I missed that.
