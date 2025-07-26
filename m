Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740722E3700
	for <linux-clk@vger.kernel.org>; Sat, 26 Jul 2025 12:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753534676; cv=none; b=PU5TCZICfeFBZ2m+wvfxY3wJjNy/biqDjILyaJ0ZeVFB9R2b6flXcT/XZrp7J/wApEnV+2zpO5k6F4tpW3V83VY44fWMbD16Nvq/pnQCduQXFl1MBMCNRTj69N4PTK5/4NN/48xXGESbsz9wa29DqmL1ZaUl1lqL2sYolRUqJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753534676; c=relaxed/simple;
	bh=2lFsjqaXkY+9lybBw6P/Zhy/kr8mE8D11FVC2cE4RlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3hq3DeFGVEaGn+8zSRbeF2X4va2QzzaiflI3e5WQ8X2dHKFuNixus+fis9p2dzEgdyPgrhdMXLxFFpyW47rf22jLF2noN+UrdO8cincuBtH3xByGrcUK6XZWF9P1G4Odzn45HsC1V6wUxgKiw8jNJt5iXfFVGo0fDdSwuSBQQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=dHuwALo+; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="dHuwALo+"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fae04a3795so22767066d6.3
        for <linux-clk@vger.kernel.org>; Sat, 26 Jul 2025 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1753534672; x=1754139472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33vHvGUYy2jUaJ1MFRxvGoPpdjPDXIobpjBWzBoYSe0=;
        b=dHuwALo+IRl30+AG8DVuXqCSopMOKX4NympPpQNckDeM5QqozTqI2zwqdvD99V9NTO
         +CnpSBuB1o21pgvEnMh0Oda6OjsYwJec45mDjwMcy1njLBE+6NmUQU0JtxiIepQSkmpu
         kF6+ruhvKX52Tp3A5NjV7UvD/HX51wz5bTQTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753534672; x=1754139472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33vHvGUYy2jUaJ1MFRxvGoPpdjPDXIobpjBWzBoYSe0=;
        b=gpIkNYB/uD30/5Rt3iLE0FTRVMVQo82lIxYy1A0R7YnpzfcuU8c3NRvs/jvl/hC6yk
         6ktcUvE2w+vtyRWKHHKn4/3Eo7yj9PlogUL9v6HQVcAY5axVvo77bfV45aKgNYciwJxV
         MOv38HpQdnueLzDjgeZ3ta1FmGM3D1L0NYkzbNFheGDdbw/yB7JC8ostJt6kDTMqgqct
         Jh/ROgv8y1hvqX+f46G2KJb+HgNA0q0oAqkKkHf9sVnU13EmB/mrmHDdQZlR9TjYvTC9
         22n0a3O3kKuydjQtlICZYiKnu4zk36yZq1pvtfByag9y9K0PVpjTw+zy+bdKQxJE8AgN
         us5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMFYvkmQeeFERDYfchcY7rdN85M2pWEhpMqE96Rm5v9fmy3oHVZPog1HPq1fIROIbRpQEGCHSiiTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz32uQdIafRPCHOa7TrOS63pJF91nJMbqlfYdC2AY+qL6TASAqj
	I4vCroImfpyCj4lQme8wDI6BMvDOjE3SGO6CojsYIOFRt//dglI63H3hpCUTWEmbnw==
X-Gm-Gg: ASbGnctiYnEh+fh+ESBihJ7wRvfaKEttuT3ZNYPoYTmZTJZj2urHDyuu9kKDPGbYh32
	tVbhLEPQFC7oz6PaRBbLRiqTneWveefPDWDpMvvl5yMmfdVHaA8tD8MAW5dv08Cb3qMZ727bCfS
	Q6ZHFG5SrUU1aurZcv5l2oraPZsNfS17b2ZmgJjbgULJvRdVx14hsoYtRGybuEhmz5b4Y7Vo0Ua
	Y+pWvHROi7UjX20sTN+9PI7sIkqgmy8tYDav2BvPx8/ktfiYxt3ag3VVfTm1iVMOm42tmE6uY6/
	q+kj99reTbPa3oDa7VTv3itSBwPR0tQFJqmlTtuE/utinHOnP8WKI1zU2WNBrkeWj0qPbTGbc3y
	RsvgKVpT91tDVh3FiKVHpZQwxLWCIXcjKD/JJnfkol9FlOrFB7RjvdE+ulk5N+2snrQ==
X-Google-Smtp-Source: AGHT+IGb5AjxoFosxgBP3Pc/RtOYVIrHr0x3CfJjhlmHSPGuq16MvnncfHDH4Nbi3Zz1t72hhHOhFA==
X-Received: by 2002:a05:6214:268a:b0:704:8db8:d3cd with SMTP id 6a1803df08f44-707204e8855mr68135236d6.8.1753534672381;
        Sat, 26 Jul 2025 05:57:52 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-70729ad99d0sm10716946d6.46.2025.07.26.05.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 05:57:51 -0700 (PDT)
Message-ID: <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
Date: Sat, 26 Jul 2025 07:57:50 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, sboyd@kernel.org,
 dlan@gentoo.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
 <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/26/25 4:16 AM, Christophe JAILLET wrote:
> Le 23/07/2025 à 15:25, Hendrik Hamerlinck a écrit :
>> The function spacemit_ccu_reset_register() allocates memory for an
>> auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
>> these resources, resulting in leaks.
>>
>> Fix this by using the appropriate error handling path.
>>
>> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>> ---
>> Changes in v2:
>> - Properly place the Fixes tip.
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu- 
>> k1.c
>> index 65e6de030717..5bb85e32c6cf 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct 
>> device *dev,
>>       ret = auxiliary_device_add(adev);
>>       if (ret) {
>>           auxiliary_device_uninit(adev);
>> -        return ret;
>> +        goto err_free_aux_id;
>>       }
>>       return devm_add_action_or_reset(dev, spacemit_adev_unregister, 
>> adev);
> 
> 
> Hi,
> 
> I'm not sure this is correct.

I'm sure this patch is incorrect, and the original code did
not have the stated problem.  Thank you for calling attention
to this Christophe.

Stephen, could you please revert your commit of this patch?

Thank you.

					-Alex

> auxiliary_device_uninit() which is called if auxiliary_device_add() 
> fails should already do the clean-up.
> 
> So I would say that this patch adds a double-free issue and should not 
> be applied.
> 
> If I'm right, note that Stephen has already added a "Applied to clk-next"
> 
> CJ
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

