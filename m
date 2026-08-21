Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BFA3382E1
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319771; cv=none; b=TAqRBgRNjmWjA1DP+dfKwCxpAFzyTtMJxyjpR2dCpKf6Olt/d+mfy0kal2RGIbPrquwGYgD1BFYFpkDZSCRSIMwkTOdw+I6x0JAySfGPPhjjHcaGz+aFKpFnqHC2m/+3wSMsGDXX1IxYiTXDfIcg38HHFJue0ICov+uBuWzZiUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319771; c=relaxed/simple;
	bh=OYblkIPvFK3adzhiYE+dB+hoIVTIAB6uHPDQgjSjkgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZbWwsgMsGHNxoimiR0aDLYEQiVV2djdbaJOy+NmX4XivKkTiqU1Trxnqr2vXOyok49dGWyYXhfyxIEX1uQrsBfOub7Ngbb9+jWTQtKBpTLA4adAcOw7xBVJeMAqbtPB3O6cZSXGDPbOPPWjSdMUwS5Aw0PlGjk9aOH2/YuAZgiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1qSkZtn0; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1qSkZtn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787319769; x=1818855769;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OYblkIPvFK3adzhiYE+dB+hoIVTIAB6uHPDQgjSjkgg=;
  b=1qSkZtn0fhXUWf756EguSPwW0WKxZXSPiDsmsyXin0RsHS0yF+01Z78q
   QlmZTG+DiFj/Bme9tNce8jdpT18k2lvvnOWfUwNQvfoDoJk0eQ7vRtzCK
   F/pXPelwGfcUSJemfNO5QsVUEejgQdknzJqlIOhL7oWu7nx7Yxqqzz0xQ
   CIXNUFkBg62YmVdhKp6gU9lJsyGiYuhqeTmI39W5EvBn92bQ+XRWzyqaI
   EofxhjNxJKxeURD0JzdSv2bB6HqOdSRklT0Lba2HYbKxjM6DwX2sILVkp
   jePGtrvTy3ZuBfWRBGqmUwxlsX1zZmqzu3UkZ9xY6fwdngR22ksrb7lv1
   g==;
X-CSE-ConnectionGUID: aCI/hKX0TluHZkJx/PTHRA==
X-CSE-MsgGUID: ds4opapdQQ2FMWxHsv5ymg==
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="293855005"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 06:42:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 21 Aug 2026 06:42:44 -0700
Received: from [10.171.248.60] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Aug 2026 06:42:42 -0700
Message-ID: <3a3823f1-7dcd-474f-bb81-e5175752f649@microchip.com>
Date: Fri, 21 Aug 2026 15:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: main: Drop unneeded cast in
 at91_clk_register_main_osc()
To: Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
CC: Kees Cook <kees@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <51abd9177801984889c2a0c321ea8587677178c8.1787316176.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2026 at 14:44, Geert Uytterhoeven wrote:
> When assigning a non-const pointer to a const pointer, no cast is
> needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yes, thanks Geert:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
> No changes in generated code.
> ---
>   drivers/clk/at91/clk-main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
> index 6074ed2a16cede94..77f905e57e1ab4de 100644
> --- a/drivers/clk/at91/clk-main.c
> +++ b/drivers/clk/at91/clk-main.c
> @@ -170,7 +170,7 @@ at91_clk_register_main_osc(struct regmap *regmap,
>          init.name = name;
>          init.ops = &main_osc_ops;
>          if (parent_data)
> -               init.parent_data = (const struct clk_parent_data *)parent_data;
> +               init.parent_data = parent_data;
>          else
>                  init.parent_names = &parent_name;
>          init.num_parents = 1;
> --
> 2.43.0
> 

