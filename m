Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7B38E110;
	Thu, 26 Feb 2026 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772089467; cv=none; b=YzwB4Egyk082SfnQ+xGx/X3UfJHKmJEQbv68kAeaL5nz3jXvI0EDigSf7h2Im/uW25Oi6d5tLKuYVsMI7VhMJGexCazZZwdxc5UNXb0zfOh5R6NWan74Bq8pC3TTZ/DH0hrGQbpff2bEy/MMsOcT26LNZdLIr7l11WxXu5taN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772089467; c=relaxed/simple;
	bh=/wR/ZLVPqr4ZtAtp7nMPj8aUxb3Re2KAn1FKdlsFUA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvIRCjR+iQPK8kp3hKcrAMEnuyPFwbSUGtjkoyFpsxJtx4zG4V8G+PIU4D/Blpgl+9Nwk5hLaWNhOuveBWUdkMcJBsXBrzrsWLc9bVv/nSTLHxyQTbX4q8dKJjbK8x4o3M5utitqE8t/DHyNB4+ARC+LpYUlpLdGCgGTko0vMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxxWHRFA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxxWHRFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B4DC19422;
	Thu, 26 Feb 2026 07:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772089466;
	bh=/wR/ZLVPqr4ZtAtp7nMPj8aUxb3Re2KAn1FKdlsFUA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxxWHRFAMOGbcKvDit5qTuMb+6zEc5/P3Q594KBOcxhFihzx7ptrSm/SJcF3SJNgP
	 QvFrlWy2nfPKaVPoqRbhWOb32DsZ+FUYqzl1Wkn2GlpkaCSC6VBoDL5UlEHUDoBY8y
	 slU+DrxhOwa6l87ew6ZyquB7Krr22XrNmdPHofB2LLtDxvW0q5bb08OzIZXCE9QsGb
	 AHEOl7NtXb0xi63yBzLvpTlZFkvqFWYPbsqjDTqWWPT9U4l973g23W60OVzNp39PWA
	 TSa7twD17eiu4pYU/oDdOl40hPqxh78nxa1x7dJ9KZJwHANGcQf/T65LW41f3d4pJJ
	 7DjJs8tu5dpHg==
Date: Thu, 26 Feb 2026 08:04:23 +0100
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
Subject: Re: [PATCH v8 01/18] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
Message-ID: <20260226-resourceful-pelican-of-defense-437c7e@quoll>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>

On Wed, Feb 25, 2026 at 03:11:18PM +0000, Bryan O'Donoghue wrote:
> The first register bank should be the 'main' register bank, in this case
> the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
> to CSID or to other blocks such as the Sensor Front End.
> 
> commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")

There is no such commit. At least I could not find it.

Also, please wrap in the commit msg according to patch style.

> assigned the address to the first register bank "csid0" whereas what we
> should have done is retained the unit address and moved csid_wrapper to be
> the first listed bank.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..9aaed897f7e0e 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -21,12 +21,12 @@ properties:
>  
>    reg-names:
>      items:
> +      - const: csid_wrapper

No, that's ABI break for no real reason. This ABI was shipped and there
is upstream (and maybe other) user of it. You cannot change it.

Best regards,
Krzysztof

