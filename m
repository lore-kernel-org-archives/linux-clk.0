Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120F2D5A14;
	Wed,  3 Dec 2025 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751506; cv=none; b=VIR3VvikiUMoFUjET1oEytfXRupi4+bImW7dpUwGZbTGpfSpyoGw1CAUtrz6FlAyRN3P3SkWBj2aU6JeqrhPyiXzHXHe5RL+vpWAhJou1MaS3eGkO5i2dIMqdQDxUf2PjPdrjTtFANcZpmnHPF+fGuq2T4gatZtBIDKEqxW+yqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751506; c=relaxed/simple;
	bh=eY788H2GxaX/0dZ4ewNaRPDe3n7sY7pMPdmz+2V68uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqIzEj/TF5JjrhvSV8CBsdNRuliBIVpj1HC6i2TUyR5fkOr0VsSbY70tGOHTQjedHM0PwYRjv1EZp/OTGvrHKaMaoekCZI8E4JqB42bjER+rmC2HTOTISxK5wcjc9bZPAPBd837b12yzTsBMA+fHZ3NhBT/GOLfjDcnqjduSoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=CoIXvQcM; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="CoIXvQcM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jHkz3sXS4xRmbb1n3DFi1LDwAUWzmiQpx7m6JbKmtvo=; b=CoIXvQcMRkDNGCsctbpohlDp4F
	+U6Tbx3RfNFLbpcEOydCHRRJjLnZzeLL3udR/kPvCw8rnHwoqeCNjLrv4PEsBX13+LAh7p6JtXp0g
	uI73XgyUP5WdIKYk29gQfhVApE8wmkGyzO9puw9yUT62TXHvHmlSbxmIP9PQntj72KmU1SKWDwxkt
	OTD2qQADd93dlMqS4zlftwCU816lId2dflBn/JM/cauX7W3ebBphDcYtDAPYkkwPj1mg6WbMbij1o
	ayn9luvmXm8RMdzVryYpEtNv8CU2b/mYpJaMTVKRyPP+npGTZt8/PZa/TpGUCWBlQWGzgYPeBvpSL
	IbrsFREA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:45380 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vQiGZ-00000002WWi-1Mau;
	Wed, 03 Dec 2025 09:31:12 +0100
Message-ID: <304467a9-4c7a-4722-9e70-4d178113c33b@norik.com>
Date: Wed, 3 Dec 2025 09:31:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, andrej.picej@norik.com, c.hemp@phytec.de,
 s.mueller-klieser@phytec.de, n.wesp@phytec.de, c.stoidner@phytec.de
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de>
 <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-1-9c14be6c7478@pengutronix.de>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-1-9c14be6c7478@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Marco,

On 2. 12. 25 14:44, Marco Felsch wrote:
> Some parallel panels have a pixelclk of 33.260 MHz. Add support for
> 332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.

Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 090d608672508a8819dc68eedec5b8d4a2c140c8..579f76494eb041dfba58b8cd10eb2453a0ec4178 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -88,6 +88,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
>  	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
>  	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
>  	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
> +	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
>  	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
>  };
>  
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

