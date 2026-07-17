Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A93E4C88;
	Fri, 17 Jul 2026 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277467; cv=none; b=XGwo4iUytgWNLa3GcHk+miMhthxP8npZPuzLWRykndW3XKLdWOQrXHiXJqKy2Q39XM2vvCZybyt6BV0OjOcofTlLPwLhHsO0vTkj0i+DTQvhDOglkEqXfypAMFQnKKoAcC199/w2xeFm/KK6zIpX0oAMN0wq59dY1A8FmH+/xCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277467; c=relaxed/simple;
	bh=OVafCHkpfS7w62ynC5nfXr4GxA9mIyhADlWd9kyUnmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnE7ZdTo6UaGozYOvrvD9YwRpCdFrFi/9LbhnAKcoePGE2Qy9uaQ99eqytDbkT788gVo6W8VmlwZycaHb+0ZOjcAaabFZOE2+rZVesvBU2/snhSVIH6KpDbu/qJ8Z+XAvvoroWzahGWhLkHmCqWz++y+i156UR3ORlP7GejEaNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdRnqcDM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdRnqcDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E4A1F00ACF;
	Fri, 17 Jul 2026 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277466;
	bh=24IsE8OHaEuak4jlMUKpl16J5ENMV038U/fcynE6pco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bdRnqcDM2BULE17bN64Zc9iJxy27ab13MrtjKQ1GNvJW5l8mrPfzQZjWsF9ulTYNE
	 8tL1jKQOKl8ADgZHqCP0igiKvS9g6H5ut7P+dkPFe219KJuKW2p3eif5XkIe/QmB6p
	 u+/kQoHziKP2F0TzXtajksYT5fPYntKDSLDYcPm6yVTbVWnyAqn0X2OMNknw/xhAey
	 NSpKQXwsex9kmdc24rR2kHEA8MalGXcvGDS0A8+lyJ8Hm8gY0EcbPvK02+gIFpaVfs
	 IHj6YqdZdpM6eBm1ZPc7ySk12LI/8v6xqmdDIYLbyvv1vDLqstDKmZEp95f0bHve+U
	 wzP2kaQ6mkNOw==
Date: Fri, 17 Jul 2026 10:37:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili
 video clock controller
Message-ID: <20260717-true-amorphous-swallow-c1fa8e@quoll>
References: <20260717-maili_videocc-v3-0-6656694b06a7@oss.qualcomm.com>
 <20260717-maili_videocc-v3-1-6656694b06a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-maili_videocc-v3-1-6656694b06a7@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 09:44:44AM +0530, Jagadeesh Kona wrote:
> Add device tree bindings for the video clock controller on Qualcomm
> Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 +
>  include/dt-bindings/clock/qcom,maili-videocc.h     | 50 ++++++++++++++++++++++
>  2 files changed, 52 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

