Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B026736493B;
	Tue, 24 Mar 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342081; cv=none; b=YUaBZUaOxZbozfQQ6ShP9GTrxwIjXK/BH8A3USyyKOKvDhIKw9LFaSPToSaDiqjZWyo/46sSWHKEwFnyaUsEnvC6w93+0PWsQJDBmWUFkgUS1OmZp/+z8e1aUklzQJcbv3ULgw3nvAuWHje3/0lOggNhD3grIReAJwnGmoQgqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342081; c=relaxed/simple;
	bh=ix2Fecint5FiA5s4mDWUWlFNQNkl4uSNPkhTuoKP12s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEveGZvRBdGG6+7b7IQl/AxuTs57W5a65+4IbZVM508Me5m/Cu9s6wnvKQ/TeDSkrjl4ERxMMQSyNzI/nHNmxeX7CU+oSyGV3PVuIKpJlIcA1UIAp5cIaD0wAhTuApe/bZNfQJdnOXiTa3DYOvcf8tVkOf+NkOnNvcyUiQAGmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnnfWuz8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnnfWuz8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5DEC19424;
	Tue, 24 Mar 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774342081;
	bh=ix2Fecint5FiA5s4mDWUWlFNQNkl4uSNPkhTuoKP12s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnnfWuz82pjwgSh/h6fYf0TXk243a8v7a1di3JppVUY23vzEqT7xvFmdBmc/7nUmA
	 bEMp3Db02y6MRqJgu9fyMuxNIqgjLF5QA4LvrwNS87mV5OZ4v6FzxiQIuSSXHbHfri
	 KF/2j8WeohRz+pi87mV4eA5O7q5W9Dm2AWmSgcczp2NfNyomz+ey3jP9NlFMbQi1cF
	 gfFCKz+dtGKwaZ2tMAV5Cuzzlrd+w4p/moO80HHk/LAkcW9EpOX/lpdz0Y2BOKn03I
	 4DodTuA6xP20OZ2d2sDtBda3LoLn6idzjwbJS6Bu+2+OHF0/ezmW3NYtIA3qPVqbzZ
	 KTSnibFDJcTJg==
Date: Tue, 24 Mar 2026 09:47:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	afaerber@suse.com, jyanchou@realtek.com, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v5 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Message-ID: <20260324-chirpy-vigilant-pony-c16e2f@quoll>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
 <20260324025332.3416977-2-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324025332.3416977-2-eleanor.lin@realtek.com>

On Tue, Mar 24, 2026 at 10:53:22AM +0800, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek RTD1625 clock and reset controller
> 
> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

