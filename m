Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574910;
	b=XYp0KU9537ZIWTKMLbV8J/gosLr9z9rMu+sVuN4C4wMB08r/yyJWdY7l191kAjvrHB5C
	 eDVUUE0tymWuW2qHw/8e5KeGe0Ni+urX0s2YHMpMkcM3zer1gy49Mp7U5LEawxbrKFMgm
	 6lrRnIKDyop+0lFWBPLTPxzfTMU0PHeZdeweWYVTccypTNe7Hd1H5db9k45ZcY5DfuDGR
	 N4KHVupWg2JS+9d2O5ss3zmvIZYkyhOW3RaFvJLdInvp/pKY7Q4RTmv5Y1B+Is8ikgCZG
	 eOCwzxiaaTEx52NchZW2OIVQJ+1I9Q4vlyjHEuK4fJqgKEHlr9dvJ/PnHSCYm5wbBRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
	b=sNPvJOaCqybJ9y7c5TYkExY3QOmr3Stxa/cbYH6WIRS1Rl33sJVn2HmdrjEoztmstZJT
	 +x6H0fcphkaMSame90PXaFWeORXuYNHko3imat+6+fD1Rhed2mazxV7gV0MZ8BCHiyBfh
	 Z4tRupVc+/uiGT0JRl43He750rnyQg38TYH9WuW+MVb35yDWS4T00k2y9mJovHT4VHdys
	 8sp5OjIdzQ1y7lZoidcFVOvd9t+3r9XvgGGagaumkPrfnxy1wYsA9jggSVdYbiaredGEm
	 HOWSKrDnkkR2Tulx8mIfgjEbwDX87FaBsPL3tymX2i6psejUZ4DZoBHGvxAmap5IdfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yg2aVHZM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB189606A336
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB189606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yg2aVHZM
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so2066959a12.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 05:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574908; cv=none;
        d=google.com; s=arc-20260327;
        b=fy2/ngNpBBHbAFQzUbuH1asM42bxjmTiwTB9UlNevfFq2UBT98CkpQNFFoSPVdVqSS
         HjTT3i7Wb5+2Y7+wml4LIoKKpfBlbWZndLpYXWC5+0kZkunUmmIPq6vDCpx7EmsVzyWZ
         baZrD+wT/F8GJ4AVoEiPHfzXElZG3sIGW8CntTD2fkfHThTCTOI1vTc1HjiJa3a/jVp2
         0NTLg2eYrvIuhiKSfCvp95U0qZcHg+SrWCASqp7xQvoc+1ucAsoc2oDsWZXshWq4PvPh
         JDv7JDXUbTzow9OS4UPyQxiwfddoHtKdsimB54tFnsI66iUglR+oJ9n9kX8X2ltkW7Ja
         vsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        fh=YBWS4YRpixrU6t7CH+FyVfBXXrKCq3Rr8Sn/7dpsDkk=;
        b=X5lDtzeO4lJeCBSd8jqlcMAU3Kfy9sZGPnP1aCYaD77u6R7KnzgRLJ+2asOZ5DYVpl
         SYLke3NwsztRmRCOfYQcslLgdSu9/v8iRuuWJu7tjHgtS3mGpBZJj1mP9e6wvDh4/ZUd
         iwoHoHWXGScR5t+mWAvXQm6KLntSMnd/Y9CJ9iniug0BhNz70f7+/NGVqJrH8oybKgwk
         fg5sbEn1BCfy1sZvEPdW7Lecc1cyl89h75o9Mgqd7FI1SZtH06llR0NQd6DxPhFiA70K
         /5Jlz24FCjzOUo901Z03AMQtKQQa2EtmsSreENc1Ie7hYEf6JLg+oKlJsHoJAzS5W8P8
         k5oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574908; x=1795179708; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=Yg2aVHZMqVneHiwckm8fshswVKEjDDg3fGYweaRCKQ1LB9kEeHc6ZUBTWrZ5zrajdJ
         J3NPx7N1IBwiFn3kf/z+OWrivkdXO3HXB3dfv5rj+U4TIcjbk6cYVuzy+P2MV5ekJJwu
         8mbKTjvtDFhdMaPe73boK5BYZG2vc1ztHGioC7fHt9PF4VWSHzLLJGHNtTIXK4kQHSE8
         G/Q1J5GPEhayhXwyaqWCVR6Br9Mr5QQ4Iym9DA2hCmJbB2UfCfdQ/gNlywTUKQJ3Dmw2
         1GFDfHlzu1UeX+VxcENlq/ApQPoKOzw4Nqa86TH8RiHalCLTxsl1w6jY7JREjRcZ6tCg
         HZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574908; x=1795179708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=zV/bXMTZwpbPo/URCVpAVyojqoZdPc/8cRyzYPwTaM8UNxyEWeKg+ZshUOZJ7Z83u/
         +eYV8WMuAc85rqoAulqKpE350f80fZVn4Cv2y6oeDsCIU7a2AYKW04J7lkwXvjVAkB7/
         FWX51i2zBJUBjnDrxlxGEkiJz2Ek2qOUj3oJD70reo7casfwilGDXtvluCY7xjfzw2Km
         kvqi7ER1BFZ8I5Y90EsoADJy0Qb1lz2ttPo7c+E6SyBbqqN2vsPBt1RVhc2OkjJt3LsE
         PvO80pk5swO4UGoH9hw27Y8umKWd9zresuJM8ue27B/advIBXzROuwrEvQnaFgKYTaoK
         xLEw==
X-Forwarded-Encrypted: i=1; AL+hErEa741y0BN/1vhYExobVgegvGCLZKfacEb5uB7+c1eg9AuzeuaMb+8aGZ7ET/tpYfwl+ECkRMcFc+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B2QfohHZ9E/rTTFCHVEI+VB3in1y8Oq0pzLT7K6oHJk6BeML0
	E28ERh08FiSr39v09n2AKAdR58Fc9h7TfDSRLdM2MFDduiF9lC0oEsC/aSb87iYm7bHRStsnqF6
	RB4IS0UxeBd1HzyBwm7fgot78dntzRalenOh0wh7UYA==
X-Gm-Gg: AYBFou1fsMCAYtZXaYjXjvAaZrFgDrfPgmiiq4HVL6/UOrn47rqgdHH2IaIbYb/mApf
	d8diydp8fRUSeNYavWyyKQMd50pwLmsFJxPHJhnXsSSHfy7laXfjVfESOtgWOFXRxcz+TuXKYVG
	PobjxaI8WdZ4DT9yn1yOElQ5FtEPL331TKyTXP6tpLON+HhbVQkg884pStk2yiSyPTvF+Em00Ug
	kyPGD2TBzpGJAOk/SjKqfLIT0AAN2xB35+IXftxE1PSBwSjq1H6Q409EBJOM3In2KUJqcT/JUAa
	3fmy41ffG7qBPAsG+3wkZEU0jPgZZ+emboatL9eWT67bBRtXvG50xGqWaAsdllUqzFcVYnFFRck
	wFsn6Oy2Mog+SMuIXRFoz8qe0lb6JfmBnc2OG5443/v7olyQhPQj/3XGR585d0Qw5FEW/kw==
X-Received: by 2002:aa7:df02:0:b0:6b1:e4cb:a23e with SMTP id
 4fb4d7f45d1cf-6b7c0953c22mr1651047a12.14.1794574908159; Fri, 13 Nov 2026
 05:01:48 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-15-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-15-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:35 +0000
X-Gm-Features: AclHuK9jDSyMiIFILSiBUttwKXmQ1n1NCQzZgnrbYNenJcyQXOWeJVgUA5tGPQ0
Message-ID: <CADrjBPrA1WZO_7bjV4jbOGB6MRZMG6=8UTTAtf-v_ZRq06MxpQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14 RESEND] arm64: dts: exynos8855: add cmu_usb clock
 DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_usb block, while at this
> add sysreg_usb which contains bits for DRCG and MEMCLK
> which are used by clk driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 3dd7a4c4c609..dcf1e58c6367 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_usb: clock-controller@13000000 {
> +                       compatible = "samsung,exynos8855-cmu-usb";
> +                       reg = <0x13000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_USB_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "usb20drd";
> +                       samsung,sysreg = <&sysreg_usb>;
> +               };
> +
> +               sysreg_usb: syscon@13020000 {
> +                       compatible = "samsung,exynos8855-usb-sysreg",
> +                                     "syscon";
> +                       reg = <0x13020000 0x10000>;
> +                       clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
> +               };
> +
>                 cmu_top: clock-controller@13900000 {
>                         compatible = "samsung,exynos8855-cmu-top";
>                         reg = <0x13900000 0x10000>;
> --
> 2.34.1
>
