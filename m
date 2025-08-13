Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2731D303CA4;
	Wed, 13 Aug 2025 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755108118; cv=none; b=aughPAGTO7/kI+Kza7gSsUCnr3kvR7iGScpBTCcnQaNh2VLGJwNVK4HMReH/1HYMdn3T0s2qy/hPgc+/aMgc8o9vsG4ZyAY3Rfi7N1dGNN9jMNBixoUpwNmc6CvXVnaETcqzyo+hRXKvpS3tapuSg7qQB+Rs9iA7Hgb5O8ER8hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755108118; c=relaxed/simple;
	bh=cwmSbD+v4DSSnrpqZ7BHyA/HG83ljR4oIo2cHMDQ0mw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=EWo5DoR7D4XgQn7T4xhjekr21ynWz2aBErS7Ppv3CuT7qfp30gKQuEgFBMiK0gwivPFfDGGaRCIvBx2pH3WABrH+3DRzJ45j5efrg7KSuPcvQDMgbXMrT96fHaR3hJyc/MnW+sxhbEY9aR3E60xwntl3uxO9j7NoukOZ4hckqr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m909A1Pb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m909A1Pb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25FBC4CEEB;
	Wed, 13 Aug 2025 18:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755108116;
	bh=cwmSbD+v4DSSnrpqZ7BHyA/HG83ljR4oIo2cHMDQ0mw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m909A1PbPXsj3u7Gv/Mp4nkiKv9mQOG4og4sVPKUQoc6flU49o0znYiX8S/ovNNQp
	 zjKzpuXcnsqnsUPA6fkPmgIt6nEzTwZ/Qiz7zHq62NIJP2uNumcoMmrjg3cCJE7l7B
	 Nd+3tHAMEVK2FLc4LP2a4D11Yu7raWcn7nFJL/9JxzQX36IjlPyccYV6gneemy0ZXa
	 jGNE+7jzQyj439wpmqDIcgbX1Z3Z2BT32sZCgL2SZFVYySvdAfPDsqeUGCjN6Eq6I1
	 ml9dbfJM5meYmEH6LruYHj8kWPrjPho5PWkMru/MEzXPHJZ5AzwqrspTN1BY0sVet/
	 u+rfBQdFTNIdg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250804222010.4082782-1-robh@kernel.org>
References: <20250804222010.4082782-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert silabs,si570 to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>
Date: Wed, 13 Aug 2025 11:01:55 -0700
Message-ID: <175510811590.11333.14231907311385081804@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-08-04 15:20:08)
> Convert the Silicon Labs SI570 binding to DT schema format. It's a
> straight-forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
