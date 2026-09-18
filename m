Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAED3F660F;
	Fri, 18 Sep 2026 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724530; cv=none; b=tJGSFLZ5o6Nj28OswKI4I2MXh5miJyJ5zKjBJtukn8WuIgWrPstWa4ZYrbjq8wfN9XgcOE2bIu8o+uVIRZvcLqoDFZUsLGgUKs7EwT0pl4VzBRAeivTAKstQCI44lDgn3SATN5CuQAyWkgHNBfRIlPCg1mxTKDLaSQ+RTmr5g44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724530; c=relaxed/simple;
	bh=ry4ufB5svQ7syX76rznmlTwV4M4BKtd9urpdlvgDL9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlLQ4DXi8g5bhopkkD/8rUXY/dK73iIEION0EkfsGk1vDqrY0FNhy2VFeiGpeaNOBR9tk0sYJ1SvuBkm0jRFkm4WnOsRcvs9OQnLl3wPnTW27cVxmwbSt0BouLE7JAi+MuD2IPsKDVCT927SBYPilQpWCvBhS4yz+hREJy8xrwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdvAdgSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdvAdgSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899231F000FF;
	Fri, 18 Sep 2026 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789724528;
	bh=MfgmRk9kegctTLHDRtRWUrOl73OH45DZnYEAu7JvNMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CdvAdgSP0xBtG2hxt44Cam1iD04zG1jNrG8UhIJKGROU1GuFBEbTuXam1erwgdGDF
	 I2uAELzW91hTmte0fS2PvVuxmpKubPbNhkkzOn4JwrSk5WIf7VsHATweYUVBv+xPb1
	 ZyLtkwzSuo6eMdRY5WiqjYFOKOvDJkVqBgTQ5G+uEaOu2JOOc6g3DMTd83P/VSM8Jc
	 wFZTydzPEVD27gy2pgxPxqQbFdU81z1AfldKOhk4w2QagZAVF6JGt6YlGtCb/ccHV0
	 f9YSm2+TdlJcaoP0U+juSQkYw4Qb1WddrX+PUPHB+VnhvEH14njFSZ3NQ0nVX4PP8M
	 XlN3oEH3pqzfA==
Date: Fri, 18 Sep 2026 11:42:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: qcom: Add camera clock controllers support
 for Qualcomm Maili SoC
Message-ID: <20260918-handsome-private-salmon-d7aacb@quoll>
References: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com>

On Wed, Sep 16, 2026 at 11:15:22AM +0530, Jagadeesh Kona wrote:
> This series adds support for the camera clock controllers on the upcoming
> Qualcomm Maili SoC.
> 
> This series is dependent on Hawi camcc[1] clock series
> [1]: https://lore.kernel.org/all/20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com/#t

So this will wait for that one.

Best regards,
Krzysztof

