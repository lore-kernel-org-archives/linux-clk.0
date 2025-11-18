Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1C71F0E32
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 02:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763431403; cv=none; b=NG96LDNqIihI08uY8g514ujsxQV21wvVt2g3+yg7Y3xUbdK/aPWWGr4oG2jDVz2eMto9j3cUnB1onvHHEOolZdD50YOJ5gfNIQG0T42b3WubKAl+kAUG5X0UyNqZn2NKGfB/Dz4TZF3Tci1ARX+g8STKNGmWqDR95CvL4JAumS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763431403; c=relaxed/simple;
	bh=J3X5fpB0c0gkKARax5gEJVufrLC1KValpdEY0HMaLZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXP2iMuyT8v9t17RfuJyAzmxR/9iPI7uUUqBFJQU8y2s5CKIXzEBUjai40lvlenVtrgktMZF73XukST6mGjEAc2DgCm20iSSS7lh6zc++doXSOFW4Uu4N6BMVW6rlCJF1fY2XuMCMfx8D5dlp9aCuwxBoeuTx/MGKIR7vhW4Pp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhbEKtwZ; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhbEKtwZ"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3d47192e99bso3867524fac.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 18:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763431401; x=1764036201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/qVmRi0NteE/YXczfuFxl13D9hmQFXTc5aT5+o7KMeA=;
        b=NhbEKtwZgBnHq89dejTzif5MBIPfeNEUKSEr2tthizk4AhoONn81FJgjnn7K7eRnsR
         DLmEzKyydKWBgoHTruxbnHJwRMFzP0iveYQ4NsgnZ5WDbl9uTFW2o9PwtCMoT5FjftCe
         RATspo3wV+BW0e0p//KgNKTLvvwF6TFQpRK4+qNbkaWvP6dxYFk/1jweacPDQQ6x8SnM
         ifD18/JJxUeRLFsBemDxbYIqUZrW/JoYcPfjGPKzhjJ24qGPFX3TwuNnm8JaRXNijvoz
         M37TadWbnfm5ijHqsUYltIvHJyVV9I8du+v2aF1wwmGWbRXwPwTKJL1QlL9Q9O++m4PY
         eD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763431401; x=1764036201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qVmRi0NteE/YXczfuFxl13D9hmQFXTc5aT5+o7KMeA=;
        b=GWkIErhgJ5cjV3A+bcAPWbJdv/88vK1pcLf3vDk/GaLFu6hsghrXoV/r2RBYiSOjAH
         CJ3J5u9ayPK1qyWzx1hGshc+/2fsdCdwIHbBn7U1AWqATOYegHv5UnH6+mutdrH620Zv
         IOWPE5oWhpwFlJiJMH2HV2fnu4SATwBFGF3T9tCc5xhSFqrsq+Bl2gTPSTiLk4y2o1OD
         ykp4aT/+gvFyAGz0gcSUOQ3GQXvMFYD/pq+OMMSGX1Cd41RxGUZVCU4wTmcbb9yuEMnm
         uMSS/2wR3b5zPdmTINqTJ7D1gzXn9WCIxkjHjD+90UoU0Oj/CEGwbmsO0d779r1841pE
         mzYA==
X-Forwarded-Encrypted: i=1; AJvYcCUvTZ3bJgXmvos57upg9gEEgw57te9x3p/FgVGbo6MhkZDBgmg1hVOCg+yoZUexJnjqtpHYmsRnAkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIZf9/30J15nk9WZHPND1IZqNy0UGZEpKl+mjO1q6JGcNv4vyH
	d4z4on+niSI4pYcw1r5zB1kOkO0PTYPHm9mkDInDWavCZ4VIfSkEudNzBEpvn03IN4kBI+TWG18
	Dx5SEO+69qydrAmwnTlGwv1d7KoQlxiw=
X-Gm-Gg: ASbGnctFiQSdDhA7Wk6sq1wh56l1HgyhS3XTzU5fT9Han3KFI9wPwKvWZT3fJSlJldk
	ooebZFWEZcBpju6N+QwpPOVo975bx2rJMAftzQGorT5RiDBj8luEwEskEQ2sj0vwIECx0QGufcV
	4tqjWwhf+1uYP/soh+GxqPsUGyCBLK6tU7OMw4Nz/LfhY9oIYLL8cTwt2K2jjMr3FSOF2y1xcoq
	S7Ll9KolJLS4lJ5Cjexfk6FPDhCzXXhf09f1umQureJ819wL2NgbeEBpln5BZF3/wwP7tG2xjiT
	VzESaIsojxkwoqhBXyB/RQd3MjlRF9O0ue0=
X-Google-Smtp-Source: AGHT+IFf4HoPVdF1D2Dq0kUgFXbCkFY5Shj56oQqRiOuswD+DalQx+DLGD9MLFw70f0thGXQi9YEq1Y8fqcSQ5gPOlo=
X-Received: by 2002:a05:6870:8317:b0:3e8:9ed2:8846 with SMTP id
 586e51a60fabf-3ec60e5398amr949345fac.14.1763431400919; Mon, 17 Nov 2025
 18:03:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029155615.1167903-1-robh@kernel.org>
In-Reply-To: <20251029155615.1167903-1-robh@kernel.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 18 Nov 2025 10:02:44 +0800
X-Gm-Features: AWmQ_blABZPIY3PCnvqPqY59qi0zCRk4_NQxtuoStOd3Gc1Ffnuj7DRe7wBhM80
Message-ID: <CAAfSe-u2F4x6fCvimKvgiT7gaquhqPkbHCCOQEfKk_adS0r93g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sprd,sc9860-clk: Allow "reg" for
 gate clocks
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Wed, 29 Oct 2025 at 23:56, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> The gate bindings have an artificial split between a "syscon" and clock
> provider node. Allow "reg" properties so this split can be removed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  .../bindings/clock/sprd,sc9860-clk.yaml       | 26 -------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/sprd,sc9860-clk.yaml b/Documentation/devicetree/bindings/clock/sprd,sc9860-clk.yaml
> index 502cd723511f..b131390207d6 100644
> --- a/Documentation/devicetree/bindings/clock/sprd,sc9860-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/sprd,sc9860-clk.yaml
> @@ -114,25 +114,6 @@ allOf:
>          - reg
>        properties:
>          sprd,syscon: false
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - sprd,sc9860-agcp-gate
> -              - sprd,sc9860-aon-gate
> -              - sprd,sc9860-apahb-gate
> -              - sprd,sc9860-apapb-gate
> -              - sprd,sc9860-cam-gate
> -              - sprd,sc9860-disp-gate
> -              - sprd,sc9860-pll
> -              - sprd,sc9860-pmu-gate
> -              - sprd,sc9860-vsp-gate
> -    then:
> -      required:
> -        - sprd,syscon
> -      properties:
> -        reg: false
>
>  additionalProperties: false
>
> @@ -142,13 +123,6 @@ examples:
>        #address-cells = <2>;
>        #size-cells = <2>;
>
> -      pmu-gate {
> -        compatible = "sprd,sc9860-pmu-gate";
> -        clocks = <&ext_26m>;
> -        #clock-cells = <1>;
> -        sprd,syscon = <&pmu_regs>;
> -      };
> -
>        clock-controller@20000000 {
>          compatible = "sprd,sc9860-ap-clk";
>          reg = <0 0x20000000 0 0x400>;
> --
> 2.51.0
>
