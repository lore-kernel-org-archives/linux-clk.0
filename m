Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B345D28B4E2;
	Tue, 28 Apr 2026 06:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359541; cv=none; b=f+DR9Yu1Q07cJnYZG/FEN8mI97KOkUfZh/nX2Lkr+tq8U1yRUmfmqY01g3UFaSZTIy9/X2kI20EbNAEG8kTo3ZPvN3LKx2+0v1AHvgG3z+O9wpFociSPAuCbGeMhyDISQ4tAeslCEz++IeLTgu8/zdKg6O8XIpGaAvvsqv6CclI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359541; c=relaxed/simple;
	bh=qcxwqNRAUHk1BYedxxBMnS+1rZxy6T0uDounlDb+gKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFy8PYablVds26tfTDry9wKq1xxOUFMmOT9mWDLg3JaiDemTB+AGgll95jFnPdUOk2tyPyZUfzrDt/NnCIpxQcyDIpv6Fpu9jvVAIfCn201LTBBLJiAf3tdxlzwfz88jI3b2mPQGm8I8rTp8MTwV8QlbS0jcFOA64lzsSpTEMXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqIhq1Eu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqIhq1Eu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABDDC2BCAF;
	Tue, 28 Apr 2026 06:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359541;
	bh=qcxwqNRAUHk1BYedxxBMnS+1rZxy6T0uDounlDb+gKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XqIhq1Euld1fDOmb0MGvSBXidGneSY/wEuWTxrW7X+nIfycos1HVmyntzqeZdVCWB
	 tPB2GvWJ7pgyQH16X7SEjnIOqWLHCJGHKg/1NHImAGjhmhqJcWR/G3msxW0hn2YWkd
	 19RU6zq1duXapSrYF0pGfRuZm++I+gt5fxEYNiC5ifNlJz9JOzuOAl6cqhoI7C28wl
	 Zl1b4q0/EWVfLGjOFxmqjGcQYUBLaFX2FFNzINLhtOSKeKltK51TfvXUtVv4/TB9E4
	 T+UDEH2S250p2ZrpredMQMukowbphOequ+9706V41vEGHrrci2iWMz144eTXwvTSHi
	 Umt8hkM7NmYyQ==
Message-ID: <2be69e97-94d5-4d63-8933-7a17c62788a0@kernel.org>
Date: Tue, 28 Apr 2026 07:58:56 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 01/11] media: dt-bindings: venus: Add qcom,msm8939
 schema
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
 <YzZsuL4AkwyyqAf2UcNu45lsqxIN8DMPUA6OejoKVBCvmGnFPEFeaZEt8qPhdnZ_gqmZRJiTw2uh1oatvb9m8A==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-1-288195bb7917@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-1-288195bb7917@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/04/2026 18:58, Erikas Bitovtas wrote:
> +  video-encoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: venus-encoder

This should be dropped.

The new way is to declare encoder/decoder inline in the driver, I 
pointed this out to you at the last revision.

---
bod
