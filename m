Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43D331A43;
	Thu, 11 Jun 2026 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166616; cv=none; b=rFHCObC6/eYGtN79FK2cp/2lQrJqaJ4D9I5Q9/AZDGw9XdUBUQBoZuwvnkvBIeu7rtrIMg0ttD0WR45P7X564Nsai9h9Nb0ILT9GhyLPfXXRu/UjMGbvFaK1Rn2BZJU1x408yy5XKBVzrQmn7jMENDaHpX5fMjoqGNk1/rPRKCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166616; c=relaxed/simple;
	bh=Xofd+whKEJZKn91v18JtX9Jsbuw0Arf6Z4wlICs6CV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVkM9cvN5XFp5O+edQbZRsuKHnjJaCrg3kr2eg1i+FB85rcO7S6fWX1EeYg2Lb+VNrpRYrBFenj31jAl/1W83hQg+mGiWvJSoR8ZZVFAbBFuXPcLtm/2Rpplb93XZ48iT2Xyrmc/NLah2qi6bv1RUf0AFSQpE6ooDZ+jNK1eXpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kavC0rJj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kavC0rJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F081F00893;
	Thu, 11 Jun 2026 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166614;
	bh=F1ExGdbv0WMqPbqWELX7zmSnbHIM1K43ipe7DRmsZqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kavC0rJjGkE4NQ8erWqEZMX6Ni5Q6BtJ/HnnkOFJjq1Ung3nUkj857J78OE9V528M
	 8L24Mdakd0A03fBeudA7hIWxsYY68fN0xcAnxMncuUTyPGwqUVNR99JuqFq0r9q8iZ
	 cRiQWDpU8j9dK5ETKuS2OTIbxB6Al3VneRL26hmm8DjNJRXf8xngcqi8b6IZ3YtFM/
	 EZg1is+lXurOqxoNATTXKqK72ta3Mxs49EIQN9eL9BKX2mZWZ1CuSPo1U99vcciQjp
	 2dFH+kBe48jsuRz5DLnU0te98tnzRMB+uWc9SbwNe8HMu5uMt0Np62JJh3s8Ziit9d
	 PMF5p1f5FC7vg==
Date: Thu, 11 Jun 2026 10:30:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: clock: qcom: gcc-mdm9607: Drop
 incorrect clocks
Message-ID: <20260611-natural-mandrill-of-certainty-1eab46@quoll>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-9-5e9717faf842@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-9-5e9717faf842@linaro.org>

On Tue, Jun 09, 2026 at 04:14:45PM +0200, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> These clocks do not seem to exist, they have no consumers and
> reading/writing to the registers fails. Drop them from the bindings.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  include/dt-bindings/clock/qcom,gcc-mdm9607.h | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

