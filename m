Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C7325490;
	Tue, 14 Apr 2026 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151173; cv=none; b=JAZYM1gcmbtyUfU5JtdyHnGpQj7JNcyLrmUp0q3Vw/MKwBM1NnNDEG06mETVbaUP5BPP1xHYizruhB9t3KVoVuqCkbDqmJrqsKGxAfq5Nf5wGfz9CXApw1LP44y9AwSgEpB/t/qm4vlIStreMYpU6zv91mGObi51XEeLD91d8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151173; c=relaxed/simple;
	bh=WjtCp1npkGFU3ZdPOnwHWfZiaQFuXNRn+hUV1ktB9eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzGfct55Q9dvdMswTaa3bgRJK5P4TciqLAewtxwdRGnVPDwgNxK1iYRnkA5BmSMgko0pOrQq1keR1EJ9CkhQcFZhChK+htHIcCFX/olztD4qfhcDyPZh0OSPlIeB/28vC4IpjXoZtOUW8/5Ry95TkiX1v2PwK6vzuWiEAFNJH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/KAbUXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/KAbUXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02FBC19425;
	Tue, 14 Apr 2026 07:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776151173;
	bh=WjtCp1npkGFU3ZdPOnwHWfZiaQFuXNRn+hUV1ktB9eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/KAbUXpYgp6GqGoGmFxx0fPHFViNIf9MNqzNXx/VcJkJlLinOhL/coRsx8RHwkb1
	 3I49OVlVFz9kbZCzmedCBaSgCK9NOKR9WH1fpN/RYVdZdfAfQf1MeE1cOjaG6rcFui
	 6GyUPdrQQWCHSMzJY1KiFT2rrjCIa2WC+CcwrnFbj7nCmDOP2n96uK+RcD/nDRAK8C
	 25ilV6xsT83zv6xaVy/f2AdjpM4qvSCLzZR6DIelVxzGJhSDa3vjHqBegj3XSj4djw
	 1Mxzb3UnDt4uzbVZoLhcuwp1QIG/ep40MOox53NCxY2U6zdwe6LCbFWcice+Sk9/Ev
	 7TGKFX8j4zqnw==
Date: Tue, 14 Apr 2026 09:19:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
Message-ID: <20260414-frisky-aloof-koala-4cbfdb@quoll>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-2-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-2-007fda9d6134@smankusors.com>

On Tue, Apr 14, 2026 at 01:55:29AM +0700, Antony Kurniawan Soemardi wrote:
> Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
> present on Qualcomm MSM8960 SoC.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

This was also sent. Where is the changelog and versioning? What changed
here?

Best regards,
Krzysztof

