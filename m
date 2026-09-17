Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0993E5EE7;
	Thu, 17 Sep 2026 05:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789622018; cv=none; b=FwzKxSLcdzfHouvBySIMMIEMGDLR3zmKFI+vB7Htwca+HRfOUtlUdFAR7g5WZAq0ERUOO27DBG+XOnfRkrMHYBQgx68UOVLOF+bxQ7vY8xGoKLaqSoEAeapR5bW7ndz/1ewFHYwohrTu3jCV301dRlI9W+OFTjAYuW5Z6o8gDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789622018; c=relaxed/simple;
	bh=HXoSMyCeJ4ErPZJE/ElFkhQHBl6iNhkb/t6T3TrRjDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hr/CseYfYgvjZuWzKnZOOgfxfz6Z126587HwRAfy9SR09gduFhh//M8Wj8ExtzGEh+i3haqZ6vC2nEQQP23BLY355HvEIA8efBKeOePVSdxKusP7FbU457/v1az3Y+/JaANpvI5/XCmSQJ2ebWSq5gRU2I4ZMjuqeEb0CvKJpGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgNT356J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgNT356J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4361F000FF;
	Thu, 17 Sep 2026 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789622017;
	bh=uGgS3NrMnS5OPlo2/pV3+r0JyX3qwE8hUTEhqcMecK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AgNT356JXnW82O7Cd/5d30SRChL8c01Q0kdU3h38fdWt3kuh++CekcgNr+FBcmdt1
	 kUXCawFxS5oMyDr1Qjr4V3S5caXVHph4EfM0W9q/rC7eW7MKTe2j780kFv6+bmQvs9
	 e/Z2m7/UY2vG6jyx9oA3hmneW6HtUy5PiKjY/J5Wq4WuIAaltNCLjkK+7TUnJMbf8F
	 K8G96mRs6jAlp5xc7SLcSAodjPY9R/PvJuA7hbdQD16TSKGCzSfbFzZNhMLgEkOLXG
	 zSOrBU9xLfZvmsM28t5XNAS1JU76Qh2Ahn0pGpebC0eLNvTssrgEKijRX5sbwnv8Bk
	 3QzbgiesgXvxw==
Date: Thu, 17 Sep 2026 07:13:14 +0200
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
	Krzysztof Kozlowski <krzk@kernel.org>, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v17 4/5] media: qcom: camss: Add support for PHY API
 devices
Message-ID: <fq5fsbpmxn7s3ttiwxviyvykp2yyvuaykz7nly3orjqpsdof3j@avccg73hbsse>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-4-e2197a3e2551@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-4-e2197a3e2551@linaro.org>

On Sun, Sep 06, 2026 at 03:17:08PM +0100, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
> 
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For the PHY part,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
