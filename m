Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5559A3822A5;
	Wed, 17 Jun 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690301; cv=none; b=T1s5kuspY/lzmZHW86gb1KFhP44woqXmDLOvAUHoCFf8MOER2rVHQ3oFHW0P4Ukr57LeDNzBngDMef+yiz5xqiF3W8PMU1RAYHrNRknutbIYt5CMPgvei1c3OQTW+4Bgd28J5qe3ofMYRA6UJMh/W958u5StmW3Se7xy0K4HNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690301; c=relaxed/simple;
	bh=yDN+8gnEEzMED9u7OdD3oDa2lenAsLLZwrQ2SVkbawE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHheV3c+bQG9eJMmEp8av/oPbMsVp88ZdLiCug5eovHTxAJo1hhmX3NXyX4B2kz/OXo+++2oESXdOo2nUrNTH4lxfHkcEpZgcknattl1AGaLvwWLRZMt+zT7O/ipGHQqrw8GUK7/WGoqWW1I65ROgf8I73jGY3RaI0a+rusBxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxiyCdpL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxiyCdpL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952DA1F000E9;
	Wed, 17 Jun 2026 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781690299;
	bh=gW3QyLAroMbA1DKyMpTY9HlU1YYW78GL50jPWg3Tu54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jxiyCdpL1HTwvLnSLKW1WWsIoioRWPMRXkFlzBDQPKCrSz0If233ABjtCTtqSKGAc
	 WtsEP/k9hvSVI8mf4D/aXGq2bI726yavwjotWIKzlArQoXMaKtT/7+th+n8Cqo8ndJ
	 oQ9gnsWo3wxPmvj9yvFlHulm/kImjISlyil6KLt7SXq2KHL3l/gKXHZoP25OzJ0Cm1
	 hO1l4OR8zjjQJmrg2QLJgZf6PhzCNuuLpr2RttvIMrADKrIwXxM2tnZWwhgcwheKGc
	 xr3PEvgHDebC3v1gE5Z4tE527fPfN5ZXerLrcu0fbEIWODgV5dpPJMNWJUWKRnOhVF
	 pHPfmOVqCrERw==
Date: Wed, 17 Jun 2026 11:58:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 resend 3/5] dt-bindings: clock: cix,sky1-audss-clock:
 add audss clock controller
Message-ID: <20260617-delicate-comical-chihuahua-68eadf@quoll>
References: <20260617064100.1504617-1-joakim.zhang@cixtech.com>
 <20260617064100.1504617-4-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617064100.1504617-4-joakim.zhang@cixtech.com>

On Wed, Jun 17, 2026 at 02:40:58PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The AUDSS CRU contains an internal clock tree of muxes, dividers and
> gates for DSP, I2S, HDA, DMAC and related blocks. The clock provider is
> a child node of the cix,sky1-audss-system-control syscon and accesses
> registers through the parent MMIO region.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

