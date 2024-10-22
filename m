Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5C815B102
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590333; cv=none; b=ClGnV/FaAEHP8GPA3kugPaXkRjf4v5w+uEQNIYu2lJgH1rX20pfV5eeh8opKMLN5XgfIld/3ZbOGotOcue5F6yGmZv5AMZ6h9VPfIKrbtC7kTGEGsL6npqihJSlUZmyCDTGinDpgSzYoD06Bec8Z2DScAu0avVMdVv8ZDq7T468=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590333; c=relaxed/simple;
	bh=lbXI1jCtm9ljfPSXLzcJnVQpSVm7fe5/0IjfEisFm2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bajhz0hAqr5t/4bX23g1lLS0QhigRZPCdcQrWLpbHvj/ITOPNyaXhkuSVV8BXYHjSy5SRstdYEeYHi2JVRA+Li/Klk4DJaSgtlp4T93hD0ROOI0dO42BX6xVqwJpB/jbXjiRfPtPOJOn6IK7tBey75pKcnqtW+OKmBMONzDFobA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h02fj1w/; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h02fj1w/"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e3d7e6f832so52021417b3.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729590331; x=1730195131; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dZc+34cvc9vFr7Z9W3DpXR+Gsr/Cr89K7jAV4/c1TRw=;
        b=h02fj1w/Ont/EmCSQNSIrC1bKJgHyJ3BUyJJzlEL14IAYSGdsKQcSzfIe3+QbyiyWp
         50OW+rru2wIZm01JafLomO8iEiKuj8NnV4R5wDnTLyCCq3bhP4t75tXSxH3ZrCvoFNci
         QS4ALEH5zQgxb4dPugs4fk1wVO85udiMIGcpS41ZwvzBiRPXd4ObSnFSTdzMmJAUTG7/
         Y21H5YOUQJSEfLVzJ71adb0L0v1BG1XLfJ65c5CJL/ObE/qNsvB90e1lGdOQxZ4DQM7g
         W99fQfXEowRDqn3BTEZjJkeFgg6SONwicF5MBmCT3O5D/PmrVG3M0QXLIw0TXvfMEMV5
         sOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590331; x=1730195131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZc+34cvc9vFr7Z9W3DpXR+Gsr/Cr89K7jAV4/c1TRw=;
        b=HLKew32bWwKR2TiIvlBV/0tMjfkTxWhn5vEdCSLSRXSytiLcfBUSrYinAqo5UNzF7T
         Y3PeQ9+kGkuet7pdk8VAwQ9mdz+PAz5adla2Sjx6Fn69Kbk4yc6Zjd9zSInrCqg7NZq+
         0Qn78oI89giqGkL/3S0qwkrM3rkQw35+05YaG4vGSyiVqnRDRVXg2yjurE3MomESZr6h
         62xC+59rtyHLsjeoRhMrHf2A3Nf7+K8kixAmwqq2nl6Ixe4WyHLRy8HMBTDmS7AXcFX/
         E1anMAiwggaZRbh51soJ9NIYJBLDZvejHHck0IAZ2vJgj3LWAbgrsa7e9XnOPP3jXnD3
         0q0w==
X-Forwarded-Encrypted: i=1; AJvYcCWim/NmLsPDLeGLJhLlNfVS5DSmZQl9Wb8G7ZSkcR9DUYE7MeZF6O60j/lcg2HRs11Oc7H9yAD6dTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgaD2fxrVFb9ybeF78us3r8c8FbcPAPvq/S1mGgnIXwQU9IXK
	w4iqOZQqKW1GmzOJoPtPWlTdwsub6eb3r8w/8AR2Rz41NcU4OOmQCLSImDxfX/CThuuYZkawfHn
	mLt1FZcDf1b+aeG+Dx0/Rp9LTCpUHAqoMZH3G8g==
X-Google-Smtp-Source: AGHT+IGWQiFgBsl//ajgAzQUoBeK0hdDGVoPtY3CJpuuXzWJqeNjBFW+UxdNyEF7b5BmPqX0ATsbSM1ccaoWosfiCho=
X-Received: by 2002:a05:690c:488a:b0:6e3:28ec:1a7f with SMTP id
 00721157ae682-6e5bf9e81aemr144807217b3.23.1729590330741; Tue, 22 Oct 2024
 02:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-2-859095e0776c@quicinc.com>
 <puhpztfn6ga5rxv4mwu7wyvk63hqme2nzffcvzwv7t4oo5hlvc@4ugxncmu3wwk>
 <o5v3fch5oxol4t7j4xlqswk6m6uo4tleck2cnfk6whpfqsrvjc@s2yrjumgvw6j> <34216857-170c-45d4-8f6d-987573269215@kernel.org>
In-Reply-To: <34216857-170c-45d4-8f6d-987573269215@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Oct 2024 12:45:19 +0300
Message-ID: <CAA8EJprAMjHtBTdymmX8ARC0ts8=hn7Eme_CREg8=7_gmpzgPQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: qcom: Add support for GPU Clock Controller on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Imran Shaik <quic_imrashai@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 18:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 21/10/2024 12:56, Dmitry Baryshkov wrote:
> >>>     { }
> >>>  };
> >>> @@ -596,6 +635,14 @@ static int gpu_cc_sa8775p_probe(struct platform_device *pdev)
> >>>     if (IS_ERR(regmap))
> >>>             return PTR_ERR(regmap);
> >>>
> >>> +   if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-gpucc")) {
> >>
> >> Why we cannot use match data? Seeing compatibles in the code is
> >> unexpected and does not scale.
> >
> > Because using match data doesn't scale in such cases. We have been using
>
> I don't understand how it could not scale. That's the entire point of
> match data - scaling.
>
> > compatibles to patch clock trees for the platforms for quite a while.
> > You can see that each of the "tunings" is slightly different. From my
>
>
> You have one driver, where are these tunings which are supposed to be
> different? You need here only enum or define, in the simplest choice.

I think adding enum / define just for the sake of the match data is an
overkill. The driver checks for the compatible, tunes clock tree,
registers it and then it's done. There is no scalability issue - IOW
there are not so many compatible strings being handled by the driver,
the is_compatible check is limited to a single point, etc.

>
> > point of view, this approach provides a nice balance between having a
> > completely duplicate driver and having a driver which self-patches the
> > tree.
>
> How duplicate driver got into this? I don't think we talk about the
> same. I meant ID table match data.
> >
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry
