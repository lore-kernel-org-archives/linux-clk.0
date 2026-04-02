Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D83DFC9E
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132702; cv=none; b=oClr49P6CPgqdpm11gUUwp8vjmjzJe5zsecSCqEm0CSRVEq+E29xDA2fODurakMWdw6BS2nyz2FGXCem9LUirJAH7qRV0Bsl/TvMn5CuvPhOnnQ2/xWG48N9tl0Kj+GLTBbKdTsOIu4fXIzdDhNz/cKF9JCWk0TfPjOwHN2HBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132702; c=relaxed/simple;
	bh=VFq9AWUrc9CcWHC7ojF6xOAibaAgS5IkinF3nAaUdvg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=PhaxsZRTNPoXDcMiSmBEeN3png8nSEMo/QcM6RMex38LAqFpZ+NB103IId9JgirwWEOROjmMS/iTUKnfA49kMMlx5dNdqCyGOIiDQ4WVSdOyMO1Yd7Ksor8BSOAajmd5oX8SHGuiKYf5aMo6Lu3Ezott9eFiSCPaQknfVINkvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fI58aKgq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fI58aKgq"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66e129e457dso541984a12.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Apr 2026 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775132699; x=1775737499; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV57QUhm1LJKEL7ZZkpUHcm6gesGlh2s479uzYXuMeM=;
        b=fI58aKgq/aSY+7Z0jlFsYNSi0x5D4tu+9WTXceYNuambD3bAFsdlKg+qirj7dcEuts
         2v6YPKNa8OvP4Q7GCGxf1TuI4QzsFq80O3AaW6VRUSXcLv+fbSOX1mrYLq1I1n2OffSm
         LRO/YU1TqqOJH/j7lTGWNq3X1VFAE7eJdX+gYbcZT7u1iKu+PeWoeWkywwQor1wOf2Pa
         Cr9P09ugasZw5iSDqQbL3uNM9akYymOkgikzPomeRz7eP19/hAg/jeGdQLSXplIWEq+Z
         vLGF0FQMrG26vj1ZdGrZUHWBi3QhQRgaNZjHYftVLgAVAckyxfvkfX+XqpNcpjpD1rJP
         33Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132699; x=1775737499;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kV57QUhm1LJKEL7ZZkpUHcm6gesGlh2s479uzYXuMeM=;
        b=VCQ/UTvlnXFh9GoKXv+NucANjNofsaVfje176j5IyiGp2jisF0n981QS4zV18/XDlU
         XnfAwF8ad9XB26VBdgBCldcKNhkYTnTvDTaJZEkcNsvkEbIUkMeBY0Fkm29cQMpdUgSV
         wPdKRvqZ7TS9tolbOsqpT5chshdHPLWvp7JhYODs/ODtXcQCyZEDsIzUjG/HyL/b+Q4A
         KN6sUEMsNwsl0hF1df78OAHcxQeZDKh3Vy37n0PQgV+YelF1Z+BSTm1FiqLNIgnvRdma
         FrII29F5RwPVpZG6l3cTdjf46zH0uvccuCuPEi9VgUNxUM87OoTI896nlpQfcydNzx0V
         ZeEA==
X-Forwarded-Encrypted: i=1; AJvYcCUyoKjPO5iKIWNpZ/r4tcz9L8rnJQwHYC7z2BBrgSPKdG5Yqcym07b/7L3ES+2hiBWL9Je7AnmS3GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdmpY3iybT4VsZIqq2bW/sn3O9MZoesZScytPIvPUy7e17pMpk
	1I/7QsLGBZNIez1e3VNj/Z56qTfpl9S/LvAC/ok3mEb0kSM+OnAY6k0dKxiawvY5STw=
X-Gm-Gg: ATEYQzylaRWJnI0TyvD269J5RkFhm98HIf+uDX54B+Kf5J1fFtVLr20Y2uayX7IqAWp
	1dYAOAwFQbCFIbvX3RUNUkfEntbWPVwH1U76UCRPi5+8BK/dPYyHC8dB2d2XdX4Qm4bhR7R2Je5
	3C9O1rN0IyWyVlQCQg5nMou79txLpvjSDeOXKkK3IKAEFeloUls5VNuhqtI94C1VR1vIJLwtyrL
	MLv0Kl/v0Q9gNUnFznirUc18MA9f0E8ce2QkkHAlEClwbuRkfPC4yRgIZKxiYGJ0McMI5x+4sJd
	9weSXXPae1MGao+IM1LIolPiMTqxdcvZycpj41/jKhdtJHZPedu4YLGjLUb7wWeu8gok6lpQUcU
	+rWuMH518PbLnSMPq2xc0KMjQYXEG2gpdNosZDY/9WL0BwyF6YU/JC7ijR+PCKESi5CT5cYkjt0
	BdekZDVZvS3xXgIdZTsC5M5I4G5WZPf+IUipGe76lH6hqULDp7AEtXJaPm86RpWNw/S8vviLBW8
	gDLL9sgC21dmi/CjdPLz7Wc5NNrZHEgBr7i8ZxIv8FiK4s=
X-Received: by 2002:a17:907:3895:b0:b97:c968:d9ba with SMTP id a640c23a62f3a-b9c1378f46emr488650466b.5.1775132699170;
        Thu, 02 Apr 2026 05:24:59 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec6esm82792766b.16.2026.04.02.05.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 05:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:24:57 +0200
Message-Id: <DHIO0VFBOHNX.381P06A2CRHAZ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-1-00b09ee159a7@fairphone.com>
 <20260307-inventive-stingray-of-pride-5c2216@quoll>
 <768180d0-bab6-466f-9f5f-54b36f353bd6@kernel.org>
In-Reply-To: <768180d0-bab6-466f-9f5f-54b36f353bd6@kernel.org>

On Thu Apr 2, 2026 at 10:23 AM CEST, Krzysztof Kozlowski wrote:
> On 07/03/2026 16:30, Krzysztof Kozlowski wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,milos-gxclkctl
>>> +
>>> +  power-domains:
>>> +    description:
>>> +      Power domains required for the clock controller to operate
>>> +    items:
>>> +      - description: GFX power domain
>>> +      - description: GPUCC(CX) power domain
>>> +
>>> +  '#power-domain-cells':
>>> +    const: 1
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>=20
>> reg should be the second property, like you have it in "required" part.
>> I guess you copied it from kaanapali-gxclkctl.yaml, so lesson - qcom
>> bindings have acceptable quality, but not good enough to take as correct
>> starting point.
>>=20
>
> OTOH, why this entire binding cannot be squashed in Kaanapali one?
> What's the difference?

There's no GMXC power domain on Milos. Apart from that they're
compatible from a bindings perspective.

However it can re-use include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
because the GX_CLKCTL_GX_GDSC definition would be identical.

And also the driver (which can be used as-is) would be identical. In
that driver qcom,kaanapali-gxclkctl.h is used so it makes sense to keep
with the kaanapali header, or not? Making a qcom,milos-gxclkctl.h with
the same definition is not wanted?

Regards
Luca
