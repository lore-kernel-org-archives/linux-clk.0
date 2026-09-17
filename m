Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5C9376BC2;
	Thu, 17 Sep 2026 05:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621560; cv=none; b=nq/9QBswnAfQ26h9wGx+lMaRcWI6m2UgDuNrqFVxWuKJUeQsTdNtQ0zwuXp9d5QMfvw9n35/fZvs3ncxMEsRS07jJ1UlOT2uneiBBB4iam/gbx03rGe26CSsriJ/xTXX1kXNjoyprf0WV5nS3uMxSllil4wI89LZtvsqRn6cPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621560; c=relaxed/simple;
	bh=t/1lYna6Fojo4ycYGVRCzYj6VpZFiRIWWmHmkMk/QCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6w+k1ZQIzidYlKUre9T0Jg1FWRYXl1CvC/KiBAIrGBjRpt/UDr7KLy+izj/S25kKwUs9vbd7gKOKIR7RpEGwEwtDDwNNbJQ+QAi7ZFkGN7bl0WY1HThicZ+UalEGWlu7FO4r8Hq4DrDDLfHbhZl08ZdO7gblbGbJmQuuZbBjOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIGDNRZe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIGDNRZe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B7D1F000FF;
	Thu, 17 Sep 2026 05:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789621558;
	bh=DGo6AhwgmkpHtSr4d5GjSyskQfqpHDpbLVINJLURtfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kIGDNRZepAWiHQRuUHfpKhopiZRy+tGkTS56I4aWiX2olLs5Ihu0jMa1dJk5g1Eov
	 y3RW1q2rWfAzsL9SLQ7GLIcvFRGgXJZ/vLmzb1xKmXFoJ+TpduJ8+Bji8x1iL8NtxX
	 qmLvSX+rD6xcM2oFs45gxyVGXg/8cyauZlLuiR2w2clwtnNvr4vDvbJTalBRn70tud
	 sm+//CRfiZX9M1z0i9pFhsmSS9khVwXD8JoN5gARWr6HetESQKFrJbAj0tUiJOiLiW
	 C0wQmkHWzid6e3GizGo1yfDwdYTz+VRPJrVdq2G5qQ2kgpc7uErJyXShKwLo0hXnfz
	 4w8Zxh6mLsgsA==
Date: Thu, 17 Sep 2026 07:05:36 +0200
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
Subject: Re: [PATCH v17 3/5] phy: core: Add devm_phy_get_by_of_node()
Message-ID: <unvsbhemwvuuj46tau2ioc4v6yvvywpnocg3jy5qsrcz3w7mne@xczbo4otqxtl>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-3-e2197a3e2551@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-3-e2197a3e2551@linaro.org>

On Sun, Sep 06, 2026 at 03:17:07PM +0100, Bryan O'Donoghue wrote:
> Add a devm variant of phy_get_by_of_node() to allow for the familiar
> pattern of having devres automatically release resources on the driver's
> exit path.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/phy/phy.h |  7 +++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 490a7cde6d40a..2e3581ecb42ee 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(phy_get_by_of_node);
>  
> +/**
> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
> + * @dev: device requesting the PHY
> + * @np: device_node of the PHY provider
> + *
> + * Returns phy associated with the device_node or ERR_PTR. devres manages

'Returns:'

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
