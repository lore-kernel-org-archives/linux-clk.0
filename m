Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B5332D442
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043002; cv=none; b=Q9Urn3vg1QEq3xm1YdrlyvJLBuk2IgoHF3aqAz7/EOlk6LIX+DzXOvAiydlzVrRay4xs+E1ExyMFnQ3yBC2vVhvIfiwaLierz8D8rpF5H+wZDcwF38tiyvChxXhiyXGGQLfbNPxRgvDr+hakHz0DGkUZ28dpvlXVcn2vET9MJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043002; c=relaxed/simple;
	bh=THknO6ravWsd3NQgFAsW90DN5nGw4cI/sjpLiGacHhk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j0bIS7PItxke/5yaDcmXRp9W1U9L44cLtAtdfFBCiryIB7BQubigyEf1xWRDOHlqPMMamDa2qmzzkCVkon5qEZmKd6e7NjrE6HdzJy62MpWUe5h55LDZ04cAX6e1HvFCoHHMWdzD4Qu8+Z7fSgqAf3hei9wrABpt9SL/9im1MBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZMnt0hsI; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZMnt0hsI"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso1034363066b.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761042998; x=1761647798; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2j/5fMN5NhbH7iUBrDo0CGu9Ykp0qn/1cFaDJh/hxw=;
        b=ZMnt0hsIfo2LFHaMQD8bz4zYsF/KwWz/yZ+2swDaaoVpTUpCUStKQy0MwmX8LpIdg8
         OyowzTrdzUQIaXAXQGCMNwMCCIre7TB1cBerKKri4Ft5Bm0k81SeH5lcqdMykXAfBb+1
         R7pFykSgo20PFINkc4/7kjOOKDlfSeCkfS+y94zi9otTUR7v9MbrrE+G1uo2s4XQFoCQ
         1vvyfEZ17pp0v4p415krLuOeC9ZDuNU25lXGZLF5c/Amw5MfuExGwQ4fGjMF5I02cLId
         1kRshaSqBrQUaAHK4lpjlMxJKXf4EfTq2iLtyomn+cTjTgVy/Scq5yKTNfdZsBVeIFi3
         qtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761042998; x=1761647798;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T2j/5fMN5NhbH7iUBrDo0CGu9Ykp0qn/1cFaDJh/hxw=;
        b=pqZzDRaD+Jv94Ox6XibHpppgtMzraWBcJkIwZI7Bfj3wvB6MUV5so6VpVhmoarXNyh
         XDFiunBQHzRg+goxhXCHqshMcOSE0c8JEHh2IJTD03DYJleSStbKhhXQEhmXhHOvpSls
         uedwcO/dF9F9ftppELea6dx6zwO+yiGt/v2dSP177pYBbRq9rCBaMoA5H+ypq3n361na
         VIOHAXntiImxIdHZrFn4I3OmSxNTR7gH41k8p/UWY9rvYsu6WzZbiQxBBi2ezfxaeFZh
         GYQm6RAG3kL/YXJ24uLv/T1K3GWBKL6namwwoe+x4Csn4fIir7HHgo2vHHGsmDEkhKyL
         Nrag==
X-Forwarded-Encrypted: i=1; AJvYcCU3zRC1jgaCH8b2mEzR5sNhhzHTZMgp3BYnwqh4JY3zH0BMLQzsQpoT8/KhDPfRF7nnB59oP0yOKp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3hELOSYpB9NldDgk85T4ZGBvzfnWQa+RYLs6l1DqxHqscLvWA
	i8pi7PLgSJj9iogn3ruwteurGv/ddZFDzUZRHV721iIAWBjon3ZD9znttHh70fkkOZU=
X-Gm-Gg: ASbGnct/JKx+Zb9ZU+RphM//4CbW+OualjtXSWPHoP3vw93IsOZdqAjjFfsS+OXlo9H
	swZfH5cP/jB3YYMpUpWEFcsN/Id1nXnTT3MFNhczSyR8Bt0aGD8J2CGxk2HaPlnmMdzfArJbM3M
	LVP/BmL8MDq7saQh4+PwjLb4gBwtu/LftlGvkbRZHvGesASAIJxNJocO6H5Vg+lSPsBCd6jUIEo
	2oqVfXH9Kwm33HFOQmtXDkiQMtyt0MbsTel/4iLncQ7+Co3h/S2rl+6Qm5tUwQGI6FyJB7kvInQ
	Mcfd0Zn93ffrO0fXsTOOJ/h6hAtxMlcr1EAx+hEEmDQXvY3Q16MwTZ2WwRl0EMmoYlAPQ4dAQII
	0MhuKRIdSIhBdwDWONppf9jACCLk3I84V59xgFbwH1UJvfMbK7iCZAMAXVO9vJZ7U/Ih3zDkTPL
	lsx4EnSMsjUf18M7gJrNu56+YMEX9MnuqNvmXXTHXTK4es8EoOdnVqBTQ99wcPeQdTy7vapJAR2
	AGCBUU23zW2ROYpkqJpu3AfqA==
X-Google-Smtp-Source: AGHT+IGxaq6kMVimTVensoisT9WTDXA2uUyJiFpRAc9IVXDle+iQVHo1jPa1gFTcrYaSLvBaofq6qg==
X-Received: by 2002:a17:907:3daa:b0:b5c:6a00:f8da with SMTP id a640c23a62f3a-b6472d5bbf5mr2001551766b.1.1761042998367;
        Tue, 21 Oct 2025 03:36:38 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-4b34-6694-d9bd-5210.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4b34:6694:d9bd:5210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da3412sm1041899466b.3.2025.10.21.03.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 12:36:37 +0200
Message-Id: <DDNXN4IVYLIL.3083X63IIT9B2@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Jagadeesh
 Kona" <quic_jkona@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Taniya Das" <taniya.das@oss.qualcomm.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
 <85bf3468-24bf-4f14-afcd-28878ad84dc9@oss.qualcomm.com>
In-Reply-To: <85bf3468-24bf-4f14-afcd-28878ad84dc9@oss.qualcomm.com>

On Mon Oct 20, 2025 at 2:21 PM CEST, Konrad Dybcio wrote:
> On 10/17/25 4:05 PM, Luca Weiss wrote:
>> Hi Taniya,
>>=20
>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>
>>>
>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>> Hi Taniya,
>>>>
>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>
>>>>>
>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>
>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote=
:
>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX pow=
er
>>>>>>>>> domains.
>>>>>>>>
>>>>>>>> Are those really required to access the registers of the cammcc? O=
r is
>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicab=
le
>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>
>>>>>>> Due to the described problem I experience a fatal CPU stall on SM85=
50-QRD,
>>>>>>> not on any SM8450 or SM8650 powered board for instance, however it =
does
>>>>>>> not exclude an option that the problem has to be fixed for other cl=
ock
>>>>>>> controllers, but it's Qualcomm to confirm any other touched platfor=
ms,
>>>>>>
>>>>>> Please work with Taniya to identify used power domains.
>>>>>>
>>>>>
>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>
>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>>>> need multiple power domains, or in general which clock controller uses
>>>> which power domain.
>>>>
>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>
>>>> That'd be highly appreciated since I've been hitting weird issues ther=
e
>>>> that could be explained by some missing power domains.
>>>>
>>>
>>> Hi Luca,
>>>
>>> The targets you mentioned does not have any have multiple rail
>>> dependency, but could you share the weird issues with respect to clock
>>> controller I can take a look.
>>=20
>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
>> again, but again hitting some clock issues.
>>=20
>> For reference, I am testing with following change:
>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.z=
apolskiy@linaro.org/
>>=20
>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
>> on this phone - results in following error.
>>=20
>> [    3.140232] ------------[ cut here ]------------
>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:=
87 clk_branch_toggle+0x170/0x190
>>=20
>> Checking the driver against downstream driver, it looks like the RCGs
>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>> downstream, but changing that doesn't really improve the situation, but
>> it does change the error message to this:
>>=20
>> [    2.933254] ------------[ cut here ]------------
>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:13=
6 update_config+0xd4/0xe4
>>=20
>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
>> iface clk, could something like this be missing on sm6350?
>>=20
>> I'd appreciate any help or tips for resolving this.
>
> Is CAMCC_PLL2 online?

I'd assume so given nothing in dmesg is complaining about that?

But not sure how to check. Debugcc can't do PLLs, right?

In any case adding CLK_IS_CRITICAL to the camcc_pll2 doesn't change
anything.

Regards
Luca
