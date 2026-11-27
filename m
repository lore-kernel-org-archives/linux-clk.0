Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795904;
	b=ll5WT+fXw4ed6A6j3ZaJ2QlPNxgzBIfDNLEWVAIpW9IJylbrYXxrjyZ4IR9Z0sOzQRvU
	 nUTG7nutzaAeIUVcSnj9cWKqsqPGTzlbQtYRW3V0vpl4PKypZ32aT8qyT1/l8bssovMMP
	 y20Df/EE4u+P1tAZuBYU6WCtgH1KpLmPsw09MagF4TLvHotfUrNOONyuWHzTfsoOCxdyP
	 R0dyZ8akrfdMIn3yvlPCV8XpBKxngcJpPb/8cdumaj+ty1EhvgHaD2M7UxLkbinP5gDZU
	 L8dsM6Ls3jGcp4VVPak5cBYd4UHZ/KcX7TFLfwV5Sq1Nk5R3GKaBARhS+Bn+37ym4NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795904;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/jSStMEANCnMO4ZzPmB5Im+yepvb5/yuDaHPbOparnI=;
	b=dGpXqA81c9v/C3ycYR5VgI/GRdHo65d3VVvxhfG6QEdrrXVe9gckaDT8STz4MwpBpBxv
	 w2zpwFN1mI7BfnHN3aZodyb8a2lb4FbZFchGdQAbopxvAEKQtugEgMMIgFSBqAyEFaQ/h
	 hMiTxdOifNluw1C8Z876HydgPj83uSphLjvVEDUbRmisapcZTPffLclXZyfO2k9sftlYk
	 n5rRIs0TJkpRzL16rEY1saQqccnehqeVmFvnns3vKgM9MJnYvpZur0rKolCE4ESBUgDXD
	 VfUVplhGZzVIghFkyLHEGyHcCGb6DRkdPbxlySvciVm1Ezg4uwuNgZ3SJStaY+XUiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYyX3maC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB697606A31E;
	Fri, 27 Nov 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aYyX3maC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E591F000C1;
	Fri, 27 Nov 2026 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795903;
	bh=/jSStMEANCnMO4ZzPmB5Im+yepvb5/yuDaHPbOparnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aYyX3maCFB3FY/uEeH7D0KLT8rWWrsjQkll/47CQiowoRih1gVKWLX1i9z8rvyycm
	 t4lQCkaNrR/rzJFpiUX530ZLhUFYWzRztQWXZvzT9apWyUzCJxmVO1ElU9nAVINgi2
	 ZYO9bFx1N26PjOEZlJU37gmcjbVzDxPxrz3ZQfa9xeJOK6+g+W1/IbIiz1UL282hU8
	 VmP+EfSG6QHIj7xEzm7GCwHWYKWQUGHk7MRF9XfwHLkHhaX+aPrsLD2qksKcDcGYm/
	 U+FkSwKcnvm70t07dUUtl17gNCH8kfKUx2mqlcOfQYCbW+muaZbkY2pJp+NvggOP9f
	 GDp7iGgSimLWg==
Message-ID: <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
Date: Fri, 27 Nov 2026 16:11:38 +0000
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
Subject: Re: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <LKFsWplUk1yOr4M1dEHqZ20-Oo7ya-QA5qkF8u2lcfPUsbJYq0AoJhyjIEBwg6PPzlPSMYfqn6CB-sQBOuQDKQ==@protonmail.internalid>
 <20261127134507.125513-2-hikmahgumelar@gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261127134507.125513-2-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2026 13:45, Hikmah Gumelar wrote:
> The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2
> 
> with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on

"stuck at on" or "stuck at off"

> MSM8953 platforms such as Xiaomi Mi A1 (tissot).

ah I see.

"leaving gcc_camss_csi0phytimer_clk stuck off" you can drop the fragment

"MSM8953 platforms such as Xiaomi Mi A1 (tissot)."

> Switch the 100 MHz parent to P_GPLL0 with a divider of 8.

What is the data-source you used for this change ? You should describe 
how you know this to be a correct change - the code is simple and 
describes its own change.

For example citing drivers/clk/qcom/gcc-msm8953.c and 
drivers/clk/qcom/gcc-msm8939.c since they are very similar controllers 
and the 8939 does it the way you describe below. Also "it works" is 
another good reason. Inferred from your patch but not stated.

More accuracy is required here.

> 
> Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> Signed-off-by: Hikmah Gumelar<hikmahgumelar@gmail.com>
> ---
>   drivers/clk/qcom/gcc-msm8953.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
> index 8fe1d3e42144..8aec5600e837 100644
> --- a/drivers/clk/qcom/gcc-msm8953.c
> +++ b/drivers/clk/qcom/gcc-msm8953.c
> @@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
>   };
> 
>   static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
> -	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
> +	F(100000000, P_GPLL0, 8, 0, 0),
>   	F(200000000, P_GPLL0, 4, 0, 0),


