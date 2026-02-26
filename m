Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2665537418C;
	Thu, 26 Feb 2026 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089731; cv=none; b=qrakWkU0C9KTocRPGG5jI7dq5RDxWYoMAfhvhTuaZSgTb/XfL+Hd2EpUs9H9UU0fJSc/9Esdl+ClwoXfXGGpw1c6PrTEz0o0ckewzR8MO1Wd3ghv9YOWslW7cGXt0PPxcKFIdyZF/ardoSh5WDJaUTS+WvkUFp6TTAK0Mj8LocM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089731; c=relaxed/simple;
	bh=/nOXJwtWBRqjHtF18qw9d+YwsOuhUDgleHpYP8DpyP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICvNyoLn6ZmiVJ31iIYJx3sUs35NGFZ5uxd7ZbIfEj1iETJ9nQTftUDMOMVBzocoBU7fwW6MUCkXdGbIG6ktOB6lBoaPM8fH+8sNs6Ed/EvFWRXguv2iX8AZ2RPFtjqMVNU9KBUQrwIJHuQwTa7GjxUOoUcPIStx06QHYg7NNwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snk+3bDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snk+3bDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E04C19422;
	Thu, 26 Feb 2026 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772089730;
	bh=/nOXJwtWBRqjHtF18qw9d+YwsOuhUDgleHpYP8DpyP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snk+3bDdO+iB2/f6ppPep06p88NcbIg2BBYSO7yUoZ1EZ/YVMLmgWoWA4OCb36jPl
	 3BtaQw6aS4VIZnMcJMWUeMTvSeh2Q4DTsuSBzk4r3QIgGZXUXrfiUgt5VfO56SnUsw
	 EMgxjB+Wb2iaOegyOhOxODlhjdoQ/kEII5HgppPjZ/HFrQSYVHLUsPiMQ7J8bmtbp/
	 AyYXcF1LuzLMQBlSHYMOnm4Sbe8x90XrhUg0WQMrMhKEMX+EmJu1CJ1uxT+iNRdE00
	 UYwSNGzvX/3YM6BHt82mvwc6Cv1NUOKOOATL+ei1rThXzpyeouJto/8fkPracuhz8L
	 NOz/CqjNxa68w==
Date: Thu, 26 Feb 2026 08:08:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v8 04/18] dt-bindings: media: qcom,x1e80100-camss: Reduce
 iommus to five
Message-ID: <20260226-magnetic-honored-taipan-355eb8@quoll>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>

On Wed, Feb 25, 2026 at 03:11:21PM +0000, Bryan O'Donoghue wrote:
> Rather than bury the BPS and IPE inside of the CAMSS block we can define
> them like the CCI/I2C and CSIPHY as their own individual devices.
> 
> Remove the IPE and BPS iommu entries from the main CAMSS yaml. There is no
> upstream user of these iommu entries right now so this is safe to do.

Of course there is - v6.16.

Best regards,
Krzysztof

