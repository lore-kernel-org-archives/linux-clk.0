Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A13176FA6
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712764995; cv=none; b=ucDP1BuFcADsefUYkOB92uf5a8dzQrg4Gj0U4xH0p95s4htdT881Z3Ac/4fSPKtsPKCsTEdyDO9nyAWau0mk7rSLL8ruphS1Jy4+9Qzdoz50NxvO6EvfLGNKtnQO5ZA+ANVbnMTTRCERl2H5OBgUYifyZeQlM5vV3MI9i8/jjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712764995; c=relaxed/simple;
	bh=Z2KoNMVIM0fdcqZSkRqHwewpqp01dFwksePmZ9zuE/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EYA266INfwze40rIP/f4jccIRBsfIzAA6xr+2H4IvsYvXBg5vmIQjor1MMaW7JZ1Upp2yVHWzekRB7F/xV9QBY8m4jTpB5trh/nCiagHUMyJ1gS083xDYahlw9R7G7zE7hC+vFswD0T4IluLmVDJMuv4Jg/9Xn+RceZaoYS+rag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GiiVbYIn; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GiiVbYIn"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c5ed27114bso758280b6e.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712764993; x=1713369793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QqluekjGgYcc63to1H69mMjnF5MI34zE+Mk4XaesivU=;
        b=GiiVbYIn2Mm2PrbnE2t/l/EI1zR1ly6xW9pmFKBfARxeHsBoe35SDgBXNjRzVmgxsn
         oaU/DrRBJElLfKq85gXxauE5ZGri33PR/CtwcwqRGmrd37yd9w9iYpi6w2vt+P/yRkZQ
         bwf02QPiKOglVBo4VYn3aE0Cfv2GvYBFxdSOxFb6ug2eXbOsIuWfy4eWPs7mQzaAw1GE
         B5YhuzdIFgqdUBsGaKD02Lt58UYVMgJHRnWq8DPHksjAOGkUcA8n/boNdDaTVclWc4JV
         jZVMsGdqy9T/3rW2ytrApGeuzRw191Ij2Omo8ca4SEK48Yx3t8tJOdmKhfTGnQBDqFb7
         ZSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764993; x=1713369793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqluekjGgYcc63to1H69mMjnF5MI34zE+Mk4XaesivU=;
        b=YPUYdBMOuMDTxnjQ7GZDrIXehqmh2fyL9Aqjb7CVgqaSJqAserjdoyjDEC4aP6Zqho
         fZNFrlPiDo2NMWbr1LL5MPPqwErspVai9Sr5qm07sTV1nIQ1f6nkdi1MxQJ3IUdDRgrJ
         V+/ke0nDw8vVKs6ZqUxZJzM748vWOACJ4F9dE00wn0kYkeyyhYkhYy45xjf4Vd10FYNn
         nJekdRwkSfkL3mSVTYg+Bq9WZTYD17tJ80wt3rHHEwzoTObcfTSUBJJX6gK/pFWaq/Wp
         chYy507WsLcVSGfzRUfwZYHT3MephI7VNvyyFUQlEPoayWZvr7FIrLbxGDyt99WX9K2N
         e75Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsdBLA2ev3dIe9Vxjz1/3O9v8kKakUHp+BkujfrvQWu0xZdYKh1qiPAuoWQhtfAO+muuq5AkksVAhLEKE2SS4nAgw0z53nbKx/
X-Gm-Message-State: AOJu0YxsOHbI4NuKiSGb+elR1XsYQc8gLxelMyL1rCoSCZnX2VvZ9CNI
	m8+vIwsgOcvWIY4S45ouRMHEXx48GpGuGEvPRbu0oD1NuinT/LBe0orsEmYMxWo=
X-Google-Smtp-Source: AGHT+IHzP8P9A44EU0tio9BUIAfSMKe/XNB5s1q15KBSLlEMuCYnD+nKfQOO6R2Enhdqd8abgspEVQ==
X-Received: by 2002:a05:6808:1488:b0:3c5:eed7:4cef with SMTP id e8-20020a056808148800b003c5eed74cefmr22560oiw.20.1712764993145;
        Wed, 10 Apr 2024 09:03:13 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.167])
        by smtp.gmail.com with ESMTPSA id n1-20020a0568080a0100b003c5eeb1bc64sm1337572oij.1.2024.04.10.09.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 09:03:12 -0700 (PDT)
Message-ID: <23c88f5b-177d-4698-afa8-211a2bf07597@sifive.com>
Date: Wed, 10 Apr 2024 11:03:11 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sifive: prci: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240410155342.224061-1-krzk@kernel.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240410155342.224061-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-04-10 10:53 AM, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/clk/sifive/sifive-prci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index 25b8e1a80ddc..700a1be9ec47 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -611,6 +611,7 @@ static const struct of_device_id sifive_prci_of_match[] = {
>  	{.compatible = "sifive,fu740-c000-prci", .data = &prci_clk_fu740},
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, sifive_prci_of_match);
>  
>  static struct platform_driver sifive_prci_driver = {
>  	.driver = {

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

