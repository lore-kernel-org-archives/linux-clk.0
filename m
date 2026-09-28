Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F842E5B2A;
	Mon, 28 Sep 2026 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618440; cv=none; b=VqGC0TA0YezqMBw31DRuiH6euBb9s/VfJVae10+l3/Uu2b7CBvXwDjGOnq70DSfAf2IR0Ta0FVX0Qp3V0bCMWcp0EHh2OMbg9QszROBhzko31eLKtX/KAXyV8pJO07x9CvoAaW46fhpctmKoFm7TEdXodX26k2fa58aVasPrCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618440; c=relaxed/simple;
	bh=pxiEz7jFlAo7sYTs2RAFaGkTMsjZBlX8uSVYRDhuuWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOwwv1XkmSuSzMeloIeoVj5PXCOXCZ70E4mBu5zC5wQ0RjbNydZtxMuwcwEa0p2MqQOWxK4Q8YIpa44m2J8PNm3ZzrNwRcs6LcaQzb9FH3NWbsl50IFu9BoDwSZADQlYs03OC/Sirp6Q5NA6fkhKeDx4z4WU+8OpG1shT7BWLcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YM3LLkgs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM3LLkgs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00F81F000FF;
	Mon, 28 Sep 2026 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790618439;
	bh=HcaLEy+aSsBBwNWWvGI83HL6Snrfq2esQxdiUcmjLOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YM3LLkgsMHlSomKfhVaCVlmwH3/o8gMMPG0706Lcyt9BTLt0IMnhjzQz1a8D6y8r3
	 2AIb0+9FgCGYKbzquRJUXJT504ght6s2QJ3iD2ukoN7h9Xk+Nr9MoKpEwQy4OPl5dY
	 oB7Z4K10d6LIi+IJs6xY8ZpSunt6E6WobBozZBJzyYTdyveIKKU/tYLE4FlKFa+daN
	 UdQ5ze9xfd+ZvcSC8HyIysq+4mCu9dE1+MdNcyR5oWz4hv1ppY7y0B4xtmXeUCXU51
	 3FXndTG6em7M4T8rtzIRDmIHkJFIvFI+9Imbq9iwMbTT3LXV/POmxd6ZWBdc9/EXTa
	 ZdzKsl8vgN4hg==
Date: Mon, 28 Sep 2026 13:00:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Cc: abelvesa@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
	linux-clk@vger.kernel.org, bmasney+clk@redhat.com,
	linux-arm-msm@vger.kernel.org, jbrunet+clk@baylibre.com,
	prasad.kumpatla@oss.qualcomm.com, andersson@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: clock: qcom: Add LPASS VA CSR
 HeartBeat pulse clock
Message-ID: <179061843604.108052.17658578354575313042.robh@kernel.org>
References: <20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com>
 <20260917-master-v8-1-823d2c5d090a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-master-v8-1-823d2c5d090a@oss.qualcomm.com>


On Thu, 17 Sep 2026 19:27:14 +0530, Sarath Ganapathiraju wrote:
> Add a binding for the Qualcomm LPASS VA CSR rate generator node that
> exposes the lpass_heartbeat_pulse clock on Hawi.
> 
> The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
> start of DMAs and Codec Interfaces for the audio usecase and can serve
> as a periodic wakeup source for the DSP.
> 
> Require the LPASS LPR and audio vote clocks to access VA CSR register
> space safely.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

