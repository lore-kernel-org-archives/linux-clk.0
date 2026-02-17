Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155871E3DED;
	Tue, 17 Feb 2026 08:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315891; cv=none; b=UFkHdndmAuclPf/wkxqJB/Ucxc2sljPEGrxyFVPGfY3YErPPhysK0ipFf8IqViHJ+wvOXKnYCmO2qgqe6S3AtKsDolbJnE1JfHpirV0kWxVZcQop2VbjeXkluX63yCmwnn0kpTZt2LY0y9pVx2mYU0KQYyKFjKkXd4XEM8pL/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315891; c=relaxed/simple;
	bh=nFY1vSabPgCfBeXJBl3p55eqBUinLpounWMuYH7A8XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUR7jicnVjy4n204doJQCDPSME4mfk7FSQd243nRBM4nKLBIOdHyfRhyJ9K04dsPctd7y2YopMnVS3WIU+mna6HfJ446D/LpyIQgYKKrMAzWlPXPleSDC4men1DnQQxR/M8nkMU2RjAhArvd25L3vsAGl7i67byUM5QYKSYh+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpRANsfB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpRANsfB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED1EC2BC86;
	Tue, 17 Feb 2026 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771315890;
	bh=nFY1vSabPgCfBeXJBl3p55eqBUinLpounWMuYH7A8XQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpRANsfB4DVY0GonZpgCgVup5ZWSVYo5aGZGn9UE0/FHiNzssEZeRRcKcU+AKFdHN
	 /QUSNDgYzlZCaJXJ5ljtCc4O4kN88e8Jy+4mOvXXSXuNYaU8B8LinvE4joIHZZypAz
	 1TD2w9q9R/GLRtlas/T8ABRqOfE9jdHRULQE05Mmli3f3HEoepB4AY1/NN1lPENSOM
	 YROOBKKwXpIeC+HUZn/ZCS1UlLAU0dVOUE4ryzsj7DoF12s9LX4bGOOGSMCD32Z9QV
	 q6D3tbEJYV1LG4e9DiM7PGfGWDlHtO5hwWnKanMFTLd1lObjne8HR72JMuff8t+Vxz
	 czBgQVPBNWUTw==
Date: Tue, 17 Feb 2026 09:11:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS
 resets
Message-ID: <20260217-gentle-ambitious-newt-21c4a4@quoll>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-3-val@packett.cool>

On Mon, Feb 16, 2026 at 08:25:19PM -0300, Val Packett wrote:
> Add the missing defines for MDSS resets.
> While here, align comment style with other SoCs.
> 
> Fixes: 38557c6fc077 ("dt-bindings: clock: add QCOM SM6115 display clock bindings")

Not a fix or explain the impact of the bug.

> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  include/dt-bindings/clock/qcom,sm6115-dispcc.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Best regards,
Krzysztof

