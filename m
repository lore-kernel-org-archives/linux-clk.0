Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125960;
	b=i56akhWwCVgJp1BYjjTZIslrUs2d4bWJsiI4fETYEyFTKNNONj1M1LBL7ZkbYUtegv8a
	 d1wZ3uemCopK9QQKjVM6nS7JkQsIiDjHnVzscF3nCiz7t9Z3kqdGvfL9NzJsEL9hlL5/j
	 8A2h0Fd4tyim2YPYZ5V4TL6btQe28keQcIAzC3iAA1nPBkxUj1duOlgyneO6/1wd2S+W8
	 x9npOSmCENqm/yYsZ62BkNzNTgf3cw/G0kGYtKZ8PAZk6BkKPhNXDpfQ7bM7Dp27v2WbD
	 JvqF6joe0Jg5cxqKQfZ1FwWDwlqOqeGYlnMkGs6JjLjw2QLGfMrSDtkOrXvVuN4pwgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125960;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wpmhBYVFgFjlc+UhUkWygoy58E3SgWyxA2jBmMXXxsI=;
	b=fcFihXbj+SpaaWZB79h8RRN97OTEg66q6Q1d6xdBcZarM5YTRIgtybLsgfqMh20knmkm
	 8WgRC2WaE20sDVc4yAx5mDjj8Jd4PP5xdfjTWkKB2WCnINFErduzERoXT/a9x5VnepdcO
	 tUoIX4GHLJFWs5MOgbsfVXalG/M8L2dc6DZXeXqElcAU3SxqWqsFc7YKd6P1o1W1fyeKx
	 RIAJUBnRHve56LVmNSWhvmIf6rAEoD7WsaVUeNb8M9Tpw1n3KHJOKVzbo05BpUQypFW7u
	 i7ouEITv/kxY8JQevFFwIwuPL4iPADWexstGUC1Z8kOwBCjmnK4K1lsV+rD9uN1esaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUuF4oLm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79682606A339;
	Thu, 19 Nov 2026 22:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUuF4oLm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18641F000C4;
	Thu, 19 Nov 2026 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795125960;
	bh=wpmhBYVFgFjlc+UhUkWygoy58E3SgWyxA2jBmMXXxsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NUuF4oLm4rq6aVtvbhFQlAzUAsATS4bRhMg6XU8KIjnFtQGGlnO+Hb8egQuJQQFdN
	 GaJukFse7kqtRJMQpeNX6o8XAJF2+WwGYTCRVMCsH77FubLCHYKacojdYoei9pMBXR
	 Udzu8BeBtha1Ah9KrNw3d0RCHF1I379eeTKqU4d4oMcqTITFhmhJdhtSpjfRiN6PgB
	 T6zX9MBhDIheYZBu+l3b2cOs89JVmuagIJAggHDlOnLoj0Egd3JN3C8UaEy3ZOzuFy
	 sWjv0VaMJnBNyldjlxsuyEI7h7SMyKnCOlOA7800NhAWhlfq3sQT/HR2x1k/Leeh+f
	 YiRoeDveeasLw==
Date: Thu, 19 Nov 2026 16:05:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Demeter Barna <me@fromdisposition.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Brian Masney <bmasney+clk@redhat.com>, linux-clk@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH 5/7] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8350
 LPASS VA
Message-ID: <179512595755.861723.9471010792994594992.robh@kernel.org>
References: <20261104-b4-sm8350-sound-v1-0-4c872df294fa@fromdisposition.org>
 <20261104-b4-sm8350-sound-v1-5-4c872df294fa@fromdisposition.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-b4-sm8350-sound-v1-5-4c872df294fa@fromdisposition.org>


On Wed, 04 Nov 2026 18:07:13 +0000, Demeter Barna wrote:
> The SM8350 VA macro takes the mclk, macro and dcodec clocks, as SC7280
> does without power-domains, and reports LPASS codec version 2.0 in its
> core ID registers. The SC7280 driver data reads the version from there,
> while the SM8250 data sets 1.0, so use SC7280 as the fallback.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

