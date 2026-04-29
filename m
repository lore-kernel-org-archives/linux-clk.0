Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B5235E94F;
	Wed, 29 Apr 2026 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494932; cv=none; b=QmYFl+FVMKQo2AaqTst62dTXVPVEcr8un2RB8+Ps4Iu3H8gmY7lv+4d16MBQs2/di+si5dtOHi+6jqBac5zku3x4ssyeNFUIgtphEIBlBUilrRRywcwCjNnuXDKLTVuXYoZc/a9Zd6pubP56Egv3xy/WYQMuc/m+u/N0E7NJeKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494932; c=relaxed/simple;
	bh=rufxEQD76zjB+sGn217WJftdtxWXtAM/N8y3tXTg0LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpSkNWLMmVXxiPEBlC52HDn9x08u1RIvCZXOmT+x+mzhxgIbJkVXMzvBw2WNc/4Dh4K+LSmwn4obzMWU2M0/1two+OxQwyDLSfID9kd+9HaA5JjZsBZFcZl7Cbtgc3vA0LSynsicjEpVcsbhOPPnsQmhdKadJ2EOqzg4vTMBtdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIGJsGDs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIGJsGDs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800DCC19425;
	Wed, 29 Apr 2026 20:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777494931;
	bh=rufxEQD76zjB+sGn217WJftdtxWXtAM/N8y3tXTg0LU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RIGJsGDsTmMMNNmBXyJ71peWBYO5CwXyDmcGh5zFVDbWe9rgRDujZPfj9NQFIl7ji
	 tvlAwDpAUa6Z8HSgjpkpwPAw/dBskOAQ4wOixnvX/yw10yhyqE8anlmhMG3NSYqVcu
	 JItxl+iRm0ZSsUvD8Cdf/99+G8z4M5YZk0k5DoO5rVqm/JfLT/i9iswAUL6IqtV1PJ
	 FdQqNOQM6dnM3g6zpwCE/3KADE14Q1Hc5lHw+7dDd5b3WkDNGN5iwNPmEk0GyIk3WL
	 c987scdq52K6LG4fLpEwpzubYNIlUItMLci+e24p6ZKT1UvIk+4NBRwtnJOaIs7yUg
	 WQh1thuh6azqA==
Message-ID: <a52f7acc-44b0-4669-a97c-686aae623f97@kernel.org>
Date: Wed, 29 Apr 2026 21:35:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <Xfiq_WNTU9P-ThZLMs4plWE5hwtmwyVyKJc1bD5BKdhERGouucNpyuenIoKQiKfZKaRzP-PdamsNlQ8vezjrRg==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
 <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
 <QRkqY_zK7EC4e0ZMoLVyLUhgI9A5RrBcJLm22d69xKT17HzJMXsEDdz_qodBN9qogvuS1XqN4zdemqcoByY5CA==@protonmail.internalid>
 <34627be5-75cc-469b-af23-f1f08ce29820@gmail.com>
 <2846fc60-bf8c-43b3-ae64-58faad6aed2f@kernel.org>
 <xF67mO47hDKLzMEauOb12gQbqTt6OO5h2ODjqizbRCXRpz1KUs2qHsX8InXbE5xWVFBdPAPYK26WacBHk1TDKw==@protonmail.internalid>
 <89f2b7ab-2335-4029-a074-4d9bf956c14f@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <89f2b7ab-2335-4029-a074-4d9bf956c14f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2026 13:42, Erikas Bitovtas wrote:
>> How about declaring both cores a decoder ?
>>
> That is what I did on v1. Ideally we'd decide which core we want to
> power up based on what codec we are dealing with, but given there is no
> easy way to do so on mainline yet, it could work.> ---

@Vikash @Dikshita

Could you possibly check up on whether 8936/8939 has fixed core 
assignments ?

@Erikas please give a try my suggested change on hardware GDSC control - 
perhaps this is the reason why encoder doesn't work.

---
bod
