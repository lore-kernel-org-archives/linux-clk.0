Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C83168EE;
	Thu, 27 Aug 2026 05:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810397; cv=none; b=SXYirEc7UbVa+m7kyfSxZF+QDKE6V9in+2L04rjdWzwCnmFujoKCn7rfiboQCg5sFTnVDtZI77RDOcariIuQGtHU9rdMRpBTujTlCDAMrPkH5QMkQQk+WQ2ZWZswBCaBEkhXjVSxINp7hFlATH9qUJpT9WhQEBAxElOIWSowMAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810397; c=relaxed/simple;
	bh=jcYd+/XcMCeLWQuAwc9iSUFmiia/qsYeZN8RX8XdkKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOBvEqFbytZ4l4dNHCZf1BBSes+uMvdXVRnV6rlZ0Cc7OIc8smU4aJCbNqdNQmBKwBUQCht5v906yDIyUUj+U3ePnSJRrZNe/FxkTKRoAmcMTHjie25/fQQgC9HuOJlH1eWE7Gu1cZMJXxxvHBtniULBSmwDkVOgn8mbspWmW+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqNLkcA9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqNLkcA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8EF1F000E9;
	Thu, 27 Aug 2026 05:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787810396;
	bh=Doh3gHITvz6ndbGdETkwbhIShj6JNDjcl7yqaAUrQ9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PqNLkcA9AH48C+4/ucRjbApht4e6iuPu7uKD3mt39GkypaF7zBxAG616kNg57fsvw
	 xEzxdHDoPs/3TO9knc1jpvBqT84VzyBX209h+2jLrX4tB+/9iPQ6Kq9oRlQkFwGq5z
	 /2KL2MP0/NS3JDJDIMVwYfFnGClxIAed+tiG4dMcGW0plsgRspiRxnNdJJiT8r612v
	 jDWn6smGrpwlvEPGKgenSvN4HfArE3EEkLtTjoS35tvGNypd8Am8Ck0msNNbBAusoc
	 8zGeTFW6nrMF80XlN1Wi6W0YC32eer5GtXk41/PDp7TntCe4XwU9oOk6s6RgoCbVA4
	 QrmEQUgeyDfCw==
Message-ID: <d0c69e30-de4e-4e69-9556-3fd93d011045@kernel.org>
Date: Thu, 27 Aug 2026 08:59:52 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: microchip: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <cover.1787240035.git.geert+renesas@glider.be>
 <85c229d88f297fe32c3f2ea42d727b116bdeb998.1787240035.git.geert+renesas@glider.be>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <85c229d88f297fe32c3f2ea42d727b116bdeb998.1787240035.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 13:04, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/media/platform/microchip/microchip-isc-clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

The only nitpick I have is that "media: microchip" holds multiple
drivers, while you are fixing this for the microchip ISC.

Regardless,
Reviewed-by: Eugen Hristev <ehristev@kernel.org>
> diff --git a/drivers/media/platform/microchip/microchip-isc-clk.c b/drivers/media/platform/microchip/microchip-isc-clk.c
> index 24358d804e75d75c..65d5fb8019b341b8 100644
> --- a/drivers/media/platform/microchip/microchip-isc-clk.c
> +++ b/drivers/media/platform/microchip/microchip-isc-clk.c
> @@ -231,7 +231,7 @@ static int isc_clk_register(struct isc_device *isc, unsigned int id)
>  	struct regmap *regmap = isc->regmap;
>  	struct device_node *np = isc->dev->of_node;
>  	struct isc_clk *isc_clk;
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	const char *clk_name = np->name;
>  	const char *parent_names[3];
>  	int num_parents;

