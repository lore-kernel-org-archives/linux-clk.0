Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740593;
	b=eCHJP1uuk121YSxEeMdL3AaZep0LnPclF7rVHDXR7ogSaKqkkeyv4iX/ULxqieNteyhy
	 HgsqVMtDmidlH8zPtbg2UBGCDi/aqc/TpafPta2OXqzufznQO3nCVYRR8VOazPwR5kbLI
	 QFESFUwresYnCBfQZgcRBbZSccu0bWa/nuseG5y8EehhiH6aqXOvhRQbRs3y+cm+OW8f6
	 jwwjGbSYp3cIxWc0anailMV9oZYBmtlpG5Xd2FlL9nmVJN8QxTv991W/CXzHCOwGfr3j2
	 o6Z0HoYomeSAf460MeLy+LCIFuUjxGefS8VBsHrz1SBO2zM/7Yt57FK6zElpRDXoolg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
	b=w2UmiX31Tm0+UJ8otY5fILBB3eC7T8/WFQwrOSTrEO5xFlAptmkqKYpSPUiajw0vFbwW
	 qMHR3XpGNMmHhjvdCGbdfqVaBOUgAV8DvlnH0cIoEeuFg6EeeXPx1RI7kdTvUrBQeMifZ
	 Vl4pYYTq3jQI1dg0/PBdaI2jwoTf8go9fIFSaAWVT/Fn10w0XPPbjYbUzXjoHXXOziTOh
	 PQ/3LAaHG3yE4+XIv3Lm1/7+upgAl7/2yRhVekC34Vnna5WCqkGRG1kIw/NYQ/PaAq6yd
	 DBG8W6D9UxB9r0lJ6dceindUxRml3r39mPogYn4Dyknd+/T2EYS2brRPBsJFBXB1tQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WR02KrBz;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E085606A31F
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 11:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E085606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WR02KrBz
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2789899f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 03:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794740591; x=1795345391; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
        b=WR02KrBzOV/h19PNnmRdTn+XT8cRK5mKsqg9OanSndZSfGTqZFubzv30P77zOMp2qQ
         kQtzYOO+dTHK2YOlLOQ6pS7ZbUlphK3ZryIgbFID4LZ7zxzUZF19PbTUSY5ISwL2u9zL
         F47L+ASapoErsRmS3Dcyby4L6EPVCbmU96Cuxn+jydfTMAJSterK1bG8nxtf1IZ1U00L
         kJCC5GY8cJAhMoOZr26+HN0j3KDa1dSq2fswp9GEA+LetvBHW5RlKGX97gCPSyWOMMdV
         a8I0lQjzX+naCxu7XF+36CNIpCYOEBJmS7EcvCInQSQuLnUcBsBnep2PKV4WC7pOzzJB
         7+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794740591; x=1795345391;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1ACO595+ELz+z8hohqisqtB7dSuEVIa1QoS/POdlBI=;
        b=L3bBv04ALq9TBImZBM8qXYKp+u4vV4wRpJTELkhRKEicv96MsTBmnGsPZetZeg0kCS
         BkcEp8PevOzBTNeqNOFYR4fAIixJI+jLoaSy48vQ8qRfkBx1W4lgoSm+7LYA3JcinF+s
         7SjZX4Aeopn8t3RFN/b5r1bo7HThQ8WypRPbEvF/fa9KrlDiudejtIhhHfuJNkjzpplK
         D4TpZWR6n5b4XJ09gDU7uYUAm8auI2gDFhZ/kbhKgMnaN1/+5t8lSEV/S/uqdz8mWS4O
         j+6L7i2eXOvaDltdOI7A8FYiorTzXJVBru7NZG/CoETFCARE5aC8KI3FglvfI8uGmLQg
         NRBw==
X-Forwarded-Encrypted: i=1; AL+hErEZqMrpXpRRyisvo1ojqiRz0eb/kDr2F2YG1UBd13bSjzY7zbyoBpwXwq3hrEWqefOWc33h/Nx94GA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gxy1zyiexia4kEMGIWmc5LMIIoEwj6s0QHBRAZO05UvJhSuUX
	psphhixOKfqBF9SY034drVnbGbKBH5eSgRKs+ADadDZsbsdK95jg56lyh9i8SK2ArX4=
X-Gm-Gg: AYBFou2REzeIa6dTuSyxZXdPpH3cJQXwgktc7B0yHA9GTsm4HQuGbUyiCLl3QDt/ImS
	A2efuKEQCYNplnM9rTFwDaMdH+RPhnKq+J+/V2iLaIl5BbetlKvjQvKzPUDLq2GkwiVlqmqBHTp
	05neg0yIHrLRTKfa+sknQ8oVD30n3zk/xsKE6bLlBbyIf0emo7MwCxUgI1zQcPPP1MJ74iTLQ7s
	UnAIoARqHaWDdK1kKqI16b+dkrl0XtDaHOyiJIsmq/stCJYZ9NEPwLQGBIXUeTYMZG8FkOB9GOl
	oYaRMk2bsMBsNBFnygQlL8bJSUFGsPa/YhFeQDjTls4dreCZKRXj7Jp8WEirc330HOFH23y1jwv
	vF1Ldm1dHIK3GXL3DziyB7pgN++Y/MG1J4T3dmJ3m6Fwok9ZRjXDnsGr9ACxrRxs/sUW17pEa18
	r62ErbTWfJalCYm4D3xdDO9AAXSt514+SxGDQasf0hrIQoy7WtTihHwzurhghbkmj/FbKMnLHEy
	XmXiOzrjMpPnwzygt0c2cQpi9Vo50BX/7bgc+qtYC8SO3IDiuV9GWDDqGaSh2Xhn8BcwPb46hVE
	7hINx7soNhQAvTWLyE+PMhomEIa6zAlSI+W3kn1jle1JOd3s
X-Received: by 2002:a5d:584b:0:b0:491:620b:b60f with SMTP id ffacd0b85a97d-49c72ba5d70mr15726879f8f.48.1794740590749;
        Sun, 15 Nov 2026 03:03:10 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm15132051f8f.21.2026.11.15.03.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:03:09 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
From: Jerome Brunet <jbrunet@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261113145708.261530-3-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
 <20261113145708.261530-3-clamor95@gmail.com>
Date: Sun, 15 Nov 2026 12:03:00 +0100
Message-Id: <179474058020.3790083.7531788945003507652.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lFRDSGY15F4GXWb4HrNUlotV6eaXTV/VaJfiOjVavqU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/J6Zn6+1MEdwhlvNA2UgluMX+9NH9LEf+6Nw4c2C+o
 Uu5D1NeRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbyj43hf1nIoowvEUd8Dial
 tufF/IuOz3njJib8ZHVTt0aEuLX2IYb/niZ3mq8ufHv5qLraOp/9yxYcfvzMOdXxpP7CDJYT+XH
 L+QE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
> for the correct work of the CSI block. Add CSI pad A and pad B clock gates
> with PLLD/PLLD2 parents, respectively.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> index ec537efac692..08e425365469 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
>  					     0, 82, periph_clk_enb_refcnt);
>  	clks[TEGRA114_CLK_DSIB] = clk;
>  
> +	/* csia_pad */
> +	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
> +				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
> +	clks[TEGRA114_CLK_CSIA_PAD] = clk;
> +
> +	/* csib_pad */
> +	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
> +				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
> +	clks[TEGRA114_CLK_CSIB_PAD] = clk;
> +

Change seems ok in itself, just a couple of things I'd like to check with you.

Seems both the CSI and DSI can use the PLL D and D2. Can they be used concurrently ?
If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
DSI counter part does not have ?

Also the DSI get the PLL through a fixed factor 'out0' but not the CSI ? is it something
you have checked ? it just seems a little odd.

-- 
Jerome

