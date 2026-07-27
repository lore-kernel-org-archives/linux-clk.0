Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864413C3F58;
	Mon, 27 Jul 2026 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182518; cv=none; b=K0GqdyFdQ077OdDytJ/fctBoMLHIViu5xyNCJTM9BqCWJrodI42UiWzWXvDL99+RPj6222stUKPZybbb10Y0DZQQT98u8SVPW6K6/8yiJTZ7L6/XIXBm9HWSGQe4buT7o13UJ/6kdcpE2eWR4aBv/TNtRzP61x6Rx4st8Ue4J2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182518; c=relaxed/simple;
	bh=am6IE0vCftony5hAmYkaJNqAwMDY4BTsuz4BcUPs4kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iw1i3N82vXCtX+cEfFEiMrlo0o+yo0wELKvl21pY5NIS1cEuOwF6NhPX6NNcYYxiJz0O6vOUa/fIiu37487e2h5OcIogTiaRwnqi7j6OoyyBEyOaw2GZdcprIp/xPy1Y12Xn9Z22iwGbAiC/zR+nJjMDmQ/aIuJlsx6a0vXyWNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz3g3Pc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz3g3Pc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15A81F000E9;
	Mon, 27 Jul 2026 20:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182517;
	bh=E5fgYYcv97X3cmNAX0LPuBoe0o+iYp8x776W/oEnHq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bz3g3Pc9CCjO7t0a/ai27As//iRoXOFna0d6uiBsr0LbGLhzsMDFOnZ6gyUdtzfle
	 ji1NSWkob04wed2uU0StlIB47TVKmRdU1bvu9+kldRtqF79wSnDzfE/3oMvn3ltAbM
	 tZ9Pul7Uh/vHiilQgDIPpBnYGh8vzZhAqP6qc7xsX5nRwkWim00fx3exTOnYFR+I5z
	 5lbvbNxkN38WJcYVgkH9HdJMOG01kZPIJKvtRNA2E/DQ0B6jfe9xYqW8rsw7G+6otL
	 BHSeNVLTh3HqAn+LOua8sJrxFHCqZNcT79rO2AaoabfQwuQULNhMMqPhmtoDj4l5NT
	 J+B6s7jZPmS8w==
Date: Mon, 27 Jul 2026 21:01:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] clk: scpi: bound-check DVFS index in
 scpi_dvfs_recalc_rate
Message-ID: <20260727-generous-cautious-vole-829acd@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <aa54a3b63064.1785118770.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa54a3b63064.1785118770.git.liuxixin@kylinos.cn>

On Mon, Jul 27, 2026 at 10:19:15AM +0800, Xixin Liu wrote:
> dvfs_get_idx() may return an out-of-range index if the SCP firmware is
> buggy or returns a stale value. Only negative indexes were rejected, so a
> large index walked past info->opps and could treat garbage as a clock rate
> (KASAN OOB / wrong frequency to consumers).
> 
> Treat indexes >= opp count as invalid and return 0, same as idx < 0.
> 

Again this issue of out-of-bounds read is in the original SCPI clock driver.
So include the below fixes tag:

Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by SCP(System Control Processor)")

-- 
Regards,
Sudeep
