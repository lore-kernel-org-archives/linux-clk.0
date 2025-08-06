Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD5D25C80D
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476802; cv=none; b=BpcyEsQmtvCd26Oka2mPf9baoVUOaPLwphKZjn3gMF9EDPj5iagnoeOE+EtAYgAgsUmxBLW2D1c1X3cdlJkF8FcLpihkZ9Iiy+SpHuQRz+rzWnIMDuU1ppCz4rfrPXyCNw8gCo2h0QOCqOyPYIhghzo3YE6yKZI2BOkBKhZ5tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476802; c=relaxed/simple;
	bh=TX2tAJkEQZa9XTS0GPqnY4OvS1tTNgim1be15DkJGB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chCIxt3jP54YtKKMiWmHEA+mMvgdjxPAh5SGlD3EO+1jS/WlvGljDxzcvCF9SuXIt5U41AE49E+JCOU12R1j9K4bLaV0keV4h2eRNFER0oXl7QgZNG8eKu4aRFmhW6cmIWqIWPNdJUQi8aFe0Ga+yvrRDjoAt/75Q6p4WaIArHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kSDSihro; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kSDSihro"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so8781116a12.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 03:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754476799; x=1755081599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=titscQ6aOjVW0NGtGerXnOmFu+BatzV4STGkNMkUG44=;
        b=kSDSihroNU9KLyb51iEBR892IPwE7QJaHnMmI35eTT65DPrxY3zb4QDbJc+DyrCY4Z
         V9GhntQslcDiIEOJ7THreD4U0e+vpjcG7tS2/0ZYfgMKI8drTYYUPH9RsJuCAxDz/CPs
         Jrpqr4FHGIwu7iOi/6hBJO19Np3YIB4DtlG6mQzy/Ch4g2DBWKb0zOu5znUFYskVKveT
         gG26h1FmUEZ6j6z3qwgjIiOnzGZquCA69FDnAn+SiMuBN2z5EZpwbkd2EZB1f/EweuE4
         PVq3kYXUgDXPj/jiX9bmvxErwSspLGYaJfz/VvVdMu3BQHGdNzASE3/Ba4IgrnzOYvN9
         Iiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754476799; x=1755081599;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=titscQ6aOjVW0NGtGerXnOmFu+BatzV4STGkNMkUG44=;
        b=wCfYJyG92PNSPG5JiUezr3FIBCRx3ODAPqPXTA1DGE11He5hQKG6yfuj9JL+CxPl1R
         0balvzQ2iRuKU4wAdCF4G6xUPzXj2O/vL+4ZKFBWRCfYhnqWu/G+KeXws4XUk4HM0qrH
         Ag89rxSUJv7K97IVoF9/gSPkDt1xbTYfuUq6EVAqW+GQAhUSGqtgDoZrgj/cZDNO5Zop
         74WY/DWaWnkQXxVVhlkHFVmW8InsfPv2G8pYTzbUJCLbYbsgkoNVbR8w2Ci6Rg0q/NDE
         MZBPWwt5R9xSBl6h4dbzknd1Oa9GvdC/DW5KutzZL3lx9X2TYFNYsPiTI34RupguiW0p
         8KwA==
X-Forwarded-Encrypted: i=1; AJvYcCWVfeM6oImpO9Cj+VW0TvPBlUOSZWnhWJ+NKnVgf5sYVNGwgsHJ5N/0Y7m106IrBjytlEKtbjl+CR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjz2V7BLDWbCosbWrc6w1hGaIfV4w/1/WQXUB/U4nPCJwL3/R
	Ha84vcHhcPa8tFxmL78WNHZ7nvQCZF+Kq28IQSLQW8oZR5oR0U5fjD2q7t1F87pecqI=
X-Gm-Gg: ASbGncsHxIIg1QlI0c1Yz/Hi4hB6+CRZFNDQb62asBvNkCThI6tLVQbh3M88uKPZ/nU
	4uU+8HVOLqd5ZIQMMOzdi+UR4/xZmtUPejGmH0LGNCHydHrvGlyqjkt4i9UyzNeeNzFRjo1ikGN
	yYyARqOKX1blnF+WDRoVWqYs9uHhoz0adGc3QGXIVx4LZ/KjjZL41mVwjz6yXxp+EyN3lmHQgoq
	EkSPBLERH+OnvwmW62SB0OF19yEr4FbXEY5coChrJRclPa4EglTuQSMVdNu/5ubC0VtpQjhlN8C
	2hO8fpIi822uMDUBrITUYxDf+mOll/fHbf6dCM6Gmm9xWGWyc6TavTBokyKLY0XwB9GWR+4sFzV
	1Itz22fKhr5vJ/HJFExSWBOjRvjh+gNApFmVbW8FwuQ==
X-Google-Smtp-Source: AGHT+IHqnoMWs0fFU538b4C2IwDWUyKcR2dFyHunG3+0ppcR4vMBGndqEfDbUwOBbxO3i0Wbbgx9Zg==
X-Received: by 2002:a05:6402:2692:b0:615:5229:1d61 with SMTP id 4fb4d7f45d1cf-61797c96ac8mr1865037a12.3.1754476798802;
        Wed, 06 Aug 2025 03:39:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm10089403a12.25.2025.08.06.03.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:39:58 -0700 (PDT)
Message-ID: <3134db13-5fd6-4cf9-a8d7-97a5a39971d5@tuxon.dev>
Date: Wed, 6 Aug 2025 13:39:57 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
 <20250806092129.621194-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXtdgxX3xVALj2t1cOQ7+2rEA3x=J=M4VkenMdqnHhNag@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXtdgxX3xVALj2t1cOQ7+2rEA3x=J=M4VkenMdqnHhNag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 06.08.2025 12:48, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> Thanks for the update!
> 
> On Wed, 6 Aug 2025 at 11:21, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add MSTOP configuration for all the module clocks on the RZ/G2UL
>> based SoCs (RZ/G2UL, RZ/V2L, RZ/Five).
> RZ/V2L is handled by r9a07g044-cpg.c, so I will move this comment
> to [PATCH v2 2/4] while applying.

Thank you!

