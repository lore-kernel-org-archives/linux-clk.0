Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E81429CF7;
	Wed, 15 Jul 2026 11:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115229; cv=none; b=OeUPAGd1l6vkwYlmzXbkiplj0IqMgxuqG3cb8G2xY6pLLropJ4U71KXZlqIKZKevMEj58sSe5lETU23wdoAneXLhYNKzQYrq30rHvDWl32VWqV70nkfCHlve3fNi9RLjIDgmKIk5H6UktfJgxV6sGsM//kj0XS9mI89oyB0v09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115229; c=relaxed/simple;
	bh=wNLl4EHt7/5TJ9Dlwu3SQI9iEXnNtSAyPCu9DVn4+V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpfKJwHT6xrrgyC7UWC4+UbR6fE8q8WXPWyAnReiUUg6uRNQIIT/aKHqCR1NFK/Gq1S2qgdlNUq0kXCsVUsLccJLurBJzER9yhLIPujhQzhAndlPgsSsXTBHX2NH+7uA7dyeu6B1LZUBP0YG9qFbJKHuGBEJmWFAzr2E5gzXTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+iHmiGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+iHmiGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5C01F00A3A;
	Wed, 15 Jul 2026 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115224;
	bh=9JLVvqvoCSlLsZHpJXT/d1xXXcQ5YiMbXN8YNpGZ/UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+iHmiGT8XGHqSd16XF4uqUaycjdWK0m5JTD3wWPP8tfXekN+QBHnP6V+2mhMdS5a
	 iHN1HmAg4/FKtaGsZvj4GHatutAM52YvKQzHYM8+dOCmaAHEBNtkLYdam6HPppVhVj
	 AF5avHzh5rWN9sHOOr9CcXDuc1lSOhRYO2vactvqVu0jMB9Scg37E/08Rd4k2OXcUo
	 onHDWDKdm75KsE+QkGiAxy2S8ohPWnHGFfN1sskbnJVxdnBiEGaQ4pERkVnss6RLjI
	 6yYhty2bNz0j5x8P7peWNDrIG3SC3DJVNZ+nth0blndhwWneFq/qCZavl4gYVo3lXR
	 X/VG6kbJgrHHg==
Date: Wed, 15 Jul 2026 13:33:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Message-ID: <20260715-steadfast-silver-hog-a81e03@quoll>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
 <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>

On Mon, Jul 13, 2026 at 02:34:09PM +0530, Taniya Das wrote:
> Add device tree bindings for the global clock controller (GCC) on
> the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
> bindings, since the Maili GCC is identical to the Hawi GCC apart
> from a few additional clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,hawi-gcc.yaml    | 11 ++++++++---
>  include/dt-bindings/clock/qcom,maili-gcc.h          | 21 +++++++++++++++++++++
>  2 files changed, 29 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

