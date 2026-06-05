Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863083F8248;
	Fri,  5 Jun 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655005; cv=none; b=iG9NqO1KA4h+8hD6abFU/DfjwdGlh4AwvwiBi2Ee+2gddK32ugzpUesYkdj0/dSBnPhxU9acV0XpCOZ+eZ5AQexE69dc3O+CRLOvioExPhNBprZzWacRFmGBlM3oW7x9kv1XB+APDyLJkqpYS9pPwX3Rq9uZVW59ZOA2c7Ocing=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655005; c=relaxed/simple;
	bh=BL4Qw6SNEfpdnRJS2X8FfF3VRzBWdFS4Vu9uPGJ++6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0GxfXS50vtYQhxMeSyJHHtyyHZonM3mBHGNNFdStAAyJAuON8XG4JyqEw01I2zLR3qWK2EZnkE3DHK9SBFGyUfyym/Eu5yoW9+BeOaISxg9AXevIOxMvJi1o9MVNUSEN+/FG1mtFIPWwB2cdmwaWvUaz0US4rGfbcmMwgX3U1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XssGX3zb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XssGX3zb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37AF1F00893;
	Fri,  5 Jun 2026 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780655004;
	bh=BL4Qw6SNEfpdnRJS2X8FfF3VRzBWdFS4Vu9uPGJ++6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XssGX3zbTeeyhCKoRaYNHrKDD+WLziiyLitKf7TbYGRd1enB9No/BNFOINU/KlOuz
	 FAiGimwhrNDfM/RQSuKru5xNHUG+1O02MaYme3gIb0ZhDRPt/j6eOFmlx7cY4Pf7oD
	 zrg4tWt3Z1iGCOcMNRHfOPIk0hzOYVQZqJ/Tk4gEXAaNuipXtcQfKVxjRrRioLbuVF
	 wJ6CVyrSD/sHOHkXThBH6hWzbc5C4oG3NFLftYQPzBv1yyzTrvfz3UgUOEcCBYflbF
	 n2nwwjK1lwl7uuYcCwYn6JHPgVx6Vxwc3X9dvLHQyhdR+OVhio3LlHyOj/GWBoS7eW
	 eAf3Hl5mqe9BA==
Date: Fri, 5 Jun 2026 12:23:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Brian Masney <bmasney@redhat.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/13] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 DSI1 PHY and sleep clocks
Message-ID: <20260605-eager-lynx-of-eternity-f77ecb@quoll>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-2-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-2-8204f1029311@oss.qualcomm.com>

On Thu, Jun 04, 2026 at 10:56:08AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC binding to document additional clock inputs
> supported by the hardware, including DSI1 PHY byte/pixel clocks and
> the sleep clock, alongside the existing clock list. This is an ABI
> extension, and existing clock inputs ordering is unchanged.

That's ABI break, not extension, because you require all these clocks.
And "dtbs_check" would tell you that it is a break.

You need to provide reasons why they have to be added - something was
not working? Something was missing? Did it matter?

Best regards,
Krzysztof

