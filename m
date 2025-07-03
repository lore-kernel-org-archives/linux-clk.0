Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E5A17332C
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555470; cv=none; b=LTimgibvDXxhxpFdr6KdF8LsWwWP3DI5h7H9IEcO0hhALlx3FQ5dwajJcjrPOETzH94MTBffPTHX9o24LVGu8bKNl8MFWT7QCNgBsfEhvRJGAEVvMPNEPUQFLcNDIburFzJk9Ir4SJp0svh5AnQdW3YjwhEVqbiJKQdtAei1lW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555470; c=relaxed/simple;
	bh=QGSsl/5Ibq08H1mWTYhreoVrbh0mx1K0v5BCTNTA59s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vc7pDNCj977fvV8BbU4OJjx1X7NPSdrNMHBlEyQ9IhAyFlzpaiebxEwsgbkrgnu/tEMatL1W/bEGW6aouGAf9iqxfELAiQm9Y9gloY8bUBB31hbS1ZWGwm+HuWlnfu2ohxRvPwT+HOg1x156AGt2WyP66dk6f/m6T0/gPSj0Ups=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bjq3PSD2; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bjq3PSD2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so9041683a12.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555466; x=1752160266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=;
        b=Bjq3PSD2a7xMxFiM94OzmodQ/ejrh4n8rcnVYdMtSe53e9RMXBKKOASjrQoBN7+dx2
         Fd4WDw81Ec+6F3KrQjQEwDdvcmNKmyAg0Ds2iQyL9kcqhxaY8x5UaWuh1jqcAb7Bp39k
         8tn/piKtp/e6HoQemoGc7Jyhu8OuHZrsGzC/vr0IITkGJDHDKDyUjDm8J8W5QsLm5bOa
         8pXQgL5C4x68veywqBp2QpOCi3KjMQ9XBokwkm6dDMh0ZEfaAR+FS8iSyCzgLufKfpCd
         gfMC2ktz3S7YJLPF7+s01nUa2IPijmd5dljtg4xZFnZjfik27+5Es425KnAh4jHagi4d
         oHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555466; x=1752160266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmKfwzTfOhC2oXAq+cEF+jaaYpcNa1VuxJKcbwQc1W0=;
        b=aJ/R4ECAU2C8FAC/3dl/nvGfNfXE4LZia3jxz3POnXviDcHGuFmZSIErSyY5XDH6F4
         eLutNnkoNH515dEo3xt8bWg8HBkQMd7/Q0MMk6wC3NJIA8+qs03L+31e6pWcjERHgHVT
         V6/uFTGKB1FPRqGc4VChDKAothCKEyckIYs8PRYMxDeFF8QzA9EEHFRn/2KGnSZiq8mX
         fRqmhCd2jU8ryh8+m1IGX55dck3jPjx3eoqR3Ny3AnQ0gMJRlF+0oXyCujJisOAzsEmJ
         MDqsjJFBg1c8kUHHX2iH32zcEbio5cpl4opPkcGsMIxLMlrIZPPIVpqIgKyvucI26l0r
         SS7A==
X-Forwarded-Encrypted: i=1; AJvYcCVH45SRbEgG9APPW/hnuhU44dWaFs7U2+9F38DKJ8+4DNnRaUcgsosUQ7PZcsBA4gYZgLoWOH7v0dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1sB8PLx05hvxJgpa68QwPqTpUY5j8p8FkX5RcAC+dJhTKRQmg
	GPkfC7hc8irUfcQCEydFcoXisZtgnNPXAi0QNAJvzW9zcAovaE7RigblvjXTkMRGzJs=
X-Gm-Gg: ASbGnct+HqdhoRduRVRpln1vMlMYiR1yvZ7bxAcs9CSiGxAqBcsO7FaaLW+2IUSP70n
	7veHSST0oLzKg59xMtW81S2Di4SXKVjKnk88hMU+N9N0r9u/enphflkjVnu/Qi4hrvITaAtE/az
	X/DDbuwqbrji2fzU9qc7sPq/esp+b0CRE4C+seV8r9bbw0Yy3OJfL1NykRVDHDAFdybxFIjCmCs
	MKQ+WGf/qwL4ZmnidnX17D5SAv/fsYRKwPt/Wb1IY5IkHfmQCCSX1petmnW7YSe+Ckcd1UxwhAz
	29QizMvBSqfr9efCoNkxOVJgxPkcje9TRBGqwWsK5Eg8jTCpCYjXLIrNiXY=
X-Google-Smtp-Source: AGHT+IHzpMVd5ZdMJKAden1BEk7leNnkWoWJcBZRiZrrIpoemL5vbs9A7FF6CC6wG99E12R7ltKp/Q==
X-Received: by 2002:a50:a412:0:b0:604:bbd2:7c88 with SMTP id 4fb4d7f45d1cf-60e5350025emr5522209a12.26.1751555466332;
        Thu, 03 Jul 2025 08:11:06 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fbf791d06sm258603a12.2.2025.07.03.08.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:11:05 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:11:04 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sandor Yu <Sandor.yu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 3/5] clk: imx95-blk-ctl: Rename lvds and displaymix
 csr blk
Message-ID: <aGadiPWIKbqDVek9@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>

On 25-07-03 11:40:22, Peng Fan wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Rename i.MX95 lvds and displaymix csr blk drvdata in order to add
> support for i.MX943.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
