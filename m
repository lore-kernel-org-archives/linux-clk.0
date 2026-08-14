Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03098486653;
	Fri, 14 Aug 2026 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728954; cv=none; b=VxyW4jrav7aUfFruqMPSUkNgTWj6zRJRzFSrgAMT67gZ5Id6RETS0lxNOVLqhGjcDOEnY/3eTjzjNMEuV7iz3poYm6V+mpB+0f6HZWwxRmJRsaRvIPKS4qYYRx+/5ioPIeHxYRgTK2mJFrstCmLivtDPIwI1gC2Xhu5kiCU4Zls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728954; c=relaxed/simple;
	bh=UCRNcwRImCmt2J2xUVAzQFTxwRUI3SmxX1HYimsMysY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n54JwT5DSjSyuCc+jY6B88gbn9sAZLVAA3j1DWdua/oqFavBeX8c8KJfEvNc6oB7YlV0fQBYF67A9ShwjB5IIyhFRK/c+HeD7X0V32iHPzBEfyM85Wj7rkdo9XL6iyko2ke6rr6qARtQZ+h4HAT3dnyjQqa9qLRuz89SlMB4Jv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyPUmySi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyPUmySi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EB61F000E9;
	Fri, 14 Aug 2026 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786728952;
	bh=weuJZ1VT7QEqJEBbSMZvTgF8lW041Ae6CRqMd/15R38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dyPUmySilHpNl+6FpK3pmtJiPcaETF2AdziT3xBiV+YQAjI8CoYwXy7B8NkWqFUsd
	 TdohTOXPCtSHiSpIbH3EWTlWqTWenT5XlH4LOPIv5o9J6Jc/AIW9zPEmZeCV4hYPma
	 tEXBSCDZSG6KJhIOeJqukpCtr3UXB7l2m0uJtjT2aU8yTqhNPcTm/iuXHrPXe4Lc1F
	 ulaMB8M3AHTbXj4rSIi/CJpVA7gA1LHjj+ojJYCtJUPFG94ucMcZnK7AhIGO+w4MbO
	 wrZGNgMzDAvZQWRibepzw4bMcnxlzqxgB8vBSFXZ6pMxugCGLn2nYGqoGS3YI37EQC
	 LX0Gh9VtUYMUw==
Date: Fri, 14 Aug 2026 12:35:51 -0500
From: Rob Herring <robh@kernel.org>
To: "Chiam, Evon" <evon.chiam@altera.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: altera: fix Agilex72 compatible
 vendor prefix
Message-ID: <20260814173551.GC1981719-robh@kernel.org>
References: <cover.1786006669.git.evon.chiam@altera.com>
 <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>
 <20260812024937.GA616612-robh@kernel.org>
 <b027b8cf-a97b-4670-a57c-1585feccb21e@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b027b8cf-a97b-4670-a57c-1585feccb21e@altera.com>

On Fri, Aug 14, 2026 at 04:18:59PM +0800, Chiam, Evon wrote:
> 
> 
> On 12/8/2026 10:49 am, Rob Herring wrote:
> > On Thu, Aug 06, 2026 at 05:25:01PM +0800, evon.chiam@altera.com wrote:
> > > From: "Chiam, Evon" <evon.chiam@altera.com>
> > > 
> > > Altera has separated from Intel. Update the Agilex72 SoC and board
> > > compatible strings to use the Altera vendor prefix instead of intel.
> > 
> > Sorry, without better reasoning, you are stuck with them as sashiko
> > pointed out.
> > 
> Sashiko’s comment on the DTS still using the intel compatible strings was
> based on reviewing patch 1/5 alone. Patch 4/5 moves the Agilex72 DT from
> arch/arm64/boot/dts/intel/ to arch/arm64/boot/dts/altera/ and updates the
> compatible strings to altr. With both patches applied, the bindings and DTS
> remain consistent.
> 
> Would you prefer that I combine the patches 1/5 and 4/5 into a single patch
> so the binding and DTS updates land together?

Moving the dts directory is fine (though that is really up to SoC 
maintainers). Changing compatible strings is not. It is not about the 
patch split. It is an ABI. There are exceptions though. Generally that 
is if there is no one with the h/w or the current .dts is so incomplete 
that anyone using the h/w will need to update their DTB anyways.

Rob
