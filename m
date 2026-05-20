Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E033AD528;
	Wed, 20 May 2026 08:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266397; cv=none; b=ct2cw2EWIpCMHzA5en2rVXrb6f7K6ymDDW8/POF1FfljwKZkLAb2cukPZ3qbUq4SH8r7aUrV1MFWmaovOliWcoUT9Ym1gBtBeqlwXnp+JlNYD+yMq6387IXQULL+3i5c74VdYiPXSwYxzpGNxN4FC1UJOULzBqEdb+S+w+IWDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266397; c=relaxed/simple;
	bh=Uqc2DbFiBx4ecAKgG0sD981oROOSKoSCKv7AsMzBA6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYarTqNSfw4tzASIPE9lq7F/9wZhns1svCMAlJjw9pWvhhtFFUOjpvzAE6nMAkRbxdpzqmeCwe/1sekaqlVqafnTSN50AKGg+EKSkwIuG9CO0XEHuMx5/1/P0mjbpC4Gs2pbu0CQuHWVglj0mnGnZwda01YQQIz0hC7asvIzkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAD3xE8v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAD3xE8v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCC81F00893;
	Wed, 20 May 2026 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779266396;
	bh=K5bQtFywLpFI355A9uvVb884nWw3M8eODnk7osCesEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OAD3xE8vCMsfmUbeQH1CUJX9PvNy5dahTu7K8x8M+dC9nF0fInQ4XLDWV9GIL2njX
	 bDEXycCdfaraMxXfv9k5YN/u+z/I3s+QEzHFtdDjuMEx4ji3g4U/uOmwgdn0bZ6ZlQ
	 MawJKmpygIqko+/Zi3iN8PfmbXibV9vQRcQSuNtTPwSVSAsdM++1AYsltQI3hNWQXu
	 9T1EZuN+eWORAVf6E+3rARoxH0baY8pzaVQYKLiDma/+NQVAYiJxQD7YDCms4azi5N
	 JfvJZEHxZNtd9X8xIEN+EoWYIgNWWJBHu7dA2xO1HiBAIJCPeEEYIFNnnn2ITEPtAL
	 A0zWtGh2/MtUg==
Message-ID: <b9585ebb-acc2-45f6-a57d-ee3c71a0ed84@kernel.org>
Date: Wed, 20 May 2026 09:39:51 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/9] media: qcom: venus: migrate MSM8916 to new
 blacklist mechanism
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <2k5HS02rUkL4criXdLW2s3U-JDGR3bjCoqDdpB7A6x1Rx2-IbQX93RYBW6kBSgJ040MVdoDy6HIS6G22aXxckg==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-5-542ec7557ebc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2026 16:10, Erikas Bitovtas wrote:
> Blacklist unsupported codecs for MSM8916 reported by firmware to prevent
> them from loading.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index a87e8afb23df..3baa6bb4968f 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -684,6 +684,8 @@ static const struct venus_resources msm8916_res = {
>   	.vmem_addr = 0,
>   	.dma_mask = 0xddc00000 - 1,
>   	.fwname = "qcom/venus-1.8/venus.mbn",
> +	.dec_codec_blacklist = HFI_VIDEO_CODEC_HEVC | HFI_VIDEO_CODEC_SPARK,
> +	.enc_codec_blacklist = HFI_VIDEO_CODEC_HEVC,
>   	.dec_nodename = "video-decoder",
>   	.enc_nodename = "video-encoder",
>   };
> 
> --
> 2.54.0
> 

Actually just squash into 4/9.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
