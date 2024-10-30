Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568281E285C
	for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287416; cv=none; b=crQZHqQe3K69k9RaE4cgn3Sl7WLs+Kk0RsaPlLmlMb1OXhSHirNAdTmGOXzdco7DqgxZScNjPsXipMr955A5YoOgDkc9IMFcDHZ7fDFsVgKKvyCIUezLYJ94nmec3PgEKQl8IurK7ff8SPbNQel8Cuf31eXBgzWwalwyyWLkNNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287416; c=relaxed/simple;
	bh=zHgIwEWfPk4yyvPCEPt5Azic6gPbJHaNqF2Poifr9rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kr26c8Q7NMZNudWT4cs18zi6tp20qzZ2JA/DDg5w3pvZ26NOxLE+oJgDhzLGS9f/RwI1iFodWMQWliOwb/KRZ0QXWRjiByT+AtqVS9BagKZ1WpXv9dAwy15OHazjCsGUcfQVbU5hyFsTbgktfj1FggW5rXiw2l/Byl72HQlOs64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CeBC6LFB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CeBC6LFB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f8490856so6077303e87.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Oct 2024 04:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730287412; x=1730892212; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wfR1CwiWgHND2Gsj8zReFr51weqymmRbQbInKm0uI9k=;
        b=CeBC6LFBKaJ16PRXHNyrCq1BiV7k2jdIqjNpUvt0+xk2lXbhNBbQeicoQR2sbSdtwo
         MHip/VwLfxhU4kdlDjjZA1LWw0BQGbaIGVy/OC2/o9sjIca/wXj4eb2v+Gc+tujc4nN6
         YoV7csrSVTaVGMp6hfmMm3LluRqMlXQ7eW3KU0eHI69Voha8dTB8tpFhrV1QukUeMsvi
         25dB32IgY4t162i9kKVXzB3qbUKkADQiP9Y9NTssfrr51ApcbCE8m3EecNFtjrHUDH9m
         OCp4+x/KVaqArdraXk+yJDmA9imnjU05p3+zQ0szJXh/0WyPVDoV4aiSNUoLhBYFJx/0
         jCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287412; x=1730892212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfR1CwiWgHND2Gsj8zReFr51weqymmRbQbInKm0uI9k=;
        b=wNCoNfTErvSdl7FPHURyNvqfSrl4Suh1uCdaI1XklHa5C1ap4dfeQlhqOACcbrLpUi
         YQd0Z95NDXEE5hyLR/weZXoeoraFuZWPM9kCsKaiJeerf/2k5vSmI2/WcqXNcgTg6ljZ
         5Tk625uuq27XaKwDte7BLOrtFI6F2Y5fWveSfCA7lJS775Sk/EjwTA6xl9iKx59ncNtM
         eN8gvE3Pu/XL/7yU9c1u0PzRI2IIZV8UAEG3gOqMSZlFj1pxWzU2aCZBSAonxQ0QfeA/
         sgOaenZl9Bh5enUK6wMXMJ73EM79XjepGDAcGwdDSdlW/NQ/1T4uG0gAL5/1QUbZ9WO7
         z74Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnnIDyKbGLgdwP8NVZko+m3h4x5IJNslmwUB3mPXCKqKkpzTpkknWhbzhBwcnIxpR8cVRt+7LK2RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHv4olut6KV7Ikb/qt6wn9pnqeRrACvTLwAWrM8fBpXPeVPS+g
	Y5HZKkKglsJGsR61QrfcSW7rsYuglXrlFESdvsHyopTZIzLSAPQe39xE0m9EJVc=
X-Google-Smtp-Source: AGHT+IHFi2VTNyFiaZV+LcQXM7FIAG/G39oW0UZ1SN9GGWF/bKTG4Q4CtRRvHoAZoaRoZWs4e3EpGA==
X-Received: by 2002:a05:6512:ba1:b0:539:fd33:abd2 with SMTP id 2adb3069b0e04-53b348d6148mr6291979e87.25.1730287412407;
        Wed, 30 Oct 2024 04:23:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb838e351sm224601e87.99.2024.10.30.04.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:23:31 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:23:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Imran Shaik <quic_imrashai@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
Message-ID: <ixnqjfb6l7cz4qp23zevtbwws72rjo25cfgvntyiauzdg2yisw@vr2t4qy4k6iq>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
 <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
 <0487791a-f31b-4427-b13b-b7ab6a80378b@quicinc.com>
 <ae61b485-d3af-4226-b2f8-e89ef5b4ed71@kernel.org>
 <fff416f9-4ea7-4117-87b0-986087f8e142@quicinc.com>
 <9bd4c63b-7c68-4e40-9995-9d569eed15b5@kernel.org>
 <f7551a7a-885c-4f74-8f74-10f1c0ebe6ad@quicinc.com>
 <46c19729-b31e-42e3-a6dd-6b43b27348d8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46c19729-b31e-42e3-a6dd-6b43b27348d8@kernel.org>

On Wed, Oct 30, 2024 at 08:30:59AM +0100, Krzysztof Kozlowski wrote:
> On 30/10/2024 07:59, Imran Shaik wrote:
> > 
> > 
> > On 10/29/2024 3:06 PM, Krzysztof Kozlowski wrote:
> >> On 29/10/2024 10:23, Imran Shaik wrote:
> >>>
> >>>
> >>> On 10/28/2024 12:35 PM, Krzysztof Kozlowski wrote:
> >>>> On 28/10/2024 06:15, Imran Shaik wrote:
> >>>>>
> >>>>>
> >>>>> On 10/26/2024 5:50 PM, Krzysztof Kozlowski wrote:
> >>>>>> On Thu, Oct 24, 2024 at 07:01:14PM +0530, Imran Shaik wrote:
> >>>>>>> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
> >>>>>>> QCS8300 has few additional clocks and minor differences. Hence, reuse
> >>>>>>> SA8775P gpucc bindings and add additional clocks required for QCS8300.
> >>>>>>
> >>>>>> IIUC, these clocks are not valid for SA8775p. How do we deal with such
> >>>>>> cases for other Qualcomm SoCs?
> >>>>>>
> >>>>>
> >>>>> These newly added clocks are not applicable to SA8755P. In the
> >>>>> gpucc-sa8775p driver, these clocks are marked to NULL for the SA8755P,
> >>>>> ensuring they are not registered to the CCF.
> >>>>
> >>>> I meant bindings. And existing practice.
> >>>>
> >>>
> >>> In the bindings, the same approach is followed in other Qualcomm SoCs as
> >>> well, where additional clocks are added to the existing identical SoC’s
> >>> bindings.
> >>>
> >>> https://lore.kernel.org/r/20240818204348.197788-2-danila@jiaxyga.com
> >>
> >> Exactly, defines are very different, so no, it is not the same approach.
> >>
> > 
> > I believe the QCS8300 approach is same as that of SM8475. In the SM8475 
> > SoC, GPLL2 and GPLL3 are the additional clock bindings compared to the 
> > SM8450. Similarly, in the QCS8300, the GPU_CC_*_ACCU_SHIFT_CLK clock 
> > bindings are additional to the SA8775P.
> > 
> > We are also following this approach across all SoCs in the downstream 
> > msm-kernel as well.
> > 
> > Please let me know if I am missing anything here.
> 
> Not sure, please take the same approach as SM8475, not a different one.

Just for my understanding, are you proposing to prefix the
platform-specific defines with platform name (like it was done for
SM8475)?

-- 
With best wishes
Dmitry
