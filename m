Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0821C389DEC
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784686290; cv=none; b=J7/r25Kf6yYP8Q8+W9zjfY3g49WNTshnAlfevIjekkopmns/IAkHcKoC/6CuBlD2jiI18HwR4YTFKklfwhW5qAw5L7UUPrKOMsDiZPaTaUv/M7pmZLxiesJdroJAA3tJoF3A7pjdrtXFF+i8p5D9JZK2M3ZwCcPpIa2Rq8w690Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784686290; c=relaxed/simple;
	bh=bDg1I0PQLpqr58TwSZoe8+f25QsjEVriGgQZBMESPME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9m2RcPtSoKgwWuNOXXTbRbk4XVUdSYdyTii65RZRm+UJyTdoC7lVrMf9gTp78OzKKqHXX6RxAQX3v1Opm26rsnexhZEMR+1EVwyv9vOj6Uvg3OP9ZMVRZftsSaUGbN/OCzPhIUufeBAaCKXBBfIXyt0I8ozHubf4UHtpWhclWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfyavgI3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfyavgI3"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceae1ed204so100441675ad.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 19:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784686287; x=1785291087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQyOfQXbnYj6ZzvJDmPQehiLM53DzmWyNve2eoR+Jew=;
        b=kfyavgI3crSZge848q2Ri3ynytqzNK0+Pt5NQwptFN0GQY833iRA8mty+MArHq7ABg
         sYKjuwqUOBmOemHn+pZlC3ORtj+2MEQc3vTShu/2PCvtIGrDpSWZzIXxf0Xfc9ev3LO9
         8dq+Mx+DgojF9MZVuAjcIg1wsoT/lZamygF27kAiOta3JpHomwij/dVHxx+rEuvSsMLF
         6vPoDd7OFDZ1OdYGDsLepAeee+WLOe4mVqsO3BJEdWkXzzWPfvH9JFhtPG4HVsfHEp9m
         zpXmyjOGUYUMnVIbP71Jd54kWZ5oGw9bkaG7te+zXsi4S4937eknmy0v6O29DmjI8sq6
         UunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784686287; x=1785291087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQyOfQXbnYj6ZzvJDmPQehiLM53DzmWyNve2eoR+Jew=;
        b=axvL1cULXIMbo+9ipcpHNHs68yBw8LlDDER4EOaLBlbKb4sR+LrP4B0E6i7GxhwmET
         F6AhnCHN515Y042vuGCtBKPYxgRscKlHRwVTrIb4LSosy1kmSgMZFuzqjtUcDf4IcDw/
         7hI8lMW5fLLKE2lfFq1h6SKAWLv4GJM9ggLIyCGkeBSdNEsajsDK/uEP4iTRVaz6g73R
         aAsKw/nbTIAFWtUKwM3iSV5FplMTEEmStJVe8YNJs5XKikmKerxBlzC1CDsmVxQT6V+m
         BNeYMJOtN/v6X+j2SHmnLy2mYhIcodsaGG1Lc//omNgsRWDu/2pAYf3p6FLFXqRBNjOX
         OlpA==
X-Forwarded-Encrypted: i=1; AHgh+Rop1JuERx3e39XRTwmjSY/EUnKXidJDX0XooX4a7F3uqx/wHWYls0/GvCaRMaLdTvQrU84PMY5eoGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbOYMs3ikWgqGSv/SDQTeJbZPN70Vtv37mDuyrgNkZDRhoueGQ
	pG1RvsdccCHT0jelS96MmWqlnFtk1QSAkHT6MvpBAanFuA2X0ZWuhgvt
X-Gm-Gg: AR+sD13OqKcW5n6eFSlEsEKzgOw6Ms7JSkL6BZgKRz+v7uHQxP9skPHJ75c2Iy04hDa
	NO8kvlWOtg2/X7kTZ7ZBvzSM3qsWRJbk1AlBOBq5yr9ANO6pKP+wsMf4eTsnkCVFpi29pXMD0Vh
	/qFAH6ALK35+crX7Zfu+ExeMeZvieuVvxgqh+0EyYas0KgHtvcy0JYhpuNiNmjryDYNsEP/NitH
	D29PlV6vIoki8YjbkaUY8gJWouTnJddFeBxgA/AVwFVQXokSZG1HehGfNxZ57qzln2SAtrPyORo
	K6/KiluhRWknF2sp1BLYEaHX9dqsjNLTSRLTyaVOBIzDOjmiJem2TL2oCGNl7DQQNl8K3x54c/f
	V+aQz8YYXv395klDpNv39xxN9qxNjPYMxLRBGqwPRPhWumsmYReOChmT0bnyOAasO6R5DQpEcBA
	HxJ+HqopPPgJ73EI+p8rfhycs0dRzJ/2MmTmVtIWSbmO5hyQWwztFzQw8=
X-Received: by 2002:a17:903:2441:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2cf3499c666mr239515785ad.29.1784686287176;
        Tue, 21 Jul 2026 19:11:27 -0700 (PDT)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76c4sm6011695ad.23.2026.07.21.19.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 19:11:25 -0700 (PDT)
Message-ID: <0fe05124-b9d6-4f04-a56c-02911bb77408@gmail.com>
Date: Wed, 22 Jul 2026 10:11:20 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] clk: nuvoton: ma35d1: fix
 ma35d1_clk_pll_determine_rate logic
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260721021356.288506-1-a0987203069@gmail.com>
 <20260721021356.288506-4-a0987203069@gmail.com>
 <178465172376.2337945.14489744680090859988.b4-review@b4>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <178465172376.2337945.14489744680090859988.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/2026 12:35 AM, Alexandre Mergnat wrote:
> On Tue, 21 Jul 2026 10:13:56 +0800, Joey Lu <a0987203069@gmail.com> wrote:
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> index eb9d69d2077b..c7c0dc91a012 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> @@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
>> [ ... skip 14 lines ... ]
>> +		if (pll->id == CAPLL) {
>> +			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
>> +		} else {
>> +			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
>> +			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
>> +		}
> Small, non-blocking readability suggestion: since we just switched on
> pll->id, re-checking `if (pll->id == CAPLL)` inside the merged case reads a
> little redundant. Would it be cleaner to keep CAPLL and DDRPLL as separate
> case labels, mirroring ma35d1_clk_pll_recalc_rate() just above, where CAPLL
> is the SMIC-design special case and DDRPLL uses the standard calc, and share
> a single `req->rate = pll_freq; return 0;` tail? Roughly:
>
>      case CAPLL:
>              reg_ctl[0] = readl_relaxed(pll->ctl0_base);
>              pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
>              break;
>      case DDRPLL:
>              reg_ctl[0] = readl_relaxed(pll->ctl0_base);
>              reg_ctl[1] = readl_relaxed(pll->ctl1_base);
>              pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
>              break;
>      case APLL:
>      case EPLL:
>      case VPLL:
>              ret = ma35d1_pll_find_closest(...);
>              if (ret < 0)
>                      return ret;
>              break;
>      default:
>              req->rate = 0;
>              return 0;
>      }
>      req->rate = pll_freq;
>      return 0;
>
> That keeps determine_rate() and recalc_rate() structurally parallel. The
> logic as written looks correct either way, so please treat this purely as a
> readability suggestion.
>
> Otherwise,
>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Thank you for the review and the Reviewed-by tag!

Agreed. CAPLL and DDRPLL will be split back into separate case labels so
that determine_rate() stays structurally parallel with recalc_rate(), with
the shared `req->rate = pll_freq; return 0;` tail after the switch and an
explicit `default:` label for unknown PLL IDs. I'll include this cleanup
in the next revision.

BR,
Joey
