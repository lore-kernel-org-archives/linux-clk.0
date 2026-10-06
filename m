Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA86286417
	for <linux-clk@vger.kernel.org>; Tue,  6 Oct 2026 00:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246657; cv=none; b=pnyt3KgX4vBiieMl826GRRmMEtdfFKHMWPCCrxezY02nWXV/mCYDzi0gkoMzFtgqRXTmsmjwDNFR+mexrw2VmL4aqfKu02wwEDskU8MLzT/iFN2l7jRiYmTnFmmc3l/WqiGAtk96hwZDl89uMbMoHRy0MvcOS0a4ZbEqtW9vbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246657; c=relaxed/simple;
	bh=nlfOu/Cx3dx7WAl82DavblqM7D6pKK70uc9LSQAqkOY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sSQjoejafE/nEiWqbvaGPj/Yji0xJKfns9lVUWueI4YFEThRzVT0mDzvp0aVXgHi6zkuulOBMLfc8HjHSbv3IeAL5WS6dBAfy44xzItzhjCNb7O7vmH5lMujmdCWbAP6nA5FZ3nsf9YEJGvGe7Yij2gKrw8DjcnwM2zl9WUGxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=inEWEQNc; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="inEWEQNc"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5351748222cso18627011cf.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 17:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791246654; x=1791851454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CN7LmvsZdWmYM0BHY8P9OeOGiwwpFgBTQfuLY2b1oDc=;
        b=inEWEQNchdRW0C5a3Ij3mnDWP+Qn1rJrUIpRlz2ecpMH35Ys//re8a8PPze4x9avVQ
         nNjLlfoKRHSHkIh+/CyaRyJpWSxgf0PiV0cWEoPXGGhdz3u9Kw+nsR17s45eZ6utSHTK
         C5i9HMTUDqoiWXey6NWK3/Xc/QDXs3mgRGfTtz+Fr6gGWDfBgz6XrlQs3EGcKz1wLC8p
         F2aHMYXEuvlE06f7G2HjcFaRDWlmEuv/YxOwrS8DJnmF0h4HH1zZstC18YGeUrpay9Sg
         fX3hj1IGJ9R5TTbyvNz4/RXdgdura0ILpu37dGTBRTXhwFiFT6VU76l0GWHTMkWuJ/8e
         JI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791246654; x=1791851454;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CN7LmvsZdWmYM0BHY8P9OeOGiwwpFgBTQfuLY2b1oDc=;
        b=N2vmz4nRlKw+ZH/AWDn3y2piJRZTXpxQ93x9cYoxgxrSqerAYVfCEcipbagVVT7nui
         cxxp1O3R3wN8archrEB77K2wAg3PRtdflW7HjTgfmzkS9yyz4asw/9NbizfTndpz7eGn
         GLGDO3a8xjAydOAt+VkU/b+A9B9tMeY+BTgcp0ZxBar/DagUkmVcEjroBrqIAchTiln5
         OXDR/od/9XwUw0iX1ncTQjEJf0RRy6gpEsQIsWEKp+OSHak7gZ4et3jKwVqtkGVUNVNm
         dWEYxWMDvYT3X/oc9qGzi4PVQ+TC4HANElcycxLmsf9mxiSe9cKB3VYNDWlmlbJVy2/b
         pSqw==
X-Forwarded-Encrypted: i=1; AKwUvBx5zAsNiKy87xMSGX5vKY40BgwmXQFdkg6CVI66R0qkuiaqGcVDS1aOA7J3G6sLTqbCW6fRKC5yaBU=@vger.kernel.org
X-Gm-Message-State: AFuF++lXjHvQ0KTUWi56HC9tYxekNTOL69PgCgXpO2pZfucdgNtmaQ8I
	tTO7DLKCcvG9poxtzH26ENO7in3LCxcDzyG2DJsWh5m4CGLhH2+IuYWjLDYIutcjvgE=
X-Gm-Gg: AYBFou0KwQRJIUlilQe95lod/6vv6inJU5EwEj6RWv7oF55LM3FgMu1DGhEKDaxFF/0
	p8ajeUsmmv4vrGZDvTPZGgFSILBjyZqBtxtaMKsN2ITL4PpkSam+1n4q0mRAbGNt7WdKmtBSd4b
	OODMEguhqlolw89DUM1va077ZQD7SAyanFHAdj8V3d3WwkrRWB1AsJxqZS169GXQQkRYjq+y1ia
	v3I76cJRykRZEF69sKUP+1h53QpqqDtRVdIvCRc391w0raMkZq3rahf78sjXHfrr560eOmVWpLn
	YCKm2GlpS6NTu5fyq8LY3deHNx1+OiQRHUF+5OR9wULGGpU3goLb22VY+IRLFeQrd2+CpnyL5yB
	Xqy9jlpEAgdV9J/9++AXncooXNkZ3US2GN+wZjYmRDvyZmkvHQpMJMZ4D55OSPn1qXz1enrCCaF
	8vjx99/LXMrxffhj7cBmoIDI9MLN3docML5PzFQqBbOnD2AOwxfdMjAImCsxVXbslMhl8S9DQ=
X-Received: by 2002:a05:620a:800e:b0:93c:326b:43b1 with SMTP id af79cd13be357-93e5104ee28mr1517731985a.36.1791246653835;
        Mon, 05 Oct 2026 17:30:53 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca26371bsm998476985a.30.2026.10.05.17.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:30:53 -0700 (PDT)
Message-ID: <c92b8d7f-20a1-4bca-b51e-40ae52155099@riscstar.com>
Date: Mon, 5 Oct 2026 19:30:51 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add the clock
 controller
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20261005230927.2000398-1-elder@riscstar.com>
 <20261005230927.2000398-4-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261005230927.2000398-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 6:09 PM, Alex Elder wrote:
> The clock controller within the TC9564 SoC is accessed via a PCI
> endpoint bus through BAR 4 of the first embedded PCIe function.
> A syscon node is created to provide access to a range of memory
> that is used by the clock controller and shared with other devices.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - Moved the clock devicetree node to be a peer (rather than a child) of
>        the syscon node

Whoops.  I dropped the "reg" property, and that means
the change mentioned above leads to a warning.

Either make them peers, but keep the clock node "reg"
property, or drop "reg" and make the clock node
subordinate to the syscon.

I will address this in version 3 of this series, but
(unless someone suggests otherwise) I'll wait to get
feedback on the rest of the series before I send that.

					-Alex

> 
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0e3bbdaf4661f..06246d185b50f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -9,6 +9,7 @@
>   #define PM7250B_SID 8
>   #define PM7250B_SID1 9
>   
> +#include <dt-bindings/clock/toshiba,tc9564.h>
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
>   #include <dt-bindings/leds/common.h>
> @@ -961,7 +962,7 @@ dev@0,0 {
>   				#size-cells = <2>;
>   				ranges;	/* This will be updated dynamically */
>   
> -				pci-ep-bus@4 {
> +				pcie_s1b5d0f0_bar4_bus: pci-ep-bus@4 {
>   					compatible = "simple-bus";
>   					#address-cells = <1>;
>   					#size-cells = <1>;
> @@ -989,6 +990,19 @@ pci-ep-bus@4 {
>   	};
>   };
>   
> +&pcie_s1b5d0f0_bar4_bus {
> +	tc9564_config_syscon0: syscon@0 {
> +		compatible = "syscon";
> +		reg = <0x0 0x2000>;
> +	};
> +
> +	tc9564_clock0: clock {
> +		compatible = "toshiba,tc9564-clock";
> +		toshiba,config-syscon = <&tc9564_config_syscon0>;
> +		#clock-cells = <1>;
> +	};
> +};
> +
>   &pm7325_gpios {
>   	kypd_vol_up_n: kypd-vol-up-n-state {
>   		pins = "gpio6";

