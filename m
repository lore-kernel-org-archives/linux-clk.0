Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B78E38C2D0;
	Wed,  7 Oct 2026 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407451; cv=none; b=XW2iXRQ213p8QkBuUc/YNLaTIvYj362MdtzOkCJyeTjYjmEGMYxy7tdwpriVPbn7eCq/9S7t+n5KQzKn0d+6s0RiVzuiRycBLOlzh6Ji0wkX60ywU0QNFzfNB3Wna7oHxYdveUnOAU3yuOlYXOnjw2t077QOE5rNj1vxjP0eYgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407451; c=relaxed/simple;
	bh=jwSwL2oTzzJ9nyqq1HM+u+utHDf3Dbfk7eO0fuCQel4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGZCkNth7upi4DN7CKMnodVmck5Ap5zGWc98f1kMdYR63WSlO+Pn1h7hdiZPacY1tlqRoTaKzJkBOC5aDlR/1dI9lkDaFeT24ZBzNABlHOBCoQx3N5bShqfw2lG1CJUNdW4NPQW4GOneZ8IzLDQh3NVh2x8WqdsbtfrzIbMBPzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIGnnhcg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIGnnhcg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43C01F000FF;
	Wed,  7 Oct 2026 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407449;
	bh=e7phJjNVzeAigB8nPhuPrUHGDGGZ/A6o47VusH6GCxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nIGnnhcgfWk6l3ezrg+pV3z7Sxf2bOx04lGrkdU8SrK9umjecnu2/5XQW+rfY5USV
	 mP4EeebGLszERqhOzEqIJaejALhsMCpSq2LEgKTSFi915+khLZgRxl66bqur31CKKa
	 UjGFg9WlwEkK5+rdbCQzbTLdbQxYxlRCwtVEj+uM4ewjDgEJ1ZwfV0JQ4eSQ7c66rE
	 df/AmabuUwurIgfmSbkv2Vo98tSvcLOePQwiP0bURTYDhO5qiBF+0ZIiDfySU82AG/
	 ULYh3G1JgL+IyDUiSuy2T+bmWeNZqOeLgPorku3lMkeiou1cB9bixI7TU9eD687HtX
	 2mpl+a19DBJZA==
Date: Wed, 7 Oct 2026 16:10:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org,
	taniya.das@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, jbrunet+clk@baylibre.com,
	andersson@kernel.org, sboyd@kernel.org, conor+dt@kernel.org,
	linux-clk@vger.kernel.org, abelvesa@kernel.org,
	linux-kernel@vger.kernel.org, bmasney+clk@redhat.com,
	konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add LPASS AUDIOCC reset
 controller for Glymur
Message-ID: <179140744871.312501.9929878495818837119.robh@kernel.org>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261002194436.1275056-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002194436.1275056-2-srinivas.kandagatla@oss.qualcomm.com>


On Fri, 02 Oct 2026 20:44:32 +0100, Srinivas Kandagatla wrote:
> The LPASS (Low Power Audio Subsystem) Audio clock controller on Glymur
> provides reset support for the SoundWire RX and WSA1..4 masters when
> LPASS is under the control of Q6DSP.
> 
> The programming model is a near-exact match for the existing SC8280XP
> LPASS AUDIOCC, so add the qcom,glymur-lpassaudiocc compatible to the
> existing qcom,sc8280xp-lpasscc.yaml rather than creating a new file,
> and add a Glymur reset-ID header for the clients.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sc8280xp-lpasscc.yaml    |  6 ++++--
>  include/dt-bindings/clock/qcom,glymur-lpasscc.h  | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

