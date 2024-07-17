Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241517F4E1
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721214666; cv=none; b=VdSFMa5XvBsBHFggBK8OMNq2Ty8dhdJFZBJ2HVoo/S28p8hgY0rjo+MsJ0aEMeifZpVZChnClmha5TBtQVO/4lJ4r0yl700+9fWT2QJE9sDaw2KYvXH5UShjuMAIJGeO57b33bA3xPEkpqDuiAfn8SRWqzWxNMzlW7LiDjrLCz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721214666; c=relaxed/simple;
	bh=hhutUiK+ldZmbrgZE8Dzx0T70pv9+3yHYglk4hnsQuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOtUQJh2vyRwlUjbfKpbzbGOkPc/fQB0x0oiPf6zoX5kfCRyiQXm7bfg9yQFSYvjnaUgYcIj0iJYZqa0oV5Mktk3XSf/b+pHEx731kiivuXgQ1UzBGNH7ceVgCBZVU9Xj0Ja+cedg0J3X1Qm9DmeoeoAuqb4dNVaXKNCp9IgBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sn/9Q3tV; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sn/9Q3tV"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58b447c519eso8709728a12.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 04:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721214663; x=1721819463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OdeLjPoqRmUlYr25okuYc8K1yPtbJFc4x5bOz0ESpo=;
        b=sn/9Q3tV2y8D5NljrD1M4k5h51yxGuYK2ztENjPHvWgCCLDaWxsmclqb3sfwIj4Nvn
         cKDiOWg/A7CxC2n0ALQ0tySOE+uLARTZNWFTwuFqOo05aCMzgV+kaMUMlv7BRuqxWaw/
         k5B0sJUXSPiDXu/RR2lCxjN+6IWRa9JSqP45rrNsHQrNsHWs7yqmRWkABHjfIlQpS7OZ
         2A02PrQFIxjIzzub+h1eHcTHG6D5+p5JmH7aE3Sb+R0YeqtfcIrcIpMBDQbISd3jXr9f
         GTU+0RBfdj6Tr68hu9sxARmTbbtL2hqMMyBM9EoVpQyAAjvrsYVcThZATmfY5O+zu//0
         JLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721214663; x=1721819463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OdeLjPoqRmUlYr25okuYc8K1yPtbJFc4x5bOz0ESpo=;
        b=gBIJ8z6aKfOEEfhnyywDKLjCD0Wfa5hClbPg7xPrAhR5e5DRRhnRFzFg4Jo4Mm5kj0
         JXU9h7usCtNG2439iNul2/f8mIvJxHlAVK9PQkBaAlydJnsiZF+K57wMFwpxe5U33kyU
         s5OkLXaEfYIGUXdlfSneMOtVmfpxKU6CqMo6dKgwRz/lxZ7QdRWKFlRTDRoZ2QFfaJr1
         HGyX9dZD8Z/acisKBk5WHlhfVpSQs+DBBlDziDey0cAEU36kt8Ldrjhb/COgnUDdyo0t
         XQBUA8DYxnDfywkrCqBA/R+IhAzBKe7jIqsGjDnQQTlW0sYJtVmca9mI+maf2g0DOZRd
         2RUg==
X-Forwarded-Encrypted: i=1; AJvYcCWfVKF+Qnv2Q6AjmiEib7wY2yBjQHjzx7elOMQrRYsLhJYFz7CRr7P+ejs7h3hn9CpyA2kCCvXIB3RiuYXUZPuK/yKoalp/iBCA
X-Gm-Message-State: AOJu0YzZtijzyjOzQVQMf7psAlLqlaB3Gmv35LTSv4o8cOPUR15YZBYA
	tPRjPq5WyO9XyylUafkC8YTXprWkdkWXA+L8ALAyeb/WnarfhWSvMT+Gqb3aLDI=
X-Google-Smtp-Source: AGHT+IF/SD5/dNu9jj11HFGPBp5Nm6wXSVMHns1m4v4DrAtWWsNwrOpe57aeSit2bIQ3BRxkaPO4Ow==
X-Received: by 2002:a05:6402:268c:b0:58d:836e:5d83 with SMTP id 4fb4d7f45d1cf-5a05bfaae65mr1337759a12.22.1721214663479;
        Wed, 17 Jul 2024 04:11:03 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a28e8sm6733080a12.63.2024.07.17.04.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 04:11:03 -0700 (PDT)
Message-ID: <ce14800d-7411-47c5-ad46-6baa6fb678f4@linaro.org>
Date: Wed, 17 Jul 2024 12:11:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dmitry.baryshkov@linaro.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
 <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
 <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
 <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2024 12:08, Satya Priya Kakitapalli (Temp) wrote:
>> How would it break ?
>>
>> We park the clock to XO it never gets turned off this way.
>>
> 
> Parking the parent at XO doesn't ensure the branch clock is always on, 
> it can be disabled by consumers or CCF if modelled.
> 
> If the CCF disables this clock in late init, then the clock stays in 
> disabled state until it is enabled again explicitly. Hence it is 
> recommended to not model such always-on clocks.

What is the use-case to keep that clock always-on unless/util someone 
wants camss ?

I've tested this patch on sc8280xp and it works just fine.

---
bod
