Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF4F3254B3
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900978; cv=none; b=nwHofTBptmBS7ltWqCIS/sUQisLat/0507h/lLxdNjcXSjp4rXuzPO+lOv/OsPfnJKLTNBjvUqKqKBTuZZsE9dqtoYPhqXaPSt03KJW244q0jYAoChkDFoKyjuY/kE/Nh4fP3pnWyYoEwa9XA4LLuDZD4ix2uWcC01bKdr2cJMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900978; c=relaxed/simple;
	bh=U+Fhokqsld89/prmQ38iiXuoWgeyBeHgBGz9BsjBr5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nxs7suWn5Ks69b7sq41Jtg43P6tJjsztrmjJq0EHUz4uvseBlLx/+vDedWj1Ioz43bCOpB3JydPT1rO1hW9ApOydKdq7djszlctumjwchvPuwZ8vEwVLfGA/LuTwZMBN6d2f0BxtP1fSwyOEko/MxDLxEoA6icgILvr8PR2s2xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=elX26ywq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="elX26ywq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso22852345e9.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791900974; x=1792505774; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gpLoap3mLnOjE0l+JjLkf8MVGmqbBhtoBxXKIOij9c=;
        b=elX26ywqpoTjt7RY73rDm4/jb6qfI/Ys5r8OG5w0RxEhF1EUilNvwILQaxZoVmASvW
         yHMCnCE/QRDc4QY9piC1KU7+YZIhDxzsp8zopmj6RiawbRL5dWb3g5mALmqPyyD9buJr
         mWZipVdWfi9DqbqLZQ4rciz4XmhPmWXKoC934xCp3BSa23C2TwRfC3/IU1Px2LdNROrl
         N77UnqgtIkyrbugymDmKrcX4InSi6/e0zjRLjl1VzjsP8dtFDGUBzaetl1w69EuRPV2e
         d+mXnCvWD7TMWLQjLP8CpGNs+gTj+X5ZHl9aDnBu3PXxzkuS5wXrEzgfHxrXy5X/4xzy
         s96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900974; x=1792505774;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gpLoap3mLnOjE0l+JjLkf8MVGmqbBhtoBxXKIOij9c=;
        b=i4jHHbq4iXvbhvsmmEv06c91/dr5gCYk2p2dNxPHIHuDgcGhZ+aVsLSZOR7Jhy2Fcx
         1lpV+s4GWu5qafjMvghm0W6VCgMd/megz518R6pCaa1BLDqqoO9bnjcopJ1U/OaTqmAT
         7DBqgdT2ucQIaZlJG9cR2H+r4Nzc/lpmm9gnKYfHGwojbJHjByqo0CGvfFUTekilXV7J
         UN81toF2WNHijmggmhcRe2Cp5TTKxrLcqbZbycycfeKDbZByPz4i3tehtYgDuAmT5Q5I
         nTAKmg3aaAFvhtP0tA6djAmVEH96rTZubcOLjOvpeh6zeyKeKxKwCN8lmspbVYHqQBIS
         9ILg==
X-Forwarded-Encrypted: i=1; AKwUvByfcGjxlIeJxBseFp1f5Glpzx0KTFsx/7f1b5cQ5mpbXG5RzFKSxwm1lAkJ1CaZEFemx0rT7Hr4erg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7Yb7Jp7cprCUxEgIdqezjBDKv7qcOAkGoL3tH8hnmblHjrm5V
	Kq3isXj3XjuHsMqZg6WXs7XrkDl74kQDKZozbG58/lRc7MMndoxzk1chPTqPmCjl2Mk=
X-Gm-Gg: AYBFou1SoAlJMf8Yq1GsLeG5QbOfE/whT1eONVaSIZRqkCyM2PiV+gXdPkUJniidxgj
	sRhLVpfPBM9G+z6ENh20lu/y8BQtcO1qRrf7Mw5AEgIPt/yQNcOiRGOTHooaYu97V7zJ/Youn32
	ZCDd4sqUXPZmON22Dd1l2HkxtCQQtpv4S5wYUfYgEsMQasoaWSLuSr4URybqPjZYYoXm62KpRSc
	6aaoWq2ukP3ziDrot9cgUKPUsaS6OlkA2AG8HvbHG/2DO/QBDKBAUk4H+Yyyqk1VCs+oRIbtVYp
	x0GhVC9kbI6Yn6u4jV853tE9CApyEC3srzYZpmdi75T+AiO8A4dJ7fpWcsw3qjairnGm7FF4tQa
	pBTGb/j/E3MvX7RhQDqZqw/+QhKU85y0j9mHVHVckDMPffy0RSAP3S75WK9lCT2bcEi4tP0TNp7
	oxIIOaxGOJpmWj8+bUgsaCuWqg9djjbp71GR8GzbC+2UDlrpWuhF6sPKfk7hhemcIdkx+DIYIX1
	lDKrpoR0iqEbQ9rkvEe+B0Uvlsl
X-Received: by 2002:a05:600c:3494:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-4a18e4c3f24mr255487415e9.23.1791900972538;
        Tue, 13 Oct 2026 07:16:12 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm378177585e9.1.2026.10.13.07.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:16:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>, Daniel
 Thompson <daniel@riscstar.com>
Subject: Re: [PATCH v3 2/4] clk: toshiba: introduce a TC9564 SoC clock driver
In-Reply-To: <155e6870-db07-4d28-af36-9b570280fdaa@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-3-elder@riscstar.com>
 <179183220207.266355.11690534397452731561.b4-review@b4>
 <10007ecc-3604-4c58-9da7-f056dd4355a1@riscstar.com>
 <1jtsmq9j5l.fsf@starbuckisacylon.baylibre.com>
 <155e6870-db07-4d28-af36-9b570280fdaa@riscstar.com>
Date: Tue, 13 Oct 2026 16:16:10 +0200
Message-ID: <1jwlrlfzyt.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 13 oct. 2026 at 08:37, Alex Elder <elder@riscstar.com> wrote:

> On 10/13/26 2:03 AM, Jerome Brunet wrote:
>> On lun. 12 oct. 2026 at 14:59, Alex Elder <elder@riscstar.com> wrote:
>> 
>>>>> +	TC9564_CLOCK_INIT0(MAC0_TX, 7),
>>>>> +	TC9564_CLOCK_INIT0(MAC0_RX, 14),
>>>>> +	TC9564_CLOCK_INIT0(MAC0_125M, 29),
>>>>> +	TC9564_CLOCK_INIT0(MAC0_312_5M, 30),
>>>>
>>>> Are those really just providing the oscillator parent ?
>>>> That is what they will appear to do without a proper recalc_rate()
>>>
>>> They are fixed clocks that can be gated, but their
>>> rate cannot be changed.
>> 
>> It is not a problem if the rate cannot be changed but still
>> a consumer could call clk_get_rate() and change its behavior
>> based on the result, so it is better if it does reflect the
>> reality to some extent.
>> 
>> Just add fixed_factor clock elements on the path of clocks
>> where do know the output does not match the input osc
>
> OK.  And because I'm not sure whether it matches reality, I'll
> do so in the code, and not expose these in devicetree.  (If
> this is not correct, please say so.)
>

I don't think the DT folks like us messing with the binding IDs (Conor,
any opinion on this ?)

IMO, just do your best trying to figure things out and keep the IDs.
If we get some rate wrong, it is fine, we'll fix that later on.
It is even easier if you comment what you are unsure of.

What was not OK is pretending all the clock come directly
from the OSC through a gate. This is clearly no the case.

>>> Looking at __clk_core_init(), should I define a
>>> recalc_rate() callback that just returns the
>>> equivalent of get_rate()?
>>>
>>>> Their names suggest that maybe, it is not the osc coming out
>>>> of them ...
>>>
>>> We have requested a clock tree that explains exactly
>>> how these clock rates are derived from the 25 MHz
>>> oscillator.  They're all fixed rates, and although
>>> we could easily speculate how they're derived, we
>>> don't have the documentation.
>> 
>> If you know the input and output, you have enough to figure
>> out a fixed factor. If later on someone gets more information
>> than you, they'll just modify the clock tree.
>
> OK.
>
>> If you no idea what the ouput rate is, at least clearly say
>> so in the comment so a future user or contributor can easily
>> understand the situation.
>
> I'm pretty sure I know the output rate of all clocks, but
> if not I'll make sure there is such a comment.

Great

>
>>>>> +	TC9564_CLOCK_INIT0(MAC0_ALL, 31),
>> 
>> [...]
>> 
>>>>> +
>>>>> +	clk = devm_clk_get(dev, NULL);
>>>>> +	if (IS_ERR(clk))
>>>>> +		return dev_err_probe(dev, PTR_ERR(clk),
>>>>> +				     "failed to get input clock\n");
>>>>
>>>> Nothing is using this. This is not how you set the parent. See above
>>>
>>> It will once I have the clocks get properly parented.
>> 
>> No it won't. You don't need a consumer clock reference. just drop it.
> OK, yes, the parent(s) will be specified in the init data.
> Sorry for this, and thank you for pointing it out.
>>>>> +
>>>>> +	clocks = tc9564_clk_init(dev);
>>>>> +	if (IS_ERR(clocks))
>>>>> +		return dev_err_probe(dev, PTR_ERR(clocks),
>>>>> +				     "failed to initialize clocks\n");
>>>>> +
>>>>> +	/* Force all clocks to be initially disabled */
>>>>> +	tc9564_clock_disable_all(clocks);
>>>>
>>>> Why is this needed ? In general a provider should never act the provided
>>>> clock on its own. Let the framework deal with the used clocks
>>>
>>> The intent was to start with everything disabled--a known
>>> state.  Sashiko pointed out this races with a user that
>>> could get the clock right away, so I intend to do this
>>> by initially disabling all the clocks before they're
>>> all registered.
>> 
>> We do not do that because (in general) there maybe devices already using
>> a clock provided by your device and setup at a prior stage (like the
>> bootloader). Doing so would break them.
>> 
>> Leave this alone, the framework will disable the unused clock for you
>> once the init is done and most devices have probed.
>
> OK, I'll drop this.  Thank you very much for your review.
>
> 					-Alex

-- 
Jerome
