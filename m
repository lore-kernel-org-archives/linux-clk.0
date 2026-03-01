Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF04430BB4;
	Sun,  1 Mar 2026 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772366025; cv=none; b=C0w1F+55jOJHvPNIuwd10JI8oGjsotOSQih2vm2JEsWP8rcvqVTivMLrLXf5zCw+IQKpZhaD8EAPAft3ff7WdQMrVTO3BbSwNipbblTom8cPcxN9CeWxKo4myY3Mhk1iDyxMCHlqx1cjd0ahiFLRgiPqzrk8mv5YZF7wx8SRmSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772366025; c=relaxed/simple;
	bh=mOTu4OqbTqgy+/Vr+D92KQPw8HJsPBeteZFfuCSKfz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4RJa/tnYXvLenyvZ2q1O/KoiwEs1qNHWCvxnSHbLewJF+MoiDq/Eqe6e5tETJ63GhBn80mruY2aZXddppN4aoZKu/SLe94UPyzuk8+KarV5RZ+UGAosi2I4SQeyuPCgsHLqOBzjqhOZ3sBjMq7nCUJY/mDuupQZl1WQiTrJs08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0h++Pmm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0h++Pmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DA2C116C6;
	Sun,  1 Mar 2026 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772366025;
	bh=mOTu4OqbTqgy+/Vr+D92KQPw8HJsPBeteZFfuCSKfz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0h++PmmbLGp4Puwt3HxQflHBvdqo8i3AebZwE3wtNgaC+1hl6vixyrIk6DyvgcSj
	 W5eFdjR6Wllpz7oLmSrvfbqMRSiPlJ/2VEhMTxGcglfWiQo4kxBJjz2asoTe4ILpIn
	 hGyCL5lkQK24RPuMlCUJh/Nh41ZDQXdOUK4bHgcvYwQHXNQZklO5DGwxnSg2qtOdiS
	 Y+MzW8Kbvjrns2I9L2ijMOecswwvST0Wh+w7gdjZPkWBhQuPo2c3/guQtE6mUrNxUn
	 0DTx8HYAdIp72UsxuCbkhX6UW/PxDgo5IWB/6GnY6tazYIpEhbsKLpHN5yAfmEEFIa
	 w+/gjhM0iScqw==
Date: Sun, 1 Mar 2026 12:53:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adam Skladowski <a39.skl@gmail.com>, 
	Martin Botka <martin.botka@somainline.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define
 MDSS resets
Message-ID: <20260301-messy-famous-stork-3e6db2@quoll>
References: <20260228204638.11705-1-val@packett.cool>
 <20260228204638.11705-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228204638.11705-3-val@packett.cool>

On Sat, Feb 28, 2026 at 05:41:28PM -0300, Val Packett wrote:
> Add the missing defines for MDSS resets, which are necessary to reset
> the display subsystem in order to avoid issues caused by state left over
> from the bootloader.
> 
> While here, align comment style with other SoCs.
> 
> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")

Same comment, nothing wrong was in above commit and posting bindings
without reset part is not a bug.

With fixes dropped:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

