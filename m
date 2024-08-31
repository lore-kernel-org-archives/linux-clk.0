Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF01097B
	for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 13:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110826; cv=none; b=EYofRhLZYDFq4YVReL3pQvDnsI4+Es8FGE8oW78VPtCZLhqh5cf3exfreZ+DCGiLl9OlilLzUqjylch/mf8T2ymnX4S3TSU6AVnm5ebgu2ii75jm9xswwmmIMGRCB6ggQ4uZqb2Q3s8D1NTUAyb9+5N2A83u9xypMQWqXEVYp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110826; c=relaxed/simple;
	bh=9Em9kDNaR0sRVSjhQpnsFw4mhbqJ9B3tQjGc4PYipcI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4sdxT2tN9nd12FY2Zt/FPo/ZE00SGxCj9jGM4yuLa937Fgulla2tpGmV53fJ0asMxG+uxbYMCZOKzlbNy+p3ONp2fQiVViSDhEX9+MXNgA9N2SAhMfXs7RJVB2nlVaUPKTSZ0pnBFwczwJ1PQSj9pm3ls0P+knERknUhwtmwcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FPw+WX3S; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FPw+WX3S"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374bb08d011so559074f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725110822; x=1725715622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BY1w5DCyLK433UsP9jZVO/x34bvrtP71tqTdXc6Pho=;
        b=FPw+WX3SZ4+PsDautXm4iPMRkgZt+sJoP5BairK6rhO6f4NukKmke5Aof3NFbrx4MU
         abQAfXbO60LZtGKv8Edfo5zKAfcRn6hkEG//HkDI/AnkCsnHQa4Sp0XAHbqUUDyJNvDJ
         A39la4w7O/ZkchRscO6LyN5G3Gs0ccI6adv2i0RsPTj7zBFaIAM5J7yTmxj9aNzd6lKi
         Y87kacCmyLtIfbm2E4i+Nxhx5+r75dKHqxki3ceI8I3/Ol+bEXX/CtL3rcyY6GtWYjrl
         1aDF9j8dTZuedjoH+Xl/Zetjotkt3evQFhE7WJoDbG2+UjWkXOaB2nLt+2FgAhcHEm53
         KeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725110822; x=1725715622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BY1w5DCyLK433UsP9jZVO/x34bvrtP71tqTdXc6Pho=;
        b=A4PfaTRao0dVUi+Nb5qcG1Y7D72Re1ToRu4jSK5UHq6NFDNXlHNpIG8W1REaUraoeb
         RNDS2nfSvOKxYv/17DJFFvDGn5prhxXKPoaqP/jdnvju5LNtPELNueMiON4NOsXNkbEQ
         MDUAWsCh372HbzcNSvGOBE93HCpe8YPvXo9SWLMigDWPd5Aic+4TkcPET9AgDKw9nfip
         zGJU4o6CVnF5Z4BI3clVs4Lwh5pTdKuB3VJL00s8Gp2csEdg9mMviacvUv4yVoHeUttz
         1WvqC671n5k+jeA3ngrHZsKHipbsHw2WFD7OlpKhC6c1AJTIBuU5JI+ID1C+4sqEFYHz
         mCmA==
X-Gm-Message-State: AOJu0Yyhpf5BhACGU2pSgc4uQCuDv93DFgrD42c4/Z/2LHKKR5yT3zIx
	SbCXkCbPCrNA5RZ/X17s2ArAPQYzBdVnLKbmpk7J5nhoW4/tDMqXqbeV9pl8bCc=
X-Google-Smtp-Source: AGHT+IEzv/eVAxRNMdU2wq4teTAlphvteYoBIdsnL81eNzTOCEnCnsDnl8blLvNt9YmJkhp8bgamrw==
X-Received: by 2002:adf:ab03:0:b0:374:c45a:7fd2 with SMTP id ffacd0b85a97d-374c45a802dmr133150f8f.62.1725110821925;
        Sat, 31 Aug 2024 06:27:01 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374ba30d5b8sm2893316f8f.15.2024.08.31.06.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 06:27:01 -0700 (PDT)
Message-ID: <5965ac01-f420-4e5a-973a-6008d738b51a@tuxon.dev>
Date: Sat, 31 Aug 2024 16:27:00 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: at91: clk-master: increase maximum number of
 clocks
Content-Language: en-US
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1724948760.git.Ryan.Wanner@microchip.com>
 <677567f08ae588bdd9f919c6501c23be075c0efb.1724948760.git.Ryan.Wanner@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <677567f08ae588bdd9f919c6501c23be075c0efb.1724948760.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29.08.2024 19:42, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Increase maximum number of vaild master clocks. The PMC for the SAMA7D65
> requires 9 master clocks.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
> index 15c46489ba85..7a544e429d34 100644
> --- a/drivers/clk/at91/clk-master.c
> +++ b/drivers/clk/at91/clk-master.c
> @@ -20,7 +20,7 @@
>  
>  #define PMC_MCR_CSS_SHIFT	(16)
>  
> -#define MASTER_MAX_ID		4
> +#define MASTER_MAX_ID		9

This patch need to go before SAMA7D65 clock driver.

>  
>  #define to_clk_master(hw) container_of(hw, struct clk_master, hw)
>  
