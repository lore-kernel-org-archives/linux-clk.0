Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833EC3C554C
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119727; cv=none; b=Wv5w6ENafdEmM7R87G6EMM+7ucOrMWbFB48t6x+JqLuscCqkuM+U4SH4Mhqe1MvQwv8yYcGppKdDM0lI60hRhm5Ujokwn4xo6/dRz5uafh/Nv3tvRBSSjzcnYHj1NpLN/KaFBngIeEf720oPrmM1p92ZGIyb1vr9cBBkpflRh5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119727; c=relaxed/simple;
	bh=EeUB2cb/q1piHZca/onlXUaq+LBqrgeNV1GhGqOS9D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfohMNvGvG/nMED2ggIwe6GIaFor2VTjuW8rn22ZQ2C8zwumYtWh/KPmB4oM+nl60a7Bble/s34yZ1o960Ewon8JhPpywBgo1yl0ZlAfvTroypeL2csi4lEDue1uXZy4ABAmrAis4Ps7vU58K3WWuEAKswS+YoQTxtlUn+yxeqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QH92+j9N; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QH92+j9N"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso366382f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119725; x=1775724525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GIru3ZjVDgno/c6eBjpiuQOVd+IOE1T821J/rtKRzE=;
        b=QH92+j9N5HdsxjTswqLhwMh5DkoXkoW5HIUI6dMDH26eKMXP7OpXKfoUfb/yv0k9nn
         ktcigONQRnj1m/9U0+2PjofBUCqIosFS3CIWpHTBXxeyEbXt83rSeKoyYcU62ZlK1BSS
         tbvx4I0WxCJHK3Bd+hfDSJy7bUkl0FUKkwCTjQVTrjNchlFeThMI+ZGXAAJgF9uvZ5T1
         BCxXocRgMva4PcdAF+gvlYQF6sXKJl5Cj6Tm1vAVEAtbG5Irdr2ue27Z19Sw/WMVqcD0
         R97cd5VTJMr0mG45FHR0foRKTHJ05rd8T12CttMTOIc9b6fFddi4BewOD74p5y048ioU
         hhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119725; x=1775724525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GIru3ZjVDgno/c6eBjpiuQOVd+IOE1T821J/rtKRzE=;
        b=X9pDrSBF8ToUJsSpivZ2t9fIqKB9b1iJR1GWT3gQ7PnH0/8eiofXxfge1CuekhkyjB
         XCpTXcFR6Z4TPU2b1W+Ig8V6Yv3KskYFxdLZD7wc5FQEsFMETua1bM2o3wwf6g1r7XS2
         0VAZlo6CzzwWigfrWqG0qAq9nHZzWj2NhCD77h1rzM19eiBUf9MdLvtDvT+3yhMcXIWI
         eIuIAiPKOBc4eCF/w0jVOOmjkbDN2fPkMPJ3tPhSysQ5+gJa9H9E032cuCMZYRgHDAgq
         rVaWnwS3vWgbIc9CwcMYj3fnqR0UROQxg44jQJea1leRSaNBxpgQf3KBpmbdkIJuBu9V
         zCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc4tniMOhQnAAwYsyiXxs5SWK85NKObFF8LN4xcD+6HE6kP1vgeLPTGU9oKttq+yW74GOim+k3cSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtj22l9fyywON61n3K87rO/GZTMU73Rm0Ny7/BW9n5i1on7zeh
	lnjB/pNQEZ4Uwqu5XFk62JCX6SDAZVmdU/GCoubPzH8vumJwMNlPotsEg5Cn2fw2yhU=
X-Gm-Gg: ATEYQzxt0l58oCI0XyJ6PZFAcNgUtyYNwgFetzartXqem2Lrvh/whdIQaotVEno44BY
	vLUq/fyu07xtclU/wq6l4hBsHtOgwUlXAEe4xIBR2OWb6LP1yNmIdi1ASTUoTblkw7Y7RZTZcRr
	kaJPSnMdhcFE/LjAHbqGJgyD97cQEFCwEFx6QXoaQ3rW8SyVurqZMSbKktUGwFZNyF0UIn8C1wt
	6jkUd61+W/ztMQrrbueMhxSIk2T5rJYyZswfvaPpPrLE5KYtdIa84u1AdZtveA+PkTkglQUCbhZ
	alBGVacoae8C7igSbrj7xq+ZGEY7iUFxAXCqYk8/j2jEhGhLPehpcY0nxEXOkfdoh5Q2T5a9AMv
	+Mp8MJ7Et9fghgAbH/KI0I0+FuPJhKBrjeIWIv62HUwpMCqMg7aB72MGPv6/KyQfO+C8KizlPEP
	H4R/xVT9SkURqIx9sJZmhWQs+jjnxvr4c=
X-Received: by 2002:adf:f5d0:0:b0:43d:1c7a:8b5e with SMTP id ffacd0b85a97d-43d1c7a8c46mr6458921f8f.35.1775119724871;
        Thu, 02 Apr 2026 01:48:44 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d28a5sm5139022f8f.20.2026.04.02.01.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:48:44 -0700 (PDT)
Message-ID: <56c0daaa-4290-48ae-83e3-40ecc4ba59bc@linaro.org>
Date: Thu, 2 Apr 2026 11:48:40 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/26 5:20 AM, Alexey Klimov wrote:
> Add mailbox node that describes AP-to-APM mailbox, that can be

okay so here it's AP-to-APM mailbox.

> used for communicating with APM co-processor on Exynos850 SoCs.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index cb55015c8dce..fcb665ccc7ae 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
>  			clock-names = "oscclk", "dout_clkcmu_apm_bus";
>  		};
>  
> +		ap2apm_mailbox: mailbox@11900000 {
> +			compatible = "samsung,exynos850-mbox";
> +			reg = <0x11900000 0x1000>;
> +			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
> +			clock-names = "pclk";
> +			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells = <0>;
> +		};
> +


lgtm:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  		cmu_cmgp: clock-controller@11c00000 {
>  			compatible = "samsung,exynos850-cmu-cmgp";
>  			reg = <0x11c00000 0x8000>;
> 

