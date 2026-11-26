Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669855;
	b=vxH8tRG7MWOllLVPvejOhT7F7z2XJh7iYd3coazUt2QPpjMx1nVsJ9xda5IXovejyDO0
	 EvPcZQqFatNLS2la7emnENZtrs4YoLiKw3aLGTK391n4WgwnSz03jpobDANm1Wx9lHxuV
	 duCFfqCOPj1RQorkV0A798hkhjI3WHRl+CoEUiUdvho+dioMOKxPCuZ8ZX8a+hGSbwxfw
	 AJTeew5MJJiOuXOaQxpRZTKrt/2Ulj91sgbyxI/oj/3vYm+7s56InGGNAEVEuUIouEqs2
	 d1/Gsa2xi0Zu8p2q9/WJKMtQ7dnGkx3SZRL7srHpB9moxhWLwTYIx3kdp3yLkXSnbVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
	b=bbGZXHZhbtpW9o5QFougxdJxE97/Vq0GJRhN0CEFgYUQw0lXCi2owzGS3Dz+2wdFC9Dr
	 lwEDWiRWcbttKyOLvqdeQd8MbiK/cm5pK5uirpLYk9bWk+IXqiOYFQp0XsAANuwPRPpIH
	 phJv6MJ9U33CvoU1Q8AjtShEn8xy1RLY3SOvv4UwwuBsw5amdlgHf46bY5LKBgL8oyR0k
	 qD9r9wURU8kpKQmw+u8gGKx1VySByzwUqM1Czx4ki0ESf4Nl9p8k38WK21IynUKmRh9mH
	 1kVn1N2txXVSF3Sc6Fx9o02rkuLnAsuBoyOkvSFjWvz2egxVwbVtctsvA6ysoaW0PpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=koo80xtt;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E69606A326
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 05:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E69606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=koo80xtt
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so15441c88.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795669854; x=1796274654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=koo80xttp8geMgFWEU8bag5Cp8NMbqNHiK7kwUEroiZTZ29SdBiyGGotzYoiu33bTa
         UwY/ptC145WUKHWBA3x8fQXypO5iGoJWBzrQa2siyDjf6QleJy3SlzLiFSjtpNBjWe/Z
         5w6olFcNx37XXa94u4v/C9gbqIJS10mENTxBmCudh2SAB1iuNImFNr1XQSZ8dLWcLzo5
         s7l605ESWnqrRYxZNVLgRDqQsYxX2Cxxat93m6kGhcp/Uy8bb/OB3gMKYEi5VufiL8S4
         cFavEYRuNUHr2c943YG3QEsDfSPrMUyN8QHZKiCv+91BrB/EXTtqOaUvAomAAoKij+mg
         cwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669854; x=1796274654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=u/+FW2afCEOcJb9bJPp6b6fOL+POUqMxG8Fg4AIagQWFRusuw8bhJWgWgdR/tD+k3t
         ACF3HLISlmEZVan4/gfjWDSqNiaKwDUiaRrHct3LuS/9Zr6ZzwTZBMbRg8OnhpPhk0ly
         /pcKOeM6od+RP6E+RBqvatbelcJmbmxEYvB0qG+l/7mjJOc34PsP9NuS8nUtwEvbdfGc
         X7+5jDjOWeMfLBXR2gdZZPmhLcOj+DfzGWA9lUJ/y6eoUmmkBGj6rXXi2kwnRqaHN3el
         IP28TPDWaESiwFZwQShb8kV/bJcSaGddrC64J5mpJ3bNLBUETWQJAQftfRTtYkqnD7Md
         m88Q==
X-Forwarded-Encrypted: i=1; AL+hErF9OzUXO9twSNt3ttaUG0tDFe4/TidqlwfLl8PA33RzL50o/8MA41HDwmOlxsaGeRYazZKxBxfmleg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tLD7vTysJgHon+FC1jhv2rhdGp05AaZ5UJXPTEi8VTElifRY2
	lfKVeLmxo62hBtdo433XciYia2ENvn1dOrtmwbMh74a2wqBI5XbRffeA+Ee7Q5Q4tnU=
X-Gm-Gg: AZFdTZdROI9L2ZDUGK0rwTfj/but04ak/EFU69U73UixOTpyXJ5DGhhKwGhrRM1HWvb
	XoHHLrEvG4oFM3xxZ+eTO3MhGly04T+QlC+SMMgDp66KU+N1djhpijxHQVyDFwvjg8rjAZvbJyV
	7QuQ5dutFyiUpolIChd4kys7u4zP0NskYMMyspTppclOLtHhN+JiqqsS0d21opgZUuENele0Bx3
	ubj3s1mQKl46+c+CUzoK0COaSDq9exM1JV6bp6uprRX5GtEFE3HFz7QCX/kaGjDhZJy1Q+AapwH
	E6uEKlmlB2XoQGfuTGvjlcJxnDgLCDQvb1t9LYTOw+FMXs/o52AFaPz6ErRUuWVJwRUvk8uuqzL
	SLD4cXLrmHHapgGasdslBsW6YwQadB5VTRS5JF/Rl1aE6kEfZPAeusaDjP08LixWcOciLPW7L3A
	HiDlkgzVGA0dr87TSnwCsVScDiHIFjjGjlbWVhYzC/8vpZVNLr3nBi3JhBwKcsA0fam+CQlipdu
	EKM5ZCGxtyProvvprICsDtvpXI6lU7LsnpOgT/z/JbFB+h7jbnqUMJRxzv7qs0PU5bSSlFdhKr1
	o10IrYrIeRfspfqS+BC3Xw0T3hTBpg==
X-Received: by 2002:a05:7022:3f07:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b5567b5685mr22918571c88.3.1795669853936;
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm38643650c88.11.2026.11.25.21.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Date: Thu, 26 Nov 2026 10:40:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	christian.koever-draxl@student.uibk.ac.at,
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
References: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>

On 23-11-26, 20:23, Chuan Liu wrote:
> I have already completed the support on A9, but cpufreq-dt currently only
> supports the single-clock case, for example:
> dt_cpufreq_early_init()
>   ->dev_pm_opp_init_cpufreq_table()
>     ->dev_pm_opp_find_freq_ceil()
>       ->_find_key_ceil()
>         ->assert_single_clk()
> 
> set_target()
>   ->dev_pm_opp_set_rate()
>     ->_find_freq_ceil()
>       ->assert_single_clk()
> 
> Both of the interfaces above are limited to "single_clk", so SoCs that need
> to adjust the DSU clock in coordination with the CPU clock (such as SM1, S7,
> A9, etc. mentioned above) cannot directly work on top of cpufreq-dt.

Have you tried something like this ?

drivers/ufs/core/ufshcd.c:int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,

Finding the right OPP should be done based on the primary clock only (right ?),
but configuring multiple clocks is possible via the OPP core.

-- 
viresh
