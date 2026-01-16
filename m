Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049D28640F;
	Fri, 16 Jan 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554458; cv=none; b=hh0mdRwG9dmB1qr1AXvA5jCmRZ8JgPfjRh8ujX/tsvjqvh234Xhdv4V3hauTJs+1mGpOuBi8onlYhYuirO0wvgnOSzjK2tNBwOrX+v9NG9OmdEULeh27FiBUORd4Rld7NRQd1nwBjkiPXol+9h1ps2/VeF9CKITsoG+dZw+2qMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554458; c=relaxed/simple;
	bh=Uyza62GPhPfaIQZoBoObSPoMPXlfhoyzO+RPjobtCKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C02Bxjgy5b0NFcRC8MSPQ0yQs4/0FA5vNEW52enT9+Dta4Oj/96OSf4zwO9b579GdD9NfhtKiiQUueT2VZlgm9LSKjWebr0TejuhxxswMtNQXdT3xWEaCL//c3saM+b3yIwtXcs7+uaGE2pTzec1o9OFYiiQqlGe8QfdtqXd5P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pl7UZp5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pl7UZp5R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6660DC116C6;
	Fri, 16 Jan 2026 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554457;
	bh=Uyza62GPhPfaIQZoBoObSPoMPXlfhoyzO+RPjobtCKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pl7UZp5RHLbTXr1qSqa5lzvR33jJVZkIIuwzFB1DnzhkHFnZL2xNEnPaC8ET09fWY
	 3hWbZg987ZXJ8hSh9EIRJ3p5yMnTlbAFoAaAMsY9SrL/GubkTAnqVM7ujG4/gO9brR
	 yJyfZ3UM+JCIrY5ouF+cvw7P7f1mk2ZMYW2g0gBItSh0jR8M5sC/tZfme6JjBeQukq
	 evn+Se0Er42jywIRokurNK/jdE5JOI4j+gyxcWeaSfh7ksGO3yBnzFBLhG+QNdxez7
	 9/lVXdgBJOVf/LqcT/PXIy/UenZJn3YirWFd+XGZFtswG8AIjtqrXkjqYgastdLqEL
	 VXCf2BqnvkMwQ==
Date: Fri, 16 Jan 2026 10:07:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, 
	mpe@kernel.org, mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, 
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 6/8] soc: tenstorrent: Add auxiliary device definitions
 for Atlantis
Message-ID: <20260116-scarlet-hound-of-dignity-1482aa@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-6-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-6-7356e671f28b@oss.tenstorrent.com>

On Thu, Jan 15, 2026 at 05:42:05PM -0600, Anirudh Srinivasan wrote:
> Reset shares the same registers as the Clock Controller, so it is
> implemented as an auxiliary device of the Clock Controller.
> 
> This commit adds the auxiliary device definitions needed for this.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  include/soc/tenstorrent/atlantis-syscon.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tenstorrent/atlantis-syscon.h
> index f1dc6ad33c6d..972a9b7da596 100644
> --- a/include/soc/tenstorrent/atlantis-syscon.h
> +++ b/include/soc/tenstorrent/atlantis-syscon.h
> @@ -8,6 +8,14 @@
>  #include <linux/bits.h>
>  #include <linux/types.h>
>  
> +struct atlantis_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};

Completely pointless. You do not have any user of this.

Adding a few unused lines is not a logical change to the kernel. Why not
adding it member by member like one patch for empty struct, then second
patch for struct with adev, then third patch adding regmap?


Best regards,
Krzysztof

