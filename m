Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421251;
	b=FvJLDJU5tr4kOSqYzAbASijBLXjKkR/j9+1BR5aBZKCZn03zKaIcVH4pbmmiX3GXwEHN
	 ZQCqJCB2y4qY3Hy2j+JCl5eXL+QRzgESp/jbeOLAemJEgahVjY6PKY6u1YiVSTPHWBpw/
	 WNmZFL+XaAM+mKNSj11V2Ac9NSZUQriVAH+ONd6ukqDm+zd0zRHKDxGcxfFuDRNRfuAKE
	 x8QmzpdQ2fF1V/hPzpT9FQFzuuCTBhqqKHfc3i9IyOW7JL6mTrxMtrJnd52kHhfW9rxoi
	 Q8a+nuM+yo9U4IN8/mTlVjMzbhtPJD9xwOJkW7eNyJfQnWqozymj+ipAD/yTYhSim2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
	b=emqbN8L9x2HQAuJOH8vKxRRFew4X6pzXtck/ewKEX57dzjD+lchOirKFp7WYfv7pqLLF
	 TOMR4e+PGV9+mOIlWC+lmxduQoUQHgkU/zi9BOHlTwwzglMvZLb8b+Mc85YNSmhAWepj0
	 4QqsPPtFIG89qxqT3vLnyCYlaed0KgGxkN9R1mcMWKJ9wNspS0pmj7F2kpNAH7oOikyge
	 vlMV5WNhmN7ohKxgeJGKDbGAe4qraAbH1RXnN/umtk+Ta8WAyTEsS9YTxEcld7ZMSdHXp
	 ChTL3pzjHNCrSamQ0aRIrVgLFlX7REVMj7oobFz2X3OE+eW8MSL3WZyNSppxGn3DCqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Nd8tQEwv;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F233B60A6F45
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 08:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F233B60A6F45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=Nd8tQEwv
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491971ac844so2718726f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 00:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795421248; x=1796026048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
        b=Nd8tQEwvw2YVHeQ8j1Cb46XOj1W6KTiKi55pRshAkmzgXk660CQlg7it9/dDUxWvZR
         HiHj7dU5yALL1R7gq97965gGFJsx+0mj3aapPkq7VvG78sdRxkhNmLB32vpYQDmHu7Q+
         GWZANiiisuMmVdhErOcvtxw5imyZorhl4pvPAG2lvvUMw42goZu36Hmg5uxvrgTQu5/d
         Awjdc6tzeYDjiDbVB4ickreDMX3baO07gu4+BGY7T0OzsmreaiSUf8Ezt7ujDb96+OOU
         oKLMaBOCWsTbgjvp/UQbBrb62jWNG/WoOI8hhnigAO+POKC0oiU3k/QSvKR/4BGMTk2o
         +m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421248; x=1796026048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpeI2D8k4eF4Gl52wSeLaD2a8enBNfeJeACQoMkSgLs=;
        b=ogBe99W2ZGoq7SHblZ6AgFMrJ+31auA4vAPb73oTj/R0EzAZQRVVWynj5tcg3avVbs
         dgEvQsmln0Zm1TE4Iv2uq61sdydoWQ2w+ZIfoEhSUMHTIlBJ447yjBpvED4mRQJ6Yjtk
         Fea5msnRFU/mJVGP4rmP5hR8zoCLfHOl2w8ZvchANMmXCMtKbMtvtCahiY9grxIJ2+Ol
         uizIzrpp+Eta8vDRs/WJ2OPcUhPeNaA/VuTQltYyafJ2i9Ax7CuptxpC+YNdYRt3sGYD
         B6geUTiGQAHBRTer9ID8SnURKC1JRLNu94X21/a2NzRhMBIg9h//w8AZZRkBdC1lQ14s
         sl7g==
X-Forwarded-Encrypted: i=1; AL+hErHfKqCSKXeyr1eIWMN91k40RWJ/mCwH13kgUcoexh60nYXKdnZ98uxwwYldlwLmNZXBUu+uDoFekCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z97+LYx+7p/kGQ4qxqOio3eKf6ist/2sRhgOxfNUlbuh+sYHKx+
	62JCtWablfGc/Nfz3fpee+WehqY1ua9z95dV5+ALFsKWAUvblhmtLyJmzr70G4yqPhs=
X-Gm-Gg: AZFdTZdouIwiog0qG9ZBIHBAz/I+F/jTquDEdh2aS8aQLqnX9Qv42Y08EB8WSI1hTqS
	zJ/b/USQPapuKFcMixLWnODJVf5Ios8j+uQEukJ/1TIaIyPQIorqVu407KjGODIbjSfGug+pD2U
	7lblDnSLn/gS1b+QjNBVq4rJc2BPIByEf/4h9htbnYPSgCzFagixkMLBo7vYyX+KZSw5xSCUDdM
	CflaNjrkvRsahRoFNwrfqnLKeuSSkJ7uVXtnmzi7VJGYzfjb/3x4Emt8YANM0/Z88nbos9V+MBz
	kEUQb7TqtDitm6pc6OZTXfUZEAhUwALwr7jftspmXoaJP7y+MGprn5LyPFfkoXLLgTbb7IMyY1O
	akv/8C3qlAkLkFm2DtBfXzF3Tgm16Ki7mD/iubYFFXBNsH4hKQ+7ctp0N8ece5FYUHtCjlDUERt
	tn/OhOma5aDhPyH/yzryTzwoFrJI6tbJHOhQTqxfgHncW5U7eS1KhSAcJXk36yi1vKOAt4EyhLi
	+S++LfGvt89b+usRTaKg33L2AeoAm9zgln0cUoDQ6HzyW5WB9hXm2J5DYTVBs4Q9Y7eCVbs/OLc
	at2fYckP8t7UEmcW8969Pgq6oIcY3fDMG2Xjses=
X-Received: by 2002:a05:6000:2c05:b0:498:b92a:30b with SMTP id ffacd0b85a97d-4abb0c5d560mr20861869f8f.15.1795421247404;
        Mon, 23 Nov 2026 00:07:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm20895154f8f.44.2026.11.23.00.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:07:26 -0800 (PST)
Message-ID: <c1b91afc-5b9f-4ed4-bfa2-b202e552769f@tuxon.dev>
Date: Mon, 23 Nov 2026 10:07:25 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: renesas: rzg2l-cpg: Skip re-initializing MSTOPs and
 critical resets for s2idle
To: Claudiu Beznea <claudiu.beznea@kernel.org>, geert+renesas@glider.be,
 sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261019122501.2423969-1-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Geert,

Gentle ping.

Thank you,
Claudiu

On 10/19/26 15:25, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> When the system suspends to s2idle, any of the IP blocks may be in the
> wakeup path. For a device in the wakeup path, the generic PM domain (genpd)
> does not disable/enable its clocks across suspend/resume. Re-initializing
> the MSTOP bits for such a device leads to synchronous aborts when its
> registers are accessed for the first time after resume.
> 
> In a suspend mode that is not controlled by firmware, power to the SoC is
> not lost, so the MSTOP and critical reset state is retained and does not
> need re-initialization in the first place. Skip it when
> pm_suspend_via_firmware() reports such a mode.
> 
> Fixes: 5cd33db56956 ("clk: renesas: rzg2l: Add support for MSTOP in clock enable/disable API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index f6293c968bcf..3d2281456036 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -31,6 +31,7 @@
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
>   #include <linux/string_choices.h>
> +#include <linux/suspend.h>
>   #include <linux/units.h>
>   
>   #include <dt-bindings/clock/renesas-cpg-mssr.h>
> @@ -2697,6 +2698,9 @@ static int rzg2l_cpg_resume(struct device *dev)
>   	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
>   	int ret;
>   
> +	if (!pm_suspend_via_firmware())
> +		return 0;
> +
>   	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
>   	if (ret)
>   		return ret;

