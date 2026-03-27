Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233802D9787;
	Fri, 27 Mar 2026 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596214; cv=none; b=dsRHr2LenPPXMiN7yu37CQ+L8nUmN7R3pm+9z+dZZ7v4HId3bnNlxBVyysKAqzCbG8kKxWKb+tEkRj0dKh4FyeR9TqM0s/lCNyfksKOMkrXu/zNUoP9k4SpREVpiUCqBeH+0qcoR3M++mdTOCzBcSz6V3Vm3dscjPQQrytZnXuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596214; c=relaxed/simple;
	bh=ja5349iSeyxrcoK4nJXfVc7CxqPLaewDf9iCFYSJO5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIWSnBdBTYHi+60d0iqLw8PqeI8QfnM2Y46YfoDx/4onceXCFgvim6wxae94KtoIECYTmbh0kGTqsxPAqjDM8wWqR+pjbzLh/08+qpKGknWmZeQ7xOW2d9G6kPZXIN0sdfzAprZILnUZpfslmnm4Fgfmh6xsAQHtl6SES5TkLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJnIR+zS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJnIR+zS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9153C19423;
	Fri, 27 Mar 2026 07:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596213;
	bh=ja5349iSeyxrcoK4nJXfVc7CxqPLaewDf9iCFYSJO5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJnIR+zSXK0lGsOYpLSm72CuPXrG2OTH3SP0aF00TgqJLs4cloPSNql0l1feHQZNL
	 a/wrPu4diJXCFDB2+kHfd64BPxh15TR1wt/hy1j2oHvLpR8MaHk/P1Ar6JEpyveATX
	 WSuSiLAcbDPwwSr4J0w0U4mPRB9sGmQnhrMlrTjp72ASCUbeM8Avc5Z4yjPMdvb87N
	 mtx1QvYBWBwv0HyBzcJtzJjZ9F/4kA37zJorbG0VebfTbp1fa17Lx/poQ01kXCnF52
	 Z+tVC2VBK1TB4Kt30xiNQv5nBBtpnS6MvyrYD8chZPP2z7NglJQMIXgvFBS6zL4skF
	 rL4EqEAr1Z2mQ==
Date: Fri, 27 Mar 2026 08:23:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, devicetree <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Ferass El Hafidi <funderscore@postmarketos.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen
 in "amlogic,t7-gp1--pll" string.
Message-ID: <20260327-rough-spry-hyrax-8236de@quoll>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
 <20260326092645.1053261-2-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326092645.1053261-2-jian.hu@amlogic.com>

On Thu, Mar 26, 2026 at 05:26:43PM +0800, Jian Hu wrote:
> Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
> 
> Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Best regards,
Krzysztof

