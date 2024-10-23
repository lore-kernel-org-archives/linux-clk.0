Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A1154439
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729691944; cv=none; b=gYheM+U4zGvB8YE75ksXabFU/niOYEfhJ05rajc7A2wOfY69YRMg1dsP4e13PTNilAFu4pft7d1nzmu2L3ZjqB2MgSUi/dGGd8OoVb9Co/0Q1Khfx8yaRI7qGWYqYWI/P44fYk6R7H2LY1NlUiXup0I4Y8BulpqnMoCOJ3x6xhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729691944; c=relaxed/simple;
	bh=Slk8kQY0Q+dK5QAm8fsYranSKEWAQVxmt0hy2Es3S24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TisN+c+x2UVlt9sNeplfXbCfMvs2stvCTAPGXq1C2O6rUBdbm0fIxzt35SfP/U1pqf/d7UNlfeq0MXr7z+njCA/0ko1UNJbVT22YD6L/SOKn37FNzY8pqx19TxHA02zl1e28SPcWMNbiZ3Uo6MaLVwK92JYSVO4EbNL1NQcy6oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez+Hv8/T; arc=none smtp.client-ip=209.85.219.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez+Hv8/T"
Received: by mail-yb1-f195.google.com with SMTP id 3f1490d57ef6-e2e2d013f2dso1870537276.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729691942; x=1730296742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqVsuRr75qpCi8/jFppUej7xH930LWk3HaDFMlaWCAs=;
        b=ez+Hv8/TuAYLcBkkReIEJS9+vqIOwe8sfbyvVwNTAJQ/V+OXXF+pIt22WHsxPrvlmg
         inc1TCtKCiYCS3xYcpE48UQBX4LF9p3IuM3jye6hRbujJDK5wxHAcoYQScNiSFAGB6Z7
         IW9K95ggtnO/PKuT+6+aOrZ15eRMK6hpUzrRXoRSgtLKB184mWMd+XfwGkWAns9bo0Bs
         24TR09x+kW2EidAllVuxMUuLNF72n4VQztUzuwMNY5k0cFNBmw/b/mYvZUZyLhqHBaqJ
         yeU58saqC3JxhIN23c0nO6QDAx53B1a+pgv8baeBArqxCKNQotyJuNLqg1NK58qIrS9D
         zoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729691942; x=1730296742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqVsuRr75qpCi8/jFppUej7xH930LWk3HaDFMlaWCAs=;
        b=hxqeA9EgZ70j+buJv/9Nio8wHQ55BIRfT/CccZ17Rirtcsy0sBio+w+148ZAuzlRjb
         RgirLJTbL60ihrikEcoKMHpA/vRU1HOxcSwnaeQBrGpHs1TIqQEl37q86O656DRpRlyl
         Rhlw8A2H4CynLtgZF/LdVSWnXVGJDkoGwpMsTs1Aw4rpCZh0rgm7axKrJBcgWItBpMaJ
         otFVFbIXSaTl0qHWeoe8n5dhjTcjFsByM6CWAdaEy1zP05jVJBZc5DRpBS8p651LD/Xo
         thERtjVImDhC6UwuY2z95JyUoyvV0BsrR+9/D/gzA+lLKAo5K+uKczPHK3SMz92aiMMZ
         FhJA==
X-Forwarded-Encrypted: i=1; AJvYcCWxxrUCRLT8uF2R4v7FsO+HFdEe73JA2VPSDwhI9j5AGc1GhsXirLRwgPMKUWHvAZdmZZqEnPEULAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vSJbVLjDJ6aVG+VQjV/65jEuJCo3yFmg7DYIzN26L1QwZaSE
	8wjdsK0pI5ouGuL+K3bfuBc/osvjCSfDFlUmncZq19tbwrKamktn
X-Google-Smtp-Source: AGHT+IFNEL9FmPxALvobgQSuAIYCGYgKxsxBlEt+k15dHVJixsKIZjrj8H+rd69TBSaXNzztBVEU3Q==
X-Received: by 2002:a05:6902:1384:b0:e29:bef:4931 with SMTP id 3f1490d57ef6-e2e3a6dc6bamr2105042276.55.1729691942377;
        Wed, 23 Oct 2024 06:59:02 -0700 (PDT)
Received: from [10.192.166.111] (host-36-28.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.28])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdc9b61b4sm1473725276.37.2024.10.23.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 06:59:01 -0700 (PDT)
Message-ID: <e40ee870-fbd4-445f-b1f3-d6f7806f6159@gmail.com>
Date: Wed, 23 Oct 2024 08:59:01 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: sophgo: Cast an operand to u64 to prevent
 potential unsigned long overflow on 32-bit machine in
 sg2042_pll_recalc_rate()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, unicorn_wang@outlook.com,
 inochiama@outlook.com, nathan@kernel.org, linux-clk@vger.kernel.org,
 zzjas98@gmail.com, chenyuan0y@gmail.com
References: <20241022201244.8992-1-zichenxie0106@gmail.com>
 <13b95ab6-bb38-4b05-9c3f-f567c32cc902@stanley.mountain>
Content-Language: en-US
From: Zichen Xie <zichenxie0106@gmail.com>
In-Reply-To: <13b95ab6-bb38-4b05-9c3f-f567c32cc902@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024/10/23 2:41, Dan Carpenter wrote:
> I'm sorry, I have let you down in some ways.  This subject line is too long.
> It's 126 characters long.  Please change it so something like:
>
> clk: sophgo: avoid integer overflow in sg2042_pll_recalc_rate()
>
> On Tue, Oct 22, 2024 at 03:12:45PM -0500, Gax-c wrote:
>> From: Zichen Xie <zichenxie0106@gmail.com>
>>
>> This was found by a static analyzer.
>> There may be a potential integer overflow issue in
>> sg2042_pll_recalc_rate(). numerator is defined as u64 while
>> parent_rate is defined as unsigned long and ctrl_table.fbdiv
>> is defined as unsigned int. On 32-bit machine, the result of
>> the calculation will be limited to "u32" without correct casting.
>> Integer overflow may occur on high-performance systems.
>> We recommended that we cast the denominator as well but
>> Dan Carpenter said that it was a max of 3087 and was not even
>> vaguely close to the 4 billion mark needed to overflow a u32.
>> So, we only cast the numerator here.
> On second though, could we just leave this out.  Let's only mention the
> numerator.

Fine. I'll do it later.


>
> regards,
> dan carpenter
>
