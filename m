Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D42DEA74;
	Thu, 26 Feb 2026 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089873; cv=none; b=e+157d/woCZ3vTP4dVQwX7HiC0IjkNv2JG/Uq7myx7y8fMWFDDRbHnWat436Endje+UPdGQ6EkKYSeihg4YKks0XUAkflCMEJNsMd2i4nfBJO16SQkRuhWNTji5W4mzBgPy+scD8teksLFozGwT54bEvV/k6wZV1/JATuoM4RtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089873; c=relaxed/simple;
	bh=FhMuzNTXd3+fSk0m2N05mC2Lm9WqQtqXLRWD0nIiYBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkqgqeskvyhFXt0SBz2Ps5ymMP+KtUEjCxuAynesYmLFy7GbLS63ifTPaZmr5k7ab+mucj0TotUEc2RnrCtA38B5OoijAUpf+1CWQujrCz7ijWahx5t6ET4EbgDUXCUrcHAvYNqp5PnKHR1BSMrSZY0rTd10kTh4UCvq/ZFrS94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aX6zX1EW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aX6zX1EW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87990C19422;
	Thu, 26 Feb 2026 07:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772089873;
	bh=FhMuzNTXd3+fSk0m2N05mC2Lm9WqQtqXLRWD0nIiYBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aX6zX1EWgnGl4txRINGhcCu8dZLEtHnvYgvON9vezRqQStu4JweO2QR5cjf9GeArI
	 ZiQ6KyNUcaSCrWtVRpMjdEoRWEx44NM813jQMk5rz5HBr4AIaPEiaNDNCU6Xyh3vu5
	 lqU5EwqE/RkVRaANosYu9kPpwtAnKPVO6X9GBpWq3mPhNRadULjtIMmOuq56RKNKtK
	 QmXsgCRx7NyZV/HhF1Ciixl6hffW2IHQR7Zq+ztwj0PNa+oOx7vg28M/yQq9EeDXyG
	 LjPefQXHH6AVyEGejEa0zXeJ5dIysrhbZcOgcf0X4v3wnPHjaso2VEvd3qt3UUTi8d
	 gymdb5W8Pjzdw==
Date: Thu, 26 Feb 2026 08:11:10 +0100
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
Subject: Re: [PATCH v8 10/18] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
Message-ID: <20260226-shaggy-nyala-from-jupiter-7abe18@quoll>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>

On Wed, Feb 25, 2026 at 03:11:27PM +0000, Bryan O'Donoghue wrote:
> +
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
>  		compatible = "operating-points-v2";
>  
> @@ -5543,6 +5562,102 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		csiphy0: csiphy@ace4000 {
> +			compatible = "qcom,x1e80100-csi2-phy";

There is no such compatible documented in the kernel, nor in this
patchset. Either you combine DTS into driver patchset to solve this, or
don't combine DTS at all. DTS cannot go via driver tree.

This does not make easier deciphering dependencies for soc tree...

Best regards,
Krzysztof

