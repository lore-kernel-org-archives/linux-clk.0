Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304932;
	b=SdDVeWtJAEl5fBqzh3yaaPfWuvrmARXunrKiBfyymN8yXUHQWzftiODP8iSyVXWVpuUa
	 1jwYoJdGx4PBSsbD1BgqRDvHFqJw/yIKkVP/iBSuuYk7TmBWD9cBdMeiRNZOi3j4MCPoN
	 yNKdRy3MIsqEfwRJGKgAjyJZ7LK7VhyHnkiGGE36vTFNnA3+qvVCqSMXXwkqqUzaUmQ4K
	 589V81W7hflnksM6jNRwh+CiNkrc7nZ/050lzEB2ArkZMyFv7AXTtMSkn8P7ziFg3qJ6K
	 61F2Yk//IZNuigXFCdJyik8oNh7z6M2OXay34vbGIZTawEzK6ZxzCUA7kkYJ2JKc6QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
	b=VY9QF9Di+ruCin5gDxozcr+4Ex45K42iw+xMBOC+Z1iSuYcPiiiWGCCIHx2T0BEWCuUm
	 f/uQeKV1NldxzhCW42T9TAvJdr/YNY+KQgPwIMwSWeyO/53ppKhhNI9mOmCJIwYX0MQiN
	 EWWtkMIWwd5s6TMwrcDEE8ED4dCrQoevWvVKyNFVuy/6HcYOVVq4y3mYJAxfRMKO5Y2FV
	 Q4uMFgN9EiHxZRaxzPwfhX8LqIMKGT7GKdd0WnDStcX+MfWhrwQfCnOx/aQigl4TfR5QW
	 M7xP4mVFtwWa8a1AjLjuenfwkY1S9QL2l5VtxAKorn3JPglnHpM1m9Cb2Xyc2Rh23lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEi1dkvd;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6951606A330
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 23:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6951606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEi1dkvd
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1570003a91.2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 15:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795304931; x=1795909731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
        b=AEi1dkvd1iAbx9IB0IMCR3UE9iO988yBfhfkjx2i9mjncbiEHVVBFfXZ55Siz7OLad
         hKHygBI5EWiua/IGIhAo+QKpeDXT8b53qhFXdt7p7s7V/9J9qP7c1BMuZ39aeIz1bNMp
         Q5phb+V2Pyo6/7Ai2Xa9ooMuCCFBEHhUaBnFWlAxify3gS+UOZTiTfDYlkdkCkW0uCf3
         AJwvk0btxPHVDq4GCveTblWNKSY5m7900GqJulzpo8SuxUWx2gSZMhJIgY+ZzmGhwTtT
         p5XgjLG4heBRdLTVV1CR3Ksn4UjSIq4gBcvaBrwjndr8vwfNdrxDo95yzhO04Xvct/wG
         lvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795304931; x=1795909731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
        b=Ts85tSIWkSNeV/kGzIJ7BTe/Hu1Vkc2HpD7Da/OP7USo/YYIkYIRRyiKdcWBAX0oRL
         XCYNgIP58ack99a5e15c7kuWrTEWzY7WyjkZK/6XAJBkui+1mc9TxFpPPW2eKo6oHGq4
         Ul+54Im7R6C+irpeIGBVQBdUfcMUSQhKaOzVjfdjq0rx4s3FftpXVlQ4+lvxC+3EP/20
         s3OTy4NaVp0f3TJbKs11Ws9BEKk9iF2yJDQ9WNZDlNOw3KQWlhMQMPjOLwqhLTgG+34p
         VygdHWIUSGk5zgv5Cnf0C060ivYSSy5xP4YdtORhUIN24fb2iQI0Cc8uqML6iCgmlBab
         03rw==
X-Forwarded-Encrypted: i=1; AL+hErEYphON+cyKlVhsbE+RjXJ/WelQEhCV/XIrer5WHB8eBROH0aKz/2mhbt4S0EgevftcX8BXKbXcOmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o1m+uhPWwAYMFnTKn5XNMkmSoZ1sHMJmWn8jIXF2JufvWy/jK
	56cztB/hk06CYlCzjj+lx1u94WkvLUTStgY4cDGA0RRWItej57tJMzLa
X-Gm-Gg: AZFdTZe/bEmZLZifWi+FEw2r5EXI8PYN5NSqSrjhVNqh7WJzxJaXkXV6mAjFXJlduHn
	l2dOkCho5ix6OAYFOP37L/bBeRxjlulqBCna4cGeFnPhUcZaqRr90fdPo0LrfXurhWaVRcjP2n9
	CNUl/SBTDeFtw36vZHqDbGML8hFXi+A2tK3KctZoOmhWMj64hCp7iY3kG+DLsUI+IODj1x08QNK
	kxmr2d4L5/QzSqSakSiSdrwRa3gABLqH2ElFhAZsEj5BdeYxEqi1DjvBf22hkuwCLFBXDHNXfvi
	tLXZY3d92uRHxmi3BZw2tqhur0c9DH7Ba3tKBWDWn8SmPj5qXSKqAp+Uew7dj+Xw66r6s5FEvyf
	25C3gCIlVu5uEYcQUfhq8SFZa6V1pCc4xbJuHp/tgltAesY7IVo63O33P6bPYQX4YVVVr/uW7HB
	uC23J4uxAzqzpuMF4TzqmV6/ll2+EWBwU6MWpOAHQKFFJEKgOa0h8YhqTct5Y+iPGtMMGnKT8Rl
	85XqRfTxdpRQOFt8cSBMMVkWYMfqhEZ5+H4mYFhmoI+AS+rMqz4gDecuVec9QrNRJusPndHq6SF
	fziy7W/LYN5SNFlw+2IUjZePJ80=
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr6761492a91.61.1795304931081;
        Sat, 21 Nov 2026 15:48:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm10532985a91.1.2026.11.21.15.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:48:50 -0800 (PST)
Date: Sun, 22 Nov 2026 07:48:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: gaohan@iscas.ac.cn, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: sophgo: Keep SG2042 gates listed in
 protected-clocks enabled
Message-ID: <awIs42O_vJN3gB7l@inochi.infowork>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
 <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>
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
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>

On Sun, Nov 22, 2026 at 02:18:05AM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> On Milk-V Pioneer, EFI runtime services use I2C0 and the serial flash,
> while Linux drives other devices behind the same gates. When those
> devices runtime-suspend, the gates are turned off under the firmware.
> 
> Mark gates listed in protected-clocks as critical. Unlike qcom, still
> register them, since Linux devices use them too.
> 
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  drivers/clk/sophgo/clk-sg2042-clkgen.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> index 6abc2c973c49..65ab18f701e1 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -840,6 +840,18 @@ static int sg2042_clk_register_divs(struct device *dev,
>  	return ret;
>  }
>  
> +static unsigned long sg2042_gate_flags(struct device *dev,
> +				       const struct sg2042_gate_clock *gate)
> +{
> +	u32 id;
> +
> +	of_property_for_each_u32(dev->of_node, "protected-clocks", id)
> +		if (id == gate->id)
> +			return gate->hw.init->flags | CLK_IS_CRITICAL;
> +
> +	return gate->hw.init->flags;
> +}
> +

I have a question on this: since a procteded clock should not be touched
by a driver. Is this logic necessary? I guess this is a shared clock
topology between the kernel and the firmare?

Regards,
Inochi

>  static int sg2042_clk_register_gates(struct device *dev,
>  				     struct sg2042_clk_data *clk_data,
>  				     const struct sg2042_gate_clock gate_clks[],
> @@ -858,7 +870,7 @@ static int sg2042_clk_register_gates(struct device *dev,
>  			 NULL,
>  			 gate->hw.init->parent_hws[0],
>  			 NULL,
> -			 gate->hw.init->flags,
> +			 sg2042_gate_flags(dev, gate),
>  			 clk_data->iobase + gate->offset_enable,
>  			 gate->bit_idx,
>  			 0,
> @@ -900,7 +912,7 @@ static int sg2042_clk_register_gates_fw(struct device *dev,
>  			(dev,
>  			 gate->hw.init->name,
>  			 gate->hw.init->parent_data,
> -			 gate->hw.init->flags,
> +			 sg2042_gate_flags(dev, gate),
>  			 clk_data->iobase + gate->offset_enable,
>  			 gate->bit_idx,
>  			 0,
> 
> -- 
> 2.55.0
> 
> 
