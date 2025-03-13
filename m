Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C1B260383
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741852331; cv=none; b=no0IOvC8u/9sIEpaw0/MZM0L3+vFX4E3OYohI9moVotIrn844KmHdS4d53W18rhfKAuFLXiiVcgouX8FIeIXzdfX8gOb5T3lVUC65I9Q3oqgOy81esh7XKfo5L5MelEYFdKrtaRhuF430LqtkjP1aZH97axnO3xSzbCID4Kg3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741852331; c=relaxed/simple;
	bh=Fsrf7QgC862sGCWItFW6TJdYnI/pP94I9U5QzB4uQZE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KUF9LLKt8Z2QDdqIxBSTijFfnSRAPwl6NAtGOOHrzNX+IN9QA19GfTznacLepFBnoKI3V2VckP8U1K9vBuO/Vu6q58c0U1Sc0Pb1obdlBMMwHWUZ4Dv6hjqGcKweg3P/pwHaxammDxEWczcG4yhI9xL0eTi5qyvDfb56qNPeSaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aTbTcFc8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aTbTcFc8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abec8b750ebso119628466b.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741852328; x=1742457128; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fsrf7QgC862sGCWItFW6TJdYnI/pP94I9U5QzB4uQZE=;
        b=aTbTcFc816ZG97krLmM4SvJkPtrastjW5YjyPQHTKPgnObvH6eRqsK6eEIZYnDrblQ
         q7RPGZ/kUECU56A2I1Ty1pmpPVMMeDf8wOvvkdFBGC8PtWvuhB5zPtFgGjMtOdPtT2Kf
         k//c/gFAmsOFTeDDYPfa84ohq1BbO4CxEN0EWvsfCL4ruOUuTWP7HHtu/b2h4saC29Ez
         MxnVtz9eLjBhGGR11fYmLmtY2gLJM5DLxNDg1VLGkKL+YTSZVKH5pffPkJ+2jtWJgmGT
         w4Ope8JK4WCw1e48OeNss/fPrviWjwsErKw1+nqi1q7CMzBQFk1BWepdqi9ytig+eSSd
         krdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741852328; x=1742457128;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fsrf7QgC862sGCWItFW6TJdYnI/pP94I9U5QzB4uQZE=;
        b=ZH6/3lYIQ5+5gWHeu4TpXlGn+nM68wl3zdyTeC50oa8R8+CG1MeS1zbkcS5KVEvtjH
         d4WQd0+1uLokUqi4iBrlIgyWk6ofEAWtnseSjgie3/XD4/67DLQtmFcfK4vvahgomUn4
         ZSarNhXcNVp5edrOT4jF94MpUy1Na77nZIP9yLvzZ92keTS8M0UN/O/o7WvmxTPk0LP7
         M+3ykEBVCTBGTYE7PfZ4YO9ySb+lml0a19r33JMXL37LLGFDdWyinC1b0LT+NfoQlFde
         9xOb9zQhfQrqD8By3YyFzuf7phSklbolw5PZoy4yT7NYQwVePwX5uCAHxMpuV/w4r3ax
         r7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1DbTGPMJAyXt6gu6YTpYw7rWJyoXakb5/WXhEDmdDWINgx51JagnYqapW0fmF2OWpIPz577hZjw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEFnRrCYKVULPuRoXcGGYkWFAVkDxhgX4fjnWPJc3YLnL5EGu
	rLwRuoVEzGaepyLJ+zzuWtZ4vFGA9N1Qq9aArDrR88mmCmHCTn7zq2+DK42XwvU=
X-Gm-Gg: ASbGnctoUKLQ1oFFH9XHZ9p6K0VgOD6Ri+y+JttFd6f1kBCIIBePCiYKN+odpOcaKJQ
	WUZVVnVRulySIipzTHaCj05yp78zF9VNV8FF0M759Aw4DYjr3TzYp26cBIqWYhcYa18CSV13lPK
	eMeXmXPLKFGMVIhGqCXXO3l6KYOWhhKRc2hZtRZScljgcuMhfXo7WrNhi2hj8MDMaSpusIo9AUt
	AUkPdpo3+57zsgrB63jwceSMKwo39ZNz3r2B+J2R5yDH9oAanRTK/fLKJ0bEqNz3x6oN9GXi4pn
	EzVLxog5h+r3TiaWSN5I8RBGng9rVyErxzbOF6vT+pB1htH7G1PVJ7gBrP5n8Sf//4NqUhK0GiH
	cotMCDVe19MFYFQ==
X-Google-Smtp-Source: AGHT+IHP8wNISZ67+M/6826xmvZWrQscMDK+8//hmYHwzIUECiMDJMX5zRuB3mlpe6FMpvHer7zRWg==
X-Received: by 2002:a17:907:2ce5:b0:ac2:b87f:2859 with SMTP id a640c23a62f3a-ac2b87f2a72mr1415546866b.55.1741852327837;
        Thu, 13 Mar 2025 00:52:07 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ce8efsm49276366b.102.2025.03.13.00.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 08:52:06 +0100
Message-Id: <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
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
To: "Taniya Das" <quic_tdas@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
In-Reply-To: <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>

Hi Taniya,

On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>
>
> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>> <vladimir.zapolskiy@linaro.org> wrote:
>>>
>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>> domains.
>>>>
>>>> Are those really required to access the registers of the cammcc? Or is
>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>> only to sm8550 or to other similar clock controllers?
>>>
>>> Due to the described problem I experience a fatal CPU stall on SM8550-Q=
RD,
>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>> not exclude an option that the problem has to be fixed for other clock
>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>=20
>> Please work with Taniya to identify used power domains.
>>=20
>
> CAMCC requires both MMCX and MXC to be functional.

Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
need multiple power domains, or in general which clock controller uses
which power domain.

That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.

That'd be highly appreciated since I've been hitting weird issues there
that could be explained by some missing power domains.

Regards
Luca

>
>>> for instance x1e80100-camcc has it resolved right at the beginning.
>>>
>>> To my understanding here 'required-opps' shall also be generalized, so
>>> the done copy from x1e80100-camcc was improper, and the latter dt-bindi=
ng
>>> should be fixed.
>>=20
>> Yes
>>=20
>
> required-opps is not mandatory for MXC as we ensure that MxC would never
> hit retention.
>
> https://lore.kernel.org/r/20240625-avoid_mxc_retention-v2-1-af9c2f549a5f@=
quicinc.com
>
>
>>=20
>>=20

