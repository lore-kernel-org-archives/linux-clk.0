Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6001B3B47F3;
	Mon, 22 Jun 2026 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136571; cv=none; b=NfwNr+AQb+XKHBAubLTkedNzf+hOtdFGCNfZy6DKmWlgRKW5eiZYjzSeWASxtwbHMmcrWc+uRgv0zWM2AE3krNYfTuWKo6+KfaYlMoywR+u+W00Wf99Ejy5T91WcK/TMu3wOkyEX73a8gT+H5dOF67F1YmI7r6exNNreCY0ecg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136571; c=relaxed/simple;
	bh=iikRMKXAlVaPR/0pHuWi9d4G9BZaBSLWWvNs5OXMjGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vvb8n6RVaBfV2uis+GwTkHS5leySx3zoaugGRLOPKQe2kXlOPcFrUJDkOJr6oHUhl15zlDcHfmb9+JO/tJxN+tp5+hK7r517r9Fm1EVQbbX7y2NESl7LxljIXivbR5a2TrHTFWOBlFY4CmCHmQ5SaUSBl/Dmf0D0sEmQEOE3J9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+LAmCWV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+LAmCWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7381F000E9;
	Mon, 22 Jun 2026 13:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782136570;
	bh=oKPEl/5kCiDiYCUDWLMa1pIvO9b3D4oGCZaPnidyXKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b+LAmCWV+592EqfUvI8S3kLUHg9HmzY/5nd38PSLPZy68lVpYn8Tqa9rSkF5PJIa7
	 iMdB+TwdQz6WCFyqrdQ1cFku2w4StL7iLRrwGi2uJr8QyH4txZcQGt4v9bLHk4X+dO
	 PypWxzSgKgCCmZS+lfIRaDRAU5vreboCRuHaH0wOZ9U6GAmxJsJXFE/SWx3x6ya8oI
	 qIcaAbEBreWWhJMwHyr4GTGA2/c0FtKgHP+4mkgGlCznEx8V4n6iHjCzC88HkUfxnh
	 YaKHziOspNCFoAsvLjOP32vkj5E79qRuKUBAs4QUpR0EOAhd412QNTTKAkxu3M5km7
	 ilEnkym8mdbRw==
Date: Mon, 22 Jun 2026 15:56:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom: Add Maili TCSR clock
 controller
Message-ID: <20260622-vivacious-camouflaged-loon-ed6fd2@quoll>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-2-d6ede0352113@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-maili_initial_clock-v1-2-d6ede0352113@oss.qualcomm.com>

On Thu, Jun 18, 2026 at 10:51:17PM +0530, Taniya Das wrote:
> Add bindings documentation for TCSR clock controller on the
> Qualcomm Maili SoC.
> 
> Maili is a derivative of the Hawi SoC and the tcsr clock controller
> is identical to that of Hawi. Therefore Maili uses the fallback
> compatible to reuse the Hawi tcsrcc driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 34 +++++++++++++---------
>  1 file changed, 20 insertions(+), 14 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

