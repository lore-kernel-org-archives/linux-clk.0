Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2D541459;
	Tue, 22 Sep 2026 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080633; cv=none; b=m1sTnED7hME/Ii1sfNHVj7ALy9tRnNCy3eUoLcDlBmQ1JFxS1aUioY9qJWHE+GIpuM5cMgXLyN4VAd5Zwny5lKNUbgUM2NNLRRaoI1EtBhPFlPCFWAWzqVqm3q4U3IoEfJVQ3RjIUqHNk+JlIlu3qPERxP4kUpHEztMcgqs9siY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080633; c=relaxed/simple;
	bh=c3s5w3F9R4bJUKxRCnZ4hxQAeOrCXXGbmg/Ax6lXld4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6j5XsOd9Epv7pX3hdv82Dft91sbCuv7w+w3PJHJcc7wRz+9JDZPj0lHtaMSoOpd4ApCEZ5t+zLeMADctAcONYPCsTOFRzJvwzCE+V/Uo2h1/PKYzSFSRyYyhPE7x6fhLcK8SxfatDQQwTPBKInH6SVqJvMA1dzcTJg9Q3+fTbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALVib/2A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALVib/2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2271F000FF;
	Tue, 22 Sep 2026 12:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790080632;
	bh=DwHB8BOImshYFfluP8K16hpIGSP6HK3GfAavYT0JBYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ALVib/2As2ZxO3Kp2XqsyhAjSO1L4bSIHNIPkaizuCwxDpCxVr4AwNZyH4VPH7g5R
	 +c4mJHIIzPjL2g3+6z1gSfbQXivFVsmp0cX0SU9bp9UyVMq4YY6dbewi0k4CczsV9l
	 xI2qNUDZZJ6zL4hWffrC3ZZlKJKCkGHX9tmBblnODE0lTBtUm6jEisHvatSkKDUrtP
	 m1viHHr0FbmfiCkvN8um4z2PYspTxxXTJ+MQU0Q2KkOQL28/JwCedp3f1Zvc6JzISj
	 vEyRU3VWxmlC+R/viak6V6RAau7nQJZqp6El5M3wZBsAEIVmlO7llNhFp2J7cWFYDr
	 v2tei/lMvHDsg==
Date: Tue, 22 Sep 2026 14:36:58 +0200
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
Subject: Re: [PATCH v20 2/6] phy: core: Add phy_get_by_of_node()
Message-ID: <pguh3wzcsripriqjo57vzkg72uhiw2c276jtlwnfv4baju3e7x@of5sp4ym4m6q>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-2-dc244e124e71@linaro.org>

On Fri, Sep 18, 2026 at 02:56:37PM +0100, Bryan O'Donoghue wrote:
> Add new function phy_get_by_of_node() allowing lookup of a phy by
> device_node. Separates existing logic in _of_phy_get() into an internal
> helper method _of_phy_get_with_args() to allow for reuse in new method.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
