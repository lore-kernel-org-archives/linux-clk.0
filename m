Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FD64;
	Thu, 23 Jul 2026 19:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784836649; cv=none; b=phcfyuueodzD/+kiMQjulouH1ckCojpMLdNogQoBziJcchYRcbXGvtsaqh9fYdzh2r/AvAgL02LKE64iHrBXfEXxBD2F1AwU4Jp7jApDhH8wpl8r7r+QzbNofnCf/wnGmN/HnC+dtfbSOSR+IuUb/RcRJWxXmNeXzmxKcznEObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784836649; c=relaxed/simple;
	bh=tFJ2hawrBaEcUojdE7zOIMmA5tglcGqg+aQ8qsWK3iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIj5OYPYC1uVgw5zN1xHmgqQm9EEIxo6zvw9g144pCQ3ZA/Bzs2hpvkCQmoqrQHtkr/6NsRrc1r2+wUMcLFlbHRq30J7hCN/GNO6KI0x48oWMOPZlt7PQi2hc7FAU2dgu6jsts4H9lgmhcaDkYevRLB7ln22dvJO1IgpN2vonpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FR0uTCUB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FR0uTCUB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0311A1F000E9;
	Thu, 23 Jul 2026 19:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784836648;
	bh=pGPdw6R7xDK+KJybRUlUGsV1bFG01ElOm06MjwCcC34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FR0uTCUBVkIZ0vqUibPRyjm2Ttw/efDzPDlGXt9dsJEtCLIX3ichy+igRc+8bDcS9
	 HzDJx3JtDwAxw1d1E/kIvvtyWpr7SGAnCYGKS05UdPtNVEOyu3EBHooV8AQ8nhJShm
	 tLUCu5PGxh3/zF9ChjeYNUJmh27ys1I6kokNcdOqCd/7WQ4QU5vuDtx3+7AK0fI5ZE
	 HDxL9tn5+E7RJ3ApzX84/CWtkghoPYtdejWfMX48JKuaX2EjtCwOFW2YTi+rYlBRry
	 xvXfnCNd4N8Pv8p2pf9e2BTpj7ZlmRl1eL7RQ+W7p3SOhsph+uY3a8tmbJgOEbfmUm
	 wmSwp0qyU/Bbg==
Date: Thu, 23 Jul 2026 14:57:27 -0500
From: Rob Herring <robh@kernel.org>
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org, Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: initial MSM8920 and Motorola Moto
 E4 (perry)
Message-ID: <20260723195727.GA2690536-robh@kernel.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012431.48499-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723012431.48499-1-aneeshpradhan@acm.org>

On Wed, Jul 22, 2026 at 06:24:28PM -0700, Aneesh Pradhan wrote:
> Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).

Please don't thread different series together. No tooling does this, so 
you would have to go out of your way to do it.

Rob
