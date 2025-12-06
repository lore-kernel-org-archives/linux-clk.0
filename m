Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB92D2E7635
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020476; cv=none; b=PPxhlWtuuj8QLAF0gZcYzKDpDYGE4rO5XfraST/hR7+kdHD7JpjK5X1cACKYqNxpIwJAhyEwodTlATTmulJoYY/bI4CxBNuM+hBAUVEH9TkSHlQERDNZruEgcIODa4Rd0yuQEz+0+IAaeqckNrMSxZOl3JGFOswM1ThsgxqAUFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020476; c=relaxed/simple;
	bh=XaNiArVUEN4ZsQecQjF6gbv7SF9bNnSkov1ro/kUthE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIkRX1/XA80XioPXDqryD0qb2ZgK49P4I1Q4QheaOVDhvzzs0G9ppL7RZPgux9WcvR6Yif03VmJfp6NybZbTjmdqLiXhntY2Vm35CPaflZe5fVhfD6LXc7tWIEHtGtciQWcXv2b1/Qxsxj8yejh9iz6KYG712GMSiEuYXSHfVcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Gy3Zp7rU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Gy3Zp7rU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so37880615e9.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 03:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765020473; x=1765625273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54ozK3Z1QShV9IRHsBfnCuV50Wy1Uh8rW7bx3u1PONQ=;
        b=Gy3Zp7rU8uTvPrWpHslNpe5sk8Uo4lUaftPiYN7NlJEkjNB0vCnlz+wn7nEDoZCuzR
         ArpP/Ip0O7qhTIlg2YMyfxbory6ebAxCRE4ytwn9izpPVDsvMNQbh7mvrKin0v1j1qQG
         SkcC2UGVTEa4R+DjfmtQqJoHlxrExteZLw7ZdoKTlBaQi1tXXN5+8jOVvVsYS16gtHdG
         iU7+IhMkEoIJAhxwp4cNq0syOOc7jzkCvpEMUuR5w8MnQs4w9uIQ23V8pGuILVKsUxo1
         hu5j6KbXS0a55PrZO2bPDvKyTsSjKazG5sRgOnj/SWx6qWHXXF5SPtojl3m33LG1QXBY
         VZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020473; x=1765625273;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54ozK3Z1QShV9IRHsBfnCuV50Wy1Uh8rW7bx3u1PONQ=;
        b=DG3yHYP29frA+Vxfty6Jy0cXpynekAJjfH2haz4ltik9CwG6XRFj3d3Yz8ynAxJf7d
         ClRFVb+bYlZKfFq9sfu0WUkZbrZGmlaQ6Ym0S3gbqIB3ULnELrySQ+elmXbDXM0ZWTYu
         EpK7cdhXATbL2cfCrZf+xLwSuYRK90/znLcRK9E+s4uzZdLT3seHCNbNKpVneOIVZaSz
         JqHdeOfwqtCk7nskVnHmIeq9cVC6eGoFk9e8q64TWvrGXg+rHXXii/qQq8diUYQ4Fx2z
         DGiOBweJI17K+rBwSLJ5KbLxaXeylHYqQnkyAF0ZRQ2BNErORjYwgrcZ1PvBHDI+VS7q
         m1nw==
X-Forwarded-Encrypted: i=1; AJvYcCVGxisQ+Mx/dbfIHcP/SGN8odbi2cbcJ6tCeIgr/KdYpkxi6L3lH12xqzkqPeEohKnNJgAE2M7/bHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9O8b+m4POQSBDfa1QFUwXSpIsIlF8yTEyU/XDQDiJovPYpTC
	MS2RkiPUU2RFyXK905Q5eyPJLkxsHIACcLnwdkOydbmr3gd8PM5yBLh2K3MSEx1J0p8=
X-Gm-Gg: ASbGnctpqMpKjPBj9p6ImHQYPkXoTxww9tp1Vl6G/rdEJCCsNI0GtDBCmBkFiTj+Jv8
	MDSmzoyomqXf1MhEN1o77Lrgs6Nz9uM9iokQFzxF1w0QjZSyyKQ2N30WvC2sxXdw6wkWePL4a+6
	N/JqKu8aTMLKFrJKxbwki7z1yryemxkerLomGyk4YAOLraelJYG7naBSN1/Vq8/OVbhMk3H4jvq
	mLIRFN/2kDXeqV2FLV7xaIF6I11UKneQYNNF45gGJoGZx2aVCiRUAb4Gy95ZQYr+qi1zPN38Og+
	SEEnn+Rjhl13mrEwlZvf22VIFVb8nvNjARXH+ndzH/LzAWdYO9hDIz5QeyTzX2KLChv+Zh02Uel
	+p6N/OJ36+nLfBXU74y2a5Q8/Rkns9erd3XvuJJcwcGwTGMPpaC03P5AwY4CLVfAdJ8ai56VXYC
	hOkt1QviUJqS4BQJrOazk=
X-Google-Smtp-Source: AGHT+IGuJHqRDLXzE6pBV+O5clnghz1M3R3qGXhTy8JipjIwofYQPlM3zKjZV4m7mJ7/Nt62yMVZiw==
X-Received: by 2002:a05:600c:8b34:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47939e49385mr21133625e9.33.1765020473081;
        Sat, 06 Dec 2025 03:27:53 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f80sm14204709f8f.41.2025.12.06.03.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:27:52 -0800 (PST)
Message-ID: <99b0dbae-0014-4d09-8724-092c03393dac@tuxon.dev>
Date: Sat, 6 Dec 2025 13:27:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: Add Microchip LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
 nicolas.ferre@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 richardcochran@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251203122313.1287950-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Robert,

On 12/3/25 14:21, Robert Marko wrote:
> Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
> speed, so document it.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/usb/microchip,lan9691-dwc3.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> new file mode 100644
> index 000000000000..7ffcbbd1e0f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/microchip,lan9691-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip LAN969x SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Robert Marko <robert.marko@sartura.hr>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - microchip,lan9691-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - microchip,lan9691-dwc3
> +      - const: snps,dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Gated USB DRD clock
> +      - description: Controller reference clock
> +
> +  clock-names:
> +    items:
> +      - const: bus_early
> +      - const: ref
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - $ref: snps,dwc3.yaml#
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/microchip,lan969x.h>
> +
> +    usb@300000 {
> +      compatible = "microchip,lan9691-dwc3", "snps,dwc3";

AFICT, the examples should be indented by 4 spaces.

> +      reg = <0x300000 0x80000>;
> +      interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&clks GCK_GATE_USB_DRD>,
> +               <&clks GCK_ID_USB_REFCLK>;
> +      clock-names = "bus_early", "ref";
> +    };

