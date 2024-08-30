Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9859915C147
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 08:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005415; cv=none; b=cXi+RNXezX14ARsOBb0OVkLxMpTq/UiF+Lo3bdXu+EVQeqoCA6XzTPamDSoqjmBh8t0CLhpkxUaXPaqNwmeRV10fpQgLP5UwMJOE/jE8/wMLYctS5Oo8ZLuiXe7nO1Elmx8RBXxtcHYDtI+Ashs1PHPwXopl5MdU+i5Z6tYBWg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005415; c=relaxed/simple;
	bh=O586LEmPjPX2HiPnhS5pv8/gtaBBHNlXFpbm4jWmWSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ruo/PdSDe6HIqxIzmhglt/ZhNaGnn18TKIiwpqw+QTWN3Ko/k3T/q6B+uOddIHdrIPsIw2BfzWk+6rOcNj+gF/2H2VGDfTX0lI1AwPjWdy2fgUiyzphUWnikEqqwMqKu8cyTLrhwrYm2cUO05FLFcQaR8uR30g5bvFMJw6jVtyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iJH07Lwc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iJH07Lwc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so6849005e9.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725005412; x=1725610212; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Css1DS/twF3J6CTksvvGFwq/UDTMQRJ6E1Ahqfi3MtM=;
        b=iJH07LwcLVXLpvxAzNhck3hkQubEQvzOSRSn3IpArrDpEPVuTKQLOzAgQBx+9LJQeB
         8+udVi9TEGAYChM+J3eGXf/S3R4/sDvC5n/T+yhh8SRjTO23oQ+CusOK5Qvk2ACaaAwh
         EgKc81Aml0bjvh5aTDysbVl9imtNZqEpXiEZby6zudn8l7DvpYrGd4KiuMv2Ak7fI87a
         mqM21+UMH68l+O+EeSLmB5f4X7sRYm3sOCCxaJCcuHqvTLDp5CFob2TMXcOgQMZeI/0L
         8baltIaJWB945VyIREc5j+Im4KCM+eyIsFkWTRnjjpIoEu1CKsD+quOIWKXFHq4IHryM
         HnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005412; x=1725610212;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Css1DS/twF3J6CTksvvGFwq/UDTMQRJ6E1Ahqfi3MtM=;
        b=QmTBfCinN9cXJ/QId//u5wDboD52MsKDQSOJfdwnleL7eGZJRdF+oszSm1kUqwSDe2
         eyvXSxThXfTYAoZyVAEWPmPLMww+yj1Lfo2yaQ1vA8CDWLbm7yevw+bPernAuywlSpO0
         if/LwOeA1aM4+l+vxa+3ckx+H+xcx6t0ZdN4krmZIoB0XLkeYQEUmThTkOfoPvTghFBa
         xlWGoGh+OlfUlkRQqxbQUS52NLnv1Qd09FGUoMMJcSptIdTMCTh5HwC6OcTK6xFfzVH8
         5ZSL4O1aQFFSB8crun+q27l+LfmX5VKRJT/LkBOfr/mJpaDeT+XTIPt12+Yo1hCkGIp1
         jvkw==
X-Forwarded-Encrypted: i=1; AJvYcCX+ijHeEjSrS7PGGKMfVgdwOKN0HHZdR6gq4TnNFnlMZttuiQU/qbzN2y4aIdKUmsUW9WJNg6w8ALQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRSf6ELuGdNLsETWyrgCV/XdtUdhlhqcX6pzeXzbUKrpCYHlgc
	WqSAOBqeries3Cg3897yy+pqoV+aUfEUVmIg0nc/hESu59vuceVLl+r5Hs2Qqx4=
X-Google-Smtp-Source: AGHT+IH8H5uUNTbFEsKnYUdKRjBzDDZGcrGLT+W24BeFBC1OCMxsf8Ey3WOHr8h+hmPJhmnT5iK/wg==
X-Received: by 2002:a05:600c:3b8e:b0:42b:a9d7:93 with SMTP id 5b1f17b1804b1-42bb032c82cmr45411815e9.28.1725005411476;
        Fri, 30 Aug 2024 01:10:11 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90cb:5cec:cfdf:966f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbd46b60bsm4808145e9.1.2024.08.30.01.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:10:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: xianwei.zhao@amlogic.com,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Chuan Liu <chuan.liu@amlogic.com>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: clock: fix C3 PLL input parameter
In-Reply-To: <0e74dbc8-88ed-43db-95ef-0fe55d92091d@linaro.org> (Neil
	Armstrong's message of "Fri, 30 Aug 2024 10:00:38 +0200")
References: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
	<20240830-c3_add_node-v4-1-b56c0511e9dc@amlogic.com>
	<0e74dbc8-88ed-43db-95ef-0fe55d92091d@linaro.org>
Date: Fri, 30 Aug 2024 10:10:10 +0200
Message-ID: <1jplpqsa71.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 30 Aug 2024 at 10:00, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> Hi Jerome,
>
> On 30/08/2024 07:26, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> Add C3 PLL controller input clock parameters "fix".
>> The clock named "fix" was initially implemented in PLL clock controller
>> driver. However, some registers required secure zone access, so we moved
>> it to the secure zone (BL31) and accessed it through SCMI. Since the PLL
>> clock driver needs to use this clock, the "fix" clock is used as an input
>> source. We updated the driver but forgot to modify the binding accordingly,
>> so we are adding it here.
>> It is an ABI break but on a new and immature platform. Noboby could
>> really
>> use that platform at this stage, so nothing is going to break on anyone
>> really.
>> Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock
>> controller")
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml | 7 +++++--
>
> So you mind if I take this one via my arm64-dt tree ?

There is no conflicting change in my tree so it's fine, yes.

>
> Neil
>
> <snip>

-- 
Jerome
