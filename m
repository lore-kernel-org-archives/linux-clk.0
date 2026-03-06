Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2D378805;
	Fri,  6 Mar 2026 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784863; cv=none; b=sOvZa7ysA+oVDmG/z9E6JLDTCerNIlywq1iVPh64diH+d0GRB5QwS0CcWoZkX3zo+vVZaEfjJYme+BrvatBZNHy9ijGBjFKWww9AFLMdJyYszj33BHJHN1ousD0BtDlwJTXGadvqdW/+hPtLd4GEQVuFvFZoy8PDTz2XeYnOs5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784863; c=relaxed/simple;
	bh=A948579zvWl86p8orwo3k2nV+y6GeQHABHAcfPNG4t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ho7bOCbLvCHwdSplTwSAhYh6sMVqjPvUH3Bm6B+F/j9KHJ75Oizb1v4aRRdCgAzomf1JWero7IRqfJ/Zn7rZrHiooyYDUPmIx/hTAvo3371YvUoe76IWUa0bYdIuiJUx/mYRSFlBxopZyBpyZS3QugfNJj/+Di0O/2c4GLPMQXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNXyP+do; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNXyP+do"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F201C4CEF7;
	Fri,  6 Mar 2026 08:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784863;
	bh=A948579zvWl86p8orwo3k2nV+y6GeQHABHAcfPNG4t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNXyP+doCw3LCMa9HXmzrYDlbaintfckjEXeOiqTJV98tbcEavLIO1YBTnYIhGvjV
	 0c8CjbdIgkVSGa6AW/WraYVvDvOB9RH7cYrwY8Ny7GG0tuthd7CUqTts8YiDciS/gD
	 4rwo3xS6TbrT6Jdil1k9PlBB2sjczN4xQ030RJkJTjbNk17SRZzpzL+cgu2abbJF4A
	 HcubuaGefxkXqilBF8uGo9GFhBLwmODWwFNEXIBOlYuRAbCgySTuVq5XoIi+lIc3E3
	 f/+RtATUML+O7OaQlo4rbmox2MEtATRdhYAdkOrmjJ3hsdhy/8ierSrXbp7jSVWr+Z
	 BnGfAg0daA05Q==
Date: Fri, 6 Mar 2026 09:14:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3
 parent clock
Message-ID: <20260306-artichoke-parakeet-of-innovation-af5b36@quoll>
References: <20260305074328.639993-1-jian.hu@amlogic.com>
 <20260305074328.639993-3-jian.hu@amlogic.com>
 <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1j4imubqcb.fsf@starbuckisacylon.baylibre.com>

On Thu, Mar 05, 2026 at 10:03:32AM +0100, Jerome Brunet wrote:
> On jeu. 05 mars 2026 at 15:43, Jian Hu <jian.hu@amlogic.com> wrote:
> 
> > The mpll3 clock is a valid parent clock for sd_emmc and mipi_isp on
> > the Amlogic T7 SoC, but was missing from t7-peripherals-clkc.yaml.
> > Add it to enable proper clock parent configuration for these peripherals.
> 
> ... but this changes the index of the clocks after this mpll3, and those
> index are supposed to be stable if I'm not mistaken.
> 
> It is indeed more convenient to have the optional clocks at the end
> as it avoids writing multiple <0> in DT when we do not have them.
> 
> At the very least, your commit description should say that this change
> will not break any existing DT because these bindings are not used yet.
> 
> I leave it to the DT folks to say if the change is OK in such case.

Based on commit msg it is not OK, that's why we ask about explaining
true problem and actual impact, IOW whether this did not work in the
first place and authors did not bother to test it...

Best regards,
Krzysztof

