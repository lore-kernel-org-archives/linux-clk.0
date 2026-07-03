Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14EB378D9B;
	Fri,  3 Jul 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070629; cv=none; b=HDnAef2n9rPOfQ6Jc6cJT9vBufkXtil+0Bd5lqeV9xpe8tbRG6vTC3Y+911nI9acd/4M/F7VUoUZLFS563AbShY2q0AFlu9WpppIT1Ow/NsDIOrt3UScWUBSuGV7m6Gee9O3TBukLkHVGUG/x8qkOXKCuhPwVomJWGbI1sJ7xBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070629; c=relaxed/simple;
	bh=SeRVzFJ1nCvET5lSJokzi8FmrSxdBYU+mKcpQ9x4Rtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDDuwaZvOHFyjcG8D69HypGKA4c38hfAV6+MpCrFxqhyljkgFSXbqQBdZfNeWaalfMI1RuDLOSm16ToNBDolOPdW3dqD5Cskxa6huqaI3+kE49kIsLeixFW02WJfnqtXDNDkS3lJclQSEeXlbQcXhnbfDFOK8r10PLMGm8oOwHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9dSDL8W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9dSDL8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B88811F000E9;
	Fri,  3 Jul 2026 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783070627;
	bh=BTsbkzKqRt/9QZjZtR3MaPSTXt8k/gxCyByBOMZn9OE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h9dSDL8WYqPPKjfZlQJG3rkunmEnS8718Em9B8D5sMxIdDzYAAnp7tgWN50sFoMvj
	 NJMQ00fzebr+3q6mr2OsKalLrqQaq/CEQSvyrngUAnW7htanXfC69FJVp/QubQz4D5
	 9xqEzamyaRJDahY95FkmSfjji4xOxCqb6Ksktdusi7NDJivglvCzfGNY/2E1jQSMRA
	 Yauc0bDJkB9AXn8W7vW5jB9wVoaVDGFuzf9zrjYsZwJJwLktKoYoXeIZbxonOO7jhj
	 77iNcq4prgYyk8CypOXrLmAnURkZVffYbB/t96XXndvqjs/Xqcu3Wd1zZIs6cdL0VK
	 bf3I1VZVf8Lzg==
Date: Fri, 3 Jul 2026 11:23:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom,a53pll: Add IPQ5210
 compatible
Message-ID: <20260703-astonishing-lyrical-camel-bf3adc@quoll>
References: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
 <20260703-apss-clk-v3-1-4785e89a9c58@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-apss-clk-v3-1-4785e89a9c58@oss.qualcomm.com>

On Fri, Jul 03, 2026 at 10:33:47AM +0530, Varadarajan Narayanan wrote:
> Add the qcom,ipq5210-a53pll compatible for the A53 PLL found on IPQ5210
> SoCs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

