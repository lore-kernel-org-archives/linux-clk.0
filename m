Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332441E49D;
	Sun, 17 Dec 2023 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGLAJqQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7C0C433C8;
	Sun, 17 Dec 2023 22:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702853753;
	bh=kDoiE1sYunQSFkC8FH1zAKwdgIXX8ycNULCBUksQRhI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EGLAJqQjOtnt46pB/afrO9P3DdukWbH3/bfUmeuRfHCgjnM/e8OJhm0P9rkteU83i
	 fIgpen6F+dcLEuER5tb6tdlpQwQ/Cp/7JpGpyAoPupxi9elZZS0I7JNHhQNPILlwL+
	 g0NlZRH2YU3ni6MOxCsl2V/BwoZt01yBxOMA7mq0qQulEel8neghqD2ZkE4ZuC732Q
	 pb9y57aEkhSmR3Lzrh5e5AsFSrUyrs7OkHDN3t8Q/SCK2s4Orj0q7lCb4Xu+A/1zFQ
	 RX/rYMYvHNt2sXayU51cJNSZFJyvbzuVnjRm5AnQCx3tfX7tU3z4NPUSBUfiD6x/Vh
	 zLP586x0B0UsA==
Message-ID: <3bf1bdee1907a4accd306823349fafd7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231214105125.26919-3-shubhrajyoti.datta@amd.com>
References: <20231214105125.26919-1-shubhrajyoti.datta@amd.com> <20231214105125.26919-3-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH  RESEND v7 2/2] clocking-wizard: Add support for versal clocking wizard
From: Stephen Boyd <sboyd@kernel.org>
Cc: git@amd.com, devicetree@vger.kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, michal.simek@amd.com
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org
Date: Sun, 17 Dec 2023 14:55:51 -0800
User-Agent: alot/0.10

Quoting Shubhrajyoti Datta (2023-12-14 02:51:25)
> Add support for Clocking Wizard for Versal adaptive compute
> acceleration platforms. The Versal clocking wizard differs
> in the programming model and the register layout.
> The CLKFBOUT_1 registers are at offset of 0x200
> instead of the 0x330 in Versal. In Versal clocking wizard the low and
> high time is programmed instead of the divisor.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>=20
> ---

Applied to clk-next
