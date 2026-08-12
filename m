Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB848341057;
	Wed, 12 Aug 2026 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533978; cv=none; b=ctX2qcFTJ/i7LlfT6MUEGCWtd1X+8n7nirgqG/lpX4z/Hp1z6GgbjZ7DzZ1LZdX7NQrYIBbKTscDuBXYPZ4XENaSCNw7Sy++pEmlnSziNsFiX6JAmgHtguv5m8NrIFr5LfZJKGz/eDT+XfkL00dWTQS+XCWSWVLNaGA2OVPtR+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533978; c=relaxed/simple;
	bh=ypvPzUdlZd4kGWv7VDm2+x7UTmwm9Ww02T4dPTQNLUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGzIqucPCSpr14Tlgk/F1iGnvfBmx5l6DM505IedTolgNhH7Mzp3oed6UArFrM9C+JirAobDQWzCAKvCpjPwAy0xAF8n2AQGVII8aOiBMMY8/CvyF7g2rnAp7HotiJbRHJuKps4kYbNcl8vFYvE8A1MzIRYu38sh9HpXYXwJxwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMKNNfJr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMKNNfJr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CFC1F000E9;
	Wed, 12 Aug 2026 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786533972;
	bh=DqEBb4Hucv8jMMHQbJC9GelPSXmEYAbWexmfKK5fNfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FMKNNfJrD37mzdWW59yPm73OqpDxvGKwp5SKp5XaaV/j7qUwOOuO++r0WB8V9IHxh
	 aujbc7PZeiyfcsM52qNowJoYW0B97gJMA+4thu91gleUujIjfRB7MhI4nDbDzggbn5
	 6TNdlWJwQRYc2FCetFdF8Tw7yEJZIgncmicNZY3jAzdyI5cqL3uyohiOykwFI2J0OA
	 HZZXnm8KkBAQZ6mL7ck0s7gUKD3LDElxEde5ss3FneWjKCMOc+et/YG29+lcV/DBb8
	 mQHthD7qe5mVchgPxb1zm6vfTZklJ8BO2misLWf4maUpm1jykXoRw03/d09JHqyuj6
	 cBzLK79SBJqTw==
Date: Wed, 12 Aug 2026 13:26:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: agilex5: Add USB3.1 reference
 clock ID
Message-ID: <20260812-fascinating-uncovered-poodle-b6e6a1@quoll>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
 <9b583ba4a5ca48d07854b7d005b43b41fefa7fa3.1786518803.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b583ba4a5ca48d07854b7d005b43b41fefa7fa3.1786518803.git.adrian.ho.yin.ng@altera.com>

On Wed, Aug 12, 2026 at 03:32:54PM +0800, Adrian Ng Ho Yin wrote:
> The Synopsys DWC3 USB3.1 controller requires two separately named
> clocks: a suspend clock and a reference clock. The existing binding
> only exposes AGILEX5_USB31_SUSPEND_CLK. Add AGILEX5_USB31_REF_CLK
> to allow DT nodes to reference the reference clock by its own ID,
> and update AGILEX5_NUM_CLKS accordingly.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>  include/dt-bindings/clock/intel,agilex5-clkmgr.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/intel,agilex5-clkmgr.h b/include/dt-bindings/clock/intel,agilex5-clkmgr.h
> index 2f3a23b31c5c..196c0bad3e52 100644
> --- a/include/dt-bindings/clock/intel,agilex5-clkmgr.h
> +++ b/include/dt-bindings/clock/intel,agilex5-clkmgr.h
> @@ -95,6 +95,7 @@
>  #define AGILEX5_SOFTPHY_REG_PCLK	79
>  #define AGILEX5_SOFTPHY_PHY_CLK		80
>  #define AGILEX5_SOFTPHY_CTRL_CLK	81
> -#define AGILEX5_NUM_CLKS		82
> +#define AGILEX5_USB31_REF_CLK		82
> +#define AGILEX5_NUM_CLKS		83

Playing old record: you cannot change it. If you change it, then it is
not a binding.

Best regards,
Krzysztof

