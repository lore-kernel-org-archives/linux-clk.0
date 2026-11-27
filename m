Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781035;
	b=pFBBDnxJVZciol4GYB9ayGfTJRVaD7ZumMashR8pQDJCk223sUSsfgB+ee30WuXUxMbk
	 zB75wmtT9ydyjlE1g8BZe2hMC9FLQ4/mxX4yyr8MqmcfiaIYDhJIReQ0/RjspYYzILMg8
	 LuIsNXdEw/GpyWAyo6dAZJ5jc70ezjFCUfIccuCkBh57FMU1lkfdaUtsSNSZ7uc16yFlV
	 V1DgCLfivms7+ZBm1En9IK3tYfZlaW5vRLBX7l/FZff7mf8OkumYzx9m48M/mIFHSOgbz
	 1i3SotxOFW+DEfCH+y/DuXV/x93Zj5GxpF83IPUTzDzN8RlAaSamtialM6Xq5N+n4SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781035;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Yik/n8iz7h63HECswpB5ExxSWT0WENJmafy9QiCrTEA=;
	b=2ol8mdx6sRsTYTvePDndJssAUviIwxoB/ExMYwIDyB9EsWBJSIOp1l10FBKRIdpkGMYg
	 sffdEkrWY6N68+QnuziA4xeHKPUJ5V6cQAOIvcUwckiX15OgfK07Vzbxpct8YIGc1Lm8P
	 oVJjmagb7WeQ6R+vTgGScHMDbhKkK5Sdxn8aLKb4fOuuOIW6PAfusnutRaZ4X47vDAG2V
	 vYhzVsdoD2gya8pnuyd3uzUk/WOxkSAi7Sv1LbcIp1L3w9rAKJegyrMJRkbYbcbWzrBAP
	 v0swaOsNn+Uil3PUvSUKLoCAc2CYDKND9s+4vjEtFyVgyY7sWsBxIaiFOlYXz6ZZXEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gaC6ydv1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D76606A31E;
	Fri, 27 Nov 2026 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gaC6ydv1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846271F000C1;
	Fri, 27 Nov 2026 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795781035;
	bh=Yik/n8iz7h63HECswpB5ExxSWT0WENJmafy9QiCrTEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gaC6ydv1hliAiu3WeXY2K5PW5f2w1B6vK3CXq/gu+3ee3Oykh3etdYgg/tAac4LNt
	 Y6M7jEJ/5ZzRCGemihEVG/FK5/pSiJz5GKfAFQClS36cRY8GZNx2MBGActTeXPYkSv
	 N5ycNTCj+bh2j0s4PvsEwrhDgrRjddG3aURXM3CzIRxRtvbfx42maDnqg7PseBs40X
	 SOa9QiEkwG2fSbc5IiS+ykt7jOA+CO3BGZwb+vl+k+RZR5xkMuoJqL50S76vPIwM+r
	 b10bD3PhT1w+GjvQNqPPAg9EC1wwn+fAtKeBgUxCjEIbjXsp1dpYU9o8ECealBwxLT
	 tMP2GQo7DGj9g==
Message-ID: <ec5e728c-e266-4df2-bdeb-6564444a7222@kernel.org>
Date: Fri, 27 Nov 2026 14:03:50 +0200
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even
 post divider table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Taniya Das
 <taniya.das@oss.qualcomm.com>, Melody Olvera
 <melody.olvera@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
 <67b17c55-e87c-464d-8c1d-fb015041be2f@oss.qualcomm.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <67b17c55-e87c-464d-8c1d-fb015041be2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/26 13:04, Konrad Dybcio wrote:
> On 11/25/26 10:34 PM, Vladimir Zapolskiy wrote:
>> The GPLL0 even output post divider table is not terminated by an empty
>> entry, the table is passed to divider_determine_rate(), and the generic
>> clock divider helpers iterate over a table until they find an entry with
>> a zero divider, thus they may read past the end of the array.
> 
> But there's a .num_post_div?

That is used by driver/clk/qcom/clk-alpha-pll.c internally. In fact, and
in my opinion, it might be better to remove it and to rely on a sentinel
only, if you also find it wanted and acceptable.

And if you look at clk_trion_pll_postdiv_determine_rate() or
clk_alpha_pll_postdiv_fabia_determine_rate(), then, as it is stated, it
becomes clear that the table without the sentinel is passed down to clock
framework functions, and that's the critical problem fixed by this changeset.

-- 
Best wishes,
Vladimir
