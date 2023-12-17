Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C31E49D;
	Sun, 17 Dec 2023 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRnoxlNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24F1C433C8;
	Sun, 17 Dec 2023 22:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702853740;
	bh=+boJ1NzrL6p3ppJfYNwrHFfI8xVVGKCWjDkfx8hp8IM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kRnoxlNzbo3TTf9laakb68fzIT7p0EkYY3JLgntw/RYkeTc5AO2G0T8RXedm35nu/
	 nwnBFXB3B8p4kYzhNQq6B/u+shGb8/ub5GekH0H3ZxhKXwSHTg1W26IYHxWmHzhBns
	 VbqWmjCLyEfM8p/vMxOkkgiZwuiAqmHI80Y468pEHO6xP/HAoZsSadEaNzkfi74OKe
	 JPpVmyAeo8okoOMBzwVNPPyViQbL4wtx6rs8cqNUXztu7gLuy1xcwo/ZnnIFU2dy90
	 X0OSbnUgtdYe469axJey0/DgEoEHF8x03lFmgMaAUPQJmNvnQhopp3enrAgjLZ6Wk0
	 tO1aSS3LwzQJg==
Message-ID: <6e6a6a2e224ed2c2ed55b8935eb4aa38.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231214105125.26919-2-shubhrajyoti.datta@amd.com>
References: <20231214105125.26919-1-shubhrajyoti.datta@amd.com> <20231214105125.26919-2-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH  RESEND v7 1/2] dt-bindings: clock: xilinx: add versal compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: git@amd.com, devicetree@vger.kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, michal.simek@amd.com
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org
Date: Sun, 17 Dec 2023 14:55:38 -0800
User-Agent: alot/0.10

Quoting Shubhrajyoti Datta (2023-12-14 02:51:24)
> Add the devicetree compatible for Versal clocking wizard.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>=20
> ---

Applied to clk-next
