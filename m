Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE589216607;
	Mon, 17 Feb 2025 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793518; cv=none; b=DOieHuUhQnqJftVTFAfAA3jmWw+SR7gb/gYo0nDwOB8dFi1TVpE3a4GBI4E811d1mDbMbDCsqZcDsgj7rPdh5uAAJXNAR9INZ88reUJpisiTfXBwZ1YyewPQhURBe69jQaLur/4cKEmV8bqW9ZmfgFcLXvA4MzPLDb502lvRFHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793518; c=relaxed/simple;
	bh=gt7VgS6o45xuZB5H9cazNXtgtAyYISWcnpGjQDOTNH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kSbIZ9CV/Q8rzhPffOKKyx6g6TIuhrkCV+YkIzn+VYjjFMN2wsOeo/49SYwdqiuXg2AUtT4LoBchLEJLsJKYpR6ZT6HHDE48+15+EfDSpXGt87uexDjEvhppXOjcE8KKU9jt8sMgeYNIyi+ZCZGKesKL/1TQELaSt3HJiUhqxaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=j9PlSA/j; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="j9PlSA/j"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H4i6q6022196;
	Mon, 17 Feb 2025 05:58:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XfmnE56dbkEZ/5nrIC07zGvwJtM7l8jp3KumcBWKXEQ=; b=
	j9PlSA/jOWVhiOBoIdjCSgDwaLhj3bGcTh8g7eIbLJcZrdNyvzuV/8zqeUCV2ddK
	8/paJl9lriZmtWHZ6K1k/6Y9NpXlwfwOdO993tot2jhehClfgJfn24qGVs+32ys/
	M+AY+pzK3U3Zvbo2QqAjjkVdXuwmb8x+5x1i0+Dm4VMOJCzgo0FRuiS01YZJ3ihq
	rmNdCYCPX6HhKq/Ap6XKAq2YYp8oR2giaQNH9AeEgIDYiQlLuXfBrgBJdV6ayFI+
	nncGRpEuMbUew+z4GPpyOKEqFTtbXPfmF4EB56hH4WU6lfFL1mBi+FVNHKa5N/8e
	kzpaL6bJdyUo5dqpBiewjw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44uwg18qgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 05:58:32 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 17 Feb
 2025 11:58:30 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 11:58:30 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CBDA2822561;
	Mon, 17 Feb 2025 11:58:30 +0000 (UTC)
Message-ID: <e5c967af-89f1-4414-8e35-99ebdbf0e3a3@opensource.cirrus.com>
Date: Mon, 17 Feb 2025 11:58:30 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: clock: cs2600: Add support for
 the CS2600
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>
CC: <patches@opensource.cirrus.com>
References: <20241231202018.3956166-1-paulha@opensource.cirrus.com>
 <20241231202018.3956166-2-paulha@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20241231202018.3956166-2-paulha@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XexzBLr9-2LTV1KZpuhIipnWY3wIoBuq
X-Proofpoint-ORIG-GUID: XexzBLr9-2LTV1KZpuhIipnWY3wIoBuq
X-Authority-Analysis: v=2.4 cv=CYzy5Krl c=1 sm=1 tr=0 ts=67b32468 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=gEfo2CItAAAA:8 a=w1d2syhTAAAA:8 a=n6xhqUudf17nAtCk1qoA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe

On 31/12/2024 8:20 pm, Paul Handrigan wrote:
> Add device tree support for the Cirrus Logic CS2600 clock
> device.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
> ---
>   .../bindings/clock/cirrus,cs2600.yaml         | 100 ++++++++++++++++++
>   1 file changed, 100 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> new file mode 100644
> index 000000000000..1ef4d5ddfc51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/cirrus,cs2600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic Fractional-N Clock Synthesizer & Clock Multiplier
> +
> +maintainers:
> +  - Paul Handrigan <paulha@opensource.cirrus.com>

Paul no longer works at Cirrus so shouldn't be listed as a maintainer.

> +  - patches@opensource.cirrus.com>
> +
> +description:
> +  The CS2600 is a system-clocking device that enables frequency synthesis and
> +  clock generation from a stable timing reference clock. The device can
> +  generate low-jitter clocks from a noisy clock reference at frequencies
> +  as low as 50 Hz. The device has two potental clock inputs (xti and clk_in)

The pin isn't called "xti" in the datasheet.
Also typo potental -> potential.

> +  where xti can either be a crystal or a constant refclk and the clk_in. The
> +  device can have either xti, clk_in, or both as a clock input depending on
> +  the usecase. It also has three possible outputs CLK_OUT, BCLK_OUT, and
> +  FSYNC_OUT.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs2600
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      enum:
> +        - xti

This doesn't match the datasheet pin name

> +        - clk_in
> +    minItems: 1
> +    maxItems: 2
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  vdd-supply:
> +    description: Power Supply
> +
> +  clock-output-names:
> +    maxItems: 3
> +    description: Names for CLK_OUT, BCLK_OUT and FSYNC_OUT clocks.
> +
> +  cirrus,aux-output-source:
> +    description:
> +      Specifies the function of the auxiliary output pin with "phase_unlock"
> +      to indicate the input and output clocks are not in phase, "freq_unlock"
> +      to indicate the PLL is unlocked, and "no_clkin" to indicate the clock on
> +      the clk_in pin is not present.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - phase_unock
> +      - freq_unlock
> +      - no_clkin
> +
> +  cirrus,clock-mode:
> +    description:
> +      Sets the device into smart mode whith "smart_mode" and sets the device
> +      into smart mode that only outputs a clock when clk_in starts with
> +      "smart_clkin_only_mode".
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - smart_mode
> +      - smart_clkin_only_mode

This doesn't need to be an enum. It can be two booleans. The two modes
are only flags to indicate whether a feature is enabled.

