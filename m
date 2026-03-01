Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A02430BB4;
	Sun,  1 Mar 2026 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772365980; cv=none; b=UIfF76jy6ymDK9iUo4Ho0BHUjF+5YVXpiCdwjC++/61GZed3uHPSKUnGaMg07InZV6CbmhOLjDSKzi45+vuawQFW0xlCMyAT5LowQGo+xqcwUcTCDymFPW7JFZO0aoXE5F+ZMB8KxqcnSE9DFfkarXeoJb7q6lig+dT1r7YVchg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772365980; c=relaxed/simple;
	bh=nrzhIHJnuPuiQZZEsOPWkcCSX72Ss4d4U6mDvKGB7Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uuv0IPoR2bYRY/tNZb7IZcnwEHxx7R2tpJ1tZX57pescdX0lqN++D5Nq4aaCyGXMT7bTkFEbClH1sZ0Xha8p+0JkiOUF7xqwHLSHVI++mWQAhy8X8XiCv22tclWmCk+cGl0woFewUb/y5qSAobZNu3SGdRUgA5mdVVaiI3bsCb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQ6lAc2u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQ6lAc2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9111BC116C6;
	Sun,  1 Mar 2026 11:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772365980;
	bh=nrzhIHJnuPuiQZZEsOPWkcCSX72Ss4d4U6mDvKGB7Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQ6lAc2uV+Q5L1uIJL0xjwHAe6GgG9vvoi0uMz0WSfMBzy0SDcSMmu7Api9QYz+BG
	 +RNO2HNHlM/a9iXn799EXynkD42dQrmwzY1ygRBaUl5RirP9prQvtITn6/f5DMzKl+
	 HDRbO3e5KjQ6S9jJewXe8EUMzAwjygYoslDG0xp11SQfS06iNqgMouXoBUWitRbXcd
	 Ex8dYpdhiPcIYNpNmWEK5lLFSVeYgqKOSXuvkPNdDY4rV4q27IZmSmp83lqm2D/1LZ
	 E/r2YORoSEaU/CQdlTKO5Ewd4ge5XldrAcG17MzMewS4UPyc8d+cIoztNtB10bQC5X
	 +Svy0hUcf7JIw==
Date: Sun, 1 Mar 2026 12:52:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adam Skladowski <a39.skl@gmail.com>, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom,sm6115-dispcc: Define
 MDSS resets
Message-ID: <20260301-sophisticated-quizzical-serval-ccbf8b@quoll>
References: <20260228204638.11705-1-val@packett.cool>
 <20260228204638.11705-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228204638.11705-2-val@packett.cool>

On Sat, Feb 28, 2026 at 05:41:27PM -0300, Val Packett wrote:
> Add the missing defines for MDSS resets, which are necessary to reset
> the display subsystem in order to avoid issues caused by state left over
> from the bootloader.
> 
> While here, align comment style with other SoCs.
> 
> Fixes: 38557c6fc077 ("dt-bindings: clock: add QCOM SM6115 display clock bindings")

IMO this is still not fix. Missing feature in original posting is not a
bug, it's just incomplete posting which is in general accepted.

Your commit msg tries to explain the bug and I see nothing relevant to
this binding. From that explanation I see nothing wrong in mentioned
fixed commit.

Please drop fixes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

