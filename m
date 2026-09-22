Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B73BFE3F;
	Tue, 22 Sep 2026 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080686; cv=none; b=oTnBhD95hzatZK/+ZQ+9ofD5N21aLC3xXkqvyYXJMlM+qEwubTgcxIcLMeLa5YPp95U1wZOxtMqa5O2AJ9MKO4rSAcorvS9/kxjnTUWQOEvE/fOZmnxNnudExRG7hlHhv5fQUzBH7duDQTzF/Z7kOQytf4zVvxw4+jY3XgMN410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080686; c=relaxed/simple;
	bh=2A4lC32lS8scRN7uTcTXPY1AN63fKpTgCO4ThYXNRcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+IBeCQR9f8tZWdI+CspgfMsEoIFxVwl2qkYgvhDoIKGfDnyrmE7n0OkIVTuBoPcUuBlFNI/8NXoqRZ45eMuNcnRyxxzcvlC562YufYAy6n6awYeiv9/WEBfH6MKCf2LVnafkx4RCo0WT6/uW5gRN0LK0zCjo4Dvrotpq7LHve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qunjsvms; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qunjsvms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D391F008A0;
	Tue, 22 Sep 2026 12:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080685;
	bh=J8+ca+gcpuLslZLTovu0Gzm9+ZZc7DYd8Nmf5QdLI6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QunjsvmsZuEbdErQzbL2KnbidMZvxv7Kdr8MUmJ9yOICqRkOoZvEnZfPSsjl8ZSI5
	 3FbgUpG8pDmZTil+8Py5ZK2ZhxoBNhrICg+mV1YGtfHBma6BEhAsyXQvKqmYrBoihC
	 a8fdsFBAsvV1n/vcWSN7wH4T5eN/GOHOUBXFAHCIrhBARSH0fcQSmCkNq6YW9aPL5n
	 42WDBjx8nxl99BG5A6H/lS14Ua6AAQsSCgMCL5qVPFDMGmZxCXhtDvU7CZrfW7QXiq
	 bSlhmqip2n1wxBe0xmMrf9KRDfSTtnakaWcY7CqACBiLpqNbLRuSL0RSAboXPtzXeJ
	 e3rECrvz5iaLQ==
Date: Tue, 22 Sep 2026 14:37:53 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v20 4/6] phy: core: Add missing kerneldoc colon in two
 locations
Message-ID: <qjmvybdgxf7vpxhiqogzgwgaiz3klheil33lxohgrlbjaexm74@wvjxm6clvmfe>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-4-dc244e124e71@linaro.org>

On Fri, Sep 18, 2026 at 02:56:39PM +0100, Bryan O'Donoghue wrote:
> Correct missing colon after Return in kernel doc.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
