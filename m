Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9683637143
	for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725119405; cv=none; b=XG1wjnwQLdmAKYwizkcRtSzW4Gl3vAwBBwe0Bz2qaXLIjHbvLnnZo2GOmZefAhSH7XlRPBFsjCqh9eYK9Rfnuspq8m2DjbMR6+b5rf9GgtQL4DSqwpOyC5R1miSDkwhMIJySmDhin+MIUz2ufuiPgcO0RIwP1daeJngfFGll85Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725119405; c=relaxed/simple;
	bh=FyWV4Xbn2rYlOCLoCuhy6EF5vsRilaW3UxnagSi8snk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MZyUGTQ1+dpD80wy2AwFFgVH08LL1TaAsQb0G0gAetPL5CG+UHrWEp8kAu/4uueKEn9jPihru774X0yBJhmBgbfFLOeEYCQ4MuWAJslZT+WLkoubcAu3kESqVnSrXlmIRh5VG53AtGGtdcjRxHcMTmJ1L06oSZDc2BRjGMb4Gr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pPGHH0wo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pPGHH0wo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so914397f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725119401; x=1725724201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NyLJT7eoanVXHdKpJeqUoZPHmUPCXpHwa9+euMrN91c=;
        b=pPGHH0woH6n2qMzANNRMygGacqYY1dHMXhcH+Am/5C8ZUUOJHtc1OXa8mF6rKsUVku
         flFdi8HW2toJaO763/lrEbU5Zhf5L0O08OVuxEJsA3FXd0o6+7aL5f4yjqqWu/XuCW+U
         wAT1lh3vNVJp5jpYRSt/G4k/l6HHOavtla585yrMKIuCNZJ4pSKQR/BgSmOB3IIQOJGe
         rMO6I9JHI/7t026PZJFD9mjbuUauIey5UWMLJQ9tWBkjsVYXSPpy0RyJYgcGbHgMtdkj
         C98U8paeWPMMAZ6XMKo15pBKrbrMZQSdBv3va0NNkA+0DCsSrGJfd8wLMBg/ErqjuY+7
         KOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725119401; x=1725724201;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyLJT7eoanVXHdKpJeqUoZPHmUPCXpHwa9+euMrN91c=;
        b=tVp1SJQByRkhc3nTLyGygKYrd3vM7OTz3uMYEjkB6lCXuH4ABGwRUIvUqwiOlQyz6s
         PDf2XonTEgJW5CqAsgzM8noOzzKu20KGeLUepxyuPwq+pmy4916lmvT+1twbd+KjaKWe
         P3pDSXx5JZs9zLL8eSIMhG/iwl+NLWh1a46hJ4il9LRktYsqqnQYabKy5wmYaI9imLhR
         g3DXPlCIaRe8iRqHGPms5Zn/dQosY7H60oZsr28MV33RG1gqn9gCi/YEDS/yJA3+GiXD
         IGFikf2vbJRcBOYFyr8QjFFmqvcDUyhmxkQQ3D6tdJhpIRhHIB8wgOhdmBitIRAAO8XZ
         YrdA==
X-Gm-Message-State: AOJu0Yzhrt5vijUBXwF/0MrIr4eSRtB9PdmxW7oOs99H02Pj93BgOqjW
	CVVFx/CuVuH8yV8R+OrqA+zMxvsUqHnT9TJpmGBrvHSHtCFxwwmtKktfQMOb3HyZesBnuW8PhTM
	i
X-Google-Smtp-Source: AGHT+IFNj4M+GIQ3WNPumEM1GvkS/EHgsZbc3e4S9XcBtcL+VQ9rJg75c2GkxJzRU0iNQ2Q5HGEqQA==
X-Received: by 2002:a5d:47a9:0:b0:368:3038:8290 with SMTP id ffacd0b85a97d-3749b589645mr8378188f8f.39.1725119401302;
        Sat, 31 Aug 2024 08:50:01 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c1b0a62esm1387063f8f.47.2024.08.31.08.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 08:50:00 -0700 (PDT)
Message-ID: <6cd18742-7ba8-4b0c-aff9-7065bccd4095@tuxon.dev>
Date: Sat, 31 Aug 2024 18:49:59 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: get, prepare, enable a clock not in DT?
Content-Language: en-US
To: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <20240816-ludicrous-lagging-65e750c57ab4@thorsis.com>
 <384919bc-7d45-445a-bc85-630c599d43ef@tuxon.dev>
 <20240820-grandpa-down-fec4231f971c@thorsis.com>
 <e7f69aa3-20a7-4233-96c7-0fa5fe67bbdc@tuxon.dev>
 <20240828-gainfully-cringing-2f420d8882bd@thorsis.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240828-gainfully-cringing-2f420d8882bd@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Alexander,

On 28.08.2024 09:55, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Fri, Aug 23, 2024 at 05:29:44PM +0300 schrieb claudiu beznea:
>>
>>
>> On 20.08.2024 15:17, Alexander Dahl wrote:
>>> By chance: I don't have a sama7g5 based board at hand for testing.
>>> The datasheet says the same as for sam9x60.
>>> Does the nvmem_microchip_otpc driver actually work without timeout on
>>> sama7g5?
>>
>> Yes! This should be because system bus is clocked from MCK0 (as mentioned
>> in peripheral identifiers table) which is enabled by bootloader.
> 
> Not sure I can follow.  Citing the SAMA7G5 datasheet section 30.4
> (OTPC Product Dependencies):
> 
>     "The OTPC is clocked through the Power Management Controller
>     (PMC). The user must power on the main RC oscillator and enable
>     the peripheral clock of the OTPC prior to reading or writing the
>     OTP memory."

I don't see this in [1]. Only:

"The OTPC is clocked through the Power Management Controller (PMC), so the
programmer must first to configure the PMC."

From this I got that it is about the MCK0 listed in table Table 8-11.
Peripheral Identifiers.

[1]
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7G5-Series-Data-Sheet-DS60001765A.pdf

> 
> Table from section 8.5 (Peripheral Clocks …) has no check mark at "PMC
> clock control" but indeed lists MCK0 as main system bus clock.

This is what I was taking about.

>  If it
> works on SAMA7G5 without explicitly enabling main RC oscillator, then
> either that clock is on accidentally, or the datasheet is wrong in the
> OTPC section.

Might be.

Thank you,
Claudiu Beznea

> 
> Personally I find the "clocked through PMC" part in the OTPC
> section suspicious, because in the peripheral identifiers table OTPC
> has no "PMC Clock Control" mark.
> 
> Not sure what's the difference between SAM9X60 and SAMA7G5 internally,
> though.  From a user's POV it's possible one of them requires the
> main RC osc, and the other does not, but currently you can't tell from
> the datasheets.
> 
>> Here is a snapshot of reading the NVMEM on a SAMA7G5 with bootconfig and
>> thermal calibration packets:
>> https://www.linux4sam.org/bin/view/Linux4SAM/ThermalFaq
> 
> Greets
> Alex
> 
