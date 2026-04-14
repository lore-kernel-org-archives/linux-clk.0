Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1915E78F26;
	Tue, 14 Apr 2026 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151141; cv=none; b=QxAurcFlyXQfp2pY1bpyHJSohZy5o01SUmksVBwZjz3eBBqHkcClMvEwRAUKrcsh4C7lG2mqsviqfefpz0uZSMQ4AyGt09/v17PWqWnYNJrrYE5algSXgsd0Xc6jQRTi7GK6en7KN0IQoCy0XvyNaZcceQKlw2+xryPsQ/Wt6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151141; c=relaxed/simple;
	bh=cAVnFpW+txHpOYtqgzPHGD8SsQmnpiyYAfbX03kDcHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r55mNgCnHTUpmeIj516bxd+WG/RBC7fLfrsK7LIbbv5du8wvquby8OZNwEAWXI7dzDERRaTq4YPNtmCwCkrGkLrkuqaAIIav52tIbq30tHrc/O/84/jb7j36w2XLvI4CRQAmxEWWoAbVZGHvYasQm7TySABU8ihJeCb01MfeUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRZ6d/Jq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRZ6d/Jq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04767C19425;
	Tue, 14 Apr 2026 07:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776151140;
	bh=cAVnFpW+txHpOYtqgzPHGD8SsQmnpiyYAfbX03kDcHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SRZ6d/JqPzfd61MGIS2EF/jU2tOZyxLC+aafAUdRfS9YJkZ8bQwmVMWRvXpPXnTtz
	 op6Z4Y+G/dyCBy9x+MIMu8X6lwZyb4G1cOxYqB0d8yprqHPiMHMb78h07XbAT88Afr
	 eIUKfC9nmOhv7o27hR86bGShISsdPLvZHUzMfYOtm9JN+2DQdp+nTlIf6NMF5yWJUd
	 +g2DDCN3T/cngN6wgEGEpLWjJj+nzv3/5XmzfuKYFCv65yfGzoA3azLWFRkgXGtBB5
	 pHAxunzkPwIgPhucYjOR/ysigT7K1lVqa9DEpsoHkri9Jt9WvbuQPyfAxljA4EssZV
	 DeMSxT8dvln+A==
Date: Tue, 14 Apr 2026 09:18:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Message-ID: <20260414-zealous-shaggy-tanuki-b87afa@quoll>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-1-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-1-007fda9d6134@smankusors.com>

On Tue, Apr 14, 2026 at 01:55:28AM +0700, Antony Kurniawan Soemardi wrote:
> Document the qcom,rpmcc-msm8960 compatible.
> 
> The MSM8960 platform shares the same RPM clock definitions as
> APQ8064, so extend the existing conditional schema to treat
> qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

You already sent it some time ago. Implement previous feedback.

Best regards,
Krzysztof

