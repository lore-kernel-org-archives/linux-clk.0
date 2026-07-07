Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447283F8232
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442078; cv=none; b=sg24e6Ts9qqsZIzZTgX2VIMs/Lc9W4H5dzQo6/npYtKSG/QYyppkk8XwL4yNBpa+FsrAl0zCMEyOvwVdiKyreLLblUXOHvXtAjNG+ICQuE65Y/ruFGhR9wovNKJv3kI7KY7zZ3XEFHrmdJaNupMyUPxFG8SwbcgR1WRRAJGMR+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442078; c=relaxed/simple;
	bh=HZOQZ5+gEBXB9FFiQskUNf/8oWIAtCajF2Z9MT8W9Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XDeZVh2rI/9hdfxk+gl/e4g0re3A/9n3nL+voMriAu6A6XxM1W6/4N+9uTwTz1zaWHpxyPzu3/R5z7uZ/SGSaJPdn5w39/cnoND0VFnFf8zR2Aym3uS0KTmaYNn4Sy86IxP3vwlMHceOWGEPIJhS+w2xSqrpvpkmPFslStoqdms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=odla9vgw; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="odla9vgw"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so8385446a12.3
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 09:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1783442074; x=1784046874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4yMg62YAe6Tk0Zq+iKrI/zpLYixVD/ZixnriSqWY5c=;
        b=odla9vgw6qcBhvarpe3TXwKagXjWpw28LyNO93mud5SjOGeb6fiTBkHlwtiqa/4q+v
         K7+Z/UxsznOao9Qq/UAxeurn0DseNG/Aj5mei911j1NIDaNBKqrB8DsKWTDjRqMloC1V
         wtkOtuUxmvVq59gbvH0+mTpHhrz+9pH9iRe6RFKEsg/XuRi/gW3mlr2fqrb9YUzbU4un
         PPS27aXNx424aDJoIbR6Rpz3cD/1iueeZG20MbUkKjQpGa84K5nZU27Oae/PuEejh9a7
         DtF0Uj5MH2xkx1MN+DBuYYk3DgIrE1wVNC422nOwueGC5eNsEf8p1Xpllr6x3AbN/snD
         0d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442074; x=1784046874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4yMg62YAe6Tk0Zq+iKrI/zpLYixVD/ZixnriSqWY5c=;
        b=gnjkZmGXqkk3aZTk5MuN/ZhWJIgBUhO2zlgb7IJ+Ukm4XaXYtG4ERBWKpFrZcajcN9
         v/+rxh2N+rBa8EEjR9cWJ9LKiJAOJmbtwxFJ+XDz/91hTgmXzZNwKc1u2932f3svNBkB
         UImyYNz8albrAXYDVq2/RRfoGDsnOkxQ9OtCJzXR4zq6oeMvRQ8DT5jarpwgTcZpa3V2
         gb8UV8Jd1RkDCFZ3zt63gfv4XqWAjP6hzKyKUGHB6CJkfcH/ZUma2OzNER+2lJlXlzhG
         yxAXPr4D2wGTXvZZUqZhJ476Ka5oWZvp0C/h2ALHSp8KYbfL71nMxeZYe6EynKJ2/Hrk
         K55g==
X-Forwarded-Encrypted: i=1; AHgh+RqeX3wK+CgO7L9H6L6E7HJmQ8GLpFLbugbkilr3P6ElEhUb5p0YeViPS9Pd183zkKQ6aFWZiY6SZLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtiOAJmzIKxCfP4iYus2v8DBZ0GBIpnAAbdMnzmiPhAVN/LwC
	ehjETy/0c9FeNvrInL6ExI1XrWoERqelckGvuHWw8CsSI52z63VpRROQKGAcMr9oLw==
X-Gm-Gg: AfdE7cnN/fUCfjKyHfYbKQphP6I7N+1kwGA8t1lkE4dm+tF0tEMONBO5JqpPThtJSP/
	icaVFaHiQz9OXD6uQPCr63LleJGsv60c1UC2CDU06JaEnAMuHnDHBWoE/IvnBQlUhDnvcsHy9Ir
	Bx2Uixp7VOy572o2D+RER3+pH1QgPrsAcsiy2mNhSQ00Bn1tCWsNmR16dXt171OSg+rBi6xk3eG
	jxRAPeYqWwONOft/VMfhcFWy8EE6aCOHPfORnXS7AGqNwoH2kL2FmT/qT7HKkkKmg/TUFlt+Z3o
	z8BjW8J1PcEA6V2x/b6b/au/uZvib2KCDjyRVt6zk9yXEACkSay6+dIhAvqWyo5fbkuMDy9I4zN
	n7rLCvd/OJdOobkX27xKtzZCEuHxSbZFMUV/tx3pXljtF2rZJRAjPC2BjyGqYN/P4Dma+F4opYB
	wGh2t6tCK6gOEQJw8dsXAdqxXrpAk6G3GXIrUdOvMeoagGqA==
X-Received: by 2002:aa7:d58b:0:b0:697:d4ee:ab97 with SMTP id 4fb4d7f45d1cf-69a8566812cmr2367431a12.12.1783442074173;
        Tue, 07 Jul 2026 09:34:34 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d78a08sm6832401a12.18.2026.07.07.09.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 09:34:32 -0700 (PDT)
Message-ID: <da06120d-0850-4e79-9e07-efe481c057ff@monstr.eu>
Date: Tue, 7 Jul 2026 18:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
References: <cover.1780499520.git.michal.simek@amd.com>
 <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
 <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/7/26 17:55, Rob Herring wrote:
> On Wed, Jun 3, 2026 at 10:12 AM Michal Simek <michal.simek@amd.com> wrote:
>>
>> The ZynqMP clock controller binding shares only #clock-cells with the
>> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
>> Also remove "(Optional clock)" from clock description because it is visible
>> from schema itself.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>> Changes in v3:
>> - Cover change in zynqmp-firmware.yaml
>> - Move clock-cells to be the last in the example
>> - Remove comment around (Optional clock) which is obvious from schema
>>    itself
>>
>> Changes in v2:
>> - New patch in series
>> - Split zynqmp-clk from versal-clk
>>
>>   .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
>>   .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
>>   .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
>>   3 files changed, 76 insertions(+), 49 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
> 
> This is now causing warnings in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware):
> clock-controller:clock-names:0: 'pss_ref_clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware):
> clock-controller:clock-names:1: 'video_clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:
> ['ref', 'pl_alt_ref'] is too short
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clocks:
> [[4294967295], [4294967295]] is too short
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,versal-clk.example.dtb:
> zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:compatible:0:
> 'xlnx,zynqmp-clk' was expected
>          from schema $id:
> http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml

I will look at it. Thanks for reporting it.
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

