Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704415;
	b=XAxDSp+QAOhKMWZX2IIJV4aJafJQd+/vtOvZNufRgYO9NuPhL/x0aSXsPddmS4+5LebS
	 mliZIo79ab26un2PUSXlO8BW+oIiQjnXc57rESozcNpqC4tmn6ounm6YaEWIJvIxLGQM4
	 V5VTOsw3M7+alrmOdMNBNDOgdkLr4Zo0zUcoI+Mju8KQJBaDKTrxvba7JSvnqaTTxudE6
	 iK9B37nbSL1SxEbJSO2cY43WvB6e/rVAiKRrBY/DGFl4ulJUpis2MogoRc6KPG08WJToU
	 X+UsVrGtJtaH20nOYIp2midpSGrjWH66HkTwUGyeYSumQGR1gPf6KJWs8PN1jpGx5hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=;
	b=GGwlMT3JvhpvZy8krWlwNNPsBth2pDPJkUFXLnnMw28U3gmMLEVzEVxSnlCgNaFTvKmn
	 oDPzyvydslqAlyQufM/2pOHngrlRKZ86izxsLPpPUhfX5JqTHSz6Ekw1OfQw3BBip3TBe
	 q4cBpiCBXIJPKCw7nUyRCmZPNRPOTgKGQ3DGQDz8s7QTb4NP3GyHuKAl3Pls0EJQzKejL
	 0V1zOvi83aXlnAfn0kNsX0WrEBfv3wmSWat5y733IOBPaPE7IpM4JQfysuYVvSuugZ5BV
	 6ixWt155qGXagpYqIoHha9eAhniA0dB0S1dMNhOwRGYl1kXwTE135BKPnEP+q06YWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcrRPS93;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31634606A327
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 01:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31634606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcrRPS93
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37d424f1ae8so504226eec.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 17:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704414; x=1795309214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=;
        b=XcrRPS936P40vJno3XvqyDp8fAli9TuND9KYSi1V5lmSwLiBH63p01bDAcdtZA4bTX
         J/W9I4NXICyt47rJfltq6+b8mnoNn5sCp1YIjAjkpT9u5Uq0y6ipNma8gZPZn+k1AUdY
         z+fOIkNd+wcVt5uX2/wOLwR8dQN9cgCwc9KvVOlp7KrLJwqEGJLar9ZdARuOoIe3VvHT
         CiHYsCOxpMRDw4MP9d3JbSzEONnWzYdpfjGvRxRSWlE1W+CyGw/dHDcxOAcO1Lv8fXxC
         OEnkpOWaEGBrRwsieMLA9wlrMVLqI1ceO084+uugzp4XTcYP4wip3TWr4R2VBgYf+ooz
         DX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704414; x=1795309214;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JVcksrPn6+Ig6tuNU22o2qjR3uSsPz6hcIi+8PBA4g=;
        b=iJwgdqO+OD2SLmf7dG2FyAPkDYGxwnubgrk2mTTt1JqAB4GAWqZKnZ35cc9G7LU3px
         oiwSjFVxOdoKmvmh28Bc2Qjdf0xRkNt+FIQ22miFKcZvSATlXCEGqsC2K7g+AZUHK54n
         jTztXY7C1jTshFxtWhRTrpF5s6r5AGeELz3D7xSVpwy/5rhaFuYMd9QgTRdpgZqsBKAl
         80yvsQz+HXEn0Vr05my8F5j0gk+An5K7CrOQTFqaVIeqIOgtFwkkSknmCxWZk/19cvz5
         roFnMAKmlNCUe+m/8dRDmqSQYyDZmNZh43/KP4tJu3NJvVYU45w4RLRWEzcx5d9lowkN
         9S0w==
X-Forwarded-Encrypted: i=1; AL+hErH1bYM1ciGtHzR2AJuzgY5E5kbsEKy/W2w5UyFAbIUGmUt+Q93mJ1Yoe5txYId9mW7QdLJRDAXLqWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SReFe815qiECVXReJzyWXw7sGD0QZOEW7cY555L6a2IaXTVrE
	5JtWZ8xs1NGUi9Lv5Ed0dCsHSAe5QOpdy7nQBqk+i6iMASzpL9hFdfl5
X-Gm-Gg: AYBFou0ighNwQErmhQ7ss+aDrq2cZtKcb57pezGIqeoEDDzBE4F7B5A894HP6AAXji4
	LNJmMTKJOVPSeJIwfOwuqYzayu3+gMRbI47UCV6pTlW3/3v5aBcyt74BJOGfKbf04/FgaYK1CzF
	DYKhAP+PmozGLX9H36cY/JSB1gYYhPxknL9bMUKQ1R9RHWdTRC8paVAB/0A4PQsJIuC6xpFokX1
	r+KS6ImSkP+7gj5ji1TKNUZBcEu9rHbiGpjArmzDg4UZXh8L2o7attunTNqctrX+Lhg+MwHe3eB
	LQc5diLV+mP86CYjXREut3+FQwmLLcOWjJh3vVr4KvPndIG11zR0ZqrDN6Ql8Jvey3mncEZLjcW
	TmsV1Uvsj9+XlteDyfzufX8xBYzI1smB0D9CjZvRhwANHoqDAWEKKC9qGpPE2bD7HYt4sRaZ/8b
	fuQ1IcF3q2zAU+ojnLOCswJ7oJFpf9HsZA9Lde4VP48MmAfaB1ns9lUVVobDWwsEEWvqpxfLrN6
	tnODqQ6hS+m7ct3JfBGxbHwmFksFA1pg616P1yXJhuKgIctFfLT9pDoO21LvmXmIQy+IRMYIGRt
	gCI0/1AG5Q8OyvTBKObKSfHLvF8a8C797Ud8LUgEM+XRGugd0c5d1y7lFMXnYqRJ8sk=
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr9267695eec.25.1794704413837;
        Sat, 14 Nov 2026 17:00:13 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm26895445eec.19.2026.11.14.17.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 17:00:13 -0800 (PST)
Message-ID: <c0b9ed82-3e30-4f53-809e-e7f35b0296d7@gmail.com>
Date: Sun, 15 Nov 2026 10:00:08 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 7/7] PM / devfreq: rockchip-dfi: add RK3576 support
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-7-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-7-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> Add RK3576 support to the DFI driver exposing the same functionality
> as found on previous chips. This uses the RK3588 init for getting the
> DRAM type info from the GRF registers. In contrast to RK3588 it uses
> a newer DDRMON controller IP, though (version 0x40).
> 
> Co-developed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 8ba97af78e3d..a895e566b4b9 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -858,6 +858,10 @@ static const char * const rk3399_clk_names[] = {
>  	"pclk_ddr_mon",
>  };
>  
> +static const char * const rk3576_clk_names[] = {
> +	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
> +};
> +
>  static const char * const rk3588_clk_names[] = {
>  	"pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1", "pclk_ddr_mon_ch2",
>  	"pclk_ddr_mon_ch3",
> @@ -887,6 +891,18 @@ static const struct rockchip_dfi_variant rk3568_variant = {
>  	.reg_access = 0x2c,
>  };
>  
> +static const struct rockchip_dfi_variant rk3576_variant = {
> +	.init = rk3588_dfi_init,
> +	.stride = 0x10000,
> +	.max_channels = 2,
> +	.clk_names = rk3576_clk_names,
> +	.num_clks = ARRAY_SIZE(rk3576_clk_names),
> +	.reg_write_access = 0x28,
> +	.reg_read_access = 0x2c,
> +	.reg_access = 0x34,
> +	.reg_clock_cycles = 0x30,
> +};
> +
>  static const struct rockchip_dfi_variant rk3588_variant = {
>  	.init = rk3588_dfi_init,
>  	.stride = 0x4000,
> @@ -903,6 +919,7 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  static const struct of_device_id rockchip_dfi_id_match[] = {
>  	{ .compatible = "rockchip,rk3399-dfi", .data = &rk3399_variant },
>  	{ .compatible = "rockchip,rk3568-dfi", .data = &rk3568_variant },
> +	{ .compatible = "rockchip,rk3576-dfi", .data = &rk3576_variant },
>  	{ .compatible = "rockchip,rk3588-dfi", .data = &rk3588_variant },
>  	{ },
>  };
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
